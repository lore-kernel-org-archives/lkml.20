Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6697C47D956
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 19:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787773342; cv=none; b=uNvDe90WcaD6JLSznZzybLFt7/xuKB+6AxtdjoOULtwPZxegzY5M2UOAmf1tTqjw4or7VS6KdCvKmLG+bvh1mKZY/5LZQzP5EAcEA/RB1OWxCR9BBPBNKIHdU10f4LXDDPEAik4LPhtsmvrPVcGH36krlG5R16jKVKqZMfNZaxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787773342; c=relaxed/simple;
	bh=5ifspmU//CZaPykTB72aBGdZa3rdoKjIo28aQg2Ad08=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ibiXUCFKIEclpm/AYfGw7wDiJQgdZOqr7QTK1h3mBCKYxt1nao2zkoAsoSWKiwTnVKUm4KrfOyePyI4mePfK2+63w65ZTWfTbdGCLJJjQ/e7uAml5BBQrJzb05svkjxluMZCdm6w2r3kO0+nruVJ4sjhrebWQHP55ZXwX3S/Wuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L0cbLixC; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L0cbLixC"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4980dc26022so11359695e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 12:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787773320; x=1788378120; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UY56UfeK4JcroakIsNp2coHrCTQ1sU7LKWvzN2n4hqY=;
        b=L0cbLixC/panE4cr7OvD1xHVO+gGtFo3O5Mbjuu5rxo97O4Oli3rDHQ/Zcky9+z1Nd
         ZJzyj9EHrvABTWFBucvsf1bMnM1ByVkZLBR9i+T8wBj+XV5zbUTVQ9CC8NMjdAMMI53O
         VuIWqbSP+KMFoUlvZv7si2jELPhR+Y2LUcnuYENLGDhMsIaeHxWP3zrJwtr4ZdfAv5Jy
         NSKZ0xZDhFFmnCgdB+avV5476F2R+TzRIK/XXzvD3EZNF1n4bVqmiTALqPA1npxP9eGX
         wq8bmItMYsUTIhV5FShkxGtNWubpA+aGUDcWhiiDn9Hx2tBqN72DpB64mnNNlgcX0+5K
         Z8DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787773320; x=1788378120;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UY56UfeK4JcroakIsNp2coHrCTQ1sU7LKWvzN2n4hqY=;
        b=hsacn2hVZOT5soHxTt4MQf1L5dal5ExDMmbRfh47QbVHU5ubtbmUs76XTVVBbOmnWh
         /+irMWG8CbZRB/0x2vZi0o8f2yGiKk81Lw0TjaTwkCfhZaOaqX/9Xxao6t5Pm2qOPyN/
         ieT1bLpyC/1cXbRZ9QR7LNkDWQn6yBLuw1iNQoepn5M/Oacbn+G7LLem9dQwJPKp1UtY
         WGnjP4lX5cW89gDHL7/zTn1lqDj38GtXP6H+aOeu0sWc6e3isIZgng+sBPCHQz2/47SP
         J5OBWDUyJtvr68yGNXAf7/TcXnDaz2CpHCKSZq6h5zImTreB4HPhyo3zx1Lzov8njbTa
         QhhQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp9UIWZCGSS4qyYMhniXgMK6UnTYIMDjZUPn9qBhYVWAyKur/j8CA7fTehwA3M+WV6gJwey1913Onhs7yI=@vger.kernel.org
X-Gm-Message-State: AFuF++m3IFEIfQsiDj9V/H53rG+sGGgz89+8K1POaj072fKL9ofp5X0L
	JdQFLCQkbe3045qq3bImhcndM6z/JdeE3n8ZDpSADavu8uv3fMEoEhAL
X-Gm-Gg: AR+sD13VcDsjgqSOWnKKwJ4DTMHLX6T0W4ttdwxFpq2e4FaMRqmQTnPcnVv57x/4Iyh
	pl9BiExjjSo7CxGgWG3TsrsIHLFlNIxx+4ITpqEdsgaeuydbiIJJe7+6q956jQsJTiJVmBhuw58
	0PwsV+fmSM2gSjVDulHIUxMiE3ogL5XJmAnr/mCKJ7HKWmoIOCDEpWt0WCKwGGEiJr8n6i0NJHf
	1LUQG2tuBHnpmOs1IzJUwrf8dUGglGyQnQtDBbL+eVllB/ccv9IkL5yLtzciYX4kGJwhDH5rCZg
	yG8vWDlkvuGth/uE3OAECI5fxJ/WqP6GkuzEUaDiYjiigvQu6ecwC+WWdl7LKW17Wk5S4Uq6psz
	MCpSq5yM+ZlholokSG2hqr6XpduWsYuft7+H5XyW6iAEkAi/Nvt1c9woevDRrWo+jKV51/2YALP
	Csim/pfqRhfebT+8nnBHqqyNFoUN0oC9u4RMzuZUhqWo+fjkN/2dFb/Id5KdHxKYxWAhj4Z8NEy
	WSRj2hl5lsX24DsnIj7NVreZqpYVsjuu8EocDgHUHA=
X-Received: by 2002:a05:600c:4e55:b0:499:484a:81d0 with SMTP id 5b1f17b1804b1-499dc723fadmr97608285e9.9.1787773319759;
        Wed, 26 Aug 2026 12:41:59 -0700 (PDT)
Received: from DESKTOP-EHH7ATM.localdomain ([102.209.111.221])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b2015da49sm638295e9.1.2026.08.26.12.41.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 12:41:59 -0700 (PDT)
From: Godana Emiru <godanaemiru@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Godana Emiru <godanaemiru@gmail.com>
Subject: [PATCH] staging: rtl8723bs: fix coding style issues in xmit_linux.c
Date: Wed, 26 Aug 2026 22:40:59 +0300
Message-ID: <20260826194059.12003-1-godanaemiru@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix a handful of coding style issues in xmit_linux.c:

- Remove a stray extra blank line after the include.
- Split two chained assignments in _rtw_open_pktfile() into
  separate statements, one variable per line.
- Wrap the long rtw_os_xmit_resource_free() prototype so it fits
  within the column limit, aligned to the open parenthesis.

No functional change.

Signed-off-by: Godana Emiru <godanaemiru@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/xmit_linux.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/xmit_linux.c b/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
index 4260ed5f4..4a3c3df5a 100644
--- a/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
@@ -6,7 +6,6 @@
  ******************************************************************************/
 #include <drv_types.h>
 
-
 uint rtw_remainder_len(struct pkt_file *pfile)
 {
 	return (pfile->buf_len - ((SIZE_PTR)(pfile->cur_addr) - (SIZE_PTR)(pfile->buf_start)));
@@ -15,8 +14,10 @@ uint rtw_remainder_len(struct pkt_file *pfile)
 void _rtw_open_pktfile(struct sk_buff *pktptr, struct pkt_file *pfile)
 {
 	pfile->pkt = pktptr;
-	pfile->cur_addr = pfile->buf_start = pktptr->data;
-	pfile->pkt_len = pfile->buf_len = pktptr->len;
+	pfile->buf_start = pktptr->data;
+	pfile->cur_addr = pfile->buf_start;
+	pfile->buf_len = pktptr->len;
+	pfile->pkt_len = pfile->buf_len;
 
 	pfile->cur_buffer = pfile->buf_start;
 }
@@ -48,7 +49,8 @@ signed int rtw_endofpktfile(struct pkt_file *pfile)
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

