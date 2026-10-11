Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D52783D170C
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 18:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791744676; cv=pass; b=mEzRfhiAXSdLAhjsdVaUDv10U2yKRIAjJrYbCqxbcAz2owgoC8cTfyPUFNb/FaFZ7J1lhxUWSOERIfOfwRj6maug+u0qqeULRw+ayNIkyJBgcqXKHeq5iSe71JblfIL+OZnhPNP+3ELiITyaH4ot13oUC4/2gHpcwlWAgi4Rwkc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791744676; c=relaxed/simple;
	bh=0KIupU1PlUnI74kbeA9rKFTjXf0bMD2fNsbxeKLKsfA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rKGoE2bQCAO8IvdSOmCcTyFH3wdC7H31CPSfY8zmoA65rXri3IQ+Qd4w8LHCPe6xLEe0r1WobkpYllwOhU65zosQwBDmBgngZZAkO49o/m5+X1Q0DDZBxJL06cSMKDhyqXBrIQC7/7oD0AlEaNQ3/NNpi6WqYXLePJzZEvTx9bc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MIamxw7R; arc=pass smtp.client-ip=209.85.161.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MIamxw7R"
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-6de08b2e447so491363eaf.3
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 11:51:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791744674; cv=none;
        d=google.com; s=arc-20260327;
        b=qAqKV0RGiQCIM9ECRsFWl8uOXFBhtg+oRoo/eSFkYURKass8GdHbn64xxSKLz9v940
         pVE/8zqmZblDhNnKoGLm1Z5Kob3EQ0TYu7G8Hgg3ZvLxYUu6kskO2skEytlBcUSxaNDp
         7kYEmpC1wrVR0hvtKQDvQDGK1x1r4+qOUCncqXCUZ5PWWqi75fxyxd2iXw2LwMJpY7Ro
         og/QJXMMqJPQkrTPcncrU07UbisK17401g7ULcJhxD9liSn4wVUX1zp0C2gZSVM9nis/
         QdJjJGOyPi7FC9umF4FBBihj8mFX2sZwzaRTHhxbWhlbKUHpZ6LEl3+a5LtP4OOCzjjp
         dHJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0KIupU1PlUnI74kbeA9rKFTjXf0bMD2fNsbxeKLKsfA=;
        fh=hzzu5E8Ej1sn0venLIJ1mpnSt0I+DyVjjaGZFwAD3co=;
        b=ERS7Mf0cSLnKu23xDMprlo2je92GB0AVROFyWaw8Otm3VG0BYIeu9irwkV0leUkX5Q
         HciwdPrsCvvQVpmuXBsIv42Fpuak2eOOcnh5Mvor9sF6euIZU48d1ZZA1gx9DgkROY+w
         NvaatN9fxJUwCcwfwzA2RGi2FciYvSPRzJiWL9N5tuRdlTmtnMYCaS+Q2hQXHKAS55RV
         AXAUWILkUbYnb9fzmgfTCYUNuqqBSe52pjoQkz3vpTU+fjqV9lVEoAx3xp63BCdvqE0m
         Z02f/ofhzHftNvQZUB+aWsRKj71+onnX3725fRSZqVi9vfpHLMh0LQYGldG6Ss6/nKaX
         B45A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791744674; x=1792349474; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0KIupU1PlUnI74kbeA9rKFTjXf0bMD2fNsbxeKLKsfA=;
        b=MIamxw7RlDIhS/VSIrtK6SPcz5PWQhti+mrNI6HFvAtSLULvTUXfZyUXXIopsz+e9c
         w9s5O+YuqD1zxULfWKJExXPEk1Adz8II+9/EW1ayawg3AlFpHpa++Wd44E5Lk6XFRW2x
         fauQyA6Mr5XGG1GWFjD45wayLmcef/aKRJtFfcWB4ReXqPv+DZQmek5wbSBagSRxQA2Z
         gldR8y0y5MMIRZPpmn4aOHprTEwP37YmifyNlq0qsvTJLgxAZhVZspkMl6NCCgY0hWbr
         A7dh44KkvyLktlQ8wsmHGtzvHBtcTqsovH6SkFxI2SLbXoeaQJ6ncEsL2ENNQKuT0b6s
         LH8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791744674; x=1792349474;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0KIupU1PlUnI74kbeA9rKFTjXf0bMD2fNsbxeKLKsfA=;
        b=wfY8jiw5kBC3BT4H6tBmcksgTih7MLN4j9ECEHt2CJxaRm2jSYHFCKCKumo9lbjXfK
         FClsaq8NpnSZCNToVR6ZfttZ65W7Vt6/bEIqR2B5QeUnrPdvWg8FooBmS1NS3WHbS5uw
         yiMY1SCnXfypNzxku1MOs06yX5twwWQ/egWsSkb5t7GKkiQyV/mFEnzI4qgio9wqs/zd
         9xvCn1VozQDKgpTZi46ZXOAzWNkcB5UqrvgHpj/SUrRKq37JCT0MeFGN2uGYC2PpOQr/
         zM24zfwneWNXAIXasrSTyrac7k6Z0wKQlf4mC14E+xlJb89Mij1CjIs7vT8llGZZrJYb
         CrJA==
X-Forwarded-Encrypted: i=1; AKwUvBxpfZUM6GWDyBllDB280uKLiuhgVDBfiD2LfkbBFic8RoHgbwh3SoUW0Au/ZR+1lBqnc6yAd3JDYEF1CpU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKEDjCRg2TRdINnCFUFk42yiTunfoqOOAORaeWZMDOANMxFeIkS
	7z8qBPX5F6WA/DfnuB1kvixSYbNzXngUHvylKU1RJAwrDFwX1UqP3F4jU9wvkLx1O06xtjCCltH
	YWagvbU4Qwu31JADbWA0wotTXh9dAHVk=
X-Gm-Gg: AYBFou0yxyN103M7badbWFOYyyi41FKQaexvE3ayGvCO0ZdFduDuPDf13sQ+6y7cUPf
	8YKEZkL2tUBLtf8MB7nQbTHILf/GsmdLNFjvYCoyiTpbq+8EghVh/Luqj3onZiFFyCVGjf8UQuT
	5kft7UFAPJwFR/2zkfDmQLeD2xfXFeJ2r4FQ0kRZYFaAlIXqGxUj2JqD27D799rwRx0QLI50tT1
	ButGTPQHfnl9D68ccVuvCVqJvw3GfR877by71ab+vQJXvVbr310uaZK+ozLG6CDJ181WlrQWYu5
	OkWMXciE0RclLLV1idqjEEEoxPREsoRJmx4D5APsqSySxzxlEA2LkiA=
X-Received: by 2002:a05:6870:e311:b0:47d:a12f:3951 with SMTP id
 586e51a60fabf-4a2a89f425bmr6103374fac.39.1791744673650; Sun, 11 Oct 2026
 11:51:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907-6572-gce-v2-0-412a5b037290@protonmail.com>
 <20260907-6572-gce-v2-2-412a5b037290@protonmail.com> <39494ea2-7fb5-4414-8560-47ddd40260cf@collabora.com>
In-Reply-To: <39494ea2-7fb5-4414-8560-47ddd40260cf@collabora.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sun, 11 Oct 2026 13:51:01 -0500
X-Gm-Features: AclHuK96ynSq9uLesTtRAZnhZ7wj24Xtpvp969Wwe99Ul08jW1tzra27V2b0o08
Message-ID: <CABb+yY3oEfZrx+=igTVUOSGB1+J-pa6=k=+DGOxWozJnK_sJgQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] soc: mediatek: cmdq-helper: add legacy GCE ISA support
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: rva333@protonmail.com, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Houlong Wei <houlong.wei@mediatek.com>, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 9, 2026 at 4:57=E2=80=AFAM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> On 9/7/26 20:03, Roman Vivchar via B4 Relay wrote:
> > From: Roman Vivchar <rva333@protonmail.com>
> >
> > Some SoCs, such as mt6572, have different WRITE and POLL instruction
> > encoding. Instead of 16-bit offset and 8-bit subsystem ID, old GCEs hav=
e
> > 22-bit offset and 2-bit subsystem ID.
> >
> > Extend cmdq_instruction struct with additional union and struct to hold
> > the legacy format of instruction encoding. Add legacy_isa to select
> > legacy GCE ISA when writing instruction. Finally, add special handing
> > for legacy_isa cases.
> >
> > Also correct comment about PA writes, because it's incorrect for legacy
> > ISA. Only v2 (mt8167, 8173) and v3 (mt8168, 6768, 6779, 6785, etc) have
> > GPRs and SPRs for PA writes.
> >
> > While mt6572 GCE supports 22-bit offsets, the parameter type for offset
> > remains 16 bit, because all mt6572 GCE mmsys consumers are in the 0xfff=
f
> > range.
> >
> > Signed-off-by: Roman Vivchar <rva333@protonmail.com>
>
> Verified in the lab on multiple MediaTek boards.
>
> ... but I either need an ack on patch 3/3 from mailbox maintainers, or th=
ey need
> an ack from me on this patch to pick everything.
>
> I'm fine with anyone picking this, so...
>
> Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora=
.com>
>
I realize the patch order is messed up - it should have been 1-3-2
instead. So maybe for this time...

Acked-by: Jassi Brar <jassisinghbrar@gmail.com>

Thanks
Jassi
