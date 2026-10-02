Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98A9E374A12
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 10:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790936053; cv=none; b=p7HVp8b0eJgAKECIGeq0fkDPqVzLzqAaik94AruCkYD34ygt6WGRuZTM9IjA9F9Y8RM4c8KoDbcIHEiOYkmUNIaLGdywXv2WARJm/fSYZYgprCeHFTkY1nt4nHAXcHizjKKvLEySAum630T0Sz5RvMvki2RbLFqbC673nKueawM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790936053; c=relaxed/simple;
	bh=5AV82EAeB81/NSqsNAVUI5kr8/JBFVBDtzJgQOvlmg0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n0qszdEpBbFmeifChelrbHldA5ZIL8By6LhssPTEcbzpH56c6kjsUa+jCcqhG19J+7JPrCy4R1CBtTQ/p1QMNrvnZB/iM9QnVZgrU0mRF7rl5xRIIQplVXLXYs4etRf8TQDLnPD4i3cxM81NtXFBiuyuDAgNNTFBVY1zsyBVnlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d/vXmp4p; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d/vXmp4p"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 437E21F00893;
	Fri,  2 Oct 2026 10:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790936052;
	bh=riwJQIgtiqEVdRW9lruwv31moH/z4M/4niUBOgc7nUI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=d/vXmp4pblqQ8FfEohz2SUkYxYTtCjf6sKSbmyOz4+LkFa6H5V1Nn13HjxFQPcyNb
	 OE3R8VlKcRQKcXNe8mfNm8t1QPTWUxagHtVxDLsrULBmmXOqLHmUtOl6iT9xkon0BU
	 UKRm7rTlYaTL2MTxJmztZBjoQ/Co9412VY3QGLYoFvnqCq/udjYtO2phR6JBgZC7FL
	 Q3hkRSrT1KU+flsDPBnQnQWyAoq990vSmHCCK0Devvc33HImPBUbODQCueJvMFSoeX
	 2c9eOEFs6P/QEoAS5AfymU8QvsreNw9H38xKN7FH6W8YHIPVmxwcbpsjWwn9EGituT
	 DSUfBt6fSLljw==
From: srini@kernel.org
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>
Subject: [PATCH 1/9] dt-bindings: nvmem: qfprom: Add compatible for Qualcomm Maili
Date: Fri,  2 Oct 2026 11:13:44 +0100
Message-ID: <20261002101352.1084447-2-srini@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261002101352.1084447-1-srini@kernel.org>
References: <20261002101352.1084447-1-srini@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>

Document compatible string for the QFPROM on Qualcomm Maili platform.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Srinivas Kandagatla <srini@kernel.org>
---
 Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
index bc0a0898b9e4..566304ed4c78 100644
--- a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
+++ b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
@@ -31,6 +31,7 @@ properties:
           - qcom,ipq9574-qfprom
           - qcom,ipq9650-qfprom
           - qcom,kaanapali-qfprom
+          - qcom,maili-qfprom
           - qcom,milos-qfprom
           - qcom,msm8226-qfprom
           - qcom,msm8916-qfprom
-- 
2.53.0

