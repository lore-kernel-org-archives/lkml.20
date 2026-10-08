Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60FCC4F4D0C
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 18:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791485667; cv=none; b=ZobRwK20FSyRh9WCkdNq/H3YHfvuh93xPUQGMO7qExrCOdXO8YK7CT6BPsX/YkKiy/swYNmpBscxQTuD8hDAyNmmYbC4s2tjZGgcGJ4Z2fAwzBUSmhIAXgGCfp3vexmOOQ8rhiNB8IffAeVJUvp8JRLudNUCcGCAE4+5RULMsaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791485667; c=relaxed/simple;
	bh=dScB5kQlzL/CW/ZTxaxFKpVoMU2t0vgIhtiYhu3M5+4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sbGg08MhObvc6skIsO5L3ErwVmdrfdhUxq7/yxFgf/USTZOvSpn4tl+8qR7zXBkAYoaZUG4RdBHRvpymbnc/Rdob+iU+2AVVTUVOwpKxs6t53lPqSNdsSYCkZYNVtZ/zv694ZJDdH1Z5q1ior/hhdmhd5g/VET8VGUXZRdsADvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FYticvoK; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FYticvoK"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso3099375eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 11:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791485662; x=1792090462; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=R3zjl68lSt8FVrEOS06TJ0yAg1TocKM0nu0BnQmOWjM=;
        b=FYticvoKz5L39BWCnO67h6UAhL8md2bRk9QdI0/+Jl9RfjDRfhXAIqpixSKuJq+0U+
         4lEZ+u12R/Ob1+SerJEwsh6nv2cfDPdfDE626VkL2/mGEAb5DD3JZj5Br6my/CnyEPGb
         WNfBOu6yFTLk4uet+3iYZDYb4Y+ZsmHIpXix461JgtnVj8CT0mCqh+OgBUBtubExyJ3a
         zGOM5XMqDdH5ua47sqHVuFNMzA66JUsKyja5zsb+bUUxAOKGHz85i6u8fB+lUr7K0JQ1
         m8YZy2czlrNT2yQDmcOvCP3VAqKaJFJuXRPxoAx//ewFs014QCwbuG6DvZgXI58gPaA0
         hHWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791485662; x=1792090462;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R3zjl68lSt8FVrEOS06TJ0yAg1TocKM0nu0BnQmOWjM=;
        b=0yn264VDCPNHfUtNdKudJAl+VrzQCHrvbF+oHrIlo+wzjBuktvKjYNDLK+I/KpQ7u1
         41rB5RQa+ziH4eDsu1vqv5IaBbNtBylpMuuh780ApsODDET4dw2EAMHZ0GmANEumoDoP
         x3hOg4hmud0kh0zgRRRno2V9KhBi68Fgzq8d/eDh248WNVAnOdX2N+dmw+KXOZWWAUwW
         OYLYX2VfHZwfYbzgLcO2y/keKTD8c7yPwf7oLrDHhTU8bC7Nku+MAMBjuVKq+kmseYo7
         upky7oAnN7B6Il1NM7IdZSNH788zBAJqvH6gZk6sDyvg8+fLYQ2CpJFBxbu/o3b9TRnD
         RCZQ==
X-Forwarded-Encrypted: i=1; AKwUvBwWpDMgNKmFmWx+ep7sWc8bKrujAzA2EZhJuBxo71wRfabzlBNbA3KVkWcfWoGe5p4hrcVIOVb+hu1U0tA=@vger.kernel.org
X-Gm-Message-State: AFuF++lOkyfv1XSBWApqzyzWfP8q5rl2zd6VlQ/IM1m9iyZvjZtwvVFI
	gCwaA5oxgajlntONfh9KvBxPCn7jvZ5u4apZka019eBx9jgXs2n3qDMT
X-Gm-Gg: AYBFou3VkYi9iwy+QDKzcsGEuy7PN9TXFHYguD/mskuLxOBXhOsTe8aJ1ThC5EU5zGU
	y62v1XcABjJDidlp7RN9TQ5ODDuPozAoxY9CZhkQqsw5Qcyqys+8dJRlEmYOR4koQ8Ub+1gOAwb
	ZPVGSGHKnguwNRGMrQ9TCBvfJ34M6uqlsK6CFUvbn6qwr/5VS9lpsoilGw8H+AemCl+DTepldpF
	4hpbe2Pnw1L+0kE1ibGr87gLwlc5XoTmpW1/55B52zZ7LwX/qyCWUxhtx94CsmfDps74vvZ9OEJ
	fxl10WeYcsfglrgIMBPcedxWoAPjIR9OvG6BFqbkttbcF/oAXubI4XRcbImdAw9CIIgpDo0A8TN
	7pXaOOg4Sm5Bws5pA9zzrG/E0YBrOdgyHY48GO5RHGuMblBo0H0Z/kaa3Oytd2SEY/lWoOfpR8K
	YkAarp83KaK14Vmh9v5QrBRYEMD2JijYBevSo5qo1BK+Yx9ixTjHVzbRmRKS/R1MWkiJC6aW77D
	nKBd1Qh2i1td6Lp6r37HoDj1uKtoNj05XZKozGX2UB2dGeZU0esD1gL4ZTcsjOODqE=
X-Received: by 2002:a05:693c:2418:b0:353:5d25:1de2 with SMTP id 5a478bee46e88-3535d252434mr829490eec.18.1791485661829;
        Thu, 08 Oct 2026 11:54:21 -0700 (PDT)
Received: from sohail.tailed9083.ts.net ([2401:4900:88f5:9a17:907:5511:a10:cf56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537b3f9588sm332288eec.14.2026.10.08.11.54.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 11:54:21 -0700 (PDT)
From: Mohammed Sohail <mohd.sohail.biz@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Mohammed Sohail <mohd.sohail.biz@gmail.com>
Subject: [PATCH] staging: rtl8723bs: remove extern from recv and sta_info prototypes
Date: Fri,  9 Oct 2026 00:24:14 +0530
Message-ID: <20261008185414.160922-1-mohd.sohail.biz@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Function declarations in header files are implicitly extern, so the
keyword is redundant. Remove it from the prototypes in rtw_recv.h and
sta_info.h to follow the kernel coding style.

There is no functional change.

Signed-off-by: Mohammed Sohail <mohd.sohail.biz@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_recv.h | 16 ++++++++--------
 drivers/staging/rtl8723bs/include/sta_info.h | 18 +++++++++---------
 2 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_recv.h b/drivers/staging/rtl8723bs/include/rtw_recv.h
index b2a863e4d6ce..27d480f58516 100644
--- a/drivers/staging/rtl8723bs/include/rtw_recv.h
+++ b/drivers/staging/rtl8723bs/include/rtw_recv.h
@@ -307,14 +307,14 @@ enum {
 	C2H_PACKET
 };
 
-extern union recv_frame *_rtw_alloc_recvframe(struct __queue *pfree_recv_queue);  /* get a free recv_frame from pfree_recv_queue */
-extern union recv_frame *rtw_alloc_recvframe(struct __queue *pfree_recv_queue);  /* get a free recv_frame from pfree_recv_queue */
-extern int rtw_free_recvframe(union recv_frame *precvframe, struct __queue *pfree_recv_queue);
+union recv_frame *_rtw_alloc_recvframe(struct __queue *pfree_recv_queue);  /* get a free recv_frame from pfree_recv_queue */
+union recv_frame *rtw_alloc_recvframe(struct __queue *pfree_recv_queue);  /* get a free recv_frame from pfree_recv_queue */
+int rtw_free_recvframe(union recv_frame *precvframe, struct __queue *pfree_recv_queue);
 
-extern int _rtw_enqueue_recvframe(union recv_frame *precvframe, struct __queue *queue);
-extern int rtw_enqueue_recvframe(union recv_frame *precvframe, struct __queue *queue);
+int _rtw_enqueue_recvframe(union recv_frame *precvframe, struct __queue *queue);
+int rtw_enqueue_recvframe(union recv_frame *precvframe, struct __queue *queue);
 
-extern void rtw_free_recvframe_queue(struct __queue *pframequeue,  struct __queue *pfree_recv_queue);
+void rtw_free_recvframe_queue(struct __queue *pframequeue,  struct __queue *pfree_recv_queue);
 u32 rtw_free_uc_swdec_pending_queue(struct adapter *adapter);
 
 signed int rtw_enqueue_recvbuf_to_head(struct recv_buf *precvbuf, struct __queue *queue);
@@ -431,8 +431,8 @@ static inline s32 translate_percentage_to_dbm(u32 SignalStrengthIndex)
 
 struct sta_info;
 
-extern void _rtw_init_sta_recv_priv(struct sta_recv_priv *psta_recvpriv);
+void _rtw_init_sta_recv_priv(struct sta_recv_priv *psta_recvpriv);
 
-extern void mgt_dispatcher(struct adapter *padapter, union recv_frame *precv_frame);
+void mgt_dispatcher(struct adapter *padapter, union recv_frame *precv_frame);
 
 #endif
diff --git a/drivers/staging/rtl8723bs/include/sta_info.h b/drivers/staging/rtl8723bs/include/sta_info.h
index 21a4ca841e6e..8a873e7d799c 100644
--- a/drivers/staging/rtl8723bs/include/sta_info.h
+++ b/drivers/staging/rtl8723bs/include/sta_info.h
@@ -304,19 +304,19 @@ static inline u32 wifi_mac_hash(u8 *mac)
 }
 
 
-extern u32 _rtw_init_sta_priv(struct sta_priv *pstapriv);
-extern u32 _rtw_free_sta_priv(struct sta_priv *pstapriv);
+u32 _rtw_init_sta_priv(struct sta_priv *pstapriv);
+u32 _rtw_free_sta_priv(struct sta_priv *pstapriv);
 
 #define stainfo_offset_valid(offset) (offset < NUM_STA && offset >= 0)
 int rtw_stainfo_offset(struct sta_priv *stapriv, struct sta_info *sta);
 struct sta_info *rtw_get_stainfo_by_offset(struct sta_priv *stapriv, int offset);
 
-extern struct sta_info *rtw_alloc_stainfo(struct sta_priv *pstapriv, u8 *hwaddr);
-extern u32 rtw_free_stainfo(struct adapter *padapter, struct sta_info *psta);
-extern void rtw_free_all_stainfo(struct adapter *padapter);
-extern struct sta_info *rtw_get_stainfo(struct sta_priv *pstapriv, u8 *hwaddr);
-extern u32 rtw_init_bcmc_stainfo(struct adapter *padapter);
-extern struct sta_info *rtw_get_bcmc_stainfo(struct adapter *padapter);
-extern u8 rtw_access_ctrl(struct adapter *padapter, u8 *mac_addr);
+struct sta_info *rtw_alloc_stainfo(struct sta_priv *pstapriv, u8 *hwaddr);
+u32 rtw_free_stainfo(struct adapter *padapter, struct sta_info *psta);
+void rtw_free_all_stainfo(struct adapter *padapter);
+struct sta_info *rtw_get_stainfo(struct sta_priv *pstapriv, u8 *hwaddr);
+u32 rtw_init_bcmc_stainfo(struct adapter *padapter);
+struct sta_info *rtw_get_bcmc_stainfo(struct adapter *padapter);
+u8 rtw_access_ctrl(struct adapter *padapter, u8 *mac_addr);
 
 #endif /* _STA_INFO_H_ */
-- 
2.55.0

