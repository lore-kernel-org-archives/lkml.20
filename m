Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793885425;
	b=vin96c4Tc8j3Oe2qMjUle3WOVQAWscQ0NDefifMSgs2QzMC+QOZ50pcyDnyU9N86kGYy
	 oaqT5Pw/Pn+wU1e+04vPy/gzI8E06ZyBsEqSJXepCXD3A0cF1hxkFSV05dV58001QL3hz
	 x7nEEKLeF0koJKkCovRyKEjvsLlj8HJ0Fue/OoiwL2suM+/84jR0Mi7j09efdt1EgBmIA
	 jQfhK0xzxxJ7APIs1a/GFYssxxfPkB0ibMepFAcR5HZ2RJV+OMWOVlY3NsxIiOyHtfcaZ
	 jk2OQ0lkgwkSKKcINA6CZRLk7js7JUOZKslCkrklio/POMR5Y+cq3RBanLI0RjYqmPA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793885425;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=QDRjoJ7KYXrEDNsiSEycHYBoLhoRTNX9Kyb+UVfcwXA=;
	b=Prfj+Sit2zxcy0mh0VL2WSnfmqQMMcP/sE+7TqJIhEj9Tq8JGT5LJRs7b2VGc1ap03o8
	 oTD1MwzqSb1csCOn5AS+uPVjqEp9nZHUwqTHdKSY6dLSWYKuFmlW8YoCd7o0/Td+Pc7s8
	 pZzZYbovxR1NRFYODorah3T0fWSrsBN42AhnirlMdTt2Lv1oo2PPYiPN+42mJDuICI+pw
	 co156gAyxgmRPv+fUzgrErakG4puCI0yU7dpOsDixsZeJ+F/A9E9VgR+nP4rbetRNzmc7
	 De+UawjOHHTPRUtSVwGlHEP/l6DSLVo34Gvyi6/cVsB8dY2nSjiIGLsjW+2IZwj3coA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P9AyBGFs;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB574606A337;
	Thu,  5 Nov 2026 13:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P9AyBGFs
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793885424;
	b=YhfucTBbYg/mOrVqCMK/vhe4vZAa/TQOaAFjBQuEsc6B0dggxi5NsGsW0dHWNs8A2xQI
	 KDDjjLcgS6zUOEXWVJSB/iy8nG2db59fx9nCOa3XhePWfMD9UzmEpQR76hBzIfulmyMFh
	 rEYXw6bdJMX2vtKnGr72BNQ9cO+EySh8xRYJSVhpzKxvYeZctcJM3gdQ5GwbSJIZRWgNC
	 3vrLVnIYndoEAW2oSaaZryhKmD+2oSTN2HDYpQPZLExA0QPFONLlA7xPKUh1NqXKQfrZE
	 60l7x+ECqmotnjErFVpswJG567uPRXqvj36cIzha3kuvSM0DKnesOMW38h3DGLoqr/A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793885424;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=QDRjoJ7KYXrEDNsiSEycHYBoLhoRTNX9Kyb+UVfcwXA=;
	b=DCip6NBGGGiisfCimd9UhTLXmCrze3F7IZuLd++U/au0yHrcut1KfDqzRD7S0e3lN7wg
	 dwfVerlcexwRUrjtnrUQ4g0mPaVQMj5/jIGGtPmzBGUcrp/3ebSBKNSnqpGKgz37T/cvK
	 pLEgPG97dhRsdeL4fri7y7NIGKMm6gmdFPYO0UwOyUAb/8zMsrNu5O6nHp0xdhfgtg/CD
	 GtvNq7TLCRWaKnfSsdNCRn2xsmpVKdYQDq0BxfE77D5RkO+k1FMNlYpJyGdSDEy+hEYkE
	 OPn32TALiMfFART2MzTpiSD//PISYPelrGOGKeARf9AZP7MuxPaBz+sOj/eyOQiWwLg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 49F451F000C1;
	Thu,  5 Nov 2026 13:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793885424;
	bh=QDRjoJ7KYXrEDNsiSEycHYBoLhoRTNX9Kyb+UVfcwXA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=P9AyBGFs4rpKZdufMOfSOpYPV6L8Z3F/uu/gnpnvpfljJ4tJ6qqt3Pgp39g7KajTc
	 DxpxujlU5sEQykv4fR2Eff2HOMtJCuxMetg2Ml362w8TcXfWhjNQhBV+KqZAN4nxN2
	 JXJ70z9ojnGgHBN4sKfaPcrETTJTAP3qPOVj8WVsxBD5+1n6n2tfKMYPiZC6zFUtXX
	 3qzKLAGER216EXTHKrTVUhrHZYMriWpu3AjDbCRlxgR8wHBMU/qktZPpFCwgfwSLgB
	 gZcaVEVFrV/h1PlpaaFDGA8+iJVnZQ/J9arfuugJy+MiY2Al3YHEKUwSorIYfN6J7F
	 PmmnobfMLiLKQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id C34344728B;
	Thu,  5 Nov 2026 13:30:22 +0000 (UTC)
From: Demeter Barna via B4 Relay <devnull+me.fromdisposition.org@kernel.org>
Date: Thu, 05 Nov 2026 13:30:01 +0000
Subject: [PATCH 2/5] dt-bindings: nvmem: qfprom: Add SM8350 compatible
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
Message-Id: <20261105-b4-sm8350-gpu-v1-2-a7175cdd6512@fromdisposition.org>
References: <20261105-b4-sm8350-gpu-v1-0-a7175cdd6512@fromdisposition.org>
In-Reply-To: <20261105-b4-sm8350-gpu-v1-0-a7175cdd6512@fromdisposition.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Srinivas Kandagatla <srini@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Akhil P Oommen <akhilpo@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, Demeter Barna <me@fromdisposition.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793885419; l=868;
 i=me@fromdisposition.org; s=20261012; h=from:subject:message-id;
 bh=Oob8rDXOYjlZ+LgrNVXCvcO5Bli00goKm8+tcwj7nKI=;
 b=7DrcJnoUp88KALon2mZV8imuZBCEzgeqXXg1X5V/967WhbLJrepAfg6A+iP3D/WykSnUVCFMb
 vufPNefnw5dDuKFEoIfAeLrYrW1jc1E2OzSi+2rp2ZrlEJ08MipKbgb
X-Developer-Key: i=me@fromdisposition.org; a=ed25519;
 pk=S0QFlGq1BQEaAtPPdAH8YKEOXMeRuSkTgctXuvtU+1Y=
X-Endpoint-Received: by B4 Relay for me@fromdisposition.org/20261012 with
 auth_id=1163
X-Original-From: Demeter Barna <me@fromdisposition.org>
Reply-To: me@fromdisposition.org
Content-Transfer-Encoding: 7bit

From: Demeter Barna <me@fromdisposition.org>

Document the SM8350 QFPROM. It needs its own compatible because some of
its regions cannot be read, and the driver has to know which.

Signed-off-by: Demeter Barna <me@fromdisposition.org>
---
 Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
index 566304ed4..f1aacc8c0 100644
--- a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
+++ b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
@@ -60,6 +60,7 @@ properties:
           - qcom,sm6375-qfprom
           - qcom,sm8150-qfprom
           - qcom,sm8250-qfprom
+          - qcom,sm8350-qfprom
           - qcom,sm8450-qfprom
           - qcom,sm8550-qfprom
           - qcom,sm8650-qfprom

-- 
2.53.0


