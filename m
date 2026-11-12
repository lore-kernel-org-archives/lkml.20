Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794458197;
	b=Lm5YN/Br8npKC5HN/o6fyENCAK+IzmG/yGKZrHy0uruar6yJ8vReqtCDFQYfN9wohlVl
	 I+pmTU5Z5IUsiX7D43lHO7858ghEQPg5jhIMWeTK+Q1Agk55wgtrxQiflLT/f+eT7zufT
	 KD+3qHL1xW5UqB4JhYMpmQMpnrJu2ilbiVZSK2b6NWn3NcMqME+Ni9McWP1bEeyUZcFou
	 qpNkZ0wh0PH0UZyBQ8utzy8a75Wao9b2+LPfV2anGfk4A06AXupaIE6GJTt1+f6/8bS/8
	 d1Q+jd78a39mVtyQmGcBek41MSXS1NPNE/uzpcdkMKyCJ0mSPY6ViKDaWj/uwwuAg9g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794458197;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=d0ee55NVmB4wkp8GqkvjrVAOKus4qL3ReFL8IStXY8o=;
	b=Uy5i9EhWYYD0i9GC5mtoAGz9uMkk7nY4rZPLKhAt6XxaAKi9/E4MtQCZKsuJ4e8sLMLs
	 kJbYSzkETXx+/7M/J9Nlg3d0uw9Mby0dOiekKVw8BYFurYe7AXb+ONwATaRAVh3s8Fw2z
	 hlJEyguSRCVn9alevDSG8Kv/Ya7Rx0wGjodzP2rRGHsuVN9j1fCYnil6Igi3Wcvlvjkp6
	 vpqdAI8UhRC72OULIJKivoGvr8aAo+dl3Z/pVEBuzpAoHwqdgPe0ICGhJomZc9o+9kHbd
	 9mWEB45H+4AWPP6vSF3e1PrygiBsJkCZb7CehVGxf1QkXvHW2obgJsPtuT+rMas8aDg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M7hVRTEk;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E31B1606A897;
	Thu, 12 Nov 2026 04:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M7hVRTEk
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794458196;
	b=cmTD/+e/A7CBczZJeE6uFhL7yydNUyhXNinovDqPTKRi8qZqiPJvvR+iuYuwY2VaTHE/
	 sX9hRlc+BugECpTvAWtzixK6AxQxY5GPXp//GmF/XS/qEBHwT4vW2SUuem1XNrt3pQwkF
	 VRFyDEkvskAg7yCc1wIobVUD9BQK7f/akdh8PrjcdMGGbxJdXWpoKuL6q7B1/UcCWpWB6
	 9vDWZWlvXFQnQ6hMTjT8i89w8odVu5xshr8BR4ujk2ICnwusbqL2tWHUmPF0AtOWGFloR
	 LpN/rJHBs7ROj9zWqeZtSKY/MmM/VQdR2GMzg+M7YQfdktsTHUa/K2IL7WMoEWgFduQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794458196;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=d0ee55NVmB4wkp8GqkvjrVAOKus4qL3ReFL8IStXY8o=;
	b=LuFbotflVuKqMPAH+4eBrLj1bFq3pvPfbNYAF+PVuUmWs71K4sb/ZSmpzwepewW5HsfD
	 pVVo61MKzf/BICDInx5nrQxqjf4rnXV5b7RZhCtUWKHqbOpfO1LHF260iZJeERfulR5g9
	 INJaCN4l9kOwYKp7nefRy7nKMnBHKaDI8KdKQ8bMs9Y155tExfu8C28vFM9nkhSVShGIH
	 94QspsWplSPQHSVl6snJyxLzOSwtg4FrqVqkKBdL3Ctb2qNWE+K5eaYIopftg0OtAOm3u
	 zAccubwqYADzRvj+sUFfvji3aX29ERZ9HWTiEv7nqohDt4Q2FAn9js0ZdZf+cY6z72g==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6DDBF1F00A08;
	Thu, 12 Nov 2026 04:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794458196;
	bh=d0ee55NVmB4wkp8GqkvjrVAOKus4qL3ReFL8IStXY8o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=M7hVRTEk6Sid0NWVgF2naAewNzWe9cxk55q6pDbdzmTbR/4UefhddbQjbvvhiRq2H
	 dfwVKD79Jo2/NeFNF/rb8i6WPPLqXyPlAbFsYfciiPz8y9ZmndLmaGbgejd0X5Q8L8
	 IIH0hFXK+gZgVjKBFPFQpNViNe0/1KHv3N9pngacAmvaX/hTt6SlLS5W8rVe+HVA+z
	 URRboZ63hNQOQKpOdh6nK+hQx8ao+Wz1SyLj/qw75P4pevOV4nkDq1i+ovGVZaTV71
	 p0mC7gpgF0W4EF40nr2LD2hY9dxFkOCCcuGi1sTnGX03Uth009Sg9sIP3p9AuaCd8o
	 P++ScMp8BBwdQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id F25CB4929C;
	Thu, 12 Nov 2026 04:36:33 +0000 (UTC)
From: Ishu Brar via B4 Relay <devnull+patches.brar.si@kernel.org>
Date: Thu, 12 Nov 2026 10:06:29 +0530
Subject: [PATCH v2 1/6] dt-bindings: display/msm: dsi-controller-main: Add
 SM7250
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
Message-Id: <20261112-dpu-sm7250-v2-1-8e925a3a8a7d@brar.si>
References: <20261112-dpu-sm7250-v2-0-8e925a3a8a7d@brar.si>
In-Reply-To: <20261112-dpu-sm7250-v2-0-8e925a3a8a7d@brar.si>
To: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, Ishu Brar <patches@brar.si>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794458192; l=1541;
 i=patches@brar.si; h=from:subject:message-id;
 bh=vZLUcoevInvSs4EvlJ6xECEz5Duh8PMGv9TOdJ9WEoQ=;
 b=b1ZAK2YbTLicS3bJpWLAnirFVI5+3thf6w0TmH42RzbHv5sC31MLAoVQiU5qP/+2Z5dH1l72a
 IFqND6gvZiGD/1hdu8K7JPdFdhK9mynbzZ6D52g3Zs+pbb4mHta0ZQF
X-Developer-Key: i=patches@brar.si; a=ed25519;
 pk=Ds+E23E3ntzjPzuBDyVRkOouclcNI5k75R+N42yJtCk=
X-Endpoint-Received: by B4 Relay for patches@brar.si/default with
 auth_id=1189
X-Original-From: Ishu Brar <patches@brar.si>
Reply-To: patches@brar.si
Content-Transfer-Encoding: 7bit

From: Ishu Brar <patches@brar.si>

The SM7250 DSI controller is the same 6.x hardware as the SM8250 one,
with the same six clocks, so add its compatible next to its SM7150 and
SM8250 siblings in both the compatible list and the six-clock if/then
block. No driver change is needed, the controller is matched through the
generic qcom,mdss-dsi-ctrl fallback.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Ishu Brar <patches@brar.si>
---
 Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index e4fd1cbbd4e0..d447d7cc1a1e 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -39,6 +39,7 @@ properties:
               - qcom,sm6350-dsi-ctrl
               - qcom,sm6375-dsi-ctrl
               - qcom,sm7150-dsi-ctrl
+              - qcom,sm7250-dsi-ctrl
               - qcom,sm8150-dsi-ctrl
               - qcom,sm8250-dsi-ctrl
               - qcom,sm8350-dsi-ctrl
@@ -358,6 +359,7 @@ allOf:
               - qcom,sm6375-dsi-ctrl
               - qcom,sm6150-dsi-ctrl
               - qcom,sm7150-dsi-ctrl
+              - qcom,sm7250-dsi-ctrl
               - qcom,sm8150-dsi-ctrl
               - qcom,sm8250-dsi-ctrl
               - qcom,sm8350-dsi-ctrl

-- 
2.56.1


