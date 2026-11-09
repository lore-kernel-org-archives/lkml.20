Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794191709;
	b=B7ZQcVBeVEkvP1ROvSa6oIwVNthGjMCfyjzwChhTsG1gZ4gzY9PLokEhPn1N8wA0/uXX
	 +VJRjMgfNqcpoI0R4FR5IlhWt5Py/2XmXVEbVvqqo1nZ7RyvLZw/rIZhxhu2hcB8Xr0bA
	 jG2cpPjQ62OstYskNhlzIkCEEbM9zkDOpCmbxoWfK+Q1px82cX97AWYZNbLyBZU3U5crk
	 Z4ZA0V8HyobZ67j1oHAARALfn3ib8CTVKx6Fcjo1T6spvs1E+/JE7Ax+iMX516K0drKIt
	 CnAK0psdTnAe8DlFRJEJqKEJGchI9B2EUzJRTvTJSAQugV3OZujVfKVTXrNVGm0tzng==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794191709;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=iPEE4e+FhVTbeOQfC+hq3HXlXhp32T0R1afgEhwbTZY=;
	b=bvndUnJROlZiBZcgKc/+hvwqhmFrSFU0fHecotNyXKVKx08JCqnrXTV7X7hIqfD0x/lZ
	 g1/hlEK16LSBa3Q3LBVV+5riYXK3LU6FvXiPKYacUBxO3rhVOl/P5b1PYdbMh/BaIMokl
	 B9AV9hfl0zWjxHce+XEw2V4vEFH14TYXvSatfeUEYZlOe5wMgFWvJpZG20UF+t2dBABsA
	 jEN1Fn/JiujzacR/UIdtShgSSckdCyDhLAcYJjgalqtoSHLF48TolBRwBIl/KBxFZh0Kb
	 bukfrByBqar8i164FsOy2uqgDuI0KHWPIvOeGK8YtOFjm3XT4pv0Cgg9Dwl8BpoL4Rw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eZKm54WY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.43
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57CFD606A32A
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 02:35:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57CFD606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eZKm54WY
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-6f8a519e215so353740eaf.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 18:35:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794191708; cv=none;
        d=google.com; s=arc-20260327;
        b=mtqg8569kDlP0ZZWw3DbqAZ/HVxC/jM9pWNHcqzjKXR5P7bYe4UC63Ekjerk2zUM9w
         MjcU8pq6gWAfFbrwQQfgyJ5ODqKaB6t+Yjd4ZowM+e/ChvIi87AH5ci5TE3aQITKrPEw
         bhDOeH2FHTQ/x4GqiNWNy3sYk8fqCGHZyUf8DWv5zPiBsEKFKMZjkSxyDEDBoxLv3gEQ
         xnm0NMSemVbTsCxpDlHne5Jg+AgVNq9ZN5WRwwSp4zgHNd7GQg7mva3MheTu90eLLUYl
         UH8ERdCbvqk0/RPQonFNFnhS14ILv8H9Uue2snc9iADu2EncB0H2J0VXwZEE5E1Ikb4d
         EznA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=iPEE4e+FhVTbeOQfC+hq3HXlXhp32T0R1afgEhwbTZY=;
        fh=Tceclw7l7SYNezjBN+ocKoWYNMklVcG10e27rr0CklE=;
        b=iGhYV01ZtdxJfLrO8PSeU1i9Rwn6rfGWTJEMjBEN/DMfvmJdFSZVHnwgLlGyhqiKz4
         av4C/pczvFulwjsJv7+E8eM+WTrUSx+7VtUMxxx91WygI7pg9z5tp7as11E2P6cqGOey
         mZ+DKpuR1kW2I+ikQGLyC7v6En5mRIRqOmSkE0cxo2b+8FcUvYken/ckcFGLlh6dpobf
         MgFAvhRzGaqBDaH5uffZd3CX1Utz9TaiMv8xujZrU+aZRtkxBvf4o22TeusovJpQk5gm
         cv1cMj9vCygBFBlFyvnC/59nPvbU01AwxLJ7vBN7IzA6JJVzfbeUWfB/CuOIDWpE+fmx
         Ec7Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794191708; x=1794796508; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iPEE4e+FhVTbeOQfC+hq3HXlXhp32T0R1afgEhwbTZY=;
        b=eZKm54WY/ijAlIPxiznq8wqeep7LsgU3WAKgxqCqmAr9oNmREkx1We66q5WLkl3Ddx
         tDmcH4KNis5hcw008QZVPPMAUSy21pp6qkCi0yatqUfDYtouoRcf0jIYjRJ+exVSDvc4
         E6mAxrPqVx+/8zShGbDcDNFhFi1OO3WUAgjn68BZGeB7RH072CfRek4ZTHHbQZ5YC1NF
         2q9KMdUrsZS2zXHXQdA4MbWlKZY2sa0clc8KtyoW4/t9ZqAvR8ob/mm5O+RATpnB8HxE
         66YCQ3wORdtSC+mznW1di8ps66AiQbDsQEv+4XIucZbnvAWQCbEFAaAE1s7kDqYqN1a6
         q+JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794191708; x=1794796508;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iPEE4e+FhVTbeOQfC+hq3HXlXhp32T0R1afgEhwbTZY=;
        b=fpbq7IF28wo0+k+24bgN1JXF57fs76aLVl5BCGSOK11CfApdbRrMEEPW2zylTA/S3M
         5mW23dVHIKbYCAhXtY2Inwp+NH+Qrhfl3OOYwX3ZNCbqij8VSPL3AkP1Eo9BW7hKpNd1
         6Sg7lvtVhCynZNIEbEJFV3xT5fAPiGHCWx8CATYA9iqvrRwJo/fDgSCEBcPWVMrHaJV1
         nTRno5QtHsd6oqoWexYbBF/HCDYcbcIuzRaF2le2vFvk8A8Au7fuzIJSw3H0LwnI+5cZ
         OtBNJ128LYAowGiTuYLVwgAiLGnF6/zbaCJB07hv+lvaSCata1GVzwQLIkX2IPUc9I5E
         qUaA==
X-Forwarded-Encrypted: i=1; AL+hErHfklUEeh1SrVY9cjy7JjAHTmql0VZZtA2k5BzwPu3LnBdS/nNs3yz+5VbAtR5jloymXC8SSP+q9sRhkN8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9kLQiUSfm+h8xsNS5vJnS7ubO/0o4mXNfc7a25aTHtFyPVM1Fz
	Lj0fdEuKT6g5PNdydmB8sdX/bpwhyC2mOEYmR01iBPajnrN/tONmIXNq8wobFQtoqF63JPJRbOQ
	7X4WahXRJv9a1h1XLwy5TKYDVlJ3euWg=
X-Gm-Gg: AYBFou0wldC10SpnjAd9xv5Tg9JdQX2NXbC1fl/wh6jDAItSUuRNiRifAdQ7Vg56twO
	Xo/ZWg6nM9MA+1dUB+fOaiT0wvbVWyRi61paeqY3aSFgx4BFEAPc2C3u+yDSbIPM1S13F10Fi7g
	hPyS+j1dpjJ4MTrtyGmnJloPypF+ZvJtKLAUvCxidqGboPUSfe38Vu5h147gCIPzhC01M9hNBhI
	vEb9cOjqXC2yUG7dJTnjxRw575P8M6uflWbCxJZv2dqXVsQUirTRbliklEV4aJ1/B55nj7vosYL
	SZ9We111twKCirUEWd9C8ksvVstoG2CbofA7QFQgsFyzsy9LVUCk93TMUoOvI80uEqaZVepNnAX
	gOgTrC6pOPvt0CvIOpQfhaZxvQsVUPZ8Zw83lIEMfTSGPvhCmmFBWwqF8rUDZMLFiI8R/Sw==
X-Received: by 2002:a05:6820:81cb:b0:703:ad5d:e673 with SMTP id
 006d021491bc7-71700ccc4a6mr2488203eaf.30.1794191708251; Sun, 08 Nov 2026
 18:35:08 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <3bf4dd70-9771-497b-8c27-e925e0ef81eb@yahoo.com> <88239c31-e161-4623-8dbb-db39f506af6f@yahoo.com>
In-Reply-To: <88239c31-e161-4623-8dbb-db39f506af6f@yahoo.com>
From: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Date: Sun, 8 Nov 2026 23:34:53 -0300
X-Gm-Features: AclHuK8y5AYFHGAYTEdMasnfFP8h-556sx1sTmQKK0Jn_aTTYXz0xJVOxMeuACs
Message-ID: <CAJq09z6UsRtbjF6KCMKuTTC1gcp=4=h024EuKuRYwvgLwSmsFw@mail.gmail.com>
Subject: Re: [PATCH net-next v7 09/10] net: dsa: realtek: rtl8365mb: make
 L2/LUT access work on family D
To: Mieczyslaw Nalewaj <namiltd@yahoo.com>
Cc: linusw@kernel.org, andrew@lunn.ch, olteanv@gmail.com, kuba@kernel.org, 
	davem@davemloft.net, edumazet@google.com, pabeni@redhat.com, 
	linux@armlinux.org.uk, maxime.chevallier@bootlin.com, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> The L2 lookup table on family D switches (e.g. RTL8367S-VB) differs
> from family C in ways that make the current FDB/MDB code misbehave:
>
>  - An L2 entry is 5 words instead of 6, with a different field layout
>    in words 3 and 4 (port, age, static and multicast member bits).
>  - There is no EFID and no per-bridge FDB isolation. The register at
>    0x0A32, used as the per-port EFID register on family C, is the LUT
>    aging timer on family D, so writing an EFID there corrupts it.
>  - In the table access interface, the SPA field is 3 bits wide and the
>    address register is 12 bits wide, with no address extension bit.
>  - Only ports 0..7 are present in the LUT and there is no
>    FLUSH_PORT_EXT register.
>
> Teach the table and L2 code about these differences, selecting the
> layout at runtime with rtl8365mb_get_family(). Family C behaviour is
> unchanged.
>
> Specifically:
>
>  - rtl8365mb_table: use the family D port mask and address width, and
>    read the hit address from status bits [11:0].
>  - rtl8365mb_l2: add family D unicast/multicast entry (de)serialisers
>    behind *_any() wrappers, pass the proper entry size to the table
>    layer, reject ports above 7, report SVL (FID) entries with VID 0.
>    Use age 6 for static unicast entries as the vendor code does, and
>    look an entry up before deleting it so that a missing entry is not
>    allocated by the delete.
>  - rtl8365mb_main: make port_set_efid() a no-op on family D, add a LUT
>    init step that clears IPMC_HASH and BCAM_DISABLE and programs the
>    aging timer, and do not advertise fdb_isolation or
>    max_num_bridges. Traffic between bridges is then isolated by the
>    port isolation masks only.

So, family D does not have EFID support? I'm curious how this will
work in the FDB table when you have two bridges using the same VLAN
and receiving traffic from the same MAC address. On family C and
earlier, the L2 table uses both EFID and FID/VID as lookup keys.
Without EFID on family D, what are the implications?

The number of EFIDs defines the number of supported bridges. Without
EFID, should we limit the number of bridges to 1 (or prevent creating
multiple bridges with conflicting VLANs)? Turning a used field or
function into a no-op without handling its architectural consequences
can lead to subtle bugs.

This highlights why a simple end-user test isn't enough when adding
support for a new family. Every feature needs to be tested
individually and aligned with the driver changes. I've had the
RTL8367R up and running for months, but I'm still testing features and
finding bugs (and the support is still incomplete). That's also why
the VLAN/FDB offloading patches took so long to get merged. Alvin's
original implementation worked well for standard use cases, but
covering edge cases and verifying all features required a significant
amount of rigorous testing and bug fixing.

Best regards,

Luiz
