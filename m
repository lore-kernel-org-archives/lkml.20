Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37DE1443E3B
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792139317; cv=none; b=mwM5GqtGmuYK3XfQ4aqPNsr1pDFIYKnbjIErJ/KhbuyBSPfvk4NssAnHdQVLccoIXaYftFdUX9+AdOrFuZbanDzX8buCXJpTzoGSMDacq206Yjxz4UmkiVIoJ/zFQGprWY6kjhnBrWTA3k8i2S6CUav0QPot7wHW44VbGnkmf1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792139317; c=relaxed/simple;
	bh=HbY3uUHAijh/1I5FX6ar9CsRcM4iQLAX31lRTMUxHTc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SZUgZ0vQ6Y+KDZwy3IVPaqH9fQZT+A64guIWYbi/8Hb1F6Kzcji1N3zjvzrQJdIbw0JRjjC8S3I2GHSkbWGZMErbX9R2QELPNN3YuizrstsAs+Az1UPK+tmf4z5UmIH9ZHBeSJtGBCipb0JJSjq7U6k5hrA6MO14vEX084C7QZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr; spf=none smtp.mailfrom=isslab.korea.ac.kr; dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b=z0wbZaQb; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b="z0wbZaQb"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3ab9268d90eso3386004a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 01:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1792139315; x=1792744115; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E3ZfqWHYTUZi3lFXImIbDdakWBiYoO4rGCBdeYzvOoU=;
        b=z0wbZaQb4L0otuOWwf2X1LSyysP9qgWU4a49EJoIQgRFRYclTR82X8ABtcn8TXYf72
         VYvnsBIe4IUbyIbQlQrqrSYR0tC2jhsY0Popeg4ebZcE0DWyF6drsB5VWUS91jRmZGtc
         cdv2MTZ1Jr7LWFacYsNdLMrEbnLu0pLiwSej+mvg6B8teFERcV1Pji86GjNNJxV72pu+
         nwtLpHOQRJaP1jONyGtSKHtk+CCQzpHmXcHSSBSEioYauAViQKLrnW4X8ZpkSVM6T/8l
         sKQs7feD1xKDblKomEls6uzcOL27Epm3D5c84wRb06jsqmeUzAAHpQUxI0Dod1TfosQ1
         9Jmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792139315; x=1792744115;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=E3ZfqWHYTUZi3lFXImIbDdakWBiYoO4rGCBdeYzvOoU=;
        b=kBB7uBZ6Tymo8zApFqCWIg6SX55R2jD9QH+qmddAmDjO1ExF9MuCn/ALCmoLR1q9y1
         eOl1Ja4FhkLoXpG6V6O+VDSx8REidCjmaILIiQAdMhQyScDes1mUrH+bW1QVYVwP/2TW
         KWI5BlLzFSAkQJkddWeIKyv05mCCvZse0XJHF9YJuiO5aM18ZRN7nbazxtupbdWyHNxN
         JftKKSgKfP+U5Z6WOOBKpjeb5N2b5fMWHGIu8UJQNEMVOq95K1dyAYyXKPAd8ftQgeEf
         kfTvZGyqi8VpADES9Kn9NAUPHrL9SWF6uX8ZBCwkg1ybBJqlGnmQyID7yuDSFG6RnKx+
         WdJw==
X-Forwarded-Encrypted: i=1; AKwUvBwzs26Wc584PG3kFhK7QifCpSK8E72uWKaWMV4gusmO6r3WwboEsDxGaVAwrIMCFDwH9NN+KB3bzh8w90w=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ2MclFxuaDgMFBbHgWpkc06A1RS8y0aS6R54xcRuXUMvx2QC2j
	Wl6+DqcY6NYv9qJhl1dmbPoz6WF27YOar8xQHwA4FIYqT4gHJ66H3SiJjJCiVl8Uf4c=
X-Gm-Gg: AYBFou1pTklOZSUNXsC+GrtDVIBvWWJEFufOjPufi48Y7L9B3rmI4uii+xFM0VZviOQ
	YZqUQ3EvSMuI7mFhEuaY2vThUrOfEVGJ0yUizqcbfOQf9KJQyXGECdr/S9Jp+LZMB20q+83/2eY
	sxaVl1JeLdwbFoIohaQyZSwWyft8Cu+VFhUHes42hJFCU4jibXw8u/GlFsZze2frFauynef2If5
	aGL7BxNqjhqwkeMFGSM7ajXBIcyvFdofdyUw11bKmiibaMl1HgLb71LRS+rhkeSrdPVH0IG0ET5
	F8fYVxkMhRS4dnk0nQV9thm4C0d45ns4TuQ7CQQrYdL5DctWRgsdgYK28UI//cJhXFIMoWQj1tt
	v6GXrjHgJ39OegYiFalQk5fx7Og6bTH0Q9/vxx+iUOOkBg7pwuVZ+7GYY0cNVKlJiTU0gP8aqG/
	XbcsDcD2b1ZsVDexcQ2Ndm5gjr1H0ff9RGXjsqJn5Se2ye5gIh1TbnNzfhRbPa0N/ojYoTy33XQ
	VEXJOhWn2I7a9Kh
X-Received: by 2002:a17:90a:38c7:b0:3ac:8897:7b9f with SMTP id 98e67ed59e1d1-3ac88978312mr3951542a91.43.1792139313572;
        Fri, 16 Oct 2026 01:28:33 -0700 (PDT)
Received: from yhlee-960QFG.. ([125.131.91.97])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acc48f19d9sm3088933a91.11.2026.10.16.01.28.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 01:28:33 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: "Martin K . Petersen" <mkp@kernel.org>,
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	yhlee@isslab.korea.ac.kr
Subject: [PATCH v4 3/3] scsi: bfa: bound the RSCN event list by the received frame length
Date: Fri, 16 Oct 2026 17:28:18 +0900
Message-ID: <20261016082818.1237059-4-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016082818.1237059-1-yhlee@isslab.korea.ac.kr>
References: <20261016082818.1237059-1-yhlee@isslab.korea.ac.kr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

bfa_fcs_lport_scn_process_rscn() is given the length of the frame it has
to parse and never looks at it. The number of events it walks comes only
from the payload length the peer put in the frame:

	num_entries =
		(be16_to_cpu(rscn->payldlen) -
		 sizeof(u32)) / sizeof(rscn->event[0]);

	for (i = 0; i < num_entries; i++) {
		rscn_pid = rscn->event[i].portid;

payldlen is a 16-bit field, so num_entries can be 16382 while the frame
sits in an unsolicited frame buffer that holds 569 events after the
fchs_s and the RSCN header. The loop reads up to 63 kB past the frame it
was handed, and the duplicate scan nested inside it is quadratic in
num_entries, so one frame can also take the receive path through more
than a hundred million iterations.

The length that bounds this is already here. bfa_fcs_uf_recv() takes it
from the completion with bfa_uf_get_frmlen() and it reaches this function
through bfa_fcs_fabric_uf_recv() and bfa_fcs_lport_uf_recv(). Work out
how many events the received frame can hold and take the smaller of that
and what the payload claims. A frame whose payload fits is parsed exactly
as before; one that claims more is parsed only as far as it goes, which
also caps the duplicate scan.

Reject a payload length below the four-byte RSCN header it is measured
from as well, instead of subtracting past it.

The same shape is in lpfc_els.c, where lpfc_els_rcv_rscn() and
lpfc_rscn_payload_check() walk the payload length without comparing it to
the frame either.

I have no Brocade hardware; this is from the code, with the arithmetic and
the loop bounds modelled against an unsolicited frame buffer under KASAN.

Fixes: 7725ccfda597 ("[SCSI] bfa: Brocade BFA FC SCSI driver")
Cc: stable@vger.kernel.org
Signed-off-by: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
---
 drivers/scsi/bfa/bfa_fcs_lport.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/scsi/bfa/bfa_fcs_lport.c b/drivers/scsi/bfa/bfa_fcs_lport.c
index 8c9d423129c07..49bcb76c118b6 100644
--- a/drivers/scsi/bfa/bfa_fcs_lport.c
+++ b/drivers/scsi/bfa/bfa_fcs_lport.c
@@ -5533,17 +5533,28 @@ bfa_fcs_lport_scn_process_rscn(struct bfa_fcs_lport_s *port,
 			struct fchs_s *fchs, u32 len)
 {
 	struct fc_rscn_pl_s *rscn = (struct fc_rscn_pl_s *) (fchs + 1);
-	int             num_entries;
+	int             num_entries = 0, max_entries = 0;
 	u32        rscn_pid;
 	bfa_boolean_t   nsquery = BFA_FALSE, found;
 	int             i = 0, j;
+	u32             pl_off = sizeof(struct fchs_s) + sizeof(*rscn);
+	u16             payldlen = be16_to_cpu(rscn->payldlen);
 
-	num_entries =
-		(be16_to_cpu(rscn->payldlen) -
-		 sizeof(u32)) / sizeof(rscn->event[0]);
+	/* payldlen spans a four-byte header and the event list */
+	if (payldlen >= sizeof(u32))
+		num_entries = (payldlen - sizeof(u32)) / sizeof(rscn->event[0]);
 
 	bfa_trc(port->fcs, num_entries);
 
+	/* the event list cannot run past the frame that was received */
+	if (len > pl_off)
+		max_entries = (len - pl_off) / sizeof(rscn->event[0]);
+
+	if (num_entries > max_entries)
+		num_entries = max_entries;
+
+	bfa_trc(port->fcs, max_entries);
+
 	port->stats.num_rscn++;
 
 	bfa_fcs_lport_scn_send_ls_acc(port, fchs);
-- 
2.43.0

