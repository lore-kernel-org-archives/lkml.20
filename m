Received: from mail-10631.protonmail.ch (mail-10631.protonmail.ch [79.135.106.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 092851A6828
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 23:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788047191; cv=none; b=CQrlTk6Cne44QRIEtqJrDGhC+Gz/JLoDfANC9Vgj5UXNU9ByaKc948pzL8auH0Gd7864aZxtuuuc9Rmy9AG3g6GPxsX260/4VGQAsDjCkE60Fi2Za1FkdUZObCi8lqYLZzh2uPsqfRYhBfgbb/yhByxWYnhePS4vl5pz/Ng2SM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788047191; c=relaxed/simple;
	bh=mcumBcN5yKWifSPWAmMZ9YRHoxXUOi+FWAA6ioKRna4=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=omVLjznqUP5avBjs4gibdBFQDLElVdaFaALuIMNpyrt4pYUqcXwEmRrOS+OvNZDq3JFNFOQBEZhJ+TYmWyiVZXIzVnan35YddfZrz4rIGOJ10wc+e+kb2I5VE5vaijHf64C2XPuyYacxkWQwIUfYUMQofkgnvm8uUrJi0pjXZwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=eSamu5S8; arc=none smtp.client-ip=79.135.106.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="eSamu5S8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1788047177; x=1788306377;
	bh=a4pg4wqMVJWarl6zT6e04yafByAvXTwhHsZCoaKMz48=;
	h=Date:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=eSamu5S8J7AfXJbxfEp8UxNj19uUFfpDtb2ICXeSYRWZdUbbHh77j3C/RUpPH90r1
	 mzj52x2kbVaePPfUgCKYEpuNsPNShGtxsXU0kanv5E8zF0QakGRhmPjys8jE4rRfaw
	 kzlmbRijkoTnDILp76piL63/UPUEteLHLiWuN9t4lBsJR4ukBA+HLbEOzmCjbA7Je6
	 7QgFlvnBfCLw3EG1CPX+DeCCrMA8MU5SsRniGdD781Kb1oaJqzO595fBoiXU42TiqG
	 pU98AQ00gMHpMH/EvyvMkkpKQGsg4lblTbXsi++RSAAfv+ttPqNNBerRsS/dSnlwuM
	 Zxcc138nWzmTA==
Date: Sat, 29 Aug 2026 23:46:10 +0000
From: Esteban Urrutia <esteuwu@proton.me>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Esteban Urrutia <esteuwu@proton.me>
Subject: [PATCH v4] dt-bindings: soc: qcom: qcom,pmic-glink: Add compatible string for SM8475
Message-ID: <20260829-sm8475-pmic-glink-v4-1-0c646c835f7b@proton.me>
Feedback-ID: 147889766:user:proton
X-Pm-Message-ID: 06f39685d53e36ae425b5e93f501ffafeb3b0132
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

SM8475 is compatible with SM8450 with respect to pmic-glink support.
Add a compatible string for SM8475 using SM8450 as a fallback.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Esteban Urrutia <esteuwu@proton.me>
---
This series adds a compatible string for pmic-glink in SM8475 in
dt-bindings using SM8450 as a fallback to provide support for it.
---
Changes in v4:
- EDITME: describe what is new in this series revision.
- EDITME: use bulletpoints and terse descriptions.
- Link to v3: https://patch.msgid.link/20260802-sm8475-pmic-glink-v3-1-4521=
6e6ec572@proton.me

Changes in v3:
- Drop patch modifying ucsi_glink (redundant)
  - Use SM8450 compatible as a fallback instead
- Link to v2: https://patch.msgid.link/20260731-sm8475-pmic-glink-v2-0-28c0=
4928ef22@proton.me

Changes in v2:
- Apply suggestions from Krzysztof
- Link to v1: https://patch.msgid.link/20260729-sm8475-pmic-glink-v1-0-c2e1=
967c04de@proton.me
---
 Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yam=
l b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
index 16ad4f5698fc..d4478d9b3212 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
@@ -43,6 +43,11 @@ properties:
               - qcom,sm7325-pmic-glink
           - const: qcom,qcm6490-pmic-glink
           - const: qcom,pmic-glink
+      - items:
+          - enum:
+              - qcom,sm8475-pmic-glink
+          - const: qcom,sm8450-pmic-glink
+          - const: qcom,pmic-glink
       - items:
           - enum:
               - qcom,eliza-pmic-glink

---
base-commit: 903c1cf6dff9964e71eda98a39e2e5d442050472
change-id: 20260729-sm8475-pmic-glink-57e56f98d2b3

Best regards,
-- =20
Esteban Urrutia <esteuwu@proton.me>


