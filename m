Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2313C48C8A3
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 18:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789239597; cv=none; b=X0RRVVuKDZrfASO+kzMyr5ZG1BkcKCFVlrftQ/TsXegT8CFLeRj/66wj4GfNZBuOEsLWNVmGYQl3kHdw0CYbe5asi0579rD6wMatFptnN6AJBSeAHWdo4gvuFksbo9TP3ueND4Dx1wyixw0Ua1R7uhh87yVoZ9iuxawFRHdTNJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789239597; c=relaxed/simple;
	bh=W5pYYkFbHu8gvCgwzbJArz6TGx07mjzoqi/91WuzJU4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=XnJSYAKZfzoPZS6rhGqKglKYwqh0lvT64X65u7C3MHcTKPo49TRqv03xMc3v5lD/grVChyKXdoC/huDc64wHIOn14G31hgwjrDKqnnMzndOX8YNbCu6Ues3xZq+GcyjLPil/lG1ylQyQcUunQ5vUscR7pCkndc9hZHNbmiGz3NQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gT11OAU3; arc=none smtp.client-ip=209.85.167.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gT11OAU3"
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-495c49f8eccso2313338b6e.3
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 11:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789239595; x=1789844395; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=m0hkFL/zZs+ga9gIE1b00ZBTTiY2auR/sNm0zFmpqW8=;
        b=gT11OAU3g0F4I6b0hBH48880CH9HvugutKIxYDKPRy7TdUII16F6pBPHpAyU447iw0
         J9r8+tnNb0xJlD0rf20WKlVjORVZUYPl6cC1vfnJQPAscqYiMjMtpoHPgTn6Ca7bBJ9r
         0qsGd8ewvpAClNXRIb+FIwK4w6NAXv8gMv/sKSrDS00mJ8mmnB/52JM1NAreq8tx+Zvd
         x2smqwqG+Aa9K9zV4zvzLBP0HIPySaA8V+MVkek5rlBCHeUu1GsewJbDaXli5AIkZNqp
         NXyQksM/9xAQmLBMuyDsJFZiOMcCS4O/OeM4E/sCZ5K1Ya1yUy3lJYYhxUmD7mn95ikq
         lwyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789239595; x=1789844395;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m0hkFL/zZs+ga9gIE1b00ZBTTiY2auR/sNm0zFmpqW8=;
        b=KGQJL/wZuuf/Uy5rQJXqKVsSS/gwd18M656BTaCBQOX4VM+DZxzjjRCAMJb3raT63e
         vx6+bB3ry9YmdmhYqkg837+vZlf8I0KnP+UgIuy9/jTEjxc73LtdPbGM/fZsD9kVIVny
         U7ADXHpfmiNLziTRSoDtC5LgZjKMSAd1fYy3QfkQD36bhS9IJv3WcrVQXxQmd98SXeRU
         gTP///ZlzpNjVcnM0eFNnCuA2ZzBMB4QqSuVhpkDneEUl5BHP1vFzAaKFoFm+xSL5Sbu
         Ef6xM6mdKY0IQoGpwg3XO+cswtisgGw329DbXW+TVG6IiYw93KvLGoHBnZKZTMmX0VGJ
         GNDA==
X-Forwarded-Encrypted: i=1; AKwUvBwVZKSY65HoMTAItlP/EBhLm77JgfE7XFpASR0x08EdUybUig/ARlIXgNG9xuLmLzp6QGJhWNO+l8afZ2s=@vger.kernel.org
X-Gm-Message-State: AFuF++nF62aBmYm+fLvPeiqtk2w7AIMpJRVLV0U3UbZljsR5mv8yzAxd
	795AdkJvNhJrDGGdlC/68dpVnCQSVCIHTvPJDHsvGDEvxclo/BBifCbQ
X-Gm-Gg: AYBFou3F8T11GZMgBpYSPgNpFC0dGwbh/5QcupzqZC2zxrpTiGmPoSDWULy/kvdVCSX
	sIKo57plZSUH1F6ec3mE5KoiBN3CvpA+yRSrzZiAmrujTZK9KzHgvolu1N/tVASuxYs+BMehKpQ
	lGZMcaxcYjMdoAlEHswbc6wG+wwijQnCxNF/JOnAsSIaEN8w9ifPm61m1lJ9xjRJFub1IYg2RKf
	wPBAnQdhIbZzFZdNlvks1ROM/peRG8Wquvg9VkwChh6zWqmXQ9QKUd0ZR5RxmmOo4q9DLV4JTrO
	T810AHg39IKUgxKZgGz2i2UJ/Z0q8izzqFI07FkfuR6xWYsFPcmSrOnk+G7zhJe5MWSEm8pivqL
	CZ6qEKQPFmmASlGBcXdQkCqg5LB8eY0vomE/OO7O5Fb/8cqLOgfQ9pcec4secDFXORA7dV6AvnB
	cVf0L/UK1A4AyjGhN4cgOF0PUd32lKGc6Re32aZjfLhTHuO0rTb2q6UMYlM4VEfg/O8bXgkiB0I
	3TwehcZWovRNZgKjF1STPmr5xTlUP2wv0qXWMFpVBCXGcoHPX9r/zwkeIw9wGr9sQ==
X-Received: by 2002:a05:6820:3393:20b0:6b7:83c5:fde9 with SMTP id 006d021491bc7-6c0bb1f316emr5155273eaf.42.1789239594641;
        Sat, 12 Sep 2026 11:59:54 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:41::])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6c342ec1ff5sm1030996eaf.14.2026.09.12.11.59.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 12 Sep 2026 11:59:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 12 Sep 2026 11:59:51 -0700
Message-Id: <DLDKI0ZXYI7H.1XQZZE2RCU7IF@gmail.com>
Cc: <martin.lau@linux.dev>, <song@kernel.org>, <yonghong.song@linux.dev>,
 <jolsa@kernel.org>, <emil@etsalapatis.com>, <ihor.solodrai@linux.dev>,
 <john.fastabend@gmail.com>, <shuah@kernel.org>, <bpf@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH bpf-next v2 03/13] bpf: track low-32 scalar equality
 across zero-extending movs
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Vineet Gupta" <vineet.gupta@linux.dev>, <ast@kernel.org>,
 <daniel@iogearbox.net>, <andrii@kernel.org>, <eddyz87@gmail.com>,
 <memxor@gmail.com>
X-Mailer: aerc
References: <20260910164635.459558-1-vineet.gupta@linux.dev>
 <20260910164635.459558-4-vineet.gupta@linux.dev>
In-Reply-To: <20260910164635.459558-4-vineet.gupta@linux.dev>

On Thu Sep 10, 2026 at 9:46 AM PDT, Vineet Gupta wrote:
> Linked-scalar equality is full-64-bit only. A 32-bit mov from a source
> with unknown high bits therefore has to drop the relationship, and a late=
r
> narrowing of the source never reaches the destination:
>
>   r6 =3D ...              /* full 64-bit unknown */
>   w7 =3D w6               /* 32-bit zero-extending mov */
>   if w6 !=3D 0 goto ...   /* not taken: r6's low 32 bits are 0 */
>   if w7 =3D=3D 0 goto ...   /* not deduced today */
>
> Record a low-32-only link instead: dst shares src's low 32 bits and its
> high half is zero. On a later narrowing, sync_linked_regs() rebuilds such
> a register from the base rather than copying it, by re-applying the same
> zext_32_to_64() the mov used. The reverse direction is skipped: a ->subre=
g
> base knows nothing about a full register's high half.

at the first glance SUBREG_ZEXT is exactly the same as ADD_CONST32 delta =
=3D=3D 0.
no?
Both are unidirectional:
w6->id =3D=3D 1
w7->id =3D=3D 1, add_const =3D=3D 32, delta =3D=3D 0

will zero extend w7.

This new SUBREG_ZEXT will do the same.
What am I missing?

