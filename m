Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF91832B108
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 07:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791790722; cv=none; b=lk7/SNNQXZGV3jtQNC91xQI9J7a0Qqzx0bqD4vhpUTUdm0xRMxcBmtjb7a3Hzkmc7WlcijQyd6MPhjfgdVOzQ+rGwILrRGY28Dkx1mSMuVvnK81+1aIiSZKoay/t3LDRzSyJ5VmEXyUFEvgbFiF1kz0E+09ThUzQdwH8/j031Os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791790722; c=relaxed/simple;
	bh=k/Ste6K7riK4U4H/eng95jFc4SxOT/Gqt0qm28BCbg8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oQhuCJ5qtL9e72KvZ8ZnezU3VOvhVJ1s3X2SuWsxxAj/3pL9f1fZZIyv6sfx8Juc4gLF1+nHMgaWJIJa3TW1cFSfdaPyHt79Dczqe+VwavQqrlPZ+PVZxtt5Fzpa6eOLrOOibH+uFj1J6NlZacXGQ0DlQdPOQ0qY5cJTocQkz5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr; spf=none smtp.mailfrom=isslab.korea.ac.kr; dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b=T+wbXCxG; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b="T+wbXCxG"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-89a595332c7so546567b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 00:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1791790719; x=1792395519; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vZUQvIk4esipOPh6JhqFb4csORQpQ+ynl//reiEHu0Y=;
        b=T+wbXCxGgTnhphpkonj48h6xs/SlKTARDJ10qxiN8638nCpw67LWa+ufKrcYric90e
         /8wHA14wcNI024sOrpaOM7x4Pqg50paB9TabW0TBkbNjKtDGnPVSwXYuM2bfZp7IFSAc
         tF2hkKFKxnprZQAh2Q5EZWd/fUtRgBAvEItrbXuULtGAwpG0oX7O3ePZeWAUZhrs9C4u
         agyFFcoWMr8UBzMXgajbDG778uYizcTZ4g7vz5Td9NqwdxV3/9MfpEM5imHl9HLdN6EK
         J45O9By9FHSLCB53WWTZd0GF2ruoVUTdGcd81WDcMIRe0OwRzwaJQlJFXYkBN8xCPoqH
         msSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791790719; x=1792395519;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vZUQvIk4esipOPh6JhqFb4csORQpQ+ynl//reiEHu0Y=;
        b=dB7whPQcB5N+kvzOxNWD5UkLNjY7XW+ige5X3zwUDzKPNCM/yua2/m9Y+EUKpK/nTm
         NtCnhQAsc1A0rglFgr2doLPBXcvoNpBsxs70a7tyyWDd0Eb5BTu+oYCcliCfUECtrurV
         Qg12+dI3zMAUJjfNwYDgG55mX7HmvG1BFB0rAN7VghLzCXI3rPdrToJn2CJ+lsBdUhX5
         4/CvOFJWuUul/vuZSbTDGbJaRdHkL9zUFS0hHyZAOa7JsCoYYGxkpUb+Ktu6UXMtsFL4
         hmy99SazxsTFyjGXgcmwF46xpUdZlkQwa0FmVyQMz74gPtRKiO/ypdq+qlNMD3S5zfv1
         mnaw==
X-Forwarded-Encrypted: i=1; AKwUvBxRgnUlCXKd+6n8tyMTtgkpzq7419xqNVsCVkLxynNFDRj6gb2erHkPiMemfmrWkG0pw2v2Rjc/NGaejdA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKWVVQRaH2j2g2i6QET98DAAak+PnBVb9zLOVn4CFD+9rmLj9Rt
	qrZnjS7WX7MAr2ldDET1jS1hbAq59jzBIV4CUUSWJwtS/TxJ0ACfhqlqulPsvcMpNNo=
X-Gm-Gg: AYBFou0WYjIdeb65Yx/meKDuKXsNqYCEVo85WL0WdAKzwVUkqfIkCPleqprOkV8ziIK
	MFNqnXZ+B2TQ/PkUzbm9BCAGv5Ry6G8HzGgG3sab6BUlpzhavn525pCeryxoO92Clc3LabsivhI
	OW7TpAf61jouwIHAHirT92/3oLysHLmi5r7dUF03GxfT/3VYxC0JbSIvmygeIgS6Nz+U8sAIZHD
	bA8BKDB0fjgO4OLM2be3S3PGz4hSvlv1o3kCTlkrPIVUqWG8IffFFFqxeA2yvoDCqyeg36zC0OL
	nADRLC8tioLNKvTXu2qjzyX4ioUZWFtM+VQ3wioSgQeiS/zobrYQu+nECHB6DWlu3Y0A4XDgnCY
	96vbOt5H2GoaI78crqy0Ga4yQdbtiejfTeIq42WIKUDaAhhpMeQcSNFBcvXb6XzUhiEhWhlon6M
	F3yMBG4NRlGDGmJhZ57uy1KOpUtem55PiStfVXcIZM0CoedwNa/4i/ytxql8cN1OBlN8rqZsKUZ
	Swlew==
X-Received: by 2002:a05:6a20:430c:b0:3e0:c961:b5b1 with SMTP id adf61e73a8af0-3e16be576acmr6010134637.45.1791790719022;
        Mon, 12 Oct 2026 00:38:39 -0700 (PDT)
Received: from yhlee-960QFG.. ([125.131.91.97])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-898c9ee8bc5sm2148780b3a.60.2026.10.12.00.38.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 00:38:38 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: ching2048@areca.com.tw,
	mkp@kernel.org,
	James.Bottomley@HansenPartnership.com
Cc: linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	thenzl@redhat.com,
	Yehyeong Lee <yhlee@isslab.korea.ac.kr>
Subject: [PATCH 0/3] scsi: arcmsr: bound adapter-supplied completion indices and message lengths
Date: Mon, 12 Oct 2026 16:38:25 +0900
Message-ID: <cover.1791789900.git.yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The arcmsr completion and message paths take several values straight
from the DMA area the adapter writes -- a completion slot number, a
type B completion-ring index, and an inbound message length -- and use
them as array subscripts or copy lengths without checking them against
the array or buffer they index.  A malfunctioning or malicious adapter
can therefore drive an out-of-bounds access from the completion
interrupt or an ioctl.

Patch 1 clamps the firmware-supplied message length to the staging
window (heap out-of-bounds write).  Patch 2 rejects a completion slot
the driver never handed out (wild pointer load and dereference on types
E and F).  Patch 3 wraps the type B completion index before it is used
(out-of-bounds read, and an out-of-bounds store when the word read is
non-zero).

Each was reproduced on a KASAN build with a crafted DMA area; the
per-patch changelogs have the reports.  The three are independent and
carry separate Fixes tags.

Yehyeong Lee (3):
  scsi: arcmsr: bound the firmware-supplied message length
  scsi: arcmsr: check the completion index the adapter reports
  scsi: arcmsr: wrap the type B completion index before using it

 drivers/scsi/arcmsr/arcmsr_hba.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

-- 
2.43.0

