Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792462455;
	b=hZRONEG9gTaMP6D/daZMiVU0sj3bn2EFAYTR9ugndCBf4ceHWPzO1L7lB0l7j2z4ha9L
	 tgjkyzTFBJhJ/xC/zdlReuH7RFFXzVQMGysvCMklb/aj3tf98hp8N7pLdwwGebitUBVqj
	 NjFkEAHDkeYp9/NxAEyMoTnLWq2ttDEMeLZLTR8vNySqOKKHtr2P99bfDJEE0LygQKMje
	 SAWLuosTmcAS26BxXTVUzsqOwwRan5axasUHKo4Oxo/d7ffQh/ye8q6q9eEZjWZht8Jzv
	 rqGq515rv7Gzvs0R+GIMgwYOS8mPghOmCjwBsY9ygAOsQLIzmU6ek0ghLAsyj0Ji0ew==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792462455;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=/kTZQWUcpHzrJy9NMwC8XJWFAf9FL4EwlT1MlBIWbLU=;
	b=LJl3d10r4+OJYSd4jLcjF3a6AwQGQ4UGBZPLd1fc2DrPM2jCAutwKR4uQ6CdvYzbuzsJ
	 NUt8OgsBaH/0lAopRY4BNDqC54RAoBTQtq2QADjkPPFAqq7ym0DFxDsjkJv+7K3NLFx6j
	 WJJqYefyOSXQk4RKDUAYTS0/koze9ED3yMr9e6sQsYfg53pv4CMUxAbkcrlvlM/uqjum6
	 Bc+VWCkRW6FHhFChwLxA2XQJoMUIf32sro5Ilc0b84gsO45KTPqjn6BfrotmyhffI9qWR
	 cpvp4aJhxC+7YHdaBpbSK7g1/4mi7jrZKO5LbhhVNWjRx1JFNVhBF3pD1NP38J8uZLQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WN4jNdx2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.41
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADD2D606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 02:14:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ADD2D606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WN4jNdx2
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5be3cff0f6cso1976125e87.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 19:14:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792462453; cv=none;
        d=google.com; s=arc-20260327;
        b=jWOpoAdFP4YGuqsJyAVI7nzAEDkSeALfohy4MDNBiMsxjhSyE0UVFeMoobYg4KvvgM
         tlG9DHIR3rQFfMrui9I9ma7FOKHZtejN182/25GkK1uiPQqJ6Lj+Tj91ks9zGhnxI0jC
         v9h9ZbYmMXreadq8jy+TjwnVRV2/oErYGV85dL41gCEiFcg1e6xJh3p9IP5WfC6sPLWb
         i17WFBDEeeafKkiyBns04sT55n5wkgNsdYffkA316l0iGy9bT+/YZ4SujFXNN/xG9l1H
         cqjHqDBF65eoe3YQk0FA7KoSsuEpowgKxxHuvB39yIT+0Mb4LYdvHVXyn9+IT2yeqDFs
         uLyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/kTZQWUcpHzrJy9NMwC8XJWFAf9FL4EwlT1MlBIWbLU=;
        fh=xlVYTUYqSAO+q5MPbTTAVGPnpA19VPIPV8w4Dhimmfo=;
        b=jr8U3IOBPB4z65joKPlBCB0M/l9fdVs70ymin2IVNWjbTSzVbPySkzeRHTuNG9rckO
         9v9JC0Bp7I550ZYQY4wicHFqfymneVCdAsX6oPyBnyQGV/3+KY+l2psaPNDtr2oxoqZC
         DZ6eRJ8RKuQ4jxHLkbsd4fiLCUPEEzeFDlTbpePrVWGyoWDdXObxg5oAiFNcKXz4X08s
         ZPkf4DO1FOpvfZuqa0FsGq8an/3irMFDB9E9Bdt8fqVs+W2dlGU66Snz2ZRgAVTA1Cup
         1aAKl9LgkV520B/msy/WHtWIAAOewpO2DQzevBetFyjsMBj33SUYhMDqFAelECTlJrT7
         qShw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792462453; x=1793067253; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/kTZQWUcpHzrJy9NMwC8XJWFAf9FL4EwlT1MlBIWbLU=;
        b=WN4jNdx2SAkt0uTHYg63ZoL7ZaeJj3ozqVSkPY3/axls7o3882RIHuo/UCXTMYCBZi
         CUqZ6QS+wlDJtr+kUTD7sixIQMolxms7hab9GYwsGo+siC4ddCMxcvCaPPwuwnrCerux
         yK93HZDDRjkFKtmSOqe7ANaCP5E271t+tCMMVPh6FWrTdp/2mebok59JpF/8yvo8/uY6
         dtH/ksgZrinakTcuuACiuTl1r17QBTsOLRUIcQ/nWJnsa9Mh8ddz8dkjpzf9e6nr8qHV
         Y6us8f6/rukxbuqzCUyMlXlmcDknnn6TDlxq2L+9reJCMDgIxTvz6HD73tc16qBBRqe8
         eeww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792462453; x=1793067253;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/kTZQWUcpHzrJy9NMwC8XJWFAf9FL4EwlT1MlBIWbLU=;
        b=in2jAKI7zO1EVxncHTL/M0U7n8dGhq8eizfJS+mAT3ZW78fx9Jr7DevoE/XCWg/5nK
         i4HOzF6asxAUzW+bGy1SV9EsVLQsVee0mypBRs0nPu2JasryemA9cERoua1Z4sfPrKu8
         jlvrBi4bPHIljVH8g7YTRL/kehcc7SurdPkyDFPu/NbOJNAlO9SuVdXAmHgi3uMI4w46
         mpOuEKXiixIM3cWaDQSRFTp67WpULkWECilWEsIROVJo4qb0VN6wqpoHAeEYILjLazlX
         oXeHVARhYlxybfOp9nU5kVFwenwUHsROX0av4wAndSYs1au/4rpK3Gf/hkpq1P6nWjRD
         BWyA==
X-Forwarded-Encrypted: i=1; AKwUvBwDkjISJ3aepn+yLUhgo63IF42CduTXF/rT99EyAprU/2AeWVX6BWbEMp2GuspDvyNYwbE+77EB+HecQtI=@vger.kernel.org
X-Gm-Message-State: AFq9FYL9qPvDAg2tBHkNzyLsiBPvenEiVhBVG0er0M2xah8A1/TVSDpK
	npFJ/c3i+4zCsHLVu/KxNBg0Hj3kd4pv/1DZk+qxtDKPyqYCdAvPmy7jPw6t7C8hLfGjTqm9nqK
	4FIsMm1Ptx3JZ77RauvdWVjG9B4NVPxc=
X-Gm-Gg: AYBFou1mjHwkV72zBAVQzFMXAbBM7P92Gp11KCmAKi3JBHcYj/RkarBGFelSPzaHyhh
	JQR6NlO5B8Fp4IKy2bax3cxdWBe75d4J/bHFASOQyG6kNIDV+vb8xBFfOY2l77Hj2zvib5wiT0i
	/Mb3Y4bOK+fe2NMGMv5AVnJ4OSx4w8r3y5Tb3kVCIx876pAGWVaNxehDS8fCPu03z+5AEeBlNvz
	LIg5xi6KulT9HuqJ6PbZSqk2Je+fz8ODfrPK34uFhjhaCMWVzwGzX5nXVl2IJJEbDBj3GTirX0k
	YsFqQln/uDu7lFiaL0nYngnagOyET02OWLiaWNkXWKFx9YZB1FG620U352MOQ4ps5/hEdmcIEeR
	j726/ViD0MnsS+0MQ0iw/neDWsPfXEwVhVPCf
X-Received: by 2002:ac2:51ce:0:b0:5be:598f:2736 with SMTP id
 2adb3069b0e04-5be598f282bmr1905487e87.47.1792462452600; Mon, 19 Oct 2026
 19:14:12 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAO9r8zMaaUsBaS0TJumochRKt2ShV7nRaLnYPWv3=S-wUFgitw@mail.gmail.com>
 <CACpmpoecz4tjr-qvFRy22CGuF+4NBWbE7HVjdTGFqQOheK3CLg@mail.gmail.com>
 <CAO9r8zOAcf4=TscCXjMYvowUx-_u9qLGqY2-p7cK-z5CUU_x8w@mail.gmail.com>
 <CACpmpofYXDMviE6FS-BZdVntmQFvS+_xvfmOnJ2caZFerz6vyg@mail.gmail.com>
 <atGqPIpUfX0LDokV@gondor.apana.org.au> <CACpmpofyLW5z1DYEY2YAty0VOAhRR+Leic8O-B0N9hrzdW_=Ew@mail.gmail.com>
 <atL1ok1YkHbA4AaI@gondor.apana.org.au> <CACpmpoe_RXcJM42sTVwk_Qvt3zjAOZhzYZNsRD4xz_1HxDmadg@mail.gmail.com>
 <atMCfhB63koot230@gondor.apana.org.au> <CACpmpocZGHpTTOq+xa2bTnS-=gdUa8+E_KKJm41H_dSfbGikYQ@mail.gmail.com>
 <atadE_kZz45KAeuE@google.com>
In-Reply-To: <atadE_kZz45KAeuE@google.com>
From: "Kanchana P. Sridhar" <kanchanapsridhar2026@gmail.com>
Date: Mon, 19 Oct 2026 19:13:59 -0700
X-Gm-Features: AclHuK-O5GRznQ-4uEfzEMIrac0t16SF_OufPYrMOIRqkz_NpjCJyWmJTsaVlc4
Message-ID: <CACpmpofy3P7ukri8vukWte8x2sYz1pNCVXXAN9YtL6=A3BeejA@mail.gmail.com>
Subject: Re: [PATCH v1 0/8] Batched zswap_store() with compression batching
To: Yosry Ahmed <yosry@kernel.org>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, hannes@cmpxchg.org, nphamcs@gmail.com, 
	chengming.zhou@linux.dev, akpm@linux-foundation.org, linux-mm@kvack.org, 
	davem@davemloft.net, linux-crypto@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rientjes@google.com, willy@infradead.org, 
	senozhatsky@chromium.org, 
	"Kanchana P. Sridhar" <kanchanapsridhar2026@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2026 at 3:50=E2=80=AFPM Yosry Ahmed <yosry@kernel.org> wrot=
e:
>
> On Sun, Oct 18, 2026 at 06:35:01PM -0700, Kanchana P. Sridhar wrote:
> > On Fri, Oct 16, 2026 at 10:07=E2=80=AFPM Herbert Xu <herbert@gondor.apa=
na.org.au> wrote:
> > >
> > > On Fri, Oct 16, 2026 at 10:02:13PM -0700, Kanchana P. Sridhar wrote:
> > > [ .. ]
> > >
> > > That isn't quite right though.  We need to ensure that it really
> > > is a singleton before taking the short-cut.  So you need at
> > > least one conditional:
> > >
> > >         if (likely(req->unit_size =3D=3D req->slen))
> > >                 take short-cut
> >
> > I added the check for the singleton req [2]. I hope this looks Ok.
> >
> > With the latest crypto_acomp_compress(), the batch compress latency
> > improves considerably:
> >
> > usemem 10 iterations average throughput:
> >
> >    patch 6 (store batching only): 19,119 KB/s
> > patch 8 (+ compress batching): 24,076 KB/s (+25.93%)
>
> This is exactly what I mean by the numbers varying too much to draw
> any conclusions. I am not sure if it's the VM setup or the usemem test
> itself, but previously it was argued that the short-circuit in
> crypto_acomp_compress() was ~10% faster than the one in
> acomp_do_req_chain() (20,946 vs 19,058 KB/s) due to avoiding a function
> call and two conditionals, and now *adding* a conditional improves
> performance by 15% (20,946 -> 24,076 KB/s)?

I would like to clarify a few things:

1) The short-circuit in crypto_acomp_compress() that gave the 20,946
KB/s was missing the req->unit_size =3D=3D req->slen "singleton check".
However, it gave better performance than the baseline patch 3 in v1,
which went through the complete acomp_do_req_chain() protocol (save
req, do one req, finish req, etc.).

2) When I added the same short-circuit in acomp_do_req_chain(), it did
not give as good performance as (1).

3) Herbert pointed out the short-circuit was missing the singleton check.

4) I added the singleton check into the original short-circuit (1),
and this did not degrade performance. It meets the functional
requirements for crypto, per Herbert's feedback.

5) I cannot make comparisons between "a function call + 2
conditionals" (2) and the functionally correct implementation in (4).
The functionally correct solution is qualified with "likely"
annotations, which can explain the performance improvement.

>
> Moreover, for zswap with ZSTD the added check is always true: the batch
> size is 1, so slen =3D=3D unit_size =3D=3D PAGE_SIZE for every request. T=
he
> previous version and this one execute the same code, so the 15%
> difference can only be noise. With the stddev you reported (~5.4k KB/s
> over 10 iterations), both differences are well within the noise.
>
> I think something is wrong with the performance testing methodology
> here. The results are self-contradicting and do not make much sense to
> me. Did I miss something?

The previous version and this one don't execute the same code, as
clarified above.

I don't see how the results are self-contradicting. Can you clarify
what you mean by this?

OTOH, the zswap_compress() bpftrace results are clearly reinforcing
the benefits of compress batching.

"Sequential_zswap_compress" is stopping after patch 6.
"Batched_zswap_compress" is stopping after patch 8.

I hope we can agree based on the bpftrace data that
Batched_zswap_compress outperforms Sequential_zswap_compress.

>
> >
> > bpftrace measurement of zswap compress latency per-page:
> >
> > Sequential_zswap_compress  nr_samples     p25     p50      p75
> > p95       p99
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> > zswap_compress_ns_per_page  1,722,489  43,947  57,791   88,489
> > 130,165   323,961
> >
> > Batched_zswap_compress     nr_samples     p25     p50      p75
> > p95       p99
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> > zswap_compress_ns_per_page    665,267  41,511  54,915   77,707
> > 124,648   213,962
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> >  Latency saving (ns)                   -2,435  -2,876  -10,782
> > -5,517  -109,999
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
>
> I measured zswap_store() (not zswap_compress()), to get the per-folio
> latency, and it didn't seem to change much beyond noise in my testing. I
> also notice that the number of samples is very different between cases.
>

I was addressing your earlier question about why not just stop after
store batching, and why batching of compressions is needed. I would
greatly appreciate it if you can review the zswap_compress()
sequential vs. batching per-page latency data from the bpftrace and
let me know if this convinces you?

I thought the overall zswap_store_pages() architecture had general
buy-in, since we bulk allocate entries, etc optimizations to minimize
locks. Please correct me if I am wrong. IOW, I am focusing on
gathering bpftrace data of zswap_compress() with batching since this
was the main patch that needs buy-in.

If we are on the same page thus far, can you please let me know why
bpftrace of zswap_store() is important, and if I should gather this in
my environment. I am happy to do so, but not sure what it will
prove/disprove.

Thanks,
Kanchana
