Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794187902;
	b=n872s/MxsyJaYLNdyWk9X46+UWpX12p3lc4cgD2VqYXj8+mavEtAyZJMoK1qVyMECvyR
	 VRA4pVWHbYhdKRMg+83n5TLVVZ6U+dE6h2VuHQtlOy4MjjObotibzQ6J4vUY86qzOe95P
	 sAxhZ/X1BJaHAbdfoUg2Uw8Uevf6Rwm91LYmqFs71DPjM9K+g7QngnKj0RYuDBrMo90OU
	 LQbK4KtL4IVC9S8qfGQgTIaOgdo/MxDkvCfSuj7z0EfuOfeqg6yF9fvs4YD7KGLUIwo37
	 SDxr/342vjVQRU5ZgR2D3Fj+zlKSl5ZBH/012UyxlgbJq1xMfAhMpfsmTwsFmer1dbg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794187902;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=8BIGtN0edeJ4AHaRHTPlYTsz9LtH9rZv7+zpPDlG/eE=;
	b=bInC3GnTodd1+uy9lDrx6g7++Ga9ZnYSA/U07rKJ1sN0XXpAkLLedgiHxkCgaTHxabNB
	 9DtdvN2Ikad9Gd0KUkvu2wMhYtqdTzUlnE8sQmQbJo3QauCfjS118PedanEMkUNC4CN5x
	 5HHpfQ2yXNLarN3moqsDkpYd9pSx5D/0ZaaRkveQlVBcqCT9X1nCffJOFZ8S4SHi2zI0y
	 tAE3JvyJbjJglKbuc7Y79+QQdWD1rO/RK4OBp9rz8exU1XyYmkuzGpIe65FNzXbkwppOk
	 Y2VU8kToUAY3BVI3ncfR2qiOziv8EzcrBQhu5jQ4z6BbUM/Zp2GrdxvDgIL+Sk1uc5w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ge+LOS3W;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6E0E606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 01:31:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6E0E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ge+LOS3W
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c4d427836e9so47691566b.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 17:31:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794187900; cv=none;
        d=google.com; s=arc-20260327;
        b=Ia6VNy/jpNiofKknefZHQSFLAqaQafddqzKpwSjXq6E0J26/OsYgVSbuV/GBwZRhWB
         f5W/g+XIqA3RR/Z9C9CAiJBNKyHY2b1spUdvh2svj7AxTyhuiHIaQLlfoKHyMUeVB5Zf
         031xXKgbKsFZUlM61f4qvUMsAnAi67ia940csHhc+QXf6jbuVnNoxyjqqkyNHeh+uyvF
         3BeNUR7oApfVBF3BAnECufQEBPZEad0sKgok+quOfiCJ0lTWq5qq9f6+42JjK3fD9iNS
         CQaMNSilfa6hpVlmwvbk06QswJaGUs7KveUGxJuJwAKgVkYY9DYOMIFA2ity8MTXo7k/
         N8TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=8BIGtN0edeJ4AHaRHTPlYTsz9LtH9rZv7+zpPDlG/eE=;
        fh=ReKUEf8Z85xnz23eUZYjulYeoM5jIetnNBhdLfewhQQ=;
        b=sCN33Jm76JGX/IxKxZRw9preQkncdhlFi5jmTN2ARFNt0KCwryX0J32Vds9WLHUIFZ
         0Xj77PHbaSfJbytkQlAeEcH3N7lgOtjwX1Nd0q1fX+gOmmh0zd0yz9ZudD/MiZ+jr9wG
         ZtGmpufTJnFbLpdTAaPFIBZXyFlNT5YpRxc6LN/jDTzm4Fv/Ti7uvBQVpzxQb8OVwKU7
         xA0cYWO8lzssj8uZvgXtoAng4/ZCQZrQWTUuxwFms1iQVuhJan/0t/i5VTB6qYmjdmkt
         3+6ZXcB9ifxHRj2QcNPzo+ZtaQ5MSe3Acg5LcoJO5kUL0eXgoK/qMUwj3ojkPFG3nodW
         GQdQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794187900; x=1794792700; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8BIGtN0edeJ4AHaRHTPlYTsz9LtH9rZv7+zpPDlG/eE=;
        b=ge+LOS3WxfnHTEwdhQ6dKX1jbsxpegXgckUlJ6y01orTMKd+m5sibi7bInvWsMo78h
         C2/zNnXG1VC3f5bz80QMZyKB6evOJV/x+PbT8cXasMtrkA4aJNuXmv3LGwDVlLh8tzPY
         6dB1QX+GBwsRxNZAxp9dR+31OSw8XboQB4H57FnJUu9epdoHupDM9ZrWSLdL6eC9izuj
         libw1te3jgL/ek9dbuZNL5DUuTP600NCQmYIt8o8ah1beX49iSO/BryQbq99vZ49+fme
         xUis1ENCn9E5ote723ny+P/OTkxlK/ydftsYyzkal0mxjNOX4mdY6GBVYEabWs8M+rs4
         Jpmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794187900; x=1794792700;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8BIGtN0edeJ4AHaRHTPlYTsz9LtH9rZv7+zpPDlG/eE=;
        b=NCv711xTrDvWpd/4c7VHblroR8BrGqy/7v6+xevkd3UJFyoVkhRsi9Y1cX+xy7vCZ9
         iL9Ry6rmtGF3/4cTCv3SnVzrSCuk8bgD+HwBSETMgCrCVeeheayccgCfL58VjVaAkR8M
         D2fTBMLZE6FfzH9twIfKUrZPeM4rc0ETKL5LfURvweN3XcuROSj9RMLc7MArbEGS6Gqe
         hn6QQf2Bx88ndyhKMOjCnxf7E/gaBb/Gnva9j0lxQ2dnFeT5XbYF/022oHDAlwv/YvfT
         XfX/fc/8PSHl+iHNee0/3QLaVgOdNkYc0kuswjXQG6T+1HtT4mijF99Ik5NL4Ti1kKFf
         hKnA==
X-Forwarded-Encrypted: i=1; AL+hErGB/aAWhkZVBvSB2ECl84Ak+F74uksztiBALTMWI+Xg9oZ0jIHdf3ZLYtsGev1S/Irq0vUoHUpfdOUNAOM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+SY4x9H4ylw5EUEB7mHlsEZydWqj9Du0NbzO98/Ql6xjdjlnvo
	a1zJuFQEcUFWuV/WHMRPM5q4pJ1xMb4Ys5gf5OLwv08a+j0cDP/DMY7zW4ka8HQWxMqANH7kBhu
	TicW4vgW4zSpyyVZSioLd4chX4kCSER4=
X-Gm-Gg: AYBFou3GfSsxq8ZPKPIPecyoZgwf37RrK8sM4uoDGzgKi9TZ64ICvu+fgmTiqCw1dil
	vdSZZpcF0kger5h88l0d9lwh4/+SZNVL9alCRC+k+cbn0nqHDuVQeryySaCuY5sHYYrPpzUh1Cx
	7S7/5MBoBZiXLGZ3+AZhMwQ9gCxrLEL5kNwSbM2TwAdnvs17frLn0aYPi9fX/gVpNx9gFOOnTrk
	nxR5Y9KAGr7I7owmaNSoLm9V2v3PP51jDy2SehDDanJQs7m78rd2ATJMWi24hsuRePMwveSQoTK
	eap1Rh/7jI+4uekU/6ZKLpTKaWWmoZyDHtknf0cRdJnLuJ6egLhCmDA45XpPG+n/XcFJhAIabVq
	piKulZxtnTWtmaUfGYgBvTi18c66DJLxR76yo+VQ59yTYrs2RfFxXPa5KEUudcaP30ox9NA==
X-Received: by 2002:a17:906:9c86:b0:c40:4320:de2c with SMTP id
 a640c23a62f3a-c4d6db2544dmr166233166b.15.1794187899962; Sun, 08 Nov 2026
 17:31:39 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <3bf4dd70-9771-497b-8c27-e925e0ef81eb@yahoo.com>
 <1ccb6acc-0809-4abe-8443-576f6727a6d5@yahoo.com> <ausoMS5PcpEFz02i@analog.com>
In-Reply-To: <ausoMS5PcpEFz02i@analog.com>
From: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Date: Sun, 8 Nov 2026 22:31:27 -0300
X-Gm-Features: AclHuK8yR5gI4v3iGi6WeBIKPSmMJ43uWzE0QqErM0CadYyGtJ6MIzDVMxKV56Y
Message-ID: <CAJq09z7djw7MAbjc8jZuNsj12JhNCUOsGj-Ve73XwRjjHHO=JQ@mail.gmail.com>
Subject: Re: [PATCH net-next v7 05/10] net: dsa: realtek: rtl8365mb: set and
 get vlan 4k for family D
To: =?UTF-8?Q?Alvin_=C5=A0ipraga?= <alvin.sipraga@analog.com>
Cc: Mieczyslaw Nalewaj <namiltd@yahoo.com>, linusw@kernel.org, andrew@lunn.ch, olteanv@gmail.com, 
	kuba@kernel.org, davem@davemloft.net, edumazet@google.com, pabeni@redhat.com, 
	linux@armlinux.org.uk, maxime.chevallier@bootlin.com, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Don't you think it's better to just split out into family C/D variants
> for these ops? If you do so, then I think relabelling the old macros for
> the C family with RTL8365MB_C_ prefixes will also be appropriate.

Adding a `C` prefix is a clean way to organize the code, and it avoids
scaling issues with `is_d` checks as more families are added.

Splitting the logic into subfunctions handled via a family enum switch
(or eventually function pointers) is much more maintainable. Using a
switch statement also has the advantage of compiler warnings if a new
family is added and forgotten.

Here is a revised version of your response, keeping it professional,
concise, and clear:

---

> Don't you think it's better to just split out into family C/D variants
> for these ops? If you do so, then I think relabelling the old macros for
> the C family with RTL8365MB_C_ prefixes will also be appropriate.

Adding a `*_C_` prefix is a good way to organize it. It will get a bit
messier when I submit the RTL8367R support, which I arbitrarily named
Family A, but extra macros won't increase the final binary size. We
might need to duplicate some macros once we have a register used by
more than one but not all families.

As Alvin mentioned, splitting into subfunctions when each family has a
distinct implementation is much cleaner. In my WIP tree
(https://github.com/torvalds/linux/compare/master...luizluca:linux:realtek_families_wip),
I handle it like this:

static void rtl8365mb_l2_data_to_uc(struct realtek_priv *priv, const u16 *data,
                                    struct rtl8365mb_l2_uc *uc)
{
        switch (rtl8365mb_get_family(priv)) {
        case RTL8365MB_FAMILY_A:
                rtl8365mb_a_l2_data_to_uc(data, uc);
                break;
        case RTL8365MB_FAMILY_C:
                rtl8365mb_c_l2_data_to_uc(data, uc);
                break;
        }
}

This is how I'm structuring it now, though it might migrate to
function pointers later. A family check inside a shared function only
makes sense for very localized differences. Since family A is shaping
up well and family B sits conceptually between A and C, `is_d` doesn't
scale well for future variants. Using an enum with a switch statement
also ensures the compiler warns you if a new family case is missed.

Best regards,

Luiz
