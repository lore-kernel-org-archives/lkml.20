Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794181785;
	b=Ylnr+GpXGuIJboqc9OirW2M1RJ9i9YEV8v92itXagwhZXL41BRdSuCAC2dh8gzoP7gpF
	 Ka9Aiq2wGhTL42fruBm4CqUsdaw85EBLHkknrZxXVdJHla9yhZhAT6Wc8D9vmb79roOni
	 rm3mWIrmHswe7LcnwyN/hi1ze5YckavMTJ2s7Qc6Jnpk9hEEvgLfKSveyrp2aX9wNKPYN
	 hBcGNFXXuzxHRgRDTin9BL/LG1bG0X8+9wlOqNCL1bO+3kAzMKSbmgn48fKewbsrhbzUf
	 LFT84DdLxBTcPFyqOExYC15zUKBB4rI7y5vh6pExpPLAtE0uL+T54PY9lVuRm62qlGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794181785;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=r4f2V9+bqMcBY5LtQhLJ3jd3DFlm4gkj1qoIPg+cYCY=;
	b=5dWHcpxhJ0Pl1Nnsd+ZelqrhcUwRrZcRxCj5j9AqdHhhSUl42Clt1uYBUzD2SJz4uLF3
	 r5I+WKqk4FnAZWsfM0F2X9CWsnB1pC7R/mgqkItDutgyx0p0HwXsMrwwvqzKYfmdNO0uN
	 AKhrM8OTH7BVBVmKNK36EgmoAyxM/jBZoLE5zCT+okU1C1SMAi+YKEe2zhfNa8rV+DC+u
	 xf6Tw/+vFgTFtYnX9z+iU9qqA/KF6+KngKj5k0/tEsPDumZzzX3N6cQZBwSQspFC6YDPY
	 XtBd/+oiA6PdI5oCChODmqDcsjHe30scWBMyuVfm4SHXZm4akbEGZI2OT1yeGXHuTyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XlLKAp8H;
	arc=none smtp.remote-ip=209.85.160.45
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C0EB606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 23:49:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C0EB606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XlLKAp8H
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-4ad89c49e0dso75153fac.2
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 15:49:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794181784; x=1794786584; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=r4f2V9+bqMcBY5LtQhLJ3jd3DFlm4gkj1qoIPg+cYCY=;
        b=XlLKAp8HpCKak7hPhl/CidyJ2ie8n+3ETG5E7d1AGblktewV48v5X888+U/+DckjS0
         7swldUPz2MZQ8WJoguMPB62HzcMdFLpRU3lOnzfhjrea7IcVRY1WX/3EHF9ERiPRnDBB
         7MilAXgDcEJWpGl6HTcvAUCvtIP8zgSGbCuogNsHP90S4VMnYvtDC9N2qssgG+UjxbN8
         EAeEwKaqSFybEBBFucszbzIKiNhSDctzr3ccGjjqKXGVf5jGx+HTBfAl2oV7cWXulhIM
         Cib53bKbBEgT5UFwfzU/fokf/a6dvE9h7PWRXjR7Df1jVxh80pB2JlbJ8YouyoGimR1x
         NVtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794181784; x=1794786584;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=r4f2V9+bqMcBY5LtQhLJ3jd3DFlm4gkj1qoIPg+cYCY=;
        b=Lj1eifWV8Yb/XmINXM7WbNTh7BWhEUqhq/X9FshrBlwjSRg8DUwbegsLG6mNAYQdUf
         XI1RFlu/pkCFpJsuBhQoWBl8pDcbad1NfgarhCVveb7+8BdS0fXBOhsWIhsnKoyeL5Vt
         XcX8lxEx55ih970xUG+Ghce0j4Zq9Nqits1hADQvunvCPrb7392S2vdEPxY/EjomQ/2J
         X50pbiZ7GhIP3WokQwTNn99k+dpTZPnuc4H7SUhAjKdaErO23A7zo6BJuN2plhrjRUp5
         Wuc3u0pBmSvgQRwN4s7uDZ31t/GzpnCojY9ok96Q/KHvFRLRdBxWObKXrGsvlgzxpPI/
         NzMw==
X-Forwarded-Encrypted: i=1; AL+hErGoaL/ErtY3QelCJCJ2+kgNxUd/23SeMOE0gSmrOiGjkUQOlwt0WwlLxxvZd98rBYuWYX6e4chl68tvhl8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/BrDX3NUBz1seyf8Vj+3q9aEWGGJ6wdUxUIotn94CWKgMw5FZ+
	SbD9SExx4ruzi1TmQdiC0Bn80hg8lqFvG84Czoq/bhGbALkT1mIdei9+
X-Gm-Gg: AYBFou3tvX8g161huXpvbahlpwru8z+LXM/leh9Y7bSArXdHInm6O2cIjQu/j7Ho7pY
	jBrILlQ/Jchk9txQKZwAjUGmZiJdtJ/XEBustz4nSaCt/i7EzuV398wiTbB38q9r6yEOt7GFkK1
	/DX49mNbGxQcbhKILLrWWlijSAy0RZNbzzrtCBLXXY3Nc24xNxGTIz6i97p6x7OLupcTvqDDw1i
	im/h0UPPtC7nbeV4AcbPmYV2bRF1EPv3zhQb8PGayMfTWjXW85Bv3OMRPuhWkVWevrwT0CFJe2X
	/ER0mrdSpO+nt9J8QZNqJ1nsWdH7AV77WS3BpmZsCfRO2ctNWVQG9dl2HqT18Xp6aXiUGi2aAXZ
	iXSAOd/vP0UqkhrsOFzBUlCezpKZIkDZbcdhlNilBRPrXJF1dnKZS+SrUtI4wxZkbZHTwcDvTF3
	SVy6TnxhJJKL0cwkuUZ7pjM6RnYAWa4gM59TzBswUWLSvjlhHuYSsN/YRn3C5Z7D74R2Ev6KhTV
	I380Qkv7Ak7e63OTWMSPCUzflsEEfCEsaj8zO0sryMtJNDDeSzeMXLOZVrQ+UFQ/HrvViGNRIpV
	ykK3OTso6UhaLDdc1LcTEFdLE+0qeWUMrbK6dAaa/KgbtKm+6BHGempkGYd5qsg6wtjZd2qZi1D
	7tTcP2RUpFwu5f3W4F05EsguNM5/Guc8c2UJd0fZrDJXCE5QtcDMeV+shHj4AYn65aj8zmtCC/P
	WOb4/SF9iiAFAT5odYNKDxAArsOfED5B1G803AAHNlJr//V0cTJYI=
X-Received: by 2002:a05:6808:11c9:b0:4b9:a88b:8884 with SMTP id 5614622812f47-568144741e2mr1314581b6e.26.1794181784299;
        Sun, 08 Nov 2026 15:49:44 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56813ac6352sm3019435b6e.1.2026.11.08.15.49.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 15:49:43 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH v2 0/4] mtdchar: keep data and OOB aligned across ioctl
 chunks
Date: Sun, 08 Nov 2026 16:49:11 -0700
Message-Id: <20261108-submit-mtdchar-page-chunking-v1-v2-0-838cf8934ba6@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42OSw7CMAxEr1JlTSAfET4r7oG6SNLQGkhaJWkFq
 np3nPYCSPZiPONnzyS5CC6RazWT6CZI0AcUYlcR2+nQOgoNaiKYUJwzRdNoPGTqc4N+pIPGiO3
 G8ILQ0olTpc5KKsOMsw1ByhDdAz7rhXu9aUQ8nc0FWxJGJ0dN1MF2ZYTkQ+ltC/0OUu7jd31x4
 oXz/zdYjIrLSWomj5Ibe2u9hvfe9p7Uy7L8ABcSfA0AAQAA
X-Change-ID: 20261106-submit-mtdchar-page-chunking-v1-668636b0becd
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 =?utf-8?q?Micha=C5=82_K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.2

MEMREAD and MEMWRITE split requests into bounded data and OOB buffers.
Their chunk lengths and flash-address updates must keep both streams
associated with the same pages.

An intermediate read can consume OOB from pages beyond its data chunk.
OOB-only requests do not advance the flash address between chunks, while
a buffer ending within a page's OOB can leave the next operation starting
at the wrong page. When the OOB buffer is the limiting factor, the data
chunk must stop at the same page boundary.

The OOB-limited case was found while testing a proposed BootROM-format
MTD view with 1024 data bytes and 1152 OOB bytes per page. A 64-page
request has 65536 data bytes and 73728 OOB bytes, but the original
65536-byte buffer limit lets the first operation consume all the data
while transferring only part of the OOB.

First simplify the page-capacity calculation, then bound OOB in
intermediate reads to their data pages. Keep non-final OOB chunks
page-aligned and limit their accompanying data. Finish any remaining OOB
as OOB-only operations once the data is exhausted, including when the
last data fragment ends partway through a page. Advance by the pages
consumed by either stream and limit OOB-only writes to one page per call
for raw NAND.

Assisted-by: Codex:gpt-6-astra
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

---
Changes in v2:
- Add a fourth patch to finish requests whose OOB extends past the data,
  following Sashiko's review of patch 3.
- Switch to OOB-only operations once the data runs out, including when
  the original non-NULL data buffer has zero remaining length.
- Advance beyond the final data page when OOB was consumed there, and
  keep raw-NAND OOB-only writes to one page per backend operation.
- Link to v1: https://patch.msgid.link/20261106-submit-mtdchar-page-chunking-v1-v1-0-2973a03531bc@gmail.com

To: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>
To: Vignesh Raghavendra <vigneshr@ti.com>
To: Michał Kępień <kernel@kempniu.pl>
Cc: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org

---
James Hilliard (4):
      mtdchar: calculate OOB capacity from the starting column
      mtdchar: bound OOB reads to the data in intermediate chunks
      mtdchar: keep OOB chunks aligned with their data pages
      mtdchar: finish OOB transfers after the data runs out

 drivers/mtd/mtdchar.c | 82 +++++++++++++++++++++++++++++++++++++++++----------
 1 file changed, 67 insertions(+), 15 deletions(-)
---
base-commit: 1c1a342aceec79528b3ba51f376eca2be5928fe7
change-id: 20261106-submit-mtdchar-page-chunking-v1-668636b0becd

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

