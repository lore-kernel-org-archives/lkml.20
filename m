Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A7673E5EE7
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 16:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792341871; cv=none; b=dydxIIM43F0lpzlF7RkhsJv6dyUb2xYamh/26er3YUb+7ES/XOgKm5DVBfsm8kRBIGYS2s8nDiXEfyUNGSkU94l6EutpkjUBWhd3gbwNMqDzP3JPKUHJ3fvkQCBZnmtZbNWfvvZIvzZ7gfiVYwEcCdfuSOHomB/reKhwnqMDcLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792341871; c=relaxed/simple;
	bh=xmKSzd6y7H5F5I8iOqTKJHpC+nO1N6svEATVQw+WmA4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eTJ3GK/bQO2p6aQsT5gteGhYlNC7fua3TPCGQam+nED/+eBu4YkB4BYl95J3qUnk4QEdvOjU++fsIOL3eawHkWRmlbJ4C00wi9d/o+PY7fEYOlq8Lwz6fublZLPySJF2TsdLRRoJ5gvv97AmdMQ/c9/GZZ1mnU8Y4Eb5wvOkQw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s6lfJ1o5; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s6lfJ1o5"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-3535bf8b3e0so2836746eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 09:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792341866; x=1792946666; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tjyLgG+lbAo9+1NVw/+tnv0kQ6Ik8T6x0RHmp6w96Tw=;
        b=s6lfJ1o5ZYhQOUuEULXwAF41oJzb8Q5rcA1mLKjO85EJX87P1ajDJ+zgSiVgB8pi0p
         k5OVAA19Ro/LQgRo+OCKR5GQ/ZgcdVLXIHItfyA0cOcr2+dXwfaEmedDFoDPZz0Cf13Q
         x1rMmZfbdGBSufeWdgqD2Zz/dHKxmZrwVcfd0PnDC/OAZCgwoHC9HbzVox81QuKWshFg
         uMAKfolq5BMvikU3x0Xa/IZngjIL3+6/U/4CmpBDH0ybZb3/LuQR/8gU+l5cQgu45Fam
         Gq3+oYxN/37aD0mXF5lvRDqeGMYTFfoyjh4QS33uGJ9BP29G3C/sV3xS8HZNrOL7L+wD
         aU/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792341866; x=1792946666;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tjyLgG+lbAo9+1NVw/+tnv0kQ6Ik8T6x0RHmp6w96Tw=;
        b=OGd47JIHOR+kg6pQhZLJdDqTASX++W/tHKMrHh6kyP+axVe0JkpcGEN0OskfozFkPZ
         +RpYadfGriOxh+M1bv2VmP/erpdT0y2mSauktoot97Qmne7tcwRx9CgF7KW9reFL4f9p
         pyRWJuE1ynNVwiYHR1h0ZY+GBuZT7k8HUMUg8/V1IOLiGnEK2xUfKvSo2fAYN2weNvSJ
         ttFCYvT0k89ldkf2M1X/QJS2vlXDWVvXO3aJQXOX6QqWfrNn6Mw9BUL5bpCY57j+1TDy
         8RFRM794JGXfjNLWLlMXQEZzvUpm5I81mLoCBy8JPD1ovGPPA08pMtjP9pYYZB26gLsh
         p1Sw==
X-Forwarded-Encrypted: i=1; AKwUvByvOpFtmXT65h8d5YFgVvDUQmlejYzYMGw8muP1z1dVpJUcQUYn89a+DQfyJe8CgmgsoaQwTGfok9otGO0=@vger.kernel.org
X-Gm-Message-State: AFq9FYI6ke2SzlDCbyi9GjP9g+F3Q5bmPQcSUmeyuGqMTtxTKGm3cUG7
	3lKJwJijJwwQP8zaIhBbkM7TT8UdG5BTi2k6K7ASAPSiXhiUYcu8D6Yn
X-Gm-Gg: AYBFou3sF9bjRLEB3vjLzZYLwnLkU4oD0xzlg6PdL8eggs9VdM21my9xc1Z9TlIo4Uq
	dsLAtK0j1HAyGkYpblBk1XJVOwo/bjffWbMc1hmdEmItpNLaiXdE6Lvo+gpgQ5RfF9wSVj6gI7F
	78ZPVaN6YFkoQJnEQtrlTbJrY/FpJ4IKpR/pPsGu1x69fP5lymyQrvQY0aV+vfPG6RlNKPJJpif
	4+b0tS2qmdny/zehC6oPty5ee/oPppYWHG32yGEpmwe7i/gSIyOFiU5UP3R4ANruox9AFbhaQj/
	82gQF2b6hbo3OYEGAo/QXeUsKn98XORfng7z0Ld8dwioam9UfTUHY4lvkcH5NGhn6zGFRDZpSRO
	Sr/hNXIuknBlujtuQCGsUSy2zqXLLTEAaNMXk5eNNmSHdY2Ee3m5dW7SRhWCseUjNag2my+Wcws
	WvHJRc5dEbzaZsmHHS21I4mnaO1eg8YI7ka+yeiKAwmGauTKlzXEbZxleA3dD46MJ59MFnr5Zhn
	YLWaZ7Kw8UpDNAYqw==
X-Received: by 2002:a05:7301:4d17:b0:35e:9562:ff1b with SMTP id 5a478bee46e88-361a3127f0cmr7590409eec.39.1792341865986;
        Sun, 18 Oct 2026 09:44:25 -0700 (PDT)
Received: from Vicious.localdomain ([117.99.24.166])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3608258aa66sm31431363eec.20.2026.10.18.09.44.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 09:44:25 -0700 (PDT)
From: Ashmit Kumar <work.ashmitkumar@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ashmit Kumar <work.ashmitkumar@gmail.com>
Subject: [PATCH 1/3] staging: rtl8723bs: use PTR_ALIGN() for pointer alignment
Date: Sun, 18 Oct 2026 16:44:00 +0000
Message-ID: <20261018164403.14921-2-work.ashmitkumar@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261018164403.14921-1-work.ashmitkumar@gmail.com>
References: <20261018164403.14921-1-work.ashmitkumar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver open-codes pointer alignment using round_up() with the
custom SIZE_PTR macro, or performs manual arithmetic on pointer
addresses.

Replace these open-coded pointer alignments with the standard
PTR_ALIGN() macro, and remove the now unused temporary variable
addr in rtw_xmitframe_coalesce().

Signed-off-by: Ashmit Kumar <work.ashmitkumar@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_security.c | 6 +++---
 drivers/staging/rtl8723bs/core/rtw_sta_mgt.c  | 3 +--
 drivers/staging/rtl8723bs/core/rtw_xmit.c     | 8 ++------
 3 files changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c b/drivers/staging/rtl8723bs/core/rtw_security.c
index ae64823afb8b..e9043104544c 100644
--- a/drivers/staging/rtl8723bs/core/rtw_security.c
+++ b/drivers/staging/rtl8723bs/core/rtw_security.c
@@ -92,7 +92,7 @@ void rtw_wep_encrypt(struct adapter *padapter, u8 *pxmitframe)
 				arc4_crypt(ctx, payload + length, crc.f1, 4);
 
 				pframe += pxmitpriv->frag_len;
-				pframe = (u8 *)round_up((SIZE_PTR)(pframe), 4);
+				pframe = PTR_ALIGN(pframe, 4);
 			}
 		}
 	}
@@ -492,7 +492,7 @@ u32 rtw_tkip_encrypt(struct adapter *padapter, u8 *pxmitframe)
 			arc4_crypt(ctx, payload + length, crc.f1, 4);
 
 			pframe += pxmitpriv->frag_len;
-			pframe = (u8 *)round_up((SIZE_PTR)(pframe), 4);
+			pframe = PTR_ALIGN(pframe, 4);
 		}
 	}
 	return res;
@@ -977,7 +977,7 @@ u32 rtw_aes_encrypt(struct adapter *padapter, u8 *pxmitframe)
 
 			aes_cipher(prwskey, pattrib->hdrlen, pframe, length);
 			pframe += pxmitpriv->frag_len;
-			pframe = (u8 *)round_up((SIZE_PTR)(pframe), 4);
+			pframe = PTR_ALIGN(pframe, 4);
 		}
 	}
 	return res;
diff --git a/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c b/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
index ba7e53140bdd..a10672c11643 100644
--- a/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
+++ b/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
@@ -56,8 +56,7 @@ u32 _rtw_init_sta_priv(struct	sta_priv *pstapriv)
 	if (!pstapriv->pallocated_stainfo_buf)
 		return _FAIL;
 
-	pstapriv->pstainfo_buf = pstapriv->pallocated_stainfo_buf + 4 -
-		((SIZE_PTR)(pstapriv->pallocated_stainfo_buf) & 3);
+	pstapriv->pstainfo_buf = PTR_ALIGN(pstapriv->pallocated_stainfo_buf, 4);
 
 	INIT_LIST_HEAD(&pstapriv->free_sta_queue.queue);
 	spin_lock_init(&pstapriv->free_sta_queue.lock);
diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 364de3c8d148..aded0cb27be9 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -853,7 +853,7 @@ static int xmitframe_addmic(struct adapter *padapter, struct xmit_frame *pxmitfr
 			payload = pframe;
 
 			for (curfragnum = 0; curfragnum < pattrib->nr_frags; curfragnum++) {
-				payload = (u8 *)round_up((SIZE_PTR)(payload), 4);
+				payload = PTR_ALIGN(payload, 4);
 				payload = payload + pattrib->hdrlen + pattrib->iv_len;
 
 				if ((curfragnum + 1) == pattrib->nr_frags) {
@@ -1066,8 +1066,6 @@ int rtw_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, struct
 
 	s32 frg_inx, frg_len, mpdu_len, llc_sz, mem_sz;
 
-	SIZE_PTR addr;
-
 	u8 *pframe, *mem_start;
 	u8 hw_hdr_offset;
 
@@ -1162,9 +1160,7 @@ int rtw_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, struct
 			break;
 		}
 
-		addr = (SIZE_PTR)(pframe);
-
-		mem_start = (unsigned char *)round_up(addr, 4) + hw_hdr_offset;
+		mem_start = PTR_ALIGN(pframe, 4) + hw_hdr_offset;
 		memcpy(mem_start, pbuf_start + hw_hdr_offset, pattrib->hdrlen);
 	}
 
-- 
2.43.0

