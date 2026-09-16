Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com [74.125.227.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B73D13BBFB1
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 03:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789528360; cv=pass; b=QwwnOL13rLjDrMeWaFb7nnjDCblR/XMUUpWO4VuZEysu+bk2KHtvQb8CKQcR5J0xooSpFoC/YPRi9Z+qhOdkHzxkpKrBV1fja7znQKY2PoPJQV4rc9zcpgtCXO/UFZaNmfcP+K3gqnIxHvKV8dKLBotZPXkqb/iEqytA2V9NDa8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789528360; c=relaxed/simple;
	bh=rOA+W2OAbrZJ/yGP7NnAmIaJwzKfjJWJXYt5I5goVnU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K83nmnKPDjRgdwSHL5RiVMhiVU3MzhBKuoAc6DTJzORaq/d5eQXGdwD1VPvi/3ee5GNdF4KL+ZHqw6RDlDjAqQQqlVEk/EQhKkvkD5gY91roINSj4R/1tq+eyQPysYTnpBsn/yJr9nEi2/wzjPvWdMxLetCmqOgB5dqVRjPnBtk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m6bxraIy; arc=pass smtp.client-ip=74.125.227.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m6bxraIy"
Received: by mail-vs2-f12.google.com with SMTP id 71dfb90a1353d-5c67e52ff5dso310641e0c.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 20:12:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789528355; cv=none;
        d=google.com; s=arc-20260327;
        b=GVjT3RGfx3p10c/bFiPjGkzzwlV7BRTMsmsdUBMannyU5u/yLMuJZiuvCLSrzbI+s0
         L64VRtBloHjo5vtZYy/Scrlcy+iyMlJ7Kn3EBE6L0nxGqv4ps8ARVzMWJuvFLGYpRCb2
         HaKj9NAoCzF2Xh4o7Czv2zlNa5Az+7F+evcfQxwAwCbgm54QX1dybQ2znA+Z2cBTG2rC
         Je7tAzZCpcAXkdAivuea7dAjeYW0RJf4d31bfHNgLMYtWzCKP/AsUv2cEqr3UU0Z9kS5
         aJjAUTXND5Xtt3L4ILOxnDqsE739ysaLkOWhPhwcYI4OFy06r8vIJ4B4vBSvSOrUBIg1
         OocQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rOA+W2OAbrZJ/yGP7NnAmIaJwzKfjJWJXYt5I5goVnU=;
        fh=4/cMrHwCBED0uglb7t5NQh1vtVCKfLgqB+SF7Rv2ouM=;
        b=eMYqq8huKarUEP2uzbkDYEwElXHRw8qUXLKjZd8OWV5QjvwyU4dfQCJltuREEpRHvc
         FOrn5RPnFDqk5INcrwU/err1yTVajaCsYL1o/nlAt9KReVvdQlfJxA3uNw5rzlD77O4r
         JrU97ugnEjU4H+0Plhyhq4B5s48adMIzt4SebRxS+1hatUgDkfxvb1Rdz2+3FOQts9Xv
         qBTol4L2qcVZ+JsRw3ojYO9voVdmaOcEHR2Iod9yle1Ccu4swuamYlUtWMi5HlpIASje
         ATn9BfYBQ0jr90tA1pVQ9Hj+K64SkFbSAaK7QEK8rf6ZmtaL833RbTLf26Xnl5FKRGjs
         4AOQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789528355; x=1790133155; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rOA+W2OAbrZJ/yGP7NnAmIaJwzKfjJWJXYt5I5goVnU=;
        b=m6bxraIyTcGI9du0PoSBP2t6QxvgZ9A02mIlBBD3zA0gUDm01z653PkvQFqEgiLUYa
         nucedVD6qrIk1Jeem3rRD/YUqYsonICn7IHpfsXJS4SvPHNet9CG4u3dafStbV9JFSDj
         oKZSIbMxwrtqbj/fsEY15fJQzs5yq7ftsONkHFcddSN8wwqAe91vi7fK29ycnd9GYIFi
         dqciC7bFsFnP8PXZsGkPsIu2c7fvAAt/lovDmFbyi5Tl25pRAmeqoeoiV5LPRzs/qQT7
         GU/Z4F1TYKSYIQxP690pkto6rFnNDCV6YBEdfPx4tM87g8DGE8/sLzD8FeC58kWG7AKI
         aOFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789528355; x=1790133155;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rOA+W2OAbrZJ/yGP7NnAmIaJwzKfjJWJXYt5I5goVnU=;
        b=n5YOuXKO4lqZQAB67FbeA3f+I/Fc1/mLpjqNLZSJlXhqNwhaKmG/OfKfLt9U1hxYlk
         KqT50NnZMjW6NazJAVYjJEvkg6uy9wIrrMkT65h/X6DC8WDkLcKKuRWkPq9CsuNPabpQ
         h5zgVAtc1EERZiiezDxDATJvRUJC6VVLTmHOyHlwDT3yjVy0dpC5O52eG3Mz5srOFDEh
         tblqDyHSOaoVjEXkBOm80hirHOY3Rq0IMLT927D3A3yJF173zdJwqznuBYGs4v9KjUV8
         2TOFKrh6hINHpQx2jOT0OZOml1PUw/HSeFoGORswpQxDAstyBaOKLBnWT9SXT8XeaDRi
         +UNA==
X-Forwarded-Encrypted: i=1; AKwUvByKJJIuNDGJ7GBzL1r1zhYQ9wW4JdWYc6pVCRGOqJkN3qqMYB7oKSUVYoZq+MKIXErjk7Parz1P2Qz4+e0=@vger.kernel.org
X-Gm-Message-State: AFuF++na38u6VwsKo7fwiY08NuJhZP6+MY+ZGzMZZiAQ8VN2k2AThvRJ
	UduQO9A7MMktCeRzDdJdEwOGyXOdQrZTMHmoHMy0r4hs9i3A69sOKbfbY9ls4h89bVP5pZVJKdT
	q891DCwhDw+BOFhacnsXO2aH94kJQVuU=
X-Gm-Gg: AYBFou23bhAHRyxjnjNzQbrwrPXqfgvSV0eA2TXTNBHIcLrIw/GNmEu/T1soE7YJdQV
	49xLa6th/rApVsRvjcYrVOIJDRg6VLlstIqvqYGWhaHF047Y9xBMzj5FNXRj+ZTlr3Saq27uEx3
	JapCqXUyPLGPs1nlC0qm3SaIuFlaAnr+J9VuWl3ct1CM/FnOR/4PkuXpa2RWFymEZS98AsQsZzr
	TM90HeBffx+N3OJo2pPKCo3nRNO0vHS97ayPXScbwcaCp+4caCvjt+xITUT/7pBr0UwCJINO8nG
	Dn21CDOt2832xKCCHfP/oi3o0DBPPGZPFMnkFC6UXdt6pvAgKi3fvOavnvqiH0IbxTzFhNspsok
	cACgBfAcWrawZ/+ARekQt6AjV0LHspS6kaZfGOQX7uDHCVHSGMo3WFolNqaDEaCkPiesAFUZPNb
	Csyt6kqbZy9PkToUFAy2nxGHhNh8COP52ra0Ot5lkYoGAA
X-Received: by 2002:a05:6122:8b11:b0:5c6:64ac:d6f3 with SMTP id
 71dfb90a1353d-5c99accf34amr894249e0c.3.1789528355167; Tue, 15 Sep 2026
 20:12:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915-submit-h616-emac1-v1-v1-0-195de0bb1f8a@gmail.com>
 <20260915-submit-h616-emac1-v1-v1-1-195de0bb1f8a@gmail.com> <5df35a3e-d2c6-4576-868f-d3194de3deb0@bootlin.com>
In-Reply-To: <5df35a3e-d2c6-4576-868f-d3194de3deb0@bootlin.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 15 Sep 2026 21:12:22 -0600
X-Gm-Features: AcwNN1VnOu-2I6GbVq8WQF9CNqEg1e8Y093roZVmrwYp1oBZ-wfj7f7of1XAwLo
Message-ID: <CADvTj4p6RRcr7jb5hJCveeniHC81gkzHxLrPA0T53+VVUrKAZA@mail.gmail.com>
Subject: Re: [PATCH net-next 1/2] dt-bindings: net: allwinner: add H616 EMAC1
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Richard Genoud <richard.genoud@bootlin.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Maxime Ripard <mripard@kernel.org>, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2026 at 2:33=E2=80=AFPM Maxime Chevallier
<maxime.chevallier@bootlin.com> wrote:
>
> Hi James,
>
> On 9/15/26 21:03, James Hilliard wrote:
> > The H616 secondary EMAC uses a separate system-control clock register
> > and supports only RMII at 10/100 Mbps. Add its distinct compatible
> > without an older fallback, since using the primary EMAC clock register
> > would not work.
> >
> > Constrain the PHY interface mode to RMII, matching the hardware. The
> > EMAC1 clock register also retains the three-bit TX and five-bit RX dela=
y
> > chains, so allow the existing Allwinner delay properties for this
> > compatible.
>
> I don't think there's such a thing as RMII delays. RMII has a single
> clock, contrary to RGMII that has a TX and a RX clock with a 2ns delay
> between clock and data.
>
> I think it's just a leftover in this IP from the other variants that
> can do RGMII ? You should just be able to drop the comment changes here,
> and same goes for the dwmac patch.

Yeah, looks like most but not all vendor driver variants had RMII delays
configured here, I did test and it doesn't seem to be needed so I went
ahead and dropped the delays in my v2. So yeah, seems to have been
just a leftover config.

>
> Maxime
>
