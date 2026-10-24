Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.194.8.81
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792835654;
	b=MGVc0oXJvrtPWNks+036pF5KLHMK/CokADUf3+FlPLmVDqQdz4svBzrfpcoewUNl7kun
	 XvcD8oxoLbHeXioikv9hWycNnyWCM8z3gsU8GKsPOynZ23sL2jbOTCZbB81nALbUsdp/p
	 +WLKkovN8LHjcjvDL1r2bateLeNfuWQfxaAPxUG85XBTBTz9GY2rwtih6X6Dy7Bz/BCCM
	 Cfaxog/tyh0Ll5wiqm5HIj9vcbds5u8VUpXip9iO6zZKWx8FpG26t0Ts9aHkyOxalCkS6
	 hquc7USmOMdZF5JKsv5bqckJUnHNc34BN98pPAMtScSOb6XdFrXb4i2oddWW0c20fXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792835654;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=wd5WneJ3yT2t5uYaf+vnpFTb/wh6DgL3x1P6eVcBx78=;
	b=SzNGqA5aVsw6WtwCO1rOJehfC7oQhRNuwB7D3sGZD0iYvNctYiOI9pjjvRgwHUBty64w
	 sLx3Gy75Honx1YYEvCdm+HJMesLlGQGKz4p9ERfMaO2CQJ4kSoTebPfhgpRCCAwxh2h6Y
	 C6v9J+j3S4y7ZzBY2oUdhXmEjVGC6xnHiu9dUhYg7hnSSGKUub9JT8UEZvDxtgBJl3hxi
	 KS18CUkdqTXzl+YQETw6hUseP+N5Oj2yEBzsEZVFvt5Ult/vGXNVJ3geEacswasppiONc
	 oHEKLaq0qLshOQAlkiUdtHL5FGXDiY0vDDsfUC8CEQLrIeJlzloSKvCoFJ5OF/IQLSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dolcini.it;
	spf=pass smtp.mailfrom=dolcini.it;
	dkim=pass header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=AJgcN3Qn;
	arc=none smtp.remote-ip=217.194.8.81
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B45F606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 09:54:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B45F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=AJgcN3Qn
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 4015A1FA9B;
	Sat, 24 Oct 2026 11:54:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1792835650;
	bh=wd5WneJ3yT2t5uYaf+vnpFTb/wh6DgL3x1P6eVcBx78=; h=From:To:Subject;
	b=AJgcN3QnNjtN+OdFQ2zyIUxTxNLFrO6u09lpcfcgnB5VJvCklXGv6zbM6eQK8pBYk
	 EEfPLvb1/rcpYR4UkWbGpbhORgSQQgO2M10dJjANSjacJj4qM7ywDgztGQVbE8RLBu
	 me2C2CicBux3wlq357TDdbxH/iczARZ7u2mGi8IBPJTj3eEeMZ0ZQlqwofbtWTxekT
	 cp8FPwq/pS6BICUajhxa6Koh98I5BAQV2ai27145IQfd1BXnrlPh8G/JnVQAH3hf6S
	 sjGMla4AZKSVgyPldzvX2xJc4e0Tq7WtmNH1v2pr7OAF2wGQ7JpZfMcP0g4cvcV1lx
	 eA3xDXkU7icSA==
Date: Sat, 24 Oct 2026 11:54:05 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Cc: tessolveupstream@gmail.com, andrzej.hajda@intel.com,
	neil.armstrong@linaro.org, rfoss@kernel.org,
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
	jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
	simona@ffwll.ch, marex@denx.de, valentin@compulab.co.il,
	philippe.schenker@toradex.com, alexander.stein@ew.tq-group.com,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/1] drm: bridge: ti-sn65dsi83: Fix DSI mode flags for
 stable LVDS output
Message-ID: <20261024095405.GA5692@francesco-nb>
References: <c4c33f14-0da0-447a-ab82-2e2f65c09c07@gmail.com>
 <7056b23b-ed81-4d79-b782-5cfcb0102ef7@gmail.com>
 <60a24977-b181-40e4-bcf6-38b65af293e2@gmail.com>
 <DI18PL73UQKR.2YZVZ21V69H7O@bootlin.com>
 <e88af0b7-388d-4b0a-8eb2-a367e24e84fb@gmail.com>
 <DIMMKNT9RHYM.1BRF1S1V5SIKI@bootlin.com>
 <1716be56-ac43-440b-a5df-58cbf571ba95@gmail.com>
 <DINH3J2SM26P.3KE6GE9VPB1OC@bootlin.com>
 <3hfae2i2i2toxbo7hg2if6pztaswgnfj65xfm2c4ofljc6jhua@slaqoewn4mxq>
 <DLATMIFKDMHV.24XNMCRI2ZKBI@bootlin.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DLATMIFKDMHV.24XNMCRI2ZKBI@bootlin.com>

Hello Luca, Ernest,

On Wed, Sep 09, 2026 at 03:30:53PM +0200, Luca Ceresoli wrote:
> On Fri Sep 4, 2026 at 2:02 PM CEST, Ernest Van Hoecke wrote:
> >> > Also, from our testing, when using:
> >> >
> >> > dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
> >> >           MIPI_DSI_MODE_VIDEO_NO_HSA | MIPI_DSI_MODE_NO_EOT_PACKET;
> >> >
> >> > we are not able to get display output.
> >>
> >> This is the case for the panel I worked on as well. In the practice we both
> >> observe that non-burst mode is what fixes the panel, but there is no clear
> >> explanation of the reason in the docs (that's what I hope to discover from
> >> TI).
> >>
> > I am testing a DSI panel on our Verdin iMX8MP module, and noticed that
> > this caused a regression.

[...]

> > I think we'll need to either revert this and later apply both together
> > when ready, or apply the second patch now as well. Right now, it broke
> > the DSI panel behind a TI sn65dsi83 bridge on v7.3-rc1.
> 
> Reverting is surely the last resort. If you can answer the above questions
> it would be good, maybe we find out reverting is not necessary, and worst
> case we'll revert with better understanding on what went wrong, and maybe
> come up with a new fix that doesn't regress.

What's the status of this regression?

Francesco


