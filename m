Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793718928;
	b=q2niQhlnx+qKat5mmwayfGWSQpygb5gwUM8F6kAy5J7SQRxUdmqORbKM/r4xSQh+nAAi
	 VqeQD8R//A3haTV5jPOYW3vhTSREwLVnYyio5wEuhDLeB24vkjsOLDZ7emwO15SO43HW4
	 1w1fUPWfBgePO3HIBhLKqtoOHqEo3jkQ87muLttguE5gw/KjnAmR+D631HBCAnv1brf1d
	 Hw7hejAn3HwL4Um3S5Z1fdcrZGDs/cx4SU8ZJtwK8xVmCN4DLpE2hrx29ap2cezz39Z+D
	 0pAt+6dEbGdIcXMwmuQPblj6FAKlJtlwZWM4VLcQjQDj+Zeknz8aBm92JuTrEldGHLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793718928;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=kUEp7xcckn2qvmIvpQkkjMCZNbl4CYX1Cj+7Vm+f2qE=;
	b=slXm8p4QO6PoNvG34wt9FkFSq7DtNVC4LwQmMiVbRwjauWUDsw/HRaG+0tgE1hO59/dl
	 Y2yn0IWYNQUMhwRTrtKM2D4PVmg8nWFHw4MmTAsmoCGuZZL3Pf9aR8B1RZ4H7378xWqFb
	 r6JDuXwnMeeSDu1bxJww6Hd7kTHD94Nbcj0wyc6bN/x0XUlx37huePD6C+EUaqVWF1m/U
	 rr/GkfFlYuu7dQ9rYbZWSUq4IJujWLl744xnhoq5DSX90N/Ltzsugv9mBM+A4Kmj/g96q
	 uyv6Gpx95JXkcYXIrSnDH/n9lxlG66JM9RAc//j9kNJ4h0BkM3zlMM91B/yU1+0LN4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="f1P7qGp/";
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60A47606B24D
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 15:15:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60A47606B24D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f1P7qGp/
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-15ea896ddc8so7260949c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 07:15:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793718927; x=1794323727; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kUEp7xcckn2qvmIvpQkkjMCZNbl4CYX1Cj+7Vm+f2qE=;
        b=f1P7qGp/VPb8FYhFPNCgmeBR7hj4qmf0ik8MEC98Z+QsHEDVHzRoEOecjg5i/WRsg+
         iod/iVXbNzBiefD/u5De8/a8A6ciX/upi6Zz2HpIUxLK9LSdjmU9R/ayVaf/m1m3rLIW
         sX4Pd0jbzY41A99ZXdIUeh1T+nEjToosG14vOQNsL4lFOe9VQntTN/C86SW0mi3CtpY3
         es6ID0o6wRBo6s2uqLIPCFHJ/PIa5098Iso6qPaj+MzkSAGVcwSuBWLU1BEMoUUVeabD
         JpxgcxrKT3rQf4di09+M6Cl2ih0aucIZuZtG+4VReQwT6f9DlbLEQupSOHhdpgkYLFxb
         IWlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793718927; x=1794323727;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kUEp7xcckn2qvmIvpQkkjMCZNbl4CYX1Cj+7Vm+f2qE=;
        b=RbEexhkAM561WtQBb+cs8Cn5YUk4gXaRRCmjn1EhQO/um4aox23kxygW0+wGxbO0bl
         pZn0u0IuG8JwEDH79bKUubKd3+2YmfFYQxL2/r+KiyMjbLyu23HE/W93/uMc6hlMJEJ/
         eAmwqoD2il8dZjlU7yi0t2Hf6ZAxYNl0keqRlID0YhwiDaNLi+W8+lDeqhlqzcO6CVUN
         neZ1TQRXq7Pysq8UXqo1yWtSbzbW4M2M2Hvp2wSB5tZFD1mHFLA6zrOhMDeQqoq03VDR
         C7ZRD+/LOvYEZLjVHvD4jqR5d+t8Z92LSH5VYjbiPyqU49oBrCB+fxu0jz8LvF2YpU4K
         PSKQ==
X-Gm-Message-State: APuU4Z/iNse4sky9l74F0tM9KjnZQCLqqzmZGFyDCf/gmElnBli6PHCL
	QNTtKvCuOT6P45ZRhEIrR3PZ02BX/3wQXRTRhQRlFcZ74/oHdiyUOHHs
X-Gm-Gg: AYBFou1DwkDKe3NMufDEn0uXDPgKvbEWf29KKMTNubO6CjvF7E7OJLFGO2eveW8caGY
	D+rQkhWaRGrVI1VshLmH8tr/Sosh8T0Wd3K3xOEcOt18dPThYrFX+VHVkRV3DrUoLcY8EWdpVdp
	uvky2aMTbD9lJFmzPW2vSfkFeZblSMtgRpJmv9MUKwSIBcw3DlmmvqJrc+caalR9gsvuU/WzMTx
	yDcx9J8c0FFXHPv5xgY+J8q4d79VFvangesChB9fiIPqX2pCUvFZxFpuQtKc5TBKeW6jld1gS2U
	UcSNZKDyMzbUxiuRr2k+ET9L+8ZwHBSXy/lkR++PPkeB/zkKlbBEEHhwhKFhZHlIcQnZO8tOqdM
	mZuB7AKwjq5xKfioPWzMMhqvcHkcbMVCZ+pq9pExL5lcMTk5QfmVHuRiaSUdGd/PqkMWBM5KFA3
	d8B9nSXQ5n2MYtrYr8htgvoTTQqQ2jSXi7f/+IKi+d1TInHwaxRG96CKZ8EC77559JWdU2YpnVL
	EJDEthm/3YHwoocdtsalkxrWytNsi7949/cU2OteArYJMw2WkpIJlAP5wr2bIO/pvgrpbxsXHn/
	75G8/S2tWMvJmGMNRnjxxnxp4fQ0hhrtiEmMo2ayDvrXEnOmqfw=
X-Received: by 2002:a05:7023:903:b0:17f:7280:1332 with SMTP id a92af1059eb24-1ac5c92f6e4mr22369389c88.40.1793718927329;
        Tue, 03 Nov 2026 07:15:27 -0800 (PST)
Received: from localhost.localdomain ([103.178.205.93])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1aed79b3dfcsm47518860c88.12.2026.11.03.07.15.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 07:15:26 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: o-takashi@sakamocchi.jp
Cc: linux-kernel@vger.kernel.org,
	linux1394-devel@lists.sourceforge.net,
	sreekuttan2156239@gmail.com
Subject: [PATCH v2 1/2] firewire: Fix out-of-bounds access in CSR iterator
Date: Tue,  3 Nov 2026 15:14:20 +0000
Message-ID: <20261103151421.7248-2-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261103151421.7248-1-sreekuttan2156239@gmail.com>
References: <20261103042408.GB1229640@sakamocchi.jp>
 <20261103151421.7248-1-sreekuttan2156239@gmail.com>
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

The fw_csr_iterator_next() function reads ci->p before
checking if it has reached the end.

This can cause an out-of-bounds read when the iterator
has no more entries.

Check the iterator position before reading the entry.
Move the pointer forward only after reading a valid entry.

Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
---
 drivers/firewire/core-device.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/firewire/core-device.c b/drivers/firewire/core-device.c
index a68100d3da0b..36667841ca3c 100644
--- a/drivers/firewire/core-device.c
+++ b/drivers/firewire/core-device.c
@@ -40,10 +40,14 @@ EXPORT_SYMBOL(fw_csr_iterator_init);
 
 int fw_csr_iterator_next(struct fw_csr_iterator *ci, int *key, int *value)
 {
+	if (ci->p >= ci->end)
+		return 0;
+
 	*key = *ci->p >> 24;
 	*value = *ci->p & 0xffffff;
 
-	return ci->p++ < ci->end;
+	ci->p++;
+	return 1;
 }
 EXPORT_SYMBOL(fw_csr_iterator_next);
 
-- 
2.55.0

