Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BCAA47CC71
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 11:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788260747; cv=none; b=R7/GkxdJBOce+VWYaWGljFLQ7BpsUJB687fq2rrF018VRjaDiBpMz1LgKUt64Zskogs2nOEJl/BvXxGTXrlG4X/3VZ6OytxvoKgAXGMxjkj4zODOl9LRqnmTJKCQ1t731TJaF/bA6e7XITOckbfjnSVbqgPbcM+Ck6bvL5N/xqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788260747; c=relaxed/simple;
	bh=Je3UOa9lW5KIWcaPceaXLRplaHpvA2Op1KebD++CsqU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XvVPm+ua0YiuSUGRH3/p2wDe4M33bkrYSK6eBqJjeCQZ24lxRM5Jyp6YaqTmX7s+6mSWSJEHkBc5vcOBJCxU2yq6IIwhqj8MUBeESQzv6r5YSSuPChJnw7lRd/IeP4LNEgv40jaIh2PD1z953JxwaqXSb7JuIpiodYICDeBIQ8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U3duOvds; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U3duOvds"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48436216a98so1387047f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 04:05:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788260744; x=1788865544; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h2+R9Oi4TN6YprnqweZUIScg3DNG10vBbq2pzi9xAuc=;
        b=U3duOvdsZOleRRSyg85zLBlf/StmHf/NqXw0LRtabFezz9gOtdJMMVxV3xljA7kEzG
         RTYpGvnbiLVe/YIbjA3bWigX32puVfsINIrA21Xgdc8KYjHw3T7h1cGm0d2BoYEeagRo
         2iuFQ0mc+k1drP2t0XYjETbDb8JESRldL0IpZfGS3Xo8ikIAmmlyzkkVgf8NbPA5cQ/1
         327nG78XU2p9bZaFTVkW8WXr1pv+Cx2TBjkHiOJ/ytjNw8dpxf/4E9gW+2FDmntoWID/
         pQuETFBidu3eGeYtaFYYyjKZnqiumkeEEynGWQ4peneWHLpxTsKFlgWOa6uTOBw14VIP
         ZejQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788260744; x=1788865544;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=h2+R9Oi4TN6YprnqweZUIScg3DNG10vBbq2pzi9xAuc=;
        b=f4IrJfylmwqkJ0lhvEOmhV+nXJKPfPscGVkT907UrCbqfv3NymD1A6wq/K55LXJb67
         VuVSYwp79tSv++HKHTrt5Go6JVj5/YpciUbYfA0uKjXVk5OsCIkI8Ivdm4D4Ppipluqa
         ui1OLuOHlbmBdM3cEDRMC94rdyd/69ghzcQG3Qo5/DO3j6bJcrec7XOMKCvGhdInfjJt
         XpGBAaZCEb/3FXfpRC4+VA3XvJ/LK/EbEbWipAs+i56PRXaAE7x31Fni6yRThSojFo1k
         cwiD48dKZQjD89yAtz0z6KnAuGLtRWfLtGU45u8yhku9TJ290ksSf8+D2vhK9j+zTOZl
         nySw==
X-Forwarded-Encrypted: i=1; AKwUvBxZLijsecEHsHkHtpZOJBPNRCeMK3Q9FK65yByYPpBJIC4Vrs+Xmey9Ll9tJFfwn7Rb7FooxlrNp2R9yjA=@vger.kernel.org
X-Gm-Message-State: AFuF++lzRo2/ez8k90adbjLD09CI1EXuE7TTF7lRpaU6/3rx0vKuPCBA
	ssOuB+gbrbBL8yaEuydjc37dBeUf0IacYWLuUqeDwMDn/L2UmOSGjbqv
X-Gm-Gg: AYBFou3ycfC69aK5FHo3OxRcSPE5KHJcpN9g9YlIZ8OF6mJhmKGmN0ryZJ+7Ik5MtlZ
	hNwznp2u+DD8mF8vCtcUI4er6q1E9tx5tle7POBJCfu0Mvs4iwF2jVhwwZucuQkpHNquToZ7A23
	5BO1MhJVCCL/gbuGuM8BVthCtt+vGi5nsjrXls9RiECCvWRIZwDSNWS76/XgOZ6D6GVn5IxwlBU
	RF5ZT+no3c7DfFpVD6itAWkNC6QcOT0ndIqikcFk9AU7nbJktB8PYJ+77W3FTqtmzM+me8rW3Lk
	UTSBHussuQdy2j8z7x1WFc5uGE9doEFD4mPtaetzDLcyoCR4laZcdHOOcGSqzLcCIxzvhDLbWi/
	OkSL1pX0Wp2DTJRJMGZ6I0Y0JxCpiR4+F3Q9TfiRW0c5avSoRAtqBDpRqatr6ZwQQ/CKc4FPdlk
	ChFcx0Pzvgim9RQwluS2vt4R1x8xgnI23oNEmdIATmn1H/sREDMLmYGIi90pF8rEOekkOuedxxl
	yWz2FDmxP2DKLty4CyPolt9onoAOz6pLaL+JvF3bsw=
X-Received: by 2002:a05:6000:3106:b0:47f:8d71:210a with SMTP id ffacd0b85a97d-482f79cf4d0mr48183602f8f.15.1788260743864;
        Tue, 01 Sep 2026 04:05:43 -0700 (PDT)
Received: from DESKTOP-EHH7ATM.localdomain ([102.203.209.200])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48442d6e826sm4116799f8f.19.2026.09.01.04.05.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 04:05:43 -0700 (PDT)
From: Godana Emiru <godanaemiru@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Godana Emiru <godanaemiru@gmail.com>
Subject: [PATCH v2] staging: rtl8723bs: split chained assignments in _rtw_open_pktfile()
Date: Tue,  1 Sep 2026 14:04:37 +0300
Message-ID: <20260901110437.37588-1-godanaemiru@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260827062137.12937-2-godanaemiru@gmail.com>
References: <20260827062137.12937-2-godanaemiru@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix a checkpatch CHECK ("multiple assignments should be avoided") by
splitting the two chained assignments into separate statements.

Assign cur_addr and buf_start directly from pktptr->data, and pkt_len
and buf_len directly from pktptr->len, rather than chaining one field
through the other. This avoids making the reader trace a dependency
between the two assignments to see that they end up with the same
value.

No functional change.

Signed-off-by: Godana Emiru <godanaemiru@gmail.com>
---
v2: Assign each field directly from its source value (pktptr->data /
    pktptr->len) instead of chaining one field's assignment through
    the other, per Greg's review comment that the v1 split was harder
    to read than the original.

 drivers/staging/rtl8723bs/os_dep/xmit_linux.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/xmit_linux.c b/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
index 7a9d2fabc..9f0d84e2e 100644
--- a/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
@@ -14,8 +14,10 @@ uint rtw_remainder_len(struct pkt_file *pfile)
 void _rtw_open_pktfile(struct sk_buff *pktptr, struct pkt_file *pfile)
 {
 	pfile->pkt = pktptr;
-	pfile->cur_addr = pfile->buf_start = pktptr->data;
-	pfile->pkt_len = pfile->buf_len = pktptr->len;
+	pfile->buf_start = pktptr->data;
+	pfile->cur_addr = pktptr->data;
+	pfile->buf_len = pktptr->len;
+	pfile->pkt_len = pktptr->len;
 
 	pfile->cur_buffer = pfile->buf_start;
 }
-- 
2.53.0

