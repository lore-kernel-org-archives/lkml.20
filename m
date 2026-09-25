Received: from mail-qv2-f43.google.com (mail-qv2-f43.google.com [74.125.230.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 747474D0CF1
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 18:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790360016; cv=none; b=e/pse2G3Jo/3Wgb23LvovLJib1KX2hFX+P9iwCQulhJubdkWx7XxnkymexA2pUV+YojdNMQDqjUBXZMpAWyyinB0/kn+rIRWjGPnEbnV/zfj5qfKmn3+6efDz+5LFxRii7eEmbo9ZG+09Mo03EZqNL79r6t8+ggyLR7Q5piBZSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790360016; c=relaxed/simple;
	bh=m7cyx8ZFMDDwydxGqFeynq7iB3D+yw4T82PlEIczfTQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ATLR5/hq8Q+a8ixtNZbY9Qw5kQjRoFjHn7ay6p9WHPDDZaEYUdANlTkDFhbU4mvCp4OFZqwKi/bsXCoXuU7NEDb45BUSFO2eYuxf7R6wOsCC+dGHnhybdBDKjQZI4Vane3YBIf0JkueK7Z2m+tUOOlAWcSG8/sCSg/wARqnLFGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thinkoid.org; spf=none smtp.mailfrom=thinkoid.org; dkim=pass (2048-bit key) header.d=thinkoid-org.20251104.gappssmtp.com header.i=@thinkoid-org.20251104.gappssmtp.com header.b=jUgYvHah; arc=none smtp.client-ip=74.125.230.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thinkoid.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=thinkoid.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thinkoid-org.20251104.gappssmtp.com header.i=@thinkoid-org.20251104.gappssmtp.com header.b="jUgYvHah"
Received: by mail-qv2-f43.google.com with SMTP id 6a1803df08f44-91439d36903so5222076d6.3
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 11:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thinkoid-org.20251104.gappssmtp.com; s=20251104; t=1790360013; x=1790964813; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m7cyx8ZFMDDwydxGqFeynq7iB3D+yw4T82PlEIczfTQ=;
        b=jUgYvHahIGtLjFSWGaODdXohLdw7g544iNlxxuLC/HWV+0AnhtplD9xON60klLVHd8
         RUkKXcp/ZBrIBNSRa05aqMfkzhPT/RovLtKRy1t+kvNQOigG+Wboq/hQliV0heKb+nzg
         KhsoHsapwVE6llOKCG4xvtqe46dohfMbTprU9893lBhABvBphuHZtyfAwd6P+v81Q/5W
         xpseYIcf51sEmOy4o2x470L6AhB0aVMU8KD5hnzawpeYRPgjjS9iPNlTqtXqMpwbhyFF
         0YgH7XY0dp+NP4Uf+5DRPOy5udy0toPbzbpwTKmCMejvBqzffHpkgEpphfeByrIvHzNM
         ZAdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790360013; x=1790964813;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=m7cyx8ZFMDDwydxGqFeynq7iB3D+yw4T82PlEIczfTQ=;
        b=mdFO2D/cdD39/btDseLORQf8VkTbiAcxnPyItqlUAhfGZdiXme7kKcU8nDZ9K1cGLO
         ABLAq9hx1OVj5Xetzaw7dfvznGqJe1N3wcLV5YlKvC7pVIB1Y6PQ1NM7X5lEziL2sWvU
         +7+rYQQT+kOA1+h2knj3Wfi7dwIleZE6EJdFpP8OcPdqSys+HsdJw/+YgqA7LHAzbhA0
         tpFEogwTWb/pkA0Kz+1JPd10hBh0VydLUKz7go68r25mKpMJCOulbtYKjCRsUZpzKZu+
         FkT2+j4IC8ihdCacZXdZ2yFPmSJk4xqtxK/YXw0ziE1rozGhvPdLFx6MXpkLHCvIsdn/
         lujw==
X-Forwarded-Encrypted: i=1; AKwUvBxgu5qz7/a2tWti1ROtswT1Guf2nQxnINY72OhHTYKse3m7QHGcbpAXpSsM3osczGU1sx/DvDSBFN7BORo=@vger.kernel.org
X-Gm-Message-State: AFuF++mWH5Hr4B+M0hB52hBSLcJsCW0l0cYjk2ypF9F8Jt5UbQ3c2yPm
	EZJ5LU8iFsxcRcKbx8ariBbmsaoLHG6caytLLnlFS79wW7NNrSOQXaGcPJpNiYMl+Xc=
X-Gm-Gg: AYBFou2yknTkwuShutLrAhLBeNI6cHPweBbRiOvUITP+kAIGzTGm62vnW46PeRRXX69
	fN5ImSiRBpS6rN4rmTh0q/0qnxUqhDs2eMTpftixkvNiuBIC0ENIRloh2M/Oxl5xx0rLtEqFdO8
	t7PArnKBxo2tLHUtbKnBgzlCtp9++swsoDUXiVdmEpGCy185m0ypf32/8VEmbrbLNRu6ZVTgnYM
	dgc50/Pmozo/gLNba776xlW11ygJFk2Awl3hDemkp+Aigb5HYYg7pkotYMhojYbP+U53uPeQkfv
	vD7dW/hMfAB74IYm8VqayarpW/ZRpV3VlY1D5nN4uaZNB+KxZv2G/OIhDjBM3IQ47vBKYKrCcGz
	GQ10Y2EDJowHNL91/B1olxnjM2j5/gytdi//TTuzF2Xh97PuJYOkRpE+k/B0o3eqDWf3rmguUc2
	eTcyQcE3ncY1ie6C8Fm3RBnD2Mapfm1+4CsXhr2XEw7eOPTZo=
X-Received: by 2002:a05:6214:212c:b0:914:433a:59ac with SMTP id 6a1803df08f44-914433a5edcmr9586606d6.38.1790360013409;
        Fri, 25 Sep 2026 11:13:33 -0700 (PDT)
Received: from armok ([2605:a601:a61d:7a00::2])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91430dacc41sm22471816d6.14.2026.09.25.11.13.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 11:13:33 -0700 (PDT)
From: Liviu Nicoara <lnicoara@thinkoid.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bryan O'Donoghue <bod@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v7 04/12] arm64: dts: qcom: x1e80100: Add CAMSS block definition
Date: Fri, 25 Sep 2026 14:13:30 -0400
Message-ID: <20260925181330.22794-1-lnicoara@thinkoid.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260917-x1e-camss-csi2-phy-dtsi-v7-4-1a63eb35838b@linaro.org>
References: <20260917-x1e-camss-csi2-phy-dtsi-v7-4-1a63eb35838b@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 17 Sep 2026 14:20:29 +0100, Bryan O'Donoghue wrote:
> Add dtsi to describe the x1e80100 CAMSS block

Tested on a Dell XPS 13 9345, with the board DT for it [1] on CSIPHY4,
two lanes, and the PHY API series v20 and CSI2 PHY driver v18, on
7.2.6: the OV02C10 streams at 30 fps through libcamera's software ISP
and into a browser.

[1] https://lore.kernel.org/all/20260925181024.20352-1-lnicoara@thinkoid.org/

Tested-by: Liviu Nicoara <lnicoara@thinkoid.org> # Dell XPS 13 9345
