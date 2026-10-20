Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792534217;
	b=g1wDuQ/a4VcKV8Qtx/pry7MD2Dj0cMwryeP3VNYEsM8c5y2Ge2u6BfmrxFlwluYoSRyr
	 y6U9m3O1jRCZR6EpgPiE51mIhWOEdCd7QtNhwPqpCgx2goz+0Wm9OjJcSgRdiV1ec98lB
	 noSQRsSqBO1myfemeixaM1iYIbNx700l6f6kf1ojYlexnnyjhr1FxPxIFew8P2ENJCr7R
	 idKd9zpGDjaeMgZxZvt/9MbLhCKAGmzuNllWnfGMQpK4ZqykXN4MTrJKLQwH+uSYzk0/V
	 066OxNzlbK4Bna0Mo7C2koiStD67V7zsVfFDAmGGBSYj40ZZ1GemM9mg1xHEgxciBJw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792534217;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=tl7GK25Ew5sPTNDqInllcRJZPijbAjxuuEYSDtAi2Yg=;
	b=Ks8yZ2hWPk0LnvCVbYn2fCrxWIUuXlP3ak4SCcyAbDsRf1SuGlbT2Z0Mbc9ptmJMMTzB
	 idxapEpbHVuI6rDbrJvvdbQ9ATENYdeHe94myFSAdl7GAr4dBQI6oUJokHq5VYNXDEA2g
	 3s9nK466KDqJhnWial6cmZp98s9E9T4sm3JDjy+HYtY8zLbcrDYueSjgFMwNrpYSyoXed
	 hBC7kFnrRGrd/RHpYdklG6dPLxKfPnSBmuQkxJt5A3TMNFKlxz/mR63fN8zncoYr2qrIw
	 /dDqtwwe5GYLcKp3jEG32Cg5PBHm1xu0YNXmYwR/0bXTI3HYcZgVB2g4eD6iskZkaIQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=I9foUfAp;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50944606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 22:10:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50944606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=I9foUfAp
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6b1b12de661so4582a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 15:10:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792534216; cv=none;
        d=google.com; s=arc-20260327;
        b=CpzdiCW9yTAgqQAR/kEtiDjvvi0Jh7rvk0AoOAxXGB4ry4AlYfER17OIe5PKVkxb4J
         zvosWNUekY/FWvSAe7a8Ahk9fyGXQAaPElShMXQG7Bx3baisKAB2zjgg7Z60WA8d5WRV
         wzumKpCQHFBT3pqlRU7kCVUxptqwQOiZCSgRe7C0Bfx6eFWYLQHn/6duDvxKrE6WGTiw
         X2CaONv+p2LvfEra7K+yuXxb6Lt6WknBPvC2RTwCf/dcRdANeLiXxlL0/7UgCaqpN1XV
         tAREB8mflDTskOSNbRLdEj89muHrHcjcUSKOBaQCqLbq0wBf5xbEX17/yHAoEpvT8AA2
         Dqkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tl7GK25Ew5sPTNDqInllcRJZPijbAjxuuEYSDtAi2Yg=;
        fh=9Yy0jB9OYaG2EPIlDtD4JMwK8YYeAhyPmBTFLEet2fQ=;
        b=PFen1cQjUdl6+AOmhkSLClsHGGmznNCb0W5Ad3WARcgjQAY/r6Bb4XeIyeDaKvdyn/
         9bUVpSULeUMGkUH1fTAgUEHubj2+lUcenBnywAmHNI9Mqp7RZXdtEv53sJ5YVUz6LB0S
         EfrBvi0bXPHch206chSesxgFsXRKTpI+nMqOR37QBTzr22uoH44RBr4gOqUmNFJTGKL2
         kTzRW41ciBWRtanUFN83dQm116TKpaDKtDiaN7yJlCYkDkkCf5i5RKs1mpr6z5W7AhHp
         6pmyqYky0AHF0OSbohgzRB6J1+turdj3flqZH1ziC0Fn+PsTsoiPumfg/3BThcx9eAy5
         O2vw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792534216; x=1793139016; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tl7GK25Ew5sPTNDqInllcRJZPijbAjxuuEYSDtAi2Yg=;
        b=I9foUfApie8pgiZYfjauz9V97l8g4NY7YWU34Ms4vzqIiWzmDpB6SAaaxEekO1Ln4b
         c8MNWhWbPFk/vCJM+YBYqGFY57jiIrZ+7fJImQDXwBRlBeaoLdQ1beDrYnDSzhfJiCib
         hsFfdqtoj/lDRsFzW+hluaVqKh8H89NS+SuLcpfXQNl4HCwmaVmOYfxihZP1pizMtFk0
         SdTKRjQiEYXwKziMKFxUVXS2nBERdwR7JzAPUl/fDLwyJWWOy88RBh7nm8CKPWyw4nuJ
         ROWXaKIaP4ZdS/NK0g0qbrZTY+3srupeCZ3c6wEcJ3wpqH8EuhEd00haIcRuxsSlEVYn
         tUUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792534216; x=1793139016;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tl7GK25Ew5sPTNDqInllcRJZPijbAjxuuEYSDtAi2Yg=;
        b=IJTlSf9GUxMJejGSKI5x5zvrkA43KrruLt0yzRIxVwVMFuvBWcwCuQkRKVxGRmqgnd
         0lzo2nhUWFHfkJ9jigeBhxmOl6kQolIxuq5xh7LWhAKJkta9Q/Qw+HEO/fjm7i4weX1N
         lwtlku5IIMFrJeyy1oVOjcB/3BGzH2v2c1mXUgNKNNCMg5cBTquvYS7Nus/oEW5kKrso
         trZcP1sbb0OpG/QINmVLpXi52tUG4ZU56Fp2IiZVQgm/x55xcKi2G4LdWxUDom1PUAR3
         bpom7nEO5vr2a7HSRUJXCaaNUylq7cJfoTuifx9u8FELOYEnIwhV9jALGfgxE3Vl2nF7
         b20A==
X-Forwarded-Encrypted: i=1; AKwUvByBCnwF6rR6XjGEIcmAjt/dtN2DOd6Yym2vQar855T6pjoBU6Qjyh8yDRhoTCTaWf1l5BbGsnc/goF2hDE=@vger.kernel.org
X-Gm-Message-State: AFq9FYK/L8GvqIrlLllRTCQYdMYoujW5iGxbrtq6de+fjoux4mBI4pc8
	JKGS2yXiikAODbw66sNozmHe7TBXUdB+YtncRj3pFqxi4XsIDZioapiTLbLOeFdyzb6eh42kcM7
	p//eFjUGUO3AFwGNlpWQhTmlfpVkYQFiwtMmAdv8j
X-Gm-Gg: AYBFou3RsgVPT0KgnpHhCf4Ay6/s7CHI7f9ZNU2hM5UA/gvRVI1/fLBdBraKPyVBsAB
	2MeqtutSQJOHmPsLBkxQ2v8jH46ov2pbEUXwk0HKgiNlegrj3U8KWWlfL+nyftsmU7fQzbSCwWl
	96pUhhWNbh0GehCUkNl5o3SMmg6So4EklACcb86ettCLLWUCWJvMY3tJ7/TlzRz1wLKf5PahYQe
	5KcODxqgMXuNFxFsxY0OetEEPuWjczE/T0x8NWhlxwLiNm39BLN54mYjq3APpUa4XzmQHOHPRbp
	veWDsJzPKA5KOFFYaPk0QM7rHvOD5i0Fdp4HbVL+2bCKRS1ujc5J5gTzPPxH+gmvw3YZksTu3dJ
	NSBYAgyujQAPHWwSsGOM0lmUXE4sNWdmP4g==
X-Received: by 2002:a05:6402:550:b0:6aa:7db5:ad39 with SMTP id
 4fb4d7f45d1cf-6b3e5a00af2mr82366a12.5.1792534215024; Tue, 20 Oct 2026
 15:10:15 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261014173945.373295-1-almasrymina@google.com>
 <179249101026.3632927.6502845375265155678.git-patchwork-notify@kernel.org>
 <CAHS8izMRSU3AyVf+sP5uXShiSKuLumZwT=fsgW+bhJz47UoPRQ@mail.gmail.com> <20261020150307.258b00e9@kernel.org>
In-Reply-To: <20261020150307.258b00e9@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Tue, 20 Oct 2026 15:10:03 -0700
X-Gm-Features: AclHuK8BsF2XH95JeQFPf6l-JaNozEbyLRQcmco_5nfrlR9V-h8rfRnrpx5Opf4
Message-ID: <CAHS8izPZ18v_1CnRkaAAA=d94wutJhoOZdOFO_1CEXSexd_=EQ@mail.gmail.com>
Subject: Re: [PATCH net-next v3 0/6] net: unify symmetric netmem and page_pool refcounting
To: Jakub Kicinski <kuba@kernel.org>
Cc: patchwork-bot+netdevbpf@kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org, bpf@vger.kernel.org, 
	ayush.sawal@chelsio.com, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@kernel.org, pabeni@redhat.com, tariqt@nvidia.com, horms@kernel.org, 
	steffen.klassert@secunet.com, herbert@gondor.apana.org.au, 
	ncardwell@google.com, kuniyu@google.com, john.fastabend@gmail.com, 
	sd@queasysnail.net, ebiggers@kernel.org, kees@kernel.org, 
	aleksandr.loktionov@intel.com, petrm@nvidia.com, u.kleine-koenig@baylibre.com, 
	j.raczynski@samsung.com, wang.zhan@smartx.com, willemb@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2026 at 3:03=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Tue, 20 Oct 2026 09:23:03 -0700 Mina Almasry wrote:
> > This is awesome. For years the skb refcounting annoyed the hell out of
> > me. I couldn't fix it on my own; there were too many edge cases I
> > didn't thoroughly understand and could break. LLMs made this possible.
> > Thanks!
>
> You should have followed more modern naming patterns tho
> get_netmem() is pretty bad IMO. PP naming is object_action()
> so netmem_ref() or netmem_inc_ref() would be better, no?

Ah, I didn't know about the modern naming. I made get_netmem mirror
get_page. I now notice it's folio_get not get_folio. I can follow up
with a cleanup when net-next reopens. I assume that will not be a lot
of code churn. I was also going to try to look into deleting and
consolidating some of the now-redundant ref-ing functions anyway.

I can also make it one of the design pricnciple in the page_pool docs
so that the LLMs pick up good naming practices moving forward.

--=20
Thanks,
Mina
