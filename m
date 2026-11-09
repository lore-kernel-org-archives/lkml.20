Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794184481;
	b=4cI3/TddIzv2FvtrgBYzhY8UgIR8CPJ2YTCupr9PA5EBW09VyCCwX+zETqOxJ8aK1LF2
	 EjouWgbVtyTMp3xxfZzsiYXfj/NVCkf8j/rB7rdYP4A/spyQiYQGE1q2I0R+I4bPJO3K1
	 tM9KQPSlPZ5gWwmtk2vgr30p9rDFet88uhMjws4GPVUZR4ilwYETO4+dNfdub6quehdNW
	 NV0ZmGh0yfTZ/cA58hZcwmWGDMwMyedN3U9HPzO16wpQkjoJAnFKi7UZwWCFDzptyG5ve
	 kuQRJuVi/ielFEOqeR1/aItoUiszLTpoDGujz+611MEgKWXOIfYT0cDvsL33pzxm5kQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794184481;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=bHyunwqhqqpQQZSm8FsYLG0nPatLuBc3TvD/xVa6m3c=;
	b=OCEYPuEl0z17QoCUpkhQh5HofPE+ehoIi7Qx0x7ZSuvBd3P6bSJNoEBSW7EvTM0kTpU1
	 upfVDmLWGuEqW/lO6HVzvgx6RBG1BhD7uizRY6f1p9WKUu9hxpqaiWg0534XksQBxCqfC
	 25UB+jUVZ/S8ToVvG3750G+TLBcWQvveiYc48YxZghvGi50Kc2VZbf1NxitmrU3yPf8e6
	 t/NWaxNwVXqH00DxzWWK8zogonI90TsxnsVrsYIVvHIu8Xd4EvcAJ5zVFQCA0l0SvAtu8
	 kKdYX0bk5k7b5fi0KzxjbvYLzTKkkT9Ixg/gNaKRM3h0E09eLXKzFzC8vjlrjnSUJGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IVXS0Dfp;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB26C606D820
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 00:34:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB26C606D820
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IVXS0Dfp
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-491846221ffso227767f8f.3
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 16:34:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794184479; x=1794789279; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bHyunwqhqqpQQZSm8FsYLG0nPatLuBc3TvD/xVa6m3c=;
        b=IVXS0DfpUIsNMmmlCVLQc/sr3m1dEoc2PxYn9Q1ZBDZgge7WUtw+jdTyqhCup5beuX
         p5UkKtqsdQor407ZN5+sThyv2nEYmcDa0uUa+CnKgMYC7zlI6qui62evwV2DL9VYinBy
         BarYqmMFrc3QEZTIlC8ssJP3XT4AbNHEFJZW9AzKMaUXkbZAhWMFSvOd7SRW3KD8cBll
         drhaytrMXaHy1ToVY72wpbCvSuNZPazRJo4cICaGRiht28G8IVeEueDOvEoNfrZLf8pw
         YGCplgziHwLWFFjwnfizo2aTCI9Yr266yhB2sLiV1K7bPAt2DOuj7ztQV7B0vgLaulZy
         apqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794184479; x=1794789279;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bHyunwqhqqpQQZSm8FsYLG0nPatLuBc3TvD/xVa6m3c=;
        b=ZDuruMnnU2Uu39ggbkzc+7TsUrUalgxqSNWLouQ5fXWFh7p2BDFhR6Tvx1kUa/4YGr
         eUmqJc5U+YEWaDB7xVhO3jX5uopSlteqSUzaeWK1dp1UabPL2MTltKLBBxLCReer9Bbn
         4PtKfLGn0MMbUAbo0Hmw1dhAPjLGaE99UH5x7y5FV8jR9aDnuWX6nGJoWWzXgIq7jzeE
         tc+h7IuyAT6fPn1eSnshSEyAtWghSAC9gpco7NDFpX0Z/yAF7ox5VIZwa/BisL5uBOro
         CIIsrfivdPdNlydS10ngvZNCTm9ahAS0VKFSNE3YXOCoUSqHgeOpV+RuxJbDr3AR8LBI
         MZ3Q==
X-Forwarded-Encrypted: i=1; AL+hErGVd6gC7qcsVxLSyHEOrRtFalj0GXEgbVJUHfhujj8KTSb0dyjQLL5MWA+oDCtqsVAf3aKQjUA6l7MsRbk=@vger.kernel.org
X-Gm-Message-State: APuU4Z82cmwU+JGeXAF20DYu4+3jTBgIz2VZdlR2pclWFp5v24otK4sG
	6SUiInSsXjaP8o1npCmyhNyBkzVwNwPBxZCfR0V0gs/l8gtpfvT8huJC
X-Gm-Gg: AYBFou0rh9YRGaPQophqkP5oYroQ+++hEZ8wWw7jNNJ3reK+DTwAVkTfS1zgocSoc/M
	lHge6rP3TKvi5MEIfqeeFolAjjHSJ7JxPGABE/LJfZ57l4kK1XKfjIEpoCkFEKVt7dTMGvPuZNu
	eMr4TuMmqS54wkJZsBGjfMAePNfHLXxMQ5ZeEcyxkrN3+t1fdCaojzTCPZPPqEVTts+5DGihs+b
	vhOutHd39oY6SHT79xLARzJ/B3IRWeMNv+7+voKDFHFJUh7P2l7ZaayYGJMGeDcsqrVJqrs9VNk
	K++zFQUIsaGLzkJ3BnnCc0hgp5faTBKR74UyLVVMjq6+B388RHvf1HkuA21WdOHeP+XtJB9ePdm
	2vc/TVE05jvmASFzLtPWTh79bKxvvjSX9+5kLZOksBHInxeixZdvV7dOTF1gkcnwqkQrWFRXj/G
	rlb6JT9tNM89jsiRhPnW/2rW0uhmyXN5VSeiVRHL976ImWLgEvx18RbSyBZxjceMD/IpOLGfc9A
	kd5uCiejhtA5zwszvgUWVS73rZCGQ/q+5SGvYpgBawZkX953cM8oNEl5hHjY4AEjOYyWWbJjPXS
	JXo0ErxM9ZWVjMstomI+WAIWb5BD/J+cSPMqzjGo
X-Received: by 2002:a5d:6f0f:0:b0:48e:679a:4aeb with SMTP id ffacd0b85a97d-49586a3c015mr4911501f8f.3.1794184479389;
        Sun, 08 Nov 2026 16:34:39 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49592f39c8asm6541675f8f.7.2026.11.08.16.34.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 16:34:35 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 09 Nov 2026 00:33:25 +0000
Subject: [PATCH 13/17] dt-bindings: thermal: qcom-tsens: Document the
 Halliday Temperature Sensor
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
Message-Id: <20261109-halliday-dts-v1-13-289114ab8197@gmail.com>
References: <20261109-halliday-dts-v1-0-289114ab8197@gmail.com>
In-Reply-To: <20261109-halliday-dts-v1-0-289114ab8197@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>, 
 Guru Das Srinagesh <linux@gurudas.dev>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Lee Jones <lee@kernel.org>, 
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 "Joerg Roedel (AMD)" <joro@8bytes.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Wesley Cheng <wesley.cheng@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Bart Van Assche <bvanassche@acm.org>, 
 Bean Huo <beanhuo@micron.com>, Stanley Jhu <stanleyjhu@google.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 "David S. Miller" <davem@davemloft.net>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Amit Kucheria <amitk@kernel.org>, 
 Thara Gopinath <thara.gopinath@gmail.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Georgi Djakov <djakov@kernel.org>, 
 Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, mfd@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
 linux-usb@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-scsi@vger.kernel.org, linux-crypto@vger.kernel.org, 
 linux-pm@vger.kernel.org, Stanislav Aleksandrov <lightofmysoul@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794184395; l=829;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=QaX1Uqhi9JFBTyniSmrOqgkrx65fb+cn/pSnBpltl3Q=;
 b=Nal1T+ROAiQwIycyxEfKMIQ4y4aGW1L0uJ4HewmCRmGIZfSJuQVD6Fg2qPRcOrHnEpA/WiD2I
 u4aa5TB+J3JDBwhP4O82nlPD61zqIxNlRPMGwQQVcuKGnMJPv1tp6Q6
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Document the Temperature Sensor (TSENS) on the Qualcomm Halliday SoC.

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/thermal/qcom-tsens.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
index c78074fbcecf..3b440f395fe8 100644
--- a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
+++ b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
@@ -57,6 +57,7 @@ properties:
           - enum:
               - qcom,eliza-tsens
               - qcom,glymur-tsens
+              - qcom,halliday-tsens
               - qcom,hawi-tsens
               - qcom,kaanapali-tsens
               - qcom,maili-tsens

-- 
2.55.0

