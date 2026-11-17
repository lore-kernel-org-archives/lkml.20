Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794935457;
	b=iLgEb+tZNzZFtcn5GZLW6+DQJxALe2j4iqO0YAoZ0zzm5p+dX4y4+XtXWTwDnVdAbZ99
	 a30rQM+qzmqgketHkoF84F3b4ta236yPHPZ/K0d+E6/h+wL+0VftmFDdX90LTCvSKIlu5
	 bWcLGP2HNeQwYR39buD1VFW9Zf9i/mD+A0EedD+90Yq1I9FtsA3MG1A6hfj5U8Fy/9ar2
	 d2Do4mrvIDJEWctH1CsYkI4l2E4xPQR645YAzlAYFLwChcdRNICjIi4PrYgk9K5Y7CoZb
	 Izu7YU1Rrto8yjGBKhe/FkAf7b010tBij7mUVKVgvuApZ4a5VWEEZPNAXMfj7e8iaGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794935457;
	h=Received:DKIM-Signature:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer;
	bh=LnGgiIb5RBAPrxYCVZ1BKwNS7NAhakb57AiIT+9PKEA=;
	b=RhwWsHhqV1wHZ3oMlakLleFxHLWHUhHX5HkgIPaJyD6d627ubIuZQywLLGYo4hAW+TAR
	 4uN+N4mWx2tlIZdS0Esj68wgS96naiTrGYNmVQtwHZtVelXFbZxdcsnqYfbF5MlwgRcjq
	 CvfRd+ir7flD4lRYU+LLYl2UvCXkE0wOQM3zxvVNynN7XW2E30rUIay9T3r5khb7YTRrq
	 bnunuX28yJ2wq/ppUcqAhKiUIGptUnWxv+gCA1bwKHXmw8hpHYZSLlODNOVoEEAe2LYFo
	 xy3nbGgkLWdII1u6cb98hYkUmjumJnWw0rAfMGFeOndrr0y1x3cIjTH/Ka65yD2CEPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CSmYH2bo;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D0FC606A330;
	Tue, 17 Nov 2026 17:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CSmYH2bo
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F35C81F000C4;
	Tue, 17 Nov 2026 17:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794935457;
	bh=LnGgiIb5RBAPrxYCVZ1BKwNS7NAhakb57AiIT+9PKEA=;
	h=From:Subject:Date:To:Cc;
	b=CSmYH2boyuINDATOHMv3YCmv+LrhNmnjGcBdo/eE4tFeZCk01fQ0cDrhUa1eZr/sS
	 Y7VLcn6hsLh3+W5q8UXHJTjMb+v3LJ0vO2pQs+sVnKsOYFylMK3Ye7GVbnyzyMQcIv
	 jYEbPwtxWiYveQUIOvuLlDzLI3l+n1m6m626pBKi7HjjfVQuBqgn4FKaYpqrdA9wNB
	 1Zalsw0vVYgMMPr4csKAhc6BQKRXS2UBkYkELT8GBBk1SGqcGglZLIxxMV1+in0fbR
	 L6G05jrGRFA18C/F34U6vj5iV0t07qcjEjlTLMdAdIex2wVjYFCrk83czsJiqclslx
	 t9GCBo96WlAew==
From: "Rob Herring (Arm)" <robh@kernel.org>
Subject: [PATCH v2 0/2] arm64: dts: qcom: Add MSM8996 SAW3 compatible
Date: Tue, 17 Nov 2026 11:10:41 -0600
Message-Id: <20261117-dtbs-qcom-v2-0-c0697a0bf016@kernel.org>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22Nyw6CMBAAf4Xs2Zq2BFFP/ofhQLcL1EerW2w0h
 H+X4tXjJJOZCSKxowjHYgKm5KILfgG9KQCH1vcknF0YtNQ7pZQWdjRRPDHcRdXpspKdREMIi/9
 g6tx7bZ2bH8eXuRCOOZCNwcUx8GedJZW9f92khBTqUO/LWmKNrT1diT3dtoF7aOZ5/gIv0nz8t
 QAAAA==
X-Change-ID: 20261112-dtbs-qcom-5f2350f0cbec
To: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16-dev

'syscon' nodes are required to have specific compatibles, but the 
MSM8996 SAW3 nodes are lacking one. This series adds one.

The binding should be applied with the dts changes to avoid new 
warnings.

Rob

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
Changes in v2:
- Change compatible to "qcom,msm8996-saw3-cbf"
- Link to v1: https://patch.msgid.link/20261112-dtbs-qcom-v1-0-1978370c7cad@kernel.org

---
Rob Herring (Arm) (2):
      dt-bindings: mfd: syscon: Add MSM8996 SAW3 registers
      arm64: dts: qcom: Add MSM8996 SAW3 syscon compatible

 Documentation/devicetree/bindings/mfd/syscon.yaml | 1 +
 arch/arm64/boot/dts/qcom/msm8996.dtsi             | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)
---
base-commit: 749a4de370409464cf8501ec5b2451df45c84eb4
change-id: 20261112-dtbs-qcom-5f2350f0cbec

Best regards,
--  
Rob Herring (Arm) <robh@kernel.org>

