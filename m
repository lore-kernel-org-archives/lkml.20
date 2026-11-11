Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794380347;
	b=HQm1ONYsVJE26VaVfg6zoC/Y7rGvdg00M1EXwgekVDhp1CBrag7Dm+mmhWs3vNeiihyr
	 oke6G5DnTDn8L4I+vL7dqV231NhB9znhrzKxfFf8gZYSAGce85lHJgsehh8zdUm3ppCWy
	 8QdfVWsMq9JA9iBKVkTbHTtywRi27ix7MZk/wND6eVAVw2RaEF+0NCAnNot7647p77GJN
	 HJHB0g6O+wF9huVKcqTnKvuSmu+6BrQSol0xoeDz3zlNxk7k3qMfKk1MgzXPM3aP3hSyi
	 shTOaJfwXDUZ5SttU7j9UZtf/5GmFvU8el1XcUkmdpFXYXCumNxxMWPQtS92gAKgEOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794380347;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=d5je2bEgTZvwiQ37Wn5zgMuS1lbCKpVuZ2yXV8m2vQY=;
	b=thNJWU1A/d+5rv26ed4EFRdS8tuRgyACzvcOuZuecA6jvkxs2qQDdzSIc+v0Z4JYpoPv
	 ++z+8tdpXrAKkAuriwFAFMqxl6OkxoEIMk29sExFQyXLf8UeXzTl9DJFehRXZ6Xw/xzAh
	 /gOp1Osu/gfRjHMA9WmT5By9opU2+blBHrn0Dqcvu+TxKvf/Bkj3zd091pG+kh1i0xtFS
	 JsZfTpWqGWzojNgfARgsuoFH6AQaQXCy58zBuVCWsrR381IcdIts9v51uypTTyg2bx1JO
	 xy54B8X7w+qf3W83CGyzPd/I+OBromYcDR1Ycz5qd8Nk2z+5t1WZYN++zv+daOo7hPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gCJyviTC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8889606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 06:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gCJyviTC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 759F01F00A11
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 06:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794380346;
	bh=d5je2bEgTZvwiQ37Wn5zgMuS1lbCKpVuZ2yXV8m2vQY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=gCJyviTC/VTOgz2yPFdeRpM4uAhPwK6qDHnBWB3JpDyphxbOvxsICM/lSvmpge0Sh
	 H6If95ud7CDLiL+n+q7jgRc+QuucaTlErcyn6HAupNn994d7JMHq5UnmEy+2DJOwDG
	 fCOMH+qkUnNylCvEVSh/DJcRDTsnoMbTm4ZOh8+r6q+lSOr5JIK2ZiWSoLwvFC/whV
	 XAP+SUK7b/eLJZOcd3r9cieudWFD+EBxRPdXJ1db4g5MZkAo7e+5D4hhgfqofV0Ude
	 Op8BVW8tm4fdR0YGHosZ31IeKuWsRHXHXDWm2KTWKYVBphuycvSOwSLFuIMau00FK7
	 rHu5QJHwpf25Q==
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-93f3c89594cso221601485a.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 22:59:06 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGnrrscKEPcahbfhIVzWybrNB+o72nsgrwlmt2/UUbfMOH07ng4k7LXsSxgm88j/ohfHtxZU369vlEPOgA=@vger.kernel.org
X-Gm-Message-State: APuU4Z91TS/OecFMyqD5jGcymfOU1D2LoWCy37q63xXTmfrTCqTvt+Ox
	a3DPm+gpEwXTe2buF5nskYU8YMuGH33j4lecrbML3Msp7kLik+KJ3UB7fHx37o4g21JHLNsWJmg
	3sFtfq/C9tPYBgMxv4QkeCTZX4Y+h8m4=
X-Received: by 2002:a05:620a:4629:b0:93e:c12c:9dd2 with SMTP id
 af79cd13be357-947b000dc62mr213935485a.82.1794380345632; Tue, 10 Nov 2026
 22:59:05 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109-maintainers_mglru-v1-0-c25e6de60bcc@kernel.org>
 <20261109-maintainers_mglru-v1-1-c25e6de60bcc@kernel.org> <avLpQhAv8MkaOevD@gremlin>
In-Reply-To: <avLpQhAv8MkaOevD@gremlin>
From: Barry Song <baohua@kernel.org>
Date: Wed, 11 Nov 2026 14:58:54 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4ymA_i+qSoqZ2xa9qgchCcnVU-VZ3Z6V6p-CW5gGDjjbw@mail.gmail.com>
X-Gm-Features: AclHuK_Df4TZaTzk-KvkOfj-hWhsUHF44BTooaU_w5shDLMRNry7F7E-IqGnu4Y
Message-ID: <CAGsJ_4ymA_i+qSoqZ2xa9qgchCcnVU-VZ3Z6V6p-CW5gGDjjbw@mail.gmail.com>
Subject: Re: [PATCH 1/2] MAINTAINERS: MEMORY MANAGEMENT - MGLRU (MULTI-GEN
 LRU) update
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Kairui Song <kasong@tencent.com>, Qi Zheng <qi.zheng@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, 
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, 
	Baoquan He <baoquan.he@linux.dev>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>, 
	Muchun Song <muchun.song@linux.dev>, Lance Yang <lance.yang@linux.dev>, 
	Ridong Chen <ridong.chen@linux.dev>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 5:53=E2=80=AFPM Lorenzo Stoakes (ARM) <ljs@kernel.o=
rg> wrote:
>
> On Mon, Nov 09, 2026 at 07:31:53PM +0100, David Hildenbrand (Arm) wrote:
> > MGLRU is currently the only MM component without a dedicated component
> > maintainer. Fortunately, Kairui and Barry have been actively
> > contributing to MGLRU and have volunteered to take on more responsibili=
ty
> > by officially taking care of it.
> >
> > Given that Kairui is already an established MM component maintainer in
> > a related MM component (SWAP), add him as an MGLRU maintainer right awa=
y.
> >
> > For Barry, the idea is to transition him towards a component maintainer
> > role over the coming months, starting by moving him to the top of the
> > reviewer list.
> >
> > Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
>
> Acked-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
>
> Congrats Kairui and Barry! :)
>
> I am so glad to see the proactive efforts people have made to get MGLRU m=
oving
> forwards again, it's a real success story in mm.
>
> Thanks to everybody for their efforts in making this happen! :)

Thanks very much for your kind words, Lorenzo!

Given your earlier involvement with MGLRU, it's great
to see it continuing to move forward!

Thanks,
Barry
