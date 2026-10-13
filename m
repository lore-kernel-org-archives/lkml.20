Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC1664EBAE6
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 23:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791935631; cv=none; b=Xx+7W3qWr4wV+iR7oC2BqMIuLADOoVXyGF3ltUPB7Vg7jvBEqt1v7V1ChajFn+cpiqp1MsD4fmsQAVFRAXvRIWePOW+dQy+UZdmIc+MckIwjI1kda0hIWtXSp6IEDK3tfVU8NyZRi5IwhaskdUqMdI9qpAba4mDfWJ0v4PBw280=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791935631; c=relaxed/simple;
	bh=8t/CZtcD2UDRis6ElxpuQTCnGFRZydah4tW3kas/HT8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OtQwXTNJkwLiF5I/LN42BqiPkXXnkPnxYmrW0AmT9vkj2EaP5SbK71Ts8w/EorT3OvWMamUBNpC0tmBnKv+j34t/byHpVecyyx1Ih7F8sLts2Q9kEL/9wgA1SDUfYRWXJ2XOjuUYFyqmjc5vnpy8idoebrQO56MksGgjgw/TPwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ct3VQvyD; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ct3VQvyD"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-35c76e9614aso1483875eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 16:53:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791935629; x=1792540429; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TgjzkiHyd5GOcR1gXfvNcSQQu/ffNPe83SfrCAvR204=;
        b=ct3VQvyDr51QdjF4N3RMP4dhd0HNoBN03GPB8RfEbZ1dnKAZrJP24ZWjQt/7NEprSH
         gxiq7X78FwMTLXc/TUV4q6eSq7q0AyKFF5L+I9VK2+mJwC5bir6TXZCvdnICibN/tB8+
         WL4q9uHaC3ZzZmG8igqb2QXJw3/0WnfBB6OxOZD5zRJamD8brRSRU+69TDMpyyyeOtrm
         jgX/VjMCqUHfUwItMTXinHMTKrCG93ZbG30is5OepZ22+27EeJrk0sI9XJaC+l9ckwcQ
         dw3xxHMcoJXCRFIK/M3ex2dzJ9R9/+en750GqKUXmypQcs7bsK8eChNOb08KH6MhJFHa
         FWKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791935629; x=1792540429;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TgjzkiHyd5GOcR1gXfvNcSQQu/ffNPe83SfrCAvR204=;
        b=O0ySMTFL2ncbQkTklr0ufj/TueA2+bRJ/lB9knoRq+AqeP+75ETo6ftBgej82NIpJs
         W5zPEoQS5sf3bVYOZ7PzMfkM929MCU9sLrH+1U1uPTF9dk+UdSTse1nDkEBYnXcdcM39
         LZizrcN7K0peAkj3pydG4s8twnkiPr+a20Kepdwx8TKQZ3m77BEmCeleZ5ngb6zKXbzA
         0mcOGMabWvFa00LeOYJdZT7W+CPA+PB6q9hNiW6F02XwYrVC3i/swZZ4UgqT7EvTt8Vo
         nULeEY0pyLFb+WA6UGOLqLa3yUQhmPKqHzSoEYnFeWiD2s/iagn0UflSk6bkUoOY9Jh6
         W7EQ==
X-Forwarded-Encrypted: i=1; AKwUvBweOqNJ2EsVFsQ0ooQyc/VSY5MDPX+RfjEc/fig8otwzmx2BwdWTBZ41/5GJQgUoolgUuPLTAGI9NA6xAY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKvJbAeVPw0S5YCAU7KoveOcJZN0vlH20aOWuyrVwjPD9rx/kBD
	TH+csv+7ir02xpb6A/vetIODYvXvnjwqhesbUUFGrBFFlgkFgZLhDZBN
X-Gm-Gg: AYBFou1X4N2ivi1ji2oTvwsaqowv1A1l4bKUAR7BoiwSmmRhZsy++ko8LIqkVpPjLhZ
	3+dWySNyS6OR7DBp0iRLGriJtVKkqi3qbs/Fx5Q/lpF5WkfQACFuqjQYd0XNMbxKAy3nUIWBLZT
	4h2o7cANZzW/Fso5Kdx8n6ByVsrQZeCh7QIAtiO1ofiQLJTTpypgP9g6CeV9sBZN/OuM5NisSKZ
	HhV3wjMeEzTlBxI63zMI3xh8Cx9o0408raKjz8yz9dGIHK41eeBv4yO0Tnh87NvdXFYLAbs8Djt
	28uUC177xVIknYsAfd36otf5Kf3OqMJnHevO5mfa0j6qK5b7v9Jat0NM6MYwK+240XH5xlGET64
	ouB0+oj7wBFl0B0VnZYDYAcZWTLuzPLbpjXKOpcoRkTUTLKpm8w6dXzkdD/ZY1d+9rGtRdEPmRt
	uyi+11w4JiXlzWviqed42uNwvLAGxQ0s50Qo2Vmgt2LFPQTpH4EiQ26Rv60hxvO027ZVmeOOAY+
	nHcfdy6Xf7rFSD/3Dp8So12t+gwpMs7smZzJ/eH
X-Received: by 2002:a05:7301:2809:b0:351:202c:c7a5 with SMTP id 5a478bee46e88-3537dba640dmr19039688eec.0.1791935628772;
        Tue, 13 Oct 2026 16:53:48 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:875a:117f:b9ea:5a08])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cb2954bsm48201384eec.26.2026.10.13.16.53.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 16:53:48 -0700 (PDT)
Date: Tue, 13 Oct 2026 16:53:45 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Jason Gerecke <killertofu@gmail.com>
Cc: linux-input@vger.kernel.org, Ping Cheng <ping.cheng@wacom.com>, 
	Jason Gerecke <jason.gerecke@wacom.com>, Peter Hutterer <peter.hutterer@who-t.net>, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] Input: wacom_w8001 - assign distinct phys paths to
 pen and touch devices
Message-ID: <as7D7idd-843CJkn@google.com>
References: <20261009190746.803607-1-dmitry.torokhov@gmail.com>
 <20261009190746.803607-2-dmitry.torokhov@gmail.com>
 <CANRwn3RUdGyEOJEdN1xUjEHwnBX5-UnpZZ+ZBBwY9RBB04FtUQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANRwn3RUdGyEOJEdN1xUjEHwnBX5-UnpZZ+ZBBwY9RBB04FtUQ@mail.gmail.com>

On Tue, Oct 13, 2026 at 03:42:10PM -0700, Jason Gerecke wrote:
> On Fri, Oct 9, 2026 at 12:28 PM Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
> >
> > Previously, both pen and touch input devices used the same phys path
> > "%s/input0", which made it impossible for userspace or udev rules to
> > distinguish the devices by physical topology.
> >
> > Assign distinct phys paths by introducing separate buffers pen_phys
> > ("%s/input0") and touch_phys ("%s/input1") in struct w8001. Pass the
> > corresponding phys path to w8001_allocate_device() during pen and touch
> > setup, and drop the shared phys buffer from struct w8001.
> >
> > Fixes: e0361b70175f ("Input: wacom_w8001 - split the touch and pen devices into two devices")
> 
> Does this really deserve a "Fixes" tag? This does not seem to be as
> much of a "bug" as it is a limitation. Userspace and udev rules are
> (currently) able to reliably distinguish the devices by name.

It is a bug as far as input subsystem is concerned and it was introduced
in the above referenced commit, so it has this tag.

> Obviously that's not ideal, but I don't see much benefit to this patch
> getting backported to the stable trees -- especially when /existing/
> udev rules aren't necessarily going to know what to do with this new
> "input1" phys.

Right. For input subsystem only commits that are explicitly marked
as Cc: stable@ will be backported to stable trees, so it shoudl not be
a concern.

Thanks.

-- 
Dmitry
