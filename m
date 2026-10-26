Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793028444;
	b=UVy+Pm5IzLaGC8AIrwI0Dmc82aKuLpZtTG+o5pf2ZnG5vNTKKgz6hTk2DieRSo2KAeNN
	 hS5Q7fqOyQ1ayqq/9TZLCcsLh5cyFvL3CfvHLNqTdEUcSdPRlOgelwmr4hanRsOgVA9O6
	 3BjfauHJSj3W8aGNv0lIquCaCBMt8hl6KbkgJ1L4VC8rcyvatcm1RHc2EiB160Lii1I8Y
	 h+3qeDNL9wMGOZ0GnmxNbFp91mcsdJpuNv/+O5QRDNVByIAQWYmvrpLQR9M8AAkjNPCVX
	 l928bw8HMIlnQ0ZhrBKMB5cDLF/PoN3g5XELHn0gz/ekYuRbhKC/Ab6ENPPIUnWIh4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793028444;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=icXw5cUiWlz5rWfTUQ0wOJr2LvS5fa2INLJ4qgOPSMo=;
	b=L6CV1IMvozh72flOJq0Miu1vNFI8cyQmU2o4Ew5752LY02emvujQXBZKy3mVbKuW8Fvh
	 2Vuk621mBNBQNLeL/+cW5JrCUCaxOzMQWVpHIMvOPHo70uxp/Rq6fP56ErYkO9Jl9lbvi
	 Shp2z00wkeIWuUsEJhSgs6bnsNftqbURVJyv97xqSdyn7lfcQOCFoW7Dhh4XhPOUwnLY/
	 uL+S5fwR9efmhqKSAV5HtromIIDFwt/FNn054DzfIFD5mQaB41Ov+rSZTjhxYUgEbbssc
	 WKkzOPexC0Chwka5eyHTA1nEtuxaHZK3CFnxLHNJ12LH6qjayAnpz/aD4B/0nF8K4bQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bfsCPrwm;
	arc=none smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D075B606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 15:27:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D075B606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bfsCPrwm
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2e8246b13cbso27780745ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 08:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793028443; x=1793633243; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=icXw5cUiWlz5rWfTUQ0wOJr2LvS5fa2INLJ4qgOPSMo=;
        b=bfsCPrwm+ad4L4mOecEHO/1R2ve1iTljR5+QR4t0AqvyTBRIQD4Mfibr3x4ot/3eeq
         wpoU5e1PgwnA8c8fizuSC5ZjSK3A7UZMBujw0ALSFHQXwzvbblh1MkzlXARBAUFmO3fF
         u1Erz+jTf1JyqpEq77jeELaRzGmrAhSsAR8cZ9FPl/jUWGTsvTfZHG7UZ4O6PRE3WwTr
         RiWy57QzMtL32Cs/vrieWxyluqEWuKkWZF133QVLLSyiOcxQ1T9p6mkBgeXD/GcU4FbY
         6xcTAdmHWBJIeIgHuZJIcnZOhLSKPYFO5dIrOmpU6AFsP6CUJwFesWyW1MWgy9QaDmRN
         FOeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793028443; x=1793633243;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=icXw5cUiWlz5rWfTUQ0wOJr2LvS5fa2INLJ4qgOPSMo=;
        b=kGuqSsBpAAnaKwmUixesy7N1d/03p5tzCqu8GEVWRDWMVal08eU+865T1QaMmiuXvb
         RtO6YrB+IUaH1JzkT3hPLIfYF27SoIuVqLCJzKaw6sbGMRuSUMjZNcEI83KLCMXltPy6
         rWBf7I197Vwq7vq/ymRDyvJxhh5yVeLLhJ/aZQ4SFxlA84FT5VjOI+aW+sW0Tixc6AzF
         5CdI5Hlg5rHr1+SMJcIb+pj1I3M5mzTht3L2lbo5J2i4U0XDDWoqMbbyUnJ/Hr9PlHh/
         7e3zIQb/9ElDYax3hLW/se8OrMh3YyhqyWFdTFeu6BLF8LPLb7/qRzB72ScWzXzRisUK
         BYDg==
X-Forwarded-Encrypted: i=1; AKwUvBxU13I6t7kob4tCZjoZiazysQ92ylRaFFZpJtM4eTE6p8JwBMUXPowi1FCy7/xyYk81ne7xqikY36qIGDY=@vger.kernel.org
X-Gm-Message-State: AFq9FYISOaHYgAnSqWq3iQjOUWggfzKB4LKVxwIWLNfCd5jSjuGXIiMP
	G1eHK64X5PMVD0HgSKXQZ7BniFqyFHScYiw0FS/XIzbK/o+rxMWwX+Mx
X-Gm-Gg: AYBFou35SS4JDEqRAX/jws6+3UjPZ0xfWSnc0DtBTByYdeY0KA4Bn0EEMqmzcsyD4eM
	c+8rmM8BPcbNYqXHyq8PXan63XxRlMlBJbYN1AyTNi7DrmGeSAT4oWh1wwhVM4mzhCYXTNA1ppn
	ET2p/nC3RBpVGoOSaoxNoAn60xNLGyiARSQspe1+HgsEnNhPNySQ6UPqGDQk8kkPKVmK8MmpyHy
	HUSsigrfAvz7NGqd4ofobjLxd6gowWYWawmpx6M5FwGzCrnDCkArJjVMFiDkAkf8YUatFlV1bVb
	1P2zxWvoOSqgDhnFFPKUuGN/O1WGGeAehfCH5djiul5D3Anr+7dbobkPgHuSWxANKv2yJMrEuql
	QnuxfyewDF67KuzxpVuemcSaFVlOBH9R+AtnAYLHyUksopSRuLvZrWlGSTvMPfe7LFAgtm9rJJ3
	711OpvcZxFEwg7g7DP6iZ14M2HXIS6Zq//Ba7BJFALfG/1Ajqtrl1kMr1ykXztOCRWJNxLq8MxN
	neV1lMibldd/MT0deIzZr8+C1dFkg11qQkP8Jffoqu7ld3UjtPxVySzqemjs0QkH5zWJlaVZaej
	fU33Dh3JMi/BvBchMxtsYQ==
X-Received: by 2002:a17:903:234e:b0:2e9:7ff5:545a with SMTP id d9443c01a7336-2ea9c67c29fmr66184465ad.32.1793028442579;
        Mon, 26 Oct 2026 08:27:22 -0700 (PDT)
Received: from KRHW1CJW23 ([139.177.225.224])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea9af32085sm18713105ad.2.2026.10.26.08.27.19
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 26 Oct 2026 08:27:22 -0700 (PDT)
From: Zhao Li <enderaoelyther@gmail.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] wifi: mac80211: fix use-after-free when MLO link setup is rolled back
Date: Mon, 26 Oct 2026 23:26:54 +0800
Message-ID: <20261026152654.80697-1-enderaoelyther@gmail.com>
X-Mailer: git-send-email 2.56.0
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

Rolling back an MLO link addition can free link containers while RCU
readers still hold pointers to them. ieee80211_vif_update_links()
publishes new links before checking for duplicate addresses and calling
drv_change_vif_links(). If either fails, it restores the old pointers
and frees the new containers without waiting for readers.

During a non-MLO to MLO transition, the published link 0 replaces the
deflink, so existing link 0 users can acquire the new container. Readers
such as ieee80211_csa_finish() and
ieee80211_obss_color_collision_notify() can also queue work embedded in
the link. If they queue after ieee80211_link_stop() cancels that work,
it remains queued when the container is freed.

Wait for RCU readers after restoring the old pointers and before
stopping the new links, so their work is queued before it is cancelled.

Fixes: d3e2439b0f33 ("wifi: mac80211: fix link manipulation")
Cc: stable@vger.kernel.org # 7.2.x
Signed-off-by: Zhao Li <enderaoelyther@gmail.com>
---
LLM-assisted source review and patch preparation.
KASAN test-tree harness: pre-fix 22 reports, fixed 0; wait after stop 22.
Sparse, Smatch and driver-failure testing were not run.
Older affected kernels need an adapted rollback hunk.

 net/mac80211/link.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/net/mac80211/link.c b/net/mac80211/link.c
index ce1c95b40cd9..34d313a2fef3 100644
--- a/net/mac80211/link.c
+++ b/net/mac80211/link.c
@@ -401,6 +401,8 @@ static int ieee80211_vif_update_links(struct ieee80211_sub_if_data *sdata,
 		memcpy(sdata->link, old_data, sizeof(old_data));
 		memcpy(sdata->vif.link_conf, old, sizeof(old));
 		ieee80211_set_vif_links_bitmaps(sdata, old_links, dormant_links);
+		/* drain RCU readers before cancelling work they may queue */
+		synchronize_rcu();
 		for_each_set_bit(link_id, &add, IEEE80211_MLD_MAX_NUM_LINKS) {
 			ieee80211_link_debugfs_remove(&links[link_id]->data);
 			ieee80211_link_stop(&links[link_id]->data);

base-commit: 6b4b543fa18757297ac756a6fe6e64f506b7844a

-- 
2.56.0

