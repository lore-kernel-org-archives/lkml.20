Received: from mail-vs2-f42.google.com (mail-vs2-f42.google.com [74.125.227.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3A8043C067
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 17:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789493956; cv=none; b=mnkZNq95E1UVq50NIy0IllckJ+PRvWeWTXUDUqxHgmpbOawwUcqIaiclkHqzQ0oaGhde/gd3L3w2Ewk5flqIfeB7TgvDQNrF/XFyoQyUzirfNp5nJMyQQxE6xeuWDlChFwXjLfjRXDsW9H+Z6OMHUGjGrKURyHW0a9XjDxoyI6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789493956; c=relaxed/simple;
	bh=NzS0LEAs3S9whvb62gdHLrrOa6NfF7zRiqGXtQrWDwE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GLSTpQABij1MnOmv/EoQVBqG2S5Q3sVypt2yH5arT0xmacLtfubcjJXo3G7LCP9W127yfTMvcdIA4TFASmnDPExwGlqNLeQxYUcxi6/A5lpklAkbWiigV+MpkYoM5ffXqJvfQQH3mJMxGja6p9d/vGj7d/4ROzjA3ptrpp4PLN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I7lYTC/j; arc=none smtp.client-ip=74.125.227.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I7lYTC/j"
Received: by mail-vs2-f42.google.com with SMTP id 71dfb90a1353d-5c9928a36ebso378239e0c.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 10:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789493954; x=1790098754; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iwEMIxUcVqGwd0ywmsmxiy74tjlp/vlHo04q60UyVfc=;
        b=I7lYTC/jdd5GQF/Jon1ayHYWQyAcrlQsE7Lq3dmAxbovrTxfSHObUqZEsQ7gPFWjzt
         mgMFoO20GESuyiakabaEYHuPMZVRRCDTzBGvImeTvLsehkoowALCTTkk2d6ga5rdjEBW
         F1CQkSzVhzcsbgu1lxKJ2//862c+tp7Y7pqYDzNeWNp9A3vHEuNARu5JMcLx+PBhdjvO
         BB9s2gZ8WG86hxZBtDIoqaHg8wShWEFpRpb2gWxIKkN4BoSB3UBldWSCsf/ePJKU8EXd
         AgggcBzh+ol5iZOkFdlOJZl26CABEdm33iFw2Sm5hi+jRR+gwVqUq82PYpojNSA4wSNS
         mphQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789493954; x=1790098754;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iwEMIxUcVqGwd0ywmsmxiy74tjlp/vlHo04q60UyVfc=;
        b=N/gZ4cK86ql4vOwViUAnlIV+ajDwjkWfmXVg4EWYRam0lWFkleGsAbXWpBHrUMkv9n
         1fHIvPvL+wVvqWVi1MuhW5l0/fYEH4CCkvSzeBpIikYX1+XdNIwPKJJ1GyXnyq/tPM/1
         YNXbOL5P9Lw/BvBQ5jLpLclbGCBI0eiOFzdLIwahhCHwKWLaAebYcHowXLVsLvKLUJyY
         7xKvu7EjHC+CfSBNRwOOqohSGuM5DNVS9ODyRfR1t3WOtmcojrRq7pi3KrAv0zu2TJYl
         8+/wUcEliJ0aDHTLqpAtKHsTsn7bz6fgrNLKcBJ277+uAG1tnHGYIZRhzUgoPXSp7RQj
         pmqg==
X-Forwarded-Encrypted: i=1; AKwUvBzKqZvuX+Ca8/RF7+POH8FkJ0lAAg8s/Vijllai/zP58fvMFxyzD7/40qrVUiZs21bsOl9aLjyRefVSpf0=@vger.kernel.org
X-Gm-Message-State: AFuF++lJ05VTTDsjrtQfG/n/6kdgv0wbEwy3DlprhU/q5MAlzWKSgFy4
	bl9jFDk93Tf0qoxnwV/SE/l4KloUbB0XlYzOZykZZ1WB5YavHLy+6f45
X-Gm-Gg: AYBFou1NS8uLAGXww+G0zNpUncFsITHUB5HwNaM4qK4W3OX0VKY1mwEPQ5P2E7O3gLE
	qZEvVPX+nvLUo8lESwFZzab5uDAkNKNyjTZ07DqrxojtJLF0nMSJy4iIWjgy9X/rbjWEyOSGdmo
	zhcaRTRZSfv5l69kKSz1fj2MSuhYR7wikxkyxl38ruIBe3cJtJZ8ol5MURS3Q6Vnsk8+eVmBpNB
	fStp6V/UkMCkvElve7Nq6jZFUCkQputCntpgpFwrpNNBJSOVcPhwYK1UnpiKNpgZwN1/OwgkWe1
	m9HTGhs6drjIIoourE+6uOiH1DQK7mAFnZzw68MIKFdUcWC/TpYX8fXS0ZjURf/sA+3UxlKtaB2
	Z7wGae43clh9s/36V6eNFEWE7MI/jX/wKdf+sb85gGRWxPgm8lppgNHElNcLOX/MbvqaO5OCzoV
	FJoH+98fNWN1AZ/Lbq2K9H2uGFIo5QkUDfF02du0gyGwngTXEYEosUxAsYvnpcQbi00h4oi+Ilk
	Ew=
X-Received: by 2002:a05:6122:130c:b0:5c6:7f44:b001 with SMTP id 71dfb90a1353d-5c981883794mr5305885e0c.0.1789493953887;
        Tue, 15 Sep 2026 10:39:13 -0700 (PDT)
Received: from beelink.. ([187.13.206.89])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c9989fa82esm176933e0c.4.2026.09.15.10.39.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 10:39:13 -0700 (PDT)
From: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
To: Chuck Lever <chuck.lever@oracle.com>,
	Jeff Layton <jlayton@kernel.org>
Cc: linux-nfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Aldo Ariel Panzardo <qwe.aldo@gmail.com>
Subject: [PATCH] nfsd: use xdr_encode_opaque_fixed for all GETXATTR fragments
Date: Tue, 15 Sep 2026 14:39:01 -0300
Message-ID: <20260915173902.3184534-1-qwe.aldo@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

nfsd4_vbuf_to_stream() already uses xdr_encode_opaque_fixed() when the
final fragment is shorter than a page, but the preceding memcpy() in the
loop body does not clear XDR padding.

When the last fragment happens to be exactly PAGE_SIZE the short-fragment
branch is never entered, and the loop exits through the normal buflen
path.  If that final page-sized reservation is not word-aligned within
the XDR stream, its padding bytes are left stale.

Convert the loop memcpy to xdr_encode_opaque_fixed() and drop the now
redundant short-fragment padding block, matching the first-fragment fix.

Suggested-by: Jeff Layton <jlayton@kernel.org>
Cc: stable@vger.kernel.org
Signed-off-by: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
---
 fs/nfsd/nfs4xdr.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/fs/nfsd/nfs4xdr.c b/fs/nfsd/nfs4xdr.c
index XXXXXXX..XXXXXXX 100644
--- a/fs/nfsd/nfs4xdr.c
+++ b/fs/nfsd/nfs4xdr.c
@@ -5963,15 +5963,7 @@ nfsd4_vbuf_to_stream(struct xdr_stream *xdr, char *buf, u32 buflen)
 		if (!p)
 			return nfserr_resource;

-		memcpy(p, buf, cplen);
-
-		if (cplen < PAGE_SIZE) {
-			/*
-			 * We're done, with a length that wasn't page
-			 * aligned, so possibly not word aligned. Pad
-			 * any trailing bytes with 0.
-			 */
-			xdr_encode_opaque_fixed(p, NULL, cplen);
-			break;
-		}
+		xdr_encode_opaque_fixed(p, buf, cplen);
+		if (cplen < PAGE_SIZE)
+			break;

 		buflen -= PAGE_SIZE;
 		buf += PAGE_SIZE;

--
2.43.0
