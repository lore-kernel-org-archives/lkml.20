Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794169404;
	b=vWzQNKdy9+LpHaNuFtL6P5OO6dv35rCBrnk23GzROJccHwLimDwDpqB/58tFFegYbMuu
	 7V5IdLUvUvC+t+7kAnlhauB9PWTWWiilnKfq23IcS8314XquziLwFiDPYxl66Xfdj5GXf
	 yGOdKRwktF8nk81y5g+TTxU+AeqLKNytnYdOusrgLB9WXwwJwk2G+SjxbP0yC62h7URrg
	 CC7zTPQfekLZChIw64SJ0w1dxDTR4te52G0Fh/PFrFtjhqk5RDDqzCgioZJXqJJmCTV+x
	 Nh4ypKm0Lk65bYtIamSXO/1jiiXY0rnad9pwxLH0v2Wa/g43pYo6sS4vLEmTpSbF7zw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794169404;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=m64o+5a8ILubKLKDQ744vOABCDfgCf3HGpC4zfLipfs=;
	b=GTnpzmRBic3iRPvgYWMkqFG6aoemXOsCMmSfumJjSb9ZNn8qUWHJDYA1HYq8jic+GEAT
	 HDrcWrMVoBX2q6Zgas2JQBeWTDNUFjXrjj2ozHDktavxIvUyLuFXsAKeGlpky6AwbXF8G
	 LJ34DcpMzUlY3nnNIaQSOx43xZDyZGhwamtO3uT89leMJuUIL2Z1Uf1ubHhdiDLMY29/r
	 lcXVUl9PhvIgNRa7FrD6wwWSgIyFDqBYooetRTKebwhM6Ogcw+zFGeottQh/ugGcEf0ns
	 GW41DvByeB7xklT0jcxKQxPQMY5lkP/ABQyaD3WQPYO/yoedVxOMHQ/X2NmleJlsRCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=a3VPMvkh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD3786070CD3;
	Sun,  8 Nov 2026 20:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=a3VPMvkh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F0381F008BC;
	Sun,  8 Nov 2026 20:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794169403;
	bh=m64o+5a8ILubKLKDQ744vOABCDfgCf3HGpC4zfLipfs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=a3VPMvkhYxbO/C/awmlAOaLDhgXsWHKV8ml6DN9uBG+bRYT2IkD0s5NUx7qCWJK7H
	 91kzhgJy2S7lYe3KjG1pvY13JlcroOfcuoSub2xzu2SUAGdoxv8FGqLNr3fhz02n3+
	 sE0r9uMxuKhxmPDfxZOsIMzpSctQV0t8zdjE9i0DrErCSOIy/2SbdUcAcWeRCplyEZ
	 RzSo4aSeSh81EZ6Z1775f/AABXUCiQbsHPZnv5neocC5tKyVHWRMcvjSuNA/3Pvyae
	 FKwn6DAo9bCG5GVUCqSJoa3vllI09qa7AweJDRUHWzoJMSycXFAKIwaWzcMDl9BVBe
	 vKPj3iq24Qbew==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Juerg Haefliger <juerg.haefliger@canonical.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/2] arm64: dts: qcom: HP OmniBook X14 / EliteBook Ultra G1q cleanups
Date: Sun,  8 Nov 2026 14:20:09 -0600
Message-ID: <179416929368.628393.14033068705210306199.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261012-dts-qcom-hp-omnibook-x14-cleanup-v2-0-c859ac395b81@canonical.com>
References: <20261012-dts-qcom-hp-omnibook-x14-cleanup-v2-0-c859ac395b81@canonical.com>
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


On Mon, 12 Oct 2026 17:50:57 +0200, Juerg Haefliger wrote:
> This is a small two patch series that cleans up the device trees for the
> HP OmniBook X14 family and untangles the HP EliteBook Ultra G1q from them.
> 
> Patch 1 consolidates the duplicated hamoa-pmics.dtsi include and
> chassis-type property into the included x1-hp-omnibook-x14.dtsi.
> 
> Patch 2 makes the HP EliteBook Ultra G1q a sibling of the OmniBook X14
> boards instead of a child, so all three (2 x omnibook, 1 x elitebook) are
> at the same level.
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: qcom: x1-hp-omnibook-x14: Consolidate pmics and chassis
      commit: 2e23434108d955b02e003e732c7643a3b44cda9c
[2/2] arm64: dts: qcom: hp-elitebook-ultra-g1q: Drop omnibook-x14.dts include
      commit: ad8560386d0b05e89247ebe7d95b3611367ef309

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
