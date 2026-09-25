Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B4BE4D2EF8
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 16:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790353807; cv=none; b=NoRFIVDHWtijJa6a+PWQKIrwTor/9DJcrEzuuUYWNSMdSAEQJy1+c2aqeXH4hsRzB7ptWYobtSyJUP4OygueGGN/Sbpg32JnqMT3jI5GtTxqKbqJCDuQme6vAOP+lGf/aLRsQaW0lO+XZS1zjeW9wkDXptAS2izA8APMjgax2ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790353807; c=relaxed/simple;
	bh=4UpX6srx3oLFAGEMM8e8NdsoDG1s4k5Bpof+TJYVNYE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=T+JFMRPuyGFPFmA+6Xdjq8rnCY9pyCfnd2U7LbprQrt/oINZawiKiLkrwLMRZQ/AE+AW/mdUQM6bNstkSGFRALHvnnmMJWvA+5RLSKHUdzgLncl9N/1MTRol5Lh2GJPCVeVz0kVxq7wUJBOpuQp+7N6dIi50VL7GYKZ4Bkva1jI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BQUAlspL; arc=none smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BQUAlspL"
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-4b28d9537bcso653019b6e.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 09:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790353805; x=1790958605; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=unPCMDEhiQkXWt8fmU0VRBGU/w1jOtQEuAK0OF4Mp98=;
        b=BQUAlspLJnqvDGqrH1k6EPreMvLpPxsC5SXrqnYpXCxs95l/W6sL0MOOCRdXaV4kre
         fJRZw91rO8i0eX2ZUHXk/TZUnYYdvlfHx8v8XZVGfLbJoo0sP5hSSG3Xbg3pMuS1m83W
         Cil32fVrJ43wrNo5mxDUiti5dL8rCsXaRRetRxEQn1Sk5RsWKJPgjVNbjkkxMYNIeiGD
         HLIQD2ykkts7i4D7zjVwEQNcvX1mZKOvvhye+72UgHhXPwmVj/JRZ/0lLAl6O4Hse+TQ
         ZShgjHrHjeMkZzY7xnJYuEUoW3obEfsfcYJ9Za4OYNMK8hrhBV9e6asz8UfxLJYDsC4e
         GYkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790353805; x=1790958605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=unPCMDEhiQkXWt8fmU0VRBGU/w1jOtQEuAK0OF4Mp98=;
        b=A2tmNcvAjpju2dGY8SVrJU/UFYRwvCNWQ/C79ktgM8+bt+7303fgNtlUsX49mtDKoR
         ExsUcTsyOe0JSn5omuT51cjOBA86dMFsej706Q1djULKTIkvohKRUWUjo9DGQMWWCixw
         RwOagRd1B9FHtkc2oM26lk/NhYSO2RXtTRstlBWg01Gp0glWRcLe/PIn+dVtLwEiNRqh
         LoLT9Xnza+Fvg9WdaKkAyhCvxH46ZantOA7Ybq3f29kXdJOHMybh0KcmwI6HvFOd7W3F
         Z4Vo4kx4dd0jupzNIffiUtrA6viq6YgDO1rA36vRBSqIMAaBo40zt+JLQVV563RMLPSZ
         2+VA==
X-Forwarded-Encrypted: i=1; AKwUvBxcA6NHilN19F1pfnD5YkeJOQIMMx2BVOUJhqmOkr5SxaM9mifC8Lq4vzPSmhIACXsXXZedumzacDi6/d0=@vger.kernel.org
X-Gm-Message-State: AFuF++nHNCtACuq4bEgU+sti+QBLGKUm/h1Gtli/imE1wrv7UxkdqwcI
	Qsc0j0gyJVlzXTGUeVgE/gj3Er1JZADnigjMQuWIpJ7Y4dOVDIitMv2W
X-Gm-Gg: AYBFou3Rccmf3uzEuucfi/VyB1RTgvMoVhD9Jru58ZRS5hVf5c04fq/ApnHpcBTm+OA
	r5oq19iQtj8OT3dKQOM2zIeqDhb2CnO67VwUpxNTfDiJl4WNi/tquC7wf8Lmhmk5CQeF3jYCJeK
	+Ni3ib8tQb7KkbxGzddFTj9hbWYCFKU4KQOKSSVAzzEhkwYSGXjy6pXwxPAjtVenoyW4/3noE6H
	EZ1higJiZu6Sz62ati0gZmeUXM95UBgD1VxRWR/PtLlBDlfYRHrHCwvJ34HTA7BMrGEbMmVcX8E
	9VD2mKoc4RF+DS7zC1wa/S6afEQTgtRIfKSTXBzaZAhr9i1+zi/jliSGOukCZkxvvLTFm2MAixg
	gSuf2nipmPQ6emyXiH3j4V99Vc5IWcG0IOPZ4JmSxOHy7luUf7kOZhLySam1Ym0XMfafhW5HRLa
	3kyw9kgu17998ZUAdqLK/5wiu5XTBaeBOhXT6n/Pnor/gu30gOtcOxtPkO83bNqk8lWN7/SQC5U
	w==
X-Received: by 2002:a05:6808:3508:b0:4b8:4703:db90 with SMTP id 5614622812f47-4d72c73ec5amr6529895b6e.25.1790353804577;
        Fri, 25 Sep 2026 09:30:04 -0700 (PDT)
Received: from pop-os.. ([24.32.17.59])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4dbf6209b83sm2164628b6e.10.2026.09.25.09.30.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 09:30:03 -0700 (PDT)
From: Rishik Yechuri <epicrishik@gmail.com>
X-Google-Original-From: Rishik Yechuri <rishikyechuri@protonmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Rishik Yechuri <rishikyechuri@protonmail.com>,
	Gabriel Windlin <gawindlin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging rtl8723bs: align function parameters in aes_decipher
Date: Fri, 25 Sep 2026 11:28:27 -0500
Message-ID: <20260925162828.221356-1-rishikyechuri@protonmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix checkpatch.pl alignment check in aes_decipher() where parameter
alignment on the second line didn't match the open parenthesis

Signed-off-by: Rishik Yechuri <rishikyechuri@protonmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_security.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c b/drivers/staging/rtl8723bs/core/rtw_security.c
index 3de102a27..6a4e50d71 100644
--- a/drivers/staging/rtl8723bs/core/rtw_security.c
+++ b/drivers/staging/rtl8723bs/core/rtw_security.c
@@ -966,8 +966,8 @@ u32 rtw_aes_encrypt(struct adapter *padapter, u8 *pxmitframe)
 	return res;
 }
 
-static signed int aes_decipher(u8 *key, uint	hdrlen,
-			 u8 *pframe, uint plen)
+static signed int aes_decipher(u8 *key, uint hdrlen,
+			       u8 *pframe, uint plen)
 {
 	static u8 message[MAX_MSG_SIZE];
 	uint qc_exists, a4_exists, i, j, payload_remainder,
-- 
2.43.0

