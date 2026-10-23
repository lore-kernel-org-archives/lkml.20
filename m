Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792798664;
	b=gyPaiStRob7/IrpnQwQxHjvmoU2TApRASQZUGiZqv2ALXfO7MfTFHzB086nSIg6d0IXX
	 wx2LhULAIBi5jNLkr86+Rq/7bYFl3dFnfi7epyPDBp1nwAQKf3zu8vtbW7wqF2av9uIiL
	 BUw44rb9r+XZ7Bv9OOToO5kKS5z5v8ukLLUjkegpOM6svQVRfwrusFNLQC1S5PhR+eBrV
	 GztKotly9WpI4DHn8E5MXwHGFnl54ULxmANUFoQynzNMcBMBymxhYsRSlGomTzPWRFczy
	 Aa+l0BS53VtFHn9W4vI+u/umK9HrUFRUqJnHAs0rsjPKmqL9XTJP24XplBoBiBhvEDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792798664;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Mime-Version:Content-Transfer-Encoding:
	 Content-Type:Date:Message-Id:To:Cc:Subject:From:X-Mailer:References:
	 In-Reply-To:X-DetectorID-Processed;
	bh=iS0JVD+4MBOlIwUianlhvazrunPmJQvwkktgIZspJ6U=;
	b=aUXyeJxueUYgPNHoBfnJiQpnFhVsgm9NXMNxNswkiaNlKzd2w6oIEqTEsIzvLbEcoqgJ
	 aMuER0HXi18buG51rV0b8BpoOerNU+OsQk/4Vq2WTH7EcHVRdOFKraX8l1NP0e4g7QHpe
	 a9rrUh8g4G9h29uym1XsyYPlD5P0M5Rrkc0D9mP083DuOiOYZDOA8bI4fG9TKqfvKQZP0
	 konb01O/t9wLnkklhG14Ddd+T7TtgT4C3HgVI7TU/QhzpWlSa0okaxzvgvBGJZsEyJacc
	 yWIPR5fIn3y3CPlRrkekdHO6XvgOikizD1ttn11SQv0zCBd9v9CqaLYUyuTjOpdC8yw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=EirT0IiE;
	arc=none smtp.remote-ip=209.85.216.99
Received: from mail-pj1-f99.google.com (mail-pj1-f99.google.com [209.85.216.99])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B187606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 23:37:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B187606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=EirT0IiE
Received: by mail-pj1-f99.google.com with SMTP id 98e67ed59e1d1-3ac677668a9so1644416a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 16:37:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792798663; x=1793403463;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:dkim-signature
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=iS0JVD+4MBOlIwUianlhvazrunPmJQvwkktgIZspJ6U=;
        b=Tv/6ZqV5OiRwOXdY4dcWN/aR+GcQBt9erNgg4VkdzMy6fchaEad9BHGtvzR+Nteg1J
         Eeo6bvC6UNWVIxijaOsAA+N1bjT2IRiFwhJlE1wppBXZOQndnOFKLcv+l0bR+kHJo68J
         UkDxIZvNtuh8lNeYLvGSy9W+JHc56iH9R/3yzw6K0eCTD7U+tOvWqAWwUW0Ko/Jrj0Aw
         qdfaQ3YHfGDZwXkLmsjcb0XVsCoJZ+TcIdd55vzs0gsOQ3qOWTMsbQ8xEAsIFGPCsNzb
         rtARjzJvOGtS2K8vGSjf7ce5UfhBGHvtF6aFs12+lpg82DoL2lQWtKjMHGcr0fqPl9ON
         Uepw==
X-Forwarded-Encrypted: i=1; AKwUvBxFDtiZLJYDBDEF8/YJVNePRvdkQJp5xqGIETEeaLxqZEEsh1fWw3gq5Hx/fCGb2QGD5ACv5wEhaYzOQwk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKLQlsZzz9zWwmeIakhfHPRdvCLxAKu04GzSl8Mw09W7HMrpHF7
	yrAnhr/bD4sYDei9K9eo0LEGseh9GbjVWYx5KL8/QZZI77MeBpCBEsDwF8ELRspJ0+A7thQiHFU
	SfRYiIkLZwFjAJihmREV+dWplGhICzZgTywFqNbE7jz3rdvf5lcmwxH/T4z7w+1FdOzN7I4YXR/
	T/e1XVO228FQAYrua18xMDEBN3KnhoGfsBrfRgQbVNZ4oLD4sWJnR0kHpm7MPXQE9jHCrjr96LK
	CxIbypUfNYAiGL10ccxRF+9
X-Gm-Gg: AYBFou2K5IuHUI+W20KC6+G3dZG7f2c0if2ugJTTUGsEoZE331DfcRqy49fU4KHhnOT
	C69JIzD4RA1v+77DvEfZ3ob0TvG8Z9vPU1/mNN13xnTMuL64lL3oF0GLwSY1v/GuG9PO36alm28
	BU5xaH5qBQlMhMO527VZ/MZHre/K8I1G6ykl8bsZco+qx45Q80EqtDYmjuLu2WYpUpV03+z1xZn
	WD+0rK+kxa01FaBiznx5q433QwMdBq5vXGUt+i8ktcDhikEAziJlny2t0+3ZOs9vFfnSB1wl8oP
	/Mck9bvzZbi1QtWVPPsCW4DMrUa+AgCSVEy5eYFJ4DsYwwguf5wy8XExVxk4G227Bx+lZ5J66D2
	esVndPYcxotmzGQE6etxXJ3fEnkHr+/JB3BdH+gsqEEjOJw/1tHdyPhMtDPSYb/X7SsLIFa+J7q
	F0UT47c/338UySA3ycSPs6iWv+kyObtEpHGJhElq7Y
X-Received: by 2002:a17:90b:5210:b0:3ac:83c1:2c0 with SMTP id 98e67ed59e1d1-3adeafaeabdmr540109a91.64.1792798662651;
        Fri, 23 Oct 2026 16:37:42 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-23.dlp.protect.broadcom.com. [144.49.247.23])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3adebaddeddsm222791a91.2.2026.10.23.16.37.42
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 23 Oct 2026 16:37:42 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93c5ab5c136so226765985a.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 16:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1792798661; x=1793403461; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iS0JVD+4MBOlIwUianlhvazrunPmJQvwkktgIZspJ6U=;
        b=EirT0IiEb9ca6mDzEasUdI6t+xRROVZPkoGA1OuomFKgvOhdQ+uHWd+5kuXbEfU91P
         XqPWQdDwZfJgY9E5fpsrvprEtuwVWWz6ekjAUk+4ltPhJvifMfGrG3eoU6be04Trmsh4
         caAoWMD7qKN0rw4fquiEFnN9KnI68WNqINfbo=
X-Forwarded-Encrypted: i=1; AKwUvBwj/5MiY9xSuJrKYmqxU80kfYs2+Mtn9IlVcZkVsEbu+Z9wGLQwcfNiwmbXbuGyq+ySaeacEF0kBCGZgc0=@vger.kernel.org
X-Received: by 2002:a05:620a:4441:b0:93e:e1fd:b87f with SMTP id af79cd13be357-940ef9c9453mr86401085a.83.1792798661323;
        Fri, 23 Oct 2026 16:37:41 -0700 (PDT)
X-Received: by 2002:a05:620a:4441:b0:93e:e1fd:b87f with SMTP id af79cd13be357-940ef9c9453mr86399185a.83.1792798660844;
        Fri, 23 Oct 2026 16:37:40 -0700 (PDT)
Received: from localhost ([192.19.50.250])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-940f066a5bcsm37558085a.13.2026.10.23.16.37.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 16:37:40 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 23 Oct 2026 16:39:02 -0700
Message-Id: <DMCM449DWDHV.1U5UYOS65HWUW@broadcom.com>
To: "fausten" <yunfeng.li.nb@gmail.com>, "Zack Rusin"
 <zack.rusin@broadcom.com>
Cc: <dri-devel@lists.freedesktop.org>,
 <bcm-kernel-feedback-list@broadcom.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4] drm/vmwgfx: Treat zero SVGA_REG_CURSOR_MAX_DIMENSION
 as unset
From: "Maaz Mombasawala <maaz.mombasawala@broadcom.com>"
 <maaz.mombasawala@broadcom.com>
X-Mailer: aerc 0.17.0
References: <e84774ae-b49d-4df5-923d-ae2cde480aaf@broadcom.com>
 <20261023090121.5031-1-fausten@ebizmis.com>
In-Reply-To: <20261023090121.5031-1-fausten@ebizmis.com>
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Hi fausten,

Sorry for not following up on this patch, I did not get time to do so.
Will get back to it shortly.

--=20
Maaz Mombasawala <maaz.mombasawala@broadcom.com>=20

