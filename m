Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.11.138.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793571356;
	b=Gw37NJn7xbtZvzE9Ej9UW8yF5+m9mebow1aFQvDGx07MTDlt3peVkP00xpTF0t9QeSnI
	 9aFqnqF7GPgPsW7N7Z8pwG3KR151l6PgLJ09o1Vd4C85KPQSLIybEYuAgvol7jQ+rnI1p
	 2eA1bbRFVbsqXf7oHu0UWw/78HJOG5RlypSPtweBkgI25W59k/YvrVJIJuzTyp0yygkZ2
	 SRzwOPYVmbeQdyXrOGZMt7+OTpHAaCUyplCYWM8D9N9WD87UKsILwSOs/JspSV3AAQCzf
	 MYTaL0Z4zYFK3++kvNeN8jBUSyJdwxYqqm0ctYHTNO/RGhxZzz7zCt8RkL5XKZU1mZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793571356;
	h=DMARC-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=0Ksm3b1KyTjB0vWXpeTrEa3XgjkfnjwTkmMUnW6CK3U=;
	b=z9XkUbHmA0u9FzX46dMB7Q4xZsvxe8fGsx3emIh/lcSgOhvBFJR+f1Gx6lt1OSeuDecf
	 PBTbHbbrkLMvcDlZyrvl1xnxigHYO4u7hZ4LZLZsVBiNLQe3T2IogAWG2cJk6uzeMqu/f
	 NNOaUYGDeda7aisFnksXtVsnFI6yxZnNT8XrdV0UNIWXniI9IDasIgAMC9aWBgxSnlcCu
	 huUTTYdQGLWXu4CBXnSkHZbtX+Nf23AS+37WZ0th5KdT84M8v2YSoxk1qDLA5qpynPYaL
	 d8IFVbE3SMx9JFGrLjxah9aAR+nRdcvpAsoWQOPF8BfhVlylKfwXEuxoDVabEaEa97Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sntech.de;
	spf=pass smtp.mailfrom=sntech.de;
	arc=none smtp.remote-ip=185.11.138.130
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF395606A339;
	Sun,  1 Nov 2026 22:15:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF395606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=0Ksm3b1KyTjB0vWXpeTrEa3XgjkfnjwTkmMUnW6CK3U=; b=P2n/NivLQ4gQLjSQ+ENADKpxfy
	+ahd6N903OIwRWIkgrCcqE3QtjnYl+1mJBGeYGLYPo0thnvWijddU/jivqzPd+4nbByjqeaDWra7m
	2bTtnKasxF/PaNCgrZTEyNWVOLpcAOG1j5quo2dIL99u2BseviunqoU/xhd6dxdNTMt/XUI/YsPdA
	xw4BvcezZCeorxYO0F0/3287SbTFT6vPAHn7vxF0BfyGutAlHstq3DLtlYwOLTwVfG0Fi4oEmStHy
	MfY4puZzqDfm9cEqEO/OgLuiddmSDlMPF9KicZm/4R2eyM189VhShib31Go7pTlNpGynJ1DKYXrF5
	q0iJ+dgg==;
From: Heiko Stuebner <heiko@sntech.de>
To: Jiaxing Hu <gahing@gahingwoo.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND] arm64: dts: rockchip: let TCPM own the USB-C VBUS on CM5-IO
Date: Sun,  1 Nov 2026 23:15:22 +0100
Message-ID: <179357131399.4107717.10715553647759854309.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261024083942.148860-1-gahing@gahingwoo.com>
References: <20261024083942.148860-1-gahing@gahingwoo.com>
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


On Sat, 24 Oct 2026 21:39:42 +1300, Jiaxing Hu wrote:
> vcc_5v0_typec0 is the switched VBUS of the USB-C port. It is the
> vbus-supply of the FUSB302, but also the phy-supply of u2phy0_otg.
> The PHY enables it at boot and keeps it on, so TCPM never sees
> vSafe0V and a sink partner stays in SRC_ATTACH_WAIT. A USB-C dock is
> not detected.
> 
> Drop the phy-supply and leave VBUS to TCPM.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: let TCPM own the USB-C VBUS on CM5-IO
      commit: 1b0bcdaa4de9725870c9b0216acbd373b5faebb7

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
