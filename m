Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11CF649CF36
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 12:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790341091; cv=none; b=ZzX6r841wJ3dhSzXIF+m40T3T4SB2s/009GKleQcPqzDa3oZdmvC4B9KAVbYD1go5oqiAo72x5y4OleYbydU0G1GMZ2HlelYDtFGeT2nJ5xzZRcwMvenxsGQiI5d2miO+pP6oai3cgWDgAPP6CNWGSL8RuMVgLsj36lUVw6T/24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790341091; c=relaxed/simple;
	bh=SNXrjUHLxaO4PIWLbvPnvyB48FFWSNE4zj+UVTQoMOA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Pz/6e38lDv8QQ6UE4uYvwpz4jv3XbCxXgVAWYI1SAnyR6vxY/Nk5e/YTPXv/z9zjWwGDjX62gpWXTylZG5rxkGy5MXpUjNH9q4pk6OVb9mARnQj86MWrJHzZlY42sRHj/VKme1WtoYHLmUwClGmhpqnsoEniEb1ZjJDpuGy0ANM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-98536aec408so829766241.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 05:58:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790341089; x=1790945889;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iikrWSUlQodloxnitQUQlaOsbbx0iKNTngyqMd+wIHM=;
        b=E7/ZHaTjzAB0qUSFhNrH3WsbKKIyd7oQ/+Des+lmgARVrLWkjfSVS0t9SmJohHwHKf
         LzeDk+9k6Y07qOhOjBa1bHjvPzyq1qiQ2mhBhnZ9tRYyT61/LP8M9ZYRdgSF/f8KdhRn
         4u2HiRnx2p/aq+2c8NR00wxClVtKfoYxJrdcm/PitXlNdIaR4jFuJIxXiyRrShvLEbqp
         wxeRvH5LuTx1j60cx0pdGcKepCilr/BSa3ESs9ZkCbxgJ4SzpHvfldGv0FkxmS4ne3Cv
         I6+G9IyhF/YhI3ajg1Fy/08yKm8gJ38yUUAApG7IfCz/NiL5GhhIGKFyW86F/KStZZgE
         1F2A==
X-Forwarded-Encrypted: i=1; AKwUvBxHRve+XqvgZ3sxO38GB/zv58DBw/gPUnVYG0bwEg/2Gzh686jruOxP98dr+mIUvgmVgNmW6xgWIMCYM60=@vger.kernel.org
X-Gm-Message-State: AFuF++k9ve/BiyRd+IDhS4OcBSHAd7+DVwiP+QhyZd0t8jvZvKGX092Z
	HjSzcc7rjM27KKx6nBckE88NjN4DMzal7xwcB5LVc47c6GWUyHrADEKqTAIkJE65
X-Gm-Gg: AYBFou0FHayv/UOZ2nkkQ3kEATm4kq6ijDVfL+ICOo5rL5fWsg8x+8WDCzQ8tX4zqEa
	xTvsz09mT8E2oMdt0AfyEtBOIOkzIo6x9O2RSrbFtYdnO9eMSOPqQN/wxnhpLHB4HWbzKfZRvlB
	AjLaeLsSIyeGo9SxrQV97v8tOZ+BG4NWVoIkvVMeBsbKNIDAoIj7WY0r57p8g27rccNKx6o4FNC
	b/WmcME/JZBMFvw8f0sLw+xUDQ/LzBo/h/lHVhepQpRKuU+J+haKJR/o7j3tgZ4jnZ99XzbEc0Q
	tgPO0porpOux3JG1YGMXqaJOrrEM8004TOVW/QMC+QPewVKgKb8LGrUWsyKp2jv/e1YdVskbhBY
	JHPAOxSpH+BYMHyS2k3Efj0BjyQC1n7DKGxV3p1VOPwxOjFXSnmj4T20uLyAnt5kL+3APsJYLFU
	/hv25Qr+BGTniheW3IoPBukEtNLt51vKvg6Sd2CLeut1AByoBcEUxXfXkjQVAO1u2I8Lqa7yT7+
	xzmb+FNVSoGlwvR9hM3+UrKHUdsmOu6Aigw
X-Received: by 2002:a67:f24b:0:b0:784:a925:3f0c with SMTP id ada2fe7eead31-7af19524bedmr1665692137.0.1790341088913;
        Fri, 25 Sep 2026 05:58:08 -0700 (PDT)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5cc65296997sm2390353e0c.13.2026.09.25.05.58.08
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 05:58:08 -0700 (PDT)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-78a338fe106so1643393137.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 05:58:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwnmdI1Lotk7S9zcOUdvXJ58sJISF4FcGn9zLYS119YQ5y/13wHAZppTEAda5zItNc2niNe5Rgw+EFj+vk=@vger.kernel.org
X-Received: by 2002:a05:6102:a145:b0:78f:fee6:832 with SMTP id
 ada2fe7eead31-7af1cea4a54mr1503499137.12.1790341087879; Fri, 25 Sep 2026
 05:58:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260924-paul-v7-3-rc1-edac-v3-0-bd8054a5b180@bootlin.com>
 <20260924-paul-v7-3-rc1-edac-v3-1-bd8054a5b180@bootlin.com>
 <arZpZolRwdU8zh6O@shikoro> <8733uxlcl1.fsf@bootlin.com>
In-Reply-To: <8733uxlcl1.fsf@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 25 Sep 2026 14:57:56 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUeCH9SbCr70syV0hVSqD1ccjVptMHoY-6aaEhW_ine_Q@mail.gmail.com>
X-Gm-Features: AclHuK-YV8P6qGPlYAimFvYOFx6QV9kkt9w-v-Qt2g3Qun14B0iXjB41Jl3A5uU
Message-ID: <CAMuHMdUeCH9SbCr70syV0hVSqD1ccjVptMHoY-6aaEhW_ine_Q@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: edac: cdns,ddr-edac: add Cadence DDR
 EDAC binding
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, Paul Louvel <paul.louvel@bootlin.com>, 
	Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-edac@vger.kernel.org, devicetree@vger.kernel.org, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Herve Codina <herve.codina@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Miqu=C3=A8l,

On Fri, 25 Sept 2026 at 14:50, Miquel Raynal <miquel.raynal@bootlin.com> wr=
ote:
> > But one thing came to my attention just now which needs fixing:
> >
> >> +    items:
> >> +      - const: renesas,r9a06g032-ddr-edac # RZ/N1D
> >> +      - const: renesas,rzn1-ddr-edac      # RZ/N1
> >
> > We don't need a family compatible. Only N1D has a DDR controller.
>
> This is true, but from my experience with this platform, Geert used to
> request both. I'm fine exposing only one of them, but I explicitly asked
> Paul to put them both to mimic the existing bindings and keep some kind
> of uniformity. I'm fine either ways, but before we go through that
> iteration, Geert, would you mind confirming your preferences?

Well, if only RZ/N1D has the DDR controller, there is not much point in
adding a family-specific compatible value.  According to renesas.com,
RZ/N1x is obsolete, so no new family members will arrive.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
