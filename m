Received: from mta0.migadu.com (out-106.mta0.migadu.com [91.218.175.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A2CB37DE9B
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 07:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792135962; cv=none; b=QmN2Kd6EUKDFqXrUpNwQ+SbafBoK7Qqf449Z6F776Vc0qLpl2yiYOzZ9nkHL8dVhkYPBff18OYpZc9PF2yE6HlFmjqK1cA7EYruF6sYwD1vExRcnHP5lGmEhbJWxBjpAMNHg0VQuZKvgmJvj2JaTcv5KrrUvRYjJhCb9cLR03jQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792135962; c=relaxed/simple;
	bh=+nU5/8RgiTGOWC6vO2b1821wiTATXqeosmxe4CwjTUM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YTXx6uoXt/Qz1vfT9icLLe1DYffgiFrUwtcyljat9QvX5RgZFihrnUue9XWZCrUyqY1YUzof1Wskv7LRj29+222CQ5FhQFFK0vNAM9aJunQUTikxcOYtYO2snxs74PZnVSqMdKX9gCsnoxkyzRHrqI8bRIssELPBuXKOXLoAqKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=G+0dyq6z; arc=none smtp.client-ip=91.218.175.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="G+0dyq6z"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=+nU5/8RgiTGOWC6vO2b1821wiTATXqeosmxe4CwjTUM=;
 c=simple/simple; d=packett.cool;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792135959; v=1; x=1792740759;
 b=G+0dyq6zd6RFOCb/rfELb9R2m65A3JTIsyu4NuI8gw8ujzSVGm3aHJ8h8ZllfkO529N3rTqz
 9JeWZmIgVp7O2Sb1Ukl54ExW9J69lupNKx53l0tgykShQ2R1iYFRL5vtCm5wckcEJcgXAnp8AS7
 8UOQjPn5jH7hCc7XyLLGc2ZBapaY7aQ8YNewq6N1oarm6lCbqn2SKrsh36AVG6Bwy0MyKE+EfVD
 6m5EQcf/T9m1srFIxDwOiYmb1WaD/t/EAAcPpJl+sBFPmb1Cj9Riqpfo6AY1CelKS7I9A9xXf3c
 taaZI1AcIpnGUD1DV1TAhF5U2bkpCl85gXg7fD/IiNdfQ==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 70dc0017cd89afea;
	Fri, 16 Oct 2026 07:32:38 +0000
X-Mizu-Trace-ID: 70dc0017cd89afea
X-Migadu-Flow: FLOW_OUT
From: Val Packett <val@packett.cool>
To: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Val Packett <val@packett.cool>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
	Conor Dooley <conor+dt@kernel.org>,
	~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: [PATCH 4/5] ASoC: qcom: sm8250: Add motorola-dubai soundcard compatible
Date: Fri, 16 Oct 2026 04:31:52 -0300
Message-ID: <20261016073157.611956-5-val@packett.cool>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261016073157.611956-1-val@packett.cool>
References: <20261016073157.611956-1-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a compatible for the SM7325-based Motorola Edge 30 which can use this
machine driver.

Signed-off-by: Val Packett <val@packett.cool>
---
 sound/soc/qcom/sm8250.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
index 2d49b04cb1f6..5866f1f34b3d 100644
--- a/sound/soc/qcom/sm8250.c
+++ b/sound/soc/qcom/sm8250.c
@@ -215,6 +215,7 @@ static int sm8250_platform_probe(struct platform_device *pdev)
 static const struct of_device_id snd_sm8250_dt_match[] = {
 	{ .compatible = "fairphone,fp4-sndcard", .data = "sm7225" },
 	{ .compatible = "fairphone,fp5-sndcard", .data = "qcm6490" },
+	{ .compatible = "motorola,dubai-sndcard", .data = "sm7325" },
 	{ .compatible = "qcom,qrb2210-sndcard", .data = "qcm2290" },
 	{ .compatible = "qcom,qrb4210-rb2-sndcard", .data = "sm4250" },
 	{ .compatible = "qcom,qrb5165-rb5-sndcard", .data = "sm8250" },
-- 
2.55.0

