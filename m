Received: from mail-pz2-f18.google.com (mail-pz2-f18.google.com [74.125.228.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4982D4D1781
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 06:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790058586; cv=pass; b=EGJfN6aNHimjcXAoLZ1PdJIwkm+ulOYKPWFJ20pQcB6J9q1DI/fnFzx4X3Qd2AQyag0j5w9zIZOp+n+X/zPHHfMFCtM0Mi/mxTad+QuvV2ayy93kEGEOYgB3rkoUTPl+dPME6ahJ7RJFLKwFLOIRBa1p0lChWpXrRUzCGQ5yOmc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790058586; c=relaxed/simple;
	bh=WMopLKvR/pUfd2YF3exYBV6b9DrcmKXGK/JBv+4BYaY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ld7EHPxIJ6UCfsXjRiUQVLCtccGP1FIXIN+1DsnY9ADGDpehDcs5l+OF/KNmeodXU9pDI9GY6JnyrWulmgpHmUGs0o9lRdnTuW6+p3IfuFfRAGC6yKW6fshW+5rejNvJBoHuRkS2yDDn11h/CNCwUjMCk/Exp5Fg0r0fnP1r7Vw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ads0/kQN; arc=pass smtp.client-ip=74.125.228.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ads0/kQN"
Received: by mail-pz2-f18.google.com with SMTP id 41be03b00d2f7-cc4bdf8abaaso3072486a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 23:29:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790058584; cv=none;
        d=google.com; s=arc-20260327;
        b=o7SHF5bPLPVxxLcp6zVwn0x3RxsdiSNf0+QL5c7c3XpbSOElxcFXNwSQVYKWRwXxJg
         l6DP50qdLvYNL03hzNsnOxQmLBFHV2RAcfi3i5iv/FaBi2B5FWr1M/0m32NGhw2g2kLr
         knJW3+Zf3NVp6bnG0cKycH0MCIOh4FUqyR9hSE+Tz0EDycquZyyPhZjw2QEziB6ueCY8
         Lt7uXhJSgpYK6NPcOnkObvrvYVNJVj1QcBBKtvUkJvr+RlPtmp69RbPlDStFg+EY8xW6
         GXwL7LhS2wxe8KjQLLFn9l3yJvsbYgqJZBUdZSs+s4/lxVoIO29tyJDTNSgAwej+XOPH
         szBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ing5JC6tleS+Y5q+zrefvE9RUeGgTougjus6FkCTzfE=;
        fh=l3VSZp9KwogGyKd4fS6DN1yCUPRfhDrA7rrCs5H9vUQ=;
        b=WEGbVWlvA1U7Ckw13zEmhEH9KA7Rh6pCguKGRGGguIhTA53i41SPl85SDAIbNEkjI1
         PIBD/GY2RS7h9ljtDIC+juHpldmgOMzRfM1My7s7MhdvyyLytM98ahNyNvv/FDuazSDQ
         w3gmRU7sLZ8UFpyBNoVg54MbnLdUovavAKUUL7xfoZxUgip4ABdKKv3VQP4OpQEkUOoN
         saTPUgJr5+54Gf7JAb/1YbKFuvUDcIlQdjdLVm6TfNXHqRzIErFHyEqq/j9WXYUekWk7
         B6wNlgM6SLNEpimhxOnBzngzU9IkEq1iWjE2OKfi94qCMlmH76M1q0EgoUVRpi6W4nEB
         H/Wg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790058584; x=1790663384; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ing5JC6tleS+Y5q+zrefvE9RUeGgTougjus6FkCTzfE=;
        b=Ads0/kQN2vtUwcoG8QLHfoFhrM+QXCLgy/bTVR2HYnnIY/tlRnZDMrR1g/ejfPLW0f
         XEqhj/WqZ802LJZ7RuAMIHTLdCiEJNP+LXRYmkbWZOMaxFtTgoULmZBaTBYU43qIMuRg
         eIb+208ZJcLaJM6BQWjPm4rByHAB2LYTJExPetdZDiuJJorlmnCl6CTfjmyXPUlr0JEI
         g6pnNgmi9NzUJcjyt9kcE9or1OD7eKBNnA/6qaOeMD5tkteCx4YYXwsTW0d+lKmvXFHu
         EMmjBDyFg2J6FBPAtik4LbD/e9XeMCrY/JgA2HCUq3fA+0ISgOx6eWz+1BkZYDjY1B6Z
         9icw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790058584; x=1790663384;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ing5JC6tleS+Y5q+zrefvE9RUeGgTougjus6FkCTzfE=;
        b=gGcqa+b9j3xgFaudRHrQz/eSF29LZONM0rV+h6NU1rK1UfRNyCdm3BxQhKHiotL0yL
         Mygih5r1i4Q7GfhJjH7U1xObHpc9wNXoKyZ3NgakZKsgHIZHIa9nrkY/m9a5yv5RxJ2R
         1P7XHAtq0DVShz7Q/aVJqdapCh90ZC1es1C1v9qeU6gBDVb0rNkLw3NCJQtHcbTMwgH1
         cPY6rxhwbM8F+mE1oQCcVgpj0kSGnk1H54Bfab31VLbf5WExBlr6DtlKCGfp2UMt14EL
         PPElKbUjWuibxyshb8UKzhZrpsxy94VDLrOHUiMAHE/taPwp9t+tvot2++yaKWhu7axZ
         JAUw==
X-Forwarded-Encrypted: i=1; AKwUvBzo1lrwJpP9H+zsvSxkXXb+5Z7jeHr+L6jvfjaaeBKGs2lkVTMudPjk9r04k2ijmzaGz1gAwUTisiS6pPg=@vger.kernel.org
X-Gm-Message-State: AFuF++kVYQAS5ZFxjfbRMpv19oBbuaHS3WbE270HrzKCmBMxUM0J6biW
	dtPYJMrXlmwOJyIp4YeQZl/N2JP+apJiEuQhuhy2Z97C6Gmh+AaTyTs9lfY25lTbc44DkHHCpoH
	loOdX+eC/5zON+MkLLmfvDBwG69503lw=
X-Gm-Gg: AYBFou1pv4gsRWllRP1/qwdlAvHnt+FORs/UR2HmT2d/hOCZU+CfNz1TxWIU2QjJxau
	DxZ0uFUl4iMgDbdD1XhbbQMAK/qr3hR7yR5ahkabYo3V9raQyjGknD+7s5FJeWTmCcYg/M7UHb0
	afsNCcsk7A9aQTFXrWxnhK+HHoiVZW0ecqm8fmiwpaFCbR2LlFzUicS9xO+rHLNPc8Y9A1uNQ0V
	5bzHDKU8nSe6XiDEaTxb3WhHX8CamYVcyt6DTfQ14Vfc6sBFZwT6QVZ8PPjPvw7Z/PemAEkrsMH
	+mjEJAlWfQqteh0K3YDsM9B2Ba9k96QlP6O4MZxPMO+xc+CSuG6td5DDMwZx1j/GEA9+tc+anuP
	ALfKY6j/hlAN0
X-Received: by 2002:a17:90b:48ce:b0:3a0:4066:d3b0 with SMTP id
 98e67ed59e1d1-3a07327d177mr173825a91.59.1790058584580; Mon, 21 Sep 2026
 23:29:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921180250.3223545-dts-florian.krischer@fkr.dev>
In-Reply-To: <20260921180250.3223545-dts-florian.krischer@fkr.dev>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 22 Sep 2026 09:29:32 +0300
X-Gm-Features: AcwNN1VHLuPJpyDqBJ6Nhj2r3qY1EQ09O50v17uUs5s9CMRX1Up_T9siUpW14aM
Message-ID: <CAPVz0n1OrUwmwfhLEdMtfnQELMFyf-Br4itWTXin3b8pSSE1rQ@mail.gmail.com>
Subject: Re: [PATCH] ARM: tegra: Add embedded controller to ASUS SL101
To: Florian Krischer <florian.krischer@fkr.dev>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D0=BD, 21 =D0=B2=D0=B5=D1=80. 2026=E2=80=AF=D1=80. =D0=BE 21:03 Flor=
ian Krischer <florian.krischer@fkr.dev> =D0=BF=D0=B8=D1=88=D0=B5:
>
> The ASUS Eee Pad Slider SL101 has an embedded controller for its
> built-in sliding keyboard.
>
> Describe the EC on the PTA/GEN2 I2C mux leg. The EC responds at 0x19,
> with DockRAM at 0x1b. AP_WAKE is GPIO S2 and EC_REQUEST is GPIO S3.
>
> The node has been tested on a physical SL101 with EC model
> ASUS-EP102-DOCK and firmware SL101-0202. With the ASUS Transformer EC
> MFD/serio driver and the SL101 event-protocol fixups, the built-in
> keyboard works through serio/atkbd.
>
> This patch depends on the ASUS Transformer EC binding that provides the
> "asus,sl101-ec-dock" compatible.
>
> Signed-off-by: Florian Krischer <florian.krischer@fkr.dev>
> ---
>  arch/arm/boot/dts/nvidia/tegra20-asus-sl101.dts | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> --- a/arch/arm/boot/dts/nvidia/tegra20-asus-sl101.dts
> +++ b/arch/arm/boot/dts/nvidia/tegra20-asus-sl101.dts
> @@ -59,3 +59,16 @@
>                 };
>         };
>  };
> +
> +&lvds_ddc {
> +       embedded-controller@19 {
> +               compatible =3D "asus,sl101-ec-dock";
> +               reg =3D <0x19>, <0x1b>;
> +               reg-names =3D "ec", "dockram";
> +
> +               interrupt-parent =3D <&gpio>;
> +               interrupts =3D <TEGRA_GPIO(S, 2) IRQ_TYPE_LEVEL_LOW>;
> +
> +               request-gpios =3D <&gpio TEGRA_GPIO(S, 3) GPIO_ACTIVE_LOW=
>;
> +       };
> +};
> --

Hello Florian!

This patch is fragmentary and should not be applied. I have prepared a
patch[1] that adds EC nodes to all supported generations of Tegra
based ASUS transformers, but I did not submit it yet, because until EC
is picked there is no sense in this. Patch will just hang and
eventually be lost.

[1] https://codeberg.org/clamor-s/linux/commit/5d7b9ca285781e0eac35e346a951=
d949a61a2f0c#diff-8ffbb7ecec9cab371ba8535ba3c046f01371afd3
