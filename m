Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793815674;
	b=y0YDm0f7T3e6LV6P+IsIiYIp3bLBM4WrVCC9WL6lPDi3Fd8Hz4NbdeLMNg+fnB/hmikP
	 lYu/Eot2lgIFPioY9PytYbWsuBRAE4PwY9uS5bC8uA/YHaN6zlnnTqbtqRC7tp1MUoUtt
	 ZArnjaDlxkWsayHAroVgBRX7hs0Re2knDe1G/lnKJkUBiygxTns38HeUsZBP2hl/1qABm
	 Y60/GCmyr6PoqQtP3WyvpuXIkjWqDOIRvAhZppUOfqgA4gpkz9r25F9WjbYCdGHS4Fw2K
	 mD6MDKtc8cU4f4I4kjoyAJNL4BiZrsldh9+V1zKNAUVykzOD/2L6Ic09V1rr2uxwpsw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793815674;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=+gQ5Cuyj8b/949TwI5RgIKdEjddDg3DiMb9qtnYfCaQ=;
	b=NJUMbzZBIwkuAkHagkhvTtfIzPPSz/2S6++duuQRG3/sHJcfBJsbLsErwflZ726TY7NZ
	 MISwrEYnrY3kHR79ZeoJMaXFp7puSgiQAM7V1zgXfZfIbFkQLhUR6h/MC9s2gZt2WU98p
	 frXUcXXe+0aTqf4WRHND5Q3g7hYaNAVq78r81LSBqcowHLU5bvzlR6SPXTrB+WaZcUzll
	 Mzp0NRvw82ihT9Mx6oqUoD2nf8P0aRWl5xwein6lnlBABMSEEbCFcXRRYMNVABL1ch1nf
	 5BFb7DTtOJNw/YKgtS8pDE/hlL8yhaUao5/EbXfnGd2yEzp+ePVRJXtrSQI1EA30XTw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OC0GfPy8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.181
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D7AA607A3D0
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 18:07:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D7AA607A3D0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OC0GfPy8
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5eac6c5f927so440154e0c.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 10:07:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793815672; cv=none;
        d=google.com; s=arc-20260327;
        b=XLdzQv89U9uRciYDGsLuIwRkBgpvueMUO2SodcIyHzpuC0h5DW30hSVS31Nya4qLvP
         BR4q8HkH5IR1w7AyjqblCZDYYzyYiNM5rd+IrJwmTICi71wC9huJCM0Azkz/V899r7FS
         Jwad061V+q0qscFigYdfaBS09xzk7nWEeq1ZkAAwhheSVKCwqyUiNKt5C13vQCOHtTaM
         CTleqyYrI9vJoIHageqOG9t06/wOuzp59l8As1MuAtpf/d/TAUqxykIspK+g18RipJtk
         TMjonZid4487PkMFpXJH1FqmdlI1rg004O8A3yBYqO07lXysFFzzjW0muLl5wuWi71AC
         xn5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+gQ5Cuyj8b/949TwI5RgIKdEjddDg3DiMb9qtnYfCaQ=;
        fh=WME8ARtBT/DJZ5yfHSOFx/Aufohbo7wOGQgOyHsKMQA=;
        b=SDYL9d68mRrYYAHtS1FbIyKxIUpPxzODDEkFaNKxukPPMs/jOTOM5xAeGwLFOvDj68
         F7GCROIkkkPJVJqX+sCc3qZoMNf9UaQ6RNMcTJJ60rLuhcIqsUN3rUXbPsEw2VwF2hE+
         qVYue/DZ18PCsspCivD2WOWH/5q6KVKDMhgcBEcuW023mtLPJsq4Wh+9AcVyzYOr96+e
         SMShO2ygkrYDPvzLPbkKjIrLq2D3BOZPQ4Pv58IQxX/Cs+ehFYV6+H4G2eXWsa5vkAgk
         B6Knz771Vh/558P7de+78CYyZGpyc64kW8OXiy+xpAEQ5DSTIjqPyqw4sCpIdL8MGSrY
         8+4w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793815672; x=1794420472; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+gQ5Cuyj8b/949TwI5RgIKdEjddDg3DiMb9qtnYfCaQ=;
        b=OC0GfPy8B6coBFfqqPUhLTgXstjsDDCFbNUJMZTVIqso3hvWFKF0azN0fCUDbJCAAU
         wfCT/GZi5JrYt7lLimUB14AzLYhqnKi4F59ReUFe3H2Wqu3KJl1X3yj1oYD9Gw9fHvqo
         qAHOEnBm2uSSdcMiOEflwxmtfXlFNzD+EsyHYZY5Vt5h4ZYcy7uLUmVb+3jq4a4wL8wR
         MD+Nt/Oe+x8mwWyqP5gaQ6ziv6Sx5dsVMCc3yi3OBc9th0Lq0RA4mVEcC9UWE20fBQGg
         POAUoS/anoBEGQPi8B4zcNI2L65uHATBiLA6pGDRKqHH2RyPejN6je54qH189TLi3g9B
         nW+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793815672; x=1794420472;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+gQ5Cuyj8b/949TwI5RgIKdEjddDg3DiMb9qtnYfCaQ=;
        b=OY4Xanvs6t8mlWUfPwGSCLA1PzfExsmr/+Ty5rmBqSeY8qWpiMVETT5gDFfpfEDX2E
         MfId11+nACwPr592wEQOJVYSG47uhzbDPTBYyIVQbamSmuV2RZtNzT1Y51ksk21o5kdR
         VAGRSLgGk0SPpoeiTOgq6Ou9VuPqGkME+W81D2AIUI48CEzZdDflor3U8Og/+SlPc0ca
         oYarKycMKcZ9DsFT03ZsBOBGUytnpO1ueQ01ymOTMotfChMaS+5/2dQ4c/e07P8p5gQt
         5TWNh0Yvu/7VqmWG3tNiRnUxMzwUzfKc2Z955B+x53aP2X46rsCUzsgrjKZWaHVB4pEP
         0WWQ==
X-Forwarded-Encrypted: i=1; AKwUvByeircvewH8irVZSekbtS3zo9GHN9Z/AvH+al5khbU0dtKvT9N5LLKVdCkC5hPBMlz8Pig0fp796slu4LE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/tq6gHl7a8H8qoq2Hr6ocSOBSzydde7lV6M11QOe0Ix/LH8pG+
	e5eYCLZE9cWyTj5HBdON7n+UnKY3TG43as33KLf8NaxmJb1Y7oU8Du3JV98WR8UA3txGZyg0WXs
	59S/Ow4L6BoM8nqQ4osnTxwRnU4wKDtc=
X-Gm-Gg: AYBFou0YJlUUAveak2KWNRNFtLlZyUPxPsku3w9z+WaxVGhvGQEzbCQC+Hzq+E2VRbQ
	wtZHdJgGA0EDV7MPLSYY8i+VXLsQ9Jue+1TwsNzzrsy9IielP1rAqiQWJxuEro6mkIWRtQNUY1Q
	kgFq9ky9KU96MFN/Kt3T7tlxBsYApk4ulj/bg6qu9Tml++o2aVjWNX7Gyor7lV2gFqY/6Coqwg4
	IB7gblutxQU0cnc8eJCzXP+HYBAIBzVzN5bcjhuUB57XvnAx9gvxYc87W30AGfQC4sSpoGsS/xP
	ZAQO0xJ1QjbI7fJeg+VArCXtzRj/vGViJrQh8+SyMIPJ26SvCfDYiYKhNYR8IwEjFQfd02LnSRB
	XMm/dfmpK2ATF47+Mffy3zFmaHa8ABfjOoCwryKmdvmtzhGHOXSCab/1q9DxlkMI3uhIdfBYQPB
	VQPPdb8/1hBbaUwF6Sl8coHX7/h/uLAc0Gv2bgRkyyDPTG+mM/qV6x5arzUuyPD/wtL/3GzeMvk
	MIlH/4sIDcpX+V5QU8PpUCzsd9h2FrQwY2p22rxyhsEi+3QfVI=
X-Received: by 2002:a05:6122:1794:b0:5c9:a60d:3275 with SMTP id
 71dfb90a1353d-5ec6894bafdmr7258349e0c.9.1793815672343; Wed, 04 Nov 2026
 10:07:52 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103-submit-h616-uart-fifo-v1-v7-0-c9e248d685c1@gmail.com>
 <20261103-submit-h616-uart-fifo-v1-v7-6-c9e248d685c1@gmail.com> <32461e0e-2512-451a-8eca-f2df63553379@arm.com>
In-Reply-To: <32461e0e-2512-451a-8eca-f2df63553379@arm.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 4 Nov 2026 11:07:41 -0700
X-Gm-Features: AclHuK8w6f78lagZOCqY3kBXvDEG6Z5rWFvxVoRwnTwu0OTjK9VJe-pup1TnDtw
Message-ID: <CADvTj4qPfWo=w0khBM+vPfT4vxCJVBQsqzAE3C9V+2J7fwq9gQ@mail.gmail.com>
Subject: Re: [PATCH v7 06/12] dt-bindings: serial: snps-dw-apb-uart: add
 Allwinner H616
To: Andre Przywara <andre.przywara@arm.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 4, 2026 at 3:59=E2=80=AFAM Andre Przywara <andre.przywara@arm.c=
om> wrote:
>
> Hi,
>
> On 11/3/26 22:39, James Hilliard wrote:
> > The H616 UART has 256-byte transmit and receive FIFOs, but its DesignWa=
re
> > component parameter register does not report the FIFO depth. Its option=
al
> > register layout also differs from the generic DesignWare integration.
> >
> > Add a specific compatible to identify this fixed configuration, retaini=
ng
> > snps,dw-apb-uart as a fallback.
>
> I think we should not focus too much on single SoCs here, all the
> Allwinner UARTs need some care. We should have had SoC specific
> compatible strings (plus the fallback) from the beginning, but we
> didn't, mostly for historic reasons and because it just worked (TM).
>
> So just from looking at the Allwinner A10 (the first one really
> supported mainline, since 2012): the manual reports a FIFO size of 64
> bytes, and it has none of the DW config registers.
>
> So I'd suggest:
> - We add compatible strings for *all* Allwinner SoC's UARTs in here,

The current series covers H616 and A523, but the setup is structured to
extend to other integrations. FIFO-depth discovery is separate from the
shared DesignWare RX-trigger calculation, so adding another compatible
does not require duplicating the threshold handling.

> regardless of whether we currently need a quirk for each of them or not.
> This is now regarded best practise for DT anyway, we just catch up on thi=
s.
>
> - The FIFO depth is all over the place for the various SoCs, and most of
> them do not implement the CPR register to announce the size. So we
> should use the already existing generic DT fifo-size property to

v3 actually used fifo-size for H616. Krzysztof requested removing it
because the fixed 256-byte depth is implied by the compatible [0].
That is why subsequent revisions supply the H616 depth through platform
data instead.

The earlier discussion also covered UART instances with different FIFO
depths. The feedback was to introduce the property when an integration
requiring it was added, rather than require it for H616 in anticipation
of those devices [1].

A523 provides a different way to handle that variation: each UART
reports its depth through FCC. The current series reads that value,
rather than putting either a per-instance size table in the driver or
fifo-size properties in DT. H616 does not rely on FCC and retains its
fixed depth.

Linux already reads fifo-size into uart_port.fifosize, but supplying the
capacity alone does not handle the other integration differences. The
H616/A523 setup also avoids generic optional-register probes at offsets
used for Allwinner registers, and installs the FIFO-relative RX-trigger
table instead of using the static 16550A thresholds.

Older integrations with a fixed depth implied by their compatible fit
the same model as H616; they do not need a discovery register.
Compatible-specific data supplies that fixed depth, while FCC supplies
it on integrations that expose it in hardware. Adding fifo-size in
those cases would duplicate information already determined by the
integration. This is why the current approach uses those two sources
for the FIFO depth and shares the remaining setup between them.

[0] https://lore.kernel.org/r/20261027-nifty-reliable-octopus-6cbac5@quoll/
[1] https://lore.kernel.org/r/18f1e637-48de-4962-8a13-65f6597eb2dc@kernel.o=
rg/


> describe the size. This is the simplest, yet most flexible solution, and
> avoids hardcoding implementation specific values in the driver. And it's
> friendly to other users of the DT nodes, be it U-Boot, the BSDs or
> whatever else is out there. IIUC, that should already work out of the
> box with the current Linux driver?
> Since we need to touch the DTs anyway, I think this is the best way forwa=
rd.
>
> Cheers,
> Andre
>
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> > ---
> >   Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml | 1 +
> >   1 file changed, 1 insertion(+)
> >
> > diff --git a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.=
yaml b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
> > index e2ca126d58ba..fc1289073241 100644
> > --- a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
> > +++ b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
> > @@ -60,6 +60,7 @@ properties:
> >             - const: renesas,rzn1-uart
> >         - items:
> >             - enum:
> > +              - allwinner,sun50i-h616-uart
> >                 - anlogic,dr1v90-uart
> >                 - brcm,bcm11351-dw-apb-uart
> >                 - brcm,bcm21664-dw-apb-uart
> >
>
