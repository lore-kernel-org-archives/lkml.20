Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793734689;
	b=N/TvWjF2xikO42cS3LdVJJBmkqeve/Wi0CGNOW6axwICCjPqI2Fq1cqmceJIWg4joRPP
	 LbxavgXbIRK/6z4+rSPISYWzSx3TeUpbEc2/J48a7YGqcvLpGgIwa/BLNEMp+TXcKAGe9
	 kqVc17UmeQG2xrhbIIU4SnD+xjrRM8xdTvWBTs/Phx3PKFLlKAQ4Um61wdVzZq0KtVwmd
	 El3+i7glGehQZ486johHmrwLDlYOnRbsbsbt56BqqtZa/VNEzNekb2CMB+d3s21X/lp27
	 gx4EOE2CPug9V/9yC01g26Ka4r8E1t2doOERVD8aC6g24zLlpO8sne1fMiB138PPg8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793734689;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=ha3lGnJBwyk4YR7zSIS8QHZCwEJjqdMUCtp8VxcQYlg=;
	b=rztQ8G3JLhc7ls334KfzDAztItVoSC91S8vyd0QC1CFEYQOqpBHlhrIwHfFr7X1gAEIj
	 lBx1CGl10HAAQO/wuAQXWTCapDS9vn7QOxnstw1ftE9oFgzHa0jKRcXcA9nDTA8H+IIu0
	 NslxvCIZEqkyptr7U3yrp1U5hg7mL/doH/vlf1PFyPFMbHKdPjJLAf3N+ByQlIsPGorN/
	 SZMwJx0OT05arq+6vEBcTZ+HGQZ12T90HEAapp4gUo3VgKCzqa/oXfr/US9cY9riizzpl
	 szz2wqHs1ZTyvN1TU0cLd+ewfdT0GC+yOvyQC+abFSLWqCx9JcMI9Qd8/Gce5IPpEnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Qc9ryKR0;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 121DF606A32C
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 19:38:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 121DF606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Qc9ryKR0
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso45853705e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 11:38:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793734686; x=1794339486; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ha3lGnJBwyk4YR7zSIS8QHZCwEJjqdMUCtp8VxcQYlg=;
        b=Qc9ryKR0MLQPExVVbk5Z+7VV9yjXBcNjJcjTBDe3G38pocoOV82H9z+NwxbazjH1aK
         E/6qBcrQiYCO92zbzb4A3jxte1kO2Y76s7HST3qICTyk1VTMVBeNMx5VvQpK66t/CCE+
         UQKnJaVxg1p9CgO4NrTqUSqpyMV9vVBe2liobRwchiMWD4mZpOH3D/L2UVWey1DMutaB
         8MLFfwEv+rLDXPodVfLmOs/EOzGv+9EGOUvnmBnfE49ks2lpRU4l49QdPz2KWLl5EjVv
         tqt0/vY/YM+R0YCCYDsdU/fEw9wmJfNgS9uA9Yt8acfXii/ixED9bdMr+VxZOmmwXMWf
         PGsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793734686; x=1794339486;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ha3lGnJBwyk4YR7zSIS8QHZCwEJjqdMUCtp8VxcQYlg=;
        b=KI9ifITSYNFeOsWK7HhJY0yHBltVhLDlEnUIQgQQ6vLlmbcApM7xzH6wbs8+CY8wTQ
         UCgWuxsypv7GxboaPJXSL5xWUdPpK8/QMCRk/YFpl3Kz1+f/5DP12sZom10f3nKUm0Nb
         zvLWffKX7vXz884+TAOIzPjhJ+lCK8RrgbAQ/Ij7wcOCX4gC0Ny6wpDSrajnz2qXrKSC
         gABWw0gjjmF98swJaLkwvUZ7Q4jdOSmmyJANtSrxBVuG9CalNdt6eRqOq8BnetcaKUyI
         Yum5SQDSXMq9bkwMVqQWDDhEjI1FBqqm3pXCd/cmmCvFpH84WwtM51ItaF7vB3zRqpSu
         mbdQ==
X-Forwarded-Encrypted: i=1; AKwUvBxM2ibpVs+FVHLdQLRbhH1u1sQOGX+zW/KXpijftNP8hRgOLpPIK4zFHV0Lr/6uDrXHUAGSKUPQdcvvvWs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8PV+5WoxFtLQ2PW8nBis7dmIIW4hH2MN8bN1wU+ixIBgqL6T1k
	GCcE50jIIpoVWjvlLsw0+qKNlGkdcpSuqf/9gznWNPbKNJddr1esX0POz+5vUIDNkBg=
X-Gm-Gg: AYBFou0sVaNcL7ZUClAOrADhgP+8O2KUyNfzfjfPg4NUTYUtU6nmmm11MJMVSmMtIAv
	uM4+4/DsdNsxVEQZuJMF3UKIg7WD8nEeFTN9N/+un+RarfF6A9VF4N3gLoeZdjrnn+LM6Q/+qz4
	y4E28DmgVl5QxtmNhxmLmr/WahCAKrDjCJjtXA/tQ/JyTaLulg3d6zorCTfbCnRVMdQq4T6uydu
	8F7P/znvoWxMH4OCPns5YZGZbbw69rqMkJ9dk9hpK5Rk3ptfm8ll1FMJ8XN3s7CybYg/lRaRdMP
	XVW6GBVfD4cdhkvtQ+Xw1wZG7rFDR3E4ksDld8PFcp+8NJ0HPwN/OukLeslVc7scA/JOw4BaEB4
	StQuiTeTzNl7XysaKuhMK5CshQ3DL6a7MdooiXCp7t+8Aw7qSdpgiZfF7TOFN3Ms5QoT5VACv2k
	o/BCTyyorMEO2jzWHBW8w2Li2ESOO4r9ichbvX4Y8F9liGFj2Qsr56qe+f4H87KZatPN5GmrmGZ
	l2Z3LeSuSEon25ZczL4qBMtvomBFCWiRGrB7t14r9gIXha1bgzzrCEj/0l95pkPShEUu7xrDUN3
	XrZ3RHtrn64ztHsqYCWSrfQFtg==
X-Received: by 2002:a05:600d:82ea:b0:4a1:cfa7:e968 with SMTP id 5b1f17b1804b1-4ac17ff9be8mr351143745e9.21.1793734686327;
        Tue, 03 Nov 2026 11:38:06 -0800 (PST)
Received: from localhost ([2001:4090:a244:81d0:2c16:1c4d:8a04:e0bf])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2ab010a66sm114159265e9.13.2026.11.03.11.38.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 11:38:05 -0800 (PST)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Subject: [PATCH 0/4] dmaengine: ti: cppi41: Fix suspend/resume issues
Date: Tue, 03 Nov 2026 20:37:27 +0100
Message-Id: <20261103-v7-3-topic-am335lpm-cppi41-v1-0-d7213446c5f5@baylibre.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPc36moC/yXMSw6CMBAA0KuQWTNJPwjIVQiLUkYdIzBpgZAQ7
 k7V5du8AyIFpghNdkCgjSPPU4LOM/AvNz0JeUgGo0yplVW4VWhxmYU9utHa20dG9CJcaOx1rZw
 ZSnOvK0iBBHrw/svb7u+49m/yy3eE87wAcQ9sVX4AAAA=
X-Change-ID: 20261030-v7-3-topic-am335lpm-cppi41-b180a2d62987
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Tony Lindgren <tony@atomide.com>, Daniel Mack <zonque@gmail.com>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Julien Panis <jpanis@baylibre.com>, "Mendez, Judith" <jm@ti.com>, 
 "Francis, Sebin" <sebin.francis@ti.com>, 
 "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>, stable@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1079; i=msp@baylibre.com;
 h=from:subject:message-id; bh=SMzMjv+Lw+u1NgOCPW5V9Cq40PADdnkoFK7SsolANoM=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhqxXFsx3/0ZZ3ZhoK2HEfSHzmxSP1u2nzzY9nLXy2MLTC
 SlW+U8mdJSyMIhxMciKKbJ0Joam/ZffeSx50bLNMHNYmUCGMHBxCsBE/h1jZPh4Im/BCfUGZ7GE
 XZPmdVzmDP6552C+7m21Caqv5x85ODGRkaGH0XFV5cplp9SOMTE81yz+4Xi3rbKy3uSJfblqgMe
 FXCYA
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41

Hi,

there are some issues with cppi41 regarding suspend/resume. This series
fixes suspend/resume when the device is currently runtime suspended. It
also fixes an incomplete restore of QMGR_MEMCTRL during resume. To make
the restore on resume more reliable the last patch unifies the register
writes for init and resume.

I tested this series with am335x-evm

Best,
Markus

Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
---
Markus Schneider-Pargmann (TI) (4):
      dmaengine: ti: cppi41: Use td_queue to restore DMA_TDFDQ
      dmaengine: ti: cppi41: Fix register access in suspend_late
      dmaengine: ti: cppi41: Restore QMGR_MEMCTRL in resume
      dmaengine: ti: cppi41: Share register setup with resume

 drivers/dma/ti/cppi41.c | 74 ++++++++++++++++++++++++++++---------------------
 1 file changed, 43 insertions(+), 31 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261030-v7-3-topic-am335lpm-cppi41-b180a2d62987

Best regards,
--  
Markus Schneider-Pargmann (TI) <msp@baylibre.com>

