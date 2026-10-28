Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793150369;
	b=PPzndKxUmVKs7MUDTluPQEGhhZPxhAT4Dx4X6Eo8EXiE/9XXq6dBmPC7/afYTv9mSXur
	 Zi+cR3F2r4al47UArimyQC5xyQfY/ekSfHCJUAEPfMluDk1VVhOh+oCx4IZDInnl9/7Bp
	 roqBqnakWa1oTjA/AqiAWRxuTS90QlEQgpKInKQcnbmIdEmVSkWakHkcng84J8KjTaFoD
	 758k9MCwd0NSUDwxFfvgF4bhxqW50KMty4HkQqCNKOKwH9GJe10b3bxpEaNmZoqOwVcUG
	 623SsNgGEhq3CE0uSTnNH/1ElvLdFs9t9/7bHnCohnycUj45Z76k+/Cp9ElMLdTZNZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793150369;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=QGQE3LAYpEwlaN5IMebgHt/LGKiGCVPD/r8B3CD/Y/o=;
	b=p3ikZwToqYO1SjfjYjURTPMN7PQzrr09oSZkfjRQaXiyVakz/VEHA3tviqNF8q9ZHopJ
	 S8oWcBwwVrxwgalPIHVY25QwGpD/0zCSc+OJAV4OkyYZ1Oi73j0RiAV9JE97lpDkvHpwZ
	 LAZjG6Yp64e5a49mVgcwI2+tvXv5BbDjg/RMZZd+lqAcg1I1hJnxi5pmufjaeyHLN3Rj/
	 ymzbCDt4rm9spztqWvf7gGolkSpHxz3wwXS+ZPzeUMzadOdY4pb+RGmS5ClirQ9R4+kzq
	 DTiyeHwq3aly7Y0FBYshZHfit5x3M8ybl30jziIqcvJU3wDDs7OFgN6v6WPFEYVkYiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h1TpY2Bs;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46AAD606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 01:19:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46AAD606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h1TpY2Bs
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-35c76e9614aso699962eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 18:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793150368; x=1793755168; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QGQE3LAYpEwlaN5IMebgHt/LGKiGCVPD/r8B3CD/Y/o=;
        b=h1TpY2BsShnknbHatxj/gkM/Q/3/CKzKz9pjSzaP3JN3Y1TA9yMEzkHEavgQ67JW4/
         7LLgSzyonsaWbGqdcnfcmRG0M9ffhLCRiyY3tchJ/wF9CBKKhLpNImF3K4uPUkuGCGIi
         GCnGGdOicWsqzQiNokqoYkglKfShaQyctGxrpBNIwAbQqMB79X7rI+miRj/m+RAJZLcZ
         Hq1tFtkbVIYR9dVRj/JUE/VyF4Vt49WaHsnGLoERz9//rfjinmkFBga5zTY5dNkf4CBj
         xxqhXoDA3AuAiNi1Wss+Xa84OHvM1p0h24CezQWiqaU21d78gh1Ka2S6lTcGBzqwLSoW
         fDrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793150368; x=1793755168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QGQE3LAYpEwlaN5IMebgHt/LGKiGCVPD/r8B3CD/Y/o=;
        b=bKfjC3hnHWSgQdtY1sInxKVQKccJJaUGTwTgSDFoImVcTqT0+i+G4rUTbpFrkigj3X
         3iwvYLvxaJ4TvS3EWyzeyXaw23U3JQMWTKhbkw+ZlvoyYaJK0yQ9z5kJQPpidDk0PkVJ
         Km5djtPsOuNoceUyMQZv5NgHX4ZxmcWd3zq6Krs43vsrLJztS8PMvWv39lrO+ZxM5M4G
         q480FyvWi4Sg93B+2iVJiZEs7H7aZx60DCmpS25P4Xd5L9fJnZduBD4iwCLQ+DWakRij
         h65HLC++jtmA8dgn68Ja2GdMmKxFWYJXDPh7ibnuALB/sObmcYaKhZMHeMneVQb8MU01
         +SLw==
X-Forwarded-Encrypted: i=1; AKwUvBwH9J9WwWkc0tYx8tsvOICh50Lq+6V0t2O398hmnSKg6UE0nFmotiYQQ/fCyA5uFTk0Bs2W7evGJz4nYys=@vger.kernel.org
X-Gm-Message-State: AFq9FYLrC0FGsGxG42fHuG5Wd26l3QNf9DdAkX+m6l3M1x1S2Srtj8NV
	AcwWneSOwx45+tFpAI1L4n7cmSkQipOu6OgQThhHa0129a3DyWFPU50=
X-Gm-Gg: AYBFou3dsj4GIMs1VCmEHfK0a8pD4fYBVC0WjiwgUQDWl/c+u7LdkU7gA6r3CcHrbs7
	IT5ZcBvSaFIBCzeslX8hXqddDBupOU/sNJTr2ATfcAH5UPoArKDfxNrTnwyY0xTCP35HlWNAutL
	YITJdIGMFi2EwRfYBjSlbXcxLRZAYEps3eB3bTEGdQSQQQlzw2k7kDfxTE4UGQsF3Vix1v+xUys
	z7EXP/5B7IzQk3U0tAVrNpsoplH7VHbvw+SavZT4DeSyfnrQFBF0NM/LMIdRQ2/+k9bIpghErrW
	pFUtRNnubIrfsxUheP7ky8u9IRSaug/KYt7kjHpKvLXGumImVuRbBuQifo5FQN3SBaW42Q5iLY2
	gPVdJ3BzHGDzxYAZOu9jQlU/X9G0JygRn7NraAEuS5dzCYct4I6duWyHKAi2e2u23wHW4P1sEqu
	VDGwg2U1zi/vBaY8+0mqNxtHNG0qRV2MbYiIH+1ItXB4Ao3uCGUS53vDELBBa6jUXAdm+u9B41q
	Fh2jC/ZZinRw6yg5RzkY74l/ENrS6H9oL2PZlM1C78O8eqAodDHUEgiKPp8yHJ4h+o8PUiuRgy9
	MxxMp/dXmgx7y4if09D8jnsqQNtu0md6TuCJ8t/EKoBXLemo+YFkkZMxtv1HlGPaoa06WGtlES1
	cfpz3x4gNzlnI
X-Received: by 2002:a05:7300:fd0f:b0:367:363f:6fe4 with SMTP id 5a478bee46e88-36a20440ad5mr1939920eec.32.1793150368183;
        Tue, 27 Oct 2026 18:19:28 -0700 (PDT)
Received: from at-Standard-PC-Q35-ICH9-2009 ([106.202.115.199])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a2392ecfdsm821863eec.17.2026.10.27.18.19.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 18:19:27 -0700 (PDT)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: atharvatiwarilinuxdev@gmail.com
Cc: airlied@gmail.com,
	alexander.deucher@amd.com,
	amd-gfx@lists.freedesktop.org,
	bhelgaas@google.com,
	bp@alien8.de,
	christian.koenig@amd.com,
	dave.hansen@linux.intel.com,
	dev@deq.rocks,
	dri-devel@lists.freedesktop.org,
	hansg@kernel.org,
	harry.wentland@amd.com,
	helgaas@kernel.org,
	hpa@zytor.com,
	ilpo.jarvinen@linux.intel.com,
	kenneth.feng@amd.com,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	mingo@redhat.com,
	platform-driver-x86@vger.kernel.org,
	simona@ffwll.ch,
	siqueira@igalia.com,
	sunpeng.li@amd.com,
	tglx@kernel.org,
	x86@kernel.org
Subject: Re: [PATCH 02/13] PCI: Disable pcie port and access on D3 on specific amd devices
Date: Tue, 27 Oct 2026 21:19:14 -0400
Message-ID: <20261028011915.8217-1-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261028000841.6816-1-atharvatiwarilinuxdev@gmail.com>
References: <20261028000841.6816-1-atharvatiwarilinuxdev@gmail.com>
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

> I did not know about, i will try to remove the ignore_access code, and
> will tell you the results, i added it as a failsafe

I tested, and yes it works without ignore_access code, but we still need no_pcie_port.

