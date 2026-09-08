Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEBFC560AC2
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 16:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788884448; cv=none; b=JcykcA1ZQnbUdozHq7SAGdGhUzz3P8EnLQ7dpiVzThcbWFx930n7gf/QZgEVEBSzrEVnGGxGujtDBPmUIJ+fEqwFX5fQ1bYcL5dYksWta1i00domaPzolQ47v3qKv0jEhi+Q/BLbhZCwgRWn0ye/3X3yxhgLXieDcnOcu2JWMYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788884448; c=relaxed/simple;
	bh=olB7ON5GEqbF6ANJo9WUseDrng9sbZUoV/TkAb3SZzg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=BS7SMX4CFB+vD5onJD+s19JpERPjsVs+4wgs+siJ+Pj02JOi3Nb2kI7dryEVnpReMN7GEVByof6xpcU1st//jD0UOrwaG+9PyiNU4IN4h49fxd3dgVrIV43DluP1/FIUxOmG/c80tRCr+Lm7I/HeHogwZpeW2nhXskkzIW3JS4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iuc7VTA9; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iuc7VTA9"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49b9320423cso54875615e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 09:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788884445; x=1789489245; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BNfCA4fa19+esHhbQ0fqNRwxl+r6i90f8pc7dIJXU2k=;
        b=iuc7VTA9I3cMr3JBHSkckbERG45ZSTtWx7kU2K+8wOXIFk9t45STLAtpq18Zv5Sj3k
         9vJH9H7VojRobViCkzdwtDvU4AylZn9YyqQ5AY6pKmVu5B28pcgPOMeu3a4DaBJPuU4T
         q86tRChS8rOT59CDRgGb4kGahpBWogkGlzO3VZSN9lKykEpB6Gw7PB9JAHN6Lxk/se0g
         XRAMW2hocOYAfdUU4hXsVwcBm+mcq6EZQpH5Z6iXB2/D+QljoP5rkJ32Xl1xnW5lTgEX
         cbP5FKfgH6mIhb/C20x+jqkOZUBxwsebMKREsBMeMFluUItJH9t3HhNCFDCjZ1JbCY2S
         mr0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788884445; x=1789489245;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BNfCA4fa19+esHhbQ0fqNRwxl+r6i90f8pc7dIJXU2k=;
        b=bAGy4EPzzzGTHr6Qq6PhJtZE1JmiICB6PbDFRoeD//lSJz73A1fYab+8XA7LtM0yjz
         IiNWkSmpvRJJW0lJ78ENsWq1jju/OzDmrFQZDRTXBfOpdS6/VA5/X6eyxvtZSbV2L2Xg
         baTO9QTMbNGuZ1yGVAzr17QFLfULmnNIWCcyD+rXfNRqOfgtYWrEXfTVMWykFf3CEsR8
         f5fzt8FnJXKKdbFr9B92O6+aLZbMW7KWxxhJEucUEBtktu4uTRysSIJ9VqWKr1MGX2to
         fkCC1Ua007QDULI4ZIuch1hmYc5oggJcNeRJa8UtG1jt94WAxiX3ru6Q+gZ9fwYwGF0X
         KUsw==
X-Forwarded-Encrypted: i=1; AKwUvBxPjRSU8QUIyfjZijWIXk0a0hHoKY7xAVEGgNgD9Z29j6uaJy9ZH48iVCOkRYpnlLsOnBSFTHA8hMX+gQM=@vger.kernel.org
X-Gm-Message-State: AFuF++nEh67Kdvd8F2a/pLOlco+Aa101cMroNM97K30SCdtyT9yeDIbP
	oJi1hrIcAcRQW/3lrr7pYXYEqCNlbZy/PKvvHPXxZtLGFXWQCdSO0GQd
X-Gm-Gg: AYBFou3BH6EQaG+a9HrzFDSMyW7GXwX4juv0mUv7K/lmzr1IUPZFd8aiV2grt26Y8VI
	uN/D6Nax8rp0FTS83l5zMsae6tjtsOAxsN8lwj30pq/E2wdM2G1DvBVc+Oye3BHfcvjry1OURMk
	vOAy+XAN0I02EyT5D1ZhT+0999liEmNZvnWkut1S09AlJCTJl+WAtdzcuhGJET5Q5IrNV6t07N4
	paK2CmmNXx6RXv0c/o48wkDPcrjHrA21bLs7lpnGLZ1mMNdEMzILG3CZrQ3Q2eomADq3Bzb8hfC
	GkuDvkkkqO2fV3jwSq3tCHSVgw5DwlXsLDf9WALHtKXgJrql987AeMR473zlngYr6lcn3co/cNq
	wlX3SZnVvM09XzloPUaVHoQow+nEMFzhbH2BhiQLKJN/mq1Op4zJ/BdZiIkJD5a1ynDqU2m8Uy2
	aVf1ltpIW0WaCKD5tg+RoFJu45l925k9dOWR6kjWBFdxND6cZbGroDzzFr7uWQHjyACcco
X-Received: by 2002:a05:600c:8715:b0:49d:17d4:aff2 with SMTP id 5b1f17b1804b1-49d17d4b01dmr151135895e9.1.1788884444585;
        Tue, 08 Sep 2026 09:20:44 -0700 (PDT)
Received: from metepc ([46.197.185.71])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf7740d44sm884641885e9.15.2026.09.08.09.20.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 09:20:44 -0700 (PDT)
From: =?UTF-8?q?=C3=96mer=20Mete=20Kaya?= <omermetekaya0@gmail.com>
To: oe-linux-nfc@lists.linux.dev
Cc: david@ixit.cz,
	horms@kernel.org,
	sameo@linux.intel.com,
	thierry.escande@linux.intel.com,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?=C3=96mer=20Mete=20Kaya?= <omermetekaya0@gmail.com>,
	syzbot+1e3df0852e82c21ca418@syzkaller.appspotmail.com
Subject: [PATCH net v4] nfc: llcp: fix slab-out-of-bounds reads when logging service names
Date: Tue,  8 Sep 2026 19:18:01 +0300
Message-ID: <20260908161952.731468-1-omermetekaya0@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

nfc_llcp_wks_sap() and nfc_llcp_build_sdreq_tlv() pass non-null-
terminated strings to pr_debug() using the %s format specifier.
The buffers are allocated via kmemdup() or come from netlink
attributes and are not guaranteed to be null-terminated, causing
__dynamic_pr_debug() to read beyond the allocated region:

  KASAN: slab-out-of-bounds Read in __dynamic_pr_debug

Fix both call sites by using %.*s with the explicit length to limit
the output to the actual length of the string.

Fixes: d9b8d8e19b07 ("NFC: llcp: Service Name Lookup netlink interface")
Reported-by: syzbot+1e3df0852e82c21ca418@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=1e3df0852e82c21ca418
Signed-off-by: Ömer Mete Kaya <omermetekaya0@gmail.com>
---
v4: Fix missing uri_len argument in pr_debug() format string
    (compile error reported by Simon Horman).
    Add Fixes: d9b8d8e19b07 ("NFC: llcp: Service Name Lookup netlink interface").
 net/nfc/llcp_commands.c | 2 +-
 net/nfc/llcp_core.c     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/nfc/llcp_commands.c b/net/nfc/llcp_commands.c
index ca89fe967d6a..80a00938c869 100644
--- a/net/nfc/llcp_commands.c
+++ b/net/nfc/llcp_commands.c
@@ -135,7 +135,7 @@ struct nfc_llcp_sdp_tlv *nfc_llcp_build_sdreq_tlv(u8 tid, const char *uri,
 {
 	struct nfc_llcp_sdp_tlv *sdreq;
 
-	pr_debug("uri: %s, len: %zu\n", uri, uri_len);
+	pr_debug("uri: %.*s, len: %zu\n", (int)uri_len, uri, uri_len);
 
 	/* sdreq->tlv_len is u8, takes uri_len, + 3 for header, + 1 for NULL */
 	if (WARN_ON_ONCE(uri_len > U8_MAX - 4))
diff --git a/net/nfc/llcp_core.c b/net/nfc/llcp_core.c
index cac1b5487064..fda236e4d9fd 100644
--- a/net/nfc/llcp_core.c
+++ b/net/nfc/llcp_core.c
@@ -341,7 +341,7 @@ static int nfc_llcp_wks_sap(const char *service_name, size_t service_name_len)
 {
 	int sap, num_wks;
 
-	pr_debug("%s\n", service_name);
+	pr_debug("%.*s\n", (int)service_name_len, service_name);
 
 	if (service_name == NULL)
 		return -EINVAL;
-- 
2.55.0

