Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794626198;
	b=hFxChlT09Or0iQfEP2XvJz89rzKn4tFS4NN26vbGnAuOySaQ6UwWJZPFXw2Cjwh5gge5
	 tB0BJIFLHY7kFURLif5IOJRFYyJ12Lh5nOJfJjgo+ziVDQgardXCnv9odJD7U74uRl9EX
	 j2hM9b6tO7s3qewJdla9EDf8+cyeGWdvVu1lRMjJHJ6r7jUC/wFdZXmx4lt0FgQ10AD7+
	 kgM3sFbu8IJ3KDaf2cmiChd5SqlcT7uQqfOGpg/fnAVUqSvYLofl/hzks6IXqPlv3INYu
	 ZxkC4kp47DHAUFGEZEkMr9eVfkpr5/16WJaFDlj+mrf/X1iopLWxDUaeVAyoZBqj4Xw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794626198;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 X-Relaying-Domain:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=3uZCrEWxOH69+GTCH3HSB6MoUQF0BV83RO/XTXzhfSA=;
	b=GxtipgXkSHyy8T0C80xusntaHOaMY/TsQOCpA+s5Dvp9c038h9bG6Rqvg03lKaCzZuNu
	 9oDstYCzKk2/Q6gu3/qHgHDn4njuO61Xvi906azL3P9XZfcPBRgLIKlWKcjGrhFs594kb
	 MnhaR/y/Qjh0D5ds690v0QoBJ1LGB1aai9zsA3c+DDgKjIsFa1Yb0fVsnIRZukKMIDGaq
	 PeUP3rKvhZobLnywUaNN5RFFv08TMDHE6DLBrWLGY2Fz/gXtXmlwN9Y8hceou5g1zisUX
	 s68pCUs3MfO3W54Xox1/3JYhh3uRwgjWhxYmvVBdJarCBoUeJ0TdEKfglgI3FcVq6Dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=purestorage.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=YKgvOZfc;
	arc=none smtp.remote-ip=209.85.214.228
Received: from mail-pl1-f228.google.com (mail-pl1-f228.google.com [209.85.214.228])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2F75606A8B0
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 03:16:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2F75606A8B0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=YKgvOZfc
Received: by mail-pl1-f228.google.com with SMTP id d9443c01a7336-2ed58279115so2618325ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:16:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1794626188; x=1795230988; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3uZCrEWxOH69+GTCH3HSB6MoUQF0BV83RO/XTXzhfSA=;
        b=YKgvOZfcTF/6HHXNhEBKkeNay2MqZJMARRZJa+geb16nAdi1bV5lLegaR+el2zpm8+
         t2vmuxLdkdG4M6VGRdfxMwWXUPi4WaKsmtUzRgHEskOtcRnygtvvOL2qX8FCRbXHS8z+
         NfVji+RpUu3um3skMNkzu5w0bLVtZ45Xeur3+SMTkZ3QY6u0Uc4b4h8WdMys3uNTJh1p
         rXK5Gvpo4S07gJ0kf2piXt6z5iy1xM883CWO13Cw9GKEMb9/Gu9/0lapnZ1uHYAIX+EL
         EIwHJk8iNCi2CNZLzhpCXKdhcPNLQGAxtmY1I6/pYwpBFXcI2pBSbUynvEWmX1C4Rnok
         nbcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794626188; x=1795230988;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3uZCrEWxOH69+GTCH3HSB6MoUQF0BV83RO/XTXzhfSA=;
        b=U0dJO8oPI+ep0bL1lrNj/oQiC1uP51V3ejoVg6SCmQC36pp+vM+NxHAr+nckdi1xty
         5VJxjoxWsaSIoqp01tDxqiBkBocGlhz8HEnK22b0MO6QVJ4kthWz0sjLl6OSo4lte4p6
         EAP42MKfALRpIhIjGChVp7YTDNr9kuRA/Jgvumm4qLpQ9Dhbz/B5xB6VmlOPrJ7K3CJO
         dhYGMDgBHmTbus680WThNoFuqk7mlk2OHPI7vYQH+OWL9IVzZLB23hGn9vin4+wZuoF5
         H8iLOmtYM6KUkYlVDvIYn5EnaD59RVwhv+xxGk60cIIwOTh8Nw9BS09FUvYW03WewafD
         B50A==
X-Forwarded-Encrypted: i=1; AL+hErHIEiLykxCH4xnlret8uMVHS0EXoHrtaeNsqpeXzy+mk27WLtijuyvBaRai+W2KYU97cyNc5C07F+eD7dw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9FtyqrnXqdEG+bSrgqO/pzTM3Uk70aTfqFy660mTYkUjblebIz
	LzJ0enJH3sqq3A/5TrJXIOUwNKTUEbpKvKRL5+EqFXgErW93gdmnub6ZduVam5vzmExWEZWaMMo
	NcVCxIwCRzGCMsjuVKSb9GWr3SzFtYRCB84yVHdq5dsFszSHIXvGu
X-Gm-Gg: AYBFou3LW280Nu3/mjp5i8wWgTwEFTV65kyu0TuDSm4uP9yNthGDI03Z1w3G+Ns9z25
	v2Gs8/7FRXbCKQ92d+HWmz85NKla0MIugh/S5/qoApUzT9K6g724qV9QVVNjOC5b0d+0DH2bZC0
	BtEY90LeEMS74fjDssmnn5yoL9nkmNIVgzH67W96NiuiKSOgmWElif4gH12YMChndqb4W+HICjM
	X1c5Qt+kROLQYsEFU3Smv0XLwuCGdCJyFHgn9cKvUfEYZE4BPATO+QGs2Bxr0ACMcJBDlSJLSJH
	FX4r06uP7293Codsn+MllRlfYYzkbf9D4BMh+PWhPssBG3AONE3gcBO19t+dsVgEHk6TLdSS3FS
	y3ZjwBnrDJVH8OunN
X-Received: by 2002:a17:90b:2e90:b0:3ac:77a2:18b1 with SMTP id 98e67ed59e1d1-3b1b0a44b0amr6710056a91.5.1794626188078;
        Fri, 13 Nov 2026 19:16:28 -0800 (PST)
Received: from c7-smtp-2026.dev.purestorage.com ([2620:125:9017:12:36:3:6:0])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b1ae8da103sm6489932a91.1.2026.11.13.19.16.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 19:16:28 -0800 (PST)
X-Relaying-Domain: purestorage.com
Received: from dev-csander.dev.purestorage.com (dev-csander.dev.purestorage.com [IPv6:2620:125:9025:23::204])
	by c7-smtp-2026.dev.purestorage.com (Postfix) with ESMTP id 66197401FA;
	Fri, 13 Nov 2026 20:16:27 -0700 (MST)
Received: by dev-csander.dev.purestorage.com (Postfix, from userid 1557716354)
	id 63E0BE4049B; Fri, 13 Nov 2026 20:16:27 -0700 (MST)
From: Caleb Sander Mateos <csander@purestorage.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Caleb Sander Mateos <csander@purestorage.com>
Subject: [PATCH 2/4] io_uring: add multishot_flags constant in io_wq_submit_work()
Date: Fri, 13 Nov 2026 20:16:19 -0700
Message-ID: <20261114031621.2924144-3-csander@purestorage.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261114031621.2924144-1-csander@purestorage.com>
References: <20261114031621.2924144-1-csander@purestorage.com>
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

REQ_F_MULTISHOT|REQ_F_APOLL_MULTISHOT is repeated twice in
io_wq_submit_work(). Introduce a constant variable multishot_flags for
it to reduce the repetition.

Signed-off-by: Caleb Sander Mateos <csander@purestorage.com>
---
 io_uring/io_uring.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/io_uring/io_uring.c b/io_uring/io_uring.c
index 5db57bf675f0..28ef95851510 100644
--- a/io_uring/io_uring.c
+++ b/io_uring/io_uring.c
@@ -1617,10 +1617,11 @@ void io_wq_free_work(struct io_wq_work *work)
 void io_wq_submit_work(struct io_wq_work *work)
 {
 	struct io_kiocb *req = container_of(work, struct io_kiocb, work);
 	const struct io_issue_def *def = &io_issue_defs[req->opcode];
 	unsigned int issue_flags = IO_URING_F_UNLOCKED | IO_URING_F_IOWQ;
+	io_req_flags_t multishot_flags = REQ_F_MULTISHOT|REQ_F_APOLL_MULTISHOT;
 	bool needs_poll = false;
 	int ret = 0, err = -ECANCELED;
 
 	/* one will be dropped by io_wq_put_work() after returning to io-wq */
 	if (!(req->flags & REQ_F_REFCOUNT))
@@ -1647,22 +1648,22 @@ void io_wq_submit_work(struct io_wq_work *work)
 	 * right context, however this is not the case of auxiliary CQEs,
 	 * which is the main mean of operation for multishot requests.
 	 * Don't allow any multishot execution from io-wq. It's more restrictive
 	 * than necessary and also cleaner.
 	 */
-	if (req->flags & (REQ_F_MULTISHOT|REQ_F_APOLL_MULTISHOT)) {
+	if (req->flags & multishot_flags) {
 		err = -EBADFD;
 		if (!io_file_can_poll(req))
 			goto fail;
 		if (req->file->f_flags & O_NONBLOCK ||
 		    req->file->f_mode & FMODE_NOWAIT) {
 			err = -ECANCELED;
 			if (io_arm_poll_handler(req, issue_flags) != IO_APOLL_OK)
 				goto fail;
 			return;
 		} else {
-			req->flags &= ~(REQ_F_APOLL_MULTISHOT|REQ_F_MULTISHOT);
+			req->flags &= ~multishot_flags;
 		}
 	}
 
 	if (req->flags & REQ_F_FORCE_ASYNC) {
 		bool opcode_poll = def->pollin || def->pollout;
-- 
2.56.1

