Received: from mail-dy2-f8.google.com (mail-dy2-f8.google.com [74.125.229.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 518473E4C96
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 10:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790418484; cv=none; b=CXxM91dd8aQ8hIlN30OMuLaL+Xf50aU/po8k+IuRhUiLABKd2vXmj2CPchIE/dEe0QRYEM15Pz+m7r6CWrGtU6IrKTGsUyzTCuBfKR5s7U1CPR+VZRbZjshx0ZUyyJyKrrCcs2y5FoWs+OHpQ3SWGUVoOEupZsWZ4lNOV48OiJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790418484; c=relaxed/simple;
	bh=EX4Uxb/Tm1kN69l5KZyoMnonP3Wjubs+yppWBVrvgsg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=n1ssJDkZid7t7DsXmQa7vTLFIcKrpaiTrjmthrXlSPSNniapp3aPllKjCeCRQBNS0FAO67UXgIa7IHlmWFVFRxOdREzQJEDBZFmgIenyuS1KTFNJjPoqMsq3Iv2stq++tss1f0DhrPylvz9HOqOyvCyrBDuv+VXgIxmguk5JouE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e2VGVb0C; arc=none smtp.client-ip=74.125.229.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e2VGVb0C"
Received: by mail-dy2-f8.google.com with SMTP id 5a478bee46e88-342d720df34so379829eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 03:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790418477; x=1791023277; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1oNYWnhVHWPsTs9fwu8jkatxdu2fZWhgiXhQOy61cHY=;
        b=e2VGVb0CFDfhdYMjJxQHO4PVUdtLhLFgCWUvuIxBoUjXBm9wxmchOSnoUFajPkLTgv
         xKCOp4tmO0NAbdkzq6kFRr5HacakoRsfpyS8iywPwi4or2diaTwHrx3R+e6dsM++DXPy
         r1yuYuWbbZgb46LhNSSBgGZ2zMRAKYbAJtxgP3p1zbXSApVtaQgxeetdfFyvhX2Wz2WI
         iNqq612+MQhZ0rDB5YZluwB8cINZ+sLB0mU+ozGf1+5wl7yVpywAiukSc2elaGcIkbeZ
         ti+l9p8esO/IcVnxxO00TJVOrNFuU/dpFy4jzxhY3iatD1EgDiaT2bTJOscADKBskkqz
         zHEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790418477; x=1791023277;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1oNYWnhVHWPsTs9fwu8jkatxdu2fZWhgiXhQOy61cHY=;
        b=FoMY39t39V3XdKQoBQng3DsszxT6vbMY/CzHUZjaNnSM7eNdbm4zX4SJv5+F5okO+u
         gwdSV+qNXEjkNOzvJmg5fhdwARei0XhevCGiJepQF50HNN6oTt+nItoTTEQgowt7iZ7b
         mizNGZ+X0kBIwcbOpDfRgeZ4+Vpn10NG0sfflHIFmol04B5vH3DpiTGESJUFQ6J67sH1
         W+eyLoCXqZ+rMhuvmpLa5Oefig519i3bARYDrVOr4z77DnU1g1nxi/SsqcY2rGYOnHdU
         BEGdmrQrUboSmBuaiEimwIlgXZ72hDCqNR8JuH9YuwZu0C1knk71M3WNV5nvXQRJxWlC
         SASQ==
X-Forwarded-Encrypted: i=1; AKwUvBy7VvGpfYQekLJgjYafSEz4ibF8aHq3PuPvYRRvzyGE1jFGf9uo8/0vo37pyIZuzl0VnjRkp7w9KZkGSSM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIn8rRaDg1x98FUfHBNhuu6bYYTpI9IyznuPJbLrJzO6gkyHhG9
	RyRSg98Edu8JxhmvfPe4/kH0MPmTF3rqymTKW/WyaJSiFcbYlumBYHD3
X-Gm-Gg: AYBFou1TPVFB/RX349SFtgLQWK/towdbiaoEeRnlrzvwkVCRcnBS45AE8sX9lG2nGHW
	Vdl65bXu/PlYv6U5yOcPM4s8Ngf7as2TGIVIdpmJO92ohemrx9aiOhJWiu8jSqBHrkP7lqOdqt3
	Dof+WWmpJsfSrtpr7RV1IUJefAtVA1PgZ5/WSHiD2/eOBc9aQBPR8OhYAocC8ST4PmoYFNMESNR
	RKs7eOqo+j4no2GQqQJ9e2QTIlLWDZYM4xfxT8pFP1aytiy2Qd2UAsIP0IkyXMnaS95Jmzxn79R
	XRe1sNHFPhk1Dl7NCJCboH6z+nOvqZ/2kelMAee7IkNjOVU+K448Cj8b1q/LE2NoUzxb2/w90jM
	UN0Iy944W4+CyQGkjYSnXM2ehMNbcP/4KNxkzpZ8kkDAPTnpg6eCT8LwxOraLs0L+0anxguNuL8
	/5v6P96teEzj08AYujtjjTSqDKHEcZRGBkZP7cy4HwFUTGCqaTCyun2p0rZUcwIIKOnFRo8x/9p
	d6tx6a+BSGvol25i/4JgAlQVd9Y0VKpbtddXg==
X-Received: by 2002:a05:7300:c88:b0:33c:e91:271b with SMTP id 5a478bee46e88-34273347562mr3890672eec.36.1790418476668;
        Sat, 26 Sep 2026 03:27:56 -0700 (PDT)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3413fc2413dsm13027997eec.0.2026.09.26.03.27.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 03:27:56 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dan Carpenter <error27@gmail.com>,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH] staging: rtl8723bs: make xmitframe_swencrypt() return void
Date: Sat, 26 Sep 2026 10:27:36 +0000
Message-ID: <20260926102736.2773-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

xmitframe_swencrypt() always returns _SUCCESS, and none of its callers
use the return value.

Change the function to return void.

No functional change.

Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_xmit.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 95350fd6a94f..51d63fb7a311 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -881,7 +881,7 @@ static int xmitframe_addmic(struct adapter *padapter, struct xmit_frame *pxmitfr
 	return 0;
 }
 
-static s32 xmitframe_swencrypt(struct adapter *padapter, struct xmit_frame *pxmitframe)
+static void xmitframe_swencrypt(struct adapter *padapter, struct xmit_frame *pxmitframe)
 {
 	struct	pkt_attrib	 *pattrib = &pxmitframe->attrib;
 
@@ -901,8 +901,6 @@ static s32 xmitframe_swencrypt(struct adapter *padapter, struct xmit_frame *pxmi
 				break;
 		}
 	}
-
-	return _SUCCESS;
 }
 
 int rtw_make_wlanhdr(struct adapter *padapter, u8 *hdr, struct pkt_attrib *pattrib)
-- 
2.43.0

