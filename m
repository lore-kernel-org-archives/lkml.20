Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793116059;
	b=pJbYvTpayQnFOMbAPaWw2mQMmkOpJXyzjpGGq3rZZBFxvigvrhS5L/pUiJuHyUzqtdp8
	 7QxtaOkeWlEFYSj42510Cm1IPI0mx8UzcRPr7Jw0FzdLW54BGCpZAmBMbjithidodv1BX
	 GHHgHR3tkdpXhm3K1PtoG7ZPFXRFE9ft6L3u8WPU5ShqH0ePfN38wDYQUbQ3tMLsCoxni
	 3uQe6qnPEYYEz/EKN+7FTNlLXZOEcheX04H/jr0dzUpNa/p9s82xrglF2AUXDsLhAKiE8
	 5UeNNar90I2AoveWd/Iloyn67tTHLYs+vQRrH755Aquw572xFF3SGuqTphj59jYWZfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793116059;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=0DswmWoXofnI9OqDL5xwhT8a7C+9NrwyAXFpDB+jHbw=;
	b=wdFRQmXBc8KbYW50Bi66jkscjPGDTHGYOnDVBg4bNRKhR5wgh6ABkUslLd4UBIBhxwTI
	 N4lq0JqxyNkldffv+1hcXdG0b6qXqD6kyr7ihEPJ55+NIMKW/RoKL0EFT6zn32npl5Jkw
	 pGioSMJyhfB27bSQ+HWIATnS4sLuqJIPNqVF/hm6qwe4gPSewjxE0FTzFAQSLlQ9MpztI
	 iJ8M+QOAy+cSRLGuhE7T6xzV+YRz9kNr7rHNW/VJ4NbFKSztd6SO3tPPZmVme06kzsTJ+
	 xz7hjulOVDArCJmQQRtM5VPCNa7wKcEAIrHv5YlsVj/jm3zc9UHgUJwLL4dETHYz+MA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wL6MI4s+;
	arc=none smtp.remote-ip=209.85.222.43
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C51060709F1
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 15:47:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C51060709F1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wL6MI4s+
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-9906a5410f5so912303241.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 08:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793116058; x=1793720858; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0DswmWoXofnI9OqDL5xwhT8a7C+9NrwyAXFpDB+jHbw=;
        b=wL6MI4s+mj6iZumr/hBUO4nDNtwWFMZolYyAB8VQpHY3486JGkmdiSnZlVuHswjdH8
         fr9VH1dtvaL4YSgJnc9zJHVFxD+3Aoyi7047feaTRDkmP7Wwcavr4RxYKOubGEkkjcjr
         5IFpVTY2nSVdHB9+UOE7yaXWlbFEBVN04kAMcpWuF5WkaMiXvjySc1Ljzhli8NSvkC7E
         4D9FdI3ZFPNHIykZjqqcBFAhGSPwIKto1yqwrK7djPuIdPWcpk6HbJ7FqazGAsTyCKdR
         jrcdRE/C1Dbd0/qLhpRmhpDR8i5yubkz2n1YniaoptK/uPkKys5mLfLlTGJc/xlpivHb
         E4dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793116058; x=1793720858;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0DswmWoXofnI9OqDL5xwhT8a7C+9NrwyAXFpDB+jHbw=;
        b=jJi+MQP4AFqTNeN+vFgbsMekL84RKJ9Ho6HHOP9iD9oI6CrQdDTwysB/miNgCi4qt2
         S+h6NDRss6PDNeksuroX6kO/POx9QWtiB2MABLFXxKCiBxvyL5yHC3Yl98+/ZMjJKTmx
         tbxLELpIE5SybiC+7BlPFO/oBkt67VNT4w8rRegKO5pgEtkA9gDE27MmtpY3wb959R8I
         5rXWjMoycglAiC8M/XZQfJDFX/JTkjDpm3OlVD5AJY4WpMxLL0f3pta+KjwOV2WhjLUj
         5WrmG0ZyHmwqwYeC/yywXGe1KSoEfUY2Hpsm1BbQbXFGmKu3FELGKGxedhKi31PSD9Vm
         36dg==
X-Forwarded-Encrypted: i=1; AKwUvBxN6XJLk9DwyMFHlMy5LvQOclGeKRHU9zr2dw4gp27owM9NOFoaCpxhFmkAGbYnQbQT02SD2mcPfRdwCvk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLO63Pdx1cKyd1sTbmv8+J2VMAgLzRp5093Ji0DbdkPdCnnvOTy
	ZJem5iyhAIc2SfSd7v6qjLKPmALErBOoguHlYu7wSB+kmF2AsvmdQCN0
X-Gm-Gg: AYBFou1Y7Ka9gbLRJTX6QLiIkKIdW4BCgFpMxVtXC9k+7MgTmrZX3gC970NTwpG09i+
	LCauO2DOvyO+4TV4OdsBVEI0rNquspdRd/2w3gOeEzmiEvzvNWPLbw7k7eMG24Y/uPNm38EFOy8
	gvwLzkMr8UP2bGf/GFeoNGOeSXBQKG66nDzs305VuBeF93KFm3aLfaFqRsVU2xQSxy3BVgfAoOb
	n/aTIQ1RCeXfvdWEOSQ+Gm3Q3QBnBOU35Mx7V1O4WsQI2W+31umAYFl/fFA0zyp6RJRPA0MZP2w
	qO7MUwtihSkjyX3IYKoMv4XAy+rJJSLK7vgcilrOutl1QM8AvOwP8YgKGJkg0++JGdH5bAAE2Ag
	hA+nnHXRQo6H9mFYDo9DmPliWj9Np/AmTyg8LKpu7xXA4b8Gw3Px+3/oWjJcbswOy+QoyIiYYw6
	Kp/YI/a5dpMdqzDyMpyRpBOvUp/t5s+24Lan58mag/GWcJa9zR6xwIS4CUKRA0mo187jUsksXlr
	GlSyj0laQILQ9f7VgwXOWwu1vnwpSvuy5hFjWCrzgB94UqcV5y8W30D7tIGjoGeOtZo9dyVWl6j
	uBSSnfAt6h72jOY=
X-Received: by 2002:a05:6102:390b:b0:7bb:64cc:1362 with SMTP id ada2fe7eead31-7cea1300c05mr1004091137.6.1793116058224;
        Tue, 27 Oct 2026 08:47:38 -0700 (PDT)
Received: from localhost.localdomain ([177.155.254.22])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7cea3973caesm2799894137.2.2026.10.27.08.47.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 08:47:37 -0700 (PDT)
From: Matheus Tagliari <mptagliari@gmail.com>
To: Alex Deucher <alexdeucher@gmail.com>,
	=?UTF-8?q?Timur=20Krist=C3=B3f?= <timur.kristof@gmail.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Matheus Tagliari <mptagliari@gmail.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] drm/radeon: process the VCE interrupt on SI and Trinity
Date: Tue, 27 Oct 2026 12:47:17 -0300
Message-ID: <20261027154719.155006-1-mptagliari@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <CADnq5_OGgbFOJtBu7SwvvnaN01F=RSqtxZgBhJ1fty4pwBHmVg@mail.gmail.com>
References: <20261022114754.865669-1-mptagliari@gmail.com> <20261022114754.865669-2-mptagliari@gmail.com> <88c61950-125e-4109-955e-ce09ebaab7af@amd.com> <0c7e45a13fb78064390818bb501e754b62f16f6e.camel@gmail.com> <20261027001506.27266-1-mptagliari@gmail.com> <6e0b5af2-692a-4b2f-ae20-9c164e7e42ed@amd.com> <d451b9a185817c576ebb7943a604fd1952470412.camel@gmail.com> <CADnq5_OGgbFOJtBu7SwvvnaN01F=RSqtxZgBhJ1fty4pwBHmVg@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Alex, Timur, Christian,

Thanks Alex for picking these up, and Christian for the Trinity
background.

Timur, yes, that is possible. The only place where Trinity/Richland
gets the interrupt enabled is the family check in vce_v1_0_start() in
patch 2.  Today it reads "rdev->family < CHIP_BONAIRE", which also
matches CHIP_ARUBA.  Narrowing it to

	if (rdev->family >= CHIP_TAHITI && rdev->family < CHIP_BONAIRE)

enables it on Tahiti, Pitcairn, Verde, Oland and Hainan only, and
leaves Trinity/Richland (and CIK) as they were.  I built vce_v1_0.o
with that change against 6.12 and checked the gate against the
radeon_family enum: SI on, ARUBA and CIK off.  On SI the generated
code is the same register write I tested on the Cape Verde card, so
the earlier results still apply there.  I cannot test the Trinity side.

The handling added to evergreen_irq_process() by patch 1 stays
harmless on Trinity: with the trap interrupt left disabled it is
never raised.

Since the series is already applied, I did not want to send a v3 on
top of it unasked.  If Christian would still prefer to keep Trinity
out of the picture, especially for stable, I can send this as a
small follow-up against the current tree right away.  Otherwise I
will leave it as it is.

Thanks,
Matheus
