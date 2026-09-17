Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 689AC3905E0
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 18:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789669916; cv=pass; b=dRBcsnKd9pnHq74fG3rfm7hHLLmdl8dqv+sJjOcvulbrc0yDCRjV8nVaIEd21TwPmQ3P6+7c0ahL2IZKZvA25hhbSj0MPFHuObCrsBvXmdOS9MNTMwzbwWCnf3ANtrDpmGqJuywbANQtwwUcSXCHQxP8vwHekqlUFLCrlDD5z0U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789669916; c=relaxed/simple;
	bh=2x+yw5g0wtGzAHqf9c97xTTZUBeD/+SGjsptoS7GIZ8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KRPh3+PPyLkbdTes5bzTd1KWKU6NYBYSoq6ZGc7juCZM7UYI7fyd8zteUc1HI8A6HAwadogQ2oN3Gy1yLB0V2pn0DG941IDQIwtPio1UwnTQc55Yn2H2jhCCkfPLUibogaxUq1zl38IxQ2K1BfLh/BkVvGu6Fn0jukUFBGhyOoc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kwgz73I9; arc=pass smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kwgz73I9"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a99cd5115bso1953161a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 11:31:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789669913; cv=none;
        d=google.com; s=arc-20260327;
        b=fBSvV421ezOLp487IGcdkrb7Ovl7+E0gLq0R4e7KmY1nLvmd03f3JsOwI+f1mFMTG5
         0L9C+QymGAOxl7pcIxDjTvFOq+wvpDay1X2z3DX0DrZSX9/yXjtNFiSQD2qxgh3GCMzZ
         Hh6kPb/l3nDBBx/8lUC8R1g7we3p3WpFS8idbWXuE3w23T4soXwUFS83nGX6K2O5JqVn
         YY3SIwHtH7yfN5yRDBtK4/BH4TKl+oq1LgU37rz8WdqHLBfQ7AfJB/vKDpAoR5gN3qRt
         w2V5llUmVUhLV2L4mXDnxcnlqMx/LuueuZfGJbchaiMeiqJ1qhyzd0C5nsaDcvra+AYr
         I4hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CQ+sUmlqhUqn87N4bdeRG5UOUAWagngN3VbfJwHuCGo=;
        fh=Pgnc9gYyLVKnSyJjkuRLhCoT6yQgq3Yerq2/XZ1cqzE=;
        b=bzxp6992ok+JdBj1MnjkAWeDSbp0vkE74zY4BtWHozb7BUz6YCinAkhbSZljROe++9
         5IOo/NIPTw+xmGwbJMiSgybTKRzPFTmSKJAg8BSYpesyWFIpH8RiKQEMRt2YYyTFFSMM
         Pw1PVUxrO17kGmOfzytHJAbJ/5UY3MU+Z1gsNEuZ3vrusGol0wKZmUpcJd9cMJi3y718
         oILGUIghD09SqOqNgsrOl21rIVwjASjcRlhDqX1WO98yoHbDd9D+XvhS+P6U2U1ObLCW
         E/I8a37YkPZEjw9Nv9sqO/g53jCt8AuSaVByEdTxYx5cDy327VX3UKlRsv2N/U+sPDFb
         iyCw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789669913; x=1790274713; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CQ+sUmlqhUqn87N4bdeRG5UOUAWagngN3VbfJwHuCGo=;
        b=kwgz73I9mXpuj3X8GV04n+4GHB6KG+Qbr1cbzQKlSLCh6NXPI2uR08U3373PoVsETh
         MfjfBjqwNt8cPuk/eMFWvsu2x9BTHMB4otTHN45bAEhhYEsL3XP+sB5SVqbgBxcQgOOO
         yGiG+e6VwkEucTJm9BULlmU9mM+GOWZwPinTXikUI4P2V7gv57YULLGYhvkisl8rr1Wy
         Sp3ydZTjWIhg3n7pxC2zigvF/lScVcavtOUA/ACpWqgXOO9d0nDtWk+wJqQD5uZ3RFLP
         Xh8tZ698FtN+rChJu4hWb7la3DGDhp4YGZIoKL5iC2DgKvVAEfSS/Ys7iSvyrQ8npfQu
         iYnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789669913; x=1790274713;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CQ+sUmlqhUqn87N4bdeRG5UOUAWagngN3VbfJwHuCGo=;
        b=2flXUTT3OfQAAq/5JTG5iKw9CARNcO84YNybU2hc5HWHlV3EIswEv8xxJ4UIGg9iaj
         Fj0H4bEepDEDqBbSk9h7vVH7nWhiyIkou4ek4AiN5gRs4aNRx7DPN1EcJcKsU+SIEafM
         dQlQjg4e/bm/kFG+JPwakdlzBh9zXr2OVNH+4AW/to43zpnMMoYsy4TQJJchcpGFk6Y/
         9FAzRBN9MtFlFQUlOPvVVB9SS7/rvQVRJx40qtnWRVPZ9eq5PAC+y1olKH+bh8Pv2GJ7
         RzQij8IPvcH+sjQBNS49cvGnMazODdJPhHAbvi06dsZ0tY/8oFdWotrNzncoaWFyVCmL
         YKLA==
X-Forwarded-Encrypted: i=1; AKwUvBx0gTRKEP54ZRhJ6OpcHl5UUQ/qO0/p7CXxj6O1viCnWrMUbftLOO2/5kjtG4va2oqMZwH5TeWsh70IPZ8=@vger.kernel.org
X-Gm-Message-State: AFuF++nePo0Qb+fxWBCIKi7uQIMkK1pTDFw0H5/UssojwOvA5dYi1SrT
	4KS3JcXR+BRj8QK4Ze81VE36lWzKlwQqZ3rPTzIOWCsvFqvy8k49AXiUPeLXZERHe0QVNE5QeZg
	l5nqmi1/YbOqhSLCEYFOf53pf++YOvQ==
X-Gm-Gg: AYBFou0FScOq9kPFSuIDUuMx95S3z+sV+GxsjnDpRhhQGUx5PmCUIR02ctWgt3EJ85L
	uGRxAqxzNvLrY0GfCg2A2HOCFOwpAEv7E9XSbSWn4NdeEK33t02UTzjPULnpMgGyhx7Lezcb/7N
	fakfiUvAbz4iKcF+yWyYmRc3T0JgUA8PQLzrO4AfTOZWGy0XaFqaZSJpuxM3M5DyFRHweEe7MeZ
	IbS6hyOqJjuk/9cO74P6optYxC6ohYNDCnHeOvMv2cjJMavskeTaznabNrS8ZhBF25GfqHTxkV1
	GJgfU+L0Pf7YJ40bu2xe4YLV7gPXyWALDNtyrDgJru4zSKDTj/X15dDVvpvhVJbf6ayvABG2HBh
	Hat2d7yaq9+Llkw2JxWx/vOsldGHZkbDND4xd2Dbuhy/FUr7/DZLzmObCyp6B6H/is9VP
X-Received: by 2002:a05:6402:390a:b0:6a9:aff5:c6d3 with SMTP id
 4fb4d7f45d1cf-6aa2241dc23mr6037165a12.34.1789669913202; Thu, 17 Sep 2026
 11:31:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914222246.29761-1-mhun512@gmail.com> <b8973293-8132-47d7-be28-972ec87b72d4@lunn.ch>
In-Reply-To: <b8973293-8132-47d7-be28-972ec87b72d4@lunn.ch>
From: Myeonghun Pak <mhun512@gmail.com>
Date: Thu, 17 Sep 2026 14:31:40 -0400
X-Gm-Features: AcwNN1V88cYMprNxaAW_uHgP9rlXIsWVzyJMFFKuADNeskCbAvhWgvPcbfZiKaQ
Message-ID: <CAGEsz8Fe9yxLrLBGnQKDU1_GONF9KOEtNRVxY3X2RBfw-WVRwQ@mail.gmail.com>
Subject: Re: [PATCH v2] tg3: clean up PHYLIB resources on probe failure
To: Andrew Lunn <andrew@lunn.ch>
Cc: Pavan Chebbi <pavan.chebbi@broadcom.com>, Michael Chan <mchan@broadcom.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ijae Kim <ae878000@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Andrew,

Sorry for the misunderstanding. I will restore the guard only around
tg3_phy_fini() in v3.

Best regards,
Myeonghun Pak

2026=EB=85=84 9=EC=9B=94 15=EC=9D=BC (=ED=99=94) =EC=98=A4=EC=A0=84 11:37, =
Andrew Lunn <andrew@lunn.ch>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> On Mon, Sep 14, 2026 at 06:22:46PM -0400, Myeonghun Pak wrote:
> > tg3_get_invariants() can register an MDIO bus and connect a PHY for
> > USE_PHYLIB devices. If tg3_init_one() later fails, its common error pat=
h
> > releases the mappings and netdev without undoing those PHYLIB resources=
.
> >
> > Disconnect the PHY and unregister the MDIO bus before the remaining
> > teardown. The existing IS_CONNECTED and MDIOBUS_INITED flags make both
> > helpers safe when initialization only completed partially.
> >
> > This issue was identified during our ongoing static-analysis research w=
hile
> > reviewing kernel code.
> >
> > Fixes: 158d7abdae85 ("tg3: Add mdio bus registration")
> > Assisted-by: OpenAI:GPT-5.6
> > Co-developed-by: Ijae Kim <ae878000@gmail.com>
> > Signed-off-by: Ijae Kim <ae878000@gmail.com>
> > Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
> > ---
> > Changes in v2:
> > - Remove the redundant USE_PHYLIB guard; both cleanup helpers already
> >   check their initialization flags, as discussed with Andrew Lunn.
>
> That is not exactly what i said. I pointed out that tg3_mdio_init() is
> not guarded by USE_PHYLIB. tg3_phy_init() is guarded by
> USE_PHYLIB. Generally, you keep code symmetrical, the conditions you
> apply to init should be also applied to fini. However, the existing
> code is not great, tg3_remove_one() is not symmetrical. However, there
> is no reason to make it worse.
>
>
>     Andrew
>
> ---
> pw-bot: cr
>
