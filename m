Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794774012;
	b=HoQJe4SxVnCo8a3+jNUPDQoy0pQajr0heegxxjD1yNtEsOiUz2aV2AETb2KC5rJU5UxR
	 AGFHXPnimN8X9plH2Q80UacybMBeor2Oiii07vv4LGpIA0CpEIjyusPZ66VXiIOG2u4Lh
	 2rh3/Fa5hCbUuYNgU11fYh5P+A7AKn1Rg5Z3FLJcF6aBOcpM2e0ct+4jWnqW1zlfXjY/k
	 5TorJyaSZyOVNrpxhKMxtTC9QgA8rEnPKyNQ9rU9GZA8nExPqoerOCWEAxwPADJ6yTvyY
	 Rzr8ZC4RwgrVtM5EQuZwtX52BbQH9BY3+Dka+IvdVxUlcbVxjHJsEqWkWA5EQ9S3U1A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794774012;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=YV1Vb/QrI+WsAlK0Ukq6IEU33Gcpls9SSuSizML+vGM=;
	b=zr1MtAZxo0XPsx+CwH1ELlwc8/wm6gFlIewO7ct2cLhZH9T32lbBncEfNPbPR8kEM8Cr
	 1RjIpU2ySp8QYlv0bflX/3sm0mx3L7nHeJNBHXsanGM3xmmi/LQG+gpEtArWk3rGI8x5s
	 rQSAmBjsPyFn0zFesS4tSun4g3Em80s+G2qj+3WuoTq91XHHmp8duzaQOf5DKa1XmGfBY
	 c2ddfR9ZT522H/lEdzWaH7Q0FXe4SQtifyx0FZAFW9R2NqOOVFUEGa+QgljhlPvjHC7Ks
	 FB+sJW5QVf5d1eE3mYSHSt5N8cBGd63a4EEhUaR5KLPCl8KgIIU06AP3OGwe5YItlVQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eNecE69L;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 839F0606A893;
	Sun, 15 Nov 2026 20:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eNecE69L
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794774012;
	b=lXRdnvPdcNtk8V+OfuBjbJvpto+fFQoo/U62LAoEcMFm7E102a0JT7RR428sB7OA0Bni
	 VEzIMU0W4aHUumK4I+1Dqtpti1DYggpIfi6I3UDuV7/UorNUJf8FKUjviInm9X2A0ZLMK
	 ByYwPje/wJzJZ6ZXueL+4Iv0//rw/8SKPfD6+r+50lFWbdhGvTXERLYXVwQQl8P4RJAqS
	 0gOvNpzH1dLO9VTjxDly72g7XFhKD2vVOEFgv6vhk8LUrFLsu6MNkRRDaRXBNv2/e60RU
	 RuOhWGXS3SYZsAZig95RuCQa8RE7CvQE/LzINWdUR+tiDefXsAOCpz9XHfsHLJwq57g==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794774012;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=YV1Vb/QrI+WsAlK0Ukq6IEU33Gcpls9SSuSizML+vGM=;
	b=n90NUCotoLz6L5xg8q9pSKN9WZprPDOeNp7e262hKRCukJINGJsDj1pF1lkJ4fHcfq42
	 AE1Vp3wIMCJv/tdELWV+cOp69OZau9VWbxUdjwjquDsNR5plrxEhdrI8gNH2H2WaEfLS5
	 LB5XMHYj/IMCa3lZWVUf4cPr/17IFWPjvio6Vl16dOzhByOSf//T3SCWLNsANW/5eoPh5
	 cZLFyAbJYqXjCimtBFxsuHvmWzuTUspoLwd9THWnVFMgiiCXU8FfIt+nBeHW2IYQsGmdZ
	 4pI0myWtIlIVP1w21BgGyvlsWz+Q+K2uaz8vNRBCPhobVPe/7kwskmSklXsmSFZHysQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DAAAF1F000C7;
	Sun, 15 Nov 2026 20:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794774012;
	bh=YV1Vb/QrI+WsAlK0Ukq6IEU33Gcpls9SSuSizML+vGM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=eNecE69L5gK2A66SR7AZ/YWpStPxNCbQwLXn51HATgsuCiLRPC4WvtUS41K4QLTiL
	 SHLUlIsgzNqwiGNqGvukJ7Au0tW5R014JkujZe05eb9ARUgawq+T3AFsqyNetI6YnH
	 I6zdRjNa0Xiyrj9L3W25SvRWYsT3XX53yudPQsH5Y0FpWPTX2wrm10Dxlw47G9mgz2
	 kM3XUwDopdQwZGvC/PTRpADjGjsbWk3frI8qdsFCAUOHn44LvLVo3IJkGXx6rKXXva
	 jxG6nTbTO7gXG38WcLVzIqCZXT2qpSAe0uTi3Pnx2/VdM5NWR1+cC8/VYQoyPmjPrb
	 9Q+2lM0sSmkiQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 6A64C4A1AF;
	Sun, 15 Nov 2026 20:20:10 +0000 (UTC)
From: Venkat Yadlapati via B4 Relay <devnull+venkat.yadlapati.yahoo.com@kernel.org>
Date: Mon, 16 Nov 2026 01:50:11 +0530
Subject: [PATCH 03/11] dt-bindings: interrupt-controller: qcom,pdc:
 Document Molokai PDC
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
Message-Id: <20261116-molokai-soc-v1-3-3b2ee920fa3b@yahoo.com>
References: <20261116-molokai-soc-v1-0-3b2ee920fa3b@yahoo.com>
In-Reply-To: <20261116-molokai-soc-v1-0-3b2ee920fa3b@yahoo.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Venkat Yadlapati <venkat.yadlapati@yahoo.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794774008; l=975;
 i=venkat.yadlapati@yahoo.com; s=20261023; h=from:subject:message-id;
 bh=2rM2a07KettEnBDPFJkhzal2auInLk4NfhtDv/jw5h8=;
 b=0RtjCb3Vx9v5cZy+EL1heR0mW2Zwta8PfBSbMe3cX4R5rkd3W0EO1LB3WMs/99WeE+GvGfqH3
 wOarWl8Nu47DMFrO77loyGQPe5QYVjIkCVJ68DI37Nc0C2sJC0SqbCK
X-Developer-Key: i=venkat.yadlapati@yahoo.com; a=ed25519;
 pk=e8KStCtEMvUP1Se/riB/KVnDAQFEVR2Dw2PcuA8/eME=
X-Endpoint-Received: by B4 Relay for venkat.yadlapati@yahoo.com/20261023
 with auth_id=1303
X-Original-From: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
Reply-To: venkat.yadlapati@yahoo.com
Content-Transfer-Encoding: 7bit

From: Venkat Yadlapati <venkat.yadlapati@yahoo.com>

Document the Power Domain Controller of the Qualcomm Molokai (SM8845) SoC,
which maps one more range of interrupts than the Kaanapali one.

An LLM was used to help write this commit message.

Signed-off-by: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
---
 Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
index 8401d3b48e0f..64de63b7a031 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
@@ -33,6 +33,7 @@ properties:
           - qcom,kuno-pdc
           - qcom,maili-pdc
           - qcom,milos-pdc
+          - qcom,molokai-pdc
           - qcom,nord-pdc
           - qcom,qcs615-pdc
           - qcom,qcs8300-pdc

-- 
2.56.0


