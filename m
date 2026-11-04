Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793779991;
	b=ZyfOdndAlC+kDXZWQVMioRzftQr8Gwea4yr+yWRjr9LPTJeHic7un4oTIrt8G+x1tyE/
	 beyXgBxYVMlvDalvei1ZpP9n29ffnUr65yhWCac5SWkRXBlZrBN7n6jnQQt5qfxtxwWY3
	 bpuaFI6PiyBKfjORGXEIJVpdHViyFC/MxfOv0PASiofk47x3g64Il0G4JIFWEptjKEAqs
	 S3xCnJj12F4buAi9PLDk1FiqJvnhGbPLiDQON64W2KUkl/wfde1WV4DcjrazxILH7Jqz0
	 TBetRLfXuZGFzPhcmgz/yPb4g47C17ZIEmtp9kDHqCJBMGM1nGPWyeigzt3Ih5gN5nA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793779991;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=rYVCxbzjhwXie807mRKlkMf4y7MqKXFbNmLhmKxHJ8o=;
	b=NFgZpA7Iu54VJm78mOKzmEReQFWQX13GbWk4Z7wnJnRATM7Cuc8txc8H3RaVAdWr5Vf1
	 DRa7VE0A6fkMCrAwvB/BLJiDxM4qV00v858yRrLlHLloRSAWqtFsDHa/naY+oJT/HRAK7
	 7Cb+UFitI/jTwMgCyJi2J4xr/w0W5p3qR+mC2sbQy+q9Ts2dgmYrv5AO4TTVN8TJ4ZkgH
	 49hLOVxK0ZzTFGmwuz1qTJgbtFZBGhUTNzIJBZiWW3hyJsmrFNSq9UjqhRJLyHoGhr2WF
	 ZzEJ+3aLqFivhiRBKPqC+j6BP3Rmx52IbTwusZFt+BkYYAZcVSE7/ItU/4Tlg7lWCYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TFaB6tYC;
	arc=none smtp.remote-ip=209.85.215.174
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F4B9606D820
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 08:13:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F4B9606D820
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TFaB6tYC
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cc7e79c1eaaso218797a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 00:13:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793779991; x=1794384791; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rYVCxbzjhwXie807mRKlkMf4y7MqKXFbNmLhmKxHJ8o=;
        b=TFaB6tYClWr47CyI+QVWgH2XnHepS1ZR30HLKq+OHkfjGoSD9zH77KR1UEVuzMdF1/
         FQGdUc5GMqrG7Xz7U3AAXyKq9yt1s+nsYkQRwvvbmlpFJS7LA0gxFBv2J9g3o3yU8YEj
         btkw4iXwJTHCVBXzhjkb17P4Gy9Ui5iA8465mjoIOx3CHHukV/bY8N5JiWLUZTycuJzQ
         gmUgo146yhClERrtnSeKe2RapGOCMHeIMfWcGdKmMoScUaXcekZcbWaE1tIblpDLjubm
         1O/UjBE2m+IputViurgdQC6lNHdSXP7mwOzTmswhIdBbFiCyp4dPfQDUIYVzMGZs7wi6
         w3Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793779991; x=1794384791;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rYVCxbzjhwXie807mRKlkMf4y7MqKXFbNmLhmKxHJ8o=;
        b=zPKChS5AXzgil9uNzXWWh+11kxwWToTLkkVcEQRs3tOKUMSOdQbm/vC+B8aQaEiHe6
         /e60Z7krnV59OQnZrl3/vRbyCFcb8cO78G2GWVR1HnpBbRw0hocSioKUZl8Qi2f9nmA2
         Co+wngvEhdGFPWplJbj9yGcowFLV32bX5a9icU+QxyWj2J0moSDFMJ6pQyUF5Do2lBRJ
         T4nPhjcOpG/xvH3HeGMWMubM3Xf8RDCcazVW3+D7ZHXyYnsueum19u3KQy/UwLD4V4OI
         BDffTC+0ponGGnfpsrdSKfJ0aVLsYy0MxezK9HhEaSIV2cx1rG8wopYS6NGy56Tx8cs5
         uFoQ==
X-Forwarded-Encrypted: i=1; AKwUvBwdGrXPkqatFDC6AAe/xO7EuI8cdfQ8YAt3UZD1Rog6UXnEizGXysNACOOOmXi3yPdZ5RAemHs+tOZOZ+w=@vger.kernel.org
X-Gm-Message-State: APuU4Z8PGBmTTn5HPuVyPRK4crvPfrNZ/s0vXp+brPeHvqbxj9vEE+dO
	5aGzNQvqGV/546CT8W89mjC9m2Oe/aJvtQdXMqWJjJRaTY+xlAC/XySm
X-Gm-Gg: AYBFou2soZM0AcJPphyGmFFiEfYF+DuKtEJa3I6KkSpXTht7M0e+w+hDbNvZ2KCCQ3T
	ixyx4iW3CDLW/BBFy33v8cLRiVh01maTI5e/RbYHDlHX1C0WqSHY2fUXhLh/Yzcb9rCLtS5ScpW
	mtjDJKIeFw/PohoR5gh8VP39yUWdgVdcC6yCG8/g9DinVnw4qkxpsd+l809EDE0boUhNVqpvVZ6
	Tvk+5vuoaO7e9nFnJpM5P6x6QJXocA06EMZ0AR6RmlxOfWeolnr1NQcRHGI6rGwbbztdg2Pb7p3
	L+9tX9Lw3U3BVN342psFHx89CsjgGs4WKj1PkCXPJuT+wijOD2t7gz6F2B20KXR7q4FgX3QYVnA
	6WrW1FL/9HOVHF6QbUnF8NStrGprgduwjem4pUdxh/4X9WIyr+RKkn8yRLaj9lhzj1kArZNnze/
	KMYx/POjj7BOcXobyG3fmrVUXWWouO5UCJjeTU1t4kFm580ahkpWb/WeDbvRVGvbAxCth+0Zrci
	MfBPIbNDMbIklbB3FHFrv57TpBVzGWsbaUMct+883tS1yfzKxL7lCUMmfUqOgfldltKGWjaOFGJ
	S6o1NnN0AlZ3iGwk+yJS1Kkd53I76wCOC33TcUnR340o27Y3gGFXi5I=
X-Received: by 2002:a17:90b:2dc5:b0:3ab:c80:9365 with SMTP id 98e67ed59e1d1-3ae897a5be6mr11780916a91.42.1793779990608;
        Wed, 04 Nov 2026 00:13:10 -0800 (PST)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c2ab1cdsm8423510a91.0.2026.11.04.00.13.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 00:13:10 -0800 (PST)
From: Ping Li <leeonion.muyu@gmail.com>
To: yin.li@oss.qualcomm.com,
	robh@kernel.org,
	james.morse@arm.com,
	ben.horgan@arm.com,
	sdonthineni@nvidia.com
Cc: andre.przywara@arm.com,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ping Li <leeonion.muyu@gmail.com>
Subject: Re: [PATCH v4 0/6] arm-mpam: Add basic device tree support for resctrl
Date: Wed,  4 Nov 2026 16:13:02 +0800
Message-Id: <20261104081302.304667-1-leeonion.muyu@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261028-mpam-resctrl-dt-knp-support-v4-0-bdda1e445cba@oss.qualcomm.com>
References: <20261028-mpam-resctrl-dt-knp-support-v4-0-bdda1e445cba@oss.qualcomm.com>
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

Hi Yin, Rob,

> Changes in v4:
>   - Drop memory controller MSC patch (no concrete platform user).

We do have a concrete platform user for that patch.

On our SoC we have implemented an MPAM 1.1 compliant MSC on the DDR
egress path, which provides system-wide bandwidth QoS. The MSC is
described in the device tree with the "arm,mpam-memory-controller-msc"
and "arm,mpam-msc" compatibles, and this patch is what classifies it
as MPAM_CLASS_MEMORY so that it can be used through resctrl.

We have verified this on hardware with v3 of this series (patches
1-6) on top of a v7.4-rc1 based tree: the memory controller MSC
probes correctly from DT, resctrl exposes the MB resource backed by
it, and both bandwidth allocation (MPAMCFG_MBW_MAX) and the MBWU-based
mbm_total_bytes monitoring work for it.

So this patch is genuinely useful for us, and we would like to ask
you to reconsider dropping it. We are happy to help with testing, or
to provide more details of our DT description if that is useful.

Thanks,
Ping Li
