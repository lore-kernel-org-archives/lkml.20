Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794169406;
	b=UD5nWTnsUCtuYdN+b27mjked0x6y7dDgPUoyq0GeEZ67taGUNMJBJfT3Jo+eY0XftAtP
	 HGXsIcKtOUxL6GpZjFxqCWRAms6EyBW/5oBEu9DI3oVClXwMdGHEnTaU1OoXLbAEBxEc/
	 XrRARPBZJc3ccTb95sqBsJqOvwaLl37WxtNN0LEAovu2k9vPkuWrNvyyBbbG5gXEHY68n
	 xXnsKA5+O/bt8/gKnryeTGM9NSSwiVF+xU2sJFmI+A3mQ7S96lqnQQsBIhQCJ8oB0l9iP
	 JIld4nUiKd9J4Lrfpc8xFwkU2WQiA/YNOTVwaGbuWq3a6C74YmCLL8PmF83pdG/aB0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794169406;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=YwiO6kC7xgkKgsJ+rcPZuZEngA6rKjGO8VVd1QP813I=;
	b=sAROm6wT4RaxLlqen/b5GxKjl75zuEIq6PBISiUiwgy/PDTSRE6SAQl4HnUI5+YQ3asl
	 R73arPH2KR35g97u+1MjTnyW8OwC3zwBOCzBQCsBSTd4XUv/HOq9pIVYTeH61f3gLm5Fc
	 P3SiXErc8eUncCFSeeKwKaRafIoTZ1IEatwKeQRra7cSZkSSU9PQin1gE+vaPI1vcC+GA
	 yVEiPepUl/tbc5XG4FP49dl0zV8tc/iF4Wa8OF0uOurrl5ZSCFc9Br/X5uZWlUeMrL7G9
	 a9ONRz7ft5Gi0gtE5BRG2+XtY3huZlJzJFAlr763e31CVLFYxUnZ0fzScEPMiRiNcNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UBvfnMPl;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D0506070CF3;
	Sun,  8 Nov 2026 20:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UBvfnMPl
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D66331F008A2;
	Sun,  8 Nov 2026 20:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794169406;
	bh=YwiO6kC7xgkKgsJ+rcPZuZEngA6rKjGO8VVd1QP813I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=UBvfnMPledfIodrZgmMlVyyIVC1z7F/sd4ewvolyfY7NxsKNUl25T6xS/1Nw7wGQS
	 iaPtfnl7m3vujAHeR8nUaWulcPoE/mdyEJoJBaEjUJ6ZxeVj9OdAUo3viJcHc4cwV+
	 7ijl5tB02imn8k3qTLUaAnL7BGtlg77fH8MnygnM6LuyQDOWLfw/2VXnmlq6Vgt0ib
	 1zon1Ym7PKTjHBI3rWvxdPo5QX/XbvlwQDZHn8n2X42qI+FbfBG6YN7uCEGZ/AYFbq
	 g2qdIICndF4WYFoC2qeo420QDSm3BC9c0al1g7d+DKqy/eV5I57dX3OvbPUSOphzqY
	 +5KBoojikEhyw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>,
	Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
	Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: Re: [PATCH] arm64: dts: qcom: glymur-crd: Mark L4C regulator as boot-on to save power
Date: Sun,  8 Nov 2026 14:20:11 -0600
Message-ID: <179416929351.628393.11241637858419849510.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261009-b4-regulator-boot-on-l4c-v1-1-7b76c2b2ea76@oss.qualcomm.com>
References: <20261009-b4-regulator-boot-on-l4c-v1-1-7b76c2b2ea76@oss.qualcomm.com>
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


On Fri, 09 Oct 2026 17:36:05 +0530, Kamal Wadhwa wrote:
> On current Glymur Rev-1 boards, the third USB controller and PHY are
> not enabled, so the L4C regulator has no active consumers. The
> regulator node cannot be removed, however, since Rev-2 boards will
> enable the corresponding USB hardware.
> 
> This rail may have been left enabled by the bootloader. The RPMH
> regulator driver cannot query real hardware state, so without
> regulator-boot-on the core assumes the rail is already off and never
> issues an explicit disable during late cleanup, leaving it enabled
> indefinitely while unused.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: glymur-crd: Mark L4C regulator as boot-on to save power
      commit: 09096b4ea1bd00730b1a10584b6405119fd28fc4

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
