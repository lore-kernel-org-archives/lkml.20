Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B0524FECE8
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 11:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790852806; cv=none; b=jMyvPb86W/O6fL2Ezb0SfgHkmy00vkt6scLle+yhm+N7cE79rHNfjR+Az29PG4Z7w14uwyFdUsfjW5SnhFQ5gaXSloRASdNEavarj+YLi1N/JOuDaYBsvL7O4CzO46L10YjHRnEhSOodoTvpWLv7sD8yS04L/HZ62v9ZkqBTPI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790852806; c=relaxed/simple;
	bh=VJhODPY00t6tM3jIhYztXG9F/1xpVlGsrl89toP9HDM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qMyu+qPYsfDt1ZEb71uxWO/9Grv6py5rLdRR7DIWHEX4HpegxRy4gKZjIB+OihwH8l2E65XBfae+4CqQe/X2/7pSZuZ/E6pF84/rJAQCdwiRoZikAtGCCBM+Iszrgs6dEcqntzvhEHKgacvvsjmXzpBjnUjv1H3dsHtzZfHo8nA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=SfwvNdUh; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SfwvNdUh"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-398b1e63c49so243621a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 04:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790852803; x=1791457603; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YcXyTnOXW2W3qLKJJiiWOP9lP4SUYSkZqRBXa53K+vw=;
        b=SfwvNdUhxVCFpYec3ZEW/C3ogpnEwFhecypEc/1qjIEEC3I6aZRUJXubr/syrR7Hg1
         RcOx0fq9sVN72cEp1UT1HH1JigU2wMQkvh9C10KeVGyt4HmK7BomovQPypwi1R1YsDVy
         cXuE4QC8oVOh7Ocoptdw5kOaBdmSfnuM8l/5A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790852803; x=1791457603;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YcXyTnOXW2W3qLKJJiiWOP9lP4SUYSkZqRBXa53K+vw=;
        b=AtQLv7F5babCFQC6NJJ4KyYeAkf5KOZa/5K5Q/ah02/ez/6QtGLX9v2OT7lJ34oav1
         XAG/zVc+pPkIeSOJASwz0B4f+YlcDrdMcUqMMAH7cOuWWyoJ8c5VMeg5ngK9FXCrCANg
         HmOG+E+iSLyTU1VPNiq1db5rghK8CKNUYKVZbm6UUJhAsghlN1DnVQ7dCx7CbF+K779s
         3mcH3I1IHv89bl0zqmTu/OQEvQZ715dscYAsn6YFIUkWWMRa3dPVsjeBBvynZeOVNMoW
         TJsfgy9h3mdalcNay3l7gjwih435pqD7Zha8Ic87ru9uEpb9cC+WGQpL/IGKCj34+YJQ
         LpIw==
X-Forwarded-Encrypted: i=1; AKwUvBzRPv5IbI+A1lxZJcF85cjcDQReHedHnHIuTxOY1d546pAxf7YwncbATje0GTswVvB4uvIjQdHNkG4ODFw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKSvI6FZtr2lFLM2jzYtHFuuE5Dgc0ycu/akihXQc1q/gCfvwhE
	QnTQxgk19l9FR3xL1/+s2Gpey3VQCOM+z9AbDnG0DwNeQiz4A3WLcI9JbQlZSm8nFw==
X-Gm-Gg: AYBFou2VFxK6zj2kkt1i4jDps7BNiykSG2Kfyt8VzR56sW5I6gNdNulfKxrPiKX6NjF
	tMJsilytbwLmfc5q8TZyo+38kETi7zhvn4PFmw3PzFR/Wn0In6tRbz+QfoWxcBfl8zoIS/N1+ad
	+lbZQOsEx5X7cX/3x1vBSo3noRXoG6DmAj5seObNFLczNP6YDzx4kCdtGFjhfld8BqrPt/TDIeS
	ADh5bwUnYDD+OYZeYKm+hqzWwZ5qiJZzduFfAyB6kZhlrDufVJzxF1sIVfwzjRRoqQXLjHwwW7M
	LpTxuBtlFyV/NGMsDFIt4ebi0z7vatKxynPSTZg8taMeuIyjFR6lVHVNpDRiDD41OMKaMcF9cDQ
	x3TFj0ZVXudthzb+nO2AMM33QB8af4ypmJoNyA+1oo4uDMRNd+/NO2Q2X8KV68GeyF2Mry5+p5Z
	lAAZHNDZcy0fxudVLIk6tUSHzRbS66nRuOZI9cR9vKvFxr0TuWkaz2r7gEZIBtoKJt9DqVfeVOb
	OqgacTNKK+t8luvolUzaNdrHqX8U3pMknW4YgTkDUjBOt4CdTY5+p5vKw==
X-Received: by 2002:a17:90b:5383:b0:39e:6ed8:8e84 with SMTP id 98e67ed59e1d1-3a4f3a5a0f0mr1583429a91.34.1790852803176;
        Thu, 01 Oct 2026 04:06:43 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:9d96:5df1:469d:9e89])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc7e54a4121sm1265705a12.20.2026.10.01.04.06.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 04:06:42 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alan Stern <stern@rowland.harvard.edu>
Subject: [PATCH v3] usb: hub: Set proper message when usb_hub_create_port_device() fails
Date: Thu,  1 Oct 2026 19:06:30 +0800
Message-ID: <20261001110630.1476797-1-wenst@chromium.org>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Right now when usb_hub_create_port_device() fails, it prints a separate
error message to say which port failed, but otherwise leaves 'message'
set to the default "out of memory", which is somewhat misleading.

Use a small buffer on the stack to put the custom formatted error message
in and use it as the error message.

Assisted-by: LLM # local reviews
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v2:
- Simplify to just using a small buffer on the stack (Alan)

Changes since v1:
- Explicitly track and free the allocated custom error message instead
  of using devm_kasprintf()
- Link to v1:
  https://lore.kernel.org/all/20260728100005.413868-1-wenst@chromium.org/

Sorry Andy, I ended up not using your __free(kfree_const) patch. My LLM
was telling me that it won't work correctly if CONFIG_USB=m.
---
 drivers/usb/core/hub.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 0e929a4c9fa1..d7f39e86b24c 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -1480,6 +1480,7 @@ static int hub_configure(struct usb_hub *hub,
 	unsigned int pipe;
 	int maxp, ret, i;
 	char *message = "out of memory";
+	char msg_buf[32] = {};
 	unsigned unit_load;
 	unsigned full_load;
 	unsigned maxchild;
@@ -1756,8 +1757,8 @@ static int hub_configure(struct usb_hub *hub,
 	for (i = 0; i < maxchild; i++) {
 		ret = usb_hub_create_port_device(hub, i + 1);
 		if (ret < 0) {
-			dev_err(hub->intfdev,
-				"couldn't create port%d device.\n", i + 1);
+			snprintf(msg_buf, sizeof(msg_buf), "couldn't create port%d device", i + 1);
+			message = msg_buf;
 			break;
 		}
 	}
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

