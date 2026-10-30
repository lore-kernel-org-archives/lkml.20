Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=24.134.29.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793395721;
	b=KpUhVuEampRMe7t1qKIScNtiF8mywOUC8HkNxAZK84NM0eyBZVINAMLHMgrgVr8ZvfvN
	 FvHyU64Dih+g/zeFGRMiKPD3swVq3xvhO2+7gK4DEOGqGfMxd9gFtV3l81HO9hPcSZXrM
	 68+BhHh1iE91HmlBPOp0giy2wbCHmqmfkcGFd6ciLGeNbcZ9HrakW09xo79VfbXnukm7L
	 JQ4aCr2ugnkXgTeATdZSJqIqeqJFkAS1aU8XgNPL/nKAOB1y8bUfVMdruFXReW6S5LqTr
	 TPC9OeEeSOAhTbi7cdiz7+I+KH1lyZpuRsGMW4+CHKTlXpUU/FMlhY8O5DtnJyNsEqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793395721;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=Q2MJeKo5+imuAu/kO4ie1/rEON2AWd/TPuI7iRI57xA=;
	b=Jdxfdq8aspnQrUeFTbbIFmDcUBJtTk41GHIbx3QBSWa9xVWagbkZBjrwfW9tudD6RcR7
	 R/5uF/4Lkoe62gr2zANfzRvXI10AiVZjfBK6dE7bgkPRmtWA8Nrc/ggdIdc6+1FEvtYF4
	 Eqk9+1nco4Lerl5yFd9ZyAbb1kEV9fHklvNi7vT7lQD7CslR8Ida4WPYl1W6RuFcygwR5
	 a8bhObmuEy9nBjSsmgcT0QctSeDxzrAxTHNDs0slhU/lvDTPLpI2rvYp0XjkU97B/U16F
	 9UAiRghgDUOcGMe/y+PqgD/TzO6by3Fzlq5rZ3TuoGZavS13/+gtVKNHwWzjIG2YOHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sigxcpu.org;
	spf=pass smtp.mailfrom=sigxcpu.org;
	dkim=pass header.d=sigxcpu.org header.i=@sigxcpu.org header.a=rsa-sha256 header.s=2024 header.b=CK4i0K4j;
	arc=none smtp.remote-ip=24.134.29.49
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4290B606A31C;
	Fri, 30 Oct 2026 21:28:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4290B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sigxcpu.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sigxcpu.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sigxcpu.org header.i=@sigxcpu.org header.a=rsa-sha256 header.s=2024 header.b=CK4i0K4j
Received: from localhost (localhost [127.0.0.1])
	by honk.sigxcpu.org (Postfix) with ESMTP id 836F9FB03;
	Fri, 30 Oct 2026 22:28:30 +0100 (CET)
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IRo5TVH5itQ1; Fri, 30 Oct 2026 22:28:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=sigxcpu.org; s=2024;
	t=1793395709; bh=+1w+85RD7w4UnRjdm8J4R3VqC+3RczStkHgePle7OxY=;
	h=From:Date:Subject:To:Cc:From;
	b=CK4i0K4jhEZWzOf1q465F7ET2FtWqiH6FrawmN2VH4qmhAFrt372/G2gYyLK2lqHX
	 aXNW1p3MNuB81aN3Yt08HcBkbB5CnxPGl+f++8b0/ZJw863ztoMhpTGOkLtBI9sjoQ
	 KgDJZ5JPf+svGRTtUlt8Xg6qMH+lEWpDenOb4xuQwcmRJ9S5z5zPitruZbZgtoSdZg
	 1usakaVuybXJvxD83PkALPq3x8e3rYzh61PCutEs1+/gvs6xAcHbwwqpsXXdkLo02w
	 VTLnmIWpk7MrUDoig74ax00K50ILoYDuPcf1rrdBDh7N5Ossj7JgmS+ekY0bFx0adK
	 Ok+ldc0nE3qAw==
From: =?utf-8?q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>
Date: Fri, 30 Oct 2026 22:27:38 +0100
Subject: [PATCH] arm64: dts: sdm670-google-common: set chassis-type
 property
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
Content-Transfer-Encoding: 8bit
Message-Id: <20261030-pixel3a-handset-v1-1-0ad9b0d17a76@sigxcpu.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWMQQqDQBAEvyJzzsK6SwTzFfGgO504IkZ2VATx7
 xnJseiuOkmRBUqv4qSMXVS+s0H5KCgN3fyBEzam4ENV+ujdIgem2DkbWbG6KjwTcx3AAJm1ZLz
 tcheb9s+69SPSemfoun6suAIKcwAAAA==
X-Change-ID: 20261030-pixel3a-handset-625cdd92edee
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Arnaud Ferraris <aferraris@debian.org>, 
 phone-devel@vger.kernel.org, 
 =?utf-8?q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=909; i=agx@sigxcpu.org;
 h=from:subject:message-id; bh=AqNdVruHbG38YtXFTnNXKwTljWAhcUZCAfLxnzf90QQ=;
 b=LS0tLS1CRUdJTiBQR1AgTUVTU0FHRS0tLS0tCgpvd0VCYlFLUy9aQU5Bd0FJQVNXL2hsSksvT
 UhqQWNzbVlnQnE1UXY4RjkyekQ1TWx5WlB1S2oxTWxyY0tON0VUCkkvb09oeFRLbmdSUG85QnZN
 OGlKQWpNRUFBRUlBQjBXSVFSajlzemZsaUtkQ1NocktzTWx2NFpTU3Z6QjR3VUMKYXVVTC9BQUt
 DUkFsdjRaU1N2ekI0eXYrRUFDc01uemRyN250Y1pIc3dHbFNEOUd0Z3FqMlAzU2dSQTI1eDJqbA
 o1SVE2bGdDcFp0eXQxMG1IbTZ6d0piMURJdWVybUxCeUtOYVFhL1c1M1FWWk1nZnFtNDZtVTUwU
 XhGQ1dLU2kvCnNOYjk4TlNJRG44Zm9GNTVkNWhmZ0xsam80RFlqQ1I2VlpaOUxEN2lMWnhaY0hC
 ZzFEZUNJazd0eHpsVmJMeEwKVUlTNWR5VzVZeFpNcjFWUzFWdVcwV1dFLzBJTTR6SVJwUTJIcHB
 xdU5xRGg4dGNFc1RFNjV2aFhkTTBXOCtRZApQT0Z2RzNXQ2lKczJWeW5vVUNxcHM2UVBxWDdmR1
 RjWUk1VnhZSjE5b2FxY3RkNWhMdmhQbzFTeDA5MFR0TC9PClNxZS9BTU1HYXdYT3JBT3VIUEk5K
 1lLRjFrY0FoRkVsaW9Gd2VpUGtia1daNlEveXcyMTd6WWwwSDdUaFYzdUMKTEF5YWZWUVBpYlNt
 UkV4NHpiRlVwa3F4WkhYRGd1TEpiM1Z6TmR4ME9lSGdIdFdpV25CTUx1RWlRNVUrRko2YgpjZmF
 ONXBTZUJmTUcrejJzZ0E0RE4zbmswRjBTUHVubUlOVUtPc0NWTDUyb055bHQyMVR3VWJ2MS95UG
 E1QURYCnBrTU5pVnNWQStqN3lpekNGY00za3RLcStkMDFWZDlJVUQxQTdhUEhxeUJ2dWpWU1Fza
 GxDeVc2bDQ5UmNJcDUKeUFZd3hLMVgyb1Vxa21IUFRzNi9PVTlLZmFvNHFRL2pESWR3L0RpdDVN
 bUhYN3pYQk1ja0FvODdWTDMwZW1vNApDL3lDdGFoMS95SDlOWFY1R1hLRTJFUlduMjRORjZUV1M
 rejFOZm5abDdRZlQxZ2lQQlNtalhNazZrWlZrUS9ZCmNycU1kZz09Cj1MSmo5Ci0tLS0tRU5EIF
 BHUCBNRVNTQUdFLS0tLS0K
X-Developer-Key: i=agx@sigxcpu.org; a=openpgp;
 fpr=0DB3932762F78E592F6522AFBB5A2C77584122D3

From: Arnaud Ferraris <aferraris@debian.org>

The Pixel 3a/3a XL are mobile phones, we should ensure userspace can be
aware of that by setting the `chassis-type` property.

Signed-off-by: Arnaud Ferraris <aferraris@debian.org>
Signed-off-by: Guido Günther <agx@sigxcpu.org>
---
 arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi b/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
index 4ce9b62abe53f..8f91faf8a9cc5 100644
--- a/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
@@ -27,6 +27,8 @@
 /delete-node/ &gpu_mem;
 
 / {
+	chassis-type = "handset";
+
 	aliases {
 		serial0 = &uart12;
 	};

---
base-commit: abf8c33470f78e2226ee3dcdc69004660020ab47
change-id: 20261030-pixel3a-handset-625cdd92edee

Best regards,
--  
Guido Günther <agx@sigxcpu.org>

