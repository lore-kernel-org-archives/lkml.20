Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794169518;
	b=U0C5RRj9xKRFuIFG8Csn/F3w+en38C1Pgx5lDcUZfz5/JiLNvTmaR1kGmksdfPcbbQAq
	 lBb+HH+v1aMC6zj1E1eqjH9Tg7OXKyj2S54IDBLHXUlchcOzM88f7LBOQ9OqivCgPZ69T
	 SFMIOXWPC5R8O/WHx70TW6lzpl9f4HEQaly5+GrTVnOARIu762Hpc2JGQm0frYXrpsdnM
	 dV8w/R7BneaskuAMT7L1zBylw04f4M02VWdZ8zriUzJW3vxROI+fuOUZA4SOID3U/UFeI
	 kWNjXGXT6GybKKeUUNCQ0b+53S+sZctrBDLmO4aNLWaToFLx6mEiUMLyJ36ktuBOMgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794169518;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=KUkExc4669Xo5M0pq5MFv2MBmaFModmA2vimX3IaYCk=;
	b=UySrLiFCBRlZ1tgMqAv8TwjtGRs3+CTtddcYQ3n5cur/qBViAuoE6wLchsuC+6Puquzn
	 eukMITZGPrZD0RWycrAjSW8S1gbh709dh1SJO3MFxfBYvqlZ2zJwZKnITkJTx8fK9gSaU
	 e2DEqqWaP8RFrH1whym8SWNLVXX6Ej97HKCPsAsViMUnzux1gKkFDl7pZZgjduZF7xfG0
	 h1xNcTTtTLGHlJzecYu+SSCmigIJrV/+0Mt7CF5u2j7Wbif8STitYCdh5Gc1PLJEvmtuA
	 R3JlDTCzJDP6s3iHyzXDcS/hzlaKMrF4lYfQNKz8vK9hfWMw8beTvQ6Ev8TJ7UIawfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ectRRz70;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C56F6084459;
	Sun,  8 Nov 2026 20:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ectRRz70
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7D051F008A2;
	Sun,  8 Nov 2026 20:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794169518;
	bh=KUkExc4669Xo5M0pq5MFv2MBmaFModmA2vimX3IaYCk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ectRRz70jeilpdeFOOPtObn7aRRQbSFNzr86oHfbEcMIQ/ykPy8+O8dj4BHzzdT6o
	 kr+6gtz1yrjabPCYkKImC2/NmVMYDHF/4jckWr33HlvkLwKUpDr6sVP9DJNVJEsx9k
	 wkeFx6W+NDrLnl6u1NlebeVvb8JVw82jwLf136q1ccnKBVUpXuE4o7/coI7fn0jtpZ
	 B7w3f6Oe37QNKI+4fQEjS2w2ukGrQjynbg78hZm6EXhYzPPMo9WJWl3fABUCRCk7he
	 qZPEk4e5UnGfs1o2KJRR8+TFjVtqZS3ux/SHARsff5FPXuyLZsC4mnlnvZXfbOgOrx
	 UiDMY+nxNJ2fQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	Erikas Bitovtas <xerikasxx@gmail.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Stefan Hansson <newbyte@postmarketos.org>,
	~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	David Heidelberg <david@ixit.cz>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Vitalii Skorkin <nikroksm@mail.ru>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: (subset) [PATCH RESEND v3 0/3] arm64: dts: qcom: sm7125-samsung: add initial device tree for SM7125 Samsung platform
Date: Sun,  8 Nov 2026 14:21:37 -0600
Message-ID: <179416929241.628393.5215102040104571354.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260910-sm7125-samsung-v3-0-c467bea0fb9c@gmail.com>
References: <20260910-sm7125-samsung-v3-0-c467bea0fb9c@gmail.com>
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


On Thu, 10 Sep 2026 15:27:20 +0300, Erikas Bitovtas wrote:
> Samsung Galaxy A52/A72 are smartphones released in 2021 on SM7125
> (atoll) platform. This patch series introduces support for SM7125
> Samsung devices with the following components enabled:
> - Framebuffer
> - GPIO keys
> - Hall sensor
> - Vibrator
> - Regulators
> - Reset input
> - Real-time clock
> - SD card
> - UFS
> - USB
> Along with that, SM7125 was affected by a hang when launching SHM
> bridge. A similar issue was reported on a similar chipset:
> https://lore.kernel.org/all/20250721-sc7180-shm-hang-v1-1-99ad9ffeb5b4@trvn.ru/
> Add SM7125 to the qcom_tzmem_blacklist to avoid hangs when booting.
> 
> [...]

Applied, thanks!

[3/3] arm64: dts: qcom: sm7125-samsung: add initial device tree
      commit: e3738a846e67c27bb0ca0e0c5f0bff73e0a65d49

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
