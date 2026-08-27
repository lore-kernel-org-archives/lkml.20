Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B6FE35E1D3
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 06:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787812008; cv=none; b=E5Ild3tH5qutw3AnMJ+CUW3AKLGYvFweAUGhS7LqMyDWvYNNW175BfvWU3aCV6B3XDjkaBYiJ+ctw93q/nRv+y+UI2z7JXHY0bwCNxe0yFiKF2sL1XjZcxlLooyGNTr4hBnH37O5mWuyOYrRxuo7VJrDB2FWUhZrD3FHo4M2/TQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787812008; c=relaxed/simple;
	bh=oMjEaxWaK8GzABw78h9GyDd1f2Y1YM4x0/BHkzyxhuo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hULhPl4TO5yxHHPHoDVdGnpQ4FK5e+bYHzLrGWO54N3QiYjFP+5MNu7KzNhmxc1eGQYroMR6o7B23uUMoqElf6W7uGio220kuqG2pjl0VONZkC+MvybzMnWtiZArczUoyaYYWB9+vnqNS8ecbiCfHi1YnhK3OdCPdgImBASTn/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IYZyIlCz; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IYZyIlCz"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-499b2981a7bso3403065e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 23:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787812005; x=1788416805; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5cEA9sV0tiBsNi9eOekk/Eu572vric8jOLL/+Ez3K3Y=;
        b=IYZyIlCzRYX02DbpTeX5ID8l0IDagcjuZssl/y5sQgILNvIj9yGrt0xOItu8ZzqNW/
         8Z15C/yevPcOkBN8A7Jhu/kWTto1y80tDvq7duQRZOjvZiCC5UEkkmZR4kABw1jqTnp9
         ob8NZ35lCkkUHFM2ytzapFLRzNNSiwf4lO4HoudY1iSCfSPkN7eHjMSGUsC0nOFhmDy2
         mKSLv2AH1jFj88nHlNFDidRmZ8BXwUnOh6+8/4cuTQY2cSmTixY2RoDCTrUgYE/RBjiy
         y6YvFeJNy2cJSMGpiQXdY+wZOw+sA7hGAjqUzvdDRxwZXHwGnJHoGT1WLkgpIvUoMmLQ
         m85g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787812005; x=1788416805;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5cEA9sV0tiBsNi9eOekk/Eu572vric8jOLL/+Ez3K3Y=;
        b=O+Jd7OqG//9t66TKFlmhMin+mGjyS2Li9QDgFLZyoQOGr+NMmrpn2yluaMenSqUHGn
         IEU1UP4dVWhCcjA11YH3QKVIa31httpsSf9TP9W3r6zdCqllnHa7gPQDRrKPy1ntYApx
         AIufVJRx5S4Cz0Zl0uHzP0TMWEnQ+IKmZevnc2hJl4eQS+KGjz9b/q+exACBTGpNeuiN
         lmw4QH5mv7m4ru9RbloJH85reGKwNOzP8klQCNY22/+8OPnlxVM3FFiD9wLGHSQRMxB9
         if1cxFRhMpymfN8PonLyPtgNbQjq+X/bcpL8o/k6b5GIX7kdTNyohVRxHN35MGeIVeya
         0Deg==
X-Forwarded-Encrypted: i=1; AHgh+Rrdf7ZTjfVlGQN0CYcX8/KM1dYqM7o8K9xMkFr3qv5HuG+Aa/gX1VHnkcqoO7uR1cNZLc5H4LBHsGrNj8A=@vger.kernel.org
X-Gm-Message-State: AFuF++nR+bo+dq7jFM2NHZvrv9MWmJKwYSnLC/M/GS3BgfnMhkFFL6By
	l69Qxa6AXFAXKXKut5MIVvwRQjHVdbBKKNToe/zKopzBdWBgr1DpXPgE
X-Gm-Gg: AR+sD124/Kbw5o6mKgKkvyARF8ChAkzjD3kOlpNCG40SMW8uHZF/14XvjQi6IiIs1Bp
	OlTuc70R9AUX4E7f3s8S9gr/kp+f/xnCTfqXDI/vKNbNjLCsyQFgSjAu716DcUqPUvY3r0/sTLD
	So+FD7mEznooFeiPV/tkDvMoSZzfCLl9W0kkdgX85X6zrU8HdN+2RXK1YvfP+/OXHN6eeCFVm8Z
	ggCs5u3XFjKxpkswQR6PefDt6KQrAF/zobfUU6931sWY/hSEt3nX8stirmXkF/8YMaCH7KxQZhA
	06bz7g1ZEsT1PO2OVMTy85NJ3uZ2L13PRVshFMBoB/UJoO66agn/Slw90OFB1qcoy9+hBOPBM7A
	OkBv/5oF6d8W/Ro+w7kpQpOMmqpCKe9dQ/x6vp43kkLByEMt7ef9GggBzqN5Jqerf+cTrlRhG0W
	DWSosj/bnG+JgL/LT6IJ8KflfHEZvSFIcFfGVEW0Z2Ogd1SSNW29wZhvmek3eNENELqjN1fD0rc
	o7mfsOVP0alIloM7SS61L6xhksu89YcLt0l1ElepUQ=
X-Received: by 2002:a05:600c:1382:b0:493:f140:c3fb with SMTP id 5b1f17b1804b1-499dc70b76dmr120592805e9.7.1787812005535;
        Wed, 26 Aug 2026 23:26:45 -0700 (PDT)
Received: from DESKTOP-EHH7ATM.localdomain ([102.203.209.200])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b4d08d86dsm24536605e9.12.2026.08.26.23.26.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 23:26:43 -0700 (PDT)
From: Godana Emiru <godanaemiru@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Godana Emiru <godanaemiru@gmail.com>
Subject: [PATCH 3/3] staging: rtl8723bs: wrap long prototype of rtw_os_xmit_resource_free()
Date: Thu, 27 Aug 2026 09:21:37 +0300
Message-ID: <20260827062137.12937-3-godanaemiru@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260827062137.12937-1-godanaemiru@gmail.com>
References: <20260827062137.12937-1-godanaemiru@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function prototype exceeds the column limit. Wrap it onto two
lines, aligned to the open parenthesis.

No functional change.

Signed-off-by: Godana Emiru <godanaemiru@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/xmit_linux.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/xmit_linux.c b/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
index c5f90a906..4a3c3df5a 100644
--- a/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
@@ -49,7 +49,8 @@ signed int rtw_endofpktfile(struct pkt_file *pfile)
 	return false;
 }
 
-void rtw_os_xmit_resource_free(struct adapter *padapter, struct xmit_buf *pxmitbuf, u32 free_sz, u8 flag)
+void rtw_os_xmit_resource_free(struct adapter *padapter, struct xmit_buf *pxmitbuf,
+			       u32 free_sz, u8 flag)
 {
 	if (free_sz > 0)
 		kfree(pxmitbuf->pallocated_buf);
-- 
2.53.0

