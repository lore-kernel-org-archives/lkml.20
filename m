Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.11.138.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793571356;
	b=gIVPmBuBJjVd+7lmtOayJ4D3Mj5VdFt6VAUSl3J7XIlbvOdlxTNDpuVw7Z8/bDb4cDEn
	 1eAUFPYfExydzTnqGYfCXI6vQNhhznKcHjWqtjZ3pTZ2j+znARcgOUBcEBkc5Aujw5psf
	 Dw5PkfS72yNz5aTUil/rtxYz0SMt2iw26B86T1nvV328kaxM7XCuR/MtDipskviE9hQlN
	 q7ACTvywWUgCECofg+wIA7J6wQw2Ipyp5V9jyBVgkyFHbcHtJikk+EW7VKe9N03ttQqxd
	 jKO5908Ydydey9oKyBXW3I1RThDQXjzTn1/wiEkxDgSH7s9M99GeQY/MifbIuaEOWnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793571356;
	h=DMARC-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=e7Xd2E8Pqzn8FccF1WIpaz3JmDCeqSOjK2ia1Sxg5as=;
	b=ELkkaVDEfx1DNOavjuLYpmt9rdZwt4yLSXwL/Yncjcmqs1YtcQv5Gk7nyH1djI4WfTVN
	 FIonbQwb8roVRAZoEwogmfBGbZFH+AkXvPx40HDgBijcxiL/DjUVwitefxwyZ/uujvHNg
	 g9usvtva1wy8uSRhsvfTSi8wXtVNq9wxIfWFX2gdQN4XNl9wCoHQkDGRWTYmHIX/6fK1j
	 IgVVBS3/vBAftTQ/F8awidFEQRLA9vX1AQDBm3U8MT/REjIGiQScT4JA/uMDk0QcFHM+W
	 W5N9yPl16k+mynwwuFlvBsRFUIk7U8eBnNvqD1LFHmTZdc1XApyhPbZp7Mza2+yKjKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sntech.de;
	spf=pass smtp.mailfrom=sntech.de;
	dkim=pass header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=KymEa+OS;
	arc=none smtp.remote-ip=185.11.138.130
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF378606A338;
	Sun,  1 Nov 2026 22:15:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF378606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=KymEa+OS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=e7Xd2E8Pqzn8FccF1WIpaz3JmDCeqSOjK2ia1Sxg5as=; b=KymEa+OS2KVEyqdV548ljX+ZW5
	Gmi7am9nTorgrj3npe8rlLyXGgIMqF50d/sEiBrQGeMcpdpQ+4jUv6JCToW2f49o8vZ3E7/i+A2bp
	EB5Rh1NUybWcb/4vBFv62v2PTNZGL5/OfmGHr0Lm54eziHjyvCo2jDQgOeOplwHX0oV8ILCmi2tZ7
	Njs4v3JrZ64KenYFn6hoQaCoKzXyBBioSwZV/NpNzV2IW2HdI6Vi1E5btV2a6DuRT8iN0b/DzxZvB
	C1sJfia4fy6MPDlMO7ffw8leJ4fuNSy142aFwwvL/WLstEEtAFnL/M0j+lHtyPBTZzFhaqkZBAXYH
	5cD6t0IQ==;
From: Heiko Stuebner <heiko@sntech.de>
To: Fabio Estevam <festevam@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] arm64: dts: rockchip: Fix the BT clock-names on rk3399-hugsun-x99
Date: Sun,  1 Nov 2026 23:15:21 +0100
Message-ID: <179357131390.4107717.12383201586737412439.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260807112432.49685-1-festevam@gmail.com>
References: <20260807112432.49685-1-festevam@gmail.com>
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


On Fri, 07 Aug 2026 08:24:31 -0300, Fabio Estevam wrote:
> According to brcm,bluetooth.yaml, the correct clock-names to describe
> the 32768kHz Low Power Oscillator is "lpo".
> 
> Change it accordingly to fix the following dt-schema warning:
> 
> clock-names: 'oneOf' conditional failed, one must be fixed:
>         ['ext_clock'] is too short
>         'extclk' was expected
>         'txco' was expected
>         'lpo' was expected
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: rockchip: Fix the BT clock-names on rk3399-hugsun-x99
      commit: 54b2405a6a99b049fb87023a6f780a825f3b456b
[2/2] arm64: dts: rockchip: Fix the BT clock-names on rk3399-leez-p710
      commit: 7736dd0bb7a1c78728d68880f4f8ff033fb7b83a

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
