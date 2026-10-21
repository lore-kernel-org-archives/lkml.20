Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792555584;
	b=W3o4vd0IGoQYcbKUECjs+3glFEMCHGUfNaIQucjMLuVSDpMlSani/FP6JMxwzHozddtA
	 VjKs2bG0zXSjjJyVDHgy2IwZxE6Mn/gnj03piQEQU6sHbEQTwlqqMqLpDeD8JfK7u3UEi
	 xg+I7qEtVzLy2XlkK20jEBuZPceZ2EMjU0KY9f4HV+KVkaaREQqNxe3TVclXGeTz94lHA
	 OifeWr5b392wLN1L7XNmnpKRWp/kKVwP8hNDu2sT9joN2BB8G0LLBgrfBgOsZdw6jbNEY
	 Rw71SfTStUye9mwNIcWCTCtN7lUX5lbramJJE1FQaWuhotuzvJ8mxpjTndNxDcjWslg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792555584;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=ZjazkZwP//tIu4UQiMntOSVxBKhC31LgQF0W/o5JOFA=;
	b=n6OQJJpXjBvnUyWfJCoz85rH0pXeRTLl4fx5kpn7jgF3xjZDIp1tXH/MJUzluv9eZN4O
	 LJhhnm9Rl7eeerleRDP+z2GvXk4cqHq74E3kJ36VQhczdUApEr2RZ2GgspphdIhDmPAvb
	 QeuI7BtehN5s4Yu025094CceO/I66eIM1j0gEoVeTqH6+kyadED3ab00KL5Aao9h488LO
	 qDFDrYvDY/yjWCEfh2Ri/flhcD78MLhrZMbYkQQaHZlE5ooDHBu+kCdmRLeBX1YVZoYtS
	 N5MVf0kgQGsQxKwLxduDGlCLdn3JNKWNqotTDK6Tq2Xg56Vv4sbZQ2cxTbEbanZonGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=jUZwhXzA;
	arc=none smtp.remote-ip=209.85.214.198
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAA42606A332
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 04:06:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DAA42606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=jUZwhXzA
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ea446ea8c9so2382065ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 21:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792555583; x=1793160383; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZjazkZwP//tIu4UQiMntOSVxBKhC31LgQF0W/o5JOFA=;
        b=jUZwhXzAIqW/3B89QT7YFMdnfGPqNYd2mgle2ZmJ+WczqnI1TmMyBpx0RBCEBRz9xc
         4guV/oiklfCjo9nSNJ3pXW1PFv6oGnQcfiu/6NzmSj/5vIek6f3PPEjE04eqFkoUvbsb
         1Sk5OvpdLBTrZWYkgnONNyc6rkEYJXrzS0Oo3wBLVwK0iTz97GAvhYw8zuqb5R1SUNUZ
         +Kr2IuKgtRllOXVvOS5pr2Wvd5tpPCJnNUZBJv7b+iq3aB8AMUGEn3t7lR5Is1kWMF7w
         Yri6b/Kk6CBFSJ5KMu779Vw/vOFTidjEvnX6pAwKBiaQ4fyWfduFL1fYWzJbRwN9ihcq
         Q4bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792555583; x=1793160383;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZjazkZwP//tIu4UQiMntOSVxBKhC31LgQF0W/o5JOFA=;
        b=PEqyDhWXryFMyvnuPtHih/pqmANc6IAkZdkBX2hBM1kLVgk3VxyHoond/4F2T+pTdN
         uwrTuK8OreedAiYzTdEaaxEYrUNJiXcRzdBcdDrx1zW1EkZ3k/6r/nX4uTMF2l+8o2lV
         znonu2ay/8LjKlRyyK7Y6AohbQCRaytp1Elxo3a5ocwSR5jOVJEbGDDfSHKb9b/N5w3J
         r00YtxF92PPE7kGT0YSwA2ZCZu4Pjz24XT2rz0ralB1b1OHu5EZqm7NC0VgSrvvgDkZY
         4Y4eNEbbL/p+jYcQfUUf97uFQ9Cxph4TA8SxngGUyWmID0JJI9sxnm7du57ebqTnbk/D
         bkBA==
X-Forwarded-Encrypted: i=1; AKwUvBxteBq3ZHl9CBvRV1Cx3L+2e2ZL40MpmE7PcZ82CpkwDpGtQIJ80Qnj9oLkA3VHi6wL3+iz2GQEXGBa+rE=@vger.kernel.org
X-Gm-Message-State: AFq9FYK/oPT7a317EGhB1nGaWaclpMY2LGhGNThZIdAPuHGNgS0anm0s
	f70+eUCrL6Nw8kAZfCWPFTxpV+XRhPuU9ZN4P5cPezePITaKxVAs5CInpg2/MwnWUTzH5i4I58T
	yQUBplRcyFhkE+qi9f3Tg2g==
X-Received: from plbkh8.prod.google.com ([2002:a17:903:648:b0:2df:6366:11cc])
 (user=stanleyjhu job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:324d:b0:2e9:528c:b9ea with SMTP id d9443c01a7336-2ea43dcd6c1mr5259055ad.11.1792555583209;
 Tue, 20 Oct 2026 21:06:23 -0700 (PDT)
Date: Wed, 21 Oct 2026 12:06:15 +0800
In-Reply-To: <20261021040615.3566831-1-stanleyjhu@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261021035450.3488805-1-stanleyjhu@google.com> <20261021040615.3566831-1-stanleyjhu@google.com>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
Message-ID: <20261021040615.3566831-4-stanleyjhu@google.com>
Subject: [PATCH v4 6/6] scsi: ufs: core: Do not release a reserved request in ufshcd_abort()
From: Stanley Jhu <stanleyjhu@google.com>
To: "Martin K . Petersen" <mkp@kernel.org>, linux-scsi@vger.kernel.org
Cc: "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>, 
	Bart Van Assche <bvanassche@acm.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Bean Huo <beanhuo@micron.com>, Peter Wang <peter.wang@mediatek.com>, 
	Can Guo <can.guo@oss.qualcomm.com>, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

In SDB mode, aborting a timed-out device management request drops a
clock hold that the request never took:

1. ufshcd_dev_man_lock() takes one ufshcd_hold() for the whole device
   management command. ufshcd_queue_reserved_command() submits the
   request without taking a hold of its own.
2. The request times out and ufshcd_abort() clears its slot with
   ufshcd_clear_cmd().
3. ufshcd_abort() claims BIT(tag) in hba->outstanding_reqs and calls
   ufshcd_release_scsi_cmd(), which calls ufshcd_release() for a hold
   the request never took.
4. When ufshcd_dev_man_unlock() drops the hold from step 1,
   hba->clk_gating.active_reqs goes below zero.

Release the command only if it is a SCSI command.

Fixes: 08b12cda6c44 ("scsi: ufs: core: Switch to scsi_get_internal_cmd()")
Cc: stable@vger.kernel.org
Link: https://lore.kernel.org/r/2060a8da-581b-46d1-a510-779f4df716cd@acm.org
Reviewed-by: Bart Van Assche <bvanassche@acm.org>
Signed-off-by: Stanley Jhu <stanleyjhu@google.com>
---
 drivers/ufs/core/ufshcd.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index 4f9b34c1d112..49a981b8cc32 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -8239,7 +8239,8 @@ static int ufshcd_abort(struct scsi_cmnd *cmd)
 	 * Clear the corresponding bit from outstanding_reqs since the command
 	 * has been aborted successfully.
 	 */
-	if (ufshcd_clear_outstanding_reqs(hba, BIT(tag)))
+	if (ufshcd_clear_outstanding_reqs(hba, BIT(tag)) &&
+	    ufshcd_is_scsi_cmd(cmd))
 		ufshcd_release_scsi_cmd(hba, cmd);
 
 	err = SUCCESS;
-- 
2.56.0.212.g129ede20d9-goog

