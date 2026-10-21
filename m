Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792617257;
	b=b0VcZ4Q81VjOGOvtxTaHDlm7G+6EWv2a4fbPplL/QhC//B4rRufLPlmD1dnqdBD2DoZG
	 6Sxc2e5F/fXtig+Qk5GrrM5jza9v1XoTVAePvGT/DS4h4ZA68eVUfIaAgXLby5rAiJ12F
	 YWxQ4OgeWG5Mdl18LQiXpQyjnxiIEmIsU6q9OkMgTmWwU9tJmeM52tbMvJ+LIQorfMxVN
	 aDQtRKj/LqcbU4IfxbY4VYq/vGwiDfIvHGqnujNYEqnXYvGXnt9NdgqyJnrfT+bUHkLo2
	 3ERdbUzU6U2xF+o4gSZ6HAEnuZQMUuBo6IERdC8bxIwHEumbVcLzVbJqm1JjrIYRBSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792617257;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=gVLvklBeqpDEJhUZWbFbh0uj5Dr9BjVDw/1I6zYYEUA=;
	b=HGuEgWsZ6ESoHeI1psgasJe+azsmwXDPtI3pUMG3qBVmvCudiK20t/ro1t6c1ediIYXN
	 1cxlOBrLio8Lw9CaGuhw41J9k6Xx8ORKXKjQEFKSmyDcKD55lW3z9/TRC/Xgw/ct/NPW8
	 cv80lN60G38buE/0C8pCgOO9SUiEkQctuD32dVswALNd+CM5kLUyNa/iTRg9qDNP9pUyP
	 pecrR7lKIAeugS+XyEQyPvWOZmMC34WUX8l2JgRyMCvd3U3VLeHvkZyJEaBhktc61ydWo
	 LlykYzxpB2ZQXXkEoQvaXMcFtKedWFGbSxonm6hXz8fTaIivbk/5CuW0oiGcAox7tGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=N0RrRN7k;
	arc=none smtp.remote-ip=209.85.210.45
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9315606A322
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 21:14:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9315606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=N0RrRN7k
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-83bbcfba0ffso731986a34.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 14:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792617256; x=1793222056; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gVLvklBeqpDEJhUZWbFbh0uj5Dr9BjVDw/1I6zYYEUA=;
        b=N0RrRN7kLqeumRcuqWWY2sl5APdSBrPY+QardQIwRIQEvXa1e3gVghGObPs93slqfc
         nrF7sj7Xl9bUMqmJ9i60h3mqI0czWezwStNm2x3/BvnhjLWOGRlaXWujmJUjbWzKiufm
         sP0xtmoL4YZIpF0cxHaUqIjbj/nY1gnBWlSJ6VKKJNda7M5CR7Z7nZo62ipEvAvFjJzm
         aeo+fhrE8uCKn3tPp/ZObAWWTJqO01tkkIGEeHLj2RmzTRVxlpvS5D+mpjS7wRSaiquw
         igew441wZDFA/HVeLM29couMYN/rZCSWTEC2wSf8dekLZhvLL6Oym5Pi3AqoOlLhPrZ4
         HYtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792617256; x=1793222056;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=gVLvklBeqpDEJhUZWbFbh0uj5Dr9BjVDw/1I6zYYEUA=;
        b=Aly+B8mX47+RkLwQ6+Ok59H68BTfR6LxYHuy9o1qjdAbMMINJQzOBre0z++hNSNhHk
         RYMeeHUaFtAQ4dfxJxpONbEP3B/5W0E1BB51j+ojKoc8uihRZUYHDU6YNe4QWnlADJhW
         urgHFjiShjl970MgVnEhbJpxaYohYCiDmZxMRWXgxkc8JZ5DZD8xBB1YY9B7VZf5zwQf
         4Wa4rZZ4z0aP9E7dyreQLftNAhRqWFsON5ce7iYBOsMF3Zu8iVaCTLdKOPQer/O6OQAT
         PXVhtfm8jNRjPx0oBVD1lrhNekopkL0iVZVpwyIxu1gaFLahD5QUCumWfU81ZjSsbTnp
         kVxQ==
X-Forwarded-Encrypted: i=1; AKwUvBxn9J4J0KjCgAa+0K6HQhO8cnYD9zlROQJk9KwNKPNuCoiTBYcPup5i2m8CuPHFUghfzJgPOwZ1f1HZXE8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ9rmo8441PR6VrK7nMyviMgojbezuOac4E1lKhqjUIzaZSeyMs
	/oxx9Zx4tBPvKNs8Yd2jI9pE0PdqIfPJqLNq/qtHcoXDsVqx/C1Pr62r
X-Gm-Gg: AYBFou332LeCoCl5PWMB4pBcx3oBjAKAMBDOzQMyQ1yRd/sJKgFplBm1F2LnJsKZGXh
	y4IeZhMeFaX6Ue2dq3KkqmSLQH/nX1jNnAreQzfgEmPDufgJEZClaMvuHprTZCZ9i8TFPp2b2mZ
	dFywd5GR1l3iELdp0aD++ENFCF+unR7ew8LqQpTjB35YcvL+xhRnFEG+bWF35GaR7Nx5Sh32DUM
	gu/9ENZydHNBwLpzW7WQ8UXHdTuNXY7do6A4jj0tGP5Xn6bVl4+wzy8ZmGFYzMzDp64dVdKsHx8
	sR2VPusBU43HW88/d2iw2PcNTQRYB5znxXMm4mWf4DRuU/ZCGTIKDbejEnTVFEiXJ1C+csKoBvt
	Ri509R1hMrGTazSbSKmvOF0b1iNXrk4YZg5GEbSN4V8ydPaH757TqzyB/mKftpqni4ytf9TArza
	ImGpTolWnjoOKWbjcVho1BZFUMEXM0YiqCLjw+gsfM+nTc/ST80VbQRWDr3x8kb+zvXBRpbzace
	19vZYJMBR1FVPBJz8Jac+flBhxz3b60X+IaQcHocXm8C6IOxQpNHHJocqOduQCYLzPKNVbm7Y0X
	cdS0YB27HGnjofB5NYgIAGj8+KAGwdA1RXwijJ6RlQCIk2hFbdNJvL4Lict9qomLLXnXQRZnchD
	URn1Y5MRbMl438xMu6TKa6tvgIl0aEgvSVn1km5emC77Plsq4Q+lRqfR738FtFqIuHeMyWJGImR
	N1fCI=
X-Received: by 2002:a05:6830:2409:b0:824:df9:975 with SMTP id 46e09a7af769-84d09a1c6afmr3496970a34.29.1792617255998;
        Wed, 21 Oct 2026 14:14:15 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-84cbd2d453bsm3268641a34.17.2026.10.21.14.14.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 14:14:15 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 21 Oct 2026 15:14:14 -0600
Subject: [PATCH] dmaengine: dw: synchronize completion callbacks
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261021-submit-dw-dma-synchronize-v1-v1-1-6af85c2d6f69@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXM3Q6CMAyG4VshO7ZxW0QTb8V4sJ8OakIxG+AP4
 d7t5PBt+j2rKpgJi7o2q8q4UKGRJcyhUaF33CFQlFZW27PR1kCZ/UATxBfEwUH5cOjzyPRFWAx
 g2+p0uqRoolNCPDMmev/5231v2T8wTNWsH94VBJ+dMPUkJnJHjMd9t20//ZKOjKIAAAA=
X-Change-ID: 20261021-submit-dw-dma-synchronize-v1-e550f47fd1da
To: Viresh Kumar <vireshk@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

The controller tasklet can remove a descriptor from active_list and
invoke its callback outside the channel lock. Terminating the channel
does not wait for that callback, and there is no device_synchronize
hook. A client can therefore reuse callback state or release its buffers
after dmaengine_synchronize() while an old callback still uses them.

Drain the controller tasklet from device_synchronize, outside the
channel lock. This also waits for callbacks on the other channels
because the tasklet is shared, without stopping their hardware
transfers. Clients must continue to exclude new submissions on the
channel being synchronized.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/dw/core.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/dma/dw/core.c b/drivers/dma/dw/core.c
index dd75f97a33b3..eb3f5ce471a2 100644
--- a/drivers/dma/dw/core.c
+++ b/drivers/dma/dw/core.c
@@ -965,6 +965,14 @@ static int dwc_terminate_all(struct dma_chan *chan)
 	return 0;
 }
 
+static void dwc_synchronize(struct dma_chan *chan)
+{
+	struct dw_dma *dw = to_dw_dma(chan->device);
+
+	/* Callbacks run outside the channel lock in the controller tasklet. */
+	tasklet_kill(&dw->tasklet);
+}
+
 static struct dw_desc *dwc_find_desc(struct dw_dma_chan *dwc, dma_cookie_t c)
 {
 	struct dw_desc *desc;
@@ -1321,6 +1329,7 @@ int do_dma_probe(struct dw_dma_chip *chip)
 	dw->dma.device_pause = dwc_pause;
 	dw->dma.device_resume = dwc_resume;
 	dw->dma.device_terminate_all = dwc_terminate_all;
+	dw->dma.device_synchronize = dwc_synchronize;
 
 	dw->dma.device_tx_status = dwc_tx_status;
 	dw->dma.device_issue_pending = dwc_issue_pending;

---
base-commit: 93f51579e7df248780214094418f205253383cc5
change-id: 20261021-submit-dw-dma-synchronize-v1-e550f47fd1da

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

