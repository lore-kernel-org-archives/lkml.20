Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792544716;
	b=HPQVmRZyGtQ/cABd94HA3OLPv7nPuFKync4pzW/bVKPNVkQYsXSKrOeyugPblsyWJ8s1
	 DAEtnecV2CC0JITQ8IP/DYgM/RL/x/wzvpMd9pUznkajz9NZkKmTBFsFH1Y0gihvaAYqO
	 fEzTQFylFJ0CqUiGCGX+4l3seN7JibGKKIxhv/JOptZdoAxX3g1XEVg8exImn3+oyaIpr
	 gnosNAWAsMaXK6/Zg3oU5AgE2Pj1IbX/ZQBWjHuAkyxfdYx3IFLHAes1mbdbOj86GrMAB
	 eklRp8FYaMgNO9pfzIzE9E8terIjBU/pkvscyKlx/IB5vjSSjNKy+1cvuER00Zmr+ZA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792544716;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=z0hLEERCsjy4axc50ookcdk/sfqny83SF+wLsC++daU=;
	b=VXrlE26BtpwbmAZHq6nn+qkvLdtJ6nFktMv7A3AuZv6KTa5+raXs6kwaK9BS+sxhnUvn
	 gQXU1edToxq96qvqTNqBrpjcm8iEslpvz1xLlEGa45RfzmZNF01QiaAzgaBISsN5fIbf7
	 VoKe8tV6z9oOOwSS9vKjaRDOmtGWmcXkaScSs1Q3UfFM0qYppAHt5Ot9u+DfAOG0NOL9R
	 qh9jr7WUzFx8ksAUN87n7aIrsaN1B9nOsed+J/D9ExbVxxm7R8vxPo++iKF+JJkIQU9tU
	 hgfSkKvX/X1a8IWnAJcoCBfHlXGwAgKPZO5Bdh/s+J5lr7QqEsoTlHB+tWbAEiOZnHg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XpITqnsF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.176
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4B32606A31B
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 01:05:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4B32606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XpITqnsF
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-504ae5941faso116150b6e.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 18:05:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792544714; cv=none;
        d=google.com; s=arc-20260327;
        b=HA+Ba4YIajVgKsD/XPq1CZmSQ8Y7ByF0KR2/4opluCXnh5tnL1YJW1jiahgUoXh3ec
         qYglu0g44N6V9GMn/IKloHJFOapKtwojVooM94ASUFFIPxmsSW1kvK6fzcU8Grst2j9V
         8PYBJOkX7gUmpotZBveuax9nrj5Vx0lnS17IGxJ80KJwvB5pXt73IR/X9+0hq1N5t/hn
         /wP9zrG5L8rryAM/dpSz6JmHcRj5+5TUC4eQT7OFZsuNxC8BmC5wK0KW6foI+BUwUHo3
         mbtu2W55n2R06gySmcsXZRASBj64q6JzQoOEG58H3EWJf7Gh/jkPbQX0csrB35dk8kP6
         OANg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=z0hLEERCsjy4axc50ookcdk/sfqny83SF+wLsC++daU=;
        fh=eaCW2qZeuxynUZmobDuhqM8Mep7Ueh217uRJL2I3GGY=;
        b=VaTJiOSn8kmn6F3MnSBuloualR6KVlWAUOT2W8CWlwcq/jNIPahQ8OGWQEaAuHStQk
         m40NPc5Un0QoqiqtnE+XeZsrYfiyaJX/FGpb0/AW4x+iXs7Nn70e1/eTd3PnhnnpyF4x
         2/Sgb7gW5fmslF21loOhmeCQor7gQ+82T58m3B292kWyc+3kIR9HdjULsA+JaKAtytfg
         eMPaT1nSnbho7DeqlhNDMKdA/azbwfZ26ViMG0HxGDU/4XHN3ltW/bxIJ2552ItEQ/Ae
         fOpk1uDab7wSmzkoR9XDXPQvmaAuMcwdpYnLPZbkPk/4xi955nXOTzyGU9isOCHlqQp3
         MA8g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792544714; x=1793149514; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z0hLEERCsjy4axc50ookcdk/sfqny83SF+wLsC++daU=;
        b=XpITqnsFVbmsA65tYcRzfHxyxSBcJK65LXclrQMybNFaokMcv/OBBeyqo0kpkyI1Oz
         UIwPty9tmb3wXk1P3KAZiHvh/Xf8iZOvIWLgxX7ooqdP2YzZOpqRHht9VGAwaKDkipFP
         QKaRzRXaULK+cDuLvOlEAAZ2+hDTdtRyNZMk9+/ln2FT1v6kDPKEsszkJrTCW+zQbp1l
         HlR3EsL8jhTsxuuY38fVH+N16er2bjK6ZsuV2Ik/3Tw3EqsaFHIbQtWgvuCH40rwgS4h
         vgRacjtbDhOpfw07WskUG3JwQBdRTbkI4rRyEj6tkHY3ia90cF7+rhFPiZd2E7idWXUv
         Z3xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792544714; x=1793149514;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=z0hLEERCsjy4axc50ookcdk/sfqny83SF+wLsC++daU=;
        b=zF8ghG04Xv7ZViizz5Y6Lc+kg1FrYwX80ODnQtG8aYM6D6Zpy/1cH/sXmdIsSkib5F
         EabML3AUy8O0hrW0PMLfx+QxawCyL6oJW9AnWzJ8G6i5Tcv9fw+y2cdid7fx2nj00zI3
         Zf7TaC1vQYq6C+9mgKqWo1izayvHNiHijvz/ldQHcJ6jc/Iit1ZAPHqqFQdBQ4skWffr
         iT/vFBj9O2Y1ZWnB7iPkYTiGp7tLzJRQ2VXHouueSHiIjXGvkM8zwO5OkqHlESfluw7n
         6MHHe/5KQIyKZPPtbbsu9fO2Ga6tERE/0DfQIRB0REj6WwqAyQrj9y6fVPEWtpsKKD3B
         I3BA==
X-Forwarded-Encrypted: i=1; AKwUvBxbN88gQicoIfG/EX3ie4TXghkDwGVtZAabAfPdKf5zDVPktgpzkYtlU9LPHFugvLckmM2OFrGJBRESGJI=@vger.kernel.org
X-Gm-Message-State: AFq9FYK3iwzQzi0QXQeXXYgayr21mSp9KTN697E2EYIahyiFME9GrrMx
	jhsdRRcrW1860Ye/e+ATuxJsKQ3NWoudtJhOn5/vUjmsQJnsllWHbfkH55L5KGVFYhbft33OyDd
	11Nd7IWBL/oXJ4xES2GRG0yVSuqxNobM=
X-Gm-Gg: AYBFou0i33u9Jfzw9LgOZ8R596s8pFWSB7JWaH1lnwXAcjZlxM8bltBMvY/cqEFM5V4
	HZSzo6fbnu5kebrh50e7lynbkUxuIwhPO4y/TNw4f94La/hiDZro3kk86PV4Gm9UBm1nN70oWRf
	xa3BvhFXwSegqF9aMmfE+XXAUpD7wQPJ8QEuJQeAZj7QQVdjroqsH5qHaxx35H0W46Qsk85IDcv
	UWHksyFfvDUgMBhJaCcTbaxippo7AXKLWGKjXTdMNFo1wpu1gCa9l1LeKHLT/rsgmC+R4pkhoqs
	hUzZhJ6T39/BAUrswUZD9msqaXBj5NgCbrYMxUnnQ0B9/9+/MmThugmrqdbTvrri/XpA8Muj+vh
	ytJoXDdV87xZ9IDKlHptRtRRAi6FcPkEa7ft+zl+RTzHXPkIJM/T5p8yoSmJ3R7hahfqM6jeF
X-Received: by 2002:a05:6808:5147:b0:4d6:9153:295c with SMTP id
 5614622812f47-553596fe6afmr356471b6e.45.1792544714494; Tue, 20 Oct 2026
 18:05:14 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261017041419.311921-1-daniel@0x0f.com>
In-Reply-To: <20261017041419.311921-1-daniel@0x0f.com>
From: Colton Pawielski <colton.pawielski@gmail.com>
Date: Tue, 20 Oct 2026 20:05:03 -0500
X-Gm-Features: AclHuK_WbBRvyFNBUBGOV4aGPihFuEs2qYf6-xkzjASYHC6uPBnvRp4v0utSWw4
Message-ID: <CAJpaz4abKAkDznoi3gczYHNQMF-j5cSajtG07Jws8LkFY9DZFg@mail.gmail.com>
Subject: Re: [PATCH 0/2] sh: Fix IDE on landisk
To: Daniel Palmer <daniel@0x0f.com>
Cc: ysato@users.sourceforge.jp, dalias@libc.org, glaubitz@physik.fu-berlin.de, 
	dlemoal@kernel.org, cassel@kernel.org, linux-sh@vger.kernel.org, 
	linux-ide@vger.kernel.org, geert@linux-m68k.org, linux-kernel@vger.kernel.org, 
	fuchsfl@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hi Daniel,

This is my first message to the mailing list so please correct me if I've
done anything improper or non-standard.

I tested this series on three I-O DATA LANDISK HDL-U boards (v7.3 +
this series, landisk_defconfig + DEVTMPFS as mentioned by Geert).
All three boot from disk, and the ATP865 is detected as
"PATA max UDMA/100".

I have different drives in each of my LANDISK devices:
- Maxtor 7Y250P0 (native PATA): UDMA/100
- SATA SSD behind a PATA-SATA adapter: UDMA/66 (my adapter
  gives ICRC errors at UDMA/100)
- CF card in a CF-IDE adapter: UDMA/33

lspci from two of them:

00:00.0 Ethernet controller: Realtek Semiconductor Co., Ltd.
RTL-8100/8101L/8139 PCI Fast Ethernet Adapter (rev 20)
00:01.0 Mass storage controller: Artop Electronic Corp ATP865 (rev 07)
00:02.0 USB controller: NEC Corporation OHCI USB Controller (rev 43)
00:02.1 USB controller: NEC Corporation OHCI USB Controller (rev 43)
00:02.2 USB controller: NEC Corporation uPD72010x USB 2.0 Controller (rev 04)

The third is identical except for the ATP865 revision:

00:01.0 Mass storage controller: Artop Electronic Corp ATP865 (rev 06)

In testing I could often lock up the board when transferring data over
SSH. I don't believe it's related to this series and am fairly sure it's
in the 8139cp driver. I have a candidate fix that I plan to send in
a couple of days once I've tested it further and there's no more
lockups on my hardware.

Tested-by: Colton Pawielski <colton.pawielski@gmail.com> # 3x LANDISK
HDL-U, ATP865 rev 06/07

Thanks,
Colton
