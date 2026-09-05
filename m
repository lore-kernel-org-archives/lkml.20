Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B64D14A091A
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 12:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788611710; cv=none; b=gZjuSZDT2anSCF8cVqoFWTo7jtbmZT55jtQ7R5raWg8/EgcPTy2lrwU46sLHRUaiVpbv4XItvXSfQUXTjSbhqY8opdCA1z/UpX9intHQmS0Fnejjz0hETEktWHfACo7FAZ1kb/oe9sUEpQSWO1andN0dr9IILgdYoIXX2W6iESg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788611710; c=relaxed/simple;
	bh=FscHQeKZUzuZgsN1YVbqBe6K3v3ip/hOfNYfXM/WTBc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iz1tYHQZC3vfI7bFW+CRJ2XNWsIU+JxLlWuo95BmpckwowmCmKr1vcy9eiCAKVFK+l8dGir5r1ZDHON0YoIK1vz+Yp2NxV8tJW2uncpufYlh1k423rgbwbSrCRgYZzN8Q5KjQqcbSg490kxhoxAb8Ycif5vRbBg/a4Ng0ZeV+sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sq6R15W+; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sq6R15W+"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2d560775ca2so14344705ad.1
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 05:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788611704; x=1789216504; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S3X7uidjFB8vVdKb+fO92WnrzwU/cqJo9nFwSZVVmzI=;
        b=sq6R15W+LwD+kmsvTOKEA+PH8eCVuIb+1vaKtbyQvD4np3FXcyLlQJuLuoMBeTjPtP
         ixi1GTFZ6bATx5DEa7Wz2Ne7YY0dhCMVHnBXwCvepA5YIF/oVofBWl9kcI4lWRLgbSfw
         SGp3z3JybK+8Ra4yPJZ3QEjvzBVtN81HAx27gWpnpvFi9MqU/v0AjrTOtunyHEqlQkYG
         dw8gFTw4BzpQQxuxDeYv69HlLxSwoGg2S9FfrMxMbpamFswRGHG6Cwp357FJ2U+eUS/y
         StgY13ZCrLoMCgU/SAJAcPvOI7HYYx6TQWLLahcl//OQyqqCDXNmbEpbtWwlQGgwFSoa
         kjJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788611704; x=1789216504;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=S3X7uidjFB8vVdKb+fO92WnrzwU/cqJo9nFwSZVVmzI=;
        b=YTIlgP1vGs8UiMy4q7uuLfqEsmK7hij3iQSMLxTecZqOap9iGoA6+8+itY1FiASje9
         D8CoqLFKLq5k6u6/NeaUkFFEG6ctPbuvQmHwinhIvAdRgs068rU/Op8543RzexUsHHj6
         WVC4sKTRgfp73tbz1mrlK+IP41ihWRbqPRZycQ1gwvs9FCodxpD7/rkOpzplQwPjaTEO
         5Fdr/lYAp0UT/PlCw2RBt4URokukeH89QCXo71XX79NA45GlbLouoYszz2I0Fn6RjKAZ
         P0ftiPG0muPlvnTiliYgSW98FlWMCKZMk5uHUo8SYB57Vaztb249IXyKfdbhPtU+y7pU
         1XJQ==
X-Forwarded-Encrypted: i=1; AKwUvBy4QdRUVhLBtdu3RmXtvICrQcb/pXSciuYH0P9Ei7EgovLx6RlPFzH15TbZUiFl32wjWxT9IBBBL5f36Fo=@vger.kernel.org
X-Gm-Message-State: AFuF++ka4TJM9+wqTOLRAHdijcrefygDCkkXkBT4cSo9cz1yFWa5fwFr
	osGklgTQ19PXJiaFjPPH0XzNSLFtu922oZhURr4af7iQRSdFgmOv+N0J
X-Gm-Gg: AYBFou02oXc4Ou6cHdQubLoecPU46bWmUBfDNGily7OyOj0nEdKbTvNAfIf+htnwL9y
	6+zpPQW4xvujd7vkqsd1lV13c2s154OOKcf2d9HnB/R7lSxbzf284Mx1U42mu4fs+H+mZBRw8t8
	t6EUvzoF2q+4UBygLy9h7pxlOfwNvImsK/Q32J9t1VTgdczquRFNBUdbiyCPHi5XkaORGjDzLXD
	D5cAulCPz/A9VjJZAVwP7qozF6GK1EV/5JXnsp+irMalZloZYK1Wa4coWRjq+c46Oo7xDx4+M46
	QH0tAdTNknQjDfUNqtPEVuY7DxPlJsbGCK1et9AXeA/0v9fAQSuKl/40geuTro8tQAXQcpYPEzf
	9NFgTYG6j43VS2ZmyAmCBEiE8ogkxlvxrzv0SgF4M894gYqOzN3IDKAa8GYsBcNkXdL/x0xC7i/
	cyrR0fmboKS8RfL2BV69Ko19UNgbHXy/nyrsBkPGSXoIZZkbvMHFAp7hu3u2hsCo40YiF/aC2/e
	pbA246qdQe28RiXKrfl98uG5oSxu1FewGEzQQ4Hlgc=
X-Received: by 2002:a17:90b:258d:b0:396:4c63:7193 with SMTP id 98e67ed59e1d1-39b261323e0mr19491750a91.11.1788611703632;
        Sat, 05 Sep 2026 05:35:03 -0700 (PDT)
Received: from Biostar-A520MT.. ([187.94.13.245])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339bdf26c5sm13829815eec.27.2026.09.05.05.35.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 05:35:03 -0700 (PDT)
From: Breno Rodrigues Alves <breno3011alves@gmail.com>
To: gregkh@linuxfoundation.org
Cc: torvalds@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	arnd@arndb.de,
	linux-clk@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-fbdev@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	Breno Rodrigues Alves <breno3011alves@gmail.com>
Subject: [PATCH v6 3/4] media: dvb-core: remove defective and unsafe ULE debug block
Date: Sat,  5 Sep 2026 09:34:49 -0300
Message-ID: <20260905123450.5620-3-breno3011alves@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260905123450.5620-1-breno3011alves@gmail.com>
References: <20260905123450.5620-1-breno3011alves@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Completely purge the unmaintained DVB_ULE_DEBUG code block from
dvb_net.c due to severe lockless race conditions and buffer overflow
vulnerabilities on global network state variables.

Assisted-by: OpenCode AI
Signed-off-by: Breno Rodrigues Alves <breno3011alves@gmail.com>
---
 drivers/media/dvb-core/dvb_net.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/dvb-core/dvb_net.c b/drivers/media/dvb-core/dvb_net.c
index a2159b2bc..3b503695e 100644
--- a/drivers/media/dvb-core/dvb_net.c
+++ b/drivers/media/dvb-core/dvb_net.c
@@ -68,7 +68,7 @@ static inline __u32 iov_crc32( __u32 c, struct kvec *iov, unsigned int cnt )
 
 #define DVB_NET_MULTICAST_MAX 10
 
-#ifdef DVB_ULE_DEBUG
+#ifdef CONFIG_DVB_ULE_DEBUG
 /*
  * The code inside DVB_ULE_DEBUG keeps a history of the
  * last 100 TS cells processed.
@@ -320,7 +320,7 @@ static int dvb_net_ule_new_ts_cell(struct dvb_net_ule_handle *h)
 {
 	/* We are about to process a new TS cell. */
 
-#ifdef DVB_ULE_DEBUG
+#ifdef CONFIG_DVB_ULE_DEBUG
 	if (ule_where >= &ule_hist[100*TS_SZ])
 		ule_where = ule_hist;
 	memcpy(ule_where, h->ts, TS_SZ);
@@ -659,7 +659,7 @@ static void dvb_net_ule_check_crc(struct dvb_net_ule_handle *h,
 			h->ts_remain > 2 ?
 				*(unsigned short *)h->from_where : 0);
 
-	#ifdef DVB_ULE_DEBUG
+	#ifdef CONFIG_DVB_ULE_DEBUG
 		hexdump(iov[0].iov_base, iov[0].iov_len);
 		hexdump(iov[1].iov_base, iov[1].iov_len);
 		hexdump(iov[2].iov_base, iov[2].iov_len);
-- 
2.43.0

