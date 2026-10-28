Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793168197;
	b=ez+aUT/XrGIj7CbBEjF6ozzMrGA2pEwxfqub2n2m8BRMEiE8SLYla3LVfgGCgrrrXInw
	 qdoVmMoQKhKYpj744MdhZZXyXe7IRLXbVRCMGfcHnV5wcCpguKywyV5ic6VReQLerNuBf
	 jYVEUtfGO6UC7sVgf9nDXJmNFi9Txy+CA1SCpB5QVUbIxtLP/OyfjGDjedOZgO/NThO+9
	 cUajN/So9SPOn3HuM2HirDcoLlXLRyl4qfX2wvFKoWw/MLA8bh89/SQjf4OqY33UhZfAD
	 aqKquIuaRbA4AwDT1ExNEOVH7rDFAUzvAMmXH1VEnAVvFytIduvTGgFB1EKFBhBpAGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793168197;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=9R9LaBRh9udXMBlJBNWQe1InqKAXJ/9+XRSXSIVZido=;
	b=maKQ7z+8VX+vQO/NwOsHthMf0z4qEDItykwmZcWvONvfEVX4RKDtSLoXR0gY/Tc+ySdg
	 fymULZK+5V2CAOY9SPKb+OGbwkDoKebocOBxq6wIrfvV4YiCYSvHyrsK0hA5h1ypU82ia
	 vMP9artGTz+W7Fu7i0aD7AfT2brKSR74CbZy9LOOQlECBRQhNJO1myOEwpK/mPZYWcuG7
	 ot72rI44Ma+KvsjyRdhv3EUdzee+WZ9aCAg7BGo+i7qQrR0qHpYnstCEkpG7RexMsGePK
	 lHfuyE1o0RySsuiHfmuiHPlgEmkKtEvehhWTYfnIvAuOTVTC+TIwVhE6i7uxWdpnogg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qL75CXXS;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE312606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 06:16:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE312606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qL75CXXS
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3ae0852df46so498328a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 23:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793168196; x=1793772996; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9R9LaBRh9udXMBlJBNWQe1InqKAXJ/9+XRSXSIVZido=;
        b=qL75CXXSLAU/Gv2tLrwqvQXPx4mu4GWPyIo9Q1zgJBv85dLOVQzwja3aT+nCxp3GUm
         8X8u4UylayMON4X/Kgu2lHWAB2MwBylTV3UA5khPFMl62Ukuv3Bge+LBhjqYP4Js5L8O
         ZhZETSZ4kfYzJdQ2V0177tWGB/K3S7HavVD06xvtKzVXOkgUejx4C8HO+ElqiadTmQuy
         pzAmR4utmFQ8sNiFITD5YKCQFHKGCvOAoB3ltnvQ3st19NO6obqIVr9J3hnSFs6j2J4v
         2mC8pEGgACy1uvaN8XVNcLuM7BOTHFprhVwT5MQEaUBRaFnObKL9qmWYdG/tGFAwPF7G
         jViw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793168196; x=1793772996;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9R9LaBRh9udXMBlJBNWQe1InqKAXJ/9+XRSXSIVZido=;
        b=WpnORWI3nb7BFMm8O3LPotPn98Wtdj+2WDdnmRgw5yTWOktE1uO4vjvXA5OsKupmEb
         wYqmEv6A0HkI2Wr4mwI9rGJJqGxpNeGtgqxCGkNWPlZHObgvRVcKB8dJtpgRwUHe5yqn
         o6oDLTKW05Vv2BbTTCg3CayIeM1eBxatWwhhWZEsaW+hp3KNFfiglktoNOfhe3WaMKZo
         2CQQJeNg/V4/RSR76czZkEcQescUJOdBLyXxONx92u3kS1xBro1Ij7d5bqCQ03CuLaau
         ghTUiou+c6deJhm8qmyGcuaVy9fK3+nd/XqnM1tgj9VNS/m3n/C0WPXuYtgIc94byNkZ
         ltVQ==
X-Gm-Message-State: AFq9FYJW0fzbXUNAqAVM8r3KMTakAHsLSKsugRFOTxwwvUHyJmfTLnlo
	3ofLLWzbUuF8QSSdSTnWhIDvkr+0EPmumjyWAa0N4OqdkARU1+muuVOs
X-Gm-Gg: AYBFou0OGTDZmGRglBuSTo6PaoZQ9x+y15OKEOtbgY/1J52WIkifUZ+oAhBTHWF89YG
	ujG4wM9xBxBx6XAMkRszROw+zbv2/TNwwirtucV9UWt/YB9QyavkFJEmJB4w+TZPXEUP9QENvk0
	nLtQybVQj/WfpuhYaLQ30Ee8ldbDuMoacY/uohfus6RTgJ4KzA4GSl5Xef0FcsUjwEBvNOpnsRE
	XEp5ge1rpnHE/dfu/p7mOWqWBn3uT4hb8F9TFGyJm2YmpvNcoCm8PfeXB7v3QqWOQmsP6D3Vbzz
	Q6zPtomuSH1BzpuNCLGXcliLScEl+PvzXpPCZ3GB2XGtTaVHqx0/obxQP1gD+gkZnhRz2ybcR5s
	AsUmhpI+yEWh5WHoNdNBvz4sOZSI45ajWXHPL1MsMrxLlPT3rlhh//eK1kx9Ou9YzDLphocNTfP
	nYfE4X1LLuw1UXzANvLPeh/EBTotydq783UkwWnOFr2AtFg9uiW5aNd0DyoRP/Py0DedwJ24x3G
	PqNqXCCawk+9A7HZysHPYp4Nm7GBLy3CRqgmu6vseVO0fOkSKFrlHkFw6CIGBZuQdig2zcCuueo
	tBCp0Spp1nYwDSLB+JlL5Da49lLYWqdv+tHzHoOTAxci+0hKkCh+gfkQXuUGjk9x9g==
X-Received: by 2002:a17:90b:2ec7:b0:3a0:cca0:4a8c with SMTP id 98e67ed59e1d1-3ae5c6c4568mr318608a91.7.1793168196136;
        Tue, 27 Oct 2026 23:16:36 -0700 (PDT)
Received: from localhost.localdomain ([14.116.239.34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a586662sm1433996a91.14.2026.10.27.23.16.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 23:16:35 -0700 (PDT)
From: Jianping Liu <frankljpliu@gmail.com>
To: tytso@mit.edu,
	adilger.kernel@dilger.ca,
	libaokun@linux.alibaba.com,
	jack@suse.cz,
	ojaswin@linux.ibm.com,
	ritesh.list@gmail.com,
	yi.zhang@huawei.com,
	frankjpliu@tencent.com,
	linux-ext4@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] ext4: fix soft lockup while shrinking the extent status cache
Date: Wed, 28 Oct 2026 14:16:28 +0800
Message-ID: <20261028061628.1209508-1-frankljpliu@gmail.com>
X-Mailer: git-send-email 2.43.7
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

From: Jianping Liu <frankjpliu@tencent.com>

__es_shrink() walks sbi->s_es_list and reclaims extents from each
inode. On a non-preemptible kernel that walk never gives up the CPU.

There is a soft lockup report on our company's machine. The machine
with millions of active inodes, 256 CPUs, and heavy memory pressure,
concurrent shrinkers run too long.

i_es_lock is dropped after es_reclaim_extents(), and s_es_lock is not
taken again until the next inode. Once the shrink has run for one
second, call cond_resched() so the CPU can be scheduled before the
scan continues.

Signed-off-by: Jianping Liu <frankjpliu@tencent.com>
---
 fs/ext4/extents_status.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/fs/ext4/extents_status.c b/fs/ext4/extents_status.c
index 018b6146b9d8..c9c70db5eb71 100644
--- a/fs/ext4/extents_status.c
+++ b/fs/ext4/extents_status.c
@@ -1679,6 +1679,7 @@ static int __es_shrink(struct ext4_sb_info *sbi, int nr_to_scan,
 	int nr_to_walk;
 	int nr_shrunk = 0;
 	int retried = 0, nr_skipped = 0;
+	unsigned long end_jiffies = jiffies + HZ;
 
 	es_stats = &sbi->s_es_stats;
 	start_time = ktime_get();
@@ -1719,6 +1720,15 @@ static int __es_shrink(struct ext4_sb_info *sbi, int nr_to_scan,
 		nr_shrunk += es_reclaim_extents(ei, &nr_to_scan);
 		write_unlock(&ei->i_es_lock);
 
+		/*
+		 * Call cond_resched to avoid soft lockup if a kernel with
+		 * preempt disabled.
+		 */
+		if (time_after(jiffies, end_jiffies)) {
+			cond_resched();
+			end_jiffies = jiffies + HZ;
+		}
+
 		if (nr_to_scan <= 0)
 			goto out;
 		spin_lock(&sbi->s_es_lock);
-- 
2.43.7

