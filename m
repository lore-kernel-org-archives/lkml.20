Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793579664;
	b=gr4nLNoCwRB/NTdTg/z34k7/VE81Wv7sa6xPEr6sV6sIxfMWPxniMMzEwmIjl6JvF1ZK
	 vHluUjJJ9GTFKeV3iewfx4nBsmm2ISQMCh2JJ4C8jEodnmI9CPdNGMEHMRVVZnFpeua/g
	 I7C6zHy/JvKc1CaXahAaVn/9G/OclSqppPVSQoOwY9vpVHkdm1yx5l0QeF1PbjUfxzD1S
	 JdrOAmRpJ/hPiXKd72wX+X3NjurWUzi9prAVZYP23wl9SmozGAqectpYYuPAk58Kt1Huh
	 k2PeutgMke7Ueaau6iE6XMTcMph8ApBmq5QXIqxkxTiPLFkXnSuVi4P0HWdOw8IGB+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793579664;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=t6BgGV0l/xNQelfhYb/Yd8iY7WjY6xtp0Q45DsnSYHE=;
	b=KnukYuDnjNy6bl9jW6S7DC9ImWLKN2urjA/a9X5mHl2GZUCgD5wqDN0ApVXolOT9PFdS
	 8VTsVDrKY7fac1XbiGlgz4KDQBqiQbtFWy+lQ6vitfm0FIDG2eYxDwncSb5Dv2ieSGUZP
	 C4BGy9EbrQM+TB0GTsNLGIhybpbkAGedKIPmNZXCojTOVbtV+b+hNZdgg1Zw4lrCap+Zl
	 h8BZpqvn4MDD07FuFbcbDmK103+5VdrnYoZU6iMH7j97HPgL1uPvSD5/JchkPkMVO2qvp
	 or1aRMNlOtHOy4+aLC8Zj42UBegdQLa7Ve685Y+j5Ge2WCDi/6JTSu+UsLamu9LYmdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nV1PMwl4;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B667606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 00:34:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B667606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nV1PMwl4
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a60f9474c4so26152185e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 16:34:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793579662; x=1794184462; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=t6BgGV0l/xNQelfhYb/Yd8iY7WjY6xtp0Q45DsnSYHE=;
        b=nV1PMwl4VHAHqIOl+VOqC5R1iPcDuyTrt0MB4SB3sTi+Ly/Yt9pfuUyCCbx+Jlan7M
         NnlKwdJIYpcAS9cyPKnFhPWGIDoxcXwyeKOOYKn2k+DGnyTNslTSxub2Dro1ZTn0h4xO
         SVNX8ISsy/VlInSqRUVhEN2vEdT3RYAjzDc/6am1hOa+fiWe+brneZJum50JT4q/Ttip
         x+NRpWiv95FZ0azw0Hxt+58YJE1lf5V8xjc3a6ksMuiXpAoQZXfYTjQ7bZlbCL0Y4hjz
         7zwCb4bEUNSzN0cM0W0lLXLxev9SkjMQ/hzcCSP+jOX5onvsFuvUwvfzYcIF7zifFd+5
         YMPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793579662; x=1794184462;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t6BgGV0l/xNQelfhYb/Yd8iY7WjY6xtp0Q45DsnSYHE=;
        b=G2+ddqZxWwaX5SKWpucpnihYVEZJKLHty6GJMW1istAEgGnjx+VBQC5N+Dd9ok3jCk
         138j7lArmBnhPOAsvM49BrE7R/MpjHl5Jgv1+PxlDLIRv27sfFT9SbaxRl7UykN3duvr
         iggOSYhz4gbwT/v8dzMH5j3taO3f/+3Jq9IwqR8e9QaBkvuBAzPe4wbCj4v1T/nWqclV
         ybWRfAD7I0bENcmP/PFHQjPenPjQ5LB1eb5yDCYi/ToLZ/aqAAmwTSiYqDLtK2cGVX2Z
         ekqiR7yEgCdOTUYdeMt+arZK3L5vR0GSkPfX2WrcTd42p4iYrnc6FG2yggQMykLQoQpx
         VwoQ==
X-Forwarded-Encrypted: i=1; AKwUvBxHZhigFJ/BmXkdYw0P9qzIOY9zMqhXO3I4by29nk5Lp7b7kzrzAj+bEX35CZg3Nd64pfkR9wa/2DKTG98=@vger.kernel.org
X-Gm-Message-State: AFq9FYLU/V3AXxTyxews+uP14p05k8dYP3clav+tZ7kpvqQKUlm/Bcvt
	to5bbuxVovozy06Qn5jAtFuQspqzMJP/fSO42lA77jvmoIv+Ty+m12g=
X-Gm-Gg: AYBFou086HLPxITtcQyu8uJCCcnk6/CGYdPqu0u9kf/S0iXSB22oQWXMu5YddzMJvvW
	apr/sTBW1pFkcNAqosKRtYpVyVldcSF24NLcx989Tx0DKler+2hqEVXJkcI/b75i8Yc4aMdTgmu
	r3kCrLzQ71y1Q4+YIoEa/ruMrXJXjZxUbbrsTI2Wm5EoejGHLsE2QxaO2zPv8zAmgtAZMaCB9de
	gVNPsiEtjMuETntJebLaBh+kPnexgIb5E1b1TRjXe/JN/4Gf3sflx9pgUYMd8v+5oEZR1imPHYO
	b8Q+nPfVSoAfcAO7uWHPtSrqnFLa8VqioNm7EMfhJyyOMKjqHDnl93H0N1D5Xpb+72DTgHc/41J
	0i801Zr6YYJmz8yH4P/6kABKZG7SQKwEmO4FYqhl9S7YQ715qQNrvyzvuRaSZOlfBa5PXHQLScJ
	6hMgKn1Wl55qEY9ddeaS+IbuWuXmaXECIGr0feketYq9NaR9YSKC4qpSVZl5YDPXcZN015Y+CQA
	FZ7KCsVklAOq7UTd3MhLxwZveILPa/iV7QMusLxxL1EJMho7mkW0Gpio41sT9i9RItpv5w29ZLX
	YmANpeIEMZpdJm5umAVuNT1VMCYawSKhKq6h
X-Received: by 2002:a05:600c:8b54:b0:4a1:fa21:fd90 with SMTP id 5b1f17b1804b1-4ac16bc547dmr205930655e9.9.1793579662262;
        Sun, 01 Nov 2026 16:34:22 -0800 (PST)
Received: from sasha-User.lan ([185.159.163.49])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b728f9sm16739755f8f.10.2026.11.01.16.34.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 16:34:20 -0800 (PST)
From: Asdlerto Korry <korryasdlerto@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Asdlerto Korry <korryasdlerto@gmail.com>
Subject: [PATCH] soc: qcom: pmic_glink_altmode: Fix printing of a fwnode with %pOFn
Date: Mon,  2 Nov 2026 02:33:24 +0200
Message-Id: <20261102003324.340577-1-korryasdlerto@gmail.com>
X-Mailer: git-send-email 2.25.1
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

pmic_glink_altmode_probe() walks the child nodes with
device_for_each_child_node(), which yields a struct fwnode_handle, but
prints it with %pOFn, which expects a struct device_node. vsprintf then
treats the fwnode_handle as a device_node and passes &dn->fwnode to
fwnode_get_name(), i.e. a pointer into the middle of the handle, and
calls through a garbage fwnode->ops. The error path ("missing reg
property") therefore oopses instead of printing the message:

  lr : fwnode_get_name+0x34/0x50
  ...
  device_node_string
  pointer
  vsnprintf
  ...
  pmic_glink_altmode_probe

It was hit on a Samsung Galaxy M52 5G (SM7325) whose vendor device tree
has an extra "qcom,pmic-glink" compatible node without a reg property.

Use %pfwP, the specifier for the name of a fwnode.

Fixes: 080b4e24852b ("soc: qcom: pmic_glink: Introduce altmode support")
Signed-off-by: Asdlerto Korry <korryasdlerto@gmail.com>
---
 drivers/soc/qcom/pmic_glink_altmode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/pmic_glink_altmode.c b/drivers/soc/qcom/pmic_glink_altmode.c
index 465e5d2316a0..6f3737b096cf 100644
--- a/drivers/soc/qcom/pmic_glink_altmode.c
+++ b/drivers/soc/qcom/pmic_glink_altmode.c
@@ -596,7 +596,7 @@ static int pmic_glink_altmode_probe(struct auxiliary_device *adev,
 	device_for_each_child_node(dev, fwnode) {
 		ret = fwnode_property_read_u32(fwnode, "reg", &port);
 		if (ret < 0) {
-			dev_err(dev, "missing reg property of %pOFn\n", fwnode);
+			dev_err(dev, "missing reg property of %pfwP\n", fwnode);
 			fwnode_handle_put(fwnode);
 			return ret;
 		}
-- 
2.25.1

