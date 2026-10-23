Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792722075;
	b=Yf1ehoyC9dHiNWoSDGfG3jIOtA4s1ywd299V7Rnvn9xUcpPO5k8S7qFqdHwfvsIAyhl2
	 P8NorXnliOPHK9aSiOPTSnFWc1xbJNHZmIK5PJb0vLtWeuWe8zViGM1aOfD1+m6yym0gc
	 /wnWBcJsHaS6HDMas3MO4JkRiwg3tYPXzi/CeP5jpDczt83yMvwJZTg4YCTuZhbSZY5bY
	 PFwctcyBDgzS8xjDOZ9DRjd7zeZOk50Mcs5X5iEZLWk3aBQM8dMYLld43qLK4CnyNN+BU
	 5mArT/i/oR8UDj59KBDcDISpd0yV6Qx5/7eWponIaM6UbVfoUzlkzd1st0sUJYBUihA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792722075;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=XXX5hCVe20W2DEnZ0HF+fr0EqmB3/p1IDPVPZBeHOFk=;
	b=Fol+8YtOzqzP6YnkO/w77eFsgKcKJLfHQRlia9BdnNAiHFnr3KANiR3lmWWTnsHf1hBF
	 A7JwNFLDWLz8jCaLoTwvQcXG++yxFsA6oV979NRbJVdaci+1YptEF7PgV8kzm0zBFM27A
	 OycxHQwF/jl2pvzmSZ+AQjy9NxUO7ke84yVYGczih9N5PKpJJ7BmRn0TVsxzzL15sbFFA
	 hLCVW6AHyzWU05smM0TuG9d1KKamCzq7cq2fJY+6DwJTRJoR4c0dK9bt9aDcSWhenQM4E
	 4Nj7UX2Op2wICCQWrBHAnNL1WJ2Gw/bNXkVQbHjRBzKuJyp+PLgiaDCGF9OUQJjoMsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=D7ulQNAY;
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60BEB606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 02:21:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60BEB606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=D7ulQNAY
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3ada8bc2380so174065a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 19:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1792722072; x=1793326872; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XXX5hCVe20W2DEnZ0HF+fr0EqmB3/p1IDPVPZBeHOFk=;
        b=D7ulQNAYpQewZbA6rR4DxTDcoX9oMPs7QYZdu4flYQ3UEakeUTfC7TOSxNNhi8OAh0
         jDQuD29MTwJKgOS1IOHArMimnzfJvu8FvdSr7izuK9dqyz17oRSlKwzQnI6FdQYMRM82
         G2QDHuzwugLBqXAcH3RQLT67SVYC7Wy9FRlzGyvyonoPH8n2hHqF7Jq7O5V/tnHnkysF
         f7IzCDR3eEDqQ8hrJgkR7w8v3aFcQbqYIa3YUKzlZrlPL7t84828V5X28zkPfi4vqAQy
         wZwqaNglqVCbGHBLfFWt4ePexQuKzGwLdr1kdzFwULfW9msWfuVyMNwPXDotZKh7xJcR
         nKmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792722072; x=1793326872;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XXX5hCVe20W2DEnZ0HF+fr0EqmB3/p1IDPVPZBeHOFk=;
        b=pp/hfoJxSXjQ27IJZKBPQAL0xK1Jjm8rkrWnM3OEoq5tpIieNU+t8WgmQBwhqfmu44
         DiWmJVQF2PL4+TUXGVqg0VBr0S8IZa7Lt374q2AZxA4+rnPA1oBgv4ZZkvL0Q91JQYKd
         4bAA5TIyey+zHxxpBlAItYKcM0Pk9DLM6QIXpeT9BNzwJ0z+oO22hn2jduKWMs/3Lq4W
         uKsoSLmZuzf6fhQFN9JHep3gMXfq/Sg2f+g9R75jXO8onpYmKzsmUFbWP13iarzPCJgl
         VG0XyUW98PXuH+9AVLYbs3ABaYPdxcKEhCTxA9aXkCxCdNjH9wcKdUcbbGsId0YrWqVx
         /9eg==
X-Forwarded-Encrypted: i=1; AKwUvBxkpwJJzKxvD+jY4u+Jh/JWzu2ytEt8cSdPvqCBlb2ztthuU0wRhi4L1ZQYEVTlr3dLa6oJkIOjvp7OmB4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKSmy2hhZWEKSIYb9jp/y1Vi2tGNBohGHpsU8DRyDQhirJhCXRz
	jR7BrwDzgKXMhbR2aZxPEWwDiYL/nz6wgUUPWgasJAByMbvGPC7owHtBIrc5cXrxPf6PyTSCEdt
	pXYRU
X-Gm-Gg: AYBFou0nxQnh56aLaZnpJv4TeeVqSKchZ0gpO0jgG/pZXFsdmZGxhuYNcK2SGc9IfCY
	GiJxEMl5wAAFmVmXPvIuEzw4TpZft/FrBz8FESwdp6EVxqqJE32dBIxMyqXPHD52DJKjbHAvv33
	dTbISmxWcmjZM12+Fb3VTFbGu3QSFe52QCH69fdkH82GhreRcflORtTEszxxANVmmHizhnmU7FE
	u3fIA6cF6txAvhnFrpyq9YTVvSo7BkSPGue9466p/VYYJ3Y+xETxDrY4h0+8wCm9WltAdTW9vim
	cqjr0NUtU2XkmJ+RCudzRNkU14oeYy+HWQcgXlnYJYZMySjcJqDvtCDkiTgM9a8As4VeTAHmjuf
	uhnykGOVXmwwuY3QHbXV24AmvYekk0tZ5rJGmIvFowuoJX1sLYf/NIFRIWQzbHTN/I+qQO6tHkQ
	rAJWAHp91tMiX+SEm61J/7zsNZ/lMOJC4V6RZUsCaMtp7nJMYc73iHroWtPUTCdtIg6+jRMfO/i
	e2EXIFhG0RtugkiMMgM4GjfnI14JhnNaWExp7pPM7x6QYPphPbrNr+DG5poJNxVjjJ8c+IoLmLe
	jmA=
X-Received: by 2002:a17:90b:1fc7:b0:3ad:3715:d21 with SMTP id 98e67ed59e1d1-3adce7ca8c9mr598095a91.49.1792722072334;
        Thu, 22 Oct 2026 19:21:12 -0700 (PDT)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:13e0:b266:5a7d:e119])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3add2994cd2sm183922a91.3.2026.10.22.19.21.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 19:21:11 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: Nihar Panda <niharp@linux.ibm.com>,
	"Martin K . Petersen" <martin.petersen@oracle.com>
Cc: Benjamin Block <bblock@linux.ibm.com>,
	Steffen Maier <maier@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	yhlee@isslab.korea.ac.kr
Subject: [PATCH] scsi: zfcp: bound the RSCN page walk to the status read payload
Date: Fri, 23 Oct 2026 11:20:56 +0900
Message-ID: <20261023022056.3106651-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
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

zfcp_fc_incoming_rscn() takes the number of RSCN pages from rscn_plen in
the received ELS and walks that many four byte pages out of the status
read buffer payload. The fabric chooses rscn_plen, it is a 16 bit field,
and nothing compares it against the payload. A value of 65535 gives 16383
entries, so the loop reads up to 65532 bytes out of a payload of
FSF_STATUS_READ_PAYLOAD_SIZE, which is 4032. The status read buffer is a
single page and its payload ends at the page boundary, so the walk
continues into whatever follows that page.

Every iteration also hands the four bytes it just read to
zfcp_fc_enqueue_event(), and that event reaches user space through
fc_host_post_event(), so the bytes past the payload are reported and not
merely read.

libfc bounds the same field. fc_disc_recv_rscn_req() refuses an RSCN whose
rscn_plen is not covered by the received frame. zfcp does not share that
code, so add the equivalent test here. Compare against the payload size
rather than the firmware reported srb->length, because a bogus srb->length
need not reach the payload at all.

A conforming RSCN is unaffected. An FC data field holds at most 2112
bytes, so at most 528 pages, well under the 1008 the payload can hold.

This is an out of bounds read and an information leak to user space. It is
not a write and it corrupts no state. It assumes the adapter passes
rscn_plen through unchanged, the same assumption the host bus adapter
mediated paths in other drivers already make, and one the driver cannot
check for itself.

Not tested on hardware. The bound follows from the field widths and the
payload size.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Signed-off-by: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
---
 drivers/s390/scsi/zfcp_fc.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/s390/scsi/zfcp_fc.c b/drivers/s390/scsi/zfcp_fc.c
index 05d0812978798..24efd29b66bfc 100644
--- a/drivers/s390/scsi/zfcp_fc.c
+++ b/drivers/s390/scsi/zfcp_fc.c
@@ -270,6 +270,18 @@ static void zfcp_fc_incoming_rscn(struct zfcp_fsf_req *fsf_req)
 	no_entries = be16_to_cpu(head->rscn_plen) /
 		sizeof(struct fc_els_rscn_page);
 
+	/*
+	 * The fabric chooses rscn_plen, so refuse a value that would walk
+	 * the page list past the end of the status read payload.
+	 */
+	if (no_entries > FSF_STATUS_READ_PAYLOAD_SIZE /
+			 sizeof(struct fc_els_rscn_page)) {
+		dev_warn(&adapter->ccw_device->dev,
+			 "An RSCN with a payload length of %u was dropped\n",
+			 be16_to_cpu(head->rscn_plen));
+		return;
+	}
+
 	if (no_entries > 1) {
 		/* handle failed ports */
 		unsigned long flags;

base-commit: f47d223627f80cb7a1eb14c585fe6cb35de5e984
-- 
2.43.0

