Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794764875;
	b=NzFYffSAFspp1hvCEp6Zza8G01F58p/8gmQeCfa5Eg76SWdYF6uv62YZLKoNrFUQC4pS
	 Cuu17Ds/EN+OpaQZji/vdQ3fguXmjgwEBzIx/1Q4xH0EkTRTIVcr1kNPs23Y3pmZZJEcM
	 bBA5tYrTFqQu70/AQz6VfPRhnqxFz2ZValJLi+Zu53qUgn1E0cGWrJvzSU0a0wU55gKNU
	 3zSgEQma9gbiBmO2Vc571yXxeUilMyhrsy06QwM8gUF7oEmeDwgSvdpjrTdgpwV+5+Z32
	 +msZ2u1Do2FA/d+PzRBEVmfFaqzXMQSYxP5V4Uyxi74lVz0oHP4+R6U0xYb/pWQ7NLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794764875;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=+Qll/vIexU7xeo5M8+gP/uSz39nyTc6xFHqMYnattWI=;
	b=aV7m6xEBzZ2eXqap2BNQZ2xtfYwDO1csyGCuph9GM2UoPJTxi968C2mGV+rtt0Hinat/
	 WyMVNZ8N9CiOwGef5tKcQur2vFsRWs4gI2rmQNpncbD/wWtlMQvwj2iw+XST2BFPN43dM
	 t/VETJIcD/vnuuJqUqacAMyofWU7gzPSd4naOL1ybIBWhEW4z23+KmoHj+ijnyk4Ux6mG
	 JwznXZ4C4tNykGs2B1wUzHsqhc0ZScjRdCY7Xx7gO6e7iBEcrYCL6paysU8u1Vadm0Dn0
	 qnjQGyG/qLZ3hH90sCOjplNsep5JTUh7B2jS7mf6UmbfMzV24OSSWU1kLAxeGQjfQmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e08HEec5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21BA6606A31F;
	Sun, 15 Nov 2026 17:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e08HEec5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26B601F000C4;
	Sun, 15 Nov 2026 17:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794764874;
	bh=+Qll/vIexU7xeo5M8+gP/uSz39nyTc6xFHqMYnattWI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=e08HEec5dIPXehNCRnJEg48JU/1QYwlptQ8zyYy0r++TbkJG0L+U57dJSR8pC2kzy
	 xnsvVUOoobEjkohZBLo/Zeb+iFgdD85qVX5nzbeaP7dvtPV+MaR+pYJssMCkO2zP6a
	 qVjFMgCsZdJekCIpESDAl2TW9La4eLDu2b9Or5hmeVdBz3fTql14D1ynwdCbREG0qO
	 VdnTAa2TcIGvIa0Xhf4gFHya/Sj45si+jCLdrBohE+xJrSwLgTv7aO7AdN2UXlSI+s
	 lkefWZvBplmVCuWdzzc9qcQD3U3AIxlQXsXJBUwp9ayiMZ6md4E0iv6dCl8G0zeFrZ
	 v5HfX72o+GDqw==
From: Chen-Yu Tsai <wens@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Samuel Holland <samuel@sholland.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
In-Reply-To: <20261115170328.34338-1-jernej.skrabec@gmail.com>
References: <20261115170328.34338-1-jernej.skrabec@gmail.com>
Subject: Re: [PATCH] arm64: dts: allwinner: h6: orangepi: Raise CPU
 regulator max voltage
Message-Id: <179476487291.3342574.10682884992397406138.b4-ty@kernel.org>
Date: Mon, 16 Nov 2026 01:47:52 +0800
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

On Sun, 15 Nov 2026 18:03:28 +0100, Jernej Skrabec wrote:
> The vdd-cpu regulator on the Orange Pi One Plus and Lite2 is limited to
> 1.08 V, so the OPP core drops all CPU OPPs that need more. Depending on
> the speed bin, that caps the CPU at 1488 or 1704 MHz instead of
> 1800 MHz.
> 
> The limit dates back to the initial board support and isn't a hardware
> constraint. Raise it to 1.16 V, the highest voltage in the H6 CPU OPP
> table, as was done on the Orange Pi 3 and Pine H64 when they gained
> CPU DVFS. The actual voltage still comes from the OPP for the chip's
> speed bin.
> 
> [...]

Applied to sunxi/dt-for-7.5 in sunxi, thanks!

[1/1] arm64: dts: allwinner: h6: orangepi: Raise CPU regulator max voltage
      https://git.kernel.org/sunxi/linux/c/098728144545

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>

