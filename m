Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793152666;
	b=IFZofuvyys8zTvjk6e/DuDWRvaakfkB7PckJLKMqCJW1WZMsOZ2J3lIedrvNl5uTiOiM
	 8FgrklfCzU3QODUi93RiQVNYXVLQ4XU670zHIvFen4AffyUKSW79DAwps7Fz1PRUX9q2L
	 Yf06u9sgHRCANX4uPEzMiCWIT0kia6TCqfiIEFLvlPVIanapEr58vtbphnofZDpRssTba
	 d16Tvr14Xq51dP6cPDE5QnLOPyJAoYFc31OnYhZGJi0AIzlaVXwfm2et2ylan7LnHb094
	 4iH3PlMijKQU0xBwLlVg6r1gInJGp1Z9++Ya2wMzT8T432kIRN42tXhPOWAGqdzhdMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793152666;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6o7SwbFD+3bJMNkyYaXBqBSgGd0PRrCJLtt0HA3UA2c=;
	b=i0JoiAcQOmPYylHTKahAyFx+Y/9obRc42bbt0Ai8Wupt59loMetth5RWkLJA+fM876J/
	 Gju/O/Cf4OSLbr/4i/Udw7ROnUysf86IIkxN9XjWqQg+uG99OpKiSIUlxIgw9TMdQiEmN
	 VbuoY8CtmKVV/Gtlq6GS2ZKbdZ33MaBUQo3P8XkONxHrR0NZASsVUy0aQrXis+ugsTXbv
	 6eK7Y1gE4s1sA+ySGS0lozl7120/rO7js56kVTTkM7XY3ez5crd1z3Y6ebqWcgKcitPFI
	 UeZjyLtft9ZGQ11PJNRo5bi6vM2+o0iSLCEnFqnojPJXxga/SVmJ0XTVUJAZ9zre3HQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=wV1mF9RX;
	arc=none smtp.remote-ip=111.22.67.139
Received: from cmccmta6.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C406B606A31A;
	Wed, 28 Oct 2026 01:57:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C406B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=wV1mF9RX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=wV1mF9RXJf24IFQD/AGlX5pYLe+I1FeD+e6kX2W+2ftkrDhSC+bFouhvnlonbugxYbIyza8XfPuR+
	 ZlKMoAweQw+v2VRKmnEfG7z9Hqdnq0NwGsmn1LGFU/Ltcht+nwpA4SmvoCMplsrx+Kahxg+Imq1j4l
	 RmvWQCOFWXSANry8=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app09-12009 (RichMail) with SMTP id 2ee96ae1568e9b0-612f8;
	Wed, 28 Oct 2026 09:57:34 +0800 (CST)
X-RM-TRANSID:2ee96ae1568e9b0-612f8
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from FHA-W6400298 (unknown[10.55.1.71])
	by rmsmtp-syy-appsvr09-12009 (RichMail) with SMTP id 2ee96ae1568c813-f1f91;
	Wed, 28 Oct 2026 09:57:34 +0800 (CST)
X-RM-TRANSID:2ee96ae1568c813-f1f91
From: Tang Bin <tangbin@cmss.chinamobile.com>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
	srini@kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tang Bin <tangbin@cmss.chinamobile.com>
Subject: [PATCH v2] ASoC: qdsp6: q6routing: Fix memory leak on probe failure
Date: Wed, 28 Oct 2026 09:57:31 +0800
Message-ID: <20261028015732.1985-1-tangbin@cmss.chinamobile.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <6078ca7f-a511-48d9-b5fb-a7b3339c8569@oss.qualcomm.com>
References: <6078ca7f-a511-48d9-b5fb-a7b3339c8569@oss.qualcomm.com>
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

routing_data is allocated with kzalloc() and stored in a global static
pointer. If devm_snd_soc_register_component() fails, the probe function
returns directly without freeing routing_data. Since the remove callback
is not invoked on probe failure, this leads to a memory leak. On a probe
retry, a new routing_data overwrites the global pointer, permanently
losing the previous allocation.

Fix this by switching to devm_kzalloc_obj() for the allocation. This
ensures the memory is automatically freed by the device core if probe
fails or when the driver is unbound. Consequently, the manual kfree()
in the remove callback is no longer needed and must be removed to avoid
a double-free.

Fixes: e3a33673e845 ("ASoC: qdsp6: q6routing: Add q6routing driver")
Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>
---
Changes in v2:
- Use devm_kzalloc_obj() to let the device core manage the memory
  lifecycle, as suggested by Srinivas Kandagatla. This eliminates the
  need for manual error handling and prevents a double-free in remove.

 sound/soc/qcom/qdsp6/q6routing.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6routing.c b/sound/soc/qcom/qdsp6/q6routing.c
index d076c99f1..4816d4b9a 100644
--- a/sound/soc/qcom/qdsp6/q6routing.c
+++ b/sound/soc/qcom/qdsp6/q6routing.c
@@ -1209,7 +1209,7 @@ static int q6pcm_routing_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 
-	routing_data = kzalloc_obj(*routing_data);
+	routing_data = devm_kzalloc_obj(dev, *routing_data);
 	if (!routing_data)
 		return -ENOMEM;
 
@@ -1224,7 +1224,6 @@ static int q6pcm_routing_probe(struct platform_device *pdev)
 
 static void q6pcm_routing_remove(struct platform_device *pdev)
 {
-	kfree(routing_data);
 	routing_data = NULL;
 }
 
-- 
2.52.0.windows.1



