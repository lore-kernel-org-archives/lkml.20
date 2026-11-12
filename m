Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794470408;
	b=ItEKIQ6z8toiRbnZXuko8RYW2tMBI7qX+F4QrrCfTGSk4hZ8cANaW0gnzgDGyzvJHyR8
	 zbgEmrIl9y1Jsi0O0/64KjabNDz2kWyQm+uN91zNXi0qWCJouFT++EYfC8w6/4QVds8Nv
	 rLCNR2k2FCcG62ERDuGRAc1mmjzmlKy/29DKTV949ywVqsQy0jLovvDdW5u/NMpY3ZomJ
	 YJ45pl9lsctOEmktBRhxekezkgMNHwdoJex6l/mPZlzwMdhIEq5ZppuGhHMFbeWSj9gTX
	 4Ak7kAlOnOaqHUFuf7FnqNmzyo8WD7Oxi8aYpI3zVqcaj8rkipFfeUnVT1rWq2EiTGw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794470408;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=IjS6O/6wPytjumUu5o8Aw/uVJLfMkPnSofGe6KzvM0o=;
	b=iDAeE7wPIGghNs9H89JZkMwAa1Y//7Yi23NWr647L3bzbz1Ze3nmtBHu+f3bRVyT809i
	 8pvV37KKNBhIvijCjRDLAOYQUYNAvcsrF00E+IBrqpDlUq/uCRkUyisrQ5B0YegpLpANk
	 Btfyx2A453MKb+IPHuAE814ZHDJY7D8K4KQxfflR3brYfd0rzW13k4NuGVBTAWQpxiuzV
	 WSRMR6KOULLhxf5Bx33IVvnuUe8gTu6HJtUlWupkDqgTp2x8iOTqQ9PT5YCX+KaJdkqlz
	 gBUNDvZP0XzqpMtKPJcOjOcb3n1wKpyy72LOyniK3lmvzgEsBZrNZejEjld4I3z0RXQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GIQVWYj8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.172
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D15B606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:00:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D15B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GIQVWYj8
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3adf89523d8so2024821fa.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 00:00:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794470406; cv=none;
        d=google.com; s=arc-20260327;
        b=nk0+OuU8U+crDlDRzGoJfPxINE0dM2/yFORIIh/zibSgcS2xh365R/wbIsApU/cD8k
         no/L4PNU8xn0jlYhSFsCHz9h0Vfxkb0959mHalsoerot6MuwCkpPkzNaFK+PxqAne3ZY
         hSU9ekEiKapqljzefTyN7nfNkjisXsQfJNUyYCp6GkuVcm5MTdKVah5kMph2n/mVYh0a
         s9Li7HetE17nVR+IJCn2sN6CytVriUdZGNvAqQkvaG6gmzQ2GpKwxR7aaxag0YVr7BjV
         tB80Ps9PuLUAHe/1z1AadbbekYf2cFX/XCZNFYVhxRVe4TEX5ibStyv45KpoOKQU6pw+
         MRgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IjS6O/6wPytjumUu5o8Aw/uVJLfMkPnSofGe6KzvM0o=;
        fh=9ZQD6vrC2AabOXtQH2y/3IlmzY9duaNmTFfb2ASxJK0=;
        b=SgkXw1hC2715seADTDnQCU0SegU3gapJSkbciaYSR9pF3dft1xMzkoefD4aHFyu8ao
         aQVEC8QirfbOWrO/pwBxNxKu/onPLIakv93CALvfes9vFeespqe+RYl5qcQavx/nGAkK
         hZMQC2dJbmmSRd6IvtUNUdUN4RsRQnKvyAZLh1hZGEnqch9UJqHubzhJ+giQdEmzuTEX
         kNLTjz9Xoi9F25hnxfXD7PNyCqRrKvFPhBoYsFR2TEYS2iOyESTyzbUdBhnR2PiHXwy1
         CGrkEoxxbXRmqvriWQYaJLMFvysPLo3QH1Y0VWPt8kEXUj9AGR56R4jrgGFhLqzTjlS/
         N/sw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794470406; x=1795075206; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IjS6O/6wPytjumUu5o8Aw/uVJLfMkPnSofGe6KzvM0o=;
        b=GIQVWYj8ZnSahGOCoPVd+jjkA2EUwTBSx8VikobH1zTBEohOrcSWHGBkOfHFsmVLqn
         lL6NTPpr3p5XAMWWnezU8yX+YeaYl2Vy8ylOlqj9Y6r61tntidyK1n1KZTjlCBgkfT0N
         BqLuOCoieu8CjECxn8HCttTDyoyctZ+FqCA958QArwTFRd9gS3+BuW0cr+HV3wDwpoLZ
         OGb2AZcQi2nBlwbOgaV5DQGZsw0+uyMqx1AZs9DUOhZX+Vr+Bj4Tq4m+0TOgabmVRK1v
         pLYBvpSsjNxAASwCn1utxnfQM965iro+s+trIIQv7WFI3v28PbmHbks8VQpVnliK39H/
         nk9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794470406; x=1795075206;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IjS6O/6wPytjumUu5o8Aw/uVJLfMkPnSofGe6KzvM0o=;
        b=tzVP7Qat0VwYxfRA3AalRXXL7+FpMywAiQyl+1GEteB5paqRMF1J2FMWOyYPjyR+Mv
         f/F9RRHcsS093K7MDHizqYillBYdJVI85uofFLLyFLJolems7AVZx1Zk4ILs2ZBc0r/F
         qWUiZT5rKXXYfzly6ze64r59r3wpdnz5Nu1xu+vr0u4FI+Ar/Kp/o/cB6NMlp1oph3Gd
         +uQWyeP8Y9LIGwRBOAVisHCC3GHdMrApKN+FzPcW1Wbiw4xUEc/VWbTaf4tU1gIcl0iS
         xuYhV2Idyph/gryBvAUh00tCmACXKLbDDIN5RFsgM3wd7UajtrzkO1/1IrSSUXLMhm6m
         5X2w==
X-Forwarded-Encrypted: i=1; AL+hErHMHLAC2TkMLMTF91IVEGvfumjBZ2JUwo/8JkIo3ks+AAfz8ripLAwdVVVdov0KCeygonw3kUfeXOafOy0=@vger.kernel.org
X-Gm-Message-State: APuU4Z908kjxv7nR5H7kOz73x2SpVuM2XTBHR+m0izlMm/G+YYeT3Z0k
	jFBwqmEAVZAqxhnWBqiuIc7fas72Hp5QZrqWkv4awsB3AFIwqC+4WjGhNhK5HF1wNjMfLpq+8p9
	n1H6T2Z1kwRjtdYhbUfPwj6R244B9tD0=
X-Gm-Gg: AYBFou1/xc0G/AuPihJC2jGAcxxXFSQrqV5nj6A3oyZuAZNSoyl5fuelG9VYcCFwNrN
	doAgCCgQSaymTUFPeCcK55YDJsNCVrLv3+1a0X5cfbuIY2nLDN6MgJZ/xOOmanebF4dUw2YKEWq
	T2UIRM+V/O/R5zLfek7faFf2hnXsYwmwvFumGmco3Zeo6p1fRAwd9ocnmPP34ehHNDZstRJVllK
	r8w8uBBy4fW1PyB+Kr+7HDcq4oIO7e/6kHd9wkMcyZsRGoTBpVGVc4IFrY3UJ4ynKhhDVqATfjX
	lF0s94TvocPSUoey/jehRHKNnrdYWsuV8eEmurqpVjkiRiAzFnHDlUseW69NcsZ8zNeZdtNna0l
	47lZ9yrety1oLfBYpuBuwRQNaicNdoCLMqVpFpWUaM6Q+o/JnncsS9/kOZv75Apowu8KcGTc=
X-Received: by 2002:a05:6512:32ce:b0:5bf:d00a:b6c0 with SMTP id
 2adb3069b0e04-5c15d61a7d2mr1922231e87.3.1794470406245; Thu, 12 Nov 2026
 00:00:06 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110-usb-port-pairing-v1-0-9307e29d2ed2@gmail.com>
 <20261110-usb-port-pairing-v1-1-9307e29d2ed2@gmail.com> <CAGb2v65goAuKgYu-849171FGeCxZ8Cq3GUxQLDLaHLbhRTMmqA@mail.gmail.com>
In-Reply-To: <CAGb2v65goAuKgYu-849171FGeCxZ8Cq3GUxQLDLaHLbhRTMmqA@mail.gmail.com>
From: Arun Iyengar <aiyengar1990@gmail.com>
Date: Wed, 11 Nov 2026 23:59:55 -0800
X-Gm-Features: AclHuK-RZu7t5oXW3B0hgGonN3UAbxzfPc39DI6ekhiu8UyR_6arhmtUrw5yX_k
Message-ID: <CAEy9hNV9saBWyKxuMR5unmLjzBM2+S7u+FewEevuLV-6yo1ztw@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: usb: generic-ehci: Allow describing the
 root hub ports
To: wens@kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Chen-Yu,

On Wed, Nov 11, 2026 at 02:35 UTC, Chen-Yu Tsai wrote:
> Would this patch covering all HCDs be better?
>
> https://lore.kernel.org/all/20261014082037.1774672-2-wenst@chromium.org/
>
> Also see Rob's comment about covering the port numbers.

Yes, yours is better: it covers every host controller, and
generic-ehci.yaml gets it through usb-hcd.yaml. Rob's point about the
port numbers applies to my patch too.

v2 drops this patch and builds on your patch 1 instead. Only the
Orange Pi 5/5B DT patch, which now goes to the Rockchip tree on its
own, needs it; that DT passes dtbs_check with your patch applied, and
also with 'reg' limited to 1 and up as Rob suggested.

The v2 cover has one question for you: patch 1 there looks the graph
ports up by root hub port number, while you have said root hub graph
ports should use the raw xHCI port number. Which one do you want?

Thanks,
Arun

On Tue, Nov 10, 2026 at 6:35=E2=80=AFPM Chen-Yu Tsai <wens@kernel.org> wrot=
e:
>
> On Tue, Nov 10, 2026 at 4:20=E2=80=AFPM Arun Iyengar via B4 Relay
> <devnull+aiyengar1990.gmail.com@kernel.org> wrote:
> >
> > From: Arun Iyengar <aiyengar1990@gmail.com>
> >
> > The USB 2.0 lines and the SuperSpeed lanes of a USB 3 connector don't
> > always reach the same host controller. On the Rockchip RK3588, the
> > SuperSpeed-only USB 3.0 host 2 (xHCI) is paired on the board with one
> > of the separate USB 2.0 hosts (EHCI/OHCI). Only the device tree knows
> > which EHCI root hub port shares a connector with which SuperSpeed port.
> >
> > The USB core already reads a hub's OF graph, with one graph port per
> > downstream port, and uses it for the port connect type. Allow the same
> > "ports" node on EHCI controllers, so that a root hub port can be linked
> > to its usb-connector node.
> >
> > Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
> > ---
> >  Documentation/devicetree/bindings/usb/generic-ehci.yaml | 13 +++++++++=
++++
> >  1 file changed, 13 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/usb/generic-ehci.yaml b/=
Documentation/devicetree/bindings/usb/generic-ehci.yaml
> > index 908b02d9175e..9dcba539d60d 100644
> > --- a/Documentation/devicetree/bindings/usb/generic-ehci.yaml
> > +++ b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
> > @@ -160,6 +160,19 @@ properties:
> >        - host
> >        - otg
> >
> > +  ports:
> > +    $ref: /schemas/graph.yaml#/properties/ports
> > +    description:
> > +      The root hub's downstream facing ports, linked to the connectors=
 they
> > +      are wired to. Needed when a connector's SuperSpeed lanes go to a
> > +      different host controller, which then pairs with the root hub po=
rt
> > +      through the connector.
> > +
> > +    patternProperties:
> > +      "^port@[1-9a-f][0-9a-f]*$":
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description: Root hub port, numbered from 1.
> > +
>
> Would this patch covering all HCDs be better?
>
> https://lore.kernel.org/all/20261014082037.1774672-2-wenst@chromium.org/
>
> Also see Rob's comment about covering the port numbers.
>
> ChenYu
>
> >  required:
> >    - compatible
> >    - reg
> >
> > --
> > 2.55.0
> >
> >
> >
