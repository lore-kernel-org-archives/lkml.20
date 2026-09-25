Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com [74.125.227.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FF4E38553F
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 02:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790303725; cv=none; b=ilVGIV+91VVcSBM2JUD0q0dlT26bj4XIhCA1P7KFDOAz4mJ4AIPVJQTXJDMDrE2FF/QyvBRVRv8NkGQKBJwPtefdhxP7cMbHKtTlXl8CyRyc2bgIQtr/srNjdkZTcRozdrrWT3oJGEDgSF0qsbv2OdAmJL91uF1ud5O4dmbu6z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790303725; c=relaxed/simple;
	bh=mzoEsAc2Sr91/I0SgoFP1CmTbLAMnntKENmE31N2EC8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jSTSr4nppk2DRYVe0SmsHS2UMDyFf41x3/7Mi//46J4v52R0v5LWZU82kYvUI1O7U+FLJZBRpHGsOC+N1b68uzb0r0VPWDdATBzCVE1QltKPcCbwpGX64kgWx1J7ZjpnO0/6tCYoM33w9RV0HmXkPIANUG4eBtGLxSBQqaJWaf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LDIvft/t; arc=none smtp.client-ip=74.125.227.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LDIvft/t"
Received: by mail-vs2-f12.google.com with SMTP id 71dfb90a1353d-5c7e8a17839so75315e0c.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 19:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790303722; x=1790908522; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ABMyZuvqxUd+c3too9IAPvLCmxU7UkIesXzVqZa5J60=;
        b=LDIvft/tV3wpf3QhyYh6QDYfh8F4t0/qiXGJfQyFRcw7SyP/OG2SMZ3gXRhsKdnZ5w
         7A90/SeAD8FMTU/ni/LbiCs1Xl0YbKoYWD+jbcLxsFnA2+7C6LXlnCx6moEtmKeJuKIZ
         0lYbVcWhNRd4Tvr6vjqbf2uCO5av3QXp28nYkEl0haKIfYP+2nWJHMWxt4TdymPDGEAS
         p1e41F+AwBPWytzOhPcPi5bh77FWmR7gci8/zZiPDCBKX5FzkJ+fVnV8ayJ5LBfsITNh
         J5Yf6fNfj1VTiBNtt7K2lXQNWpQH8pli2yNqDP4nOYMoGZR5VDezApADuKKLw2HF4EMF
         H4Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790303722; x=1790908522;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ABMyZuvqxUd+c3too9IAPvLCmxU7UkIesXzVqZa5J60=;
        b=JEaXFcP+u/50V0URhowTRJcp3SmXCNLG3kGsMJnUrjw2z1i2UFuNCGFbfmJufFTV5+
         v7Hnw7I7/2GVpl/rxmzfmBnHuwLMPRKhpJhG/vJWVQ++WACXb16Aea3bpsxia3OSB5pe
         xLTTbObJuWXkMiSvLepgZkA3JTwEnIU0cWCrila0EICXUf1KYSpx0bMTU3KMk4l4V18V
         /9B/8XmSuu6/taVZSQA9NtRaO1zUiAHBK9I8O7ck+yJJoduIkfo2Wgs6HBAdkqd/Du5Y
         bBdjSNJKj/rKiMgeJW7AB0A9XlpO+Mla89KuxPfCMDD9o3eii/rD+RHYYn9xMJ/Sm9py
         8/IQ==
X-Forwarded-Encrypted: i=1; AKwUvBxIgXX77OfK6bl9odB8n5OHpNYG9quxYCl3F9Ua5isf3NOui7j0YegRdh0QLA7k43oE2JPyHt0VA4onMb4=@vger.kernel.org
X-Gm-Message-State: AFuF++nCIPCdL/WIB57Cf4tQop0sMd/6Oggp+wmsQ9FXhNH+ZcQGGtSK
	LAIC9zgLLZDNCdcUz5GT7uZCX/3XFmJPBhR1f+Nt4HTLlG2l1tgFmamLU7uWqlNf
X-Gm-Gg: AYBFou3F9ZRhyAPJWz9/27YaphwhH3dW8g25ro5fu/DCSFd7271OMA7KijkAF+hCyao
	pEi+qEShu9t044/kln4yRWRqZuuTOMiCZdGb6Bm5rwTfcLZTZU96rW+4uLGp4jjCbeI/EM9IJLM
	tIYjJnAAoRPd87UFVL/ZGv2rpEkKy9uh2YD7ovu3YNoL/0iiKi/uIr903n6PStHvliPxpDI4GaC
	3iHSG/cS4UN59j/i7iupsKEH64l5WGKbsKCXOFPjEhVjSrApZ4vsHZlQWOzo1SdlQkKNkcUW8Q6
	6FZjM5JP5/g3lOgEaM9iIjspbnFMvxZVcU9/lpRyX25D2KvZCRMjPy+1XmzN+K58VkZRN2hRArw
	QAmfPyN0w3T8iMYiK+T3uyG0CNDRjrgE6TowjeG3avGoHQ5sNkPVjRp+axMu1t1LqgnIeNyxuzb
	JIOLQ7ooZBWAudkA5blQeEZrzqIqkb4av2TMCYghxItI29OY9H4agJ4uhr3fbJc1Q=
X-Received: by 2002:a05:6102:3911:b0:79e:df6b:d2b6 with SMTP id ada2fe7eead31-7af1c483ba4mr1717243137.2.1790303722355;
        Thu, 24 Sep 2026 19:35:22 -0700 (PDT)
Received: from beelink.. ([187.13.30.172])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5cc651999ecsm1303758e0c.12.2026.09.24.19.35.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 19:35:21 -0700 (PDT)
From: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
To: david@ixit.cz,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: horms@kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Aldo Ariel Panzardo <qwe.aldo@gmail.com>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH net] nfc: llcp: check socket state after locking in nfc_llcp_recv_dm()
Date: Thu, 24 Sep 2026 23:35:09 -0300
Message-ID: <20260925023509.3060096-1-qwe.aldo@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260923133339.2518641-1-qwe.aldo@gmail.com>
References: <20260923133339.2518641-1-qwe.aldo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Between nfc_llcp_connecting_sock_get() and lock_sock(), another
thread can move the socket from connecting_sockets to sockets via
a failed connect + re-bind. After lock_sock(), the socket may no
longer be in LLCP_CONNECTING state, so unconditionally unlinking
from connecting_sockets corrupts the wrong list.

Add a state check after acquiring the socket lock: only unlink
from connecting_sockets if the socket is still LLCP_CONNECTING.

Fixes: bf1460acdf8c ("nfc: llcp: Fix list corruption / refcount desync in nfc_llcp_recv_dm()")
Cc: stable@vger.kernel.org
Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
---
 net/nfc/llcp_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/nfc/llcp_core.c b/net/nfc/llcp_core.c
index 74bf81700..acf113311 100644
--- a/net/nfc/llcp_core.c
+++ b/net/nfc/llcp_core.c
@@ -1326,7 +1326,7 @@ static void nfc_llcp_recv_dm(struct nfc_llcp_local *local,
 	 * corrupt the connecting_sockets list / desync the socket refcount.
 	 * This mirrors nfc_llcp_recv_cc().
 	 */
-	if (connecting)
+	if (connecting && sk->sk_state == LLCP_CONNECTING)
 		nfc_llcp_sock_unlink(&local->connecting_sockets, sk);
 
 	sk->sk_err = ENXIO;
-- 
2.43.0
