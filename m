Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D528848640B
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 10:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791370114; cv=none; b=WIjrlfdOf0ACgOgwcPyjjyPWCchn9Hy25S8T5iP/slg71xMElLliHVJdSK2FfiSQ1m+a+QJPjk162aXcj22M4okbmi7X5wtj4ABp6TIrf//3ACcHDKmLtemAadrCc3OisEq011ycTMIFA3BOb8ZNflXa0HMMuOeMEUWgM9tjw5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791370114; c=relaxed/simple;
	bh=fIRTbOJjzLVb8VmSUM2YYo6qnXiE/YSAzfPltpNDme8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AaXAaZ+Wtry/C8iBcql2VUkbYdMJL/bnGwBjmQnfjMN3pwT0/nZRXvzqGF1VO5ENaurMGn6L+ZlqK0iS6tfyEtezaoQjs+K/BjkNTwpKYr2Not8yfSAx4i1SSl1xibs45FArCOIXALio3WMriGmoAjMuzvttA7mIhsH5UaxERwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=U3X9seQs; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="U3X9seQs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=I8
	GKVOowL7+8oIspUgJDiaCYRKI6Q1gNEUcd9Nke8Nw=; b=U3X9seQsiPXGDyqaZ4
	Ua7Cf4Rj3tB/crXnUImz431Gfq0A9plfbN62L06NehGwzndf4aULx1y2iSKVg6h1
	znXIte75yiKSnif50MJKBom7mZyNNxRmi8AiOe/nJ5fnrgC8NtRDMlNiesyjCnjU
	UVhRLw9cxsf6ZTzxo2v+1MnMc=
Received: from localhost (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wA3XvQHI8ZqdVePCw--.57407S2;
	Wed, 07 Oct 2026 18:46:31 +0800 (CST)
From: Feiyu Wang <wangfeiyu_mc_code@163.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Feiyu Wang <wangfeiyu_mc_code@163.com>
Subject: [PATCH] staging: rtl8723bs: remove multiple blank lines
Date: Wed,  7 Oct 2026 18:46:10 +0800
Message-ID: <20261007104610.128178-1-wangfeiyu_mc_code@163.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wA3XvQHI8ZqdVePCw--.57407S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrur45Zr47JF47Ww1ruryDZFb_yoWkuFX_W3
	ySqrn5JryDCFn8GF4DKa1fJFZ2gr4kXrs7ZFn3trZ7ZF12ya15G3sFyrnxZ3y8W3yxtF9x
	A398KrZ5KF48GjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUjdb13UUUUU==
X-CM-SenderInfo: pzdqww5hl13s5pfbu0lgh6il2tof0z/xtbC7AcWVWrGIweFKAAA3N

Remove redundant blank lines as reported by checkpatch.pl.

Signed-off-by: Feiyu Wang <wangfeiyu_mc_code@163.com>
---
 drivers/staging/rtl8723bs/os_dep/sdio_intf.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
index 6ef3a7198533..e18cb7fc93da 100644
--- a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
+++ b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
@@ -48,7 +48,6 @@ static void sd_sync_int_hdl(struct sdio_func *func)
 {
 	struct dvobj_priv *psdpriv;
 
-
 	psdpriv = sdio_get_drvdata(func);
 
 	if (!psdpriv->if1)
@@ -216,7 +215,6 @@ static void sd_intf_stop(struct adapter *padapter)
 	rtw_sdio_disable_interrupt(padapter);
 }
 
-
 static struct adapter *rtw_sdio_if1_init(struct dvobj_priv *dvobj)
 {
 	int status = _FAIL;
@@ -250,7 +248,6 @@ static struct adapter *rtw_sdio_if1_init(struct dvobj_priv *dvobj)
 	/* 4 3.1 set hardware operation functions */
 	rtw_set_hal_ops(padapter);
 
-
 	/* 3 5. initialize Chip version */
 	padapter->intf_start = &sd_intf_start;
 	padapter->intf_stop = &sd_intf_stop;
-- 
2.55.0

