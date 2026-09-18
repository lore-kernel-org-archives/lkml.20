Received: from mail-ej2-f43.google.com (mail-ej2-f43.google.com [74.125.228.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91D004BF92B
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 14:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789742417; cv=none; b=JFluaFPhlJ/INh2+Vzg50voJidE1iDjVsUKGgCe7wi7qyzb9e0GtK2gUqjpJ6uOVokeUD3Gm9zWglNX9Vnxjk6RTdCbs+aAED4rr39gc3Vvs9FmDHWBQLAVuBt53XlYZGwdtfeLTTgn4f9kYyfNCAp2qhFnG4a0PwzU79wPWB4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789742417; c=relaxed/simple;
	bh=3l/OQDwilslojwbD5BIFc247psV75whhicTp80W21k0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g7wqRoFZ6LzVuQkZbSK2/+71N3ZkP4hnx0WXbEFaZhKDexlZgotE+38A7Fp13f9ACXmUJvYE9taKppXwWeihZPxx+S0qGkkKG0Mh1IYXodpEcQB8E/WW51tlH5d73cFWbBqT/AjRCJE/3bW5mxR8mxts5OnNIe9B1nczuCJtsy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=mGXQW/ha; arc=none smtp.client-ip=74.125.228.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="mGXQW/ha"
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c2a1f611461so39784166b.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 07:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1789742411; x=1790347211; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NswcxVnJHltqSQeVprb1zCpwdatT8Ku5jmJgLkP1CTk=;
        b=mGXQW/haFJ8L4Zxx9ZyDk6vrHPZhwTsoIA0B2l0CzcNBY6ScYlmRbCnlDtVozEzeeC
         k/k75CQtpmf7vNXe4o9c1lQQv8I/AJVgjBlO0nIj1XDYyQi8B3x+PjSLyk5PR0YLwll/
         kUimCcT4lv533FFcA/27s980FF7rlpuA1LsiXUJW67M8HIzRtMQJxRtpkreJS98kcp8Z
         zpjqecHuaQqnm8l/kgYZLCbD6B5YKdCkbl2RSHs+DklzBr26AAS7Bcd4TH6Xf2kU7M6d
         UEm8enq4WJPkMXimahu0/8ykjTGenQU8swr47JL+WvImHvEKhQ5pv5JjI2XSsZSk8Fsm
         PXJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789742411; x=1790347211;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NswcxVnJHltqSQeVprb1zCpwdatT8Ku5jmJgLkP1CTk=;
        b=PGZD9m13F1YWQ/SsqLX9t14CFULMCrFammIklZekAk+EvG2liXY7PXeb8wIQWFXYwR
         mVx2Lp68mj7YcBX7K2J1zSPemFurtyJ0nzahQlWE7LDG3sZh9jgJGx3Zfnavd2cJ28Qm
         sL1CxFERlnwghG8IBb2bKET7dU2eTmkPJ2pJ70ASJUAdwMOQzeZlZskXREpEY61rNylj
         qYPXSut6n1a1aiA1sv4xB7v99fZE7lGZDh0iodjPNiNrlM5URvtm/k5A7GcvnYbm4JAv
         7aDZcSPBaEm3Yzh8QSDT6W+w3AZHmAI7iL+08uR15X8LAMQ+iiaS5au1pSBaBqZIYbS3
         4YMw==
X-Forwarded-Encrypted: i=1; AKwUvBwCsBHGvAWM1wCjx+TRy8wSyOsEHAHCgHVx0ReS6LipsbG0ODFN/4B2zVTrYvkQP4kl8MpQpsXBfjcpJjE=@vger.kernel.org
X-Gm-Message-State: AFuF++k4EW7zuElz5rb2TDZffOt4k6v9qOx1dzFOumV1mW5scHwC88gm
	fWoCBWvYmeDa4rximKJuNc+pXroxT2GPbc/Ezskqctqv32vcv37M6vmihotQx5oDooM=
X-Gm-Gg: AYBFou3KNaOpYMdu8GwaoIO4FLJPU1GEC6OzErku722ZhXOyhXQf426m8GDJ8r/fEkV
	/TBL4iqHYtKb44eYsfG4wJ33IVDyclVyaR7Et+qn7lnPYrZNbkOnEwuCH7vaQXh16x2suLCVETW
	YY0KSF53K+Ngn5s8Tbz6dntUqxy9qIVMfnv3VZRJIIDjOh/SHL18Hrj2J1PqQth5PxZE6yNTji6
	mcyYNQ5R6QqTJMVji9mGIlsa2XqPi83p9EWZZYfl8RHuHGjXCsw3lJF83WPwEezL+1STjkeMMlW
	rKlj3jHk/Is6yAgXR5dNLdTLWzDHKBAq7Z9SNysXgCtrK80Cx8JIpRhe22GKQMvAZr8Mbk9GrtS
	aQfXuPwHSDcsqk5bZ87tZ0YBDCqNl/nlxK3v0OO8CMbFTeFCciaEdP6g4WhJRLvDT3pUaPffVdK
	W9eJzHbX60MAC4UOe814trHfftDsHFL+dRTBn+QJCqs3NgjijkChKutUe1/qHqios5wAhxUZJiF
	JAyuL/JptGfHL7KtgFBRveZiyUve9TrN7m2R/nmykIC+qrcKpPFRBQXZ0tVsNU=
X-Received: by 2002:a17:907:940e:b0:c25:f7db:4bee with SMTP id a640c23a62f3a-c2a16599060mr289750966b.20.1789742411235;
        Fri, 18 Sep 2026 07:40:11 -0700 (PDT)
Received: from [172.16.220.101] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a1b7a369esm64244966b.9.2026.09.18.07.40.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 07:40:10 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 18 Sep 2026 16:40:06 +0200
Subject: [PATCH v2 3/4] arm64: defconfig: Enable Novatek NT37705 panel
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-fp6-panel-v2-3-6695c4008920@fairphone.com>
References: <20260918-fp6-panel-v2-0-6695c4008920@fairphone.com>
In-Reply-To: <20260918-fp6-panel-v2-0-6695c4008920@fairphone.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789742407; l=791;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=3l/OQDwilslojwbD5BIFc247psV75whhicTp80W21k0=;
 b=2eQL9cFuNTxwCukWgu2TjmmlCNjhR6F0B1X3ayynoF3nwFPzUq2NjIk7TXGfPbqRIFTes6+Wk
 HPbCfn9gLI+BWPQNPwdbR2gfL9qAb8MskNf5dl3aQMt1aV9uYhBn2gb
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Enable the NT37705 panel driver which is used on Fairphone (Gen. 6).

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 6ec8d3a69c98..1d4afc733c8a 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1023,6 +1023,7 @@ CONFIG_DRM_PANEL_KHADAS_TS050=m
 CONFIG_DRM_PANEL_MANTIX_MLAF057WE51=m
 CONFIG_DRM_PANEL_NOVATEK_NT36672A=m
 CONFIG_DRM_PANEL_NOVATEK_NT36672E=m
+CONFIG_DRM_PANEL_NOVATEK_NT37705=m
 CONFIG_DRM_PANEL_NOVATEK_NT37801=m
 CONFIG_DRM_PANEL_RAYDIUM_RM67191=m
 CONFIG_DRM_PANEL_RAYDIUM_RM692E5=m

-- 
2.55.0

