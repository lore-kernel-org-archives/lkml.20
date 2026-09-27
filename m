Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA41937C109
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 23:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790550070; cv=pass; b=V2y/sZGXFdEn5APZ0fPrdca3kSoeuhCPMWGpJywXVpJFeEkeRDNRiqBk2SR80wxPtGWyQsbzgy+zw/mh8TU7WO8Juy8SWXDosE/5sLU3/3M1f0/ytMmck50myI5x1IVBOu8Zk+WSj1zMy1GQL1Tsrr9gyucd8CTUIeX+XeUoI2c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790550070; c=relaxed/simple;
	bh=JCpwn/WWICwDSoLBnOOTTp6gTS0SfU3IsgvUz7VJvnI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ayUZihYgfOz+PGWNPaFwN6EfGAfceu90kU50Kwsw4fN9IuyuxK8aQPVLTEEbwcFDJPiUOZ2pl2OX/G8/zD2zhn+jBsFuTePUlAru/WYuEBSoXgcsY4BnWVaY3LOdaVO3wSMDj2jFye9yJRUMq8f7HVDpdtssxW4SE/biIvIzs7U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=InaRM3Pg; arc=pass smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="InaRM3Pg"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ffe281cb1so6309865e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 16:01:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790550067; cv=none;
        d=google.com; s=arc-20260327;
        b=C+cbUkZvOC0he3kVgbQkaI7HJ+8LTDywdgOVKswaB185lj6u8l98cbqjw5C9yIpWNX
         1CLkm5DnYuOHxCjr1/LTniVhQxGKy0fcdv2m14jNCtMqXYVjJkUYyUweKmWSP7vXPwEC
         GG5XUPseHg4avz4VLbPDrEOtLsLR0n1fxeftLLo8LWtzNK9zRYn72moVaSw00m2SqOdu
         aQZ1b1bL1egcACtpvXPMcGipydjlgjhLw6V+WGxfJyR2yAjfYYt7OqBibotwghvBsYWj
         eSQ4zX9hUNge+ml77jXeMkx8r8/uimS95Jcmlz0tzC4pReWjCKGMVmHR9s9LH9YhhItk
         ij1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pC1cDVE6Id7bEPJ+YQ1AhsXzN8ywZhzrUwp85FIkVFE=;
        fh=isQHQ0uYNGixRae6UKFI/bmeTHKZ6f+R0xIxH7rsr1g=;
        b=NTuQ8KUF9ZdYHXQzqa5iNdMZtxs/kIaScxvnNqjt2x21f1ZMCzKQb9rFw+tTlQ8Q15
         YWeFU+0lanV5oY6fXfNdOFCE02kuc8S4N0BrFD4258bQ8pTCwXHVjWxKxkMfMkoIE6Js
         j8Z9A6tFYqxQ3q2D5pay5FPj+ENBctUR2KJ3mmBu6sjgY/ambAi/AjxotW+6XLsB+9L0
         0ZLI7CMahcoUTIArrd46awwomkApiRikWx5IjhYItc1WSGfOQyg+z9gkLypP4ZfPcAB8
         YMuMQD7HqjROuqRiEGl7jVskDsAHuczpGxziW1nciZCjRzXNrfxZx0uwwN9EZ9YAfytO
         xdiw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790550067; x=1791154867; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pC1cDVE6Id7bEPJ+YQ1AhsXzN8ywZhzrUwp85FIkVFE=;
        b=InaRM3PgpHKQsECCIra6A9YmBRSU1CMHlqJyRd8yeerQpCQvd3hxYGeJLq952g7t1l
         FImRr7qA0/AGrx7QxUnbOU5d+BnBCmYSQDEWuFNqPIHk4mX5he6yGEJjtkkqlgcKoMQm
         hm4goQmzW42wUPJqgLA9xR9+tJoKcep0QWKiBqTFJYVpgTDFyltqbipx21vYM8cTsDSr
         xiYygf5JmKi3LurfHIfc7IdCgY1NFg+SvB09aBBFguhRYLgn5GNFCXRHNfmSiQmnsKXD
         ReVm9SKwMqKcJWhtslwaJlV2MAj6XX8/EKaL7sU3COjGjb59ORyKDIdhKESRex9q91BC
         HQkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790550067; x=1791154867;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pC1cDVE6Id7bEPJ+YQ1AhsXzN8ywZhzrUwp85FIkVFE=;
        b=ICtEQ12hRKFlAUfyK1IuUKyX/Yu+yCFsfor59oPfXdQdDihdyyTkuelb6I1IvNYsET
         XgCaCkKsRYT0jPN1Jz8JMGO4o5JdRiKymLmNzzBQY+yTQKXQlE5pmBYyFSs36Pi+h69A
         ab+Ha8jRCCtnXRSu879anWBWVjrwExpfXDsepr8dvO/RgD//lJVxkL+Q9heQLGfrIg7n
         5oU4fjN+J0DiX6gFCug6q3OWAOUf2kQr7AIMwZy6qPT0E/0bZNnzFcJ8MgV3gLsXtw5c
         THGulQGnQZCWKC/E62OF7yhopEMpD1Ied7TFMwqUxwSpkrSHI7Ad0QNNx1ZiC+VbVCSs
         EWDw==
X-Forwarded-Encrypted: i=1; AKwUvBwWesTOvfA5cGz54gHmf9AT2SqaWvdzvRbpNcbwb2bsI+t3IfNNdCSIXtf5kR02SpCxQ96tp99G+pDDNWs=@vger.kernel.org
X-Gm-Message-State: AFuF++mNM/pLeiTgbUHjdX0TDQxUXwaxVvTp4b3OuqdeyeNu2crwr3wC
	zakcBxAY4tUV1gVl4OPF/iUSnx0spHk1CvmkagjPbktFvXGquGaIbRNtDbMyI1S3L9NHY9lDMtb
	0n49XKtnuRWwyvjg9+NP+HcBxy8dT55U=
X-Gm-Gg: AYBFou1baGCK19v00ODxBJkLbzHoxVhUpr1jmqjarFvgaKCYPt07QalBTMtqhBfc1dY
	x6UrYsvPnJg6pWBy7LE1IeiGogw9yGxAYTlJxs7nYpGk/PksGOEpj+a6D9MZnxkOexq6A/0Y0UT
	uLTo/oybMR7Nxlna+s8lfSW2lVlNcBu08TSNk1BdCxZPusm3ueu7CMAWaLFOevLyXYppDiSP4GW
	wo2FF7xNSM+/QcL8bqkpOC2j8c9OKnGbP8Za6b9tpTmGC/SN8kQpRemlRs/AqLvbLuy8jEMITvi
	BctOBDR4tlzQ6is6L0p5kAf7IV7nTV1K8cNfqq7GxYX+UR6qXDQ4Zx+9v1UiG03zq7/xcRZGxyt
	Pt++Fz6hmZkjaVs/0fGCMy4ctoXpWdAxaEh1bMHDufcN1DAzhBkZ3NJ2Mp0VPkmo3pAyL+CoC6w
	==
X-Received: by 2002:a05:600c:4f47:b0:49f:c199:e1e2 with SMTP id
 5b1f17b1804b1-49ff06ed9c1mr170160015e9.28.1790550066832; Sun, 27 Sep 2026
 16:01:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <TYCPR01MB74815955A10817B64BD6FB93A4812@TYCPR01MB7481.jpnprd01.prod.outlook.com>
In-Reply-To: <TYCPR01MB74815955A10817B64BD6FB93A4812@TYCPR01MB7481.jpnprd01.prod.outlook.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 28 Sep 2026 00:00:00 +0100
X-Gm-Features: AclHuK9lqYCvHMC1AiAR3XuaDXFU85jazCSKt890eRq6J5XWeWZVuaVBpqASpBo
Message-ID: <CA+V-a8vOrmXpr8Nx9aiE-D4axAQNf9oKhSgHaQXqdjE-bWeyNA@mail.gmail.com>
Subject: Re: [PATCH net v4] net: pcs: rzn1-miic: Clear MIIC protection state
 before unprotect sequence
To: Yoshihisa Yamamoto <yoshihisa.yamamoto.xn@renesas.com>
Cc: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>, 
	Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 24, 2026 at 11:45=E2=80=AFAM Yoshihisa Yamamoto
<yoshihisa.yamamoto.xn@renesas.com> wrote:
>
> On RZ/T2H and RZ/N1D MIIC, writing 0x0000 to the MIIC protection
> register clears the protection state machine.
>
> The initial protection state cannot be assumed to be constant,
> as it may be influenced by previous activity before the driver
> takes ownership of the hardware.
>
> Clear the protection state before issuing the unprotect sequence
> so that register access always starts from a known state, regardless
> of any previous activity.
>
> Fixes: 7dc54d3b8d91 ("net: pcs: add Renesas MII converter driver")
> Signed-off-by: Yoshihisa Yamamoto <yoshihisa.yamamoto.xn@renesas.com>
> ---
> V4:
> - Clarify commit message
> - Point Fixes tag to 7dc54d3b8d91, as the issue also affects RZ/N1D
>
> v3: https://lore.kernel.org/all/TYCPR01MB7481CE8351FDB2CDCA229955A4872@TY=
CPR01MB7481.jpnprd01.prod.outlook.com
> - Add Fixes tag
>
> v2: https://lore.kernel.org/all/TYCPR01MB748157ECB6B92D8E3FFD433BA4B82@TY=
CPR01MB7481.jpnprd01.prod.outlook.com
> - Fix indentation
>
> v1: https://lore.kernel.org/all/TYCPR01MB748139F059DF2459B9813416A4B92@TY=
CPR01MB7481.jpnprd01.prod.outlook.com
>
>  drivers/net/pcs/pcs-rzn1-miic.c | 3 +++
>  1 file changed, 3 insertions(+)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/drivers/net/pcs/pcs-rzn1-miic.c b/drivers/net/pcs/pcs-rzn1-m=
iic.c
> index 2b72fa98ddf1..279f709c889b 100644
> --- a/drivers/net/pcs/pcs-rzn1-miic.c
> +++ b/drivers/net/pcs/pcs-rzn1-miic.c
> @@ -270,6 +270,9 @@ static struct miic_port *phylink_pcs_to_miic_port(str=
uct phylink_pcs *pcs)
>
>  static void miic_unlock_regs(struct miic *miic)
>  {
> +       /* Clear protection state */
> +       writel(0x0000, miic->base + MIIC_PRCMD);
> +
>         /* Unprotect register writes */
>         writel(0x00A5, miic->base + MIIC_PRCMD);
>         writel(0x0001, miic->base + MIIC_PRCMD);
> --
> 2.34.1
>
