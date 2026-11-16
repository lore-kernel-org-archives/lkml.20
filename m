Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794807278;
	b=T8LqiTSmA+ADNmP57HkLAoFwr8PpMFGHmjgFkCicNrKzlRDMpZTqJOi4vxtFJRsgZrTr
	 mBQeHfRDhX8Zefy2r/Fv98ajIUB9UpgjWC068N7cIv4KxyQINz6eUply2MMBic8gVp0Qg
	 8OYdGwRwSFnR440gTvdwQLAVrKw5Els2n6iplz4fe569Wv1p4zAvdgJh3IeIj5Am02FS3
	 4cJ3q1uhls9EDo3h5ktbDOa2wmobVJQWfZJ9OOpnwt8l3KwFrX0u/8c4npnuAsmClkvAU
	 uJ6LUVmBi6p3bW+N/rw7BUOw4DeE7ugNlNtEB61L8aBTbXn87extg7DlbxUO0xxSRgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794807278;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=AZbalvr0RZKV2CHqgY8md5UEm/BcGTfETxormN4SzfQ=;
	b=PSSprgV49lIa2JVYQkUeApVK7nCydI2ngEoFre7mooFNW1Ve8bL51ZrJTPS6nxSDgqwv
	 sIKjqXDlmoS9VO0nv99tKsYX9Uxey2u8+B2NYyTDGAiNmqwQk1AMx/OrR/5KoW87+sxe/
	 P3bp5Rm5k2aodNgJr3cNDOzqClvBxBnFYAjz9+jEpap3FT0gTlKPQS/PKYoIaetiV9rOg
	 YUz6IiPIMqMfChoMzVOXT4tJGPZeoFV5IfFKtIuOh9dw3LYyyyWHslLAN6Ue/YJMpz1zr
	 7UlT97NhUs9XBupjii43soWovA5vam8kX+RNPuqX5VAk62YdPB6ujodcUXupuil4rwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A9kf1Z+x;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F121606A32C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 05:34:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F121606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A9kf1Z+x
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1aefd1bf74aso2270599c88.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 21:34:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794807277; x=1795412077; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AZbalvr0RZKV2CHqgY8md5UEm/BcGTfETxormN4SzfQ=;
        b=A9kf1Z+xZAI+O4NImLVZ1du3+v+O27Jx4WofylUUmF9RFtoG1LQXRwitighsJgZfqi
         bDR74J4ta2cYOj1P2ia7fjprfYCcH0n1C2DO2PrNddBsf7xBT0cgB9dK2w3zZzUoM0Ui
         E/9AaBdwIG6dyB6jPetrfXbxH5tuhm2jMySWBXeq31wwhMcVnWTGXqcUEh3VQ92gZT1E
         uUvQAD7M0or+QQwUMFB5UcDyDCDYh1tUKryBkM+GVGjD8XLlEgkLdp4Z+WqAuRoD8e3J
         uOQL7Rh+OzGltnWJp+mA166rBe2WF+QZiMCx9T8a9xYT3dOiOAcJwskNuwwlQG3WySsX
         e4xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794807277; x=1795412077;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AZbalvr0RZKV2CHqgY8md5UEm/BcGTfETxormN4SzfQ=;
        b=UPFP8nCZPTw90+BOZY1YUUY8XM4e91oogUS+4voZRKXPuUqWgVKnI0eAICiBLVzFT+
         OfOOGL1ti3fSNU53I451o4z655sGmOzBIo2jrCp4T4104fnZL9TGpPTVAY27SiBS68ox
         oTWZxgGEjljkRbltmKeQk93dT8zwW4XUnhZ4km99ZOXSs6cYbyok3wfjxM5o4eVsxARW
         x2rZXw2Ovq5iqRAfFqVwHQt9UB5zPinc4EhLX8WTmk++bEoSYpVo72JoyYtW3QD6961p
         FV3q6M2fpYCstJydqulr0Qd2LPNdX1hjgzNQhqHfkzqAFf7SabwqHWEgVtSfqULZ/G5g
         G7TA==
X-Forwarded-Encrypted: i=1; AL+hErEImM0arQL44wT8AKA1+jdPHfCjLvTsj7CXJ59CvGR2Ey1cal9MMFARX0Fl98c4YllJhvYOn2EAndlxJPw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/9JAIRdh3VMe6apFA4xAhEiL8NdkGvSC+ploBVkoU+T5CgGgtL
	4pW8K11PKT/6F2VLFRr9wmAIHmPtoslAc4oBkok15+Icky9gKw+uy/CA
X-Gm-Gg: AYBFou3nQ2n2TAiat1U0VsEP8NyZldiGEvf4Y0R31V51o6g9oXsBUu2JgEPHgD7/Qz8
	yg/0LtwlAiiZe1bxoA6hDWqJN35ElH1fFAEccnnTuXjANjaH5pNhH0957/QeZbFEfE/EUjp+Ub8
	7Z8/0vSRSssmAFs7UqSvLE0IWjNkmTCu33Ukthg6IKPAmNkDZ/vMmZtX1diY/HMtxxPmRLOnXH5
	6pfOx8XLQRaUVS3iNdEpODgO7+2Hy6grccN0t8t3AgM99wc2x+fuNxBEM5Jmq2kLOyt3lfVWY7L
	4NVOIh06yr6C910SwzdoFKh+vT/jxJ0apDWM0u3CzK/hC1v19Wv7v2pH7Dldb6BBksoMQeia04N
	VS17udJWESG6iIGUSMrwUtjnzxT1GUfxTHEcYiPJnrmy7BDl86o9BxCuVIYT6chzxRV0pveqgjm
	Nv1yiovGmjMBpybeEOdoX6VG2I6u00plsV72stg/eHBbeH2arBvhG/Om6TykxQOwr23gOEsoa4t
	OFOwP8IAGCgvKnB79Exo7RDgsXgPIVlP0Pmbnh+RSJxVPubULrjbPwE2N9W0iEYSVmXhmac0Gzr
	NIX5nLZfRh7RQfvZ4fpS+Jg/0NFC4QWrsJ6xSNR3WVP/AOP4v4DjQ5iAjuqi00PKvSQC+JHtXr6
	5Sly3
X-Received: by 2002:a05:701a:844c:20b0:19d:233:989d with SMTP id a92af1059eb24-1b5030ad3bdmr8391819c88.14.1794807277352;
        Sun, 15 Nov 2026 21:34:37 -0800 (PST)
Received: from Sobhana.localdomain ([157.51.206.8])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031468b7sm33463380c88.5.2026.11.15.21.34.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 21:34:36 -0800 (PST)
From: Sreeshankar K <sreeshankar0910@gmail.com>
Date: Mon, 16 Nov 2026 05:33:48 +0000
Subject: [PATCH v15 4/8] dt-bindings: thermal: lmh: Document SM7250 LMh
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
Message-Id: <20261116-sm7250-v15-4-6acbb232fef8@gmail.com>
References: <20261116-sm7250-v15-0-6acbb232fef8@gmail.com>
In-Reply-To: <20261116-sm7250-v15-0-6acbb232fef8@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Taniya Das <taniya.das@oss.qualcomm.com>, Amit Kucheria <amitk@kernel.org>, 
 Thara Gopinath <thara.gopinath@gmail.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
 Robert Marko <robimarko@gmail.com>, Guru Das Srinagesh <linux@gurudas.dev>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, Sreeshankar K <sreeshankar0910@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794807229; l=791;
 i=sreeshankar0910@gmail.com; s=20261029; h=from:subject:message-id;
 bh=VBYR2sSJ7gPSfZ1zDIlxykyMXb9GohC2X09rRKZ3wIw=;
 b=GfWIYZ4Rdr47qL4uVzwmq3cHBxuZuZfauAK9SuR+lb6tJOGaW7G3JO5uex+TMga7n417jmp6t
 uDxoG1lyLysAGDzg6fS3Jl0jgyrf7wGrThcMpQTEmnFiL14C5GZ0vFS
X-Developer-Key: i=sreeshankar0910@gmail.com; a=ed25519;
 pk=CGSHduvtn2hwLCNRXRc9s/fh6X8PH/zNdp08zC8hOuQ=

Document the LMh compatible for Qualcomm SM7250 SoC.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
---
 Documentation/devicetree/bindings/thermal/qcom-lmh.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/thermal/qcom-lmh.yaml b/Documentation/devicetree/bindings/thermal/qcom-lmh.yaml
index ce72347e2..e1d5cb871 100644
--- a/Documentation/devicetree/bindings/thermal/qcom-lmh.yaml
+++ b/Documentation/devicetree/bindings/thermal/qcom-lmh.yaml
@@ -21,6 +21,7 @@ properties:
       - enum:
           - qcom,sc8180x-lmh
           - qcom,sdm845-lmh
+          - qcom,sm7250-lmh
           - qcom,sm8150-lmh
       - items:
           - const: qcom,sdm670-lmh

-- 
2.43.0

