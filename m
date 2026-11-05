Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793849643;
	b=Zn/9Krfrdw9WSqfYWwShbr7TJXFFv6p1aYLIzomQkIYTmI53EuLkbAibNv4/q7AAPFjw
	 ogF5J6/pfFCAQGz41FYMjakxOq1o/4ta4Ei0LhWrTvgCwLvXCTvS9176jXO15HDtQwXLm
	 psv/CUjOHlgM2/CJR9Nv1B2EFiy+3JeEjTiCyR5X78F1njw5mCODj85SwlpFjLdWfzETA
	 AN1ThwMzVl0CewqDDetQdb9bS788f7W8tRvBpgIk/mX1pe7mzaNXLyV0K/C2A03gAXQ/o
	 Ly4rYSacbUO/lf8jv0drjd+KDngFuaNdV+ASjPBZ6naB3QW6lnH4ThQXKMwc7ip6fWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793849643;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=l+Yp56smGIs8eBVmZ42TlX/QjRgKCo02jmsCVaG2LHM=;
	b=racZ6SI9/3UvwbCYdzBwNHAObe0u0u2IwPlkvwoeV3XGGsRdIkpylysR35f9uwkaLcoy
	 ZO6myVy6RXHB+sLjcgqm/byQn5dbtfAdSSSHpWv4l07z/tS60sEV/9jJvokmI+vHhUhBl
	 HAWTH5PQoaJaGOtpqajynRJHSSHmlUBVWqlbbt4S1cqK9R8lmFh8GLpLa97TY/dfTho0Q
	 Qb/9CKUk09s2E9GWVsneahZvhsWXQNnfZ1GboBymUxqOCmonnsbJUjUP/bkEqhbSfQ+MC
	 pR/gEGUXqUKLKOrJes4YzSyIsk1Xc0rfeek+ykoFQtCpe4PIvrbyFlj5mTeXbVUdOkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YGjYA7GK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD16A606A329
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 03:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YGjYA7GK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 386B01F00A1A
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 03:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793849642;
	bh=l+Yp56smGIs8eBVmZ42TlX/QjRgKCo02jmsCVaG2LHM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=YGjYA7GK343Pjnrfl3nofa0xcvg8KD1pXJekSNdyyCiTvYVtawW3B5HsQyMsage1F
	 j4Drah6q6VlOF5mqA0cMvykdPH7q2jFJADU1qs4r/jM2c2wVcGsEaOhL6I1NT4r25v
	 yBzXn9kmVUfdGUZMMwIIIWh/2jJPZ7YlCRQ5touqvXt8CASPKZOkADXbUvuBi1p0Xm
	 kVwX0CvQCqnjUwipJd3dRGy/W2npv7BntvX/KM95lwaL0ZMg9D+7JUJbPrtfVAMLsg
	 sBfpQyW4hrdzahpG74ElKjd4UP4l9N09jpRCho70txcS/HaXse5J0hJg4G4jmDAnHS
	 rMVggHotSGVrg==
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-91c7a0c1617so19640246d6.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 19:34:02 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvByCyNxkLEinJRwLE4+mRYekaSGQuDOCFgTA4U1yFkk8tyI5b02phfa4zWMNpFSsVwMPL2zh8HRRGJ+pJMs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Nap6hEYknBdXTZaCcJFnExLKty9aIJqcok0FTe+UffOuA4JUg
	sLFYwqChfpyuNZudZQq5K2OAoPbIPDT+5YO+b52OIAhUGFhhlNay03kR2tkdJHmcGawbv2b8P/M
	5ZdgAANlv2lOm+nQddExCV4h4W6HSjsI=
X-Received: by 2002:a05:620a:3720:b0:93e:fc02:e8d4 with SMTP id
 af79cd13be357-94421630bedmr3380444185a.27.1793849641568; Wed, 04 Nov 2026
 19:34:01 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104130817.849089-1-ridong.chen@linux.dev>
 <20261104130817.849089-8-ridong.chen@linux.dev> <CAGsJ_4y_Ay0mYO3ic72oepjtW6KYf2sKRXEHb3Ff8uwKrOJZjQ@mail.gmail.com>
 <4f830c30-f99c-4f75-851b-1a3f6d1342b1@linux.dev> <auvisj8NeTJ8FunG@MiWiFi-R3L-srv>
In-Reply-To: <auvisj8NeTJ8FunG@MiWiFi-R3L-srv>
From: Barry Song <baohua@kernel.org>
Date: Thu, 5 Nov 2026 11:33:50 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4zVwLMRKOOGycVfnGEjxwy3wO8azyWD4YX6+d7DpAypzQ@mail.gmail.com>
X-Gm-Features: AclHuK95QOPSEjcqkBAiK0QpfFcwI57KNwsmNgJhbn3lT1vePCwCD9VdxFwjbS0
Message-ID: <CAGsJ_4zVwLMRKOOGycVfnGEjxwy3wO8azyWD4YX6+d7DpAypzQ@mail.gmail.com>
Subject: Re: [PATCH v7 7/7] mm/mglru: add tracepoint for aging
To: Baoquan He <baoquan.he@linux.dev>
Cc: Ridong Chen <ridong.chen@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Dave Chinner <david@fromorbit.com>, David Hildenbrand <david@kernel.org>, Michal Hocko <mhocko@kernel.org>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Lorenzo Stoakes <ljs@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Muchun Song <muchun.song@linux.dev>, Kairui Song <kasong@tencent.com>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-trace-kernel@vger.kernel.org, 
	"open list:CONTROL GROUP - MEMORY RESOURCE CONTROLLER (MEMCG)" <cgroups@vger.kernel.org>, 
	"open list:BPF [MISC]:Keyword:(?:b|_)bpf(?:b|_)" <bpf@vger.kernel.org>, Ridong Chen <chenridong@xiaomi.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 9:58=E2=80=AFAM Baoquan He <baoquan.he@linux.dev> wr=
ote:
[...]
> > >
> > > Reviewed-by: Barry Song <baohua@kernel.org>
> >
> > Hi, Barry,
> >
> > Thanks a lot for testing and the Reviewed-by.
> >
> > Updating it would be fine with me, but I'd slightly prefer the current
> > output, to keep it consistent with the debugfs lru_gen_full file. It
> > also prints a fixed window of MAX_NR_GENS generations from the oldest
> > to the newest, marking the ones below min_seq with 'x'. The event
> > reports anon_min_seq and file_min_seq in place of the 'x', so the
> > generations that don't exist can still be told apart, and they always
> > read 0. Keeping the same window and order makes it easy to compare the
> > event with debugfs, e.g. when looking at both while debugging.
> >
> > That said, if others such as Baolin, Baoquan or Kairui also prefer
> > printing only the existing generations from the youngest to the
> > oldest, I'm happy to send another version with that change.
>
> I like oldest -> youngest a little better because when I am thinking
> about MGLRU logic in my mind, I would put min_seq in the left, max_seq
> in the right, then wrap around from right to left.
>

OK. We have both left-handed and right-handed people
in the world. Somehow, I feel like a right-handed person
trying to write with my left hand when reading from
oldest to youngest. But I'm perfectly fine with that!

Thanks for sharing your thoughts, Ridong and Baoquan!

Best,
Barry
