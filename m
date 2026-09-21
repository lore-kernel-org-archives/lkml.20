Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA4C0489FBF
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 16:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790008495; cv=pass; b=Kihz0jY6954Swg8abIAiMIvwjrEi/0KOJP7UtntDZavffAJ6o+RYfFL7CxAb8T4SLCrFSWDhGPPVEmHhI/C1ob7jP1OSZgviSJO8kH8KkrhaBe5FY4POjT+1+/eoEVWEt4eUyAzYukPE255OEQv3Goij2Ly5+e3vN890R3YUwQI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790008495; c=relaxed/simple;
	bh=RZa0PZWpYO2RtYYJaAXJcHE9b3EbDTCKnRDPO8BRFf0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QDZ4w4FyUNQmxjJ/Muu99X1KUMaNPvbgg2XtUWwlq0ptoxbDk1+PE6zwfrnkj52rkrwWJVwYIIk85xID/3IOvrzeZyw2ZmmRf6/retbn4Wmy9j44oxfGvoPHvWX6etexbzXLRHWuNzg0z12+z4uPggFY4yINWPxAqp7oO7tdIU4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NWRege7a; arc=pass smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NWRege7a"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49ccf12bed0so74955e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 09:34:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790008492; cv=none;
        d=google.com; s=arc-20260327;
        b=SjMHteV6riJIXIxX5sML+jKe205kpUQridnmj6FvzXJMZ0Lgl/373vMVsMzbmqJ+09
         +SHbm/+/j1Dr21bzE4Qx82yr4dXBz6K2cFP8/3v4pstLL3vXr5CzLerpgWRHHsgtjHPv
         KE7d2Rj+xWb/dCcnosf1Y61cgW9Ox52+E7vT9X+uXLBYx7V3vMtUciEO0S0C88F303jM
         vWJjklz9nXuXrHV24Mb8UnFhRcfE40Hq/ZgxPs9evp6krNmcXnOTQEdRGElObeKNtemC
         hC7AgXJ4pSmPKJjJCQS6GVC5HZ0N7DVSGiOOWR43wK8TRNBL4Aj2akIrRiX8zFhD7KE/
         Kusw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HhiIkC3hMhRH+Ioe7AJ260IRJvy39gBSpZFPhpJ2MJI=;
        fh=FyviJwH9eEYOlt7kMm5aKZQGhUHUyiPPeCXC7nDBhgo=;
        b=BsSSENQT4DPxLsqkaf2BVuBSC8TB5GZIqqiTM0XOEVVdcmyaEgD0rU9BOb2NSmgKup
         o1U9fILrfj6TU2I+CSOH6PIezvE6JdpR2Y0X06/+G5ersB0sAvfqIcANSJdNZkzlsv+P
         7xR1cdMdlMxLekwBL2SopjJVni57gIUxSJE2wsO1vhgg9ihl1ticzmSvz+9XE02nTf0Y
         HEDjDQ6brR/xwXFuryOyZmxgbp8XmEhodrCMzy+OztuWhJnpuivVzf8XYIgSGR1Zt/st
         ag41ETbYhz9b00SO5wusa9qEnjs//522TduRU4k9P+ErjBgx2SoJ0eiYVNuRmdR6758V
         dqjA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790008492; x=1790613292; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HhiIkC3hMhRH+Ioe7AJ260IRJvy39gBSpZFPhpJ2MJI=;
        b=NWRege7asAENLoE94ERG0YQQhPCShO/rN7uh9tRWUC3KwIaaf0oV8OhKIvnhhEV+Oe
         fMCbn+hPCE5CYaztPlqUeWCcelsGYLE7JWMHLbUYmcS/SD3hI1cMP9Sm/Uw1x6992CmU
         r3TcDldBjG870jy96FRrfCm9cne2BD663Jv1SCHVuDrOzMD9ek0FZL6dwAy8aFEYWnQ0
         zqoM+D6r/1Gnk31zcq2elBuBAQ4pRVXJRwgOSp5jBXvj1R6mMrQ8VbyzNiUIsOHmzM9D
         uVPtdPYNaaixrAum8A/zzFhXKcgKmhYYSwaelMMPLR5IaLq5O1FSOsv6NXj2MoMH2ish
         HaBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790008492; x=1790613292;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HhiIkC3hMhRH+Ioe7AJ260IRJvy39gBSpZFPhpJ2MJI=;
        b=PfX4cKj7Z8BjW2WO4GCcct0eAWsmz1zk18LiEcRQUhmCuF/YBW3xNtqno1bTn08Iw8
         KvLFGIkCPJCXJ7cz8Ir0sFmXiZEM/o7gmONU2jH730PW6d6Q4unYh5KrbsztJaQXh6UY
         KEy4/PlCHKhjlhzIaRQTSxmWvuf/HHsikVM/R6izHpsxalZOychQnxdLN+b08wC0UzdC
         8K0CFNH772I4k4e3rd2av9M//6+ePTbBTEIwSysCgUnGiQXJgYkmRIxCBOCMY5tSAfSR
         +EWYQnGgBbyNqpSODVfjHPG7Or3DQV2UDLHDq662GErMruj7Ec4pdbFM9Fo6AIWeGtNM
         IxLw==
X-Forwarded-Encrypted: i=1; AKwUvBwFU+VUBYQy6XsMY7Wo+l3YnDVIZTIWb/X+EcQBA6xFECxokCWTVUxOU0KIjxHW8oSkYgZPIAL6LFz2ZCo=@vger.kernel.org
X-Gm-Message-State: AFuF++m/8hfWQTaFg80meesSeDHtxXawGOocd9J+4PUNJKS/hAKz1m9u
	E9x6IMyQ1nuE4mbikNB1X/hV/VTaJOsnOxHmSMW0LuZcUsJEuHSF/OArwdF0z7BZLtwt7xGMhdY
	wultRkvJBw09W10/v4vXkS6rebpeDmpQuOpIH4Z9a
X-Gm-Gg: AYBFou1vfyOjoksTHxSGS00rw9I3UGd25O0AIr/53r760sTiF1DxN5/9ML7FQAC6eS2
	nSi8a7h5nMSGm25XTziVxe5GgMfwcEWqX0+teshahfKiPbqZmp/Snci4bGgD0g/pRJOO8iZOT30
	mI06VuGocsh0nIuhLXfGdy8sqmSbfPmqaf/I6JQFBhgWCStNeG7ls3vVEH5fGuQ4PizdnI/Wc6L
	j7RrvFTOtzTHhqyOhNiZoxhn4JQixuX8vmsS8QpUIrj/ZfaGpuCz3YBcIXAyyMfHH2RmJVKaens
	vghjJBuYh37bm2u0BhP15I9ozxTZLxwapearOGIiLP8wQ8c5zIE2u4E4/wupwWo3S7W/JjdcTzg
	alSuestKwSp8=
X-Received: by 2002:a05:600c:46c3:b0:49e:b733:7277 with SMTP id
 5b1f17b1804b1-49fcd2f1868mr2400495e9.2.1790008491472; Mon, 21 Sep 2026
 09:34:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921002206.184660-1-tjmercier@google.com> <20260921002206.184660-3-tjmercier@google.com>
 <DLKL4EZY63IU.V6E077SCBT1S@gmail.com>
In-Reply-To: <DLKL4EZY63IU.V6E077SCBT1S@gmail.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Mon, 21 Sep 2026 09:34:38 -0700
X-Gm-Features: AcwNN1X5FX0DDc5G3O8syuihKRyddOJi1pqh-uojY7fix868yCcIclMUa6RRp38
Message-ID: <CABdmKX1vF-FD4mFmmobNJeKjQLdZ9wztqGTcR4P9tSv_nEFsYw@mail.gmail.com>
Subject: Re: [PATCH bpf-next v5 2/2] bpf: htab: Reduce elem_size by 8 bytes
 for small key sizes
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: daniel@iogearbox.net, andrii@kernel.org, eddyz87@gmail.com, 
	memxor@gmail.com, martin.lau@linux.dev, song@kernel.org, 
	yonghong.song@linux.dev, jolsa@kernel.org, emil@etsalapatis.com, 
	ihor.solodrai@linux.dev, mykyta.yatsenko5@gmail.com, bpf@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 20, 2026 at 5:57=E2=80=AFPM Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
>
> On Sun, Sep 20, 2026 at 05:22 PM T.J. Mercier <tjmercier@google.com> wrot=
e:
> > +     l =3D __lookup_elem_raw(htab, head, hash, key, key_size, &n);
> > +     if (l) {
> > +             /*
> > +              * Pairs with smp_wmb() in alloc_htab_elem() to ensure
> > +              * value/pptr reads happen after key/hash match on
> > +              * recycled elements.
> > +              */
> > +             smp_rmb();
> > +             return l;
> > +     }
>
> Is this AI suggestion to add barriers?

This is the issue that Sashiko found with lockless readers when I ran
it locally. Before this change a lookup with a pointer to a recycled
element had to match both hash and key before accessing the element.
The ordering of those assignments meant that they were mismatched
during initialization of the recycled element until the hash
assignment at the very bottom of alloc_htab_elem(), so
lookup_nulls_elem_raw() would reject any partially initialized
elements (unless there happened to be a hash collision with the old
and new keys).
Now without hash, only key can be checked. Keeping the key assignment
early in alloc_htab_elem() would mean that a lookup might match the
key and look at pptr or value which haven't been reassigned yet. So
for hashless elements I moved the key assignment to the bottom of
alloc_htab_elem() like hash.

That leaves the old key in the element while the new value is
assigned, so a lookup racing with deletion and immediate reallocation
can match the old key and observe the new value. But that is already
the situation today. lookup_nulls_elem_raw() can pass the key
comparison just before the element is deleted and recycled, and then
its caller can read the new value later after the htab_elem pointer is
returned from lookup_nulls_elem_raw().

So the relocation of the key assignment depends on it actually
happening last, but on arm64 we have to worry about weak ordering...
thus the smp_wmb() and this read barrier to ensure the element is
fully initialized before accessing value / ppr.

Today hash doesn't have the memory barrier protection so it's not a
new issue. I haven't observed issues in my testing but most of that
has been on x86 not arm64.

> I think it should be on the program side.
> If users really care then they will add such barriers.
> Doing it unconditionally will cost performance for everyone.
> Especially on arm64.

This is fair, a program doing concurrent, lockless updates and deletes
should know what it's doing and should be able to provide its own
barriers. So I'll drop these new barriers.

> If you disagree, please provide ./bench bpf-hashmap-lookup numbers on arm=
64
> to demonstrate that perf is the same.
>
> pw-bot: cr
