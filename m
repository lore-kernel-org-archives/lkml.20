Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793606621;
	b=CxffVKfS7AAj9/iBPRr1ppiTMGhA5UOhsROq9+7GqREHQdSwC7nIf6MRQ8daS/k5+YXl
	 U6kYhcLANF9v3ivX4bPyr6oVYAtezzGbjWcGdNq1yDek6jX9HyQseo7VsmqlUNjReTSts
	 8lXzwixdvMbxXbuHiRwNyvb2WFj6yGbZr39FM6uJj63NHeK0KQnOTFl5qrsWjvW+0Hywg
	 CALbQN6FlDk+mh0eJAHMilZ4zhT9P8aA86U/jiVz2M4OnRJg6TR9T0YoLAiCyfq8j71yD
	 /Qhbjm1eo3e01e0eBzCc5JyfiQaJHGeD0+ok0Pqut1r6QAQY+smynamSfVtQNcC3IJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793606621;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=thtxyrefz+ZDuy3D7yqgHBR2WhnB+jFTqsrrR4OaS5k=;
	b=IOW1NBwpAvnDPOYs/VZBF0zrNCuBRKslFRH68TK5DuS4aGPjaNOmkWnHS/0B4kwu5NvA
	 i12fmiWUOx027WUNCVuNBnNIFK4ppnQAZJHS1OqhL9Yjl5s5iKwL6avVmjGUPg1bxZ2bi
	 IEThj2D+Ht5/AxHd52QPgIjm/Bqbj4RXgz0YvBMpMuKUFLZkCjq1JK1xxw4kKp2XyZ6y7
	 TLz2AZoAZzLvXzEy3DO3nDByrFfYJQvgykprHlFH1FfSfP6QLRiVu+kNAR4tS15GIe/uQ
	 5TMcSMQrUCpTuitG7RWY48ru5dpkPAk+ntGSyojt6/R1bOr3tASi20kPVH5k5mg1rLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HPoolQ89;
	arc=none smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12341606A339
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 08:03:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12341606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HPoolQ89
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2e9d1114320so20333975ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 00:03:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793606620; x=1794211420; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=thtxyrefz+ZDuy3D7yqgHBR2WhnB+jFTqsrrR4OaS5k=;
        b=HPoolQ89ywdwWiJFJ8XJC9Jr8iZ/fCC+Y6kDZuTLOBRqrZRn7mdsct1a+vv/ohiXWC
         yV3EVj5XHPcugcBwrF7s2o9MxhAmv1L8L9XJaGm9eHjmEgY7KsW3Ob/7h7ad66TfoESc
         zOIJxWJc08kNv2Z94MvPWRKp/JE5BcpGZLJ+J03j8V+hkyPIH69uaXAm31hTxpSyG2Xv
         KgpirvOFQkG8oEpB/GYcWvREQhWGPXgDW48I1z4ETawgD2rrpbkOeeBRrZjjHBA8VChb
         UlngdnNzW9mDYR50rgyJjaJB+HGFo+XzPS/vudP9EEHRwUw5RFn8oSiM2SlHpCNQbumO
         HaLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793606620; x=1794211420;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=thtxyrefz+ZDuy3D7yqgHBR2WhnB+jFTqsrrR4OaS5k=;
        b=f/cpnpRZA4lYhUmrz0//4FFDqQ/3o7K9WECBeRiFdXKsZPfaQ9h8nG8qNR02V1dNFY
         b79tIiF4VBVKmAkdXKuJazFo8NIDJtdPFAS0drpKKMO5wOY7mklrBUUCyxTKc2i5LPob
         O1sM5GV5dckYYTQtfA8WTQhsIv+/SqFCvv+9m8vulLW2upAiSUWF9tRwpg7+qOHPJsPZ
         W+J7/Y8fZB8lyZzS4bdU327cqXskkfrXmRrBLIXNnES2krAqfFkQQ1kmLb5DOm10kn9S
         MNLliz0NYM7AFZ32heZ/eMWoYBaj+rM6uUGS2/1Ocwo4epBgNcMl0hlM3eH0amvMp06j
         Q3hA==
X-Forwarded-Encrypted: i=1; AKwUvBwmP/vJSNESEdNdi22bC5uGoXArrCoUNCgwHTqdLiwqS8L6ZC5j8Z5XuYsC/Zff+VeGfHFqiu0wPMG3cYw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9mNV5nr+KS6KhUebpa7vMRKBXD7Tk/yQ9x+sCIFdXRvmbE6lE0
	XMESE80rGd11sJkL3I/bKhXif2IgjvT3CQYVsZ/HbIuPlWZAO81OU5mxV753ESEG
X-Gm-Gg: AYBFou2NGqxzWeCpQ3JGxveo2nW68K+mLsSHzlHxZEyrLDIiwG8BsF+aRT/xBWkI3rs
	P2A7FwEIxrGNtIJrZrilgpRG+hAd8mG0tW5MLmTL6fKScHQCO5bMkIUcGdNs2/7qMemJba8FmGZ
	QEuyRA7O6znvkIfwzRljjZa+6gGIFhxQqTpIHBSzQjIYs5hbvQx6Bvk/2LzTll225ZcZBGHbnoM
	s8EaXr7y2Dbfr83z1SldLEt6l/8chQLhh1LOhFaw/trXdV7fKSzW0e09D+d/pUcRaJp7jgse1E2
	k2Gac6T18fmdPT+Oah2Vc43BMYJXFvRKmCbUuoCSstRQZJZkZIBlthUXQ9xQ0wcOC/s8WcBDNpT
	0+uEAzI3Mlg/P0gS5pEwei9q4niiQgaW4skL7pTiyBTQy8s+B4pC2OhUOGPd5Zc3zLzBzUW0W3o
	2w7pDNdMGIBldNon9MU9Y0uAstdWIZme88DVTrqmQelD8+IIzcgqz1UGFzQmeAsohpGnUQA7Vn5
	pKkh9YOYjVdWABHVGtvm3Rl1CX/idAZ+MGOLFlOKi9JAg8ALOgCyisoRYb4FgUqrojFwOyTmzrb
	PH/6kulGcNRIHOzdbFiU/MEQYK0y365eHpWmjuWcnwPWHFRvovqoQKx1hWp/aNWYqmYVxv6LH0w
	7vS1eOQ6NkA0seQW9TvUDGSlAwyMcKbz9br/AyP3K8roAYCbvVmFc9ENi1liC5rWMSMmRs4xDdG
	fi/GBVgUG5sDAOSY16jawwhT4tLWh/xmuCbFA=
X-Received: by 2002:a17:902:ea02:b0:2dd:7646:35cd with SMTP id d9443c01a7336-2eb3633227dmr87841375ad.0.1793606620285;
        Mon, 02 Nov 2026 00:03:40 -0800 (PST)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb392afa5asm23573655ad.72.2026.11.02.00.03.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 00:03:39 -0800 (PST)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Helge Deller <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] fbdev: pxafb: stop the smart-panel thread
Date: Mon,  2 Nov 2026 16:03:31 +0800
Message-ID: <20261102080332.1466689-3-matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261102080332.1466689-1-matthias.goergens@gmail.com>
References: <20261102080332.1466689-1-matthias.goergens@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pxafb_smart_init() starts the smart-panel refresh thread, but nothing
ever stops it: neither pxafb_remove() nor the probe error paths that
run after it.  The thread then keeps running on the devm-allocated
struct pxafb_info after it has been freed.

Stop the thread on removal, after pxafb_disable_controller(), which
waits for a refresh that only the thread signals, and on those probe
error paths.

A thread that has already exited must not be passed to kthread_stop()
unless the caller holds a reference to its task_struct (see the comment
above kthread_stop()).  This thread returns at once when the board
provides no smart_update callback, so check for the callback in
pxafb_smart_init() before starting the thread.  Probe now fails with
-EINVAL in that case, instead of succeeding with a smart panel that is
never refreshed.

This needs CONFIG_FB_PXA_SMARTPANEL and a board with a smart panel; I
found no in-tree board that provides smart_update.  Sashiko, the AI
review bot, pointed this out while reviewing a pxafb cleanup.  I have
no PXA hardware; this is build-tested only.

Link: https://lore.kernel.org/all/20260722081427.413EF1F000E9@smtp.kernel.org/
Fixes: 3c42a449107b ("pxafb: preliminary smart panel interface support")
Fixes: 9f17f2874834 ("[ARM] 5118/1: pxafb: add exit and remove handlers")
Signed-off-by: Matthias Goergens <matthias.goergens@gmail.com>
---
 drivers/video/fbdev/pxafb.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/video/fbdev/pxafb.c b/drivers/video/fbdev/pxafb.c
index 4f5c408eae56..b889a17e7304 100644
--- a/drivers/video/fbdev/pxafb.c
+++ b/drivers/video/fbdev/pxafb.c
@@ -1248,12 +1248,6 @@ static int pxafb_smart_thread(void *arg)
 	struct pxafb_info *fbi = arg;
 	struct pxafb_mach_info *inf = fbi->inf;
 
-	if (!inf->smart_update) {
-		pr_err("%s: not properly initialized, thread terminated\n",
-				__func__);
-		return -EINVAL;
-	}
-
 	pr_debug("%s(): task starting\n", __func__);
 
 	set_freezable();
@@ -1290,6 +1284,9 @@ static int pxafb_smart_init(struct pxafb_info *fbi)
 	init_completion(&fbi->command_done);
 	init_completion(&fbi->refresh_done);
 
+	if (!fbi->inf->smart_update)
+		return -EINVAL;
+
 	fbi->smart_thread = kthread_run(pxafb_smart_thread, fbi,
 					"lcd_refresh");
 	if (IS_ERR(fbi->smart_thread)) {
@@ -1299,8 +1296,15 @@ static int pxafb_smart_init(struct pxafb_info *fbi)
 
 	return 0;
 }
+
+static void pxafb_smart_exit(struct pxafb_info *fbi)
+{
+	if (!IS_ERR_OR_NULL(fbi->smart_thread))
+		kthread_stop(fbi->smart_thread);
+}
 #else
 static inline int pxafb_smart_init(struct pxafb_info *fbi) { return 0; }
+static inline void pxafb_smart_exit(struct pxafb_info *fbi) { }
 #endif /* CONFIG_FB_PXA_SMARTPANEL */
 
 static void setup_parallel_timing(struct pxafb_info *fbi,
@@ -2366,6 +2370,7 @@ static int pxafb_probe(struct platform_device *dev)
 	if (fbi->fb.cmap.len)
 		fb_dealloc_cmap(&fbi->fb.cmap);
 failed_free_mem:
+	pxafb_smart_exit(fbi);
 	free_pages_exact(fbi->video_mem, fbi->video_mem_size);
 failed_free_dma:
 	dma_free_coherent(&dev->dev, fbi->dma_buff_size,
@@ -2393,6 +2398,7 @@ static void pxafb_remove(struct platform_device *dev)
 	unregister_framebuffer(info);
 
 	pxafb_disable_controller(fbi);
+	pxafb_smart_exit(fbi);
 
 	if (fbi->fb.cmap.len)
 		fb_dealloc_cmap(&fbi->fb.cmap);
-- 
2.56.0

