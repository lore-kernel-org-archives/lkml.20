Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2C614EB876
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 15:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792166107; cv=none; b=V/Un/UnCHP/E4bLMc5ZxHuoRCb6rvdQey2GIBZARvfPwVXniPoFjFvgieOVXyRkTU03VAsBJBloymiD/HSnWk6+2NTVL4inyzt0eMjXVc6Aj9Vd4mT6DWOukBIufZYF4zvuuXCVbrvn1WJBWujlMpp8upsmxK2cLquGBZl+1jcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792166107; c=relaxed/simple;
	bh=xfVM7Ixl3z8eH7OKX8v58pshYLTN3UD5jO2NLrcsdwc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CYkm5MfqQI/J7laT5wT9gYuvYX/JzTTmus87ffNbc5tyTBlSP96ZTz3Df/JTixMFfO6LWGb+vhFvtEhQv96hEES8cJUiHlo+YXhHr0gAEUQPSH4FPw5EBvNnVyMwrUWk+5LHtQ47hHlX8IuJALP3L6oTy5TLqocGGSuvlPjaNPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr; spf=none smtp.mailfrom=isslab.korea.ac.kr; dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b=jQErxRhT; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b="jQErxRhT"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cc147d86bebso122221a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1792166104; x=1792770904; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M3tJFqfVV3/Mnehr3W1CL8ME0NqIUxGcTffK89eXBjU=;
        b=jQErxRhTEYF0DBOizAbVwDMJ1JffeXYFdCEwR4m2wwhWtl/OQXwFUKoQKP77KsEaip
         RKGKTJnR5gnnFnuIgRpx+YXOKbJtBWDkCeDR8iRX8UohV+O0DNiVtGwM0I6ORgNS4eZv
         J4+0KJH84fPBU3QJytuMW03sOF/uSp7JvbaDMriKE9RLbgrvgT3oJ+m0vZpXBLY9UWZT
         vR3JndN5tDp0uSjUDF39enzyFzFBwKdboDSBTGrHXupKEeTPEurWyAW0WE79OUE/mlEV
         d+xyH/qwl0ZE2j17aNktmCHmTHHhfVjM2w2z8TwqXnXGgsR+OSSzRn6kkFwZH33AYAdq
         0idw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792166104; x=1792770904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=M3tJFqfVV3/Mnehr3W1CL8ME0NqIUxGcTffK89eXBjU=;
        b=qpKhzXThx67WI3gXNnsWMjtIFPXVK/gl6X00HlTJTqv24+r+T5flSWX6z4f+plkzBS
         Hpx63Me960CC+o7SdVWkYI4bbvsjb9N5LkZKAdwVmvnuwQ1mUAkJjjRHFSACijkXzs6U
         WCN4GZuYH3oVVYpJruSWurRQqjK5hXFxYP3jrCEHutg7XqJk92Wes1lA/y+8nvCgfZiM
         eA/gAnP8/wECiZaCe8dr3IYLP62P1hrsX8i+PP+8vdXZkGgfPO/lueOFtTj1K61pFqgn
         YzN/rdapIpxwaNqGOo9y3qYk9EyY/eMenRtaAc/ad9QKFKiIZBhF7FrLZlwYRsPWHgw3
         NLtw==
X-Forwarded-Encrypted: i=1; AKwUvBz4pbGCQDVopyw8IYY0Ulw71nkO9q6b+gNvD78utzVrR8EoDTvevg/hYtp7HZpWXkH0225c/Zf35yewME8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJOnJ41UkCiME8tc3c6q+VxfEQv0TJn0+VWHtPJzDj/zTvgcreZ
	9Uths6qPacjZxkzBINDQ1zOoqKgpZ1FiDamX513oQQ/nfoEOpOb7IWi99TAaZwA9FbVZ1Eb/cXb
	+bXP1
X-Gm-Gg: AYBFou3se7IX55UwMaMWGsUAYDsjjk7/x9xsIyiJ68PnegpKdr6QZs7cbEhEXbfbwLf
	unepLbGZhA33mZXOEVU4lBGN+owwCMW5SqgaDdC3SNac0Ko5qhAcN07R90FpFID+vFKHPUpkq2N
	MuUaN+8hCaEXLRKpFB4V3QWMZcTCEVsIWBlDdw/yukHxS0hVzW7RE7bQHiuchkWgpYQinrSwLEg
	60zfd6IJz41CMd39bDvo3P6jvDMQzRdXO/NjANFoLc/nOyyQtFlV5ZXS3xBoNOQHLHT/BAZ6LI2
	+PfKSd7mS/sWt+W6THmK5OjFuP5dH0t5oVibFi6Nu80SI6KN54uVHs4kaFuHEXiD6ZXajlF/dwE
	X2PjPIOr6opdqZU+fCa77p8MFUKKWGyGVwDj7aOcRz8OLtCA5iMO3CdEWLxhJ+/JzVe3HjuqL9P
	WznzlXS25EswJI9IcGdJ0wWe1lRUTcplEHexOhRNt6x2XFstG0dJt/N0un35Z4YnddoUH2Msdw0
	dWbGRuNotX0KvOycNMg9AE=
X-Received: by 2002:a05:6a21:1506:b0:3de:ab1e:a63e with SMTP id adf61e73a8af0-3e2021c03f6mr2641865637.39.1792166104144;
        Fri, 16 Oct 2026 08:55:04 -0700 (PDT)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:5e7a:332f:f584:a3d8])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd65ab63cadsm983076a12.4.2026.10.16.08.55.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 08:55:03 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: "Martin K . Petersen" <mkp@kernel.org>,
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	yhlee@isslab.korea.ac.kr
Subject: [PATCH v5 2/3] scsi: bfa: drop unsolicited frames shorter than the headers they must hold
Date: Sat, 17 Oct 2026 00:54:40 +0900
Message-ID: <20261016155441.1607196-3-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016155441.1607196-1-yhlee@isslab.korea.ac.kr>
References: <20261016155441.1607196-1-yhlee@isslab.korea.ac.kr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

bfa_fcs_uf_recv() keeps the received frame length in a u16 and hands it,
with a pointer to the frame, to every unsolicited frame consumer. Two
lengths are never checked.

The frame is not checked against the FC header that every consumer reads.
bfa_fcs_fabric_uf_recv() takes fchs->d_id and els_cmd->els_code out of it
before dispatching, and the handlers below take the length as a size. The
worst of those is bfa_fcs_lport_echo():

	pyld_len = rx_len - sizeof(struct fchs_s);

pyld_len is an int, so a frame shorter than the FC header makes it
negative. The memcpy below is skipped because the comparison it guards is
signed, but the value is then passed to bfa_fcxp_send(), whose reqlen
parameter is a u32:

	reqi->req_tot_len = reqlen;
	...
	send_req->req_len = cpu_to_be32(reqi->req_tot_len);
	bfa_alen_set(&send_req->req_alen, reqi->req_tot_len,
		     BFA_FCXP_REQ_PLD_PA(fcxp));

so a six-byte frame asks the firmware to send roughly four gigabytes
starting at the fcxp request payload address. The response side of the
same function sanity checks its length against BFA_FCXP_MAX_LBUF_SZ; the
request side does not.

The frame is also not checked against the virtual fabric tagging header
it may advertise. For a tagged frame the function steps over that header:

	fchs = (struct fchs_s *) (vft + 1);
	len -= sizeof(struct fc_vft_s);

and a frame too short to hold the header makes that subtraction wrap, so
the length comes out near 65530 instead of going negative.

Drop a frame that cannot hold the headers it has to hold: the FC header
before anything reads it, and, for a tagged frame, the VFT header plus
the FC header that has to follow it. Both drops use the idiom already in
this function for a frame whose virtual fabric id is unknown. A normal
frame is not affected; the FC header is always 24 bytes and a tagged one
carries it after the 8-byte VFT header.

Fixes: 7725ccfda597 ("[SCSI] bfa: Brocade BFA FC SCSI driver")
Cc: stable@vger.kernel.org
Signed-off-by: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
---
 drivers/scsi/bfa/bfa_fcs.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/scsi/bfa/bfa_fcs.c b/drivers/scsi/bfa/bfa_fcs.c
index 9b57312f43f50..8bb92f935a40f 100644
--- a/drivers/scsi/bfa/bfa_fcs.c
+++ b/drivers/scsi/bfa/bfa_fcs.c
@@ -1527,6 +1527,14 @@ bfa_fcs_uf_recv(void *cbarg, struct bfa_uf_s *uf)
 	struct fc_vft_s *vft;
 	struct bfa_fcs_fabric_s *fabric;
 
+	/*
+	 * every consumer reads the FC header, so the frame has to hold one
+	 */
+	if (len < sizeof(struct fchs_s)) {
+		bfa_uf_free(uf);
+		return;
+	}
+
 	/*
 	 * check for VFT header
 	 */
@@ -1550,8 +1558,13 @@ bfa_fcs_uf_recv(void *cbarg, struct bfa_uf_s *uf)
 		}
 
 		/*
-		 * skip vft header
+		 * skip vft header, which the inner FC header has to follow
 		 */
+		if (len < sizeof(struct fc_vft_s) + sizeof(struct fchs_s)) {
+			bfa_uf_free(uf);
+			return;
+		}
+
 		fchs = (struct fchs_s *) (vft + 1);
 		len -= sizeof(struct fc_vft_s);
 
-- 
2.43.0

