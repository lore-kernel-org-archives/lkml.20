Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FC074A2A5D
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 21:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789594482; cv=none; b=M+0+Z6CLTdiTg6MAyn9NdE2ecv90lcAMH+Y2jPG8xOyh2VmAsAde/TA0TVysBNL6tbS3BwpK6Ib1Re19dBVpNQUkkeyyBpewRrzvPbagYVAqzas8Jk7vZF5H3AAywrLiB0brA1Sc8WsuJkbzMvR0At/v/4EXV+dNEHkc5hweOQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789594482; c=relaxed/simple;
	bh=vZHwbu018oziF0YzB8Dbq35UuDzuxoPLASxubSP1C4U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EuA4dxDtA5weusirmrHm59V3kR90Ehjc189v5PrvEySZnei75Lhl43rjwaUjYHR0+WhPwTWsxR9GxFHcIryGRN76fLL8rMt1DbaO7IyFJBU+BbszWM5MBqNFo+i0XRxSocz2TN6iGL+p3WZiLQySZAHqCZAYrEj373ryshuPtYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YnViTkjq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YnViTkjq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CE2F1F008A5
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 21:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789594467;
	bh=vZHwbu018oziF0YzB8Dbq35UuDzuxoPLASxubSP1C4U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=YnViTkjqjY2tdIpaDUXdUNmiEKWVN7tDIwtoA47ULo6c1zBON5U9i9XryxY4Wk4TI
	 oPlXK13wF+5QrpWoGZVW3PU9C4j/4/dLl6HXJquqUklrLRpXvCsGTsO9hxTGeQpS86
	 oKKTlJ05ArKPO8r2to0x3Kmc2v7+XU+mB4Wy6LPmuM0Im1oCbxNjLI2MsOtS7kvFaD
	 cPBmsUk4rhAbukEK6Os8Lg0YeAINRFFYxi8BpUmPzGhMWSQ2mzdMM9yhWjV99+ACj6
	 /3a7P8VUrFymUFg2F+33txnN3e6YaVHvUJYfnMZZ1JWR3Cb4QEWVAQWvjfuNXF5Jpm
	 nZjZo4bf8CtcA==
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-52fb769ca02so1049671cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 14:34:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwTGSQlUmoh49Xf8IfAdu/EWcttwcBkyH4uNHoVTjZf7+C1LVkOvlvA+f2K/EtL+/cBhyE/Zr79t/yTA7A=@vger.kernel.org
X-Gm-Message-State: AFuF++lvjKWKV1GCfU93QsSdvOAWu4BVDTyJXmlsMaBNsI1ex3rXgPQp
	XtxKoF0w1hEubn8nXTLRh3bAIZ4L7p4lYLpPEg6SE6f4TdObFJF3UjuMA9xlhBrRfpisXbses9W
	y1Dvz7pCSJmNgQyK8xZ41Y7zqvu7pghQ=
X-Received: by 2002:a05:622a:1a94:b0:517:5b2c:6aae with SMTP id
 d75a77b69052e-5327edfb4c5mr88841271cf.13.1789594466802; Wed, 16 Sep 2026
 14:34:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916123846.1242548-1-ridong.chen@linux.dev> <CAGsJ_4zwP3_+EYY5Ug9EJ+yD1UdxsBSGr25u8s1K3u_i7LH3Zg@mail.gmail.com>
In-Reply-To: <CAGsJ_4zwP3_+EYY5Ug9EJ+yD1UdxsBSGr25u8s1K3u_i7LH3Zg@mail.gmail.com>
From: Barry Song <baohua@kernel.org>
Date: Thu, 17 Sep 2026 05:34:15 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4zQcj-EdqK_j5uuMQxWZzac5a9akz+jmcJ8ewPRJH6MnQ@mail.gmail.com>
X-Gm-Features: AcwNN1UtLY7oHGpUa0GVuFEMOd8HB5GEXBkaH1H60YU1bEVxMibMdR9fZ4kb6WE
Message-ID: <CAGsJ_4zQcj-EdqK_j5uuMQxWZzac5a9akz+jmcJ8ewPRJH6MnQ@mail.gmail.com>
Subject: Re: [PATCH mm-new v9] mm: vmscan: retry folios written back while
 isolated for traditional LRU
To: Ridong Chen <ridong.chen@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Kairui Song <kasong@tencent.com>, Qi Zheng <qi.zheng@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, 
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, 
	Baoquan He <baoquan.he@linux.dev>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	David Hildenbrand <david@kernel.org>, Michal Hocko <mhocko@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"open list:MEMORY MANAGEMENT - MGLRU (MULTI-GEN LRU)" <linux-mm@kvack.org>, linux-kernel@vger.kernel.org, 
	Ridong Chen <chenridong@xiaomi.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2026 at 5:25=E2=80=AFAM Barry Song <baohua@kernel.org> wrot=
e:
[...]
> I don't like the way you describe the problem as "wasted" swap.
>
> The real problem is that those folios skipped
> `folio_rotate_reclaimable()`, so they were added back to the head
> instead of the tail, where rotation could have moved them to the tail.
> This resulted in a cold/hot inversion.
>
> The swap entries they are using now will eventually be released when
> we scan those folios again and reach the head of the list, so this is
> not actually wasted swap space. You are probably right, on the other
> hand, that if those head folios hold swap entries and the swap is
> full, this could prevent the reclamation of folios at the tail, making
> it even harder for us to reach the head.
>
> >
> > This issue should be fixed in the same way as mglru. Therefore, the com=
mon
> > logic was extracted to the 'find_folios_written_back' function firstly,
> > which is then reused in the 'shrink_inactive_list' function. Finally,
> > retry reclaiming those folios that may have missed the rotation for
> > traditional LRU.
>
> I wouldn't necessarily call it a fix, as keeping the swap cache for
> those folios can sometimes help with future hits. For example, we may
> hit those folios again before they are reclaimed. So it's a
> double-edged sword.
>
> That said, the cold/hot inversion is a real problem that we should
> fix. Ideally, we should find a way to restore the missed
> `folio_rotate_reclaimable()` behavior, conceptually something like:

BTW, maybe we should have another patch to fix `MADV_PAGEOUT`.

Thinking about madv_pageout, we are supposed to reclaim those
folios. But because the swap device is fast, they miss
`folio_rotate_reclaimable()`. As a result, we not only fail to reclaim
the folios, but actually promote the very folios that we are supposed
to reclaim. This seems pretty problematic.

This is probably a common problem shared by both CLRU and MGLRU.

Best Regards
Barry
