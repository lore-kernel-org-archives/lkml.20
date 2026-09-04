Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97E574DF4D7
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 18:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788546031; cv=none; b=FyCavfDynQCGhAhNhjKbjWcmOrpQusAUFjyQ5My5Oi/lYN1QfErUoxbV0JgmfrZVVx6jrxV149WFIYfZbaGpFbZTcwXqjttT4FXPPbEAyIBG4A/HdZLk78ofmjF+IbKsN3PBQDwI7WkZ34ic3nNx3vc0/WTI77dTZblo4361bmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788546031; c=relaxed/simple;
	bh=byKejZtAl6q7TXNAGPeYbR4LCvKQMlBWPXFv0oHjhEA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hAV2qcfyrcMm6AJq43GhWyOCz78OYkF3oeLpjGQM5gHXwUV/mt4a7vb1xi0awsL+pX0VN83lDFHnVLXsplu5uFW6Fe58xYIJANw9rohpgK4jhM1yrRPCBN5nrGGjmLCxCMPOGSudGy8ET0iEuLFGhFiIW60nYYjcoszjdjh+Iak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mC3WL4+W; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mC3WL4+W"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cc1cc97b84bso1165074a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 11:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788546029; x=1789150829; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=byKejZtAl6q7TXNAGPeYbR4LCvKQMlBWPXFv0oHjhEA=;
        b=mC3WL4+WEbngGes0cuZkjNgSffbUd4hbsuivXCv2cxu4iL5dHXETt1uCkPWTIFD7YQ
         JtnYC9jDrcN0eOSP2NZdFRpbWtSD5U7bGm7lAoe3iNN349Bl8id3zcCQoxzFRsX8kr0t
         DSuNfUBZchNJzQSIWoPkc3HXI7r+suxEIcq7RZAnY5Kv3vGSytUcZx3vIzGu5KrAyNTs
         r1HqQXstoZGD3w271UG/ZzqG0IXVwiZmyuNcwDFZv8EZ+vpZd6LAdm38d3B/Msjxsdj2
         3Jl481p9dhzEySxqbPEUywoajCtkDR2pcnoEpeQgR1HR/H+JjNCU+7XWCxqAdyfAeNjv
         6L8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788546029; x=1789150829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=byKejZtAl6q7TXNAGPeYbR4LCvKQMlBWPXFv0oHjhEA=;
        b=rJcB22Wq5nsBc3RtDPnnUvlDgrDNuri0RoXS+K9HGeIdaiTEKlL8AkJRNgRyRjZsXU
         mi4ZH+GnkBCo6Q9RMWmpoYT7QoD7im76FDF0GbASka9BAoea8esSdK6egf9QqOhK3NXR
         0+kkEFF0kGzi5S9Iirt/gJPuS5z9D7UcYa5+qxgK1sHGUS6N5FdxZNAAHgVkLt2P4suP
         DJcUXvmRQ3bA7YUesgREFNgpbZhodUX/irWrmEQxlCdsQ5sH13UivMvSr/Dv4JC3fLI+
         HG83yPGjtlrzfF2XDF0EwT7Jc2HqS4g9Ps2iUlK3T2SCRoNTKV/R1NmINFLbUj7zMMvJ
         I+QA==
X-Forwarded-Encrypted: i=1; AKwUvBwSQm9KCPpAF9v+xRWxJ0L27NrzaJPMa9fL+pt1ucrQq5Q0yxcnLU7EctRy8Ydd1qybe7BBDF5DBuoz0RE=@vger.kernel.org
X-Gm-Message-State: AFuF++ldnfsE5ffGRqp8RYF9qucFEk5yjPCtO7Pl5Uxl1ScbyrlnyIi+
	2KhV9lZ0081rHAnXIJU9F3EChi7lZesXeZQ54tEzEUqQD9njXw9VBbkn
X-Gm-Gg: AYBFou3QMx5RrqvbO7plXFadeVrs/UChJpu0hormxtBAJszboRNbIq7njlmMeEbx6jX
	H9VTK/AUrOAuB/6XBxlj3aW0walrYTP/VGGLe1Ui4csXo8c7Be7jTJbxVvwfftqjwmyFmYooqOI
	yVBx+GgyBOn/SkXJo+3J7FOi3HaUePLenmzHPAx915KpRB5Cxgw/9GKVvTcGCWIHQOey+DcG8HR
	gpp8xchpd5HDt5NcUwbTBVmXeHnEelLWNE7FsgvEtqcGLs6WKNAL1j76eLKJrgZeD2NBH8+G5vN
	BVDFojuPMOzk6LsefzK6t4GX7UK28prMQ3oe85duMID1vUPnUW/enKqAg8KRv6KJD/W0aZPP7Aj
	rQZjW9WjubX/7nX2D5xZwfuiviDXGRFW4X8+8ETKyFKCYvtZ+mlenXN43mL4kbV3ipXQ3P0+pJG
	TYpG4lz4Uya1jPkpHEZXpIhvDiAfy88d1Exoy/kaI5ju7cfgpJAYH72p4tWQL0SMRJaA81PYAn+
	g==
X-Received: by 2002:a17:90a:d010:b0:38e:bbf1:de3f with SMTP id 98e67ed59e1d1-39b26272ef9mr13588885a91.12.1788546028788;
        Fri, 04 Sep 2026 11:20:28 -0700 (PDT)
Received: from localhost.localdomain ([2001:1960:1401:126c:876e:d154:517e:4c6f])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3342af0bc08sm6350509eec.17.2026.09.04.11.20.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 11:20:28 -0700 (PDT)
From: Hanh Kieu <hhkieu@gmail.com>
To: geraldogabriel@gmail.com,
	perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: usb-audio: add Pioneer DJ DDJ-SZ support
Date: Fri,  4 Sep 2026 11:20:23 -0700
Message-ID: <20260904182023.4486-1-hhkieu@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <CAEsQvcuaNZvLxyxNH_NOy5qwTmkrk-A9QdVtZD0GiCtPwk4A+A@mail.gmail.com>
References: <CAEsQvcuaNZvLxyxNH_NOy5qwTmkrk-A9QdVtZD0GiCtPwk4A+A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Geraldo Nascimento wrote:
> Are you sure is_pioneer_implicit_fb() isn't returning false and you're
> picking up on a generic sync ep instead?
>
> You should double-check that function is returning true or false because
> it will return false when USB_ENDPOINT_USAGE_IMPLICIT_FB isn't
> set on bmAttributes of a Isochronous IN EP.

Good catch, thanks -- I checked against the real device rather than
assuming.

lsusb -v on the DDJ-SZ shows both endpoints (0x01 OUT, 0x82 IN) as
Isochronous / Asynchronous with Usage Type = Data (bmAttributes = 0x05).
is_pioneer_implicit_fb() accepts the capture endpoint's usage being
either USB_ENDPOINT_USAGE_DATA or USB_ENDPOINT_USAGE_IMPLICIT_FB, not
IMPLICIT_FB exclusively, so Data usage does pass that check.

I also traced snd_usb_parse_implicit_fb_quirk()'s dispatch order for
this device to make sure nothing generic intercepts first: no fixed or
capture quirk-table entry matches 08e4:0191, it isn't UAC2
(bInterfaceClass is vendor-spec, not USB_CLASS_AUDIO), and it isn't the
Roland vendor ID. So is_pioneer_implicit_fb() is the function actually
being reached and returning true for this device, not a coincidental
generic fallback.

Happy to add a comment near the quirk-table entry noting the real
bmAttributes value if that would help future readers.

Thanks,
Hanh Kieu
