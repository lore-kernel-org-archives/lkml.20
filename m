Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 376A145A2B2
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 22:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792102418; cv=pass; b=GGKS96NsC8G+NyIJZx2NVp55IyRbEqK8v7nwzIW8NLiDdHQ3QQvcef/nq0/gX0pR8J3DC8mSPhGsnwayr0/AxL+qHDpJ00pt1cWQl9HYuzWZRoESlXVGdWC8uDAUHVRc2zBFDX/bCpJbnZgDdC7OVZczkpbrW37dE3xZtgr5d+k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792102418; c=relaxed/simple;
	bh=4nrscWDYrCIe6LptEZSYFJFZoOIWJEK4Zczba4H353s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SykGf1gYwIPMk2JN8UcBQdpos8uoabfPs/iHUgjb5EWu3Kpn75yVKBcxxg/8FWkDGqcqRmIWbM5xeKB+uorznPYXp8KPtLPEqg+HblZBEasUHugVaCCz36mAmxFbrurKpw2KgfYgPuBeueCOjFlVo2seCQP27peSRFDQ+KhxjrE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=tototo.si; spf=pass smtp.mailfrom=markina.si; dkim=pass (2048-bit key) header.d=tototo.si header.i=@tototo.si header.b=B4EjO+F3; arc=pass smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=tototo.si
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=markina.si
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tototo.si header.i=@tototo.si header.b="B4EjO+F3"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-93e635220b9so405724585a.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 15:13:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792102409; cv=none;
        d=google.com; s=arc-20260327;
        b=Qwj27cIpocIvw+7PT8dWa0obxml+1WaGqrpBD5YT7d6yAtm5tuuUtDAN81bvW8VYhn
         TlD3DBM+Jn1l+jO1+XOGKHnDKiolle8StCTDHNBReOaY1HAclz1sjtzBmlBKylh1qC1t
         jP+U7P90v/cizeSnsUQXAyRpWfWhqrOULRC9czVPrHdjR2hbCBR/xaNOvaIBP4dpars+
         +cgq/m63CfjYoVdPaUNV62BM98wesE+H4L8AUQAb8qFqlGOuCvYSLyZC/Co7iwn3lUSp
         nqgcJ8jfkj8ubJgDWS7VkW0rOiNlBmVZImDhSk+nu8EThKYDrKqDGRvMQiyJ+ymR0GiM
         uqrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=JqYDkfoISzLBDwQQXR6LTyNMTE+33UYdnZftkKh0VAI=;
        fh=FpWk/DLqYHLaNleV0/0ZR4rV7ykXykcHlZs7eZWFtoI=;
        b=rhH9Rk/APywKBi23CC6si/8UB7A9sZAIdo5QEeRABf4WK6TusgGIniT9urIl5+/M5J
         kDX9eR1QpFIFQbrg4EE9SoYF7YulmpM9gFswKqjIhUpc23z6y/6DlKxYTWfXGEK4/Sj1
         819f2tIQfNcXzBjLWnor4rFlnLlV8qh7q2TsMrsPXAQueKVPCkG8STgsksMd3HeykBZv
         6VZhTXDFxLkwuNOd4HnVvGWAer1QWIQD1XFBY3j+xw0JX7mJEc4RfCSGcp6m/9rBqgvi
         BPdpOYHBig1qjj9DFQJLW9315Og1R2SV5T6kPNlbLbWVabEZimNCkbC/aM9Pbg2dkpTm
         X0Lw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tototo.si; s=acc; t=1792102409; x=1792707209; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JqYDkfoISzLBDwQQXR6LTyNMTE+33UYdnZftkKh0VAI=;
        b=B4EjO+F3RrP/pnjC5tDhSRkPmvw8xi1L3Erf3Vc3YJaIEybXP4tGJQfPBjhibd3kvh
         jYMYf3rg51NlX0z7MtbkoRehchGj30VEbPz1lF64q6xk7MAy4InaqvoUXfHp00VZDS5U
         NAVDeSfV9M2MU3a9dkA07B3naRVF3vHVGJYW1RALp8sb+QiqTTIS2QSZvt5m4Fj+7yt9
         d0SYIHseTKTyRetgJOQmhOHk1ZuKDCswAfRg0/S3Y18W9uuI/azujM3o1Dab+whgfYX9
         MMmBqqKnry73vLTJmGuHwgBNPpCvR4uq6jgLaiJTqCw8ZupNtWGEAEQSIOZ6ZfsAm8ac
         18bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792102409; x=1792707209;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JqYDkfoISzLBDwQQXR6LTyNMTE+33UYdnZftkKh0VAI=;
        b=yS6DTYIg++9vxwzPD9jlhJIdp4YixFuUJ4GGKxjRWMPRAmqEvPXuCttGhqi/A8yj4k
         eg7dFiF62VLk/aPU0/ErOfIrESXRPiDcaVixDk3J172lNyB0Q+G5Z7FaMHIDjjQz2kav
         5eR7yTxoCFN8Flb3P5/pmdC9s1+pZjblBFiuSvZUHozH9atsi3d7zl4BWFRWbib+QQvt
         mIkVJsG78qAkzLVYrWfTSZVsT9ZcHWOYJZdoygAW4owGXK18KqwnouXgFs9AsKkoJ6Ps
         6ZhMwUi5dUutVzXs1TBCXRjUMaPWFL4gQJtAHLVXWCr6d5FusJ2COMkRxnUig+ircg5c
         TZ5Q==
X-Forwarded-Encrypted: i=1; AKwUvBzp25VjLdLaz+5MYozs32l8xxCcNuXdSd5YXtpFwT5YbURSraS74W6az0h6A0bLrDYvvYr6HAkebiUBXFs=@vger.kernel.org
X-Gm-Message-State: AFq9FYJgqerS3frn1PP/ilkb5IAfuLsknh2Mv1bWlRZEWegbSyVZiGBb
	P12qG4+LHf3RcLl4PNnuY7dSsqV1QWOO2wVYIuhz5hx9BO/jqWRvfF49dMwXu5CWVSSzufYJzL/
	SfM5GVw7a/vMdpLfYgxQuhxpHCDetxRYCCKcs6cMcKQ==
X-Gm-Gg: AYBFou00wTy2KLQIJYvrUmY+vzV8WU4cru/v/Irj7T1SrYR6BbV235vhjlCAdbmUtmw
	J+feXFev+RjV8yt3Az27u2apP9wFQf88I2H+CNzJuQGaaOuFV+IUCwcZRqMEiH/E6Jv9Tcnncl8
	O15fcBo0ketNcMDOP/y0QQF8hAcEctRuCi4MBxGG4eK3YfZf4UK00DXp2yF+/exX93J+HT1I5Lf
	gP2Vd0hOWTMHo+vDKXzJIXRJjfi0Rj7mhR6NqQWJmRM0CESso5cdB8dpJcGObhGKS/U5QrEVpTI
	mN6a1CDYlYMt7r+ltL/VqwSQqY6eul9rOkRhRt2lRdJUW4DE2ifJ6omJy30OiVrAOs3VmuPK+/p
	4J0lkf+lu1Od/eaN9kiCvd9JFKcUoCDYet4iuwNhHdsfp
X-Received: by 2002:a05:620a:6301:20b0:93e:c12c:f123 with SMTP id
 af79cd13be357-93ec12d0765mr2319680685a.79.1792102409418; Thu, 15 Oct 2026
 15:13:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <586d0b39-40c8-4f3d-a786-c1085f87b858@linux.dev>
 <E1AEF567-3705-4AE7-B409-6E6D70C505AC@linux.dev> <atE25_ZrIQct41wt@wunner.de>
In-Reply-To: <atE25_ZrIQct41wt@wunner.de>
From: Vasilij <vasilij.kernel@tototo.si>
Date: Fri, 16 Oct 2026 00:13:18 +0200
X-Gm-Features: AclHuK9I0yDPNPLitjPqdTfv5HCtW4bWJD7j6t3Cj0jJn68j6aocr7GGsKF-5Uw
Message-ID: <CAC=+NRGqTxz33PZL9dLPfbFbQDNvxyp3PXBSEQEmkh_Vbave5A@mail.gmail.com>
Subject: Re: [PATCH v2] drm/appletbdrm: Add suspend and resume support
To: Lukas Wunner <lukas@wunner.de>
Cc: Aditya Garg <aditya.garg@linux.dev>, Aun-Ali Zaidi <admin@kodeit.net>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Kerem Karabay <kekrby@gmail.com>, Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 15, 2026 at 10:26:15PM +0200, Lukas Wunner wrote:
> I'd love to, but both v1 and v2 have sashiko findings that nobody bothered
> to debunk or fix.  (The fix for v1 consisted of removing a callback, which
> triggered other sashiko findings.)  I'm neither an expert on this driver
> nor the tiny drm library, but I'd like to help improve Linux Mac support.
> Please help me understand whether the sashiko findings are valid.

Thanks for looking at it, and sorry for leaving the findings
unanswered. I went through all of them; in short, the v1 finding and
the first two v2 findings are valid. v3 brings back reset_resume with
the error path fixed:
https://lore.kernel.org/all/20261015-appletbdrm-pm-v3-1-47377176619a@tototo.si/

v1, "memory leak of suspend_state on reset_resume error": valid. If
appletbdrm_get_information() or appletbdrm_signal_readiness() fails,
reset_resume returns before drm_mode_config_helper_resume(), so the
state saved by drm_mode_config_helper_suspend() is never put, and
fbdev/polling stay suspended. The USB core only logs a reset_resume
error and keeps the driver bound, so nothing else cleans it up. v3
logs the handshake error and still calls
drm_mode_config_helper_resume(), the same way udl and gm12u320 do it.

v2, "missing reset_resume breaks reset recovery": valid, and not only
in theory. v2 dropped reset_resume because the device was not reset
on resume, but with the current t2linux 7.2.11 kernel (which carries
v2) the Touch Bar is reset on every resume here (MacBookPro16,2, S3):

  usb 5-6: reset high-speed USB device number 7 using t2bce_core
  [drm] Initialized appletbdrm 1.0.0 for 5-6:2.1 on minor 2

Without reset_resume the USB core unbinds and probes the driver
again, tiny-dfr loses its device and the Touch Bar stays dark, which
is the bug the patch is meant to fix. With v1 (reset_resume doing the
probe handshake) on the same kernel the reset still happens, but the
driver is not probed again and the Touch Bar works after resume.

v2, "suspend_state leaked on unbind while suspended": with
reset_resume back, a reset no longer unbinds the driver, which was
the scenario sashiko described. What is left is the device going
away while the system sleeps: then disconnect runs without a resume
and the saved state is not freed. As far as I can see udl and
gm12u320 have the same gap, and drm_mode_config_cleanup() does not
free suspend_state either. v3 leaves it out; I can drop the saved
state in appletbdrm_disconnect() in a follow-up, or it could be fixed
once in the helpers if the DRM maintainers prefer that.

v3 is tested on the t2linux 7.2.11 kernel: 7 suspend/resume cycles,
the Touch Bar was reset on each resume, the driver was not probed
again, tiny-dfr kept running and the Touch Bar worked every time.
(I went through the findings with the help of an AI assistant,
Claude; the logs and tests are from my machine.)

Thanks,
Vasilij
