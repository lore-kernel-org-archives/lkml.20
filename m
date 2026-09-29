Received: from mail-dl2-f42.google.com (mail-dl2-f42.google.com [74.125.229.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EABEA4E535D
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 23:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790723590; cv=pass; b=smW+2hJnG/bDdOoMRlhMrCzhhuX0mx9lkTTPYra68hxxxxF72j+qmBsZiIAFt4LapWACA+sLVdomWPBVlzlPa6VQwbhdxdZM1Hq7tuhSlwMXzmcFq3HwGLk+QQ6kJx47jWqujUmzmLATTWcyrkMoHjtWrzaS/pvIaahQRpTSjHc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790723590; c=relaxed/simple;
	bh=MaUS+F0fKOr5e04hFxW3NiUiLFf0VyXmdyNTytVr2BY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AG7saBvSK6IPSdPSlOj8+wbk13lwQiUgBq95D/xRqUhOISnryx4vrd7U+/d2wWG1nM60N7hKCYxhL5FsWRyiycd6TQERT/vbyA8xRP7N0i4TEWvS66rCGmB/9hPVhWZH7BogMolHTxDH0DTShkKB8XPB1dOuGzOK6lVtk0Y+oHo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h5JVZJra; arc=pass smtp.client-ip=74.125.229.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h5JVZJra"
Received: by mail-dl2-f42.google.com with SMTP id a92af1059eb24-144f47a9b57so4257432c88.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 16:13:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790723585; cv=none;
        d=google.com; s=arc-20260327;
        b=hrLp0oNwfedqy9HE6GPiAq4hV2Cfz0UnPdN137b97KiU3zrYjTRZIHhWMh89qxztxM
         8UZnT8yqLKt6NF6bi43qeOUqYtNgFHRdHUkga/D1B0p0ZmVnc9OxD/24iqDUUpa786tg
         dMXw42jeJdtxu88BXBspYM9/L2MSa+9BCu3WGmP8EI1DivbeUC7agCc9AdmONisnZUzy
         msBcxFamB9vJ5ut/hq2o7XM5KBI1ZK6SfxscUc4OWua/dpe45j0ds4uP42CTEZvnxnOi
         ousC04H77LNFkHCgfyNjsiV8g1o7hosr7O/gaAJBCEbSsqig/ss3yvaro5rBa8UQ2Bma
         S7xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=MaUS+F0fKOr5e04hFxW3NiUiLFf0VyXmdyNTytVr2BY=;
        fh=nUj075vpZfNyXD4zWHiDi3rIy9vc1WkVYF/GwnUQ9nw=;
        b=MlJ5EXYgqEW7qOfHTWL2HE8X160ZThaQjf4/e7nXYx8dbnFUYfmvMgVktEl90bHg8/
         EPFXYNqQsitsX1pFYTJrOKKUtl0sB6S6OzvslaoiLNakzHVz4dwE+qytytICyp+xTaUq
         D0bFJGm3yi0rIUltr1ogvL1e+95MinnBJXfDlr8NXLS0D8sCUaTws8S11OW/q7A/x8cX
         zxqBwV+jXSAChHkUtMtXjdtE9pYf9lzsI3r9Hl+Zft7v0WeJq7oE9f6Hm6ySmZYQTBmT
         uKF47mTNWZ39hBbvPekO2xNJZSRuJXYv29toj5NdZu0h10fOJgLVydCvEZlQUNCW1zOR
         JGhw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790723585; x=1791328385; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MaUS+F0fKOr5e04hFxW3NiUiLFf0VyXmdyNTytVr2BY=;
        b=h5JVZJra0NXjN/IR922ol6FflVUo56jzzpCbGrig3DCL3Yk72ns/C0G2vLz1QRi885
         9lRTcxNmn2ENuLHEDDefEyEo7iw8xORpxFEW7zBKC3u2fmiNnXiKZo49ZUnGHLsDOoLl
         Mjz0svzPQtf2EL0ouFrDyysjE4Jie0IJJedi/xdWLIWUgEiPNayIBk2CBZdLGNZP7/Ns
         WWKLEPQMEbI0H+Xb4BOBq4Mc8KgWYzljv87xMybVciuVEAn8LsO/FsVEXgxuCdBrG4lX
         Z4wGesNfzfI+F1P64FeDUnDzy1ZJzgO2icMP6d3gKv2n5Mo6qZGHUa57owqUPVb3ZNlq
         shGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790723585; x=1791328385;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MaUS+F0fKOr5e04hFxW3NiUiLFf0VyXmdyNTytVr2BY=;
        b=wtlUuOtu4DDBZOdqYAu1dc/eDicZB93lh4Lmd3ndiHTon3UtKQ+sezm4+ORZ6yTTsD
         MDYrD6+2Eu5nwd5KEOIQ1QiewddRNXHq1C4GCvAe+B8SBdMBcCeqqjdGgorE/BR+bS1D
         LxeVGlYIuz7hQwoo/+QvSG6w0CbKUtSh5JyqUu0K+PMTfZ7Vo9Eaf4N5vAIZTtOG5gl9
         B+o3WGnB5ZzKH5OsTPwadI7+uKw4QPTu3RKm00D/v9wSG0ektdaHRYVWRbUl2nPmqtkM
         2ZvXEwTn7WRa6NAIX0/v7PYrVlyMlcNZeynLEO1F3mvL4g5yfB2Ri/B4CoLG1XpJDCXX
         eFTQ==
X-Forwarded-Encrypted: i=1; AKwUvBxoqq8Q/4Kyag5YJbQvvYCLH5a1mOA/BohYNTmSlnCridOpXYMPTed8Vn3Dzt75n9TxmuF/9y6H2SV8DIY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLUCfoVlwo9PbdiQAmMygWIP/riQDV/rsigGzIDyII3sZOFjqjH
	H77JGoY9JPqOlHO6wj3PhTc4kkOOsD15zr2HYADOFbyf104UVHK0UQLSb4DAWWksbJmCw2zrbme
	Zx9L/s/Kar5JR4KJKNCinIMnEwO3BL8E=
X-Gm-Gg: AYBFou3yob5zyZ8yML9pKSJLQmNkltHCCgME+JokHaDNpbFBoZd5k/51ph7bGovR/rb
	vKxbTc/MyvBCZIkKIcdD4ovtZlU2LRmaIruis7m+emjXqcP8endqVickWclUv99NcM5PMKPqP7F
	H3X4h3v7Yq08fKMjjnZBaCX+EWigTAnJBpJwhWIwAZdWP6u+7MK3Rxi/sq8pUvsl/SvNp3LZdVT
	HDFxqNMkaEq6siWK7cyFu1ejT3ntGEAkKZnVkFCMgqtXAtK467jwL5gfxGjJm76o16JcX6IutfC
	61s7Nrm0THHtNoRa/BbXAl2s48/tztXHilELElMVJapiVgztOg/RIGDntdLeMo5g8TFYG/5EPdQ
	ONw==
X-Received: by 2002:a05:7301:fc12:b0:341:a4ed:d910 with SMTP id
 5a478bee46e88-34c65c622cdmr858433eec.7.1790723584981; Tue, 29 Sep 2026
 16:13:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CA+2YD=Nxe25n8rmM-DS+w+Pg0N_YtOf_znJXNMi77SCwk3OUyw@mail.gmail.com>
 <20260925205706.GA697101@killaraus.ideasonboard.com>
In-Reply-To: <20260925205706.GA697101@killaraus.ideasonboard.com>
From: Perry Joyce <perrygjoyce97@gmail.com>
Date: Wed, 30 Sep 2026 00:12:53 +0100
X-Gm-Features: AclHuK-Ap3SxujRSf8OOSV3hnZak0aESAQpvapu2LboIUe41glhlpR1xU3QT6b0
Message-ID: <CA+2YD=P3pNVi=GJ1qoqnsgA56Hg_N6iT_AXGPDBHn9XToxh1KA@mail.gmail.com>
Subject: Re: uvcvideo: Logitech Brio 500 (046d:0943) needs UVC_QUIRK_PROBE_DEF
To: linux-media@vger.kernel.org
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, hansg@kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

Resending in plain text as requested.

I'm seeing a reproducible UVC probe error with a Logitech Brio 500 (046d:0943):

uvcvideo 1-3:1.0: Found UVC 1.00 device Brio 500 (046d:0943)
uvcvideo 1-3:1.1: Failed to set UVC probe control : -32 (exp. 26).

Kernel:

Linux archlinux 7.2.6-1-cachyos-bore #1 SMP PREEMPT_DYNAMIC Thu, 17
Sep 2026 07:33:37 +0000 x86_64 GNU/Linux

The webcam otherwise works normally.

Testing with UVC_QUIRK_PROBE_DEF fixes the initialization error:

modprobe -r uvcvideo

modprobe uvcvideo quirks=0x100

After loading the module with 0x100, the device initializes without
the probe-control error:

uvcvideo 1-3:1.0: Found UVC 1.00 device Brio 500 (046d:0943)
uvcvideo 1-3:1.0: Forcing device quirks to 0x100 by module parameter
for testing purpose.
uvcvideo 1-3:1.0: Please report required quirks to the linux-media mailing list.

I also tested this across a reboot with:

options uvcvideo quirks=0x100

and the probe error remains absent. Normal 1920x1080 MJPEG capture at
30 fps continues to work.

Device information:

idVendor=046d
idProduct=0943
bcdDevice=0.21
Product: Brio 500

Would it be appropriate to add UVC_QUIRK_PROBE_DEF for this device?

I'm happy to provide additional logs or test a patch if needed.

Kind regards,
Perry


On Fri, 25 Sept 2026 at 21:57, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hello Perry,
>
> Your original e-mail was sent as HTML, which gets silently rejected by
> the kernel mailing lists. Could you please resend it as plain text ?
>
> On Fri, Sep 25, 2026 at 09:31:42PM +0100, Perry Joyce wrote:
> > Hi,
> >
> > I'm seeing a reproducible UVC probe error with a Logitech Brio 500 (046d:0943):
> >
> > uvcvideo 1-3:1.0: Found UVC 1.00 device Brio 500 (046d:0943)
> > uvcvideo 1-3:1.1: Failed to set UVC probe control : -32 (exp. 26).
> >
> > Kernel:
> >
> > Linux archlinux 7.2.6-1-cachyos-bore #1 SMP PREEMPT_DYNAMIC Thu, 17 Sep 2026
> > 07:33:37 +0000 x86_64 GNU/Linux
> >
> > The webcam otherwise works normally.
> >
> > Testing with UVC_QUIRK_PROBE_DEF fixes the initialization error:
> >
> > # modprobe -r uvcvideo
> > # modprobe uvcvideo quirks=0x100
> >
> > After loading the module with 0x100, the device initializes without the
> > probe-control error:
> >
> > uvcvideo 1-3:1.0: Found UVC 1.00 device Brio 500 (046d:0943)
> > uvcvideo 1-3:1.0: Forcing device quirks to 0x100 by module parameter for
> > testing purpose.
> > uvcvideo 1-3:1.0: Please report required quirks to the linux-media mailing
> > list.
> >
> > I also tested this across a reboot with:
> >
> > options uvcvideo quirks=0x100
> >
> > and the probe error remains absent. Normal 1920x1080 MJPEG capture at 30 fps
> > continues to work.
> >
> > Device information:
> >
> > idVendor=046d
> > idProduct=0943
> > bcdDevice=0.21
> > Product: Brio 500
> >
> > Would it be appropriate to add UVC_QUIRK_PROBE_DEF for this device?
> >
> > I'm happy to provide additional logs or test a patch if needed.
> >
> >
> > Kind Regards,
> > Perry
>
> --
> Regards,
>
> Laurent Pinchart
