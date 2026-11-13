Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.11.138.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794604096;
	b=QZCqAfaL7TUXgBsfWxNC1NLE8dsqRkJ8p2gQNP+Sz6RAsF65OW4ogA1Er0U0Nr+bLZn5
	 A63xAHCMrmMoKpKoQjEji2OZe927UKCnOgypsNE63wMNYN6ZRyK+M1Twedr3u6QKuumld
	 wo1+e82mX76Dhsa2uUb5YhWaLo7TyTeiHs5MSHEOZsLCeowbIS1akP1tFGVbgSZ64dIFL
	 fHrHlRpnshDFRhIqvRYs9vSixphUUSVx7ArdaQ3cSc3B89PQJz6kApRue4+WX+gABd27p
	 mtL9OGXD3hG0gDU6OuOyRN7RLOK70tfyanboy1kMiCeMVQvZj+CvhQ9KIpjECZ8mQ1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794604096;
	h=DMARC-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=03F7SZfAc5Xiw+oreHZ8/TiL7M89ri++M35Dlm/XT4E=;
	b=ipOE91mjuVQgcmDpP5KuJ9WB87DoW/VnF+PZTap106ghbFEtLF71p236Z5qw9kaeVlXi
	 nNKbwdxaBulcImIbiq5WEDQ+uuFbcaqpoeRVkglO99fQKCwVncFhC+YptJrxb7dHOoNjU
	 gD+Qy1LPY0x9AAjQjeNg3PdOAdnGoJm6qWgnaf2CVsMeyvWWp+Zp5wm9nQ7Mh2Zlv0kkJ
	 9ImSGFWX9oox6yRn2byZgZ9aYOKiuzc55FJR4VYqlYGOuMSXZ5QBLceOQ4qPKHjOMcG+l
	 IXIwUjD4qgmNGLubTzOVFQ5HXr9TvOg5hp8JYrH1pxnRTdDJ9SYf9SNtB+vFIaD8eRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sntech.de;
	spf=pass smtp.mailfrom=sntech.de;
	dkim=pass header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=wd0GiuRB;
	arc=none smtp.remote-ip=185.11.138.130
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D454606A333;
	Fri, 13 Nov 2026 21:08:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D454606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=wd0GiuRB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=03F7SZfAc5Xiw+oreHZ8/TiL7M89ri++M35Dlm/XT4E=; b=wd0GiuRB8fKuoBe2eyLp/Uesq6
	l9tsdb/O+BXGEddIlE3Y9v2y2Cx8XIE6stWAir6YUkwyBzruUzaMP5mBDKeL+H6fyvi35GaYlpaNb
	jRT6Jwo82Hc/RipfiqASoc8JGzy2nXRp9VGqTP3MSSRnmpVlIzMnU5rSKBBAs3vpLGbF/IgOKIbpV
	Th6VmIiilHc7oYLS7VGvVRuF4ZNegB1Cu/GUpa70gXUW5mCrxDHnC9LpmstoacArsHgMWfKMeeO60
	bNM8Z2874BV6YxymZ5dIPeGDbSLwEJWUg7BC3sKvL9XmF7Pw1VWkVNHJ3JQParF+shF26uW/g7AUJ
	rkIh8qkA==;
From: Heiko Stuebner <heiko@sntech.de>
To: Mizuno Miotsuki <founder@crepuse.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	broonie@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-sound@vger.kernel.org,
	luca.ceresoli@bootlin.com,
	robh@kernel.org
Subject: Re: [PATCH v2 RESEND 0/1] Enable audio on UNIHIKER M10 V1.2
Date: Fri, 13 Nov 2026 22:08:00 +0100
Message-ID: <179460406447.1165597.11270101508665588376.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <179439927463.86676.9537625579963969157.audio-v2-resend-0@crepuse.com>
References: <179439927463.86676.9537625579963969157.audio-v2-resend-0@crepuse.com>
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


On Wed, 11 Nov 2026 12:14:34 +0000, Mizuno Miotsuki wrote:
> Enable the internal codec, I2S2 and onboard microphone route. The board
> uses codec revision B; that driver support is already accepted in the
> ASoC for-7.4 tree as commit 157f7cba77a9. It is a runtime dependency,
> not a change to the existing codec binding.
> 
> Changes since v1:
> - Normalize author/sender identity and preserve it in the patch body.
> - Recheck ordinary and strict checkpatch in the actual Git repository.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: Enable audio on DFRobot UNIHIKER M10 V1.2
      commit: 587730a8f9449745ec3ad26e36a2770ee107a93a

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
