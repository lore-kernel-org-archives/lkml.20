Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793345321;
	b=bop3LZlRIjC4tOrbpP+OtMcDQTMGp+OVHZJVVfJMWYMYjyGDqScL+7TUi+fu/p5h7HAL
	 fcMyADON78GCtaAp72f5LaBL0CkEvBePqaBlePkjCJJuNa1kp5BDRhkl3BJWxzMRFt+pY
	 hvNIwJn+veL5AJAJQzveEzCZC7/mU1oR9yZXIc2klyOhjQywUn3B5L31XkxZ9DDPuVeUY
	 hmZU+fHgxtc4rB4fXhgXzg6qUFgnYcsg+zWHT3NlcEZ6TCSIok5bEGKlz7ji4v9JHsZFx
	 ISHdBSOAzulCFoN1DOWJPXRCwBoO0O70nfOyVk8foXxNZbdKp1le4RKeXoljxGby9Fg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793345321;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=7PxPIeRuNsvElsGXImQTEuL1CpgybTHblbxvuB0DOLI=;
	b=wwsFyAEqUaMaGsSF+sxoax4FxOoRRYJafb8kIR3alBgIlgOcUNqDZHQ1RNqLUWqi+jvE
	 dsNbFlCiCdFjub01LmcUozNza9DD8kpwTWYpf4Q7HFS5XaLdH8XwQrK+8NjkvYQR/LZBR
	 KzIClvm0xFk9G2v8zQXqAFzyTFwbc4CaUelbBGnkCrUa80NuTmy274ueBoB6plQdz6CK+
	 +CnXMSwAghBy0nj+7720lgVVJgSP93Tx2WlH9gRGnUKxlvJsgOc/xqInSgkGEbd7DWdjc
	 aJCljn2QndrBI9Fv4AtG56nk/QdkA2J0QRuQVZGSFeWsjb9+m2kS3da9rH3t13nYTwg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b="IKy+T/qh";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.177
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36B8E606A322
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 07:28:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36B8E606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=IKy+T/qh
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-8565d77c277so3291637b3.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 00:28:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793345320; cv=none;
        d=google.com; s=arc-20260327;
        b=ZPdzLzF9A8rW9qiv8p61A6YvMFH3l6ZHgBxjkZcHRXyVY4zHRRF7rNGklFj4Jjw9tX
         1glW0DiADcXelZuNiQh9AydNGsq/RyoZSy7FaBTJnsbZxO38lBr0c77F30E2oI1hjs4v
         bw9D5o0meVIHf9TpYjGURy3bNpGjS3JUEk+QfdG02a52bnwqszGuudRtmVZ4xkrUoRvi
         Y3+y8BhB2OfAnYnxQ+0zoLGfT3SiUzqyP0yfqQjsbQTYMHHY2WvB+HQDI4RJgm8dC1ob
         reJv4qqobJUFo4v4K40hpwFQY+HCtZb6JJCnMkYXHNRIrJPvqbYPcL/ajN/1aJDYiDSS
         7Bqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7PxPIeRuNsvElsGXImQTEuL1CpgybTHblbxvuB0DOLI=;
        fh=j/NOHKMztdcDYwXMlIViNPfecPnVZsOpPvT5g2dreks=;
        b=fUFebVHrgpUi26J8SWRq8iTKOYPrqLi5csUwfGBIEcI/RRKw1FUM2oZI5Dpq++r9dd
         1NW8C2rF6jY9s4MloOn9wdfrx2wzn6nyA3RR6ibIAuTwx2Kb1oXmPr9Rv13MrDOJnV7P
         iDAZDol0Jm94Fpx3n+OZljR5WcztKyApmBZOLyk1Tem1kDT3+qOkk0aytnASyGgDmE9b
         RAXO3uIuq3HrOuwBWVzIc815Qe5r4yfBUrqqGbGXf8dfC0nqvy/VFETdJ3eG6GfqUO63
         IcYZiR927m122zCiUyKLRRoRhwHjO3ecabsMiORCbZWCOrSr2oB93K3KP/9Fthg/HjTl
         73TQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793345320; x=1793950120; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7PxPIeRuNsvElsGXImQTEuL1CpgybTHblbxvuB0DOLI=;
        b=IKy+T/qhhIrUOzchV2V4rsBprme/Hu+3Hl6zCa01nFTCsOY9pKmewlMrEn4BQLOwW9
         feJJmNQO23DQ3rGjEzuWcIeZR34xo5NfY4KNRYFVsQwIp9ColIO/GW+PGca/8KtFU+/f
         l1bdJasJc0Tz9mTRQCSooUk0FYHVl951kJDfI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793345320; x=1793950120;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7PxPIeRuNsvElsGXImQTEuL1CpgybTHblbxvuB0DOLI=;
        b=NrT+wFB9n/N8BxrH9adFI4VWOvVKWir7w+4NJCHnSk6D36+bXCsp48pr72mdIcTaC7
         gH8rYuim5GA8kaSPtw2Ou7yE5eaA3TaVgG/5MrWr4jo0W6U8iVn6TM8noBA2nbOnS/ap
         Aoi6TP57zumRpP4PE17/c1xwL0c6v4nrxAbAwpXaMRQNVkkrdqsCcFrtGhN/P9fxIDk2
         9kZfXswIe8lK5r03pJw+lXbT4Q9WXl/ZGLFr5NO55xfXOmy6HLIECLlyO2fgQ1M2Xude
         Y7Ul8fk7DRBWs7RiCMnSANnS1MJ9Nb4nqsFQsrVH/+uUsQVbjC5gZxMb5aQKkzbVD6h5
         Zo8g==
X-Forwarded-Encrypted: i=1; AKwUvBx/ZyCHRyndZxZKIG48IuZDfGkf4y76pPXiwkV2jyeHqQbuImucUf5VLrRWNiPX2aJFn6MOEQEHw3svYM4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJJUYR1w/3zt+qHutzbibi424Vrd5tfItCB1Jtd5IVIrQaEvRlF
	P3s1nMZEFdJySNcz59ndKEVsOl4i6LRXZICYED5O86h1xUg2YjnmZg0F5d6N7df066Ehu9mDmIw
	iMYG9S+8ADy0ONExOVyzld9JT4CuSetSZ4dc63hMB
X-Gm-Gg: AYBFou03NHDDdPUNUz0ptv994Js32OmG0kb3/2mvwYNV3ST4GmwqKQDIheW3xM8LGi8
	g+Kqyq7YXuGvDPE4jeS15NfaO7N18B1+DBERYoMq7nE0lU2ZUBKUP51fxS31V99ULG8LA1XtLUC
	OHppC2gchqu3sGHrx8RkebaLLrSwEHErQen76VKp2K3fHROXHQXnRV7vFmiHJElz+KFOKJPWjrm
	pEz1CShLkCqGQeMlIDwzH8xptafvLP7AGG1/tJwzY+cKAe6aepTY+Y1U3e3hgIC8Q3FG28qZ4gL
	Ao8xzGGWr+upAfihCUVCNLoD87lad10Lqs5IBj1FuEJZGE476GEqkruEhYhSstJKDgp/MqUiQvD
	QUcQUYHY37nuqgRrcaZOyMe4nEEuF4PPHyVM36F4FU0UvCyjnXaYazm5/pVzEJsnqXAA=
X-Received: by 2002:a53:ac8a:0:b0:679:9afd:c0c7 with SMTP id
 956f58d0204a3-67ba508d24fmr864212d50.126.1793345320085; Fri, 30 Oct 2026
 00:28:40 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261014082037.1774672-1-wenst@chromium.org> <20261014082037.1774672-3-wenst@chromium.org>
 <7020a7a6-332e-4fd0-a659-d82eb768614c@linaro.org> <CAGXv+5G1kgyumbj7wGf6rPFbg3spSO0zYmEkn-hZT4qUdJbytA@mail.gmail.com>
 <03375a31-0ac6-47a4-b0dc-6327080e1622@linaro.org> <b4c0761b-34f2-42ad-97e7-ab34ae776281@oss.qualcomm.com>
 <8d4d3ec2-3c97-4a46-97f8-048fdf81b853@linaro.org> <CAGXv+5G_ig=k-eH8Cp0ES70WxTHcBS2TVj9VmHaG9caROiAuQQ@mail.gmail.com>
 <8ceba969-91d2-4b43-81d0-b26e7139664b@oss.qualcomm.com>
In-Reply-To: <8ceba969-91d2-4b43-81d0-b26e7139664b@oss.qualcomm.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 30 Oct 2026 15:28:28 +0800
X-Gm-Features: AclHuK87PpF6mvOIXqHCbuY1WKimiNRH2tQGnceMsfo-UR5TI782gxdvYJm286Q
Message-ID: <CAGXv+5GFogx_kS=N1t8-SFTp+HyxLtoHzhnL6t8Zn0GBiqMoKw@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: usb: snps,dwc3: Fix downstream port numbering
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Felipe Balbi <balbi@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Sven Peter <sven@kernel.org>, 
	Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Ryan Chen <ryan_chen@aspeedtech.com>, 
	Billy Tsai <billy_tsai@aspeedtech.com>, Michal Simek <michal.simek@amd.com>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Peter Griffin <peter.griffin@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Yixun Lan <dlan@kernel.org>, 
	Troy Mitchell <troy.mitchell@linux.spacemit.com>, Minda Chen <minda.chen@starfivetech.com>, 
	Shyam Pandey <radhey.shyam.pandey@amd.com>, Wei Yang <yangwei1@eswincomputing.com>, 
	Senchuan Zhang <zhangsenchuan@eswincomputing.com>, Hang Cao <caohang@eswincomputing.com>, 
	Li Jun <jun.li@nxp.com>, Peng Fan <peng.fan@nxp.com>, Roy Luo <royluo@google.com>, 
	Yang Xiwen <forbidden405@foxmail.com>, 
	Ahmad Zainie <wan.ahmad.zainie.wan.mohamad@intel.com>, 
	Robert Marko <robert.marko@sartura.hr>, Xu Yang <xu.yang_2@nxp.com>, 
	Wesley Cheng <quic_wcheng@quicinc.com>, Stanley Chang <stanley_chang@realtek.com>, 
	Ze Huang <huang.ze@linux.dev>, Aswath Govindraju <a-govindraju@ti.com>, 
	Roger Quadros <rogerq@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
	asahi@lists.linux.dev, linux-aspeed@lists.ozlabs.org, imx@lists.linux.dev, 
	linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, Mathias Nyman <mathias.nyman@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2026 at 5:44=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 10/15/26 11:00 AM, Chen-Yu Tsai wrote:
> > (Cc-ed Mathias, the xHCI driver maintainer in case I misunderstood xHCI=
.)
> >
> > On Thu, Oct 15, 2026 at 4:44=E2=80=AFPM Neil Armstrong
> > <neil.armstrong@linaro.org> wrote:
> >>
> >> On 10/14/26 18:36, Konrad Dybcio wrote:
> >>> On 10/14/26 11:44 AM, Neil Armstrong wrote:
> >>>> On 10/14/26 11:29, Chen-Yu Tsai wrote:
> >>>>> On Wed, Oct 14, 2026 at 5:28=E2=80=AFPM Neil Armstrong
> >>>>> <neil.armstrong@linaro.org> wrote:
>
> [...]
>
>
> >> How about the USB4, does it use the USB3.0 port ?
> >
> > I'm not familiar with USB4. A quick search says that it can tunnel
> > USB 3.x, DP, and PCIe, and it doesn't have its own USB HCI defined.
> >
> > So I'm thinking the USB4 controller would be more like a nexus node
> > or multiplexing node, or perhaps like a USB C connector. It has input
> > ports for all the protocols it can tunnel, connected to their respectiv=
e
> > controllers (XHCI, DP, PCIe). The binding probably would be very messy
> > if one controller supported multiple outgoing ports, as each downstream
> > port has a 3-to-1 relationship with its respective upstream protocol
> > interfaces.
>
> Yeah that is more or less it.
>
> There needs to be a connection between the USB4 router and the native
> (USB3 *port*, not hub | PCIe *port*, not RC | DPTX) protocol adapter
> where the tunneled packets end up at to create a PM devlink between it
> and the USB4 router.
>
> ACPI does that by adding a `usb4-host-interface =3D &reference_to_router`
> property, for DT that's still undecided:
>
> https://github.com/devicetree-org/dt-schema/pull/196
>
> As far as the Qualcomm implementation goes, I was hoping we could
> go forward with base1 numbering as the DWC3 is an XHCI controller:
>
> https://lore.kernel.org/linux-usb/20260929-topic-dwc3_tunneling_state-v4-=
0-63e296346d57@oss.qualcomm.com/

I don't have DWC3 manuals, but assuming its internal numbering follows
that of XHCI, you can't just use "udev->portnum - 1" in patch 4. That
is the logical port number on the root hub.

Instead you need

    raw_port =3D usb_hcd_find_raw_port_number(bus_to_hcd(hub->bus), port1);

to get the 1-based port number for XHCI.


ChenYu
