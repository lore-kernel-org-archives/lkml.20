Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED0194AD4AF
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 06:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791872509; cv=none; b=EuC8WhEomEwcv3L2LhX1BpmFuPO2lqC+QeEVNFu+kb28dU2W39QqTtTWzphlCZD/+VsAMCj5+hZpcuY5Y0B137acnzGQ+gecxhG//J6FbkMyLNgzUgkzqS5zhgzzWMLGNCdVu2b8qsBnI+MfPzij5C0+nZgJAUU2G3AYwv+SU5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791872509; c=relaxed/simple;
	bh=yKooLcN7CHgsaZDkbyO505c2en4X/luvbmOSMQrltvQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X67kk2AAFOpAfXFBZRS2L1yS74JG2U91kfLZdCxqlj7Skm/VX0EtrZMwF5aDj/bzD/58HJ2EaqYvjTiW8QJzpsyZWR3gvjsX4KBM7o4XssIQs0Kr9Rjihme5dOwkFEfQVIeUFkAsrzNc0dC/B4IP+e9L9OWFP+MyncywLCQckGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr; spf=none smtp.mailfrom=isslab.korea.ac.kr; dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b=OJD/rVKN; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b="OJD/rVKN"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3ab4178ee33so1281856a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 23:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1791872507; x=1792477307; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nwgbOTwZS+Wdyws/KBJ7MPJ9pBsymYg2xZOg5DiPzmg=;
        b=OJD/rVKNCkUPvfK2qDMpJo0Npj7pS36O0z7bxReh/mqmV+syp0FBKLFVKn2RBfUcIG
         mPv4P1wKXSGmXsBvHIbvt/v9C98Xn5g5J03nRbPM1zhjIRT7FoLZZ/pCsiYC7HAo8+rA
         KxcSy7DsauY5PB3TFCcN9NtZBYzAKxDq/hHyYxn1sA1rqU+G0Y2NhYJ5ld1ihI2bZ5Sq
         mGvGDTp4tpO0pcKxSL0Jg5ByqtsPgA7NpY0castUHSu6TMhJLeaJLNnyqXjKf+MD0UYH
         XUh49PCXPGKEVgUFtbGSo4n5xtjDzDvAl9q+iNkfA0IKr1D/dxjQJsUio4D6BtiR9MmR
         jwVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791872507; x=1792477307;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nwgbOTwZS+Wdyws/KBJ7MPJ9pBsymYg2xZOg5DiPzmg=;
        b=CQZbho10VzgS8jTp47l0FqYsQlPI3piEOldAYw8PxrffRMOBmvTa9sGH12bxdKDGF9
         IzUs9J2iKpRYpy+bFbx8ip1ca/hAyk2bapLFM3/msm3/mYJAE5144Zpugts3+LO8kNM9
         lCbZ5UZPNeeV21kW4u0F1JZCHaXSEW75fdR8FO717B58/mM7Ty5PwejT0+IRc/0bdEpd
         uSrcEAJAGwxpjWz/KpC2RCEfZpp5M4djv9jm2Aub4WY0YcI+0te+Bmqbrzp7W5LJ1OiV
         TgueDoRLb7ayibJrRUUp21nmb/zLmu1NZ/PWrj4AK/AQCFXaoXlEpTv7xIGRl8Cy7Adm
         8d2Q==
X-Forwarded-Encrypted: i=1; AKwUvBxILVrrzclp+KtDZFk6eLQdGikWKvTiEai5r8zzluFvlLiIFudqoWspMEH3ELeEjv4Mc2u1tM8oVDax4Z8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIgSfYgAksDEa6FX7vV3Lzvg7tLViQMTNHqoy+2CgD8jpEjTlMz
	AMXaxGLmJbFGzLo+Y9KQiMduoG6yriqgh6xpwSbJs7lJ6CB6tIDr7wJ+bkEaSi9HVb4=
X-Gm-Gg: AYBFou2wuzZ7SaJDCX+mYJWYF2VNSOVmlmAyhzfinOEy4Ieplbo+nShS+j1VPHuUsNV
	Mw6d0yGdAQV0qaZqnT9JJHHktQJ81rmG3a1spvrcaskaOB2htdtrWWRvUzirl9xz9C+ADH+jpsq
	VfNbUUBBMCxsmwIzva24kB+SQ4xSp2a+wV1wsPDNrGyFcNOQUBpWf8QqVG/y8mwITxBvd4gV+OY
	yagnDmxpl1dAw65ab3oJaf5QoG1VlHmYcuCnLSIutCxxfnvox+M/5UVz7j+8En3pwLfjNa3xcrE
	bSY0OIxIGNCDSDYwWGd8diAiMOGsRARh+XlfMKq7lJivfzC2iSPaCRvJT0wmhZLy9rarDLlwVeH
	nhSOosPfy/b95/6d/dbiZDPtntaFAdgp0rz3EAu7CkVDUmyyLza/qWMAs61qY7XXyiMLwRrRoBa
	NVeHreYXF+R/qWdDXiiSX9qwBP9kMWBdY3dYEoyL7O6wMQyrti+s3lgJ018ZZ3i2WGlttvgkVi3
	Bn0hw==
X-Received: by 2002:a17:90a:d450:b0:3ab:364a:951f with SMTP id 98e67ed59e1d1-3ab3a3593dbmr7775494a91.6.1791872507175;
        Mon, 12 Oct 2026 23:21:47 -0700 (PDT)
Received: from yhlee-960QFG.. ([125.131.91.97])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab32d3b4f7sm9253553a91.0.2026.10.12.23.21.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 23:21:46 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v6 1/2] usb: gadget: f_tcm: queue the BOT status requests with GFP_ATOMIC
Date: Tue, 13 Oct 2026 15:21:28 +0900
Message-ID: <20261013062129.2568405-2-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013062129.2568405-1-yhlee@isslab.korea.ac.kr>
References: <20261013062129.2568405-1-yhlee@isslab.korea.ac.kr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

bot_send_bad_status() and bot_send_status() run from endpoint completion
callbacks - bot_send_bad_status() via usbg_data_write_cmpl()'s cleanup
path, and both of them via bot_read_compl() after a BOT read.  Those
callbacks are called with interrupts disabled and must not sleep, but both
functions queue the status or drain request with GFP_KERNEL, which can.

Queue with GFP_ATOMIC, like the other usb_ep_queue() calls reached from the
same callbacks (bot_enqueue_sense_code() and bot_err_compl()).

Fixes: c52661d60f63 ("usb-gadget: Initial merge of target module for UASP + BOT")
Cc: stable@vger.kernel.org
Signed-off-by: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
---
 drivers/usb/gadget/function/f_tcm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/function/f_tcm.c b/drivers/usb/gadget/function/f_tcm.c
index 9e6d4f39900a2..12e2b20e33b92 100644
--- a/drivers/usb/gadget/function/f_tcm.c
+++ b/drivers/usb/gadget/function/f_tcm.c
@@ -139,7 +139,7 @@ static void bot_send_bad_status(struct usbg_cmd *cmd)
 		req->complete = bot_err_compl;
 		req->context = cmd;
 		req->buf = fu->cmd[0].buf;
-		usb_ep_queue(ep, req, GFP_KERNEL);
+		usb_ep_queue(ep, req, GFP_ATOMIC);
 	} else {
 		bot_enqueue_sense_code(fu, cmd);
 	}
@@ -167,7 +167,7 @@ static int bot_send_status(struct usbg_cmd *cmd, bool moved_data)
 		csw->Status = US_BULK_STAT_OK;
 		fu->bot_status.req->context = cmd;
 
-		ret = usb_ep_queue(fu->ep_in, fu->bot_status.req, GFP_KERNEL);
+		ret = usb_ep_queue(fu->ep_in, fu->bot_status.req, GFP_ATOMIC);
 		if (ret)
 			pr_err("%s(%d) ERR: %d\n", __func__, __LINE__, ret);
 	} else {
-- 
2.43.0

