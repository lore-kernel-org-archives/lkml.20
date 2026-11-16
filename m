Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794865053;
	b=RaJ/gevlwtUlMja9jDK+s31kt7Ec/qkIGPPfifxVtNcCpaJ0xBSr6ORZa5fW7TH2ZLg1
	 hnufps5utiaSmyWF0aIlfnVAuSYG6SRaOGHAxvLVnbmgqP51a7NT450RvGZZLcBpXAc8D
	 n1GsK6R2nFlRVG9DG4zrxEBgnoFK1tRtQ41akekyMtPePNTdkR6CTo1PW46WvWtNkb2vS
	 g97KNf/+kZrMAcSu2ajOrdCrvj7YfPXlpzILvqGUzL4vjdHaujNl/uxyZgTuvDYFEk96y
	 CJCabdw59O3v4/0cROZap7fie7PO4bIVZ5lcerKDIza2G1k164XjQ1c/59+I0cut2Nw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794865053;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=V/CIlexh+3dIbJj+uNeGrZODUMiRED+GiA9HD8bfoMA=;
	b=r0mlM4TCdboeg23utcgFZ0zh/nlP1/VPv0fSAhi/eXd2mdRB4KbKEq625ruyAIuop2zF
	 8PyuS2COAiJzf90VIayP5kWmx/gSw7cu3zcLcjYni4cQ2WZkhipt07xGuT84O9G4QL4/y
	 EhZP4LO4nOikiQcUiiNy8Qx8SiCxHgYTFGWhRLXv0lyeQLH6iqu6kjL8ZXr725TByfTTN
	 ihNi0fy4GTTCahZFaqlIJaBwFibnMtBWiLDkZuuJq088CAI0qCYLt93yp5cRu6UwIvGhz
	 cuxOnrHb2SqVq8rlJt+p33gC3glaqGvj6HQlpj07uVMfFcDInrY9/UABUTQ6QRIRu6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ptrvNQMv;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 963E6606A32A
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 21:37:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 963E6606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ptrvNQMv
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4bb6adaf0f1so14787115e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 13:37:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794865051; x=1795469851; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V/CIlexh+3dIbJj+uNeGrZODUMiRED+GiA9HD8bfoMA=;
        b=ptrvNQMvZGrDGdeRfZ7P/5XmtzRi3+skDCRNqe3eKv7RaDd6Px0lOlXBfXoXIPk6ar
         0YwYpsbidhWdqnfgy48BeWCNSb/vl7QlwrJKBPxuQRGtNHefKMLMVOyClKOYTWkpnQaD
         H+DQ9MVm2XoFQqcWczODgyK7hgRWffk6+5xEPPmve6FV6tMePnKAUBfirKfx0gvpVkd9
         ogFSv4rMz1RhVDyJ8FmPjUM5/S73uz0hqY7Bh2oa1r/jWX3GIUlLSlHQ1Q03tVGQN/Iw
         0wPvxlpMgYX/dWRH0uh+Iz1p3BWaKqy5vSIcO2o/H6uZKoYY6+qKQuFTykeXO1CwuiV5
         vlqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794865051; x=1795469851;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=V/CIlexh+3dIbJj+uNeGrZODUMiRED+GiA9HD8bfoMA=;
        b=VUav5f9BA/qiSi7aip+ap/SEbLjJieik5mrbbxFMJvY+U5j9b/4f98NuCsyjnSu9Hz
         0tB7nAJ4UCyJNscqHPairzapYcVrSJeQVVLC+xC2UejQuTF9XY6ikZfbTSNcG/vdEzy9
         1zES0QuYlqbvsqS6Ew4n9sCh5tWybBvGz1BuafI6kSXZ19qt1GbTkgYpOSlykPyy2i2q
         YivFV66Q2cPAxsW5DxCyF/hl7shCGgofAHvAlrUBp+k2bSzgQBrRMza2zxYWCo0HGjVs
         /NqO/G4nfSYwdbFxFbxu0tRhwVDfLtLC8DvUaM7TWOB9k9IkxC2jlwajZpkkTuQaSqfj
         0obA==
X-Forwarded-Encrypted: i=1; AL+hErGaMDk1qBEtKXMR76dz5bKD4BPUAPrau8XRkGtwAF9kN2m0MBAAg21+k8oH2VOAvE6fhfaUqlQ91QDKMfA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/2YfOfYE7aBp80cxwmX9wc+eRAV8DLdrBP8dpO7X7EEj3R6Fvc
	C4XLVUrBzXHkQSbneBk+6xvLXRmIw+lGHFxuLR+dFKRxDrslSzf3LWfT
X-Gm-Gg: AYBFou2MuzlvNz8UGz2hMTTIwzjiP/R+RoFtKqLJhTIFWAEEibLFeeEPwuQgVonMBYr
	IIKA3HX7vIC/mH8WhEeRtazFHeZZZplSN9Jt3XgnKtCu0tOaXrfwhR2u+ZMOYEh1tLQgX4SfFrB
	a3bL6zC3x0HjCz1zIJqIP0JhPCltM545eYkCLRAW2T3k8quXRxajD0JXweeKFLO3Dt+OmWZ1Adh
	s0K3j5RYSsINQ+EeDQB4UgoCuqrWjZcZ81rFmmLyBFvHBRQRYDVUOyySpMKkbwy/qkeiXcNnC5Y
	xiF2J//DZkBE2jr8iLBaCtam5E1/m2DhneOzXmFBuidjkjB45Hf6czOfvBCjBdm2P/hwMJG620z
	jctPNjn56AHNjrI97akU0JZtLbMhrNMxyQqhb9DrwBwNDbt3NWPj3hUkqUmzo+Dl8ReM4xEjIvz
	B3e7PPscPbFcIkLZdV/SBFPeShk0Vd8szplBEUoQD9Yw2JfyRSgTnnx0nup/kbzBHuaueOsKrAB
	bScrVh5Adh/I+ie0XICG1DNnfdNl3nKzeTupBeazo1isHdFLtGpD1/jt2Vz/I0O47iRj5mPU0Pi
	vkPwERrbxhUnCqen2v6MUOZn5eQw
X-Received: by 2002:a7b:c00d:0:b0:4a1:efba:511 with SMTP id 5b1f17b1804b1-4bb55a8a57dmr187933905e9.35.1794865050987;
        Mon, 16 Nov 2026 13:37:30 -0800 (PST)
Received: from flare5 ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb675200e4sm143331635e9.0.2026.11.16.13.37.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:37:30 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>,
	linux-pm@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] cpufreq: dt-platdev: Add Halliday to blocklist
Date: Mon, 16 Nov 2026 21:37:03 +0000
Message-ID: <20261116213703.3774089-1-lightofmysoul@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <sashiko-outbox-217729@kernel.org>
References: <sashiko-outbox-217729@kernel.org>
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

On 16/11/2026 21:32, sashiko-bot@kernel.org wrote:
> Should "qcom,halliday" be documented in
> Documentation/devicetree/bindings/arm/qcom.yaml before adding it to
> blocklist[]?

It is documented in the DT series:
https://lore.kernel.org/r/20261116-halliday-dts-v2-12-2c92438c6c46@gmail.com

Stanislav
