Received: from mail-m32111.qiye.163.com (mail-m32111.qiye.163.com [220.197.32.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C1FF3C062F;
	Fri,  4 Sep 2026 10:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788517110; cv=none; b=Muhyxo13j+lk+GK6SKr1+nYit0RbzAIC7awxwyzpUb4292+WHSxjL8MmgsA+MpixZ+SdwLIONXZgVm418KW5q7vUQrFeCf1mnNK4okzo/K6ouYTdpHLQzRMDXhzfE6qZXFZwTTBAPmABXQHPEUDGouBsqjCrU6S2nW+9FHWoe5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788517110; c=relaxed/simple;
	bh=gDmAcN+5QP7ho2GcSrntOpFVXi+9Ked5dTnCchsTnFM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FHQzw+eKbCSB0oG2f5ocZWm/sZ539p8h+EzlxgG8lMy3OzXGvt2n2rF5pbgFq1xUT//zeT6IQmlrXmZFp5kXMbqeN1bR/AQooxZhoFnNzKRqpS40YOz5jjfYHu3xv3UkTyknAan2KRB+uvTlm6nT4PheB8uRBwspRoCPtVDqbsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com; spf=pass smtp.mailfrom=thundersoft.com; dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b=QEfVAxRC; arc=none smtp.client-ip=220.197.32.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b="QEfVAxRC"
Received: from [127.0.1.1] (unknown [36.129.139.90])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4c8f646cb;
	Fri, 4 Sep 2026 18:02:54 +0800 (GMT+08:00)
From: Hongyang Zhao <hongyang.zhao@thundersoft.com>
Date: Fri, 04 Sep 2026 18:02:26 +0800
Subject: [PATCH v3 2/6] ASoC: dt-bindings: qcom,sm8250: Add RubikPi 3 sound
 card
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-rubikpi-next-20260605-v3-2-f49146d85af3@thundersoft.com>
References: <20260904-rubikpi-next-20260605-v3-0-f49146d85af3@thundersoft.com>
In-Reply-To: <20260904-rubikpi-next-20260605-v3-0-f49146d85af3@thundersoft.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Daniel Drake <drake@endlessm.com>, 
 Katsuhiro Suzuki <katsuhiro@katsuster.net>, 
 Matteo Martelli <matteomartelli3@gmail.com>, 
 Binbin Zhou <zhoubinbin@loongson.cn>, 
 Srinivas Kandagatla <srini@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>, 
 Roger Shimizu <rosh@debian.org>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, Hongyang Zhao <hongyang.zhao@thundersoft.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788516170; l=1261;
 i=hongyang.zhao@thundersoft.com; s=20260127; h=from:subject:message-id;
 bh=gDmAcN+5QP7ho2GcSrntOpFVXi+9Ked5dTnCchsTnFM=;
 b=ic2UOxxmcYks/1trRTgX471naGiax7jeNr4BaKKuTFnwpsYM7ebCJR+ZS35Ki95VJcR7kVZg8
 QBenRasjwIbC7/XTvQlYdo/54Wq+yirPo7cz7HHf+J2I4bfqh3u1kv9
X-Developer-Key: i=hongyang.zhao@thundersoft.com; a=ed25519;
 pk=D9yL5W9Zj0lPBDAq9gzY++1849VlXuTWAkROzZ88J/4=
X-HM-Tid: 0aa06bdf0bf909d5kunm6f63729aafb62
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaSU5PVkoaQxpLTBpNGEIYGlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlITVVKSUJVSkhCVUJLWVdZFhoPEhUdFFlBWU9LSFVKS0
	lCQ0NMVUpLS1VLWQY+
DKIM-Signature: a=rsa-sha256;
	b=QEfVAxRCQajtt81f7CgjycHR/JjhSJZ/15MChhHAwjHU6sTT4hbQbBsEb5pu/SxRcSHnldj8799pQZigHPS+pqC0eBXPv75O/NEpKXVTzoX+59+8RReaZLxxhpJPX4eRHkIiIARsOkn6KgIDqkt0YiztvD3rvCHITEX0Ai3M+3A=; s=default; c=relaxed/relaxed; d=thundersoft.com; v=1;
	bh=P6N15QBduQsHpT0mxLoWN9dWs6OuCxQrQWIy0/z8LCc=;
	h=date:mime-version:subject:message-id:from;

The QCS6490-based Thundercomm RubikPi 3 routes primary MI2S to an
external ES8316 headset codec and quaternary MI2S to the LT9611 HDMI
bridge. This requires board-specific DAI clocking and jack setup in the
sc8280xp machine driver.

The existing QCM6490 and QCS6490 compatibles select machine data for
boards using different codec and audio routing arrangements, so they
cannot be used as compatible fallbacks for RubikPi 3.

Add a dedicated compatible to select the RubikPi 3 machine data.

Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
---
 Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
index 1536fcd96d68..fc7bccdace0f 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
@@ -54,6 +54,7 @@ properties:
           - qcom,sm8250-sndcard
           - qcom,sm8450-sndcard
           - qcom,x1e80100-sndcard
+          - thundercomm,qcs6490-rubikpi3-sndcard
 
   audio-routing:
     $ref: /schemas/types.yaml#/definitions/non-unique-string-array

-- 
2.43.0

