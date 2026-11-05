Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793912581;
	b=wMNLqa89kZeTru+JUkrFxFm/inTknr8838+miB+4/fT+hHvPVd9TK/wrAQa8pCOOWBF6
	 BUvY4hsCjwTmaLVLnLuFn/+PzsSRfAK47F3dmAoYOyZsJEkUwibIhRB/FdJj/qVcPWpxf
	 XIkstpiJk9U10Pal7kfeEiCmgG7rl5DXnhphd0QMNqaodhTa4B8zoWbOU42/4ma4MZoFx
	 AJo+U4OX/kgUccwm1N8AiiH4zMpMW+t+dS+LxGnlJwZ6lcoS4iUUD6IQEnCUT4E/IfLZM
	 UjuotdfoS3povtOgFtvKLR8QsMy3wBi0jCj5IvC6uNfyC6Ld6HbW/XqvyBHMuDJKcMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793912581;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=vIPsFgpeDDDerv0ETdjJMk/BOk+taB7WxA1rqOHL3fI=;
	b=IoFVKxv+WO1XcjFM+8RQzIa67x30es+etpuoZNx+OmNULHixhzOCqd/kbC7LE2mWgoXv
	 rJBTx3wgwXchiz+LobxeXx4DQeJRWR6MotKcAqwOZx9ijdvXceUHW5LqzT3ZyXnFTfLRn
	 sa+zPLj57ye3csJd4Dco4G00j29y3QhT4rISfa+Z2g+heHoK6W/4/uR3aAzj2GGFbomDN
	 ims/opAG91FevbT6+BWCVVk0XPKWwk3nT3Jy/YmwYLczZeNM60ROZta/0hHTybjPZPHqq
	 YxVWhui1p590Bs9+DXiLd8hj1q3rjpKTlvYoEloIXoCjUbGbF/zJXg/1quprILqjKGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=Dadc7a1M;
	arc=none smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6791B606A326
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 21:02:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6791B606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=Dadc7a1M
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c4301e334ceso203167166b.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 13:02:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1793912577; x=1794517377; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vIPsFgpeDDDerv0ETdjJMk/BOk+taB7WxA1rqOHL3fI=;
        b=Dadc7a1MEdrUAjjYSrRyejntEfOG7pQDi9QusR3/ehgdTME+c0q2yHCD4MXs0P6Oo7
         BWDHwDrgRHD3R+eVDVW6NvLTKxIRxIhf9iaKuM/VlsBhY2HJKUzh8QE2Dnuo78nZ8WH4
         HNP7gc8fA8B1VlpH+LWBxk+cFm7mWdY0dZbjs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793912577; x=1794517377;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vIPsFgpeDDDerv0ETdjJMk/BOk+taB7WxA1rqOHL3fI=;
        b=NDRle2xynv0IR4dlxG1Xl/aAvV+WqkautLSqzq0PlGBw4iitjiH1PBxyce6a0cWzcv
         mtxjuKf3o0R6NcRLrJ5G0Y8La3J3ntaG+VlUHKzAPwGZpoGsg6u/dQgoMogUj/UaHxBa
         AeJrJBnN3BUEsZDlAbU8mRHM1yVhSQxpmA+ZhN/C0O64HKUlVS0kjNMIXQ9LiOyxqg/f
         MsEa7NTzQgw81IFxkZthDUzzd2bdcziMVf0T7Z00XB3j4xHCwtSPKkBssPRSdMQpDtp9
         //7Fs8yUUKRh7Se9SQLmUb/a6aisY2ngBwyS4aZHi3Ju+GmcP2uulqH+iTbghKr6blhV
         MUTw==
X-Forwarded-Encrypted: i=1; AKwUvBwFjZ1TM2eKlmYIh99MdNpKfgX/WYB8KdGCgtOepPVy7SC8pgC1BJQcleVtips2qZzxWIJ6Mcvjn4k++cE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+hV2oK2BCOmYMF4Vubo5XbPo15QyKIRNFjlOaR0sv+TPVARmSM
	+3wckAiuWUghrHpbXynoY3OGOFKyN/pqCb6ra1LLpIdV5RZJMnIhdRzYHDA2hsw/mMFdyvQHrLw
	jQxN2PT8=
X-Gm-Gg: AYBFou0xTON1bLDkXz7sz8YwSXF15IAnd+glQF/EACtlCJlLi4O2H84aBYzhDOw7GSS
	qiFOco7OSIg3w7kQ5lSBBkiKjL+/0vNTExf1Upl5/jllRD/kiVcVkpG03f00aRMB2oMF1pxjdbs
	JWd30We2SnSYAT+Ir5EcKsUoSfbe3CFEC7jAN1JLFCgl3dnbQfTpEiX3e8JhvMLMaHZbxgoJci6
	JSvon9xs0vMXbTk4ZRLUuvNAJXDIDCm+hpA/de8ialMf8L6GX5pd+N9aDg5LpWy83B3HIPiCAPe
	Buy1v0HNd9SLL++ThGwhHb00UlpMe56dO3SCSJ0TT3VdqwnAfTDYNXl3WdT32mFlSQThrVkAdLb
	9QguMzMD1ZZvyibkIaujZeVcARn75123krpPAD3M3jANRoR4x0MOUtWptMLoMkqNpZAyOdQ/2u9
	o0qwe9hAtOYGD7fCATQg2oXstbnnLHfT4OD/o9s93UHHdVsGQxHDulV1u20UGWINnSDMQzjgjmS
	9qkmV5R8OTPFfCfEFk5coJy2DoyWM1NDZHgyP7Dmh47BaQOA62Ug8GJP4904Sp29Dtyjs++OHPi
	zHJXNraK9B2FbjRG9u/q6nymzhxh/BuCirWquyjaVBkolSx5/b7xo8bX4psGux54ABS9O3Y0NTT
	De0A=
X-Received: by 2002:a17:907:9446:b0:c4c:999e:e6f1 with SMTP id a640c23a62f3a-c4d35559ad1mr52599966b.46.1793912577352;
        Thu, 05 Nov 2026 13:02:57 -0800 (PST)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com. [209.85.218.47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d3562ec79sm17748766b.25.2026.11.05.13.02.54
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 13:02:55 -0800 (PST)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c315869241fso364299866b.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 13:02:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBzqO4YDnmnIWZD90UhyP28jjGwgGybnwoZH35tOhiCxv3KMTh1syjHA64iMg9hpk3tn7OLng7kaMXQVMWQ=@vger.kernel.org
X-Received: by 2002:a17:906:c150:b0:c46:9ca9:f524 with SMTP id
 a640c23a62f3a-c4d354b9d04mr48470966b.32.1793912574580; Thu, 05 Nov 2026
 13:02:54 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <urkgmijyytg3rrislm5fdzmfggqavzpiry23f6lpkqonvy2tqx@d56stj3eixfa>
 <auaFhOa5EBz4gJwK@gondor.apana.org.au> <xdzcyoou73blpfdlgy47i2ktrcsffnclerzojpgrxphid54gjc@nicdcvzqx447>
 <auqtTjXhD8is-y9f@gondor.apana.org.au> <CAHk-=wiE0KG+jkhmJWifXuAVivtB63WCWtdEpGAex7-T0SHd2g@mail.gmail.com>
 <aurAxRpCwzeyXeVj@gondor.apana.org.au> <CAHk-=wgPvbYRcKpQ8WTH-EYZRgMG0KSH+cZxY5-Hyf+X7JjWsw@mail.gmail.com>
 <aurJZ81qnbiHH_P1@gondor.apana.org.au> <ausS3LQNkdc6lBy3@milan>
 <auxDm_YO4oACA_d2@gondor.apana.org.au> <auzOjphJ8DWpXwUy@milan>
In-Reply-To: <auzOjphJ8DWpXwUy@milan>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 5 Nov 2026 13:02:35 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjcKOC7O30L8_8PMniT71aqy_3ZEYK2xyoR8zW9ZCvO7g@mail.gmail.com>
X-Gm-Features: AclHuK-6zo-9KtIYF9n0Bopl194z1pM7LoK-Wva3VmRK1J9HSt04b5Zu07i1Nu8
Message-ID: <CAHk-=wjcKOC7O30L8_8PMniT71aqy_3ZEYK2xyoR8zW9ZCvO7g@mail.gmail.com>
Subject: Re: [PATCH 4/4] rhashtable: fix vmalloc() deadlock in atomic rehash
To: Uladzislau Rezki <urezki@gmail.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, 
	"Liam R. Howlett (Google)" <liam@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>, Michal Hocko <mhocko@suse.com>, 
	Baoquan He <bhe@redhat.com>, Alexander Potapenko <glider@google.com>, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Marco Elver <elver@google.com>, 
	Michal Hocko <mhocko@kernel.org>, 
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Thomas Graf <tgraf@suug.ch>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	maple-tree@lists.infradead.org, Lorenzo Stoakes <ljs@kernel.org>, 
	Chris Mason <mason@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Andrew Ballance <andrewjballance@gmail.com>, stable@vger.kernel.org, 
	"David Hildenbrand (Arm)" <david@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 5 Nov 2026 at 10:44, Uladzislau Rezki <urezki@gmail.com> wrote:
>
> @@ -1025,7 +1025,13 @@ void br_fdb_update(struct net_bridge *br, struct net_bridge_port *source,
>                         }
>                 }
>         } else {
> -               spin_lock(&br->hash_lock);
> +               if (in_serving_softirq()) {
> +                       if (!spin_trylock(&br->hash_lock))

I don't think that in_serving_softirq() makes any sense.

If I read this code correctly - and it's possible I didn't - this is
always called under local_bh_disable().

And local_bh_disable() will have increased the preempt-count exactly
so that it looks like it's in_serving_softirq().

Maybe I got lost somewhere, but it basically looks like that test will
always be true and is pointless (and misleading).

         Linus
