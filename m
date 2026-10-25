Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792933333;
	b=WTGn/o9mqTOQpFklXCuhlu9AsrZsfMP4oTEfUPAZyWgpXg5UIHdtu9LXWbqoihFy2DWV
	 2u7HhsijGNGnXYeshLC/WQukuOXeasi1Pww52OjK/o5SxJP/vX5UJmjrhF89q0Fgrsk03
	 jPy5LSGsVtGpUyZpXsDfq+sWMXjZDwksKP4Wy8K3ppADQIeTVi7nsZO2qAOALoPpHaJSu
	 w5fPpmtEvxTAOdRhpA5atOVqV0IDtLxdPatIC0TeUiXYGTcL52Fe+5EczGcnB0VUzjDik
	 d/En9uTrBhFqFErSO1WYosDs/b8akJMenyoOcfLPfCR1gFM6D7a5EANgrAIsWzFXvew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792933333;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=BeWhtqurdRURXZzZxthQRkSgg7DOPSB9+FM4Irtz//w=;
	b=r3+07X28Y+3Uea/RhC16JeUltIYnBmen7WtcYbumVODyriVPAJ7TpuE0nDmPH96QTJCn
	 t0senwVhucI8uVAOFB/brTqqvXiDVqqkMpllxwYTmDe5u9Iu4IdLrXNdEAX8sFBZxyNl3
	 39xSthGr9H7rNrSDTcm9VtiK9ZQzaq6sZSlg1gHLLhdOxIcxav5Z8BM8FdHhIK5uPW6vm
	 RtSinNdRS82jjLnTuWE1ZrsGRibWfuPN6jC526mUiZfXFCfZHM6/c0QUdoz/jfC76K4/S
	 VGbaIj0o8TgHkSYnJbfhZRu59EqnhKunRNk4+o06eivFXEJG7cnoi58N/WRt80j3SIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mBkw7GqN;
	arc=none smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 675A0606A31D
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 13:02:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 675A0606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mBkw7GqN
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2e7e742a2c7so14118565ad.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 06:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792933333; x=1793538133; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BeWhtqurdRURXZzZxthQRkSgg7DOPSB9+FM4Irtz//w=;
        b=mBkw7GqNrc34m232ZMimBrlq1vV6Ys7Pn1+2+EHfXPKmZtX9Nv6aiOtRInpoJHIbhn
         hvZMvHtZWT40zQ62jqcmaeeTa7jqnGUty0ITjrox0cZ+lIEHfexy3B4kf936yV+pCtOU
         iu7FTW7T41Hu52OPCm4xkaeCGFeawmUuJmG6fpiSiikSYx8gEvSvV8gknrF5wf1AwlgA
         Yvk2tma9S5zSkynu3sQYUuLyTvni9xTINkzQeVrJtRScssiBAiv1SFgKznkJSkeUNy+E
         UedKk5tBLIb6qzJGIQimXkPsLRzCV6Z/KK5bYke9if4vZY6cHaFFGRbsUdiCWeFJ+ea3
         DaPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792933333; x=1793538133;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BeWhtqurdRURXZzZxthQRkSgg7DOPSB9+FM4Irtz//w=;
        b=l2J2i4TApWrvtKF6iCj/VJZHjh0FAZmfNpUMZ+3p83QtU0xS4HJGJkpIiUiHacgeBB
         zSD45U8fKmd9m8iwFXTjG4EMRPN4n6SS+8msOHRiOswJmlPD3HRpdbr94cGdIaqTsUYn
         qMPiDvuu7iZisMoX7fxjlZ1qeXHhWUSAqgT8Aj+SDDyWfDoyo7rYZTmTCCwuLXXFJF+3
         6tLbcxsyVe6uOkWHB3rkBzRHYXT8foyy6e0B+qNv9pOVmW462tkolxqmWu08BnamMGJK
         6zMdG1pLTg8ZU/+et3MjE42kIvFpl1vgvUyeowO9flg3IJ+s3V7TA3D586dxPwwb0ifC
         RYiw==
X-Forwarded-Encrypted: i=1; AKwUvBwyxnT+ho4e2ilqNT9Fb+LXIZPettVGjb23oLEr/UWL4XriEPT5OCSZFpqmpUwtI+cuXtnJ8j/zNpWk2ws=@vger.kernel.org
X-Gm-Message-State: AFq9FYKZOzcH4TtLqzkDan3PiUYtM0NKIcBYvb0JgEL2wK5LxVkzvG1Y
	anvXFsxGwP3RhS6BGClGLH7S1ZCb5YyaEDq0AjcEmJuMPQky1JidrFxP
X-Gm-Gg: AYBFou0iKO69kAgmUAXayUQro9qEmRZxghvY81f/mi3EyIj9nMqr04mrMB/e/eu5NTD
	LtM5+SbHmHcNoJf67byvThqCSA0Bo7zPWNbN2icz+uZJu2DdB58amIHS9Q+88NT5a0f2vhL8Daj
	JBKshIHBSy/nSHtFRltnCMYFzOy9cgrZ2A5jK/MfVADh5b2zTZrpYGend34LTkioeuQg+DvhNzZ
	R9oVskOB+nhaGP/qOJ177d16Po/oqUG87N9rbwximt5OiI5abye9PQuWD59GXR4NeuN0N45Ky2z
	Us03LiNOWu3SLf3Ai7LVYMzanLEf6xN1jyIRUt9L5waUnH5meYnLtdQDoWYMbg0CqAqScd5SJbP
	G903PllTI4GcnFbvnedjuloOOno/f40Lt2m3WKe9TsDeTlD3ecetBmi3b3DYbbqucerKLc5oNlp
	y0++5ftU3oAV7rro/aIN+AvlVmhEA+wABaPSSYl6Q1+qUuVoomBVsVCo5yQmKqc4662qma7zq5z
	cWJM/AJDt5tY5SsIzjGJ8QljOktok2n1CfrwoQEeAmrPinpfWc4NQ++z+jyoRCHJqZHxXM79jXW
	pNwGaS4i5lVodXxYCT+4Fsktd4CYBQchg6IgsXwsr551enraU6sd/z8ucEMw935H3Xd83xNHQD+
	eBYK0fm1g6dWhTov6ZW25Y7ZL56qvQHEQZol+CK975o6d/bW7xvqyy0z49A==
X-Received: by 2002:a17:903:198e:b0:2e5:41d6:178c with SMTP id d9443c01a7336-2ea9cc5802emr27275065ad.33.1792933332318;
        Sun, 25 Oct 2026 06:02:12 -0700 (PDT)
Received: from alanhc-14700.tailb22ec2.ts.net (180-177-138-120.dynamic.kbronet.com.tw. [180.177.138.120])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea9b14d1ddsm8430055ad.40.2026.10.25.06.02.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 06:02:11 -0700 (PDT)
From: Hung-Chun Tseng <alan.tseng.cs@gmail.com>
To: Anand Moon <linux.amoon@gmail.com>
Cc: dlan@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	e@freeshell.de,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] riscv: dts: spacemit: k1: mark boot-critical SoC nodes bootph-pre-ram
Date: Sun, 25 Oct 2026 21:02:04 +0800
Message-ID: <20261025130206.187282-1-alan.tseng.cs@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CANAwSgQ=Djw_o89MgvEsmKVxuNiE3Yuy=e0T5DcLfqCYy6eWMw@mail.gmail.com>
References: <20261024092558.143621-1-alan.tseng.cs@gmail.com> <20261024092558.143621-2-alan.tseng.cs@gmail.com> <CANAwSgQ=Djw_o89MgvEsmKVxuNiE3Yuy=e0T5DcLfqCYy6eWMw@mail.gmail.com>
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

Hi Anand,

On Sun, 25 Oct 2026 at 18:43, Anand Moon <linux.amoon@gmail.com> wrote:
> Could you update the pinctrl and GPIO configurations, including all
> necessary pin
> assignments, to bring up the SD card, PCIe, and Ethernet nodes?
>
> Please ensure that the required bootph-pre-ram properties are applied
> to the relevant
> pinctrl, GPIO, and other dependent nodes wherever necessary for SD card boot and
> SPL initialization.

I'd like to keep this series to what is needed before DRAM is up.
PCIe and Ethernet are not used in that phase, and their pinctrl-0
entries are already in the board files.

For the boot media, the BootROM has already set up the pins of the
device it loaded the SPL from. U-Boot's spacemit_k1_defconfig does
not enable SPL_PINCTRL or SPL_GPIO either, so the tags would have no
user today. SD boot on a Milk-V Jupiter works without them.

E also asked on the cover letter to keep the BootROM part and the DRAM
part apart, so I'd rather not widen it.

> Additionally, could you update the regulator-name properties for
> vdd_core, vdd_1v8,
> and vdd_1v8_mmc?  On all the boards, the SPL code requires these regulator names
> to locate and enable the corresponding regulators during early boot.

These names come from the U-Boot SPL code, not from the board
schematics, and U-Boot already sets them in
arch/riscv/dts/k1-bananapi-f3-u-boot.dtsi and k1-musepi-pro-u-boot.dtsi.
I think that is the right place for them.

> I am verifying the changes against the existing U-Boot board device
> tree and configuration to ensure
> that SD card, eMMC, PCIe, and Ethernet initialization work correctly.

Thanks for testing. Please let me know how it goes.

Thanks,
Hung-Chun
