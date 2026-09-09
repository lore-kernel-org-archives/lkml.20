Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D47B1470EB1
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 08:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788942645; cv=none; b=UcTA3lrlPaBGLCp+n3RKMzisEJ1ULPd63cQLmD2nH7edaBT07nDHXVW48qID9rn3uYoxJ0R81fIG77oHNJnXCD+B1hj404EpdrZ9urTvfNI30C4cWTmLtQBI8XfMAdOH1jJiGJtsR3aRMhrYltA1IMurs1IN6flWA4gGswRJDG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788942645; c=relaxed/simple;
	bh=83UV4H5oW9GOVXeVr5VHR3mV8RREjaWoBNG1Uyn41Ew=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=W7Ixgj09nBJrPM+Da6EwStphS0t5vODq+tMvlVIgBeWKnVPpmbeikyW4IZ2qdPlTB29c3PGo+hkkiGAuJiDgCCk/cmE9rRSUhILMUTCGjMkU80qwnkB+LRHpyGtHMJUa/VKnNxfTuG2AmYE75ynsdSEcJTSMRdcT+4P59JRxOZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KWD3WElS; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KWD3WElS"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3964dfb5b9aso6712153a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 01:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788942639; x=1789547439; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fHN/SN9hwaOzGl3hreMqIt0mqEZ3PQOgvVl19lBg7Nw=;
        b=KWD3WElShJv3Zbp9ElZz8WYv0y/3FCDy9dLjGxqPLwbYltoW68GElRmSxeDuSwzlu3
         atybAAn80D2YBYJ73+6X4rN/6B2/hSffHmGPC4AAe4FjUgVcFSgNGtro5mVq3BQ7q5rU
         bhEgWIfF0UuZ+rLGoZJnIG1MjVGNSuVISToiUxM0V9Fq0KFe7qv7Jj3lr3W263QBZ+Uj
         qpcHzouKJtPfvFOe2dbLuzQn3ffv6mk0cYAPfmAtXsRBwAutSHTsW3XuJJyBpVWav23h
         dlGfnKuTicLtRdtcU12UNeLKK+kojaQrL1KI3o40EVtus7OQfaj8cNnW1ckMfkFCMCl1
         l55Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788942639; x=1789547439;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fHN/SN9hwaOzGl3hreMqIt0mqEZ3PQOgvVl19lBg7Nw=;
        b=JRY1/ClPo68WzVnfBd7EcEP9JR5w7JmCGOKLavhrsxrgINcri5WPKJ1Tjkmt3mc8pJ
         ANXSBsBYd5TWUsS9EoIb2rtXcPpqbbimvw2FQl8CNHvgFNMBw93+qG+Ek1Ap90q5cWUn
         SGnRuRMw+rdlQtIXrUt/NS6nw7pSI6eRuzLPldRX6TuikJPSAVQrtL0zhSS+ldEo920L
         ZzpZP8rsfw/3XmQBcOJcvEcEvxIjHz0LPPSmwu7tii74Q7rqu/tRoum7JCbJRlonY/Lt
         Khl8wFRyaNoKxXmoLUHtkBIm2D/PscJFrzgEDMo2zOqOal/+VLnOS2NrO2otXXTiz+A4
         hk9A==
X-Forwarded-Encrypted: i=1; AKwUvBxmTFDYpoifLtYZU+H7cMaJU0mT1aSjbpatKk7KTIAkq4XKbAWnsFEVW3RuBNM/1ErXkc196Sec3JX/OfU=@vger.kernel.org
X-Gm-Message-State: AFuF++maui5wN/oxJJnbmT7Tuc+LCIGpQC1vKb7mWJc9+bM5x7GABeSI
	/SyuSi3H+VECKMbR4eiSXxjKh9yTeZZAm+kuhQM4CwTU/4fWDO0HzmWu
X-Gm-Gg: AYBFou0Ym1Kar8+kX/pmlWrdnXzAquP6Y8FGxiZ616sR8cxLNo8yh5NrJozPu+drC9u
	nOdSdpbTixCFwo9wr2zSGjeXSaGANsbAVFZaPJRE6fz9Xvsnl9kw2Hg73gM6nYw1BjZOdMfPLwa
	dXDY7DddplU9B5M5k9kMLOsqzJRyIV0rmAyEcvhh2zYHWswgxlk5DY1hhHiEkofNL8BhIKgyE6F
	gZFZxZy48rdZMDFRTI4XbX9p8gqrqD2QlWkmzYbwYL9XWAfVCUbpTYCOPtIYSzRVhJaMxPqmoOQ
	K5zxZf4np8nRlSE+7/lsiVgRwICgxwxB0URdZ5rMMLzeuKaMk7QL5wXOxeD7bKIPzOSX6jKLo6j
	pITGBGm12WYwp/CrbRh+FceUUEFDCfJOEE0Ql5TX/VpZHDp0qJi0QPy7UIYP/Mbs/DeXjeF3OgC
	xnW/x+nyNCc75oRcyDAd4KkcrfpCuQgf8xAGUmzLlN/bp7rNLoG7VUjvmWGhbU+Idkb90hFeC0/
	FKcSyFXfJRaruU=
X-Received: by 2002:a17:90b:2ccd:b0:398:9c00:29f0 with SMTP id 98e67ed59e1d1-39b2628fc25mr54300617a91.24.1788942638681;
        Wed, 09 Sep 2026 01:30:38 -0700 (PDT)
Received: from isaac-aneek-MS-7C52 ([103.74.86.148])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33987ccf483sm1439095eec.20.2026.09.09.01.30.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 01:30:38 -0700 (PDT)
From: Isaac Aneek Sarker <alvasarker2004@gmail.com>
To: 
Cc: alvasarker2004@gmail.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nikolay Kulikov <nikolayof23@gmail.com>,
	Andrei Khomenkov <khomenkov@mailbox.org>,
	Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>,
	Khushal Chitturi <khushalchitturi@gmail.com>,
	Minu Jin <s9430939@naver.com>,
	Anirban Bose <boses156@gmail.com>,
	Khasar Munkh-Erdene <02khasar@gmail.com>,
	Jennifer Guo <guojy.bj@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8723bs: fix unnecessary else block with only a break statement
Date: Wed,  9 Sep 2026 14:29:38 +0600
Message-ID: <20260909083010.13064-1-alvasarker2004@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Warning found by checkpatch.pl : else is not generally useful after a
break or return. The function would reach the break statement after
if-elseif block even if the else block is not used.

Signed-off-by: Isaac Aneek Sarker <alvasarker2004@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_recv.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index 3c82012fdc6c..a203ef8bd6f6 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -1789,8 +1789,8 @@ static int enqueue_reorder_recvframe(struct recv_reorder_ctrl *preorder_ctrl, un
 			/* Duplicate entry is found!! Do not insert current entry. */
 			/* spin_unlock_irqrestore(&ppending_recvframe_queue->lock, irql); */
 			return false;
-		else
-			break;
+
+		break;
 	}
 
 	/* spin_lock_irqsave(&ppending_recvframe_queue->lock, irql); */
-- 
2.53.0

