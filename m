Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792915376;
	b=bR+iNuy2MJlWIvXNC6+mThP62RNiIGV9ga0s/SXhciM29SrJja/8VUGrSNfevbTbxq65
	 p7SslC5hblZkB6BObam+LiJ8ZTnePSDzp7ZqzWqZB/36v906bqAEh9YefbnzYFvXgj8yg
	 MKKg0DblMAohaPe8mF/UaH0CRG9XMEtTqDtEewNi3EBz5SbJT455gfyNmJfe3KPSPltb1
	 7SFu35nT6v8wdqN2WCe/JDTKaijEJQKgpNFlYsgDnC+j/Kv9b7J6wpY1APyYlK/lEyh+B
	 7j44qFpfoFuYzpoBAO9s9CgnXYJgzcmHkP6McM2MoSLe3rxp092oo2uwKEL24T8SY7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792915376;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=YCDQtyXn4w3ROCOVAaWp8jYTLktYutA5FKWJ6B4H9Go=;
	b=H7104AadTByXmTkukbW2THDSX7uWG5UHUM/DTr7lRAmeG/dS7OIj+zf+o1N6jwi0zmuE
	 mulPY46uvwAFPNnbvLqWNK396nuTzgf+6CVRr+qVezhVD4mNlAXLP/ZfpVFOJtDIUByPM
	 tSuRrZ3Qovv5jOX6XS+BgG4gZVS1zlaF44zgFh5YufEACP7ohhI7ScpNlAg2SNnxkT2zw
	 NAx/tnb+dK4VShIjL0d+tQ66/ZNC8L7UvrtSzLhAZgBiNpzCbbfDAjAvswW07Etpy+Zpd
	 EraUMSwu0tLPUqvOVv+oU56nbKt+jxv35hp7gAGJCQ9LwWKhEqgR6escwZpPNUubPJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=jzsgnBSB;
	arc=none smtp.remote-ip=111.22.67.151
Received: from cmccmta8.chinamobile.com (cmccmta8.chinamobile.com [111.22.67.151])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E749A606A31A;
	Sun, 25 Oct 2026 08:02:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E749A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=jzsgnBSB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=jzsgnBSBzN46Wqm8g9HsYXpP9zTNykE3jEzAsS9v2LVxsTaz/TsyOL/l5qWFhV3DrSRw0v31U/XAa
	 3K7Y6B/jKKQ5IcadYUlfdT8zBKOvgtF1Dsdw2s6CYLthk7b79KrKxyEqkaWXujlyP1AAOPxgB1MZvw
	 ZrnaLKNDWDc/kOlo=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app02-12002 (RichMail) with SMTP id 2ee26addb79f6fd-7f897;
	Sun, 25 Oct 2026 16:02:45 +0800 (CST)
X-RM-TRANSID:2ee26addb79f6fd-7f897
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from FHA-W6400298 (unknown[36.137.216.17])
	by rmsmtp-syy-appsvr06-12006 (RichMail) with SMTP id 2ee66addb7a2da2-81a89;
	Sun, 25 Oct 2026 16:02:44 +0800 (CST)
X-RM-TRANSID:2ee66addb7a2da2-81a89
From: Tang Bin <tangbin@cmss.chinamobile.com>
To: srini@kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tangbin@cmss.chinamobile.com
Subject: [PATCH] ASoC: qdsp6: q6routing: Fix memory leak on probe failure
Date: Sun, 25 Oct 2026 16:02:42 +0800
Message-ID: <20261025080242.2572-1-tangbin@cmss.chinamobile.com>
X-Mailer: git-send-email 2.52.0.windows.1
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

routing_data is allocated with kzalloc() (not devm_kzalloc) and stored
in a global static pointer. If devm_snd_soc_register_component() fails,
the probe function returns the error directly without freeing
routing_data. Since the remove callback is not invoked on probe failure,
the allocated memory is leaked.

On a probe retry, a new routing_data would be allocated, overwriting
the global pointer and losing the reference to the previous allocation.

Fix this by checking the return value of
devm_snd_soc_register_component() and freeing routing_data on failure.

Fixes: e3a33673e845 ("ASoC: qdsp6: q6routing: Add q6routing driver")
Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>
---
 sound/soc/qcom/qdsp6/q6routing.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/sound/soc/qcom/qdsp6/q6routing.c b/sound/soc/qcom/qdsp6/q6routing.c
index d076c99f1..fb633efd8 100644
--- a/sound/soc/qcom/qdsp6/q6routing.c
+++ b/sound/soc/qcom/qdsp6/q6routing.c
@@ -1208,6 +1208,7 @@ static const struct snd_soc_component_driver msm_soc_routing_component = {
 static int q6pcm_routing_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
+	int ret;
 
 	routing_data = kzalloc_obj(*routing_data);
 	if (!routing_data)
@@ -1218,8 +1219,13 @@ static int q6pcm_routing_probe(struct platform_device *pdev)
 	mutex_init(&routing_data->lock);
 	dev_set_drvdata(dev, routing_data);
 
-	return devm_snd_soc_register_component(dev, &msm_soc_routing_component,
+	ret = devm_snd_soc_register_component(dev, &msm_soc_routing_component,
 					  NULL, 0);
+	if (ret) {
+		kfree(routing_data);
+		routing_data = NULL;
+	}
+	return ret;
 }
 
 static void q6pcm_routing_remove(struct platform_device *pdev)
-- 
2.52.0.windows.1



