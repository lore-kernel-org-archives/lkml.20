Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6978B3BD24A
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 11:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791374087; cv=none; b=HdxEzYFXTLVvg0Q31qK4EDA6d7RxJwD16LCTb9uPCwTiFzO+ETCi8uTVQfCwJ+gJFyLhlpRg99U7cIsyzna7sULxgOnSkm8wLU6W3c2nQgzGVo3IFad3M7eADOGwUl91u0VlMf+A1gNj0G2PZRGinbEVS7PTBYaZyfV73GlEtr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791374087; c=relaxed/simple;
	bh=kN3NHn/uG4U+TVnyRB+ACHbxKrEpe/8rNj8DDubwavc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d5EyPEzEUytxkosldPGDxHvCPJp5SjObf8xvW3M2E8fhx85a8180+2KHHuE4PpV1LQGkdfErIQsyyYH+7cJeHqhA65X2hG3gFDuU1jm+AeVbwjV7mdHWvdlxk4J0jUGEAnw/yJ0B76U2W4r7EMacfmOg+KCOAWYbrYPsh+wJbV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WTwR7ubH; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WTwR7ubH"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3a02551822eso1714828a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 04:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791374071; x=1791978871; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8f1OKiZ2zWxDVgeWHYI0w+iMSXqsMffFWKgPnrBiqBY=;
        b=WTwR7ubHjQg5DSV2pwjqczVODMPLSuBN371mD4fq/vnKlQ1NuFuGrfIca1S9VpNgjG
         uWvpTEffEJHIBFaz3XxPtgogtiD+y8sVvW2sD7nScvG/HbAl+OC0Cozmec/n4cqkd5WM
         qsPAdrwzepQAVRUgszSJrjhNdatW61dckrkJ2Tx/cCWRrlQ9pWKwRri8J57uGwenM+Jj
         0Xd8vOgC7w0gAeUurwWsPJLTL2VLfNwKtko+0E1B/OkoTql2wRrZ9Kkz+fbRbFVsKvwB
         TvanTYVuhyjA1963pi1f/d+ez3thEZj4s1AseraD+MUDIG8+QAAwDX39jwfP0eduYF7P
         fyhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791374071; x=1791978871;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8f1OKiZ2zWxDVgeWHYI0w+iMSXqsMffFWKgPnrBiqBY=;
        b=MzBpIYkEdSt3yyd5uV9khKkdjIJBwfI8aK+ngCjaeBtGnEiyEIjXvtvGoaukt/RhTs
         Zw/iS2bBm/qNEi1tymg0yPlMyQ45SOYGy8EKbK/PZN6mIvh0oOLv1AhGNmU5AfcUnfkX
         sckTWqhJYt2uBt7o3ixHiFHqMzGZvz7K58b1byjv1uNYoBki4fmHIDftah56k/ni/BPe
         Cv57UMlu67suqAUg7SUTzuBDHiyBvWyXc2+DeVuDIGLWh+aYUPpZGxnsPBvaLo6ZfpUk
         KUp+nOiWQVkgaroGz7OLE7hZ++8w7ruddq324KvwhalPOA+cI4Fvv1cu15KAqhEmfyFH
         F8AA==
X-Forwarded-Encrypted: i=1; AKwUvByFdJZ1BF8xygWzKINjD5MwwIlgUmlH9GtJ6Dp7XMdWkj1Mzsj373G3zd4Oam6/f+en1xyUZsoaz6xn3ak=@vger.kernel.org
X-Gm-Message-State: AFq9FYLbQHg7J/ib39t+a7QyoZQh7H5Y/prq/Dn6WRd4S+uI7DJs1ctW
	yl9jyDxXX9zNu0hk05eMJRtWMuahUrxUTiLLq9u4+2ZBefLXPSAmYdfe
X-Gm-Gg: AYBFou0ZQ7FMfsUpCHa2RFsnOkQj9Er948NdWqIVz5DGYPqrWxnww2oZSGlTbNuIpcd
	VjdZ8sT2RVTT57IdcDQmcdWRLX2BiWIwevVjbdENzfqwdlcwdoihO1hLRdY0F2GHROchajstwZU
	FHnmeVypvQ4/OSXxvbrpmcHhLYCQWd8tTV6uzsHGMJFNEoAkl0UwhtCbCTkI+64Srn2pw0+xibM
	ZBs8FfRkC9y8+gzSIpsKF6bBaxeaxHK5z4zqgubdfCJAw7S/YgJ3ntWWDmLTmuL2+fMNgeBEUGL
	saDYL+rCQm8+iZjvJlphy8dpOUF8a6fsCm5MVOssWjiHQ3Z6Q3iJS1Pzw/PbEx1NsyNLZ8gE5WT
	c7C3P402zD0DKEcGKUAOptaaPAzE7QBgpl4C9eYdf2vaLXl4ln/xfr+1y58SfkWxyWhQ8MsugM6
	rbCpXlr/5KAVHY30VaQI7VdXDLaWR74KoD9dOdybChMWZlz6vZoEofmqOU8G2Qcv4iUqtYhBLKO
	w==
X-Received: by 2002:a17:90b:2245:b0:3a8:21eb:2e1a with SMTP id 98e67ed59e1d1-3a8a12be15dmr1284625a91.30.1791374071555;
        Wed, 07 Oct 2026 04:54:31 -0700 (PDT)
Received: from host ([103.103.208.70])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a89b625d01sm4160128a91.14.2026.10.07.04.54.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 04:54:31 -0700 (PDT)
From: Pranav Desai <contact.pranavdesai@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Pranav Desai <contact.pranavdesai@gmail.com>
Subject: [PATCH v3 6/6] staging: rtl8723bs: use u32 for length variables in rtw_BIP_verify()
Date: Wed,  7 Oct 2026 17:23:42 +0530
Message-ID: <20261007115342.1121742-7-contact.pranavdesai@gmail.com>
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

Replace 'uint' with 'u32' for the 'len' and 'ori_len' variables in
the rtw_BIP_verify() function.

These variables are calculated directly from 'pattrib->pkt_len',
which is defined as a u32 in struct pkt_attrib. Explicitly typing
them as u32 prevents potential bounds or overflow issues during
subsequent length calculations.

Signed-off-by: Pranav Desai <contact.pranavdesai@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_security.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c b/drivers/staging/rtl8723bs/core/rtw_security.c
index 8b67985f6e06..679c957c9c63 100644
--- a/drivers/staging/rtl8723bs/core/rtw_security.c
+++ b/drivers/staging/rtl8723bs/core/rtw_security.c
@@ -1272,7 +1272,7 @@ u32 rtw_BIP_verify(struct adapter *padapter, u8 *precvframe)
 	u8 *pframe;
 	u8 *BIP_AAD, *p;
 	u32 res = _FAIL;
-	uint len, ori_len;
+	u32 len, ori_len;
 	struct ieee80211_hdr *pwlanhdr;
 	u8 mic[16];
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
-- 
2.55.0

