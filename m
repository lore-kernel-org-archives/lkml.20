Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793257725;
	b=JaKUOKHNOAREtyfmbp2ZwBtrN/AJsu2s07Duz6Ag53JK6gYPV0RS/aSdUu5jSmNn47Ig
	 vzfM1rEVvkBBIGm9c0ktmjEqJmVRrRfQOCc1Im4hi0ZRnJIxlummB9CcD6/Jm+c9xQptc
	 ysPCKbOAOyJCOzdjs/G/WqiVOWqA+HgF/Lqnaa2uEHli+8C64s1i4EdZMTyW5tSmtuSwb
	 e+H5lRLHj2dlnhwyUae3eS6DHEF0Wgy2z0Wwyx9ulAVDV6iWk9thqArQHeYZ6t+TiUsgI
	 8tqXNYwLUvUdBGTKes+1XJgT1/oIJF9E4TH2u14NGQJkvHb3rps5We5FO1GiEc0o3RA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793257725;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=c2wt0/O9P4h169mOPfGdNt9HMfMIWbdoAewi8Z+Zhoo=;
	b=s4B4CaaBMNHL6l7WLQ8caXecdSMna/04bn4pBDTuBXmdwB1QNTDoxQeXItNgv4DtXCxX
	 RUqejar4iRH6enQQp09cux8wzb8bJwMgy3wdl/2hGE+839cOMDimdRlD5qeYQK5OaU4dA
	 wiIwcIL6cRVDz2y9CotSnXF4BP/7HvVexFrECDLH6LjMe9XyD9l4bG5t7Z4RZLo5y+xc0
	 BZ2m+yoLN4tEmIH4KQPsuWpsWNyDZQo96pXxb/CTC1Tt/HawuB3fqVtCx7Ne+EP7rq0Ea
	 PgZi4sR1joojGpLHWzv+XH8Uenuhmy9P61xuMvHY1rOS6zZggBYV+6UPp+3Fn3opBnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=G8w0gCtP;
	arc=none smtp.remote-ip=209.85.210.200
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37936606A33A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 07:08:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37936606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=G8w0gCtP
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-89f71ac2e2fso1618901b3a.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 00:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793257725; x=1793862525; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c2wt0/O9P4h169mOPfGdNt9HMfMIWbdoAewi8Z+Zhoo=;
        b=G8w0gCtPvtHfdPkRoHpX5bKVfSBj2vbcM8IdNuCuhd90wmJFzTVagaN2CO4SH9D5Qu
         xhGqnBq3HBijXRGx63AGeG5LN3vBbsDSUWX+oI3R2Rv57lHs6npjOM78etALD5USt09X
         ZL5mvZvwhDcoWLldvm3+tuQiWpyFVY3rvY6fvX5Uf+JKe0dfwMAHvCRkTCLrD8duQrbp
         M+UUeXG0g8YpecEmSMvan711a+DKe3HEMp2mFxJc16PIPx+xZKlRrG7/jOWLoMl4W7Kh
         2kMnSrWEmi61LMchzpdmoaihOhtFhVH15cfVZYUyCj/5BEG1NNm7RsTfXJ1gQ3zmI5NM
         Z8vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793257725; x=1793862525;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c2wt0/O9P4h169mOPfGdNt9HMfMIWbdoAewi8Z+Zhoo=;
        b=I0dtmsIqnfU0tdvx9lVqzZfLVHbN1GRSuHfOdCKScB270xl2IAIXRjnfa8EXI9/Y9A
         aqtKJQY7UL/upbwbEe0Z1Xhb6whHj3QnC4eF5yVNVU2EP9zlekPF9wy6HuonvTBl/uRE
         PYRvyqJaPhi2MQCgaBl2RPF2RIOfDEw6FaY5KSYufBQ2arM0v+e8orIqbS8JIg3YI/TH
         3fGTS43tl+tB4dKrl1TcGhtsIlF/HPMYGINRX2cFSdGKRbVgDXNDt2XkYKo5lmXMw4/2
         ROzv9TvWKLn9mp17c9c4w3KITWJD2lSzT9YVloscXYOaKA7eoLa4Qs6bWI8kS/NbtbHl
         15dg==
X-Forwarded-Encrypted: i=1; AKwUvBycvE07pTYQ6LQLeCNYCtqbk519tGsdxoltEF4CmtBH9k/Urkbq6Xp5ULNQ/S97uJr5O+L7myHRFTAPDfo=@vger.kernel.org
X-Gm-Message-State: AFq9FYL5bUfT3eyUoUjtbGCe4pizxwXwbsMVKbDpkRjQkHrhdDLFAgYd
	X5epUQsZkYhz4YdGHoFMJa1X09wc+A2GP4OZ/M8AKfg5DgxlJwxhxZvt2j9Liy3fMp1/uh5OHzv
	C8ImFMtzZ6y8Flf0jHNQSeA==
X-Received: from pgdo13-n2.prod.google.com ([2002:a05:6a02:620d:20b0:cc7:52da:b682])
 (user=stanleyjhu job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:6a21:b0:3e0:d5c0:74b3 with SMTP id adf61e73a8af0-3e90243d45fmr4171831637.65.1793257724559;
 Thu, 29 Oct 2026 00:08:44 -0700 (PDT)
Date: Thu, 29 Oct 2026 15:08:36 +0800
In-Reply-To: <20261029040003.2100003-1-stanleyjhu@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261029040003.2100003-1-stanleyjhu@google.com>
X-Mailer: git-send-email 2.56.0.313.g2479322e68-goog
Message-ID: <20261029040003.2100003-2-stanleyjhu@google.com>
Subject: [PATCH v2 1/5] scsi: ufs: core: Restore jiffies conversion of device
 management timeouts
From: Stanley Jhu <stanleyjhu@google.com>
To: "Martin K . Petersen" <mkp@kernel.org>, 
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Bart Van Assche <bvanassche@acm.org>, 
	Bean Huo <beanhuo@micron.com>
Cc: Can Guo <can.guo@oss.qualcomm.com>, Peter Wang <peter.wang@mediatek.com>, 
	linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Stanley Jhu <stanleyjhu@google.com>, stable@vger.kernel.org
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
index fd52deb72d21..68a98cde5812 100644
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
2.56.0.313.g2479322e68-goog

