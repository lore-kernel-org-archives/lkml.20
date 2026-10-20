Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792485965;
	b=lpFO8ddvWit6Xt5B6bZaII6rG+UbCA6pErJJhgYiA3nALvoSBL7OYfVwIqUEuC2y53R2
	 Dj+cBYTUKlbRuQgg/BE072gBneCjYA/njARfQjBhZGqguzz6cgdpphKStYC3hjp5y7BJG
	 0kZOzkgUgEvwPiMFiEtIeLuEwPXrrrJY0jZNEx0z+ICsz3zGlW7LwQTtUPQ+e/SdZBU5+
	 NOn/RQSiTTQ6m4vTeD987XYRPraw2of6DLOxuZh1H+BNNRVitF0l4mo9Fkg2kMDU8Gwmm
	 Uqp+fVw9usAgC0BqszCy/Sm6UEeMD6mCjRXJjHv+EIlV263v+KqyGS/W8S/1ykL4NxA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792485965;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=dPaUlNkCPLziA90hnNp1lAWN/FLqY45sp3q9cJ5rzKc=;
	b=M4UTW5ibP4+BYH1IXhmq2BKJKxlHFQYEFdB4mBXzRVDp73CiuckvVMZiT+u+OStNFVvt
	 7dbE8wn9SMZ4LNIxMbdt59JDegBbBa5HP9PVFPTCB+29bmcnZTg+FlKeTiQCiCWHZvQ62
	 M6SnDgySbI5qBpAfz0umpCZc7oMUMgnEUtpAQHnecWDOusvNzZSB6cJdLFP88O798XdBi
	 K4wiOmCU6rOZZ6N9IrELJuzL0kaN7cV7m2Hcegvu/UaCNU2qS6DqZfITmihUjvrDiwSPl
	 598NACRkGwjPJJuafhxI6MikAGJKzPklMJXqydj5dGp0g1wdIaA5PGwxJWzEe/9zkfg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EOxh4Z9f;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59CCF60A2603
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:46:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59CCF60A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EOxh4Z9f
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48b042c0728so856245f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 01:46:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792485964; cv=none;
        d=google.com; s=arc-20260327;
        b=N/XhNHWfn66G11IClct8cUbCNnc2DnJuMSRflLRhgfqROK5Pl3o4gDjSTwDb/dPCdt
         yH3NczB6ExOBNFC7WzLnpbgTyuwETK/Fws2pgta8HCzrVhlADcPvBpsWE/rMK2DowvlF
         zTgnpmgdXosniflOLoLSgu9rcMvt9pgZnNvoJtn729+7uD/+hdt3s5zLmeKfVGW33IDv
         jV1HbV2HXh2RCaAM+pi+F3ZE7I3RF53PbWzCVSq4LpN08f5nLG/KYvaHToh/zjDkK4UK
         g//5CU0UsSXyCfBVVxk4aB/lOn9RkK5yDpkb1JmH3WgSeFqoA5VSXYfAWSB1xYMaShQU
         8zaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dPaUlNkCPLziA90hnNp1lAWN/FLqY45sp3q9cJ5rzKc=;
        fh=MOELC1KuT5gApMQ9O+TezGCrVNXAHdoho/y/pRxq1Yg=;
        b=Uh7XoxfxKA59G/pkGXMl1t0LCJ4zFyQIMPXeMO1TShqm7kZNOyFEGgqLr3ZI/AgdCB
         jDvS7C3GdqSz9usqqHW9QtGD/y204iaXsU/wdHnE07EfyyYaMVnCVXE15TUqB2IKp4D3
         RSJNQjsuX3txIn+HtV6jSu9TcwO6Btj7NRHpcvl9F6Gnu7D4qIevdNkj0J8TQ7Mp/6fo
         SLEJQurRcjK9B1/5TPAkRBjhtoR39AaXESRMz/pSKHfjY4d4Ih7AKKY0tjif+dtF614l
         ix08HstKJ/SUXj1+zx9+Kb/PR7T+9RkYufQHbL1HhaQRg0orflwranrO8X+0Q4I77+fU
         1Okw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792485964; x=1793090764; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dPaUlNkCPLziA90hnNp1lAWN/FLqY45sp3q9cJ5rzKc=;
        b=EOxh4Z9fRoRRWu9Bm9Z1tMLnFfM66s4Xo5FSgm6P97Ssxb2g2lliXffr40zTofIYnQ
         s9EDK4fYMTvAII44PVeoCGqdpxWOewXUdkwzhK0Scw78OW9ZRumBAGz7QGGl8Xi7A+gS
         7KEYnrbwreEkmc3lqEdsw+l3qs/LoVavXszWMkVq+aOr/fYv5yyJVehmXvT4cCDcB5vW
         V8/VvC1+G+WH9tZQV/G0bNtq+/gWXbAOf15ey+qK8wsBCsdUvaZjVipaPkI4m70fTwlX
         HoR798GKWTlqfKktrtQpdgwmrE/1Cfo7Kz5sQnKx20YzGWxuwB1j5FX+It3tmWUr8jfB
         oASg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792485964; x=1793090764;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dPaUlNkCPLziA90hnNp1lAWN/FLqY45sp3q9cJ5rzKc=;
        b=rBjOIrfSsv5xIzo18q1qlI/mvkwWH2y0hcIjzJiOZV7yotsLbHGffAsX50Y6guZ2I8
         yKkzqG53KuXqV8IJtl4E8B+nSdiDy27a3ccWoJDpT11R6S6wzhvDJZbr/UdGqSm4rDv3
         F2CPMuiw1u9iFyyz3fSl5yEty45b6N6Yd9DvyxO4lPFfNiU22+s+k9c4KLOMekjoZPTN
         TNpbtVHjlP/qKBLHPkG/PNhS5HBP69iWSEAX8TayUFdeB/6x3Okk0FB6nsyT8BKJsYHW
         Ke4U+dRZ1YYLx1dnpe/LvUSFOZGg4E+YgedwhUZFLHWpWNSZpim6/aXzYs13uGN7JniY
         /lPA==
X-Forwarded-Encrypted: i=1; AKwUvByyuuIk9HhKuovkEupr81xh6eTc3QoEvOr0nTtq5SPH87usbiSbiXP1uVTHhEAfrWf6Il53BQk0IPkNZ4k=@vger.kernel.org
X-Gm-Message-State: AFq9FYK0TfEywY8x36xSfsnC7TdvNCvTeY7au+VPv/rLWQGbqE5p5lNg
	i5etHYmzkxzRH+2TYnrx/2gUC+JZeO8hLORFPLWeqj00HlfcY3/ilQJXcDyMhIP1pBFlms4QVuy
	veSdUv0lLqH+/y6BCQ6gnhqfCWnHFP0M=
X-Gm-Gg: AYBFou2qDh/92ZsvJAHqdVtKfgWMb/1sV/P7nEGrLd+hy7fB+/yNxQGV5jrK7SOeCOl
	0IXd6gFASRno1eJEkqSGujCqMpFFAyItJQISAZSkeXYRu3pAY4R5eRANE0gLCfGE9dW7PPYH9ZT
	rORKwcedL52KEYY4JdGk3SE/ztTDTN3glvQ2epEk+dXqm6gHpQd3ZOfBQeV4GWTxo73NgkEvDjq
	k2RUM71thoiwL//FqngBjBRZ1wLL/CGRUPt98mk4hp8/Ec28J4bOpu2PhW2HnRyQUROTQWqJO7K
	bBABW/BEEw9DQHPUIDlcREEzP9mkDxXNkjMxu6Z6alygw4wqYoH/O1yWguARzY3v97spSVOVjVL
	sSvp4d+hUC7gMTyMTw3Sf0NVoBrGGooGOCT0B1Q==
X-Received: by 2002:a5d:5d09:0:b0:482:fd9c:3740 with SMTP id
 ffacd0b85a97d-48e07f98e2dmr24424365f8f.22.1792485963500; Tue, 20 Oct 2026
 01:46:03 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019065025.2146539-1-claudiu.beznea@kernel.org> <20261019065025.2146539-8-claudiu.beznea@kernel.org>
In-Reply-To: <20261019065025.2146539-8-claudiu.beznea@kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 20 Oct 2026 09:45:36 +0100
X-Gm-Features: AclHuK_0o_tLTtHRdwY1U_jUmzmwgKQ2ANnJ0QG91z7D7pQ5ZyLEGjAx2_i3mmg
Message-ID: <CA+V-a8sQe-bb7AEagc8QzQYVVY27+aVF2v=x1SxNtXQagpSOUw@mail.gmail.com>
Subject: Re: [PATCH v7 07/14] PCI: rzg3s-host: Use cached MSI address in .irq_compose_msi_msg()
To: Claudiu Beznea <claudiu.beznea@kernel.org>
Cc: lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org, 
	robh@kernel.org, bhelgaas@google.com, p.zabel@pengutronix.de, 
	geert+renesas@glider.be, magnus.damm@gmail.com, claudiu.beznea@tuxon.dev, 
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Claudiu,

Thank you for the patch.

On Mon, Oct 19, 2026 at 7:57=E2=80=AFAM Claudiu Beznea
<claudiu.beznea@kernel.org> wrote:
>
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> The MSI window address is already cached in msi->window_base when the
> MSI window is configured. Use it to fill msg->address_lo and
> msg->address_hi in .irq_compose_msi_msg() instead of reading it back
> from the controller registers.
>
> This avoids unnecessary register accesses.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>
> Changes in v7:
> - none, this patch is new
>
>  drivers/pci/controller/pcie-rzg3s-host.c | 14 ++------------
>  1 file changed, 2 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/pci/controller/pcie-rzg3s-host.c b/drivers/pci/contr=
oller/pcie-rzg3s-host.c
> index b0a150262959..6acb0231a067 100644
> --- a/drivers/pci/controller/pcie-rzg3s-host.c
> +++ b/drivers/pci/controller/pcie-rzg3s-host.c
> @@ -660,19 +660,9 @@ static void rzg3s_pcie_irq_compose_msi_msg(struct ir=
q_data *data,
>                                            struct msi_msg *msg)
>  {
>         struct rzg3s_pcie_msi *msi =3D irq_data_get_irq_chip_data(data);
> -       struct rzg3s_pcie_host *host =3D rzg3s_msi_to_host(msi);
> -       u32 lo, hi;
> -
> -       /*
> -        * Enable and msg data enable bits are part of the address lo. Dr=
op
> -        * them along with the unused bit.
> -        */
> -       lo =3D readl_relaxed(host->axi + RZG3S_PCI_MSIRCVWADRL) &
> -            RZG3S_PCI_MSIRCVWADRL_MASK;
We need to drop RZG3S_PCI_MSIRCVWADRL_MASK macro, as this now triggers
the below warning:

drivers/pci/controller/pcie-rzg3s-host.c:66:9: warning: macro
=E2=80=98RZG3S_PCI_MSIRCVWADRL_MASK=E2=80=99 is not used [-Wunused-macros]
   66 | #define RZG3S_PCI_MSIRCVWADRL_MASK              GENMASK(31, 3)

Cheers,
Prabhakar

> -       hi =3D readl_relaxed(host->axi + RZG3S_PCI_MSIRCVWADRU);
>
> -       msg->address_lo =3D lo;
> -       msg->address_hi =3D hi;
> +       msg->address_lo =3D lower_32_bits(msi->window_base);
> +       msg->address_hi =3D upper_32_bits(msi->window_base);
>         msg->data =3D data->hwirq;
>  }
>
> --
> 2.43.0
>
>
