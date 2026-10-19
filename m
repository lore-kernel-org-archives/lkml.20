Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E42EA2E7635
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 01:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792373717; cv=pass; b=UxO+aPCPg20i7BJFnKesQ+ZnHJVC0oTUHj1URVAPGDrkktU3Esi6SwKyFuPMxpsXBckM7c5/j+e95nOgYBckibBELXTbKpv4dRoclaKZ3rd+mFLbrQ8aYalu/8ua263Pt46YkLql9Wd9S2XMXyqXIvknU03qYkzyVYxL+Jmhd1I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792373717; c=relaxed/simple;
	bh=fgreZAMX8MnAOZ25NX2h7jfgiwNikIoWWf8fFdIykMc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kwo3my74gKr602vaRGsDEtAiKEu9lCnkX4Vdob1lv5Re5o5yJTOE6aV49d5EG/HxYoE4dlPauPBoHTDffq79T8e5tSF8HTFHAZP9gJHP3EpRD9jLgVnKEqARkuS66LpeDG7Rcb8xrq0sGUTrBtaD9q4qo7PMnoXefQaYZCXMw7E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FKXroTej; arc=pass smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FKXroTej"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5ba36cc21cdso1428003e87.1
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 18:35:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792373714; cv=none;
        d=google.com; s=arc-20260327;
        b=HuJ7hl39zUAXX7brggZS1TCZdFk88SpOvDGc9qrd1zeyOrqV9+zfLEPP6jJf706Chd
         NB8bCdnFduo+I8McPQMj7h/W0JFspWlJplFbINDbQsu4tsGKg4USsx/cqd6Vx9NBjY10
         2QAon48RVTWEo8xs6EhAGkQWFCiDU/i9j/rHPO0n+eL/UweVEzjoVimgLN8++MAnRoRX
         eJfj7hCwECe0R+f5BOz5tHZFMfZD4OhZ49IR3buN3EvxOd+0+U1w1xHEFpSvuyKmyeqE
         OIN5/us0qJNAZm+0EQB3/NggdGOZbRmaYH5cYRE0L1nGrHg2OVku9mGVpAlKKAqwb0sc
         zQLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Nff/2Dooakw/NTwEm9AsfcojNM4c7HTexv035G2HWNQ=;
        fh=cPoxomeIvABL9EJYSgIC1MJGOapXX2akS0Vh+Muz+to=;
        b=YoilSA3lXEHWyP7pZie+JnA6ct3saXHuMu7LGqUQRmTLkhsTCjrPqUxCFAUnBzKAuH
         yFrmzjmufiyDDfm499Od+0ScAxwERvoLz+X9lRiYHIDnzJZ7TQjs+XxPY4v1Thi4ZaNf
         yEbg+++u/ipDOWcDW2FGFtWssB4g5GqBFH+ONJmrXQOnJxLbhdA383vS+yu1QRTw2Ca4
         zvLE5q7E0Aj4Qee2rpaZAJP4KUzaMhNEW9V6Xmam1YGHe8yK3b1h0ZPgVY1dw9Zjrk6T
         IGhd/X9D5PLGHUx7EX9Yvx/vOYrf2VnBKl14VxJ+EleqLI2S9Z2HDPEpIE+VHCe8kVUw
         U0hA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792373714; x=1792978514; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Nff/2Dooakw/NTwEm9AsfcojNM4c7HTexv035G2HWNQ=;
        b=FKXroTejjVQoQdCyPAiikjFkN1ZUcN9V9urWiTZGFxwb/qU5zXCf2YrrkRNOOXqe9p
         /BGXENwMqZVhbedYrerjIk6rqUGdrGbgZOZ5hJTzFiL1C+911H2zUtbUpqj0N/UyvgxE
         a+hlnyjqf8mJ88LiY8F/gaw313Nye8qsI++6doBoRUw+z7lA1fa8sXvyQSeb7jyrdbRJ
         jhg0Deb+Lkl5MAjoKYGrTMLtDUA4aquS5bSetnsasvpdtRiEVqlo6hXuSFNcKLnzbXqF
         s5kvq9SnM39HXXw37FPBmUQvUJmqbeBj9QamHvuP2GfkULuqkTStfdFZtkcTIGY4ndK4
         a+Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792373714; x=1792978514;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Nff/2Dooakw/NTwEm9AsfcojNM4c7HTexv035G2HWNQ=;
        b=ZHswiFOtgBu9O1MygTlJU6z4kSWozDGHLdNXrLDN5K0QvYVFeXau5tD37WnC+ZIZcq
         54lm4vWoO7TzV3fn9oscVfwuA3fbn/rToJpWBEVMaLuvBCBpPS5Qk8/qR1j1OHqw6Lxj
         0G6yjhisS91Uyc67B8KTe0J5lpoJUMzO8ZIVww7MGDAYb6vZiyoUfOgl5GvBDfSNoza2
         VtYwXMsSGEC0KiIk8Xxyq1ehf2/1r37B8ibKOdqC4tbTYCh5LTBx8Y3J16927BzfztHX
         15IRh392h606WHuM/2oss8p5KMjGjBgIRH86h70TEb20D8jwNMt5HGu/V8qqobbn7lBy
         J4Ag==
X-Forwarded-Encrypted: i=1; AKwUvBzWqFj0sKT1OAuCCaX9siOXsdKMj4jgjpmDKA20t7z9JJ6Dn1/LDX8a04W2JkvYrydosUUV1XEVHG9BwyM=@vger.kernel.org
X-Gm-Message-State: AFq9FYI0eRsfzTA8erBylhfy0K9AQvGCBsRaTkccjaCE2eCkVpTiVGl5
	arib5YPCdyGrwVjWjb3RNWQNyxj6GQ2NXWMUwpvlYF1xzRYbhWWBd9xWnTvPXlayszxCwKiliJI
	lqTACJ/ZSqlxcMLQOBuPQzGZJ576rCo4=
X-Gm-Gg: AYBFou3F5kaTlNAX5bIz+fZWITG8wP/z6HALuD96LY9Vlb2PD833K9j/GF0TFNODCP+
	03JsdF5iNVVCVGHyUgnWG5NT9kt0nz9OkK0j1x18MKzs6ZlXd1AvPPCwt7/yxs3n+Kczb2dMzQ2
	yaLCq4IihJVIkAuzLJF70XAM3KKLCM+lPp525qRvJlAucGQXw+TxupE/4vAMN4clXVkj51tNfkk
	kZRCkP531IL3tcZV03HFcvt9y3Q/UP/syU30tsFcsgQROs8tLPM+5vRIjJfgNaR+w8TT3gi/2he
	z1MZrruqtlq1AMV3i30ptmlYIAsQvceNFUOejhyWlYKom4La2YCtmBM6kJctSDI1/w==
X-Received: by 2002:a05:6512:691:b0:5be:540f:ce48 with SMTP id
 2adb3069b0e04-5be540fcf96mr1950051e87.18.1792373713661; Sun, 18 Oct 2026
 18:35:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAO9r8zN5n=9v4K+OtEEODg=e0kcFW99PreUcZm09q9CUMQc+ew@mail.gmail.com>
 <CACpmpofdoeVbbw7izCDeJ7eS+XpWj+3sp3teKEQWywyRB75jYQ@mail.gmail.com>
 <CAO9r8zMaaUsBaS0TJumochRKt2ShV7nRaLnYPWv3=S-wUFgitw@mail.gmail.com>
 <CACpmpoecz4tjr-qvFRy22CGuF+4NBWbE7HVjdTGFqQOheK3CLg@mail.gmail.com>
 <CAO9r8zOAcf4=TscCXjMYvowUx-_u9qLGqY2-p7cK-z5CUU_x8w@mail.gmail.com>
 <CACpmpofYXDMviE6FS-BZdVntmQFvS+_xvfmOnJ2caZFerz6vyg@mail.gmail.com>
 <atGqPIpUfX0LDokV@gondor.apana.org.au> <CACpmpofyLW5z1DYEY2YAty0VOAhRR+Leic8O-B0N9hrzdW_=Ew@mail.gmail.com>
 <atL1ok1YkHbA4AaI@gondor.apana.org.au> <CACpmpoe_RXcJM42sTVwk_Qvt3zjAOZhzYZNsRD4xz_1HxDmadg@mail.gmail.com>
 <atMCfhB63koot230@gondor.apana.org.au>
In-Reply-To: <atMCfhB63koot230@gondor.apana.org.au>
From: "Kanchana P. Sridhar" <kanchanapsridhar2026@gmail.com>
Date: Sun, 18 Oct 2026 18:35:01 -0700
X-Gm-Features: AclHuK-sa0bPZwSQVwxADRhzmdY4PA3aAYNaQTZ1DmSolcYDHA8wcYiAtLkFuj0
Message-ID: <CACpmpocZGHpTTOq+xa2bTnS-=gdUa8+E_KKJm41H_dSfbGikYQ@mail.gmail.com>
Subject: Re: [PATCH v1 0/8] Batched zswap_store() with compression batching
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Yosry Ahmed <yosry@kernel.org>, hannes@cmpxchg.org, nphamcs@gmail.com, 
	chengming.zhou@linux.dev, akpm@linux-foundation.org, linux-mm@kvack.org, 
	davem@davemloft.net, linux-crypto@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rientjes@google.com, willy@infradead.org, 
	senozhatsky@chromium.org, 
	"Kanchana P. Sridhar" <kanchanapsridhar2026@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 16, 2026 at 10:07=E2=80=AFPM Herbert Xu <herbert@gondor.apana.o=
rg.au> wrote:
>
> On Fri, Oct 16, 2026 at 10:02:13PM -0700, Kanchana P. Sridhar wrote:
> [ .. ]
>
> That isn't quite right though.  We need to ensure that it really
> is a singleton before taking the short-cut.  So you need at
> least one conditional:
>
>         if (likely(req->unit_size =3D=3D req->slen))
>                 take short-cut

I added the check for the singleton req [2]. I hope this looks Ok.

With the latest crypto_acomp_compress(), the batch compress latency
improves considerably:

usemem 10 iterations average throughput:

   patch 6 (store batching only): 19,119 KB/s
patch 8 (+ compress batching): 24,076 KB/s (+25.93%)

bpftrace measurement of zswap compress latency per-page:

Sequential_zswap_compress  nr_samples     p25     p50      p75
p95       p99
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
zswap_compress_ns_per_page  1,722,489  43,947  57,791   88,489
130,165   323,961

Batched_zswap_compress     nr_samples     p25     p50      p75
p95       p99
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
zswap_compress_ns_per_page    665,267  41,511  54,915   77,707
124,648   213,962
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
 Latency saving (ns)                   -2,435  -2,876  -10,782
-5,517  -109,999
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D

Please let me know if [2] looks good and I can include this in v2, thanks!

[2]:

int crypto_acomp_compress(struct acomp_req *req)
{
struct crypto_acomp *tfm =3D crypto_acomp_reqtfm(req);

if (unlikely(acomp_req_on_stack(req) && acomp_is_async(tfm)))
return -EAGAIN;

if (likely(req->unit_size && acomp_request_issg(req))) {
if (likely(!crypto_acomp_req_seg(tfm))) {
if (likely(req->unit_size =3D=3D req->slen)) {
int err =3D tfm->compress(req);

req->dst->length =3D unlikely(err) ? err : req->dlen;
return err;
} else {
return acomp_do_req_chain(req, true);
}
}

return tfm->compress(req);
}

if (crypto_acomp_req_virt(tfm) || acomp_request_issg(req))
return tfm->compress(req);

return acomp_do_req_chain(req, true);
}


>
> Cheers,
> --
> Email: Herbert Xu <herbert@gondor.apana.org.au>
> Home Page: http://gondor.apana.org.au/~herbert/
> PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
