Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A3794EBAF8
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 16:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792168771; cv=pass; b=ucbokzN6u+TpUpSGBvsj9IWFcS8J6MEFzc6vs4GAUNCr4vDHIC5/jkMypxnXXiQh0kVCPPTiEUFjAUUa2eRE7e/Bw2YYDewPreoxWNWdCT09bZPoD5CnQigjHjhvkwmj+Ga5kD9PpoCLFjPjyKi6ihGvj934RU1UhL2I7qTyC2I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792168771; c=relaxed/simple;
	bh=GYZa+WYjfY4q7qD6twJL6utNn4fuZ9ttx5FDCieufDQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JIaSH6jTyKo3hD0Koh6Sq7BllxzkInmFy0zP7PhaPYNgPehLVnGd4/KPcyrWa0TDZp5yVEQYcatAwaAzSYFPvncWL1NBCY09WogvFIp++fsyfVdCN7fIWCviMup6LD7fmujEHpid2M2h8gEybuCz+qSeQHJ0wWV0uAYEvgMmBQw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XBLiA8Xl; arc=pass smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XBLiA8Xl"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-93e515769d3so12184285a.3
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 09:39:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792168769; cv=none;
        d=google.com; s=arc-20260327;
        b=hNKzMD5Y4NKIh8B63DSVoVK/kWu/9b+ftnU6GHJmCw+7XemDW1QXLsBN1a3SGeyygz
         LYFJmUwwaj8sL6ZlpIcKYmVCcgviyVgF9jQc7cU4LpbbHbtHk+bH2PFdtcLya8bUBTWK
         c3SIHjRlvJzG3S/bFgaEyHdCKwbNFTb/7FmR//2E7HjgJPIA2kWeXlcWctmwm+DDKHFs
         jZ3oZHQBV0plyJ5v8wgNEp+VGvtYomg5R5HzfSihgk0tadzkwrm5xo1lyCa0D63gctEi
         OvpiTUwjOKMK3XOxwQ21LPo7NgQTmJMhkP6pKwOicbZ7L1V3oPUbmR4MTf6i/qFgOBf1
         fIuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AXnPIgMXiyBd1h2THh7HTsYWO/OramMboVGVD9BzIk8=;
        fh=dGPAqDQ7A0qlJTVb+kaTjpgtMCNB4je1wbMYpCDlmo4=;
        b=UcVQKsJBUHFexmrCdrFovaQQ8X9UNdZhs7fRNShtPbm7o2LZjcxFuPiNf7TwvLldT5
         JINgTHglrLt2jwQvbeensYHp4qnUK+THJDeUUC6XG0pHFnh+PJSjxrHPXAPXwD7HnIGV
         R/wbzZjvnKbXkq9Q4YnRKgPKnvMkf5Npg9j92i95TqnZUon/wG1cKvfygk6yfuOOyIis
         cZTBCFWluUosfVuJWsdtYhtnzryphLaedSDbEwI7nrmeiWdDlvMnh+ikE9NkAlrbyC6j
         zA7XiyOzZSld7lBmfvWN1sltxyXfM5E+Erci9vM4LKKfJAZUkYEXFkNc4B/h6bns4ohy
         zomw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792168769; x=1792773569; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AXnPIgMXiyBd1h2THh7HTsYWO/OramMboVGVD9BzIk8=;
        b=XBLiA8XliZKkW3zJdWaMAxNTsvlCGvsyWdTYwW3nIJCs0bCr+uBm2maybYrtvNkvfd
         3aCMqBRIqnCcYiPP0wQqXniUENZsyxZekOY5B0nWfDoWs0VSMwHJSeyMuEI8pyhimfB/
         jyz6OgCHUJGJU2O5Paq/q1AfrY2aeHFnSJLdikiB1x9XYAwOyS8ON1tYx/7ZKCrOwJaC
         9xNf0Q9RTptQd+UOAkPD1UKo2VRCoDIEBWQeNOpHMIGjotfBHpO3hrOqUpvp0ejpQag1
         TNWHUcmgIWujwMTYg43NP1AuLDIuR+I6LCSZRu8J7W3pkv96n5UmJ08+YDJbAXbjrzLr
         8HBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792168769; x=1792773569;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AXnPIgMXiyBd1h2THh7HTsYWO/OramMboVGVD9BzIk8=;
        b=xlcW9Z5SEr16ZnbkDeohkmk6+FI4ANRzyr/kvbR6ECYcDpjE/oOgvH60vUf7ElIZjR
         oQz93tGVm2dZq1FACYpF8G+O7MNglJ6+s0ndN203mLTlFTIN7By614gjUEADFv6gCL9q
         2CRGXDzVeeTEN4oVReY8u4YFrt1m7herOsOuxdKWjqgpJx3ctfIHCP100jcprrunt9sp
         Lo5iRqsCAWPNa2UX6IKBcUIb4VuBkrZv+P4Uw0yyf81NK+e3vpVYSRPTqcJwdotUqGwT
         UVAieC+qSLNqar8gUVSn6bE+VSIHGNTpBRSUOJgUyfL92cGTTuSg8YyBLFclDg++hoxl
         Q2Eg==
X-Forwarded-Encrypted: i=1; AKwUvByHGPFSZHDFcHsWs1YtKKvt8Yxqt77kiLH54cUyzZHQ8IdRMRycw8s54AM71oFEyxkdA0xdFBrgUp++OrU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ8EyKKRwqarCddo5Z5ptOnFBZ9FP162NrEV0BpsEIKiU5plduq
	8nlvLttpRF9vb4dCtH5B2CQtxQ/GqkVIW4Zj0SxfIhE7M94O+SuKKSakkfPOP31u0AKHMt9FXvc
	y/M8RsQTU8CU+fHrL54Y4+b7kVQ6B5lQ=
X-Gm-Gg: AYBFou0XrjekZzYVqotJ5IUirR0KKt6jMheJrIlR6VlYDuQw0h+786mQkc24rYxIzV5
	Bk/aoIcPl0yQhRsNYX1vB/qpFJ9CRnGBjD/xXIppi971xT4byrEh+Ykv525n18ontu/PGtfPwoK
	gqeNK1SJAB7vG621Mm4YytwPr7uliK5c83DdfZ69szvI+hsjJGB/qbgrlFI7u4M1p9eF9BOWWY4
	J0r9LFSlvRzvXO3vv1hshfn2cudHS3dccnjDJK0V2uupoCFUqYNKPNyWNCYLMNgT/lR74H6tY2y
	/bWHb2g2HZHa3ym50LgrMkRf4O98tApvdCxrtD94YYTnD6XXCZqct2k9KN0hRl4lBw==
X-Received: by 2002:a05:620a:258d:b0:93a:f9:614a with SMTP id
 af79cd13be357-93f29d3838cmr70178285a.34.1792168768959; Fri, 16 Oct 2026
 09:39:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261014233318.34567-1-heyheyco@gmail.com> <a0fb773d-dff3-46d0-9bc6-f408049ba12d@roeck-us.net>
In-Reply-To: <a0fb773d-dff3-46d0-9bc6-f408049ba12d@roeck-us.net>
From: Qian Xiao <heyheyco@gmail.com>
Date: Fri, 16 Oct 2026 09:38:51 -0700
X-Gm-Features: AclHuK_bv1MWXz6zynnaQJQy2jLr00--eLrquQDSSFo031ibxp4R7aAroGr5hV0
Message-ID: <CAFGXJCn6ODtgLtnCSgciVWCaXQCYHXbMfPKBCR+-XSjT31Do-Q@mail.gmail.com>
Subject: Re: [PATCH] hwmon: (asus_wmi_sensors) Drop misleading BIOS upgrade advice
To: Guenter Roeck <linux@roeck-us.net>
Cc: Ed Brindley <kernel@maidavale.org>, Denis Pauk <pauk.denis@gmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, linux-hwmon@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks, that makes sense. Sent v2:
https://lore.kernel.org/linux-hwmon/20261016163509.249020-1-heyheyco@gmail.=
com/

On Fri, Oct 16, 2026 at 9:09=E2=80=AFAM Guenter Roeck <linux@roeck-us.net> =
wrote:
>
> On 10/14/26 16:33, Qian Xiao wrote:
> > The Known Issues section suggests that upgrading to a BIOS with WMI
> > method version two or greater should rectify the problem. However, the
> > driver refuses to bind when the BIOS reports a version below two, so
> > every system using the driver already meets that condition and the
> > advice does not help.
> >
> > Remove the sentence. While at it, fix a typo in the preceding sentence.
> >
> > Link: https://lore.kernel.org/linux-hwmon/CAFGXJCm6ZWK0NsFhZ1_ycgYtTTT3=
nhqj9mose60t+Rrry1aPvw@mail.gmail.com/
> > Signed-off-by: Qian Xiao <heyheyco@gmail.com>
> > ---
> > For context, the fan issue has continued to be reported with the in-tre=
e
> > driver (which implies method version >=3D 2), e.g.:
> > https://www.reddit.com/r/archlinux/comments/tunnvb/psa_if_youre_experie=
ncing_weird_fan_behaviour_on/
> > https://forums.unraid.net/topic/131340-semi-solved-611x612x-bug-system-=
fans-stopped-after-a-few-hours-asus-mainboard-linux-517-driver-asus-wmi-dri=
ver-issue/
> >
>
> Then maybe the advice should be changed to "upgrading to a more recent BI=
OS
> version might help" instead of being dropped entirely.
>
> Guenter
>
>
> >   Documentation/hwmon/asus_wmi_sensors.rst | 4 +---
> >   1 file changed, 1 insertion(+), 3 deletions(-)
> >
> > diff --git a/Documentation/hwmon/asus_wmi_sensors.rst b/Documentation/h=
wmon/asus_wmi_sensors.rst
> > index 8f2096c..f6fa66f 100644
> > --- a/Documentation/hwmon/asus_wmi_sensors.rst
> > +++ b/Documentation/hwmon/asus_wmi_sensors.rst
> > @@ -72,7 +72,5 @@ Known Issues:
> >      X470 Pro seems particularly bad for this. The more frequently the =
WMI
> >      interface is polled the greater the potential for this to happen. =
Until you
> >      have subjected your computer to an extended soak test while pollin=
g the
> > -   sensors frequently, don't leave you computer unattended. Upgrading =
to new
> > -   BIOS version with method version greater than or equal to two shoul=
d
> > -   rectify the issue.
> > +   sensors frequently, don't leave your computer unattended.
> >    * A few boards report 12v voltages to be ~10v.
>
