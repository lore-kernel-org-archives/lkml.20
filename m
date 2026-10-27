Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.6
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793121487;
	b=OPM6zqhkbEcTJQfVto0tgOg/o4kHIQbyCvUt4e8bQmEDeeJ3W47yB4TyWuCAvEZ6AaNV
	 yRLx7pBXTQreOpp/X63ktUn5yN6wckXdDg8R/NKunFYjrSfW1sHwHrINvPPscuIPrfLjJ
	 NWDd/6630+t7QZaPDNtY6lKLMCTKkcEUMQhU8jeGFXQGDNHXU5Ln3VnoJ2gK6IjcDKrLr
	 i5lwPRxGn2JaJ1Vp39pPy1oHg1qz/OZQdLdYiTX6mx0cgP8AXC1ah0bHHWUhTookXLoaC
	 ZHwkETwwiKGZnVHVIItr8mbNTzn7oeQN97ChAt7SFYgZYn+w2iL3g64KtnSPiwOMbZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793121487;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=DSKe54xygzfIMrfbOu4GT1R3mhAh4FYjH40dbhhZJR4=;
	b=Qp7mZEGf1ufm9V4AxQj+LhZ99ac/K36BYvWemQiy1xVnMRdu+PSQOoNPzxH7RYmR/wwy
	 OcEQcuUIvglGWsmuQD3rKfkpfRcTHcvSL6rf383OypoprBS17ZGexfmFC4+pNxjZTHKUb
	 Obf1/gwYV+M8AX0moedc6VD6dgT+O41N918/oXPIH5bhgFoPJJEJESoimxkrPfhNs0ozw
	 7u64C/VHrvUg5mEHkWEak/YcymvBi3AL5msIoAH75m8Ze5zekDe+QTr05jBPeAS3kIX0W
	 /5DrU4eAIBxy6H5JmaaLEIJ3M4U2/QGU1MmpZgVcCyP+RNp8ANwMJigd+l48P5TOOuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mGGB3j2Z;
	arc=none smtp.remote-ip=74.125.229.6
Received: from mail-dy2-f6.google.com (mail-dy2-f6.google.com [74.125.229.6])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D386606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 17:18:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D386606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mGGB3j2Z
Received: by mail-dy2-f6.google.com with SMTP id 5a478bee46e88-3537f63c9e6so14711eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 10:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793121486; x=1793726286; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DSKe54xygzfIMrfbOu4GT1R3mhAh4FYjH40dbhhZJR4=;
        b=mGGB3j2ZIadP8z8Hwh6RICPXuMfZfmRcsplKh/yK+ZftcWrX4Za+IElKLC5YLM1KFi
         BkUx/Yn37fk8HqGzHrgucBP6uaDlbYMeRffN/m2sWWANNFz7jHS6b1ZKyypGSFc/JRST
         WAdzH7zMtZOLRh4fUCwLEJCwwPuo5Pgd2j+bPQXEcvi4R7ivtpRx759pRALbqZw3xmrJ
         osD+DpjrxX37tkTwa2YW4bAi03zOC8Yf+zACV6E4WAHh9n6TJwTO7OyexEycr9V2F+B7
         mehgcjVU+XmW/6lN/eBIgeKNuJka32239vCkNMT90aQasQBGWUFl2VMUt/jybRE8cO9q
         87gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793121486; x=1793726286;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DSKe54xygzfIMrfbOu4GT1R3mhAh4FYjH40dbhhZJR4=;
        b=2zeUodsHKB4pWpkol/oUD6OoKX4MWTwoDZ9g5+KsjZFhTGAqdhttTCvJ9w68rdIiYQ
         sU9SepsCRrPGSB0fIgPxfuc7+n2BQ0oJiPTRBwXS4CPytwB/Eg0isnAVxr7pxHorcqoj
         TOnKjO+pBBjMff3Ive65UzpRbumBxWCeWpkML/fcnaFmpZXSxBv7/nt2Qhkx/cosSN7E
         h65e4ob3AK0QhTTgB2h93PJSomJIGFUVxks99npR0GY/DKJCNCudaceE4T95ENswAfYL
         WKyNcDa1NRQ/d/qpY9bd0oO8SXTJP0Pb9VldRvdTVOPb9a9CNYHY0KbDcRa63+livbLT
         Kewg==
X-Forwarded-Encrypted: i=1; AKwUvBxARwEWZkaUnX3/D/A1rs3sp9jbRWpGdE23LGzR7Vk60Ho9Or0XMIql+Q5vKudyfMw/PeLlSFK1UjfJYuM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLWBxhQYe5ag7QnINdE2AJdYy2UAoMN3W0UWD0WPPKPEyS8aPgi
	dADmgbzBuBtIB9YokJ/YgevvIBMr1qmNN/5XLXxF0t+cv7dxyYjCX8r5VrYZCJUB
X-Gm-Gg: AYBFou1Z2QdbfWmAPBfkqKDc/VUQ7bYAVeuZn25Lbogt/Kbi8bmdHyap0QRDgBKNwPd
	B79PE1ZxUuqkBGg8b4DRX+nxO1sA2Ena6BQr32989s9o5UhUEfgIW39aE98l7vkEXs8yOp4uTpA
	bcaxBG2CgUc/uGPGYOsAOnfNV4ZqSlz51mKJ+g9H6aHVtI8Wn/lYAcqXJyu1u6nqNsJFLqs8HUb
	PQJ5vljS+S3buFP/6gRe8IdrJAMI2ycJaXovNHmwk91W0RnkY05kZ6ngsRtivF/eTmMpnV6Wc2a
	olB/A856vJitbU7q6iDk0+WoeB9hPOMa1jd1dA5a+CUCJbntSM9EGKFwdkqYE1ySfJjtZkb3OuB
	dEk3jGiHiPkNiRbhkOxzsgiQzi6+p1WLavHVr0oeSAaxW4mTkdKhnnGpHThpzgLt7evEaF5onab
	915K8UZQAsJcAiHFmVaMRO6ZDFHM5E3Jfn3D8mcL4LHHmsyvQJ1xIRLe+2rzaTtlfflRF4nCftV
	mWK4G9oTM/U8OEZkb4rwwr2kVms7k+PjT7/XtDuRmaiBDIFlsWJq2F1ODJkJ1+VK0iaNja8UmVS
	ec3LBDM=
X-Received: by 2002:a05:7301:5401:b0:36a:1c46:2766 with SMTP id 5a478bee46e88-36a1ff47835mr206467eec.3.1793121485643;
        Tue, 27 Oct 2026 10:18:05 -0700 (PDT)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369f4164886sm29167152eec.7.2026.10.27.10.18.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 10:18:05 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: hughd@google.com
Cc: baolin.wang@linux.alibaba.com,
	akpm@linux-foundation.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	dennylin0707@gmail.com
Subject: [PATCH] shmem: skip empty unmap ranges when punching holes
Date: Tue, 27 Oct 2026 17:17:53 +0000
Message-ID: <20261027171753.1485-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
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

When a hole ends within the first page, shmem_fallocate() calculates
unmap_end as -1. Casting it to u64 makes the range check succeed even
though the hole contains no complete pages.

For example, punching one byte at offset zero calls unmap_mapping_range()
with a zero length, which means unmap to the end of the file. The file
contents are preserved outside the hole, but unrelated mappings are
removed and must fault back in. This can be reproduced with fallocate -p
-o 0 -l 1 on a mapped tmpfs file.

Compare the exclusive rounded end against the rounded start to skip
empty ranges. Keep the unsigned comparison so rounding the start near
the maximum file offset continues to be handled correctly.

Fixes: 83e4fa9c16e4 ("tmpfs: support fallocate FALLOC_FL_PUNCH_HOLE")
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 mm/shmem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/shmem.c b/mm/shmem.c
index d97fc32e7c94..08d5336c27a0 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -3864,7 +3864,7 @@ static long shmem_fallocate(struct file *file, int mode, loff_t offset,
 		WRITE_ONCE(inode->i_private, &shmem_falloc);
 		spin_unlock(&inode->i_lock);
 
-		if ((u64)unmap_end > (u64)unmap_start)
+		if ((u64)(unmap_end + 1) > (u64)unmap_start)
 			unmap_mapping_range(mapping, unmap_start,
 					    1 + unmap_end - unmap_start, 0);
 		shmem_truncate_range(inode, offset, offset + len - 1);
-- 
2.43.0

