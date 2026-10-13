Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6641519DFC
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 16:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791908199; cv=none; b=CwYCfb2O/5iuBjRKE8GK6nskTApjwkYfdurXCxpnkcHZksl+1lWpJ+8H33R7S71xiuFVNwHU3NOk6SX83Ur9b1QUSH29IMbhtd8kGF7S2nHWJbv6DlA6CBjQmpjjkLj16rl/5jyhP4UPyTNxp3bpYTn0pEpI9MUiFvKdXQ4eDNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791908199; c=relaxed/simple;
	bh=6BMwdsi3ofoz+bipxdz7wykMCA0g4jyIQITHzdnkJnU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qbvMIBzzfZp0PuwoNxiUU15gs62Cbhnz8KKdDVaW0i4ALLbq3PbubbdawvNXb28fPeOzoLQKJZT484BdquxtH/JlxQQga9n2UFogkdrhqYFEUy946asR3aim9C3UUk+V2jTd88x0/y4xizOq6HgVtbOvd1/a9+9/UR+NWTs2L5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr; spf=none smtp.mailfrom=isslab.korea.ac.kr; dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b=0sRYIJZa; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b="0sRYIJZa"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3a706146559so1915198a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 09:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1791908197; x=1792512997; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K9zJQoLv8Tql7NoNqNEI0i7VSFA1eBmo00WB94NShbc=;
        b=0sRYIJZatomYPwE/grE+dLyVKAxYVoaUDKB99Xu146rYXicczXjFNmuX6PHlTkYiFj
         e76t29qmsuxGqoht8KVk1tl8DoW8JN5lzqSQ/hyySH2V2dFN+XTa/uxgvt/zOfFRbbli
         Y+c9GDB4j0h4Ew+5/4ot/Wf6tB2R0A25Xy5AFjQ1RnVDH31wt0YDuAuH4O5+jFrYndra
         XWjjWDFJp6FRwihmBOtIUTX0anWoxssB4aVaMOKDFbiXL2q30M67KbGgScQk+a9ZkBl5
         duL0f8Ba3n54ZZ5zt/tEPubzCtYJ02MRwjpRIRGw3BoRkuuZ3cRtwVWpdU1PfU8RGWsn
         HyRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791908197; x=1792512997;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=K9zJQoLv8Tql7NoNqNEI0i7VSFA1eBmo00WB94NShbc=;
        b=NP84RFwBjeZIphoExjHYYBMOm8Xt9bHtNk9TzxVOFL3AcfJLEekQs0naGVurC3Lqpv
         KlERen5JiII5+PRFA9tEfO+Tpeh2fkUC9TdaKYMTlE+HbeneX96lxch/EtK6Jwk4wMdo
         RLBR3xBHknz3u8+E0AQ7ejijjCW2WpqVRak/chQxEdGrN6M+13/hw5hblAnmAW6Jnmla
         1DFEsucB2qZAbdG6secD4bOPo6jzhjNz3zUw0N3M7WjFVchbQox2ddvfkB2EStommjcw
         EZHwlgCt1Mm6+82ObpRpdaJB10YfBmV9yBuPFg03KFVwCYzWVfo4bBbkvbiu/qHKsw5Q
         xHbw==
X-Forwarded-Encrypted: i=1; AKwUvBwpPt9gsmJBwlXyI436K1Fum4QuFYDrNIR/wygbNkYN5C3kSJW4rDSrtvZnIglC6oW2f/WAUJ73f/uqCts=@vger.kernel.org
X-Gm-Message-State: AFq9FYKvn8SMAu3ONevWOvXp9fHNVfBfYoScerwR9WpT4ItRYCWGU4Al
	6PEEXwnHRMQcIjhMcVTwb3PR6wFUMUTv/bwedxI0L0ksbuEK4j/jekN6Y7VHZkeBp4I=
X-Gm-Gg: AYBFou22/txJ1zPCEr5iTE7cOQuJpF//AUj/AICb8FPWf/YxadTb1iJc596DmQDHwUb
	0oGAX3IjpOcKyHw3T3LbBee4It0IYAF74N6/J2cYtBnNY5TUKUy5J2obFv1LYmqBz3IEim/oBzN
	fXDs0puJZsGoJvTh2yaRfaSfLtx76vXamc54gN8S/qZtRRDnlJmugIAtjC04FHU8n6V15KxKHtm
	4bW1tRfPZVfK2Xr5liF52NUy5uyoR00h41xfRIWlbHrNfGxfh8CAMgL6WMoTKgavrl5tJ5LosXP
	64fs32ZFRk4H7CTYm7k1txxcNxmW6I7EPQYFO7nwpVVUvd0IQW4OnwUkDLhooHTGkP9zjxiJ/d0
	rolJIp5VrnKeoPCew4IUgCucqXMRp3m7R75ILy+JgElgevttCIUsN5p2tdUMfjTEAM3Iwztc+fd
	DDmJ8wmOTMSz8EC9NlG5jA4j0+R5nC0R3nCo46Bfv+TySn13zRG7f6XaRQVDq58bsvXwLumNJPM
	yCwkCiMQiyDQmBSenWFuQ9EdGBY+6Y=
X-Received: by 2002:a17:90a:d446:b0:3a0:5413:49b4 with SMTP id 98e67ed59e1d1-3ab3a9fa33fmr9197790a91.39.1791908197099;
        Tue, 13 Oct 2026 09:16:37 -0700 (PDT)
Received: from localhost.localdomain ([2406:5900:1044:110c:c51c:be8a:c517:276])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac600642c5sm202607a91.5.2026.10.13.09.16.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 09:16:36 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: "Martin K . Petersen" <mkp@kernel.org>,
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	yhlee@isslab.korea.ac.kr
Subject: [PATCH 2/2] scsi: mvumi: reject an out-of-range handshake frame length
Date: Wed, 14 Oct 2026 01:16:20 +0900
Message-ID: <20261013161620.3210533-3-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013161620.3210533-1-yhlee@isslab.korea.ac.kr>
References: <20261013161620.3210533-1-yhlee@isslab.korea.ac.kr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mvumi_hs_process_page() checksums and parses a handshake page using
frame_length from the page header, a u16 the firmware fills in, without
checking it against the HSP_MAX_SIZE buffer the page lives in.
mvumi_calculate_checksum() then walks frame_length bytes of frame_content
with an unsigned char loop counter, so a frame_length of 256 or more never
terminates and the probe path hangs; values between the buffer size and
255 read past the page.

Reject a frame_length that does not fit the handshake buffer before using
it.

Fixes: f0c568a478f0 ("[SCSI] mvumi: Add Marvell UMI driver")
Cc: stable@vger.kernel.org
Signed-off-by: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
---
 drivers/scsi/mvumi.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/scsi/mvumi.c b/drivers/scsi/mvumi.c
index 38a92f8c25f5b..e85400291a141 100644
--- a/drivers/scsi/mvumi.c
+++ b/drivers/scsi/mvumi.c
@@ -1040,6 +1040,13 @@ static int mvumi_hs_process_page(struct mvumi_hba *mhba,
 	struct mvumi_hs_page1 *hs_page1;
 	unsigned char page_checksum;
 
+	if (hs_header->frame_length >
+	    HSP_MAX_SIZE - sizeof(struct mvumi_hs_header)) {
+		dev_err(&mhba->pdev->dev, "invalid handshake frame length %d\n",
+			hs_header->frame_length);
+		return -1;
+	}
+
 	page_checksum = mvumi_calculate_checksum(hs_header,
 						hs_header->frame_length);
 	if (page_checksum != hs_header->checksum) {
-- 
2.43.0

