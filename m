Received: from mail-ej2-f43.google.com (mail-ej2-f43.google.com [74.125.228.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF9D73ED5C7
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 08:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790929495; cv=pass; b=XcyfsZdKSz891k2Sha6hK6ig8dMVEF2h9a5yew6NbRz9t3I1w6kX8i0WoQFWuGawO4uG2zs7IR1ufX6BOZvKYeqQkSithMX8ZltML94Nkt3PrWFte8XrcOAzpCm38RNPuhAAV2P9UIMLEMv5CpqEqfdCs5mJ5DwLG8wmFKkEIdA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790929495; c=relaxed/simple;
	bh=KlIxB3DMOBjHkj3qfvKkhWtQBR4BYmDHWWCcFBUyWG4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ehFWiH9Pn7mwCans4+DNT64MdPQ6pDNg32FtfWWbNQRk5on64gfFl+ZhDOGbP+QjcrkvmUMHFHbCTNRaILkg1bGUEorXXNd/NZAknUzw5l6JTdBqNtZzsem/O0TrBuik0ZBXte3EGjzlfP/VcBR/E4tX3morc2KT+ITwFCnLPCk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qMb9qYZS; arc=pass smtp.client-ip=74.125.228.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qMb9qYZS"
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c2e201b7189so453080066b.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 01:24:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790929492; cv=none;
        d=google.com; s=arc-20260327;
        b=pDjw81ThrIIHWmEOyKANsR19vSPakKB1GuR01ZysQY4dB8h2mzoFXf8XBLpeAr63mE
         SX4XgpZd5qGxt4hmpexV2S9X1q1K+hocIXXCvlB3DOkL824ee2wjdfVkmJrBsXuJlXSQ
         R2hcfGHnVhgtJyoxlYaU0xW8uBT4YZlend+PwvUcGMPiSsU26FofdR/0F+TsbyMhyATD
         Qmh5UsMyQFwavCaxUSH+6MxF4UvSiI6xuQJXGyLBHZp8FfCdfHIM7zvcQbttDxskVeQl
         MeGVpZCqjeXvKVtaDG9AT17H1i24lVDJHGwWxogdwtVmY8ni0Sif5I3RRzI3VMQMCJMF
         pTDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yLL38YXRs8v13bhjczR68f1fMy6oYgiP+2Rp4B5sHZs=;
        fh=DhvtIjBEuebC8VUJwjAjMOlUPx5vOLyHqHL+dCs78f0=;
        b=MbSOH6CXKNMF1agbquf1eEhzJ2bRelWUPSkLyD7kkZEUBBMggpAsCO8KYtVfoDdzeP
         2LYPV8GqNSyMhPIqigzu22zUX8dpuNbN+YxkG7E2Fn6/zcIKSJaBheezlJEJebpVE3u3
         zjmw8wIR5GADn+6W74AW8bcpRKcYdxKPNg6i6QqrXtik3BFxHQIB2CZ+jGQbFO0aFjtL
         5WDNQHsgyb4AKCpOJoeG/g2ZUx/0IXqr5j3AYD2RCBdeVLomOnVwJBfaeB3KMxN8S9co
         lPw5MCn6mVc/VsMygj1X/HJPg0QEto+uVhmuIsLgRnNDROR0fOB62NMneG3Wri3Gcbtj
         1QnQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790929492; x=1791534292; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yLL38YXRs8v13bhjczR68f1fMy6oYgiP+2Rp4B5sHZs=;
        b=qMb9qYZSGZD3eCVgCuGtNJ9jw9MZIG+tXv6pf0sgyxpk9BN6cpoOm1ZyovaxPXsyk8
         FHaUa0/wcqBJHbIj/XmwSUMdUj7FujAnFc70FSfRKvjDl6hFwRiEgEJCJT01M7zfJ6r6
         LnEJcHRGrr7Cz6zw1yMMXAwFhkgTtXTRbml/rRcdGrBGRBUqfnnCcR8VWfKBLgLSvLCJ
         +ATr0vHCQ36BIWph/SNmqwlOBG8/11GJVbuxBcMadqa1SY5nbCbUb6Hty+hbytDw7SDK
         b6kVskrXHQYGxZ4XirnDkKcsiQkshUanQTCbA6hntjfErJOx8FJxe9DkRpuI2IhKU1ij
         m59g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790929492; x=1791534292;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yLL38YXRs8v13bhjczR68f1fMy6oYgiP+2Rp4B5sHZs=;
        b=PCaCObSz5EEAp7avdwxGswxtwW6vGdV3KEkjlrZ18RuDbLM8V72tSpQG0N+9jcKmOo
         AC1cUZy9fx0a+goDcmod8kqYXeaVKI14S4cK2DrgqoD1BG+jbeKgRiQJ/opWpu/8YGWS
         eONspfRq/I3LhlmhNDsWCDxoDtRdATZXfB1l0wQyal9ZzuZPPJkL5ZcpdVlWbRVR7loa
         7Dqv1JWd2+sEk4/oCTvTzmgdCDmHM3MMQtlP8XVHWpVUV8ECvrfAYkYf92STkBNWrv7M
         Ecx8E4d+8iFSCZI+QhL18O+MHpYIvHHch8rIDAxU8yuooroTGYyVdlwUF7vmUX/VtKtX
         +0eg==
X-Forwarded-Encrypted: i=1; AKwUvBzf8887N8Gp+tXrqZTa1YUE2qxKTostEf4vUgKkt83m3KE50ZDWQXGI/vNxjxzcCN6HEcy3nN1LGbVfEhk=@vger.kernel.org
X-Gm-Message-State: AFuF++kRk2I0Zrbsg3W2crxrUceKtBDH228T4IXhGzVBxlEmf4gN/u3T
	qpUvdXxCDU5MCUdQe/Je5mbCQntd++Idlvw6umu71o7Sshx+2Klytr1pQbkonSsoqAulRGXMIxR
	4+TVjhEvtZ7ItVxPRPw4WJ2G4Ub2uGNk=
X-Gm-Gg: AYBFou27MUt7TxF1TdZ1icSmR4V+8/f1Nj6hqDoFf5i39yGr+6fZoA+uE/Kq4obF2T6
	auGHrijh8XAfbNowfo9/k2Jt0Qe6AHexx1o7xT7r/++qNMwZRQhVE6jsyX7QtWP2XatXM0iH8Ys
	PW2ANsMEOBC/UfZ9nvDH+ZOmTpVfGe4P0pyJYv1UXj3XqHvKCa9rbX8PKiIWn/gXSX/2rw+IOcs
	VFLb8yXfYaWVzJlUAvUK6w2BF32GCftW6KflpSmpfCf54HLdmd7LqtnS+dglDTyVvrlqhkFfGqQ
	nOHmAhFPdGMoyRKgSD571aAOdoAPtyX9ja3F6xQQWhK4LCEOStSi0sZFZCEdkPbpiQY2aiwi1C6
	KYhGuyGvmNR9V6Bd0jSOvBVthlGxbboS4JlzS84XC48hW8OF3sfaOA1mwkY89jX19CCFr2k8GzW
	0J3ZMShn99kv5W0tt1iQ0erTgtIEaGaIkq4m7jCwhi
X-Received: by 2002:a17:907:1c98:b0:c2e:3152:6a78 with SMTP id
 a640c23a62f3a-c2e4ad7918emr175853666b.15.1790929491855; Fri, 02 Oct 2026
 01:24:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAO7O_xi61=0kUtYkYFKonaSEJRC_KiXKvgMLSwRbnDTVfmQsPg@mail.gmail.com>
In-Reply-To: <CAO7O_xi61=0kUtYkYFKonaSEJRC_KiXKvgMLSwRbnDTVfmQsPg@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 2 Oct 2026 11:24:14 +0300
X-Gm-Features: AclHuK-EFQV5WhAXMWIxmr7qjCCaiLixTX8idKJX50cwoXk48nStXfS5xiZzZ-Q
Message-ID: <CAHp75VdRtMuSeS=39SXmLre=XKF11USi7w2HOGGwxP0+qBmPvg@mail.gmail.com>
Subject: Re: [PATCH v8 00/15] media: Add Lenovo Yoga Book camera support
To: mauriziocasciano7@gmail.com
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Bingbu Cao <bingbu.cao@amd.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Nicholas Roth <nicholas@rothemail.net>, 
	Dan Scally <dan.scally@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 2, 2026 at 11:16=E2=80=AFAM <mauriziocasciano7@gmail.com> wrote=
:
>
> Add camera support for the Lenovo Yoga Book YB1-X91L. The tablet uses
> an AtomISP ISP2401 with an OV2740 front sensor, an OV8858 rear sensor
> and a WV517S rear-camera lens actuator.
>
> The series adds the missing ACPI and bridge configuration, selects the
> OV2740 link frequency through the existing IPU PCI-ID mechanism, derives
> AtomISP CSI-2 timing from the sensor link frequency, enables raw Bayer
> capture and adds the sensor controls and actuator driver needed by the
> hardware.
>
> Runtime validation used the same 15-patch content on the current
> media_stage.git master. The final media-committers.git next rebase change=
s
> only three source line wraps needed by the media 80-column check:
>
> - W=3D1 builds and sparse builds of all eight affected objects passed bot=
h
>   before and after the rebase.
> - A full x86_64 Debian binary package build passed and produced kernel
>   7.3.0-rc1-yogabook-media-v8-20261002-001605.
> - The kernel booted on a Lenovo Yoga Book YB1-X91L with AtomISP PCI ID
>   8086:22b8. OV2740 negotiated 288 MHz and OV8858 negotiated 360 MHz;
>   both sensors bound and AtomISP registered two cameras.
> - OV8858 digital, red and blue gains were changed during streaming and
>   read back correctly. Continuous raw capture produced changing frames
>   from both sensors (6/8 unique rear samples and 8/8 unique front
>   samples), including front-to-rear-to-front switching without OV8858,
>   I2C or CSI errors.
> - Both front and rear cameras were also exercised successfully with
>   Cheese.
> - v4l2-compliance 1.32.0 completed 47 tests on the AtomISP capture node:
>   40 succeeded and 7 failed in invalid-ioctl, multiple-open, input,
>   control enumeration, stream-parameter and buffer tests. These failures
>   remain a validation limitation; this series does not claim to make the
>   staging AtomISP driver fully compliant.
>
> Only the Yoga Book 19.2 MHz OV8858 path was hardware-tested; the existing
> 24 MHz paths received build and static-analysis coverage but were not
> tested on separate hardware.
>
> ---
> Changes in v8:

You haven't even read what you sent, right?
Your series is mangled (has a garbage), please, *always* read and test
what you are sending before actually click the "send" button!

--=20
With Best Regards,
Andy Shevchenko
