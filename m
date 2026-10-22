Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.133.124
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792657222;
	b=SI0LA2hEPLp7miygwtSP5a0TQYsH+jyYEWVLwinVLcuBuzhbW7G9zz3ZlfoE/w/yabyM
	 he6f/BjJWGCJiMprnyeg0frVpBAWOY7mTqtR7iL7tgmFED09qImUMb55kYJFbzmcHrC1C
	 jlrFVQ7NXT4AHsYQGhmHo76kbravRF11oU1F4gt9/5iUmLuVbTPmDj5aAHc5VQtJDRQox
	 q4AZCifPWV3LrukGF9Pd4roJPmyUJNoxgoQvky3e/+N2l7kvLF+Izsl1F660lZiywoUaj
	 taPVZcY/bBTYvZxaAGW3AJpDyMh926ib/K9E9GfmS2mT0969doJOdkvD1c/cUzQQD9w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792657222;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=mOPML5U8VEW36czGnII45orJwLqdlStY1KO/yC+n3HU=;
	b=a7wr38ijXOJk8wNAjorxgNJk86kU/gzwViiQAgdbI9I6fkZGouf1666ghhH6xoR6VFA8
	 zgY8ayb2FXi+Mhh5Qi0Xok0W9s8vfg6sAMqOsIDMIXntyqkWc9tj+Fx/SJ0qNyGSxnprK
	 smMlFADicbtIB22RZfoqdEhqpYpJgGwEHMyixl3FcsEfTe4+DBRL2kgV/H9IkWTKTQGb7
	 NRwRC6KzEIK8Q8y87yFDRUxXJC7CtLP8rOPLnPozUApeylEUdAfsP/sfVskeA6LIHNAzk
	 dpb9uqhioXhC02MlR2h3AQBZKRMwjvV9ubvz+KHYAl97Hn9HSfrFWX+DXIO54wZlkPQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fHBe7oji;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=i7v1zPBz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFB71606A31B
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 08:20:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CFB71606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fHBe7oji;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=i7v1zPBz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792657220;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mOPML5U8VEW36czGnII45orJwLqdlStY1KO/yC+n3HU=;
	b=fHBe7oji4KAz3+BR06mZyhak+HK6sBrzR+6DFHxaVXrZtht2gR0/0KE9CoJEPXhOyWWVKa
	niDNwH0l/6Omc2Auuafqw8e7W4JUGa+mvvtVh11PTEe5xad2UVQ168BOYOaFuNyeZb45r7
	VUj+4DtIe9Sbw/ZpqUiQCCHPWT4GEKg=
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com
 [74.125.224.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-368-M29Nqa3wPluV4JW9Q10PRA-1; Thu, 22 Oct 2026 08:20:19 +0000
X-MC-Unique: M29Nqa3wPluV4JW9Q10PRA-1
X-Mimecast-MFC-AGG-ID: M29Nqa3wPluV4JW9Q10PRA_1792657219
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-677d10671b7so2399897d50.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 01:20:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792657219; cv=none;
        d=google.com; s=arc-20260327;
        b=d7ztFiskILaQQU2c8zXpKmxEXdyl5qH9NyuxnM828U6G6Bo39Bb+/B2iZAlelAtd33
         IwGsf8Bog7P+agO7gGyw6zuPe3TXj/t5Km/fZcfuF55kQPo0XQ6qyfsrTsuoOJ8rWvW+
         taJlCUbE4LYCNIsunwctxkTUUxq8ZkVQU03J0ZOFM+4C/eMHHUrFx+fR4lTGZX5WjE9W
         JrDz0a5toOzLbqlT+0S92h+iZmmzkG+qffGkb0sgcsXnsv6lewBKkNp4DTgwFYs0enS/
         VZkmXyx+G7aPdlakg37aRESQJJcJOkLTDZ4lzn9sKabEmOc1pF82q2F/6/g+zWH7OHqv
         RxiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mOPML5U8VEW36czGnII45orJwLqdlStY1KO/yC+n3HU=;
        fh=Ax3UBOFQc3fdjRj6Uxi3lK95x6g3zNg5UTIjJ8syLd0=;
        b=h1bYRoqZimThDircN4tfrwF6Ku+6yvNF7N8srsdAThwRLy7Z9tp5FTKr6VlLXv8+O+
         DnmZvJBiE87fX8zmTgYnp9/2O8n3cYcuoB60IRKLRTokud2AmTia0ow2T1cin0v6JRB6
         HUyhsIwzj2gY7/S9fsgABcSRqLV89OcdYP/pqfdJTNDDaaQHtvDTia09bqUlUsZ7Ysj4
         lptFu4T9mCXWzuz1PTRfhZ0WEvDdsvmPDbqVOruQyHIzlh7E5IE9vrGXZRjmZkuigq22
         yJPleP51Pd5Yj2gIeTb0+YMiOHUgodceZbh6eU3D4aMiXidI3OzXNf3Lqn4HrUWM65WE
         iafA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792657219; x=1793262019; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mOPML5U8VEW36czGnII45orJwLqdlStY1KO/yC+n3HU=;
        b=i7v1zPBzdSSIKJArIdZdoHl29jM+DoRGp7F69B5Jmi5XMLcUYFzLMqjRl6hpcnm/St
         2WF94FiPrPjfNu2e6r1SSkz1H0m5cN3WNxlTIDglaINruD6mM4l2xzCv4pRjQFdfGapE
         mUjEYIrwgtdFpyfF128BRonujc78bAROMfgM8NWArvLaVfzH450rqHpkrod5AkrcXgdC
         QmqpszVemkQYBgl7LJMcqM+UA4uZ5BvvsplD2Wx0rRbZayb2KAZt0J7SSq/t5lbXsXJ4
         1B+SZkVnL4Q9NpvRNT4L9AQocKOmoVX2hYTspfqLfLiP7yPkVTrmdh0YYASF7E2fVtwp
         UKxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792657219; x=1793262019;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mOPML5U8VEW36czGnII45orJwLqdlStY1KO/yC+n3HU=;
        b=WUt+kZJ3Bm/kZicOGX/XqwSOkcHbbvxThFYX+25i1y97/hUxNcynfBZQU7tUtUT4bl
         mn9ccTG2Njm2JYwHDp1Q+ohFuqDA5eEhiLnwSVysPN6xwmdJY7G+ceqiEZ/WiRNCWXRV
         hh9wEyMEmjKdFLzRdjRQD92AVnVb4xA12cA+PphYThRe7mpjVdd6KMIXjx5z+Qn16YZ5
         cOLF5vOcCdlQ/y22paGyMsqJO7TDOV0YaP6QGbtPzhPT3nGL4u+sYfJj3jWXl1swgLda
         TFJKWYvg2L6Nakh80Igx5+5D4Q7V6Rk8lx9y/9SF8jzX7GSdN3CBthrMOKr0jOW0Uvrv
         nGHg==
X-Forwarded-Encrypted: i=1; AKwUvBxlNbcfDU/X13xOZ/L+D4csROuxjYgkcbPHtgIuuER+9LF5sP4aV+f7RKrGv9K9KmMpET6oWWGhI96y7r8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLAyAqgl6vmoHl/pwmTfQUZns1Xjk33K0O4z+U2lSE18Zmhyhba
	E8CPEdPqscvQixhnnfeMN5d27Gp6lSGJ65Ac4fayLWp4LCjSlQadtbnfNaXHJ9WSRHwtE7HQvVA
	VgoAcJsFveL7yDqsaaSDRMYP9/zg+7AtC0G8kJhxfqj4UmVOJj/qbLOJ5KsajqJvqj069/Ru5uh
	yzZGfSgLiOmGQbHtqdNlYKMb2iTxbEyab1XIbuNpAf
X-Gm-Gg: AYBFou0kuPUAetzeajz4pmd5toMp8McJ0rfqP/DNxR88wvHBhrS0GHokdJfVh9HEO3q
	iOKWOgVbsqFsn4bHIsDPRTG7Xk4RGR4YXgTXgg+/ue1itwFR62iYkkz1g25Gs9OJdPdYOPyTcI5
	hKK6bVZjQdlFsm9s3Yn7zRu54Ge0ludW11Z0n2Bky3nemEoJSYfpE8kQ==
X-Received: by 2002:a05:690e:1514:b0:679:b744:a2f7 with SMTP id 956f58d0204a3-67a0e4bb145mr2614737d50.59.1792657218775;
        Thu, 22 Oct 2026 01:20:18 -0700 (PDT)
X-Received: by 2002:a05:690e:1514:b0:679:b744:a2f7 with SMTP id
 956f58d0204a3-67a0e4bb145mr2614726d50.59.1792657218363; Thu, 22 Oct 2026
 01:20:18 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260924-port-smem-v3-0-fbc2ea81a654@redhat.com>
 <20260924-port-smem-v3-2-fbc2ea81a654@redhat.com> <a966fe74-4ad7-4212-a164-f9f6fe225dd2@oss.qualcomm.com>
In-Reply-To: <a966fe74-4ad7-4212-a164-f9f6fe225dd2@oss.qualcomm.com>
From: Albert Esteve <aesteve@redhat.com>
Date: Thu, 22 Oct 2026 10:20:05 +0200
X-Gm-Features: AclHuK_Tyqu5hIV8_npEM13kfzEj0eIHEeaQc2EWnm4Yof-uZCDUZ3gkXffsLrI
Message-ID: <CADSE00L+bJoy5AYYB_0PuJE0NEs-_=y20kDUzPkA=sdD=APs+g@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] soc: qcom: smem: validate private entry list walks
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Sarannya S <quic_sarannya@oss.qualcomm.com>, 
	Pranav Mahesh Phansalkar <quic_pphansal@oss.qualcomm.com>, 
	Sudeepgoud Patil <quic_sudeepgo@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2026 at 2:39=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 9/24/26 3:10 PM, Albert Esteve wrote:
> > From: Sarannya S <quic_sarannya@oss.qualcomm.com>
> >
> > When walking private entries, use the uncached/cached free offsets as
> > the list bounds, require room for a header before dereferencing, and
> > reject a next pointer that does not advance.
> >
> > Skip the cached list when the cached free offset is at the partition
> > end.
> >
> > Signed-off-by: Sarannya S <quic_sarannya@oss.qualcomm.com>
> > Signed-off-by: Pranav Mahesh Phansalkar <quic_pphansal@oss.qualcomm.com=
>
> > Signed-off-by: Sudeepgoud Patil <quic_sudeepgo@oss.qualcomm.com>
> > Signed-off-by: Albert Esteve <aesteve@redhat.com>
> > ---
>
> [...]
>
> > -     while (hdr < end) {
> > +     while ((hdr + 1) < end) {
>
> This will reject a header that's at the tail of the buffer, need
> to make this <=3D instead

Roger. This is a bit hard to read as intuitively I would have thought
end is the first free byte after the last header, so `(hdr + 1) < end`
should include it? End uses `offset_free_uncached` which should be
bigger than `hdr + 1` and it would not miss the tail. But being
defensive about its value seems like the right call. I will change it.

>
> [...]
>
> > -     while (e < end) {
> > +     while ((e + 1) < uncached_end) {
>
> Likewise
>
> [...]
>
> > -             e =3D cached_entry_next(e, part->cacheline);
> > +             next_e =3D cached_entry_next(e, part->cacheline);
> > +             if (WARN_ON(next_e >=3D e))
> > +                     return ERR_PTR(-EINVAL);
> > +
> > +             e =3D next_e;
> >       }
> >
> >       if (WARN_ON((void *)e < (void *)phdr))
>
> And LLM thinks should compare against cached_end

This is preexisting but I think the LLM is right, and it matches the
theme of the patch. I will change it.

>
> Konrad
>

