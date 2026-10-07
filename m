Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AA41483825
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 11:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791374081; cv=none; b=Yb+2uh9JPpSjAjutjfsJS8PwsLqT0FymcsVOcFiKum7QgEHYCxGPi/XTC0ypoMY/rqi6VCw/JCVTr2zldlCMTt9/74sxam/O48Am9PQensDnfKm/IDqSjFjBTa1H0CfyqhuXQ4dMVT6S+Kw4Vn3YpRUY/SBK1XmVIwJleu5t6y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791374081; c=relaxed/simple;
	bh=yl9oglKIS6N4vQb8skzgFPlLHgV+tuWg/BoitUlDKRg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iqMz96yBrQzaEL9keWtHhJFGOVqfXdyxPiNqZEBQde7oppoS7QrqhDn1LfTLPAz7cdwQLCgIpqoxSfssjLv0VGiW0Qud0Ct4lSErRYYWfSC7nu7AZIg7OdqUmKYHJcAC7nTy1gYZ5PWfNEY9sdo9Q5VC8i/nyjCX9zaB7GhEBZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZwzNNumd; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZwzNNumd"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cc1bc88a20eso2698294a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 04:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791374066; x=1791978866; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H6N/y0p0S9p3UrlhI/DdMbp7UhhJ4fOflMevrjORLv4=;
        b=ZwzNNumdZpVV95BqluXpx9MAxCzPcw7djwUYkco8oVzrRFLV0C1xv+Ayp10MQKhM3J
         5ViS1+njzZdY8hWcP2aYZcvdkc8FG+KEO5gh4bYSKXFSpuKIh9RFoiIbR4urupw2rWD7
         WpbOUR0fPaE8y07+6l3gNoKxntHCp3Bry+McdP8FZWHF8p0FgoScoNndKzN4H09s3DG+
         ab28jQoqaZ+RduGCJlVe0OFyEEq/u/PUBXr63sidQgRWY/jK9IAf8SL/cthQNhj8xYXA
         Pjw4QtLW/nPuihEQ6gZ6VG6yin6I7DvOSEFPchxa+yIp9Pksl6NiIFgeXkQ2oatcC3SQ
         7vGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791374066; x=1791978866;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=H6N/y0p0S9p3UrlhI/DdMbp7UhhJ4fOflMevrjORLv4=;
        b=LvZ63tN6pkI3/1JDDbaTgEXEOAT4z0uEOD09KJjvXeOgW7lsioRhG2VnmS0CKRxwYQ
         8fVb2aSqiygUBkfy4VdaACyY5DMzjzZnao1kSahJzwnyb473O5pPgFG0+BLUKD5Q8Tgc
         TB73Va0639bCRxmwW2tWb+Hpe5mAkqKWpZ5D0+045kOt3BLAZw2joYe6ohBuLBf2wDds
         tLrOMRU+knF8+6Bhimm6/hKq9feAwuRJs7GJZrP6odZZ94dqgCpru9AV5riwH3kbQvXp
         avFUO1PQ5ebxEUnp9s4qNFT7R8q5CE30KB8lNLdwo/5jWZACm9Y16fprAueiq0+n0Tse
         b6eA==
X-Forwarded-Encrypted: i=1; AKwUvBwogvq1HbLqLIcxGwKbf4UEIwVhynPZPgJqn/QiA5ij1M4mMmpFITO6jzgM/R/XSOPKNfQWru4HKxwD2rU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIbBbN4qch0hpQpA3lE+2/5ATCcqk/NmbUnYDCT1VWe3yblyVak
	ujGoT7a1RqYquUCXM/8psmkIktPn3FJTcnyIMWNW1KO4rQiArbaTDo1ZJmVyLQ==
X-Gm-Gg: AYBFou2bW1Aeq50MM2m8sO1trQwXLmSMti9kkIuBKnECkrnzrtJk11fROV+dbPkCAOE
	qFqpEY+cBUng7pN79fev8XUnmAWPaslfD6ZhOXz5VhicNFE0FCmq39a1TAWFlO6IaD3Nhrn5apM
	DM/zVr6v1fY37yd5KFftMIq0/UXpUGEgy66Gl941jhQxPc+K926O3uu4JA2d5gJfbstyaKvBlh/
	v9th91W4BiVK2udbMxqOQR9mof6iXsXUlTzigF4kzXZFLNGsae4JBCRSBcoMBp2AehWabqFHyPv
	3kaz89LLxbP2XIWDqT8/id6rdVWvRw0Aj5HLWQ+Moz2Bhk3iCC4EyHhCMp698BZofBz5YkWlmKF
	JHEtx2mF9UzgmiWHYNJOjtVQN2kzMsFF2Rg29OKPtS0Yn74oV8WPzdZI+bgvma45o3c/Hs0Ouox
	yrmwEYU1Cq3e5peCIe6puZJlRXA86tBJg6goqyephGvRCsKEJpSvtAOj/YtpyT4oXyHhzr9Z2y1
	w==
X-Received: by 2002:a17:90b:5608:b0:3a7:bf13:5ff9 with SMTP id 98e67ed59e1d1-3a8a17f8533mr1715155a91.13.1791374066463;
        Wed, 07 Oct 2026 04:54:26 -0700 (PDT)
Received: from host ([103.103.208.70])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a89b625d01sm4160128a91.14.2026.10.07.04.54.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 04:54:26 -0700 (PDT)
From: Pranav Desai <contact.pranavdesai@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Pranav Desai <contact.pranavdesai@gmail.com>
Subject: [PATCH v3 5/6] staging: rtl8723bs: use u32 for payload_length in rtw_security.c
Date: Wed,  7 Oct 2026 17:23:41 +0530
Message-ID: <20261007115342.1121742-6-contact.pranavdesai@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261007115342.1121742-1-contact.pranavdesai@gmail.com>
References: <20261007115342.1121742-1-contact.pranavdesai@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace 'uint' with 'u32' for the 'payload_length' parameter in the
construct_mic_iv() helper function.

This parameter is passed directly from the 'plen' variable in the caller
functions, which has been explicitly typed as u32.

Signed-off-by: Pranav Desai <contact.pranavdesai@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_security.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c b/drivers/staging/rtl8723bs/core/rtw_security.c
index ff8af1a29b22..8b67985f6e06 100644
--- a/drivers/staging/rtl8723bs/core/rtw_security.c
+++ b/drivers/staging/rtl8723bs/core/rtw_security.c
@@ -631,7 +631,7 @@ static void construct_mic_iv(u8 *mic_iv,
 			     bool qc_exists,
 			     bool a4_exists,
 			     u8 *mpdu,
-			     uint payload_length,
+			     u32 payload_length,
 			     u8 *pn_vector,
 			     u8 frtype)
 {
-- 
2.55.0

