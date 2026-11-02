Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793636418;
	b=No7Of6NLwXnHfmaMX76v1aCkv8/THX5Cvo/KOJWt10Yn3z8FhVeeqMTZRlXxfbNzz9Gg
	 w54Py5VE6qSba41IqPQ22CqWxrKeu5nqrKNoHayxXJkO+poPAwufXCukWp2HaEuRt0JJm
	 23KFrV9P4p68K0B3RAFsg84umgEsNwg/qhGdDejn0CbCl6KDmS8VCc4YFMS3OlZUAKoXa
	 4LKcdO1n2JRE7Sy7IkVwmRaxkZxXb/iCjYq/l53rJrq2adFipoQTkCQ5tVdkqPVZlmPO6
	 KituyLuoaNtlYCIvwGFJW4eVhbgU8TjXc22Kk/Q6Tcp3vqWY5msXqypISnxXZrtOWjQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793636418;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=QnY7OohDI6Xd9ZoeABmlC8B9GNptg8MziyLV8aKueh0=;
	b=vJ8UgtvlndrB590mhfzpFIK2LlR6GMp/luCiqN63UYcMphLxXRtWAQoY+oTgTRTkGzTa
	 ydETJeG7nqKcKPnWsD+0whlrEcBG03Xyechmyg2CTt41dTlEqE+BWoxbsumRTvMGDWEIO
	 ccHhGZ4TBpJaXk16vaSWK1WLkYBi6dkIXx8TvpfNYlpyddew2PBm5NdnXUSy/dmRJaM/t
	 fRlZEYKy3y5MmfryCrdPwEtwlffjmdOWlmwUfvfot7WEA0jbaJ++Yy+5xN7RT8WELdj++
	 ZUpdz8XxV5Ayahjq+3iz3c5Df5Sen9gYxtu9Qu1O6d51we3NAnQQvbXVDc1sdac1cVQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="js/6GMxx";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B9B1606AB85
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 16:20:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B9B1606AB85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=js/6GMxx
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c4cac7a7d3cso381337566b.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 08:20:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793636417; cv=none;
        d=google.com; s=arc-20260327;
        b=KdIHqkL6rScONYWdTe5LUJQMvBiNu58a5QgnW2rvdKiaocVxn8qI7Wxu0DuHr7LTmL
         VohfZtcKHYn8hPwjNJVUrNphJ8P1dDAYLAVJ95pC62w+gYZCMjRQWZZjtlDHT1MVfElm
         RyULeZCZ122LHV7YODh0y2bVwRlEDTkVOc/sDBw9sJkCdpGV1MT2wCoXVcHQ4MsKu07a
         6M0vmVdUIXeH22/FL5XV2GHlL6HBINprWSex0t7/++ByIkYRwVzPnjUmlwHiy3kGFSil
         8WXciLLgq7HMb4ZakaC3EK3eNloE6p+N3Wkjsd5iKDO+0ehmvtIT203BuT8uh61jOPH1
         dcJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QnY7OohDI6Xd9ZoeABmlC8B9GNptg8MziyLV8aKueh0=;
        fh=ud3NyoIo1dWz6jZv3HWH5LXWYRbl3f6ry+dUOzMoY5g=;
        b=QzohulNraCdqsm2G7yVMOA+gRbuIGuJuSnBgwqjkRP+72p0SZCcEIaH42qnxy++f9b
         CMU0mkpSYwM3SekIJCYgRoBCBBBEF9tp2R3GSjAV1cvdUqIedLJ9AtIMkIlqA93DC15i
         bV72YXo1YcAs+6On70ztQ5SSWXm+DQk1BChzel+YvlbBq0c1MSW5nrur0OI++kmxpSnA
         s6JpKMg0jMobUL2cxlV/eT7PFrrRau6NbxEa8YeO+vEE3FawgZY80hV9i7BkK2iYTD39
         vw+OGPRW2aq3EaNZtqIjFhkkVFu5RAN1jGqjd3JYLHm0B83XuQlcuR+rANWZ5k3gOMv0
         vSzA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793636417; x=1794241217; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QnY7OohDI6Xd9ZoeABmlC8B9GNptg8MziyLV8aKueh0=;
        b=js/6GMxx0yn/y3wL/QTnvi4VCAwvoKUXmBoSzf/kfGd5FdCn+8OMrYGv/IbMD7baMl
         gV1we5RAl8QQcS0epixmsotdF33xb01r0HVzVKxhvq5LvEasMf6XACPkrQHxECUmny4g
         DPOsnFM7sgPXH0h9uZqRNHTP494vB3oh4RmyQ8oDZ8Ce65EwL+5YNpnyR6G6nCWST8Au
         OEWF0HkeNItxmq57v/XdL7M7Xivu9eObegtSg1GcSzg8VTLiFFB2LQGo5Z8p8P78g+6T
         OyaLtZjt857zSKCjGR15D+sirSsopbMGkL0CoEGena569ODIFjWnrVv54dKvcorWf8xh
         SVlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793636417; x=1794241217;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QnY7OohDI6Xd9ZoeABmlC8B9GNptg8MziyLV8aKueh0=;
        b=rUsIfgtob7nLboyHZsNK1UKF6KspKNqJPYi4dY1EyIWXRJkvbHqkH0jhicrJ9JvkfJ
         E80U1ROcJDYkf9iU9qQjiFghfLMxI4YYG99xlXEecHw0pjjqVIC2fcQvtaMzt3p5tvMq
         5r/+vXjgDpMD5kNC/vYOSKbcieBcrof9mdApLvj6/G6D9YP5Jby5o/YhAVl1xvXUclcZ
         j3PjSj9BYI6G1AtbTnhDu3Q3U6DNwio3FjnV8iAck6JIYfsYr82s6ZF9U/VGnntIz4mZ
         q0gVRYz3DpSmRfyjrBXy/8YbYjOmRymTwKuQFh6z7xz4Kky3dWZQBxKGE6mi3jJISm8o
         vE+g==
X-Forwarded-Encrypted: i=1; AKwUvBwnWL1YWdAofvHKPdgM6q7AsiInGl4hsGNSjwK/O+xtkYvGgxRHsq9NlPtLP4SgTI7pGkAiJM0u2Sz10XA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/dsNPg4pwvxEsxYrIjzK+gpOy8Gu/MmP0zyEZsqn4g6Mqq1XQb
	dtBjX6cjaDn48m86AjsMjbjdcJ8HoSmJDQrElLfYN5IYiU009HYsDo+BmlKjZNzFGLRSUhKPbfd
	s0HDm52z/psAjIcj2DxaEmw9F48mBqHU=
X-Gm-Gg: AYBFou3YyLqJjosnExrJzWe/0P51Uu0SCcNNisDCzEXfrasNjEUT+YLDzwXS2i/9Try
	JlWBlwlD5I4x1niigILQapguvKBapQEgw1r57AjzeRWviSTUKxXYKIyFYshsN1wgk9Uz5xcD/Mh
	nvrssJDHZJl5RN35ppqZ2TCGWcHnI+x/GUDpmQ49y5bYc2E9TosKSCAUU8fzcLaHoA84+RiXQHA
	CR6jSOfH+889bmq3zOQu8iTTABdOL+RgHf0YtwKfdXzf7VzF7ynpYzH16POLk2Njb0gj1HIATvv
	iCLqG1YunJFB/Dt/+Jz8YcfrvoE2BYtkRbETMv/kVDSyuk7M97JkYxDuE/NF41aEZ7TPk54XdxK
	AqlIOjo1f9TblhNMz6x6V5OVKjgVNiZvzfKQrWGsamqznIE8EKIpFk/b5z/SB9ybL4wKNlw==
X-Received: by 2002:a17:907:1611:b0:c46:8c2b:8f7e with SMTP id
 a640c23a62f3a-c4ca73f3c48mr811452966b.0.1793636416788; Mon, 02 Nov 2026
 08:20:16 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261022145615.2184343-1-alex@ghiti.fr> <CAMgjq7AB4wUzmugV3n4mhWcYqMKmhoZJCDV2uUagFjZXjUUi3A@mail.gmail.com>
 <CAEmasaXz2GGoy4dyhbo9Em95Cnz6QL3u2fcnAa2=8pJOOJyH8g@mail.gmail.com>
 <CAMgjq7BjOeboPMP64PfGDoY4yMGq0xR4E4Wa66U0+gsd2tnu+g@mail.gmail.com> <CAEmasaV0D3ezZyWf0k_84qXOa1c5KyUjvX9Jez+RXMDPM7FdBQ@mail.gmail.com>
In-Reply-To: <CAEmasaV0D3ezZyWf0k_84qXOa1c5KyUjvX9Jez+RXMDPM7FdBQ@mail.gmail.com>
From: Kairui Song <ryncsn@gmail.com>
Date: Tue, 3 Nov 2026 00:19:39 +0800
X-Gm-Features: AclHuK9HyATHKuvexqnNhF4HVqiEeBaBb9rsGxy0GEXJeq9AC8rntCtucEkHl44
Message-ID: <CAMgjq7BFbXEKEt9faj_rg5AStfLkpJ0j57EQOOJ+L3-w2xRvtg@mail.gmail.com>
Subject: Re: [RFC PATCH 0/1] mm/swap: keep reclaim batches contiguous on swap
To: Alexandre Ghiti <alexghiti@meta.com>
Cc: Nhat Pham <nphamcs@gmail.com>, Alexandre Ghiti <alex@ghiti.fr>, 
	Andrew Morton <akpm@linux-foundation.org>, Barry Song <baohua@kernel.org>, 
	Chris Li <chrisl@kernel.org>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Baoquan He <baoquan.he@linux.dev>, Youngjun Park <youngjun.park@lge.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, Hugh Dickins <hughd@google.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, David Hildenbrand <david@kernel.org>, 
	Michal Hocko <mhocko@kernel.org>, Qi Zheng <qi.zheng@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Lorenzo Stoakes <ljs@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 5:42=E2=80=AFPM Alexandre Ghiti <alexghiti@meta.com>=
 wrote:
>
> Hi Kairui,
>
> Back from holidays, sorry for the late answer.

Hello, hope you had a great holiday :D

> On Mon, Oct 26, 2026 at 2:38=E2=80=AFPM Kairui Song <ryncsn@gmail.com> wr=
ote:
> >
> > >
> > On Fri, Oct 23, 2026 at 12:17=E2=80=AFAM Alexandre Ghiti <alexghiti@met=
a.com> wrote:
> > >
> > > Hi Kairui,
> > >
> > > On Thu, Oct 22, 2026 at 5:27=E2=80=AFPM Kairui Song <ryncsn@gmail.com=
> wrote:
> > > > Perhaps we should instead always scan the full clusters and revert
> > > > that one commit? That commit was only following the idea of keeping
> > > > the allocation more compacted for that series, it looked good at th=
at
> > > > time. Since fragmentation issues can be solved in other ways,
> > > > contiguity seems to matter more for large physical swap devices.
> > > >
> > > Oh, okay. I thought reverting it wasn't an option given the good
> > > numbers the patch provides.
> >
> > That patch is 1/3 of a series, that series yields really nice
> > results, but that one patch plays only a small part in them. Or
> > perhaps we can limit that to SYNC devices?
>
> I'm a bit scared it would not help zswap with writeback on, unless you
> mean actual SWP_SYNCHRONOUS_IO devices?

I mean maybe we can just scan nonfull first for SWP_SYNCHRONOUS_IO
devices? These devices are less sensitive to discretely distributed
I/O. For other devices we then prefer to keep the IO pattern
continuous by using free clusters first.

That may just fix the issue you are facing?

Or maybe some threshold or quick scan in partial_free_cluster before
putting the cluster back to nonfull.?
