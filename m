Received: from mta0.migadu.com (out-97.mta0.migadu.com [91.218.175.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DB3243CE56
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 07:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792135955; cv=none; b=bAXnvB9qqPXiVU0c8rBnfN3rk8T2kimu95Kzx+xi5i1uG6mkPOA2vvzOt/zghDnx9a3LuLWN8Fk19jAz7RDJBeVrh17XhNevdRDO30KIiLGLi4ZiqLpovjf+SWYXCQPVS4aOMHQwKIlE0fQjx1P7wVKsdNS/aby8M6eFEvm1d00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792135955; c=relaxed/simple;
	bh=ax8mYEcyGBEatxsgbOEhQQNyrXq7UJvv30A7+qt8/ds=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DuMzdbaA7DugHTDQ8SaoH0pAXr7p7Tf4YngFDE3/m99VUGh9dRKgGxQuwwI/EHUeHzpwL+jjqU+4YqeFyDNlldIg0wuNsIRdOBzFgwxISvYuRwaHMMkdr5vcS+b9gdua0eKlq8WZRnePA7pYoTESXnXoE+t0BaLT9Qj8JaNrpIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=doVN9Upk; arc=none smtp.client-ip=91.218.175.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="doVN9Upk"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=ax8mYEcyGBEatxsgbOEhQQNyrXq7UJvv30A7+qt8/ds=;
 c=simple/simple; d=packett.cool;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792135952; v=1; x=1792740752;
 b=doVN9Upk+sLwAfcx7OGC6e4zZ4Mylj8Hjrpdhq5CDBj+yOoD3dz2oRI/3D+B7NaaJPWE+/Qm
 NsbmbIJVqtU6+243wrSKTfvu0gG1+9KKP2QskmGKblwSEkrnL8jZ39M5SywWwYD15m6EyJnypoA
 4Qf9VhfklkZe1B7qvLo+Oz2DxgpzPj2Bh+i2uAlU7jcIMdWV/x6OzxYf8F5HPmZEGxudOvxVAw1
 KdIlfcNfYkmLAk3m5A2LZYejKl6vsNsD3yp3tBYOfJPGQefRh2kHwy+7/uenGT2fl3vIFtyJfWj
 pQeO8zCqVVtOqELeDTY/qKJeBg3KMhELgSDORhMc90J3A==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id eab751fbddc727e5;
	Fri, 16 Oct 2026 07:32:31 +0000
X-Mizu-Trace-ID: eab751fbddc727e5
X-Migadu-Flow: FLOW_OUT
From: Val Packett <val@packett.cool>
To: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Val Packett <val@packett.cool>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
	~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: [PATCH 3/5] ASoC: dt-bindings: qcom,sm8250: Add Motorola Edge 30 sound card
Date: Fri, 16 Oct 2026 04:31:51 -0300
Message-ID: <20261016073157.611956-4-val@packett.cool>
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

Document the bindings for the sound card on motorola-dubai which uses the
Elite DSP architecture.

Signed-off-by: Val Packett <val@packett.cool>
---
 Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
index fc7bccdace0f..c76c9c670bc1 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
@@ -36,6 +36,7 @@ properties:
           - ayaneo,pocket-s2-sndcard
           - fairphone,fp4-sndcard
           - fairphone,fp5-sndcard
+          - motorola,dubai-sndcard
           - qcom,apq8096-sndcard
           - qcom,glymur-sndcard
           - qcom,qcm6490-idp-sndcard
-- 
2.55.0

