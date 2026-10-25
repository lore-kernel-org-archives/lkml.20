Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792892091;
	b=oj7BlftgvxVSkJB6kHXQSvetgrSqoP8GpnNsgrVumslNNL3uYj33hwctmmTxw1j8FpPf
	 FBioXcVC+uYXiw8iLy8iepCISJ/j9I5xfsUxr06Je0qZGiBBPrvUQaMBE9uQR914Vs60q
	 zOl5jJ+/WxS0Q5WQpyY+GsW5dSdcyTByiNoUHG8YYNJ3PV8i98dmI6tYGZZ2Pakubpu3H
	 A+LJpb8a9DMY1BjducmLcGWEVymzOJw5EkHeVsHzjxzjvi40x65OCneTKLOR3yN3YKYF8
	 J/oSvjlCD7mCRdGqjvSkhOeaf4+EgduqeC8TYuTj77Rjr/Y3ObzG1sP8GdjzQu1iS/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792892091;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=TbTnRMCBQfYC7ayg98MKoycTzmcskJPrU2RjQTzdnFM=;
	b=WCQOvZAE92n5CKX6dJIvGVqoLJCS8wLsgD6nkPHBOppGvSbRDTRCsXWCBjz4jWcDEtXd
	 3aPebCt2LmPNz437audEIOJRqSjuWL0q9+lD06zWPWjcmclbRAKrwhu+ey3KGjeWEKEdS
	 E8ggdwinHX0rsCstoTK1+pcDuSTp422QTjTVUFtXXY5kAmbr77vpdkskWMqnooflC/oCi
	 D7tYeXyv6llsoPYCnbXTG5hpqXAqor9EXbrP6PYeJw/i2u11fB7a9FRiQb9foWXNClJhI
	 yJyTHdaY9vTXb0yUXydA9BZBeyIwVOlKnqX7r0w9TjXUDJiL6tocpcIKa4x3UCGPTJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b="oV5/SFe2";
	arc=none smtp.remote-ip=209.85.214.200
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6736606A32D
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 01:34:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6736606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=oV5/SFe2
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e869e00005so30120325ad.2
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 18:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792892090; x=1793496890; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TbTnRMCBQfYC7ayg98MKoycTzmcskJPrU2RjQTzdnFM=;
        b=oV5/SFe2NFxYfbRwtu6Y38/yXzEQMRP6yK7JEBgNnKY68YkDw3XsBqiO2RZGFAmHDQ
         5nJL1UFs2QqsT56wZIcgpcpdgA9B+xI+mij8t/izgrnl4YuAno+OYbFTaEHhkD+4JjRq
         r7+pX/yBPpKSck5nQEQnMPyLIrKCh97Nv6U1piYiMmY9Ic8DQBmKO1VJS3QzAVeDm3ye
         OGRooGiVAmD6zcWqP7Mqpurt6T+RpQVxxuRTETwfhimK79KU76NpjDD26sMLaly8rnkC
         rj5c+B+4l5GWPMQ+rDd08Rtr2wi3u548gIuMS8Gwl9+OCedEeRPEeC91JJi+uovlAu8k
         Emsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792892090; x=1793496890;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TbTnRMCBQfYC7ayg98MKoycTzmcskJPrU2RjQTzdnFM=;
        b=Jt8S9HdJXnzc4SwowN+nn2p4XeWRgEFs2zWHitjRnSEKuU9p2ugyQbuTTkfFGMuqRg
         L21aVeFlLkKXHBV4hfTQJGA9osazfU4Fw3I1Wqo643r63ZvJY5J1YBBi4CmetIReJAlU
         a8LGB869+uij5aWTGk1F4voMKoTol8DeOx0QhVD6Olldi6eEYNqID+a5d2ts2gx32h5n
         ORYWE8ppChYXMSSmVVj5//AuGPWCjxZp373OmykHdJrGKwgN51YzPRNT9kF7h/YHZ8Rk
         StBKx4+RJx/QF7EgQtfwb6uv1U3LBpy7OxHb2tIuoLi6b+l3KJDKo+UBrTlv1TGbF0Ls
         j0qw==
X-Forwarded-Encrypted: i=1; AKwUvBzAa8pnJvAhgj5V1fpU8WSCDVhJDeeEoQ0gujGo+PpcwMlZ6ri+C+MPNMZyvHUmO040EoIpr2VggKqeW0A=@vger.kernel.org
X-Gm-Message-State: AFq9FYKRULu0T170PT5iufe1xB0hQAqhqQX9Nnj7b8eOSsMLv2AqzNxY
	huyhH+fSPol+8B+D9UGMCby/nYbOsMs7GzKjEodz9kqmnVli2iLoWCyvp545dzJNTjlSAhd7Rcd
	wiEU3w6SS9yukrl+mHTBYaQ==
X-Received: from plv18.prod.google.com ([2002:a17:903:bd2:b0:2e8:2820:a41c])
 (user=stanleyjhu job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:d551:b0:2e9:4b32:fc6c with SMTP id d9443c01a7336-2ea9c69f27dmr26583275ad.26.1792892089910;
 Sat, 24 Oct 2026 18:34:49 -0700 (PDT)
Date: Sun, 25 Oct 2026 09:34:42 +0800
In-Reply-To: <20261025013446.345974-1-stanleyjhu@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261025013446.345974-1-stanleyjhu@google.com>
X-Mailer: git-send-email 2.56.0.307.g5fe7bd680c-goog
Message-ID: <20261025013446.345974-2-stanleyjhu@google.com>
Subject: [PATCH 1/5] scsi: ufs: core: Restore jiffies conversion of device
 management timeouts
From: Stanley Jhu <stanleyjhu@google.com>
To: "Martin K . Petersen" <mkp@kernel.org>, 
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Bart Van Assche <bvanassche@acm.org>, 
	Bean Huo <beanhuo@micron.com>, Can Guo <can.guo@oss.qualcomm.com>, 
	Peter Wang <peter.wang@mediatek.com>, linux-scsi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Stanley Jhu <stanleyjhu@google.com>, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Before commit 08b12cda6c44 ("scsi: ufs: core: Switch to
scsi_get_internal_cmd()"), ufshcd_wait_for_dev_cmd() converted the
millisecond timeout with msecs_to_jiffies() before waiting for the
command. That commit moved the timeout to the block layer and assigns
the millisecond value to rq->timeout as is, but rq->timeout is in
jiffies. A 1500 ms query timeout (QUERY_REQ_TIMEOUT_DEFAULT) becomes
6 s with CONFIG_HZ=250 and 15 s with CONFIG_HZ=100, and NOP_OUT_TIMEOUT
and ADVANCED_RPMB_REQ_TIMEOUT grow the same way.

Restore the conversion with msecs_to_jiffies().

Fixes: 08b12cda6c44 ("scsi: ufs: core: Switch to scsi_get_internal_cmd()")
Cc: stable@vger.kernel.org # v6.19+
Signed-off-by: Stanley Jhu <stanleyjhu@google.com>
---
 drivers/ufs/core/ufshcd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index ee643830a57a..5193be703752 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -3390,7 +3390,7 @@ static int ufshcd_issue_dev_cmd(struct ufs_hba *hba, struct scsi_cmnd *cmd,
 	struct request *rq = scsi_cmd_to_rq(cmd);
 	blk_status_t sts;
 
-	rq->timeout = timeout;
+	rq->timeout = msecs_to_jiffies(timeout);
 	sts = blk_execute_rq(rq, true);
 	if (sts != BLK_STS_OK)
 		return blk_status_to_errno(sts);
-- 
2.56.0.307.g5fe7bd680c-goog

