Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794169327;
	b=5mVeMeTLil4X0jQNL1IShV98gI5osOMGnVl8Qp61GVtFnoII84jFM+JyzPIInSfuxiKk
	 Yir7GmKix2kOQ72mydW/oNnLg6A9sc7z2mtekL1EZfgtCpDnVGSpEpMzgGcdbJ/fG3/hO
	 IFvtmVt2VEMcnjt3Vl0ueaT/CMSPcZTVG/6cID6hTzmGeJF7xoGGjZwbw7mmfWh3Lq/cI
	 fFjIdE5KNrceWDkqmmK7r8FUsHuu34ebgD1Ze7Zcod3inQGj/Bc6afEOLdkdY84hzvvHf
	 A2CAPgd9E7k/2j4wjaFKEFmGur9G2yBDlXd7Pm+GzP1OhID//bQkkyGgqzcmi264tVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794169327;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=GnRNViJ3X3TdTvrN/VbWcimw8mNgZLS78Lkb3Jtsfy0=;
	b=b/RfBStkmH2pDj1kVfBB2bPUMRSXDJQvMZ/TXkhJxyMzg2cBtLJR5YtgWnXMAOFks7mg
	 DuQxxfe989HWMuyESG+4AON0QeJu4QP9W0OMbvzuoxTFSMU48W7jVfb3mGsnUfZHMZ14f
	 3GhPBCV7FFhZ0fI5TI8quZ7x0aHaUCFJW25BxK+3CDbHDRiQh6+Jxf6y855r7RH9dDL6i
	 bhOIbC45caChL2rYKa15hXeg+T+0aMV4xp8UoaN9yZHHBHtwuiIKCqm8MIBMU47SKlYym
	 XLE4BUFtoLJzcOGhZ7o2BbcQhxVFuPrfQZ/wzs1/Mds7r2dHr9OSLEFNNby0llANVmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ffUPTm7G;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C06FA606EE9B;
	Sun,  8 Nov 2026 20:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ffUPTm7G
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B11471F00927;
	Sun,  8 Nov 2026 20:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794169326;
	bh=GnRNViJ3X3TdTvrN/VbWcimw8mNgZLS78Lkb3Jtsfy0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ffUPTm7GlcRsB1nyUhgT4k/WTROsXxOqZXDiQkUUxl3ROGmnE1xdtI8OPhEvDYoJ9
	 5T7oO+3gpK86aKZ7dI/IVizDPlgvEDRGfDJTVID9WLyfFdIhJQuEiybV+bY366ILZc
	 jbtTsHL4Dj1OpToSwAY6Ykpg+0BOLKWBCMeYeW9wtf0oUE8wkJKvrWrM0unzap8cnr
	 SXWDlhVBJZThfUlDHp4qcC0PE4Un4fMxb4TvldyVNobqOHqeZBFFarOtN/TlCQRmru
	 9AUT90jJAXA6iqFUeuNMQxgIETbghQvL1xq66DZxG6QOe89yZWrrbTFhdrCN9XGkUn
	 KX6B/28HdPang==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Anand Tiwari <anand.tiwari@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	vishnu.saini@oss.qualcomm.com
Subject: Re: (subset) [PATCH v3 0/2] arm64: dts: qcom: Add eDP display overlays for hamoa and purwa IoT EVKs
Date: Sun,  8 Nov 2026 14:19:21 -0600
Message-ID: <179416929253.628393.13384601813775217356.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260922-edp_overlay_for-next-v3-0-2758d46ee174@oss.qualcomm.com>
References: <20260922-edp_overlay_for-next-v3-0-2758d46ee174@oss.qualcomm.com>
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


On Tue, 22 Sep 2026 16:12:50 +0530, Anand Tiwari wrote:
> Both Hamoa and Purwa IoT EVKs are available in headed and headless
> variants. The headed variants use an eDP display panel connected via
> the DP3 controller, while the headless variants do not include a
> display.
> 
> The existing DT causes the eDP-panel driver to probe an unavailable
> panel, resulting in AUX probe timeouts and missing display modes.
> Userspace then attempts display commits through the eDP connector,
> causing repeated DPU vblank, frame-done, and IRQ timeout errors.
> 
> [...]

Applied, thanks!

[2/2] arm64: dts: qcom: purwa-iot-evk: Add eDP display overlay
      commit: 38b69e58985ae65d8260db5918cf1cb60fe41911

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
