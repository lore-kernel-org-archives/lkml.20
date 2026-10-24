Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792822330;
	b=zfhcHLtLkCTIFvxXEo61GbQWZOGs22FvKunGKl/dDYkfSMYbuVF+A+9iU1mceO53oAdT
	 Kd8hqHKL5XhyGasI1wEfPacUqShOhJhaKvT+1658zL6Mzq9/5an5pccpK8ZDb2GzsWI+6
	 NsNRCTV9pHGSE28FQ5qY9jjkUsvPz53kyqXQdTv/vS5pLXLIVwuFEHLdv1V95wYugqmcW
	 muB04oEKFKH2PKjTO6Z4UExTHsgyHNskRlryuH/briwznsc1/6mmfImA8TZ+CWK4gML37
	 bz+j4664ALuWhi3jVAKSdCKnOZZ/lNplSz0I7lL+IMcreOc2GmU+NNztDVn9/sUKNsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792822330;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=VRzUlJpt3G+S3KUXRCNRlTPq/5izEy1vG6+NzOoYVdk=;
	b=KIOL68AVRJql+L7grMsTx4pBIh1JHuOpBsQ0Zz5/uMOvvALWxSY1fBiOS6nhEpiPL6Qw
	 oI9JgPPZBFrHviI5HXDQ5IuDQEZkYNCEKiDu78no+1b6hsiDaqZsg9hDHY5FSlCad77wJ
	 dfldLKo9Lg3OemJVKvXBu4GbuEEppVKoaSoWl9QxRmCGjJwurUPx4jOo6wYm9Y4pdvmx8
	 56T7M+7J4N988A6DS8o/W6k7/ygvldRo12xaoL+OigP7hnrS52n8KwDhFg3M7Dh5Nbfe6
	 ksvfFCpGw4eNt0p/wGAd/0W0cZFQfGh+K0fClLAZbaT9eMOtCrDYP/O11pz4bpKiw9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ib0ZNFEm;
	arc=none smtp.remote-ip=209.85.215.173
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C985606A31E
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 06:12:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C985606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ib0ZNFEm
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cc502d509c0so507627a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 23:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792822329; x=1793427129; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VRzUlJpt3G+S3KUXRCNRlTPq/5izEy1vG6+NzOoYVdk=;
        b=ib0ZNFEmkAW7EJhvab8naBX3Pp40HGOHlSt6XapkA/hU+jx3vq1Ku5laUW7ZWcjSrz
         WJu0D1OBVTiWoAeUupsgARtcCjz1A8vKS4yPNIQ+4/qmMHBueRt9P7wa9SJtSAc0E0Ta
         v1MYu/URbJ11Vxyo3dCJ3XXvskuYV+sDWn29Cq/tSKjFnxzc5Lj9qaDsNvA2JwfMFwDM
         Lk5uthpmssp+rqWcZlrXZdGt6sH8u9nCqL9KFAdYc/qCrzw1POl6eGMOi8SNlgswrS3e
         K1rQAXffHM1QUdhZLtSJyA0iKulpCBNw7+DElgBrJDdl2ttHywH4DHUBik188MnxBzn1
         RISQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792822329; x=1793427129;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VRzUlJpt3G+S3KUXRCNRlTPq/5izEy1vG6+NzOoYVdk=;
        b=ooqx/GpOXYdc3frrHnO5rktiEXNHtgtAZJ8fB3+6i9QaKomZBvG8aPgMtPljT3RFn0
         Db334UE/13O23nx3OK3dSSiFRKn/DVxRfNZPa7tJhM67lAjKFHfZyFguoJLZOZ/DzLCU
         7F3ieZeSwuZoGIGDXS4g2WEcBGFnctVWZb4IYeLIOzR4cSTvFHQEZup4YyMbr9Clko/E
         isZWrI5jvxPODiBZzck0FUvOcrnqiew193T+19bxb+PsUcishmt+WrH9O4ueMD5hOKjo
         wmjb2hvYvKvK6TaIsZt3f7wPgWILf3uDq2lxxoDESkOiDCghF31f1vHrP9fCO2D6lr65
         UqMQ==
X-Forwarded-Encrypted: i=1; AKwUvByF8uSATzuDwSMW2pR3pV/4oONxvL/XKGAHba7jRxG42EFsHqPoszpav08BDvFsCzjJb/EaaXI3URX2g5c=@vger.kernel.org
X-Gm-Message-State: AFq9FYKU1Ztt80B/b2A2cEiyAz/R4NZnUBhI6pEQpyT6DrnywuMGZzT5
	GRYI49JSIAObdWReve0eFEz7UhCpU1Rst9Zd2JOZtOGgWftSlcFdeNiz
X-Gm-Gg: AYBFou3zEB3FijfHG1FhyRUxKGz1pHNI4Q9Pzl/e/BnOrLV+Wq5g3DcWDvouvKMpgi8
	siyHCV08BpZljn6f8teqdo8wSxrv4+yd/9X+mAFKb+LWoX5v+A4m9Y1gtp8Z7g3sf2pnYUnKdhk
	LhV7eAFIfNDh8eLEOHJ6k84zNnV9wIbuvoq9/c4MaxOh74kCpad4BETkj7DnwOMszHu7LPcg6vH
	P72YlvOMCzxxDD48nGUywktG0vS83/7ECnyQYsEwQdoqmvHqFz8yJmclQiJOsEpsTcrQ2sLPwQR
	3VVxYdEAozOSksEuZRMaoYUxRiHMM8rAiQU0l3M3A9CAA1/hnoKYMZM4MahEuem9VzPhl38E2FM
	JqTyKcPcGta4VHT00hQvsMWp/506AwH5BwhzlQtysAH/VFhP4ugvqzYxBc1S5CXPM8Wzeuouttm
	hEtEE4N68HXgEZCx+2OviNaEc+nQK8/ZhJFMfPFYhcElKglHR1EnudEIArgshSGXEf+9Oh7XHPV
	PLt3Wz0MBq+vMEGHK01vtFhbjnVabYMJi2rUsD8zYEJegnY5KvlpJ8eA7O7XPLUncCLgZ4RZ2rh
	cPeZVXqtJkVWScdj+7c3+gXyZQmIiG+FK47Q+9TpQ77DnYO85U7nao94K0EKjwLKLUNRpyfrP7Z
	AdrM+BeAZS7EEgCF3N0iOO2gGTg==
X-Received: by 2002:a17:90b:5888:b0:3ab:33b6:2c27 with SMTP id 98e67ed59e1d1-3adea8985c3mr1153367a91.23.1792822328671;
        Fri, 23 Oct 2026 23:12:08 -0700 (PDT)
Received: from LAPTOP-VN8JNK11 ([111.223.27.68])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea9af332c3sm3153665ad.3.2026.10.23.23.12.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 23:12:08 -0700 (PDT)
From: Ankit Thakur <codeankit.thakur@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>,
	Matt Turner <mattst88@gmail.com>,
	Magnus Lindholm <linmag7@gmail.com>
Cc: linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ankit Thakur <codeankit.thakur@gmail.com>
Subject: [PATCH 2/2] alpha: boot: remove duplicate LDFLAGS_bootloader assignment
Date: Sat, 24 Oct 2026 11:41:56 +0530
Message-ID: <20261024061156.1742-2-codeankit.thakur@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20261024061156.1742-1-codeankit.thakur@gmail.com>
References: <20261024061156.1742-1-codeankit.thakur@gmail.com>
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

LDFLAGS_bootloader is assigned the same value twice in a row.
Drop the redundant line.

Signed-off-by: Ankit Thakur <codeankit.thakur@gmail.com>
---
 arch/alpha/boot/Makefile | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/alpha/boot/Makefile b/arch/alpha/boot/Makefile
index b7e530a65..3c4477e21 100644
--- a/arch/alpha/boot/Makefile
+++ b/arch/alpha/boot/Makefile
@@ -105,7 +105,6 @@ $(obj)/tools/bootph: $(obj)/bootpheader $(OBJSTRIP) FORCE
 $(obj)/tools/bootpzh: $(obj)/bootpzheader $(OBJSTRIP) FORCE
 	$(call if_changed,objstrip)
 
-LDFLAGS_bootloader   := -static -T # -N -relax
 LDFLAGS_bootloader   := -static -T # -N -relax
 LDFLAGS_bootpheader  := -static -T # -N -relax
 LDFLAGS_bootpzheader := -static -T # -N -relax
-- 
2.55.0.windows.3

