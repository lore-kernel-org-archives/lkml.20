Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793463874;
	b=jRKmKp8T/jTKDf2HdA/2tMRYeJIK6QGxam6U1W6wjXhMhVV3AdIR5JEGADC0+c8Z+w30
	 H5SPK+alOWVmLYyLMj5KdtRQYb3gbHbxhZdrZSsJEoIK5bGpph1K0c27rqMW/qLvMyC6O
	 FS9RK/ARxe4yxS6dfomAOWx0wkTFj+9NdxBOrKyCH3h6xP2sNhiu4A36ApKZIIkubPz6T
	 7r4IoZ3vDfxm40vbRoFpJgSSwStd4ZOVRawxB1qudFLpiVv6YBFgCl7FfzDTo9xO7oTDN
	 luxOTtPihKcSklU2Fm02FMO/MfajKFKq5Dw3JlKP94KC9Y6v2+CEfEpsOVw/S67IP3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793463874;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Type:MIME-Version:Content-Transfer-Encoding;
	bh=wIweVJYcGEf+JF0pxNSl1gtpRzcg8XL5MMMTo3haHAQ=;
	b=WiALFm2OeWifHgZWYTvyifyO7zOR2tLCaxwqfdz9L92EBse0pm+13kNXNh78yr9m12Sh
	 4TeTqg2rwtkmJ5m1wXp8Gfzhww5ZV2prL15xgCx4j5QovJLZ3kfwFGRxkucq5BpECZKIs
	 fO5a0DarpDgMwAVTrx/5uD+9XNEosuEW5ic5v/eBUCKjIAmtdkkDeDuFb4oumLb2BFDNl
	 07oLqfMF3exeFSbgKbBrLfEXrzFVR27oaxvSu3E9u1mkJpyeimXMRhzyDnT3w6MQNIiUx
	 +fFHXwmO/ue/eohMrDJetMX23y5emddXA7YpG1qbOxmy0gXZTQTSd5JQqS3UUzjHNUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pRWIBA2S;
	arc=none smtp.remote-ip=209.85.219.43
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28818606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 16:24:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28818606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pRWIBA2S
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-91c847584b8so23812726d6.0
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 09:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793463873; x=1794068673; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wIweVJYcGEf+JF0pxNSl1gtpRzcg8XL5MMMTo3haHAQ=;
        b=pRWIBA2S2QtzRQU55NrtkPIug7wojsi4Ze95NtY70HubFtZ6lHj04hhPHBGGgz6yDE
         ucGLO4fjJ91JJpmkkN89GlFyE1VfAPpCNxq6YCOkw+QeNSDbWMlsNn2thPfmChu19F1d
         jIl5q3JmYdR8tawjjyaJyKE6NiMtBrv4aZVyOZRtsVFFpxOWItJD5Fqpv9ZZiQ85qJ5/
         A0DVSDtvTmTC1J5JsyVnB0EC69JLfALXC+E943Zozn8m5pWqDl2ToeEmpnKJOXIIMDmj
         wRE0tsQKuYbtTWPr3DxUJbrDyVbeyf2vw06m6GoLIlM219xbnVIyArr9pd15WTgOjVbZ
         iJAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793463873; x=1794068673;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wIweVJYcGEf+JF0pxNSl1gtpRzcg8XL5MMMTo3haHAQ=;
        b=vB52wWIwAPr1FA300Q/3T3hZhp0pkWQUTx1Sl5omtR4si863BXVhRyCB6VBwt2pE9H
         /tnRWjYRtXGb17ur5zpU27kQR9cB8MLZMZWQc0twz8AlULQtiGm2Qutrb+FtOG75mlNU
         C6Vm/a/qOe/GuJ7NbUYVE6dWRDst4g3Bxo9nwViPFkYCkecj3nKy5Tbytlx3z3XvxRTj
         w0VM9GUXgoWYpJN8UFayygZ4fspmUM0vd8IeXRqRYTD6ClRkg+dXOrHrEA82IN/8GUpq
         mkli4mrqVbo2B9+7V3r5dH6KT/rbQaj2KOyL3/aFCFQqRFmXyFKE3l2xxq4XR4pZr//L
         xZlg==
X-Forwarded-Encrypted: i=1; AKwUvBzev5XTpDqz163Feuy7PFqi4O/5aAiW+DSN0EAgYfvyi6CiPH3bcEypqFcJUuOCxZSzY6Qn3YuSJXPmtic=@vger.kernel.org
X-Gm-Message-State: AFq9FYLAoc5yfBsnASr6u1Yjd6Q1cimG4T7+mbtX0es6qj03NgE+1wvl
	0p5KUNIobVcEeaIsgGlEsN9R1f7tfTiOJXJm6pmC4949NuWWdIYZFgVz
X-Gm-Gg: AYBFou21i58Xwfu/RqhgmNp3te+AzSCHIvnF6U7bJO2uESBpJiqT489av5tkySUeaJ1
	uRIX7aZLWwK40IcIexU2IOTynXgIlhavwpDntGMDbwMmT7aALIJpYv1o9zqn+PADT8jMkGSJvot
	XLA96S2U0KancIs0m/USeIdfAzw3SLfhNpp/QyzLJQuzXf4tW84+rzLLEt1VPvAmTy3Dj5tvj6Y
	6DBpDW7akGmR+P2e028ZGSVv4MbUkbWNHD7KzHdTEU3QiQsrR2M8w+0gXGMczK/Hgg7ygxSemKR
	wpZDLce3RV0DcPkURzjcIpJ0Ze+fTzC2Q70hPY9loYFsxVuWaKHwk5Mb/QN1ORwqqRfa6LmqmPe
	Ii7T4b+IueuqheMThq+xKWefcLy8Ek/vFd1YSuwqj2PnhBjzL3TfyMI6+W/VlUsB+Zcz2pYYQob
	6h3UZxCm1ciS9uaC1/ngQ3uSNRIGEU1DRDqekBtLuZRx5Wk0UHRKzWssz/cDKK26uyQoIhVovfw
	VenqnA0IX8K+5+9qiaHlHMZELiWDOolaF9+6TtFlMNt8QnK+jNiA/VwbrcX0aTCewup9ZYHJ9Wa
	LKBSkBKVMEXlvXr9+OCde+iqi7XYSUUPSoXU0+tHMw+VIQXMw/36irmY8FoeOgoqYJaV+2kmU/V
	ue9BDYA==
X-Received: by 2002:a05:6214:1d0c:b0:917:99d1:bda2 with SMTP id 6a1803df08f44-91ca4af9845mr87259526d6.8.1793463872919;
        Sat, 31 Oct 2026 09:24:32 -0700 (PDT)
Received: from localhost (h159-112-31-107.euclwi.broadband.dynamic.tds.net. [159.112.31.107])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ca807047bsm44369856d6.39.2026.10.31.09.24.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 09:24:32 -0700 (PDT)
From: Christian Cortner <ccortner@gmail.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] phy: qcom: edp: update v8 power-on programming sequence
Date: Sat, 31 Oct 2026 11:24:31 -0500
Message-ID: <179346367993.44447.8683103034067826560.x2e-share-edp@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <fc3d0dfc-20cb-4289-a0dd-67ace50d42d8@oss.qualcomm.com>
References: <20260622-glymur-edp-phy-v1-0-814b45089ac9@oss.qualcomm.com> <20260622-glymur-edp-phy-v1-2-814b45089ac9@oss.qualcomm.com> <fc3d0dfc-20cb-4289-a0dd-67ace50d42d8@oss.qualcomm.com>
Content-Type: text/plain; charset="us-ascii"
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Konrad, Bjorn,

On the Asus Zenbook A16 (glymur, eDP at 5.4 Gbps), this series with
Konrad's TXn_LDO_CONFIG value (0x91) fell back to 2 lanes on 14 of
120 link enables, with bit errors on lanes 1 and 3.

The firmware ends power-on with five registers set differently:

  DP_PHY_CFG_1             0x2f -> 0x0f  (the bit 5 Konrad flagged)
  DP_PHY_TX2_TX3_LANE_CTL  0x05 -> 0x00
  TXn_RESET_TSYNC_EN       0x0a -> 0x03
  DP_PHY_TSYNC_OVRD        0x3e -> 0x10
  DP_PHY_CFG after DCC     0x09 -> 0x19

Writing the firmware values at the end of power-on, all 120 enables
over two boots trained 4 lanes cleanly, and 10 of 10 resumes. Which
register matters is not known. Happy to test a revision.

Christian
