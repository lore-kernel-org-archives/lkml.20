Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794292508;
	b=gVqq03Yz5AqRg+aRrzYQit9K0qa2vwxWJ0mevGMbBNB5Oxipro8/mjY+pjpKbqSdGa73
	 ojlAFij63e4QRu+bjcSfN78BZncmFawqxcrNhuRCZBkQF5N9ymiJ1oSj43bxmbmlyjsWG
	 jG+EQbjQON3MdiLR6efVjsPMe7yQV4sTng2bxhz2TiXb5+Ob4NXFMUF86FX7flg/RP/H5
	 WIgSAFX47dg7kLs6hYud3nq3/EEG0Q76npKzOt59aBqViACn0zVrqA7ljjji/XXYGZ/TA
	 GJyxReKwC6fFBGMLHDyiDm6WXZHczvT4Afpo8AQArl3hKqXVgPeCw7syp9+vbUI4K0g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794292508;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=yms/MOW/VAClKSYhrX3DCCuORfSDHh04cVmGAJVZ3jk=;
	b=nNvZgQ0EgqK1AQtoz5ScKHy3GzLXp5NvSldH3pgfzL053jtrGydSNswmN3c0Xb56ok6v
	 Rhwwkqa1/Xbbr20U6GAZQRcSLlEc0udiUkothRy5PFbpaPywhDE08Up3N8iOa+yA08uKV
	 BI1mLyhJh1Hc8oI5oX1WgsLL3Ktpbb/maidjdMnfO4h5otWP6ehw0LwWMYHr59ZjV4pqW
	 j+WBTNkjp7SWp4nmgNyIG6N7KH2eBWRMC35NSE+KAB10m+tS4u1E4c0cSttf1gM7R5DcL
	 33PxS9LrvE8v2SYXw7LMNNRAqmGvq8U5WeA+mvs8vyMCn9dcKm4ZDTs7zVa2xEwkKZA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=QS5LM1FM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3BC1606A321
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 06:35:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3BC1606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=QS5LM1FM
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c4203bbb1e9so244242466b.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 22:35:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794292506; cv=none;
        d=google.com; s=arc-20260327;
        b=Br07NiPGrwlSKlwdDu38kug58c919f/+IQdp3h0WTUUpEZ4uA1nS03e24iPg/kyMyX
         mXtFdhfZTmtK5dUPEslIrUTEp3+FbolhwK0lEU7kPvTGk+WtZndEOQJgQRwz/MdAYOrf
         ilinWLJREm1/07nU08IEWphLMK4ERUn3jDSFxrPHJbgkkLidw475pYueFJw6h4MLzPHu
         VVsWHkdEmZlBjx3NESisbmasG0qH+WP5TwYh66XL3Xp62WvoZr4mAF1ilL3Dag6uGNrJ
         p1HAqvtZ3lB3c1iZCvfQwpJfeO8U9GlNzdHokBXfRvuKUk/01RNt+az6xMJk3R3C+PON
         lehw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yms/MOW/VAClKSYhrX3DCCuORfSDHh04cVmGAJVZ3jk=;
        fh=Wx+SW0JJfzTKlQAqYSHtP81jpwOvFvpAfh7Vb/m1IVA=;
        b=aBXgYzdJbuCS/WGvs9pW8apzio8iU8B2UBaA1eMKQguRz76sfqqg14FQvsJBYKWB2p
         xGdyZqGKpuJhQ3EygnLXtr1afxAYvXolDA02v+OtjUgKJFVLPI5qXZNf7Pl4PZxncbmF
         tFAApmeAUxozs6bdImdtLogXhL+QBgs7E8cfRGOJ+83y9dIflpEGUwHobqvqYlF8+Xyc
         J9GU9YI/Jav+B79IaO0+f/WhbOjNY/GSRu+GtXwNLPKzdLbx9ABxlSFJzQ9sEBI59Xv6
         u5U59EtPhmRuV2Gc2GdmRGenk0MKdNGcg/uCDAlgOAo2glLgDtnOrt0TRv+Eh5qHsSSk
         3P/g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1794292506; x=1794897306; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yms/MOW/VAClKSYhrX3DCCuORfSDHh04cVmGAJVZ3jk=;
        b=QS5LM1FMbPzdChydpLxU58IliuEhNfcDAqRmHDm3mMZ+MiOC+MSUpLE3DoccfzLbjd
         sXv34iMGUGocJKpYUubaa4NqZqW1qXomZfuCt3ecdYJFS8RWAtwz+EfSB24j4ZVzbvbv
         9TWfhX3lHYswm0aUabBkuTkhlSn0v3v9qmnPPfnE3IllO+t++8BwB8PjTD+ZYYGEjs/C
         dh00ORY+lxY7YQrcHnOrvAgsWSfzQRDRyc+PJ/uQJELdw3nM/uhaklNbaX2iJQUb9Ehi
         1uXNHWzk5etVguBlml5Lal8RJ6vNZGuG7EoHkKyKuBUvoUMXCFSk4QQi5myJmMYSHvV8
         ATXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794292506; x=1794897306;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yms/MOW/VAClKSYhrX3DCCuORfSDHh04cVmGAJVZ3jk=;
        b=sYM77fzV5GwfhJxnVYdkK6ychhWE0gkWWLcgapRYBI8KFuL+ObeY7NNynuociRKEYQ
         OKBpWOpXgiXHcFmyiSaA4putWTF2BQYFpKF5c42GNtyc87HnJ9xP615SnARHTPbUxARb
         Ix3CyOdqaSN5zzMqF/K2FWuXlNQlv5Q02K5OJ+BvhT5cDkyReZq98CuH8SBnkvWYSq8s
         6Q06iE8fycnWK/zxc1GH4ko6fIdRv8NsWH/AeEQ7a1Acl3UZ9t9ayw8r4Ediw7CRHbSr
         q2CCgJxPdO7V/gx5WHaeztmJzANaIW+OEbuTan81Ys0Qjw3i+4FTfdAUAQLKyvnwnoXt
         CMyA==
X-Forwarded-Encrypted: i=1; AL+hErHfw8rOIglV9Mesa2qRx4ZbUBj3v3h44jUc4mhbJH7gkSorXbVWJQaT6GPCQ7e4IqyaQQ84fvlT02uND7w=@vger.kernel.org
X-Gm-Message-State: APuU4Z+yqwGv+CMN2AWlOnGZfmgamsFHG5qQa/ZIYRuWaCsYjz3sZGBu
	oen3TTQK5SN+zsvUPD1TfKSw4U1g+VlBoxKrOxHN63Z3l+abVUuBrOu25Go6SzNpk6VqnjLAOdw
	8z87nKF9H36muyNR0+xlpTlDMX21+6RhtTkUO+DsX0w==
X-Gm-Gg: AYBFou3cG6us6BNTmAyhV9eE/IBUBqKnllQHoYVgIIfpMQ0GksJqV1qAbk3j5FmrwtA
	jQmm2AwiEODCd6yuJgJU50r/lF7PCICmOJ07BzgNTuPu+CHo3VJHh0yTrCJMl3aQw84Umu4ZKXQ
	AMh43N8QZOXPf9if6j7GiqymNJXLeosdQeI1zIrQb3mQBK+5e4U6FbikcAR8ZtTVoDK3qhffc37
	j2F8KwEeSxjRNQHt5edgo5kI1798Ux11uHLbs94bLAPxLRG4W+iZWKEMn4wBhsgHN+mjLaNyuVl
	SW3FPSxZVH8qavdDxhN8xsRV+YLGUgiBTm69cGgceKVMj3i90VrbYj/aZvk/hgyJZPlMEm5B8Hf
	xGq1lih/nYrGrSNs2Qk0yH3eVokxXy0vRFAROPvTDUN+Ddpx390zzxPfQoxM79V6eqKIa
X-Received: by 2002:a17:907:3f0d:b0:c2e:4a61:d436 with SMTP id
 a640c23a62f3a-c50495d6ee1mr127887266b.36.1794292505807; Mon, 09 Nov 2026
 22:35:05 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102-bq25792-v9-0-65f223e95fbc@flipper.net> <179426549236.3711751.6417012163300457231.b4-review@b4>
In-Reply-To: <179426549236.3711751.6417012163300457231.b4-review@b4>
From: Alexey Charkov <alchark@flipper.net>
Date: Tue, 10 Nov 2026 10:34:54 +0400
X-Gm-Features: AclHuK9pc8-UGCoY8qoJMcDm1W89S8IUmtpee84nm2Kphvd-KkvUPWFG9vri-8g
Message-ID: <CAKTNdwFsC+o_vAztfBZHyxDT499eOeQ4VxTr2xjAF2Xca7D2Mw@mail.gmail.com>
Subject: Re: [PATCH v9 0/3] Add support for the TI BQ25792 battery charger
 (regulator part)
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Chris Morgan <macromorgan@hotmail.com>, 
	Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 3:11=E2=80=AFAM Mark Brown <broonie@kernel.org> wro=
te:
>
> > This adds support for the TI BQ25792 battery charger, which is similar =
in
> > overall logic to the BQ25703A, but has a different register layout and
> > slightly different lower-level programming logic.
> >
> > No cross-tree dependencies here, as the MFD part is already in master.
>
> This doesn't apply against current code, please check and resend.

Thanks for the heads-up, I will rebase and resend. In the meantime,
I've also added some further functionality to make it safer to use
while sourcing >5V over USB PD, so I'll restructure the series a
little bit while at that.

Best regards,
Alexey
