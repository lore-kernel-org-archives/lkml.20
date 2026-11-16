Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794840562;
	b=QbRCt9DdrWALuD9I9tnKbwgzXPmoFD2QsrnzY1QdtOiRaNH8Vq6j1LdpAq1Xq5Me+H7H
	 vzxdoDyjIUGPZM3miDxDUpaRkPMSQaqTKEVbafyftQOZmNpbWEhOQflw5UHKNLJzPnUY/
	 vxqneUyMvDi8rK1Fodf+T9EVGQ+dSHFJ4ckGB7zuaoPuxrtXyVGlPkUIPwOV6chhijy88
	 YYTwYTlh+s7QFB5eq5/Z3NrqDo/AHSHI7sfosWpyfuQfBohC/48PQw8S6tZf2uSsplW+u
	 rVhlUm+hqxwwweYRy2qAaEiGADULj/vNmL3pKr57ipWlcbUrJXLkykU1Vafs1o0oG3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794840562;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=xpdUsmqwFsl+fw1Ug/x+vabGeX0lnohnBwQIFSkIWUU=;
	b=wBEOPBtZMcjoqhYi6SfxpIvT4urBtynlRCw/9XQi9gA63DmSq8+fcnGOoCa05QlhrdfT
	 8FsNq3RtcU3clbDha7smKoKdB2QRejOiEq0pYNpC95FfJk7pBGLmZV1ZWtsIshhTTK6Qc
	 9fqyvXXJQYjsxxO6Vd2JQs/lISjd8X7PpP5unhWzLBUzFfML1SLKnmrWKZ+IuTfTLvHjn
	 oZztEDZGzDtoWbssw0WbzvkaLrfeVwIVNShpqL5fK/+p6qT1QPt0z4+qlxyEayto6udEx
	 /e3kB5y7TlV92vqnJl29u4TFuUyExoYCfkq+VNGlNzXzo2UGJGIkvHhMQCoSmOVMkjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JWaSLjGp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1730606A32A;
	Mon, 16 Nov 2026 14:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JWaSLjGp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C3A81F000C4;
	Mon, 16 Nov 2026 14:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794840562;
	bh=xpdUsmqwFsl+fw1Ug/x+vabGeX0lnohnBwQIFSkIWUU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=JWaSLjGpoqiesAs/FLYU2gcEEgCj7/f0rWuh3blVH516CEcgBgOfZMgVyhtWcP5lZ
	 Udfv5vbjSX7LBwbWu30gss+/oylNcVpkXRr1lvHD2DlcWUWjj9/yyiEEDk6mbCljMn
	 WPTD3rPT1UMWDVGVaOf5gmX70zgxjVDfnTVAJQpKvLPWBe7r9XvvHS73CSgzf+y+Uy
	 y2mq1uDUUrWvzNPNyLGe/oRFn7AkmgTJA/15PDxhsj+U+eGnVefnGLt2QHn/AL3G8G
	 PFr7gb8Mc1iMzfh6z9NWfVTJrgbkFD1lqi3ueYjvDn+6kfWVbOnXzSKuhc47tqrpCC
	 ugz997K64gDmQ==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: linux-arm-msm@vger.kernel.org, mfd@lists.linux.dev, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261104113330.1634180-1-peng.fan@oss.nxp.com>
References: <20261104113330.1634180-1-peng.fan@oss.nxp.com>
Subject: Re: (subset) [PATCH] mfd: Convert to subsys_platform_driver()
Message-Id: <179484056114.16646.6958582673962799472.b4-ty@b4>
Date: Mon, 16 Nov 2026 14:49:21 +0000
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
X-Mailer: b4 0.16-dev-ad80c

On Wed, 04 Nov 2026 19:33:30 +0800, Peng Fan (OSS) wrote:
> Replace the open-coded subsys_initcall()/module_exit() platform driver
> registration with subsys_platform_driver().
> 
> No functional change.

Applied, thanks!

[1/1] mfd: Convert to subsys_platform_driver()
      commit: c53f93584630ca2e5a461466c4bbf1319ea6b419

--
Lee Jones [李琼斯]

