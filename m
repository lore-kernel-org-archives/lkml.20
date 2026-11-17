Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794925612;
	b=zPwTej/2Zdu5HVwiXuoqap17gV3/zUqz4tp3vBenspaPfujYHQrmi1UkbK440Nr1UdJQ
	 h+mWASVzfx3mC7nCLwOHT4vD+EKqynNkssghKFuCY7+psB8wBSjCzfB9Tdd7iCgsVLTSf
	 bzBGczZNaC0JO/jeRQBuF9brDjFhrs7dsvhNhlXT57UXvoI7nQ0pDrtRPFeggCwwttLEh
	 OSwCzyAWXBq7zNY1U8KhECKsfB5lCunOktEavSHQfirut4qSgeMvUgrTpY8qyt0WFjyiH
	 mlun0DDPDGmjbaOQEMdZTGlKOtUThgKnk9H/vQc41/u1xBbq0eNkcfLReaAz6ly3j9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794925612;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:In-Reply-To:
	 References:Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer;
	bh=USsCTf90gGZ5jNlFeq762EOZvRFTNKa9FJSOYvXnXuw=;
	b=2adJJh2SY+tJ0yXtn2D4WqayKqGzFQSw1VkWfvTF8n99JkbgXm9NKp4Z+ex9OI78fZgY
	 ocIOn6HVx8PljAPxvdMpcCfSOFrQe6UK9vAwmd+cUqpV9e5R9zCudm9yRvc3d5HmXnnZU
	 LHVnNOiUFzmuM+wBqdSsk5DcnN00cBbcXT0gqNlw8SWS2I81Jd1oLDHyqwKBkreomNuaB
	 IC9u2UN9OHwTX+wM2kiVJMq3wJPAhmyDR6aqcj+j0ycR9gHvE0Zoojuj0MbPNH1Hr0/7+
	 xBP0GBwZ1tnNXJToeCVzu4KyiniG++nhB7t+HmLx4vploBwJSbj43PhVo7CSdgOlHBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=ZPRfs8t+;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD9CE606A329;
	Tue, 17 Nov 2026 14:26:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD9CE606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=ZPRfs8t+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794925610;
	bh=v9cXNV8E9rY8sB+kcXdolX/QfafWx2QvoQUp5369hBQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ZPRfs8t+igeS59j3GyhUonxkM+rLJkDbIm6NDCg2JSfy4mmmmmElkyxmXyxK12aKu
	 pqFTo5jGtVZj4ki6YbfRKxrVpsMCSk7OWDcWV9wB1p6HvbB+ugsrJyC1zWubsbLGyz
	 Z7LKup9AHVqEuUgwQxJhlOITqNPQVlA4eaOVCKFIIKnBAgW15ysu38EMk3Ad1WEy64
	 5xY4n8XolVaK/OKVkmhNZcAzsruq24DVoYf/tpPFWF1banf9NdzZF/wakuVr/WMdPX
	 WcE+QdoB0oEOvK/1+TR/TD7s5ZWTjMJEPU2f8C2mhVWA7bucdZ2LG2/N7pYGi0tJ/d
	 GK2e1txNaqwjg==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B5B5117E0A27;
	Tue, 17 Nov 2026 15:26:49 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Houlong Wei <houlong.wei@mediatek.com>, 
 Roman Vivchar <rva333@protonmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
In-Reply-To: <20260907-6572-gce-v2-0-412a5b037290@protonmail.com>
References: <20260907-6572-gce-v2-0-412a5b037290@protonmail.com>
Subject: Re: [PATCH v2 0/3] MediaTek mt6572 GCE support
Message-Id: <179492560991.199072.1968120807944596875.b4-ty@b4>
Date: Tue, 17 Nov 2026 15:26:49 +0100
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
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0

On Mon, 07 Sep 2026 21:03:04 +0300, Roman Vivchar wrote:
> This patch series adds support for the Global Command Engine found in
> the mt6572 SoC.
> 
> Notably, the patch 2 introduces legacy ISA format, which is used on
> mt6572, 6582 and 6592 SoCs. mt6577 doesn't have the GCE at all and
> mt6595 is much more close to 6795/8173.
> Patch 3 adds mt6572 platform data and legacy_isa forwarding to the
> instruction JIT.
> 
> [...]

Applied to v7.4-next/soc, thanks!

[1/3] dt-bindings: mailbox: mediatek,gce-mailbox: add mt6572
      commit: 7cb447b0f02bfc4a7c7446c4ee5c7a4fae494ea6
[2/3] soc: mediatek: cmdq-helper: add legacy GCE ISA support
      commit: 381549f189b46daff657f20575d9c46dc0b8ec2e
[3/3] mailbox: mtk-cmdq: add mt6572 support
      commit: 51dba4c52a1f7c242e9ce73187ec69254171d77f

Cheers,
Angelo


