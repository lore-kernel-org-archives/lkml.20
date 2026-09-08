Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05C163A544F;
	Tue,  8 Sep 2026 07:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788851563; cv=none; b=g4QQOpgaHQd5I6Ky2Bfu6neOLX8kxX+DlYf5TiCRZ/Kr9n5FkV1SBvFvz0K+iOKBWjRP3UiGqWgkVniy9RK9WfqkVRzeThRzdGPfLoRv+PokzXbjRPXEgay+7otFheGH+ju1eg2ef0sC7bNQrMhNjplGGHVHBwk3JYMgnr2pD6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788851563; c=relaxed/simple;
	bh=n4wzmFF7SsDyV4NZMeMh+gM4T/C/4j3ky2hmtVdkGGw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=XmamVeMB0G65TjvrOEMn95ySUzmQLJX1opszmgZpwSYxxpXp5Cj+Z+/TPAa1DyjagAQ7xzEAR4t1Uf8caIm1aR1wthEoXflhIeS6HWcBKjcfHB9ASsmO6kmQL43uyI8xVV6xcu/nTZXeparJrGO4J3zJG9k/7xJzweWPPz5DOW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=mf305onf; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="mf305onf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1788851560;
	bh=n4wzmFF7SsDyV4NZMeMh+gM4T/C/4j3ky2hmtVdkGGw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=mf305onfTJPNvvfgOwdHkvoBvghccA7/ySxiUmYp91abroTUjTcBkaKszbnMm1E8U
	 BvALBlj4MacvtIc0X6hiwc/e3W8ZKQyxorH8XVQu4SNSYAQKq7QwZHSj6hPKghthQ+
	 J4cmqRDZbcHsmhpyAexZ9dKLUYR8/bqAj4v/R4zi2xWhFSmhWT52PARexug+fsS+bD
	 igJzYrMfZOnkqR94Io70X0ZCmjNRVI03Kj2cwI7PMDScDksTANCo3tb7oiCPvxFt3g
	 gCn2ZYWpHvulRVWpqODLZgKmD5dx1m+WkD5hn6Qh//VMbRCKAQKcqI3+ER0LYqsSGI
	 97Hd9MoRNPD7A==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9B9ED17E0945;
	Tue, 08 Sep 2026 09:12:39 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 Brian Norris <briannorris@chromium.org>
Cc: Doug Anderson <dianders@chromium.org>, 
 linux-mediatek@lists.infradead.org, Rob Herring <robh@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Julius Werner <jwerner@chromium.org>, Conor Dooley <conor+dt@kernel.org>, 
 devicetree@vger.kernel.org, Chen-Yu Tsai <wenst@chromium.org>, 
 chrome-platform@lists.linux.dev, Tzung-Bi Shih <tzungbi@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
In-Reply-To: <20260904163143.v3.1.I33d1d66d4724587a981f706243cdc2f264670a40@changeid>
References: <20260904163143.v3.1.I33d1d66d4724587a981f706243cdc2f264670a40@changeid>
Subject: Re: [PATCH v3] arm64: dts: mediatek: Add #{address,size}-cells to
 Chromium-based /firmware
Message-Id: <178885155954.9724.3253834048320145225.b4-ty@b4>
Date: Tue, 08 Sep 2026 09:12:39 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0

On Fri, 04 Sep 2026 16:31:44 -0700, Brian Norris wrote:
> Chromium/Depthcharge bootloaders may dynamically add a few device nodes
> to a system's DTB under a /firmware node. A typical DT looks something
> like the following:
> 
> / {
>         firmware {
>                 ranges;
> 
> [...]

Applied to v7.3-next/dts64, thanks!

[1/1] arm64: dts: mediatek: Add #{address,size}-cells to Chromium-based /firmware
      commit: 69c1a4fd5272df1d745d6bcc3c613843ebecec61

Cheers,
Angelo


