Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794755244;
	b=a44THCc/eMqFSeE045yfvJAZB2VOBV71nY8eyRfXiC1CJ1CDbvL7EqdQXlrmm4vyB4oE
	 HS81a6bv8uTVXlwrsVKbTRtmKskTJrC4yDvcTzKP2Z0LDkrL8yME1qO9N3nEQVSKnqsVM
	 mwUtsZj/gaAw3mdDoY6Mi/XLKChC4uZ5SWz27D5RLLK2J5xIUHtpTEhRkdXD9myxRDgPR
	 wc/7XxL2jDhPNu/0mqoS3GZivrlT9TiDsxK3qGJaeDyqBeVmriG5CdvMFbab46jTr8NjN
	 fxlpLCE/UiMrV3mxUF30s0nLNrS9HAxBut4kHLIF2txZjql8vYbIXlAUwuTkAZ0xJTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794755244;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=cL09+MG0ZraL2bAaQRxHl7M+d42ISuPbh90WavM9X8A=;
	b=w8aVAEzttccjT/N/ikQU+h3Y9n1VClTeHlBW03a+UOvX5KDeQXeCFScP1S+IW+yuyFi6
	 ue9LP1dDVy6On1upDgLDNi3KPLm+zBujIb/ftyUDQ+4kJXslEZQA2nyqcq64JW2iBmMxb
	 crFsvtmanoz0l/wXw8ioLko6addWHJGkLFiBGL64A1BYKhA0xPoy1DH3YgqpcPRj/1WP9
	 VOTj4yXTknH9H8Q9o/1FNRqsppXEiksHPgc3fuzKJedg+g9hQEQsk+xLkVyyHLa9Ic/w5
	 Fgk7qQ8a7GFRMxzy/+h+XkJrv94gQpis5jK19PbdQnsBnh/7IQ/VX4cQyYjN+pN0JWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FXLNTbW+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C98D4606A32D;
	Sun, 15 Nov 2026 15:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FXLNTbW+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 299131F000C5;
	Sun, 15 Nov 2026 15:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794755244;
	bh=cL09+MG0ZraL2bAaQRxHl7M+d42ISuPbh90WavM9X8A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=FXLNTbW+iVvDwNWFgM46HGA4NeJHET4qpPgmsZdNpf3ul3N/NchPopYgjVN5FKY3W
	 RGgnm1XxSGZPLPWfgRRDlPOy7BgdrDlcuY+xpCqdtTwI8jtmi7ZR/34doybpY1/kep
	 o3MY/VNoqtMryzzFCfTJwWzE9w5y1RoLKaM7ftymTcCqK4a0ixncPLzkOdO56a+8Vd
	 cw/uffczcLbgIxHEB+adDO0Lj8nCAaeZC8HgAZTVAS6y69q9+d4AetDXasUOVmYubI
	 OmUBPMIo/CWZHwC+qFd4zS2Mgz/xp6MbqGA97jde2Xk69LpQuMD9uavdkiZzwG4s9Z
	 t6azmQ2Mpel6w==
From: Chen-Yu Tsai <wens@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Samuel Holland <samuel@sholland.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
In-Reply-To: <20261115132215.289236-1-jernej.skrabec@gmail.com>
References: <20261115132215.289236-1-jernej.skrabec@gmail.com>
Subject: Re: [PATCH v2 0/3] arm64: dts: allwinner: h6: Enable GPU and CPU
 DVFS on more boards
Message-Id: <179475524292.3273316.2909957727689381668.b4-ty@kernel.org>
Date: Sun, 15 Nov 2026 23:07:22 +0800
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
X-Mailer: b4 0.14.2

On Sun, 15 Nov 2026 14:22:11 +0100, Jernej Skrabec wrote:
> Most H6 boards don't use the GPU OPP table, and the Orange Pi One Plus
> and Lite2 lack CPU DVFS as well, so their GPU and CPU run at a fixed
> clock rate. This series enables both.
> 
> Changes in v2:
> - new patch 1: add regulator-ramp-delay to vdd-cpu and vdd-gpu on the
>   Orange Pi One Plus and Lite2, like on the other AXP805-based H6 boards
> 
> [...]

Applied to sunxi/dt-for-7.5 in sunxi, thanks!

[1/3] arm64: dts: allwinner: h6: orangepi: Add regulator ramp delays
      https://git.kernel.org/sunxi/linux/c/6442683b687c
[2/3] arm64: dts: allwinner: h6: Add GPU OPP table to all boards
      https://git.kernel.org/sunxi/linux/c/348a4f82f13b
[3/3] arm64: dts: allwinner: h6: orangepi: Enable CPU frequency scaling
      https://git.kernel.org/sunxi/linux/c/6527dd6be62e

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>

