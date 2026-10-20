Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792535903;
	b=f7sc76qRhUjnAdMZHBiP1Tqg61rbX4Hu486aPrAxi75UWC7eJmO1WIuSL6+Cd7c3UOFy
	 RBpmzkn46yBp5j4bJgDimLm+IugWr+vQ7hxqEuAsFyKjjgpLxd7qdlQi3necQiTC3+ujH
	 20iCJUs/D/VqZK9GDVDtQ30lu4IxyA0yCw2Ip97kzkpehAFidKm4MX+7eLX/1SPL9Le/6
	 rgLu86Nc969wBLsRcNjnKiwSkZ3g67hG979EAml3urLrbsHGKi7WlE7RPNSlCK8xVlLuB
	 4aNtm5647jdjN82Zj9K2hibTX41Z0yq/lm8mhLalLyjPdBgMBgIghjRojjwcAzk9SiA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792535903;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=TLtnvNpQNgeDJo1fgrIbFUzYRY9b2V2srLedu3XuhAE=;
	b=hQUuCuB/6VZVCJpx21jpM+6Jhhwpsh2Dyh+/LysokNeS3SEE44XrRnmFqD5z7lSWkLRN
	 7bpWLEibbPi6U23avYpQDdMXYU5HQQebxt70tlaTducMJc17Dz8VDRbFFpvzneggRLvLR
	 Ia7M9jf0poH4zOdINcmzoxPBwqAX+5LXk5yyCca44BJD1Ri2xqSC4tT3iaOCfvsdi+HFR
	 zXzeCglpUv8XvCGKBj3Q6YD/oMHLczzjEK+vLOuAgcIawqrMOW8iScw9ZzBXdWQ8yo4JN
	 ZFk2o9E3K4gvmq6r2/WBlsoXk5HdKrH3I8A7UuHsMGMh1krdpY1dvIwmBXOwwo+K3nw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bTqj1INU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D93D6606A327
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 22:38:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D93D6606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bTqj1INU
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6b1aa377c61so54638a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 15:38:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792535901; cv=none;
        d=google.com; s=arc-20260327;
        b=eA4kR8qwArcvR9GEkMvl1Sv/4a4ppzxg4XGM463OvFujAs9drwafcDrASMTVwMjcEq
         pc5KYO1L2L7VgMQXMwZNODKGtGKioDsa8iQKvSKCJccDyB5vm0VylPa7bq9ujSlkg7ce
         Upw+od+ObexsfvXYXS9qMcJTXGIKl1vG99pNVhr7C/kc2Mdm0Dm4c0xDx03MFUxwBxX/
         4fQ1VdBE8IuYFrretm2v0xB7+TdYgIN9VPmrF6JoryvXBO/1OKn73ntIb4aVcoCpUzbK
         KO0BO4t+Eh7K1v8et7RMb5kQ01Y0K9V1zJYyNP/yZRkoa0fw1R+WgxkaY3meOx7XpnZR
         xgww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TLtnvNpQNgeDJo1fgrIbFUzYRY9b2V2srLedu3XuhAE=;
        fh=M/QbSMyhc03h3+N8KYY0Go8xX9N7ynSOWTOwbtyP1Yo=;
        b=RoWJysj9fBPR/SbenEHRS7Bq/ZtjAOrecrdRNasO3B8zjo+ET/oiyBJpbqs9GoA0Av
         AO/kg4ipba07Is/bB06e5jEfOb7xRAtK2AFjSVA6ePNx0XAhqaAzXux9/PvhwCmcB5Q+
         4nW5zdsLTVT2488jFbdBiwZoANQbQ0N/PPSaiv8YtnO0/mwAT6c0IlW+bCSkVh1ohHeJ
         VxY0QVtkSPJY4GgxoMEDyW+w/2j+ACUUd+T0zO05dtNUcxj1AzhzI6UYOiuPX0lzs1NG
         Eg8sIo+qUWVq3Y/X9DDR+bJoj6dMLLQTGwH+Q4bWc9NQlEydXASpu0oea0CoUtyUT596
         cxnw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792535901; x=1793140701; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TLtnvNpQNgeDJo1fgrIbFUzYRY9b2V2srLedu3XuhAE=;
        b=bTqj1INUnpvGGlVUjY7GkKUZafE1j56RBFdMn+RlJr32l0E3eKTVhgPrSDLschU2zL
         k5+ikf4+iLlwaq4SIKAs5qCcc332WatzLHXP0li7rQmoFDPxdUe7txkt/BgPDR698bVm
         YMQ7ZVPHwUe/bBEY7QEtn0/bEkCmk4OuNIsmeCJ1NfRa825n37fzCVrzdHR+0Qhcz8tc
         GAT8TYrW2n9WeWu2GmIa+mBkKzO24XPMhIHTxGWxGoIol0YbdZcKT4tp9av9ykd9q7Eo
         qpOE/VtJT2+wcTz1H3XI2iQ0cZxcdTblyOvORH1adV6xhqw8l+9psvQTRTR3GR2WwVlu
         RXTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792535901; x=1793140701;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TLtnvNpQNgeDJo1fgrIbFUzYRY9b2V2srLedu3XuhAE=;
        b=MKnOuoGaDpCjFC4OwSgXhDgNgPu/lMiqwsFZRwibT4Ie/DNOV4KPg1RZR0kgxHerKo
         76dK9c7gvq8wTd5BkLP0s4J0ONfSmMuHurefcEoIlWCQlI+qIR3g4faOfRVbArkQhCFI
         EUCioduxEH/I6pMPiSI+9bD4vCriH+mlc2Fq6iwe5o1T8/u2v3TBA0H9WnElC8t6CMlN
         Tb7e74jDZT/Q58THBm+WUkz9eAPstXrxR45aaqHBbCNTIN1t0GNJg02njpLnYrayHkC9
         gAsQ0oN4cexBO1xRKeGytB5ZpfnAdoIr/OEhn9nU2iC/h+lfKZN6uTVih53aDTmSafWH
         GavQ==
X-Forwarded-Encrypted: i=1; AKwUvBwOobIRv9pwj7en0pNW+7fvxs9k3pys2n4QLqxE+cXg9B14ApLRn5tmCMvzYCszjbY1Bj7zWQ5YInV6IEo=@vger.kernel.org
X-Gm-Message-State: AFq9FYLJadC3TP8hFFtr3F+HpNR7BjMXTmJB8yRDz5t4wQSdVZcYWvQL
	QupgyrWFcH7tDxqNn8cRyxbePVSoKChgD1YlbBHvfcFuTqBc3pHI7/Rr7BsNqTyEtwglSLF0wEy
	0tesFDvvixG6gufvzBAIcAM3iiA1faqrJuR0X
X-Gm-Gg: AYBFou1FTz4VPdiUg3JBPkYYvE8Mcww91lXBttM9kc/E7qDcIIdtel9ULGJDXxW2IdE
	L8NPa9+gDB1q/ixccWW2qSpbUSm61kAJT6nMwEG0vORrxZH0xEGF3gPgvquBF+Yc+QQBE32XMXt
	zsK7oiqEDS3V9GcsYayfpsRWKSzTTRp4xuXAVGXWA6eAF3pxASX+xews4I9MifwDPQWtXvz2PFl
	ogbNSyKxsIIk9ZkGEnuzb35AatoKbWKx2gr1nah6Id9XyqflWFSvQbs/Pvp/l4WEiNMNaIz2Fgb
	0hMVB9hNjsRlL5QGwPV3fWMCPlpb0vI68StjCF4hcgS7txI49d+m/Qmt7kuul0CV0tdkDlFRsII
	oxIwL6TU+P2/BCt1fNdXCrn3+5UdktaN2eevtQlFSNG/LHpL8fZA2dm2HQJffznqBy1w+CVSHx5
	l8KpUpN0HhT1cSusMxIQI9b+WOp4RWQKb/EuP9NuBUa2fz+RF+24Sa/fhEJlb4JJYV
X-Received: by 2002:a05:6402:11cc:b0:6b1:c774:58c4 with SMTP id
 4fb4d7f45d1cf-6b408ea04e3mr64015a12.7.1792535901045; Tue, 20 Oct 2026
 15:38:21 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020222723.1746201-1-rosenp@gmail.com> <179253559962.3290.16612111135539202564@kernel.org>
In-Reply-To: <179253559962.3290.16612111135539202564@kernel.org>
From: Rosen Penev <rosenp@gmail.com>
Date: Tue, 20 Oct 2026 15:38:09 -0700
X-Gm-Features: AclHuK8h3OnfDuJ5gM7IeNqQ0bSvNuR0heQI9VhNWlxFn25mwpxLHGb_qqiceL0
Message-ID: <CAKxU2N_y6x3zEugwj935zFoA17mf9RzfUikPq8sT2EVPRB0AZQ@mail.gmail.com>
Subject: Re: [PATCH net] net: emac: guard PHY bitmap teardown
To: netdev-bot+sinfo@kernel.org
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Wolfgang Grandegger <wg@grandegger.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2026 at 3:33=E2=80=AFPM <netdev-bot+sinfo@kernel.org> wrote=
:
>
> Hi!
>
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
>
>  - How the issue was discovered, e.g. hit in production, hit during
>    development, syzbot report, manual code inspection, LLM or static
>    analysis tool scan.
LLM
>
>  - Whether the issue was actually triggered, or is only theoretical
>    (e.g. found by code inspection). If it was triggered please include
>    the symptoms, like the stack trace or error messages.
>
>  - What hardware the change was tested on. For driver fixes please
>    mention the device (and if relevant firmware version) used for
>    testing, or say that the change was not tested on real hardware.
>
> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account. If the series needs another revision for
> other reasons, please include the information in the commit messages
> then.
>
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.
