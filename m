Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792894731;
	b=biOpavJj+Rypqt2bh15JxL96nOeSusthEb8sY5DGSZlVy/jE4eRV4rj3mOY0NAzR7blg
	 sFcKPCzG336ctWas/zFb4g8bEvi9UGNo3rzmFOecU502R6e9eDdZ+vfebQlcdvFxkHZLV
	 ZZZa6rr2Vc+uR8ARnT8wVU5AqmDUJXg8iUF/Ryk5H2q3Fjt0563/lGYUOsCqEpG66zv1o
	 wf2UM7pQvUlgV+ZYSNmiJYBLl6SOJHHzl8OCUrJbfJ7jRFKgv9oeC5i5qUq6Eip+VbrdX
	 PejHtuuV8qCRNc2t2egPoD4s3TMbh4xbMGDjeoSq4CGQAJNVE51mofl+scg2xHIdhag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792894731;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=hbo8DF5QYQnx8DfVRTkAJCVVYmLZodegAu826PeFH2k=;
	b=wNULta53MJ9M2fgaD7BnUZLEV8B7Mn5EOQFFPM6KLfcdzSMQbDulIBUNKT+lBPhIldC1
	 eMfVOmlWWdGW2EGOeD3yLN+gOTSLKKX+jWGJ908ohdVKgViCdPVcSJdBqnFJcSQoWREwA
	 C9wwyRnnVS2RXvpJPemF5QuPaDMozpph6UWzZYTJFharDP0KxJHs+H+spM49I1Dhi6EMg
	 bcHoXKEE/wsNYevjF+QCHD4w/GBLcduSoW+hVG/a4LYRuvhSa3dcLeFtJjFng2hlCkWdW
	 FB72Vz3Had7HZRqkRKjtpmn6uqmOkNfnriAa0/7K5pEaJsf8dCsZAskqzu1ZkWCXPgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=cvG1s5gb;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12784606A31F
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 02:18:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12784606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=cvG1s5gb
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-35c76e9614aso3169394eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 19:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792894730; x=1793499530; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hbo8DF5QYQnx8DfVRTkAJCVVYmLZodegAu826PeFH2k=;
        b=cvG1s5gbfHiVD5G8moVge/qTjD1uhQvvde/bfVQ2hd+sO06P45fqfuPcqTSbedsFxs
         ML8dp4JOatssx4Yx6iNj27SlePfi1sPwSkyX97LReByV3XAQklQJeulbUqw3PVNGQxrQ
         n4lNru1pMxmv2b1uJMCbAWnhBufkQ5riaHOyk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792894730; x=1793499530;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hbo8DF5QYQnx8DfVRTkAJCVVYmLZodegAu826PeFH2k=;
        b=tb5OJFqbsOTWu3GKnTLNU69NIBhiVrk7mnKO/We77B0fjNJdBcjlDNEYpkn3qmfa0y
         yAH2l7KNjDHsoZgFYW3BMa+AvBG2s54Aw4F1i6zZxkEzrrkcaiF51RSeGJP8n3ZfcqfH
         EW7uGnzfX8HQ6zkNbEL2MFUTbE7kelJwR3mA1y0opW05rEZtWYzfckcF94ARVjmFVEDR
         mTfYEaxXXnrzAjJIdDDwcAh5RkTzYeGaZFA3pOcyUMYvNTFZZyJ4Eme/p2Uy2uSpjW7U
         xQmrMKLOXBqsRAcjzhOYZHdtRABokreCUKKWkMZB1vkCsOVxw/jQkca9BIFR0D3izDpx
         QSuA==
X-Forwarded-Encrypted: i=1; AKwUvBwTIEgl+zO+sMQPViv2xA/7TGzBImAnVJrgrDGtFvn5ulRL5DwOu984iWCf9deFiyUrJ8xpmRejwCLqmUQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJeb//Gyvvy5+zTzyKYDOfuqHvYlltB1ptwKUTSUmLrOg6yEehB
	MU3wq9Mkes5yCbLU5BjeBAB1M2N7TkJLEF5BfgclE/0om/ZtSLkfY05gqnk0/5yHXQ==
X-Gm-Gg: AYBFou1eAl94mhDDIKVcT43XE1MEdU8Z7BxuQJcUK1w0bvTFwahN2KeLXzDLIn3MH8T
	72C0MT5IpJJfpRgDDHhAJ82BMRF/km0V4dwVsaIKA1b3eTj4ASeg81dcS3l3+/IeuNut+K83h3j
	J0cRyjCWffWfcmPQAMXkdw101EI+TQ8VMTonArtPb3SVtb2n0tt5TgXbcQ0B/iVBXI3fySkHUwb
	+epsiCV0infe2MBH9mREnNEqXCT8FxamZhPYbIpBO4stmVaYaXTraKXlCrNQHNXjAalNNeXbegD
	4ZEzH8b4WAoLUc54LOJLKONzWD96uXNltdSgCX3KwlZVV5StjoTR222ywTZOZ/J8HD3eHlyBYP+
	NgfdxXI6RV8JmpZtQHgkWjHFR4G4o+/rJhmMnnLlEuQ9MQx084bgDMVM57lw7kMm7ha47CMQVBO
	wcVCOs4O4OoIJr79e1xZ8KF0AdGv6spMbSDL5/vI/8CbBEGP4bg5eDdTAQp6fYkFZHi24XyMaDR
	WFMlZZqDqtpQG53XXI0N+VwwFw0FMsqHfwtGIcmoR0uf4HWUM+awwPAqcqt4jPRdZtE3cUbQG3W
	WGK+wREOOD9zDNuDfCfPs3uPHTMAeqSQ9Kkii/jblMM5v7i8dyR8yNoDVMYXVrFeYB28PH72FdQ
	jflZ7PFaWCOF0GeqAaQ==
X-Received: by 2002:a05:7022:3b8b:b0:169:9f67:a91b with SMTP id a92af1059eb24-1993505df87mr5872389c88.12.1792894729886;
        Sat, 24 Oct 2026 19:18:49 -0700 (PDT)
Received: from tigeriii.tok.corp.google.com ([2a00:79e0:2031:6:9f87:66fc:8c85:11bb])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1989ff2ee5asm10387242c88.8.2026.10.24.19.18.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 19:18:49 -0700 (PDT)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Brian Geffon <bgeffon@google.com>,
	Barry Song <baohua@kernel.org>,
	Bo Zhang <zhangbo0325@gmail.com>,
	Minchan Kim <minchan@kernel.org>,
	Richard Chang <richardycc@google.com>,
	linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org,
	linux-mm@kvack.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCH v7 02/15] zram: remove debugfs entry on init failure
Date: Sun, 25 Oct 2026 11:18:18 +0900
Message-ID: <20261025021839.1542805-3-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.56.0.257.gf7497c7d27-goog
In-Reply-To: <20261025021839.1542805-1-senozhatsky@chromium.org>
References: <20261025021839.1542805-1-senozhatsky@chromium.org>
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

Do not leak the debugfs entry when zram_init() fails to register
the block device.

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 drivers/block/zram/zram_drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/block/zram/zram_drv.c b/drivers/block/zram/zram_drv.c
index ab064c84b092..593fa4ae47c4 100644
--- a/drivers/block/zram/zram_drv.c
+++ b/drivers/block/zram/zram_drv.c
@@ -3297,6 +3297,7 @@ static int __init zram_init(void)
 	if (zram_major <= 0) {
 		pr_err("Unable to get major number\n");
 		class_unregister(&zram_control_class);
+		zram_debugfs_destroy();
 		cpuhp_remove_multi_state(CPUHP_ZCOMP_PREPARE);
 		return -EBUSY;
 	}
-- 
2.56.0.257.gf7497c7d27-goog

