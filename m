Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794622766;
	b=ZEg72sm/mI91Hc+kc9CfEIO9vE10sJDb5FYfw/RsnSKwfPlN0T3UpjKvx+OCzxOxWWyB
	 ITuq3XGAsdlw4YKcOWA8J7VoUMc9QDoTnZIEOZuMvxoWTWyYn617PO5snFE7VTv69O3LX
	 A8e4hTClZQSlO10mMMLkEJojoLW3blGmrjgVtDSy2JwbDHBGiSwpthhwNTUimNNOUBckA
	 YEZeU53gSAW8E6ICt4v9n6FBVG11eChfH0Kqj9st14gpNDrmFu0oTLCm7GVufdg3B4vaE
	 pYZ3a+TQL+Pc/9kdkjUYeKDvwKaRLvANLu4O/OcKj3cSEFY1huyQPZJUnfZ0cAYe/+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794622766;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=xFEobrAf6WirewKCvSBOHq5k7Hbpzktec7ALKOJWs3s=;
	b=RXDttsRjba4INGaxeBPMlIHJLNCv9UY4eIe8+TL7vu8zysm7KI/ds42t6YJlQeSnC5uS
	 Us3xqCypOVFcI+jwZmc4D63q+Ee1ZMqSvzzUr34JaM5a34xq43+55HJsR9KLtnpZ8sEkq
	 GpYWtqOFn+1qk8BCQ/VZ3kCg9OrRYZ1oGWsmfVM+Mkb7ZohH2F21dlEKv2J2UXZUIqSqa
	 ySUSZxdRqM8XPpYp2w46QTMe+cIuO95Fqrop1FdSmlptRc4t/Dlny2MDHlbiNpVH0QR/n
	 Zy2QJWbiCuvid3IDLTyopiwwq6NdOKmSpIZbZbWjVhAgZtkX8eTXKx9TnBYvWJcRPHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b="cWPtPf/I";
	arc=none smtp.remote-ip=209.85.208.48
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D08F2606A32D
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 02:19:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D08F2606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=cWPtPf/I
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6b408f2d936so2831632a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:19:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1794622763; x=1795227563; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xFEobrAf6WirewKCvSBOHq5k7Hbpzktec7ALKOJWs3s=;
        b=cWPtPf/IODKmFPRI2t9QaVMTi/lF1zEM1BXVjQdNGEUECeW/7ZbU2dCRlzqw/yQfIm
         tA5OCKXWOV06DZWiL6CpXThiUk63HoPwKqnhUeZTB2N3rU9/TcXhW2pfJBze01zFeaFE
         ZYOadCsKXaMk621tpcg22e2Mh4h8tnJ9MmX7k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794622763; x=1795227563;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xFEobrAf6WirewKCvSBOHq5k7Hbpzktec7ALKOJWs3s=;
        b=sWb9BK9zenXlL8646iqAfY+kKOd1iyQhMIVdvv2yKnfSDVjq4ve8bHZrPn5jjUxVC1
         8Tqlyct+iArb1DgG/vvkk147rf5bmOf4ZRTYQRDyy9bzposi9c9oL1YdB0Vvkx971WW9
         7/XAHVInFNCfA0q8HJ7+o/3eY8aepvZJLeLFstPgg6UF2a2itlJFWlN17ipbRZ4OEQGX
         eKuJYcagWPEEcmfgVfZXW3LnXwp2qkTQBrfVWHFXvNKmDK0cR/nE3fMt+mA8d9/G4bX1
         Xm3YIcJxE2sFYwtvFdxsloQ9J7K7Xq9QkDQpv9yBtXWaiVGjaYGli1JYLkem3f6JuLXQ
         yBPQ==
X-Forwarded-Encrypted: i=1; AL+hErFgZ8arrhdNki0wxL1VJG8D/8wlo10n+jJalAMjBI4OSFswxUIULhFEuLmrsm36OLW9GTzpqO/CfUU+T9o=@vger.kernel.org
X-Gm-Message-State: APuU4Z8FK+xGJb3pFX0gpyz6eCkcDjGF349wxuGra1z03mIA6mc/WXxw
	RC8b8v8/BWnl/fzW4++qwgnL97cAFd0h8uNaypxsmjlOxSA41juTDiEwEl/AUAUE+sLZCUPGwfw
	gh3PSPCFGDg==
X-Gm-Gg: AYBFou0Q5WXq4A9GeKOzD0R/80D9510tvJEfaqFoYKQzhfyyb5HD8sKx35A9bX16VUu
	EK4PNTGG4g774cFzIq72TCezPY80fbQX7NCxuVcRy36sKYSHwmuWAZjBuWNL2waki8WCmeuVso/
	cSjvYaBrPyP99JNev8H17xIgSDGUIRYDROelerWElME9BJWvmupZrMpWoszSK03DXMvCYpLi2wx
	5qXypFkhQXhkaCwXt7c3sMkvbXeaZ7yKcN9GpbG1Lg50O/VnQJcnfvNHDNdKZx3dpF9tgVF83HH
	uEpStmKZ7cTwjUzpPmSwXUyg7SV4rEySjyWn9GHh0qeY1zmZgasgMl2R+75voFhgEENcrQDbavc
	LFzWbgAuO2fgqSL2OxIcDNJcaqtlFbG9RF04MQSrvSKGkjRWLoVd7wBU20HZgt28XVJabSscy6J
	g/wyzu0ta1M9BRrML+9oiEYKMmNdw2J25C3EZHU3/J+8zrNDMnm7kkTrK8+b40qeVj9MS6a1DFk
	l40I1tR9NuMyf4oiLsWkjObCcNiTBODbnU3zZCvMnAk8EQUX3iIM2P7PilarWjla9EoZgHXcQs8
	PgN+03qiVcokDv4X8uxOWumAqwQI29rA6IwG/h7kWvkW7VEfnYp2+r0IK6SvvaTI2hOD7G2sFhk
	ZJ/4=
X-Received: by 2002:a05:6402:280a:b0:6b7:c8fa:cc31 with SMTP id 4fb4d7f45d1cf-6b7c8facd7cmr2982525a12.27.1794622763086;
        Fri, 13 Nov 2026 18:19:23 -0800 (PST)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com. [209.85.208.45])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c25df671sm1795369a12.32.2026.11.13.18.19.23
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 18:19:23 -0800 (PST)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b408f2d936so2831626a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:19:23 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErE3GZT2FzK6VRqbs5S5fnOW5v2GGCdZZSxVZGdrTzMkWKuk2PwMDuFvSNV26V5rKnTe2gzZ1GeDtrzA0oE=@vger.kernel.org
X-Received: by 2002:a05:6402:2b87:b0:6b5:8695:f839 with SMTP id
 4fb4d7f45d1cf-6b7c0d24fdfmr3606529a12.45.1794622762852; Fri, 13 Nov 2026
 18:19:22 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAHk-=wiE0KG+jkhmJWifXuAVivtB63WCWtdEpGAex7-T0SHd2g@mail.gmail.com>
 <aurAxRpCwzeyXeVj@gondor.apana.org.au> <CAHk-=wgPvbYRcKpQ8WTH-EYZRgMG0KSH+cZxY5-Hyf+X7JjWsw@mail.gmail.com>
 <aurJZ81qnbiHH_P1@gondor.apana.org.au> <ausS3LQNkdc6lBy3@milan>
 <auxDm_YO4oACA_d2@gondor.apana.org.au> <CAHk-=whXvVO6a5AreZu3LPBj_wjpzUanwhvu8WqWP2q7g5S7Vw@mail.gmail.com>
 <auy-7TvVzJ-VCrG4@milan> <avcKfEvln8_2a7fJ@gondor.apana.org.au>
 <CAHk-=wg9baZ9EDhZr7ONxjuO65+vvWFo5E2hgxt+3rYo1vnhyA@mail.gmail.com> <aves3p5vrqqAuHma@gondor.apana.org.au>
In-Reply-To: <aves3p5vrqqAuHma@gondor.apana.org.au>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 13 Nov 2026 18:19:06 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjhtBnAz6YniHqcVJDCDvVVNp_UUL3QbiYyS6u+yKcNgQ@mail.gmail.com>
X-Gm-Features: AclHuK9T8qB_5bmjhcK4UnFzb5yfP0GrEfjJOo4l7azLABG4Kermbip3IVeKi4Q
Message-ID: <CAHk-=wjhtBnAz6YniHqcVJDCDvVVNp_UUL3QbiYyS6u+yKcNgQ@mail.gmail.com>
Subject: Re: [PATCH] mm: kvmalloc: Bail if called with soft or hard IRQs disabled
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Uladzislau Rezki <urezki@gmail.com>, "Liam R. Howlett (Google)" <liam@infradead.org>, 
	Davidlohr Bueso <dave@stgolabs.net>, Michal Hocko <mhocko@suse.com>, Baoquan He <baoquan.he@linux.dev>, 
	Alexander Potapenko <glider@google.com>, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
	Marco Elver <elver@google.com>, Michal Hocko <mhocko@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Thomas Graf <tgraf@suug.ch>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, maple-tree@lists.infradead.org, 
	Lorenzo Stoakes <ljs@kernel.org>, Chris Mason <mason@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Andrew Ballance <andrewjballance@gmail.com>, stable@vger.kernel.org, 
	"David Hildenbrand (Arm)" <david@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 13 Nov 2026 at 16:35, Herbert Xu <herbert@gondor.apana.org.au> wrote:
>
> That would make sense for direct vmalloc calls.  But this is
> kvmalloc, which is supposed to choose automatically between
> kmalloc and vmalloc.

Yes. But that cl;early caused problems, and then people seemed to
start thinking that it meant that the vmalloc side should also work
with GFP_ATOMIC.

If you are in atomic context, then kvmalloc() makes no sense, since
the vmalloc makes no sense. You should use kmalloc.

          Linus
