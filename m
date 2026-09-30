Received: from mail-lr2-f35.google.com (mail-lr2-f35.google.com [74.125.230.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 293D830AAA6
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 07:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790752644; cv=pass; b=WUbEbxdgaO4x0KyMm6d7oQ9ok5vFV/fzhtcLWIneVoPLAyOFgVBBpJVnsC3AdkJnR6uORmecGcT80rtqnqVr6aOtkX94+UdKi2qJ38CBhYb7/8SLGueD1J92ywjKsxTttdc6C9RiJeOWkFqeKK7PfYxi5NJS+8e3AiEw3DyJenc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790752644; c=relaxed/simple;
	bh=MVFLkleWnWpFnYthcLE1wkkKr60fbd1HYCcUyDnHcck=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Mo0WYmIYNacK7BcYvzwBCU7LzEgC6DkNx+kPcNFEWCGLeJeiJjKPGjdFddJFEEBQ9mYGRPj9F/0GcDVTDdKt+CyQx0NqkZKGdQVlt1BZrwV1pRJ9i3bKI7krQgsfk2g5PuOGZD+mjzRBfwVEDXRScNG3YHv3ltPL9Mmtmhup4r8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=piDR+Q0W; arc=pass smtp.client-ip=74.125.230.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="piDR+Q0W"
Received: by mail-lr2-f35.google.com with SMTP id 38308e7fff4ca-3a7756096e7so3038611fa.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 00:17:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790752640; cv=none;
        d=google.com; s=arc-20260327;
        b=a3W5bGyRg359+5SrCwDikFPcDPN16+u8lQESfOy/IfCZ1DJ+V/iL3+keMtud/LvG7Q
         qolFfZ375KV5BTJ50kCLBPt6+5pg0D5gyyoTfQgvewUHe9KpzneXI9i97F3uJkaKxwdn
         DhjgaNnqTh24XtnEdI3qg29+P0QZOcmyYIySr9SI1q9yHY7NMUHK5Y2muhW2tOhNjHRJ
         GgIKwqwhufmuhp0Ws1wtTNmlz3ezcGBUpUAVNYJDmWBaFEDa6JwHZGeTA0FGo+pv99qp
         80lNAqmbwlnZp4zIgcC1uSAzbZ63RQXAX09tJyyl04D5RFAaGiwBTB7ZuNlq53dUIDTO
         NIUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ea8nXYm0xabYrwi/85CAYe7b5DVLlU9SgUWviAoGpxY=;
        fh=jJignA7u1Hq3YJYiX7BIWHenWg7DxI5tJAKIaClWZaA=;
        b=OizeBL/VhzyzqPUBPGETzIc/mU9HXb8427Yd3y4ciF3TY2fheTEalGP12rXlQsnOlW
         ntAwDcGDblD3aWR7D2+IPhoI/j/iem/5Y9rw6BvP3Cnx4uN1NOWZjRIcErvwheYh+0ia
         /IAWE0bQi1PxJ49u1FFOO7199P3ZxaXKOvDP5j2wVBv/bHRuCvyokw6zwNpbLfOOiO3f
         eb231EKyXjtXQFuua7EFj0+VvBm3Ol3JFI142EmU7BkLcTMyZwlg8Obb7k//CUf9u2BQ
         FRkbhAiQ4FJoZmg7Y5ynPTd0UMaEDhntjkSb98xX6YutDjEPKJoLr9La1mrDzdC6UUSc
         j8Vg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790752640; x=1791357440; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ea8nXYm0xabYrwi/85CAYe7b5DVLlU9SgUWviAoGpxY=;
        b=piDR+Q0WAPh9IYlTLNJ6jz+C/ECnT+Hro5ROp1yD8f3X4LfCHlKkrc8/yF1eAYohzX
         cWHtWAFbMt9mzBQIzKpYwarFm4td3dKV/qYDlNFjo/rwCrfyl6PNkcP15ytNgMsibK96
         OVFsyUVT9CIMeb907FhDjdJVkGyLkuMzTcwgeyZfH/50oMv4KU58pAfywIKl/hVFqfZA
         UJLREMAG4zUerQpEfeYdMreCUvCo20VYaJR5bG0W5CWKdcZIJN74c03YvAQQ6yWArTjv
         5CTDH7tlYZa5ktMOywKxv9+rF8GD3k6PcAR3+XXUtCfuOm4wfvY1l25nbHpG8Lg8ywlO
         +7cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790752640; x=1791357440;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ea8nXYm0xabYrwi/85CAYe7b5DVLlU9SgUWviAoGpxY=;
        b=C5lfaXSmKh1IcPVZuzvei7So3vsNPVzStp94wYwuFAj/D20qFVw5nH/43RZUCDINpK
         3SzqioXasKAun9iTp+yfUNu7B8/biNixPSn4QB9Ez2wgVQkpvOtNy4pPCv6+SPflVZwX
         xHONzj2Cz5Hb1JSQSl4ZT1VZ/V7R8NVjvFy5X/DgTZHhTRRiOLDWvJaRuZCp8Q4hINri
         vmK77oBQG8FRidgxK0JSAlKcTAPoC3/bV5rEQMMSkuS14qTOZkjCgzoHzYcWYtjArKdb
         cKDh45bpnfqWFAbPasUXCrdkgUoLgXwbXOzQv6LJXK23QUd5ykQVjghEyfp3lMjK6e1v
         1a/A==
X-Forwarded-Encrypted: i=1; AKwUvBxS/b8UyPlJtyQmR9c209RZRp93hrnFfv6MBx6fIFhrAhQKPOQBUcwl2FsNjaowOfasai7hTkmHp8C1K+0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKVa1BzktvdS4AeVB0YznIirVlvP2M8OgzxcDkFL/2n5T/gxTYb
	9sp374RLybLoetmOrQIwDPoqrpsKJLEVjMXGeM37AAAbXMG5iR842unwbJHIdoqC9yp82MZCHOR
	CiMTuh0wSmqi3qX/iVb85cR1lfRrKu8bmAlYLNT8=
X-Gm-Gg: AYBFou0ziDmV7R0c4XozJxVKmHe5utKt3lIfNxagTAdcXlIcH6CFy/Hnd2O1cLFPJ+I
	2ahGxRU1TmkfQtcJab9NdbCyGbIp7/cGJCkA9LeWNH60EqEAy/0/G/WELCoz3F5zkzMm7PV39Ww
	p8+Ad3jC0KYo4PGx+pvM8rfviONaK6qQOgVufguOh7HmUJi3sJbT6CvqOAJ36bENHKjwFyBa/Va
	mvbF4Fkb+Osz8l1TfrhezepDfOOkJtkBXey8FnblUWiHBJWusBytqJxayhF2upGingsDZ7sa+7l
	VvRpFOBeG5xC1PSk2iDIeKc+LH/dmo63cfFpuMRcQA3d8yS5PUdikA==
X-Received: by 2002:a05:651c:1547:b0:3a5:ba1e:8b05 with SMTP id
 38308e7fff4ca-3a77913af41mr1881391fa.1.1790752639889; Wed, 30 Sep 2026
 00:17:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260924135052.185129-1-maimon.sagi@gmail.com> <a3275288-1eae-463e-ba9f-dbb2d715d1b4@redhat.com>
In-Reply-To: <a3275288-1eae-463e-ba9f-dbb2d715d1b4@redhat.com>
From: Sagi Maimon <maimon.sagi@gmail.com>
Date: Wed, 30 Sep 2026 10:16:52 +0300
X-Gm-Features: AclHuK-kag_H1kMGoxdUxezLS-VrTRKTJfJccb_2uUMkHaUSNrTcAhEimC6uRNY
Message-ID: <CAMuE1bHcd7LGW2VOa15hhWwc7otgtw30FmtcBsujwcoJvpQFvQ@mail.gmail.com>
Subject: Re: [PATCH net v3] net: axienet: bound TX completion cleanup by the
 NAPI budget
To: Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, radhey.shyam.pandey@amd.com, michal.simek@amd.com, 
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, robert.hancock@calian.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 29, 2026 at 4:22=E2=80=AFPM Paolo Abeni <pabeni@redhat.com> wro=
te:
>
> On 9/24/26 15:50, Sagi Maimon wrote:
> > axienet_tx_poll() passes lp->tx_bd_num to axienet_free_tx_chain() as
> > @nr_bds, and @budget is only forwarded to napi_consume_skb() as its
> > bulk-free hint.  Nothing limits the cleanup loop to the NAPI budget, so
> > the number of packets returned is bounded by the TX ring size rather
> > than by the budget, and the poll can report more work than it was
> > given:
> >
> >    eth0: NAPI poll function axienet_tx_poll+0x0/0x180 [xilinx_emac]
> >          returned 96, exceeding its budget of 64.
> >
> > Returning more than the budget breaks the NAPI contract.  It also makes
> > the "packets < budget" test in axienet_tx_poll() false, so
> > napi_complete_done() is skipped and TX completion interrupts are not
> > re-enabled on that pass.  NAPI reschedules the poll, so this recovers,
> > but the accounting is wrong either way.
> >
> > In steady state fewer descriptors complete per poll than the budget
> > allows, which is why this is rarely observed.  Triggering it needs more
> > than @budget completions outstanding at once - for example when TX
> > completion interrupts have not been taken for a while and a full ring i=
s
> > reclaimed in one go.
> >
> > Stop the loop once the budget is spent.
>
> Napi can process as much TX descriptor as available, even above `budget`
> see:
>
> https://elixir.bootlin.com/linux/v7.2.8/source/Documentation/networking/n=
api.rst#L68
>
> The solution would be capping axienet_tx_poll() return value to `budget`.

Agreed, and v4 does exactly that: the ring is still reclaimed in full,
and axienet_tx_poll() returns min(packets, budget), which also gives 0
for netpoll's budget of 0.  It is posted as "net: axienet: cap the TX
poll return value at the NAPI budget".

Thanks,
Sagi

pw-bot: cr

>
> /P
>
