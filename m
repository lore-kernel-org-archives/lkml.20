Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793181178;
	b=EZx+ik4V1wX4d21bJhVEXGDME0WR1eHtLznl/ctw+rnyPL6i/UZDs6amRKtEp8iP8q2S
	 D7Ta3lpFDLciSrz8QZLLmimCifpHqlcgAGR6mv+9UY8DxyPwLpcHzPfShWZiNHFvLwP95
	 p3mcdV8MCR+MTkQoJaGg9L2jtl9ICuJL9FvzJsEjZyYMy8LDvgufvFzbxEdfAnXlDiVS+
	 UnFk8SWKQ0oL+SaZr+aQEFDXMygY67HCcHnFOAMc505Ne4gdkDMLbBh1rDjkTgPuZY3WD
	 MbKCUKALhWBGBi60YgHPDew0SOqtkX7YekSh7v5aK6nFXGEDj5tCHT+LY3lM5Gqf0BA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793181178;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=D3lktQzRjBCMxnd67QjaXopfijutifhL58W+FUrFYB8=;
	b=PEfO2jNMU97mQOngA5W49IyAiYbGJq5cFdt/tpyNlK3CoboNjYr/A7M9ZJZVFFA3IPLo
	 i6FjXKNIZaWhxYsWgZOLaxxArni7Rq6jQna+vO8uttoQL18hxvYssj9Z+Ixx+oN2j/3hv
	 0oNA7m4cQRhKgRBJ/rwRWDaqTK77ZL0wzx+xkBx6yzit7QWFsWoI3biPB1zS0LS+StuMc
	 Mp2ZAb5t63O8Zjm6vtWvY8omXt8LtPjG5slqV1XvgDwUJZg6TBLap9Uu8c4md8eelnOEP
	 3zzD2jSBR1+CIybWv7iZISEv+CILj9L7BED7j5pX9k08p8vbv1OnLDZrs00JLAncqgg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pFZb2XAt;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.181
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10784606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 09:52:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10784606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pFZb2XAt
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-8b0d63f60bcso6190677b3.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 02:52:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793181176; cv=none;
        d=google.com; s=arc-20260327;
        b=QkuxDq5UNfV7GeJN6scjX9v13w2g1fyS8tG5qIjv7I91hB6f2PcEra+YmKuk2Bz97+
         7n2b8YqRNjGTydgqijkVEKam0NYum+3GfYKoOEeqaqpX/l3/rquUAm6oRO0chbZm76LS
         w/tWd2TX8mxZ3O97K3OttsSQrcBIZoFOe5JS+2xLZ9//0vB//TWOeihCdzSp6uUdJfC3
         +kYZiCWZ+HccuzK7LF3LOw4Co1dPpoAxI+ZDayb1427fhmkl0f9O81c68BfJGxw8bIoM
         2DbrvZ4j6a+kb+88emIrSEZ1FcaOGeC3ytSz2QH1cgd+f1pZmW+J2rtL9GkDyU4mSpJK
         FDuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=D3lktQzRjBCMxnd67QjaXopfijutifhL58W+FUrFYB8=;
        fh=DVlppikYZ+uW2stXrzgxh++mokf4MlASZw/ZcfvKOhg=;
        b=o8Sz5hP6xilCJh4A/EGICNd4tAs3BxiNlkC1Wi0HLMyBTkQmF5tRn8bBAzBYqnf+eo
         dZ8cvlManxfugIBJnP5J0UVZWDGFluzUiAY0dlXtWwjbhnEyy77OhjfDrxcwaD1fRmRg
         sS+3sjx8BeAbutiSuLcDCDG3N0JKHHF7Fr6qRis8bboRO5V5NbUsgFaywIsy46sUETNO
         SwG0Z3QT8tgIGMN05DfhOxGCpvY8mLjT2HhalQfL64ZCu2CnMJK89kTkBxet9tW3vOFi
         QxeYxgdp+gu6APUF1xcozbXN40zDjFezToJCQmeHfwjdwXCd97927+bnC7eZKgiCJ0g5
         ZjKw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793181176; x=1793785976; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=D3lktQzRjBCMxnd67QjaXopfijutifhL58W+FUrFYB8=;
        b=pFZb2XAtZnGYD6N28VqS+GH/SCVM33TI2Ri9LSwpn3jK1NJwl1MrWcvCjh2GUsVre+
         lHca5O9E6gteBL2ej6PgJCq01YsOcKo/Eq6d+WLd566yk70k9zmQeTF2PDxieWRdfruS
         BgylkzSxGO2HYLQ96Qwp+2EKUnxqx+mR5gUy+t27G+IcbB9UZkzSClcIP4zgw1kUdldt
         4XklihCX9AjdEJy/W7K3rWBw+JDQzET3qmaQjnYM76Y8S9591ZfMPJ1lorViW3ds74OH
         sjyY/VJmRgG3iSHs+Zjb+vDNPWHqlPl++HHLW/ev/xaeuC2FcHd9S4n5WZe0xJs9ic4x
         mPlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793181176; x=1793785976;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D3lktQzRjBCMxnd67QjaXopfijutifhL58W+FUrFYB8=;
        b=q5iiaedfJeqVssVHsamVSKKMqBTBobwQNcCMJwtFoWu9H2Xq4FKCz+BGFwJlc9MB6S
         GP1RsZ+rZvarN1gDP1xsp8ZTbI/nvMmVFjijYiSMx64H313IiLO2coimui+FNxSOUgqQ
         K3L8fORTmHpug6NPPq7ixfL5gpz4w2EmO1HwFUmQ/WEpkq+Lxq/jTwMloC/hV68FiCBi
         6W92OqVR2cQabtqMkZ/RT6gUBXFxcTXvCl7pijRP1FE3xKYiUlP4PPhboP/A2S0z8o4M
         55GZ3emlzZ6b4M2ggKcgf69LHv8HE6Xvjh8CL6WF7ursOeiKjpZpyMvdBjHIzQpjWrds
         C05Q==
X-Forwarded-Encrypted: i=1; AKwUvBwuwOCP16i+9n5U+gX4HTtKsyIBNqBW31hq9C5YW2d3BAmF9801vygBHD+NlNfS2ZyrSZM4H19ZCi2eQzk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKjz6Hobldz5OSggR/v7XpQeUmQjXRg8tKJ+z8WKlYDSbkGnGJ7
	NiNgTSQvSYU/thCH3sZnMd9USQGQHvEdgvYnJ2/x6Q9IDx+yJUM3gCAjYS/rT9WCu+uxOXWSlpP
	qVkGdlksi1ew8kugY5KJZh6ojVL/qIz4=
X-Gm-Gg: AYBFou352jjtDclLzAvNcxIml2fO5iuJjk68RcS+6abQc6D1hFE0NG5Zlv0XEgdeeL4
	YVMBKuV9+ZN8Stwzp/e7j0YnnLuXROfKMYWKibvXsYLaWMDcRHy66TjvD/w80gg1hKvzf+cJ35N
	+/JrB/0cYmZ1Nkx61RBE0v1SwioiWrpvumkNavm66PsiwbYWvQiYOLl5dIJvYQv/lBVzySEJf/0
	YMS0/JXqZ2v2bn6Z269iKNzcVqFeJ2buYgIBM9/PESS/p5b3bvdd42hJEeIR1V4f85hkFQ4Fno7
	W1oIin+sQe7EaDmWFnsw6PwliCvi19X1xREQtGmlmNmn+bQFTVQhVsWhyRuF+bv19u83neiNwUT
	khIC8P6HleJiSSb77JGPoPVdmK/Bt1mJjBjaNilpuBBX/RN2t4MYR5EZ9IsMhyrUhI2IArFCX6D
	cwSHQvV1tgimp8Y5KCvS0dtirkor462pjFyejdjFOVO+CK1RaV4k/HG6sE0XisW9DlCqX3DXBru
	EBn
X-Received: by 2002:a05:690c:e3ee:b0:8b1:f47:9c07 with SMTP id
 00721157ae682-8b1b5c5c918mr12989257b3.25.1793181176092; Wed, 28 Oct 2026
 02:52:56 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027202230.3539646-1-florian.fainelli@broadcom.com> <20261027202230.3539646-4-florian.fainelli@broadcom.com>
In-Reply-To: <20261027202230.3539646-4-florian.fainelli@broadcom.com>
From: Jonas Gorski <jonas.gorski@gmail.com>
Date: Wed, 28 Oct 2026 10:52:45 +0100
X-Gm-Features: AclHuK_FWUZgUvSrF0mCFDYzLoIVENtjKxoJUiX7kBb8nyaeRUKlIMuLAikj1Qs
Message-ID: <CAOiHx=kFqW3AgzQ3_zJBxkdXcokg8j3-Ry1meV6h-RKb5mcTgA@mail.gmail.com>
Subject: Re: [PATCH net 3/5] net: dsa: b53: clear stale state when creating an
 ARL entry
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, 
	Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Russell King <linux@armlinux.org.uk>, 
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2026 at 9:22=E2=80=AFPM Florian Fainelli
<florian.fainelli@broadcom.com> wrote:
>
> When an ARL lookup does not find the requested MAC and VID, b53_arl_read(=
)
> returns the first free bin index but leaves the entry populated with the
> last bin examined. The multicast add path then ORs the requested port int=
o
> that unrelated entry's forwarding bitmap, potentially forwarding packets
> to ports which are not members of the multicast group.
>
> Clear the entry before creating a new one. Also return without writing
> anything when deleting an entry which is not present, instead of making
> a new entry from stale bin contents.
>
> Fixes: 5d65b64a3d97 ("net: dsa: b53: Add support for MDB")
> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
> ---
>  drivers/net/dsa/b53/b53_common.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/net/dsa/b53/b53_common.c b/drivers/net/dsa/b53/b53_c=
ommon.c
> index 559d4b360c82..0871a10d8cbc 100644
> --- a/drivers/net/dsa/b53/b53_common.c
> +++ b/drivers/net/dsa/b53/b53_common.c
> @@ -1992,6 +1992,10 @@ static int b53_arl_op(struct b53_device *dev, int =
op, int port,
>                         addr, vid);
>                 return is_valid ? ret : 0;
>         case -ENOENT:
> +               if (!is_valid)
> +                       return 0;

Should we return 0, or should we pass on the -ENOENT? We failed to
remove the entry, so implies there was a desync between hardware state
and software state.

If we don't, we should at least report the issue. If we do, we don't
need to, as dsa will do that. Though we then should also report
-ENOSPC && !is_valid as -ENOENT.

Likewise when trying to add an entry that already exists.

> +
> +               memset(&ent, 0, sizeof(ent));

Just bikeshedding, but semantically it feels the memset should be
below the comment/dev_dbg().

>                 /* We could not find a matching MAC, so reset to a new en=
try */
>                 dev_dbg(dev->dev, "{%pM,%.4d} not found, using idx: %d\n"=
,
>                         addr, vid, idx);
> --
> 2.53.0
>

Best regards,
Jonas
