Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793810797;
	b=37hG3d/xaga051Mvb427/jq52J8gWnirBzsVsl0F+e3aYOqA7kE/9wdV1+Gvb3VSWyTd
	 IwWQmmwgHwEzmVuXQyBv/MyOv4nvx1hGbalJyd9Y1XK826rUlsT2buLjEDoGb/KLF02AM
	 X/kcm2mkjG4hF/goUDaY9GhWxM7EZIGccaaUQliQDM0QBAFA4Lwsoo1/UYa+50bJjRVSH
	 1PFzYkvqjNVkykC0YAUw/AegrvWfv5PuENp22vm3oxQVaiUpF0UTFVPVnBBmwA93MY3Hj
	 YAUxDZniypYL9Vz/UZXGkk14aV9xxSt6sCMXElF1mSh3VorEfCipyy+s/k1uOeTZ1vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793810797;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=eAaKlrwhgxVSTJYKvS+Mu/JmjMNNY3TaQOKNMaH3oHI=;
	b=mZJYDO+k4vdW4+sGVpg3J9dPde93J1rP4CuvtTsBVeH6VwWrIEg1ydr+Q0OYe4EQ0pWB
	 oIcmRu35LDbltr/5bgA03Q4NXNkRcmFAcEkln2STe7pmSTaqVnQ6iXzBlU0Xcx5gG7iRJ
	 PmCQncsQUDCkPw7ZAL8uz7wm+2qao6dQNwy1JOdKjGu9kitgInnvFqedDpnA/7+L4WpjT
	 ntGRucZgh+0DlQWyAI1e4rGSSi996ZQqKfLvOh7hQ7/MGuYqmucIZQZoC9+eBQIuifTfE
	 26HBl4apy9C5TMJWSiz1wH1/l+fmsIY3ncsPTmyP6iHQCjtbuWZ8GE7blMgz01k11Eg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=JV7jvcyh;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35AEA606A331
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 16:46:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35AEA606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=JV7jvcyh
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1b1ce85287aso835599c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 08:46:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793810796; x=1794415596; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eAaKlrwhgxVSTJYKvS+Mu/JmjMNNY3TaQOKNMaH3oHI=;
        b=JV7jvcyhDzFZgOzyiXMsrrE96csI3o5reJpHhY1rZC3R+/mUnsqjvCmXEjOL3OVxrJ
         JkdmZ7gnsvz/rc1SGznFGm489hIxWfufBaTe+g/2UZU6OFp6XAoftty8q01wNHobQd8X
         wch1oNFN1YQPF6MTpQuBWXmoCzX1jPassCZJs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793810796; x=1794415596;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eAaKlrwhgxVSTJYKvS+Mu/JmjMNNY3TaQOKNMaH3oHI=;
        b=0mzitDU1xhHw1FxdgVvrwa3bitebyCgOSHxHdbj0Qrsqlf4O3+m7QpcVAZV4hI5WuM
         Eqht1+6EhbGlHD0LQl1biz3yUsL08kSF3vU7yPfBV3dOlZTQNHOEbwd5WH6gnkfO1M4R
         Rlt6B1Omy0HPACGapE1XHLzTGIZTu6d9BBx23OMYBhLEDU/1xYkR3HmmGFRGk4qzC1Ds
         76fCIvX7rga0w8EGuOmGMTuGzVb18RgA4BhaRV98ojBW6JI1laKJ7OhkHLTIMNmskmov
         elp6r8Mu0USHkt5/blO9pqq27Xb/xFI5lf3bnheaRU1/qNsFepe0rzvK8mqOdfdu6Yqz
         Aygw==
X-Forwarded-Encrypted: i=1; AKwUvBxtXjQYp1DAgnNE/45yXWQ2ykypQX4yfkfr00lJIEKlnDsSZdyaintrrNH8It19juOtTXkaQCX0xwrDESE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+WAw0HwfIlG/soeIYtzqoHTws7X40ZF1IUgtvOYnSljqWzrDTO
	b/Ia6YRndR4MDLgWx0/+/g6Dd97AhBMdoCMJUb6HMi/V84F5qSKs+nYSS9esoOPqBQ==
X-Gm-Gg: AYBFou2GE3cZI6ZEjewkmJBUs6iob3t+rC7fZqb66YJDZ2LSRjUurBiz+x0HhCSHLDh
	xyIMwkfKGwTTl1ulhpE6s7icly5IZrKixWQUdvmq1n2/c1he75xAM2d9UdsjxkNEX6w5BpikhGl
	ndNVwhcqxUEvBcV3KCYepvBjeoYfHK6Gx6qFfkJC60ZQRFGIP7EExB88+u6/yVdZKKb1cjiyRHT
	qgrkKOan7StgeE1IAj8NDN8o6nCB17+7HSW8/ZegFPm4nz+SyfzBXpdvrAbjeIeHpzatuM55nd9
	Gy35/M+PdD0LfJ4t5pDLYucnjIDwk7Shvj+TyElLpFV9f0keq4s83I9Vk2X/RGKB85O0RE70yT+
	fGBEO/859AgXyTC3YN1/kBdHxw+zIBU58qvWuVsvDv3IeNKbp3pjMJwJjvZfCBaiNriQ4mnOLw2
	QEFCrxO9BWq0a8wDARSk97PV13jeDW8sL3mT3v4hRVch1484++dh4z0qBmK19M6V+aJX0v/JTZk
	f71m9wLgg+b/Cjcwg+Ikk/nfjXGCFIiOKGX1zo5XZhoivwTbCGXkBaByDMSZAKnLrWvq1HlDA1j
	XcqWkwuZCsz6heGG/0trUVnLi2Z1hlBoGShQO6OTC/zS8oCNT5+EX2x7M0yVoMlgWjg=
X-Received: by 2002:a05:701b:42c3:20b0:1b2:366a:e7d1 with SMTP id a92af1059eb24-1b2366ae854mr11976510c88.32.1793810795926;
        Wed, 04 Nov 2026 08:46:35 -0800 (PST)
Received: from localhost ([2a00:79e0:2e7c:8:ab71:b3df:693a:fbf2])
        by smtp.gmail.com with UTF8SMTPSA id a92af1059eb24-1b245c2de58sm8522268c88.12.2026.11.04.08.46.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 08:46:35 -0800 (PST)
Date: Wed, 4 Nov 2026 08:46:33 -0800
From: Brian Norris <briannorris@chromium.org>
To: Stanley Jhu <stanleyjhu@google.com>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Praveen Talari <praveen.talari@oss.qualcomm.com>,
	Jonathan Corbet <corbet@lwn.net>, Mark Brown <broonie@kernel.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	Jens Axboe <axboe@kernel.dk>, Bart Van Assche <bvanassche@acm.org>,
	linux-pm@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-block@vger.kernel.org, linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] PM: runtime: Update runtime_pm.rst for non-fatal
 resume errors
Message-ID: <authaS5a_NrY-NLd@google.com>
References: <20261104151651.3035537-1-stanleyjhu@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261104151651.3035537-1-stanleyjhu@google.com>

On Wed, Nov 04, 2026 at 11:16:51PM +0800, Stanley Jhu wrote:
> Since commit eef1d74bf88f ("PM: runtime: Only set runtime_error on
> suspend callback failures"), rpm_callback() no longer sets
> dev->power.runtime_error when ->runtime_resume() returns an error.
> However, Documentation/power/runtime_pm.rst still states in both the
> resume callback rules and the ->runtime_idle() comparison that the PM
> core treats ->runtime_resume() errors as fatal device errors and blocks
> runtime PM helper functions until the status is manually reset.
> 
> Update the resume callback semantics bullet to state that on error the
> PM core resets the runtime PM status to 'suspended', returns the error
> code from synchronous resume helpers, and unlike with the suspend
> callback never treats resume failures as fatal, leaving the Section 4
> runtime PM helpers unblocked so a subsequent resume request can run
> ->runtime_resume() again. Also drop ->runtime_resume() from the
> ->runtime_idle() fatal-error comparison.
> 
> Fixes: eef1d74bf88f ("PM: runtime: Only set runtime_error on suspend callback failures")
> Fixes: aedc51762a0d ("PM: runtime: Clarify ->runtime_idle() callback return value handling")
> Signed-off-by: Stanley Jhu <stanleyjhu@google.com>

Reviewed-by: Brian Norris <briannorris@chromium.org>

Thanks for fixing this!
