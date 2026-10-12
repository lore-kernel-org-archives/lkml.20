Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5733E3CF1FF
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 18:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791831424; cv=pass; b=LG75C1KtYIQaS8uCl8sKztgxC+CcV4TeziSM9kutJz/8azdguLYbRcdcMGb4Ce43O9Sv0+/y+tTGnT98zoBEoU6hpB7EJUchcWJbgYWM/HVw87KYiXkdQkcJTb7yuNUHj53SfZNyXclWjB40LAK24GWGGkkNXW6dzlCcqHI57IU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791831424; c=relaxed/simple;
	bh=nMkb5bAZ7ybwAbgFArWE6KX2eaNmCxoRO1fDwwh6Qkw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l4GyfatC65ObWcNxMjGQ3fjFA4gSrjZJZEJZNVUrvebfZ3WTZId9PxbBvVtOSwOR70HmXL0p4PxgcHCot2mvQmIAmW1i3WG7n1YCOXwPTRxYPAhDri5QdyZCGgMGhbByRt7gq/wYamZXqWYS0FRbsIB5Pv6icZkKdAk6ybWtLmg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bxEMn19X; arc=pass smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bxEMn19X"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c31745ad205so687249266b.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 11:57:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791831420; cv=none;
        d=google.com; s=arc-20260327;
        b=Fdt6j06fhQtI4SXekvuT7uwIltUVOAGGzfX+7fBRS7m/WWsLJS7WAdz95m9f35MbZg
         +lM3AfEMWbO51kYTn1nPYTq/v5nINV3lAwwJqim815lzz8O586bzOiqiuSCE6WrG9l1P
         /Zmdx+GM0mS772LUOXAEZGfJilV5lLT/3iywRDJ/e04AuZhhKG4OKbc5QcIeI9lIrm2d
         AKeDEqA11IY9k2hGCfpzrQrfne1qnHZFPlqwW7j8fcJA+768qK0mmRK2vCqls1tBGzMb
         mHoKpS+yIkP0Mb3HNWuvV7jKWkahRWyxTz/rmpP4n5toAQ8GwLHiRQJFsVxu1FEoE+1U
         yKGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nMkb5bAZ7ybwAbgFArWE6KX2eaNmCxoRO1fDwwh6Qkw=;
        fh=P9BBQVzRDp5OZrvNMU8s0vqUvWMC0+qUkO/XbadWMAM=;
        b=eb+kM7R3dW3bEJoGJBV6kS6IHM13PzjIBmS/kAsBvUto6wG6RBTF3xizKXmBuQgVc9
         YNnoCRxq2Jr9WXSYjmeblwVUFYrc0oYoclc1Y8/D62mx5JdTX7S0+R9p5jukI/usaBXn
         5MhpVPJ17s0qF2BDSI0dJz+vMaGuqF2Vn1DnB+OA9sl7cMaRn9BXdyseT38vtLWHSadO
         WsSPl+9gIUVFgeY7SG2soxJj+dobFxEd2QEmLKgi0LMGnXdz03FTy7k/44FiKe3w5Ysu
         /eXKfawrHJApkmxYQh+vD2gcCbpZ109YEbEDy7nSFc2DCa/IwAa41+imnhp1MIjY+vNL
         J5NA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791831420; x=1792436220; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nMkb5bAZ7ybwAbgFArWE6KX2eaNmCxoRO1fDwwh6Qkw=;
        b=bxEMn19XS52JX/QLtpdQJA5Ijg6+QkF0DfUX5HfmJeeEvv7OSmrc8vTQhSozQX8C9S
         dlfMP+XEtzvP06O9OTONNK/TTOKC/zOTdDMhuIn4Mu+1fLYEejJKTdNGHO+B9X3z0PRG
         cX5TyxSobs+n0jq71nx80h3N6zFw+4ZCTqc1FzT8z9mxCYcpEtANTWCgm4F9cGrGB1Up
         3QSkJQNF1uXoaevPsiIVOhfRZL5vH9RE6MRqZ48Isu/xOFtxN2bWWK4ZR1JVM0XaTdtm
         W5fLzrwL79Cq2tE7UtCsE4ww/2g1+EzDPW9ziaixxuKDfx8uZRJS4z7I++VcAfdVNdaR
         hkcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791831420; x=1792436220;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nMkb5bAZ7ybwAbgFArWE6KX2eaNmCxoRO1fDwwh6Qkw=;
        b=0QqFbocN744CPkgVluRSxBb4rsCLU/E9PX8XZlq/nJ4dH/V7BZ69QyoWHjSMpKqPmk
         OjFUnzsrf/x4+bYc99fU9jIcuMQ+g7A0ByOObOAMXdRwEPd42TogKt+H7dQ99hJz8RPj
         NWuasp7Df4MS266qADTe9L4uwth0U5l2llr3jQMpVBjEffx1OVxpf+4Ny7qjU3MmDYW2
         LsaSCsJoS5+z2Noi6kylH2QI8FfGBUmJ+ZNyAaFZT642jnjLwcyaOhBBdy6dNupHoA4k
         9G95LTkdJcuWW474Z8obras/092jnkxzNmsUfsj5aoaq2xZOLgWoCjYIyaooNbeLBI7b
         jhkg==
X-Forwarded-Encrypted: i=1; AKwUvBzvJl7HELjnyCz070vN+HL+AvGq5a0ZohcvzThjeH5bAiQpylI1RWPMV3c4zCqUco+08ZN5E7jQV6lydKI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLIK+MwYPWrs3ax/p2SykTuA4x0H0wWc2Zrzpb2TRNP6Fx1Vp3b
	RIjsDCaKP4hDijw8Zn9cD8OAx4mr/zFbRD8ug+NAQv/g8yQBbB1IBxaiHEa/3TRahI/jHMA/a3W
	djvJ2Gez08m5lveBAgdo4Zv06gqwITQ==
X-Gm-Gg: AYBFou3GZmJacpDeK3hgCpxGmEzXHDoKur6sOBvpYav7juxWXHwfzo8IqWA3fWPvom4
	4MMIeohRR7cdngVR6L6aEbhjypHjqcvYa7fB7J8Udz0xah0DcscRXQqpVWcVIdJCpngjsj9Iqsh
	LwxgCaUQvsLAQ6crYtmO8RXI3zrR5saPB5JmtZE74hjM+KyJQ8uVxgsdRkiAXRuNvpKxTF2CaJL
	7n2DHQyfKx1lIotDDig0vd7fiKT0uqWNC2PkBwozyEMnNZ4eDN4OilWbpQeZkFVf3gUqO9xHch8
	F+P8Fjk4cbDC5lQzbxYAZE65HclR60dK4c6P4MfzIm7pQ9fkh6X3KQ==
X-Received: by 2002:a17:907:7b8a:b0:c2e:1e4c:35a0 with SMTP id
 a640c23a62f3a-c31a702fee2mr1083958066b.14.1791831420287; Mon, 12 Oct 2026
 11:57:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251220-surface-sp11-for-next-v5-0-16065bef8ef3@gmail.com>
 <M7kfFb5fz-WB43U_xCUwgxpmBJ4TNdp4jE6yFu6HmemIcDx5tXO6H4xnW_pEQz6DMkKm-3POdB9hIdB092zhGQ==@protonmail.internalid>
 <20251220-surface-sp11-for-next-v5-2-16065bef8ef3@gmail.com>
 <e0e9e690-c56e-4b56-90f9-2af46a7feaf3@nxsw.ie> <20251220-fervent-mamba-of-sunshine-f680a8@quoll>
 <571681d6-67f3-47fe-9a42-dce5aca13c99@oss.qualcomm.com> <6a90eb12-87c7-4942-9f18-6490a91cb0b7@kernel.org>
In-Reply-To: <6a90eb12-87c7-4942-9f18-6490a91cb0b7@kernel.org>
From: =?UTF-8?B?SsOpcsO0bWUgZGUgQnJldGFnbmU=?= <jerome.debretagne@gmail.com>
Date: Mon, 12 Oct 2026 20:56:24 +0200
X-Gm-Features: AclHuK8XNRMVa5i_-1gcBHkcX16OiXLgWfJwauZ8ZsGnsvSYHUGeaNp1UtvCa9w
Message-ID: <CA+kEDGEBqMh8X=q54EkQNutxTpqutQ11QdkUr7bvJO8_iFy5JA@mail.gmail.com>
Subject: Re: [PATCH v5 2/7] dt-bindings: wireless: ieee80211: Add
 disable-rfkill property
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, "Bryan O'Donoghue" <bod.linux@nxsw.ie>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Johannes Berg <johannes@sipsolutions.net>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Maximilian Luz <luzmaximilian@gmail.com>, Hans de Goede <hansg@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Jeff Johnson <jjohnson@kernel.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-wireless@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
	ath12k@lists.infradead.org, Jeff Johnson <jeff.johnson@oss.qualcomm.com>, 
	Dale Whinham <daleyo@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lun. 12 oct. 2026 =C3=A0 18:53, Krzysztof Kozlowski <krzk@kernel.org> a =
=C3=A9crit :
>
> On 12/10/2026 18:38, Konrad Dybcio wrote:
> > On 12/20/25 10:12 AM, Krzysztof Kozlowski wrote:
> >> On Sat, Dec 20, 2025 at 06:04:00AM +0000, Bryan O'Donoghue wrote:
> >>> On 20/12/2025 00:21, J=C3=A9r=C3=B4me de Bretagne via B4 Relay wrote:
> >>>> From: J=C3=A9r=C3=B4me de Bretagne <jerome.debretagne@gmail.com>
> >>>>
> >>>> For some devices, Wi-Fi is entirely hard blocked by default making
> >>>> the Wi-Fi radio unusable, except if rfkill is disabled as expected
> >>>> on those models.
> >
> > [...]
> >
> >>> Is this really a hardware description though ?
> >>>
> >>> Its really more of a logical/functional description. It tells the run=
time
> >>> what todo, not what the hardware is.
> >>>
> >>> You could also have a list of quirks in ath12k for this or have a use=
r-space
> >>> utility look for the appropriate platform device string name and disa=
ble
> >>> rfkill.
> >>>
> >>> I think this logic belongs in drivers/net/wireless/ath/ath12k/ trigge=
ring on
> >>> a compat string.
> >>
> >> This is good point. Either this could be deducible from the compatible
> >> or this should actually describe the hardware and whatever is there
> >> wired/configured, not what OS should do.
> >
> > Sorry for digging up an old thread. The board-compatible change is now
>
> I don't get why exactly the board-compatible option was chosen, except
> of course finding workaround which did not need digging out the root of
> the problem. I suggested the compatible of this device or proper
> hardware description.

Could someone give an example of what a "proper hardware description"
would be in this case, to move the needle a bit? It is quite abstract for m=
e.

I guess this was chosen as a workaround since not having Wi-Fi working
for 10 months has been a major difficulty for some new users trying to
get Linux working on their SP11 / SL7.

I can only talk for my own contribution but in my case I had removed
this patch from the series as I had understood from Mani that the
connector binding would have to get merged first and it was far
from ready at the time.

Thank you,
J=C3=A9r=C3=B4me

> > I think merged into ath12k, but I'm not sure I like that, as now every
> > OS consuming this DT has to carry a table of board compatibles (hence
> > needing updates _every single time_ we want to support a new device),
> > instead of being able to convey the quirk through the property
>
> Best regards,
> Krzysztof
