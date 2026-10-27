Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793102445;
	b=dLpFtUuiTXPnz4S7A/TP7JZf6ROk/SbLWvVwIK5I1c6nPl3GWK3SHiPx8LX377FnrpdT
	 k0sOagneC0g4UJhmlo82wY3z3zMPwKA1KWeRMBPgDCy4ejb00Gcx5hO0/T35Cpg01+gF/
	 8y9qnfV/1K0+HNhKRgD0fon39kOPupTpqo6o49tRuRfvjrnvQowmCdq69RYuOIf+Jq+LT
	 N4JJalXZNjM6qAv77D4cr8sjMjtDGMUbGv1XWSm5b0WWRr/hSXI+0Zi0j/qs+gTA9PcHm
	 /drL426pB9tyWcWYtzQdJ8Y1V4+opMp5FCHPLeSMk/38rsfBb9L1ZyXVDfcsSiDYGRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793102445;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=4KBnKZ2ldhWTCS/0yCI6Y+UH0y9EQUDr5Imq5+wRBAk=;
	b=wwFXC+iJl6zuGtkNDHIv6uw/ocvqyFyVj0RExsEDTxZTLzBCXU6lDALL+LOCo8nyufdi
	 KuF1vZMTJPa4nLHhmRCYfGbqgKQal1922HbN/RCHx9kmJUHUZm49MPh3NvOQVYKY0rmow
	 20lpt/hA9Y7Mf7bSRrrbZSkaFBVvgD9SyVeG3GUR2BcQAPI3Osbmm9I5wH1mIG63+ojq4
	 R8WhZJoXYDYO1cfdywgWoqgMF0A7m/1+ICkls4hjIvMzTAgz1xPInMHHBPbxdRvcqHJfy
	 bPAcGfHDYGGf5Bq7zxZdcz9LejS4q+/rUQnuB68Mb6FjDu/8wQFdXC4Aa6V45CUE4NQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UBMmomfb;
	arc=none smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24B5C606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 12:00:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24B5C606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UBMmomfb
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6af9a9451daso6142469a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 05:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793102442; x=1793707242; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4KBnKZ2ldhWTCS/0yCI6Y+UH0y9EQUDr5Imq5+wRBAk=;
        b=UBMmomfbj2Z/DjSKvnujnL23eqaP+gUcQIKIHuZb2TRimkcNNzFUtX4uedUvg7v/UD
         XE/n06vqJED+aa4VxKMc9zLcxSqlgFmpYhl7WWHaarYZpQIYo55qJ5WpZP4vRXubHNn6
         +VIA1vOgufoGjryjPWh2UHMWrCMPZNgMOY6T9Q9b6QJ2LbBSdC0yHPAa36W9QD4MUFsF
         fcjj++1d1mBqdo4lLIQVHrdb9YrVjJP6rjtRmydlhgaD4n4h6Itk3zBVtUjzBfGIWlRs
         Uel4I0aabouVD9+O6DmFg8uWJW71hea87Y9SuQQvToogunsgIs0+POC08uZOoJDciL3p
         PEHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793102442; x=1793707242;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4KBnKZ2ldhWTCS/0yCI6Y+UH0y9EQUDr5Imq5+wRBAk=;
        b=MaQOfCf4HvwDPcnzBUUnzDu0oJaeBqD6tqn/NV4itZzOdCdEBUAocO5V4Ync9SVkR4
         uqmlN6b1YwLCPL4kZtu4d9BtC7s8Tl/M1V2CoV+AkNpPOvepzlfj92zLLg6I+2Pp+0Kw
         4DCrSetTn/W+IQuXnyZTj01tEdXWXcbIMqR5LkDNdWe7XvyqoVRtsi5Z7MC8zUhTMDeo
         XYhTOjHF+jR5VJzfiIMyvSiPmvj4igOoi+RrhNhWxhJFIAxsY95l+8qiOjW4eJd8AVwo
         +Nk1YgfenLYLkUAsa5/tqbER+4NUi5wW4MXdozBpWQvReqaRdlt9Ol6eWUx3+EKsuaO0
         YuLg==
X-Forwarded-Encrypted: i=1; AKwUvBwYjsrONxhRceZ6SKgTBbRWWdGzgG9fb8m7MexoeV4WGU4lGke+tyV1DWjMDfxC1M3hrBwFWajV1H9NRBg=@vger.kernel.org
X-Gm-Message-State: AFq9FYL0q9wS0ugUt9j+VwMhWYWtn7dWMiW8wp4XhGZleJ91Xeo6m4jL
	jFch5O/kY70gGMX0KgByYfTVjPUAk2HihtXnMkPz3NpSjf4HzK6RYj4r
X-Gm-Gg: AYBFou3du44aBXcl9FVxrmwWe02tKwhZm09nZo47tT9e16PExkPaziny2/GW9riVchY
	SHlswNLXy4lSPomypKHC9Zob7hbGse70iXjmSkv5Wi1DnY3l8LFwnPFujwJr55YAZ4W3XTBJFP4
	/q95uB2K1+P+ED7pliXjfp+647psJQqyufmHWrlRzrWpnSC0MbO5RE0GEOUfI7cS56dtTUzBEbs
	VsvrNUTfzheq6EzHaD1VsqvXTMnon8BA7Ihm0B3KhjUNY5d/pl12BuMVxXRJfCLh2FnjdlMzsNh
	unK6zmILRKH2w27/e16lJY7omMeFOv1gTWoz36YySdhw8h/FD9hWL+NfwmKbyYII3lqKJoGpn7b
	QV0DZBgXskMLc10+57lGiLy5g4aZc4ItN41qZ48QlMj00JzS+FFQK8emIJdbvIUx7uX+ZYLX2tj
	p/hX1cTmGBnp2XTNeEA7C/8sVoWO3/5n4cAQJfywpsN+gTDXW7zR32bb5875NaS4cV+xF/nQGER
	dmnptINWoJ1Tl4+wDCKMXp4co1M/1S+LZhYClVWAwsE5Ayt83kTRcMKbLoYNBKLnx2L5LdL2/ma
	x+5a9Rdz77rsVsqVnZgbSQ==
X-Received: by 2002:a05:6402:c14b:b0:6b4:2d6:cbea with SMTP id 4fb4d7f45d1cf-6b442fcab59mr6665292a12.9.1793102442085;
        Tue, 27 Oct 2026 05:00:42 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b44598480dsm4717844a12.24.2026.10.27.05.00.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 05:00:32 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Abdulrasaq Lawani <abdulrasaqolawani@gmail.com>,
	Leon Romanovsky <leon@kernel.org>,
	Animesh Agarwal <animeshagarwal28@gmail.com>
Cc: patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH v1 0/7] ASoC: dt-bindings: Add/Update #sound-dai-cells to Tegra related codecs
Date: Tue, 27 Oct 2026 14:00:12 +0200
Message-ID: <20261027120019.93611-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Add/Update #sound-dai-cells to some codecs often used by Tegra devices.
Document #sound-dai-cells property for i2s and ac97 nodes of Tegra20
and Tegra30 devices since they all provide a single dai cell. Add these
properties to SoC level Tegra audio-related nodes. This is required for
creating more complex audio paths.

Svyatoslav Ryhel (7):
  ASoC: dt-bindings: maxim,max98088: Document #sound-dai-cells property
  ASoC: dt-bindings: realtek,alc5632: Document #sound-dai-cells property
  ASoC: dt-bindings: realtek,rt5631: Document #sound-dai-cells property
  ASoC: dt-bindings: wlf,wm8903: Document #sound-dai-cells property
  ASoC: dt-bindings: wlf,wm8994: Update #sound-dai-cells property
  ASoC: dt-bindings: nvidia,tegra20/tegra30: Document #sound-dai-cells
    property
  ARM: tegra: Add '#sound-dai-cells' property for audio-related nodes

 .../devicetree/bindings/sound/maxim,max98088.yaml      |  8 +++++++-
 .../devicetree/bindings/sound/nvidia,tegra20-ac97.yaml |  8 +++++++-
 .../devicetree/bindings/sound/nvidia,tegra20-i2s.yaml  |  8 +++++++-
 .../devicetree/bindings/sound/nvidia,tegra30-i2s.yaml  |  8 +++++++-
 .../devicetree/bindings/sound/realtek,alc5632.yaml     |  8 +++++++-
 .../devicetree/bindings/sound/realtek,rt5631.yaml      |  8 +++++++-
 .../devicetree/bindings/sound/wlf,wm8903.yaml          |  8 +++++++-
 .../devicetree/bindings/sound/wlf,wm8994.yaml          |  2 +-
 arch/arm/boot/dts/nvidia/tegra114.dtsi                 | 10 ++++++++++
 arch/arm/boot/dts/nvidia/tegra124.dtsi                 | 10 ++++++++++
 arch/arm/boot/dts/nvidia/tegra20.dtsi                  |  7 +++++++
 arch/arm/boot/dts/nvidia/tegra30.dtsi                  | 10 ++++++++++
 12 files changed, 87 insertions(+), 8 deletions(-)

-- 
2.53.0

