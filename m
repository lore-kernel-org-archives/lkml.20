Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27B8738D011
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 03:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792121558; cv=pass; b=N3noaEERZXVzXLwyI+l5HD4EuKQwmRjdZy3sLBU5FMeOZlozbvUcbCwyvpDRLSA2QBC/idLHzNOGE02bgK7goRX4TkJItfRm1mcjxYgXNGUtIkKETgSZrhE+JqXqLquw0FEEzCpfFwGI9gdXcUbupEIV1/tk5YRvXE1KYIarBcw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792121558; c=relaxed/simple;
	bh=06zrE62fKrgiwoRcGb8h+2HCp2UBFMGvqy4x7WN+014=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LMDfWh0oLtGGINBLjlW16CyMfIeH9TBcoPVDxAf6q0CgqnFEd3oHXymV5mMlGHMsWnT2TX44uF98WIZozvVN+hbjOZYnXrcLr5pujp2K59lZk1flXwV13HmrJJTCwiqbMXExMB/Dx47/J+K96sNLaf19rLxcwGJquX4OIZoS3kU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qEBIBlM+; arc=pass smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qEBIBlM+"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5be4b61fd3dso203711e87.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 20:32:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792121554; cv=none;
        d=google.com; s=arc-20260327;
        b=EYNlSVJHwWsPt5EDYRSNmqICnX9X8QeVoKVz/RumnNv2P0HzFoENPkosrqZ70+ou7p
         x19nR6Cnm5F5QlTm3fwcmFfH9EStV6AGB9Mkq7EFIIpWFpuX+fqKHLTDFkHzmvVFfj+R
         hyEw2cBEiB/+MPAJXP3RlnOEcxDRUEvaZoXL0NLu5buKKziHeWBTSly/Rkwq99RqcvcF
         mRVHlGRY20MDHqAuBYk+O2VngQMdPH0xqFI/IAaQt6EcOFGaTlMtT8V8wjU55wcwFYBV
         2PaQkhdLsGkVDdvWg6bQKK+nAgei4kJWobZqQc3+SBvgkTFWltBGzaEDhCzaTAiCZE64
         1uZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mthJ2xXwzbGlymovK0MC30zhpam2OvKpb9vmh5KmEw0=;
        fh=hcKLXKUgRfVjVbvCkp6KJCdMPZQiHrm2sbKb+j2AbeM=;
        b=J7vVBF3iuf8ahC3ZF973OAPQwONBbIEeNxgkOa80iUjMupyKZoUc7Rg3eTq8l+DC7h
         7Hy+ahIVjoDZm5zwnyowNozz8NnMAm2KxWX+yxj3HaC1RNWdyEtk5e3+8b50Yd7RslbL
         LWjaMsqAbHo3Y9UeejXj/LxMGFSQ8/9UmJ+4dIX0uc2vdXaQdgBEkN5X354WFhAUyaFk
         8QGYPLO/qekrHRtsSaimxHdYRr55I1b/rX9KcfC19ZMVR93TXam7ZqmpwGIeLJXA8a2F
         s18w2qQvvrw/JeTpckjcwx47etRJDe7ZAdjR7pcCSEuoentgTImakP55+D2mqB95PnrZ
         gyYg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792121554; x=1792726354; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mthJ2xXwzbGlymovK0MC30zhpam2OvKpb9vmh5KmEw0=;
        b=qEBIBlM+XtKRBkaWrZHx905ToXnVkqofsohd+gI5tyoKyiFKYXcUOtFiQxqzEJGBc7
         vVR8AcBgwumHAYQl0V9dYhb/Yl+3yJ8yFLK5Ib+BRSU20qegSmuz/IN+ImLLltShMGXZ
         ASdh5Wy4/PY8QIqH61cRft5nZYt0F049w7Txfmmufp+w8vUiStBXKI8C3MrZKaHsPibG
         9AjZLX92ySlPTwoFJj36DIMczg7CBrDagjJTCOm8+h2H7/HMx584YVQtjUTuHEu+Vt2L
         lyqtuu+4Wh/YUmKdukcpcIKxApKMPYmZfd7Nd4DrDiYxzwBp/zAXUPfvlDStqNRZpe8/
         JAjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792121554; x=1792726354;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mthJ2xXwzbGlymovK0MC30zhpam2OvKpb9vmh5KmEw0=;
        b=x+01lEim5EjWvmACnmMpOMi8Er3qveHZPZNtZiYgxciJ8xHF3gp7lLAhKoTEwX5Pfo
         T0wJaYZdouqJj+A85Nz48+ndDPWwMjCg/id/LTaKSoTsNcLZtFO0JP/qHeZFt2q+XBDX
         xMS8yV2bY6FlVSw094vG5moHCm8fJVjHytvLugLuv75EKiOyPJwjyo6ayAO/rtQuQw4B
         WdOrrsnTFl/Aeyve7gAeIiQgZfZtuS51ycasowhyqViUTEGTRyuwmPEUX7uIdMIeSBZt
         cY4ePFmEqXtWcW7QhZfBN8F5ZCI9GkcOnOGYXJYN5dZioG4ZKf0jxiZCrOyC2m5q05yd
         XM2A==
X-Forwarded-Encrypted: i=1; AKwUvBxK/VJzyOEzr36K5IUYZKqPfsX0P74OxZxQNMUeDWs7uT5k/ePZtow/cQZgIDF/7JIb/ijOoRBZx1JC/mk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKrTT3sBtrXxG34NR3udv1hGKJSbx0MYHnoDbYf8PqeZFni8C5t
	urUBZBD79FlRm4d/5sctFrHpfjJtsd5a5/yAfHfFZV538PSxsW5rGr8XukC9xLDtix3MNKUbdU8
	m09y1RjBR9rYiFklpzYYf3cD/5JcTq74=
X-Gm-Gg: AYBFou2w2bAQC18X6gkOtV6FSWBwbTm14RHw3TWOiGPVBej+MeyP9suK1u7YnIammx1
	USvDlfxgmx8KpBfESy0b6M2ckgkmZnBdaLyHYgeIRJ7DvzQYIuQHoQ3hErtNvzRZQn3IK2v8s8F
	Dwz32T9htQLpEgO5U9C5mMB5RdA8zNBx/iTSQfMuEEplmNzF0cN+jJCIEBFAU4jOLbBaIZkiTtT
	SsLG9CQROKFsW96mXVARSoHu9NSwhO+GRU2nTNHLywf06YbPey90liENh+K0DD1FilDB9+0n4XF
	wb0Sq71T+wqYI7PeSYklOK0QZ1zFjRUnizYwA8oZLyFm0vtDi7Zd9Cs=
X-Received: by 2002:a05:6512:6687:10b0:5bc:e472:11f9 with SMTP id
 2adb3069b0e04-5bce472122dmr4219021e87.20.1792121553829; Thu, 15 Oct 2026
 20:32:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261008182814.27450-1-kanchanapsridhar2026@gmail.com>
 <as-jZopKRfuYAiTE@google.com> <CACpmpoeS_cvXRWJXqiYZV9oykk=91efv8KtZgK2Pi-QwHnQH3A@mail.gmail.com>
 <CAO9r8zN5n=9v4K+OtEEODg=e0kcFW99PreUcZm09q9CUMQc+ew@mail.gmail.com>
 <CACpmpofdoeVbbw7izCDeJ7eS+XpWj+3sp3teKEQWywyRB75jYQ@mail.gmail.com>
 <CAO9r8zMaaUsBaS0TJumochRKt2ShV7nRaLnYPWv3=S-wUFgitw@mail.gmail.com>
 <CACpmpoecz4tjr-qvFRy22CGuF+4NBWbE7HVjdTGFqQOheK3CLg@mail.gmail.com> <CAO9r8zOAcf4=TscCXjMYvowUx-_u9qLGqY2-p7cK-z5CUU_x8w@mail.gmail.com>
In-Reply-To: <CAO9r8zOAcf4=TscCXjMYvowUx-_u9qLGqY2-p7cK-z5CUU_x8w@mail.gmail.com>
From: "Kanchana P. Sridhar" <kanchanapsridhar2026@gmail.com>
Date: Thu, 15 Oct 2026 20:32:21 -0700
X-Gm-Features: AclHuK8EwiGuB9ddUtL4cQ1Is2_v69m3igeGciRO29KLyhbEMLCUdPXew-h6hcg
Message-ID: <CACpmpofYXDMviE6FS-BZdVntmQFvS+_xvfmOnJ2caZFerz6vyg@mail.gmail.com>
Subject: Re: [PATCH v1 0/8] Batched zswap_store() with compression batching
To: Yosry Ahmed <yosry@kernel.org>
Cc: hannes@cmpxchg.org, nphamcs@gmail.com, chengming.zhou@linux.dev, 
	akpm@linux-foundation.org, linux-mm@kvack.org, herbert@gondor.apana.org.au, 
	davem@davemloft.net, linux-crypto@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rientjes@google.com, willy@infradead.org, 
	senozhatsky@chromium.org, 
	"Kanchana P. Sridhar" <kanchanapsridhar2026@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 15, 2026 at 4:45=E2=80=AFPM Yosry Ahmed <yosry@kernel.org> wrot=
e:
>
> > > > > > > How much of the performance benefits come from patch 6 vs pat=
ch 8?
> > > > > >
> > > > > > This is how the performance changes: Average throughput is aver=
aged
> > > > > > from 10 iterations of usemem.
> > > > > >
> > > > > > patch 6: 19,119 KB/s
> > > > > > patch 8: 17,593 KB/s
> > > > > >
> > > > > > So the acomp_do_req_chain() path that ZSTD goes through with pa=
tch 8
> > > > > > causes a regression, even though it provides a generic batching
> > > > > > framework in acomp.
> > > > > >
> > > > > > I was able to retrieve performance with the following change in=
 acompress.c:
> > > > >
> > > > > Why add it to begin with in this case?
> > > >
> > > > Patch 3 ("crypto: acomp - Add trivial segmentation wrapper.") was
> > > > co-developed with Herbert. The request chaining for non-segmentatio=
n
> > > > algorithms was as in Herbert's original implementation. Since this
> > > > causes a regression, I would like to get Herbert's Ok on replacing =
the
> > > > request chaining in this part of crypto_acomp_compress().
> > >
> > > I mean, why add patch 8 if it doesn't improve performance? Seems like
> > > even with your diff, we only recover performance, but we don't improv=
e
> > > it after patch 6?
> >
> > Patch 8 does improve performance over patch 6 (19,578 KB/s vs. 19,119
> > KB/s) by 2.4%. Besides, patch 8 provides a compress batching framework
> > in zswap, which is the purpose of this patch series.
>
> No, the purpose of this patch series is to improve performance, be it
> through the compression batching framework or otherwise. The
> compression batching framework made sense as it provided greater
> performance gains with HW batching/concurrency. Without that, I am
> honestly skeptical. 2.4% can be within the noise.

I seem to have left out patch 8 after making the crypto_acomp change
to not use request chaining.
My apologies! This was an honest mistake..

I have regathered the 10 iterations average throughput of usemem after
applying patch 8:

                                        patch 6: 19,119 KB/s
crypto_acomp change + patch 8: 20,946 KB/s (+9.56%)

The purpose of this patch series is still the same: to set the
framework for batching of zswap compressions, and not just of zswap
stores of large folios which is what stopping at patch 6 would do.

With SW compressors (ZSTD), patch 8, i.e., batching of compressions
and storing the compressed data in a pool, demonstrates significant
performance improvement (sorry again for having missed applying the
patch earlier today). This is because we isolate the working set to
just these ops, which benefits from cache locality and minimizes
evictions: as against the vectorized implementation without the patch.

One of the immediate benefits of this framework is that I am using it
for bulk allocations of compressed data for a batch, for entries that
map to the same slab bin. This proves the forward-looking benefits of
isolating compression and storage from other zswap_store_pages() ops.

The crypto_acomp change I had mentioned earlier does not hinder HW
compressors in any way. As mentioned in the commit logs, patches 1-4
provide the API that can be used by HW compressors as they see fit, as
long as they register the segmentation bit in the algorithm creation.

If you are Ok with all this, we will need Herbert's Ok for this change
in patch 3:

diff --git a/crypto/acompress.c b/crypto/acompress.c
index 192ea996e779..db8e4c82b900 100644
--- a/crypto/acompress.c
+++ b/crypto/acompress.c
@@ -293,8 +293,12 @@ int crypto_acomp_compress(struct acomp_req *req)
                return -EAGAIN;

        if (likely(req->unit_size && acomp_request_issg(req))) {
-               if (!crypto_acomp_req_seg(tfm))
-                       return acomp_do_req_chain(req, true);
+               if (likely(!crypto_acomp_req_seg(tfm))) {
+                       int err =3D tfm->compress(req);
+
+                       req->dst->length =3D unlikely(err) ? err : req->dle=
n;
+                       return err;
+               }

                return tfm->compress(req);
        }

>
> > zswap is the
> > first user of the crypto_acomp compress batching API provided earlier
> > in this series, which I think, is a great starting point for us to
> > evolve this further, as mentioned in the cover letter.
>
> Without a non-trivial performance benefit (e.g. with HW batching), I
> don't see enough justification. My advice is to try to push 6 (and its
> dependencies) separately.

This doesn't penalize HW compressors, while representing the status of
what exists today (sequential).
