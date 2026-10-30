Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793385188;
	b=IAN9Sh42NkfIHCeEqYNvaLQDJzUYKhC+0yEbhagR0qNvDg5ewQA7L46O1bcOcdptnfMA
	 yTTpNMX0UC71UiAosxZElldOhhKfP7SKxs8v2y8YGqKAka4sUVY08QhnNvOkixJB8I7No
	 6z6rsdV4l/AL6raoAjFqodgiAA10Xe+pnAQMgbQgL2SrgspN0LOhI/RspQqCtYEFuUqJB
	 aXPV0E2US3xhe+2Zz1Oi5Q8umBwCyKNkbHoGHm5kk1RzSm9WV4mEa5UE144gohtF3RnOz
	 Gfl6usnI7ppK9xmr4a0iUmmkSCeVczpzMOSGZGWb3yfuHRpGj/XrQI5zcl6R4caLcIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793385188;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=LqwO/tbXEMHl9nOAdKfhCSfefmnSAVqYf2mSAzV9dbw=;
	b=VOvvLzx1aBaAhU9isTd1uhMWJC6eLUTu3+0mM3wWCiD+hxcnNDKMmRWavsAWqQPLLtXI
	 pf3SBru5Woq+yPa1JH1KMy8pU3wRdxEIJaXekyGRRJP61v6u6rCxypkdObFf0dsJXit5N
	 TfswBYn6O3dafdrw+AaZ+gukA3Ke3OuQ1qZfvLdxFhaqdwV5juzIlcEH1oLZVaqyee8Lx
	 2QdPxNUlx9S2AAf6is97zIxkSUyMHQNSTAaL3m/JovAtUa2pAxhxAXAvIbwbuhEnd5bZq
	 1Uju9ClCgVk2JaTOKNbWqjCZ+6hh/pPVFP2RXyQzDDv/2/H7gEAZRJVHek2aSQObjcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xhYb4R9K;
	arc=none smtp.remote-ip=209.85.210.169
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18534606A32E
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 18:33:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18534606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xhYb4R9K
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-88cfa501c5cso470136b3a.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 11:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793385187; x=1793989987; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=LqwO/tbXEMHl9nOAdKfhCSfefmnSAVqYf2mSAzV9dbw=;
        b=xhYb4R9Ke1pTbYaBTbVPzyJbfQ75coDEa6uWXn6/sNo3GzqjzQKUd+RPmOwaU1Pchd
         9nvrvbd6PS/ug+Rjmsp0eojNT2kGZH48VrRb0EaRVtDJXVh98Mu8UcrFXr2QZEUiobyT
         Q/NgTTE2dK5NxejmA519jIBnqvIWmXWAtePFO3DhA934zR47V210H3H6JfE0Eq7c/bYT
         LhIM79VQi3YdewhRCSgcAbOLlSLvc/jj+w+vpKjx+qnRRYJs4Y2b54VgpS3zei/sStzd
         eGKvDygp4jzAZPeVNSc9uykE9p0BKQ0dgJOeOsDOvgbki0BjaDXaAXQMm84dTghXGs9D
         0soA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793385187; x=1793989987;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LqwO/tbXEMHl9nOAdKfhCSfefmnSAVqYf2mSAzV9dbw=;
        b=Rw3DuZZOJRR6jHYAFb5EHEkpwxjX3A+FVKTqEquamjJkPCmpUigfcU3iX+JfwdAcVH
         /IDlo0O9oD6Xhb9nWYEnMiLcPTxs8VNfZWQWV19+zhWdbftQ2uEzvisa9/UYWXGloOtM
         38/r99YfT6eqaiUShtIaHgJ9DwCwz8nuUmJhuBNZtYf7V61qfcHTu/QMpk75pn/oPufS
         cVVuYNVMIv41zselJKXNlwqlQvZTgohlNQrganjvTvxjyX7nfGdYPsA9nrtWeqvV3wkb
         Wf+UNYiqoeSX0i9CZrd8OXV0fsP79GHa2UxvEs5RhRela8X7MMPBgPA7oHZ4OhDZ1Nrz
         hXHw==
X-Forwarded-Encrypted: i=1; AKwUvBxj7x7HOIrcHt3zPc5z3uim91gZigGPuYSeeuiDsskPfMV4O0Mj29ysapCXJZEmF5TwULdwDvrRJOE8Pkk=@vger.kernel.org
X-Gm-Message-State: AFq9FYICVSWRP4ElNqaVvdc7wk/NikyzomEX9XNoYQgTppOB59+c/BVm
	ZJHvJniAUuX9vULWWo5TXLqVwV2XZMvIs6IoaiUb7RkqDFI3RIEFMUT1U+6gjZiO
X-Gm-Gg: AYBFou2Npoq2p9z2fuNRYlbzg0MCGRPLEvqZil3lUGqw6FqFR+mPBa1zl53coWVkWj5
	GKNc0y5C5L4Zdt8CAV0ib9yDoKGprmcVhF29y1/2Qu1cT3qe21ZtR372htdvfgzPAo1FJcN9EjB
	S9zLcaqwWc/0ycYBcb0qQzuVtyJkuBKDimeRYMc24szoJqCpsaEIYtRGWIJ2MmCKFdLtAEwVuQC
	fX2TUaxrQnb3fF1tbQxB1kYYgbDNCMT9k7OxrafvrRjTXQO4IKSoxyhz1SbRQ48RNWYbmuabl7l
	Tf02i75FMy+l0dzuA9kENiglFdvHqDNzDbrQIqInHtZeU+DoQYPIE0rmB5DUcWr+2ezVtmUk0QU
	stoPUJ2ZWpWr7dbCU2FI0Ec+t+l7MD4yIFhKdYiR1srgNgLs0kYFHz3X2AWgra9D2ZXDZ7stJNz
	323Qm9LDQ+ZNmqRYNKJqpqeetGDgewWsIEAH0XhBv5T8Sxjq9Ybi52sTNjSxhtL/vzUDKJNlA8C
	Xo1kV4D7q4zFMF5YkHt+JU13cpugzlQd+UKG9tMfm3xstIsMtfKvBWlLPlaz3/EFgoRbTYNpFO5
	P8ggymJJ/LtoAk2pBQomT5R1JpYAFDQu3dT6TTsYTWZprskFwR3NseY1/w5b8K6Th6y+JaTgD+N
	mKYWa5ikHKQw=
X-Received: by 2002:a05:6a21:2212:b0:3e1:d43e:367f with SMTP id adf61e73a8af0-3e9290ff9f2mr3005488637.73.1793385187421;
        Fri, 30 Oct 2026 11:33:07 -0700 (PDT)
Received: from ?IPv6:2a03:83e0:115c:1:5d10:1794:f0d8:db5b? ([2620:10d:c090:500::4:1201])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8aadaf86e6dsm336098b3a.57.2026.10.30.11.33.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 11:33:07 -0700 (PDT)
Message-ID: <727459335119599b851b7a1ed72dbe6220e14571.camel@gmail.com>
Subject: Re: [PATCH bpf-next v3 11/12] [do not merge] bpf: Track low-32
 scalar equality across narrowing stack spills
From: Eduard Zingerman <eddyz87@gmail.com>
To: Vineet Gupta <vineet.gupta@linux.dev>, ast@kernel.org,
 daniel@iogearbox.net, 	andrii@kernel.org, memxor@gmail.com
Cc: martin.lau@linux.dev, song@kernel.org, yonghong.song@linux.dev, 
	jolsa@kernel.org, emil@etsalapatis.com, ihor.solodrai@linux.dev, 
	john.fastabend@gmail.com, shuah@kernel.org, bpf@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Date: Fri, 30 Oct 2026 11:33:04 -0700
In-Reply-To: <20261020161907.2115379-12-vineet.gupta@linux.dev>
References: <20261020161907.2115379-1-vineet.gupta@linux.dev>
	 <20261020161907.2115379-12-vineet.gupta@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-2.fc44) 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Tue, 2026-10-20 at 09:19 -0700, Vineet Gupta wrote:
> A spill narrower than its source stores the source's low 32 bits, so the
> slot is their zero-extension -- the mov relation, in the store direction:
>=20
>   r6 =3D ...                  /* full 64-bit unknown */
>   *(u32 *)(r10 - 8) =3D r6;   /* slot holds r6's low 32 bits */
>   if w6 !=3D 0 goto ...       /* not taken: r6's low 32 bits are 0 */
>   r2 =3D *(u32 *)(r10 - 8);
>   if r2 =3D=3D 0 goto ...       /* not deduced today */
>=20
> A store never sign-extends, so BPF_REG_LINK_ZEXT is the only kind that
> arises. save_register_state() copies the source whole, including bounds
> for bits the store did not write, so the slot must be truncated before
> the kind goes on it -- otherwise the first sync_linked_regs() intersects
> the correctly rebuilt low half against those stale bounds and empties
> the slot.
>=20
> Only one order pays. sync_linked_regs() walks spilled slots, so narrowing
> while the value is still on the stack narrows the slot and the fill copie=
s
> an already narrowed value. Filling first does not benefit: the fill is a
> mov, and a mov drops a zero-extending link.
>=20
> Posted, not proposed. This is the direction asked for, implemented and
> measured, and the measurement says do not take it. Against the ten patche=
s
> before it, on 441 cilium/katran/fb/sched_ext objects, 1467 programs:
>=20
>   verdicts      no change at all
>   total_insns   102 changed, 63 worse, +84,450 (+0.34%)
>                   +59,616 (+57.2%)  104,160 -> 163,776  test_file_open
>                   +19,784 (+89.7%)   22,053 ->  41,837  rusty_enqueue
>                    +2,688 (+40.6%)    6,626 ->   9,314  layered_enqueue
>   total_states   64 changed, 63 worse

I'd still prefer to keep things symmetric.
Instruction budget should be less of a concert for 7.5,
as far as I understand.

...
