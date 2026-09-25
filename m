Received: from mail-lr2-f34.google.com (mail-lr2-f34.google.com [74.125.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57BD443F4AB
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 19:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790363360; cv=none; b=BHeCwp4Em9Pxp/CR8sWWW7kQZTrXK5iKTQpd4H3VbMduNL0D/JzwMaECc/RKXxUpQS5JubDSAft3Xc1VroVv9r39aaEPuyIGkKEPVp5dmJIvC1vWMBReIK3xuPqSbI2MP3bY23Uv1D5tV8orG9aAIo9T5VgRHf2++FPTDp/JYDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790363360; c=relaxed/simple;
	bh=P4N5NiQtgf6akdcneOmQDJyafFZ6ZSCqTp8XKHCQvSE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JG7UaqmUavSw6ojghHN1G8SlAVCPqCnYBSjuOBhhov4oo0ACxavXyBzUyYscsj0Bp/fcH+YapfzhpxgFuUlMOKPIHrPueHKOgGuSt9Y1XlPUUBuZZiMN0LLjQCUuMlGfreN6PrMv5oIUYmEx9KXgPiD/vTSGEyvh9QP7xGThmmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Qa19jkOJ; arc=none smtp.client-ip=74.125.230.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Qa19jkOJ"
Received: by mail-lr2-f34.google.com with SMTP id 38308e7fff4ca-3a6595b02ebso2359391fa.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 12:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1790363349; x=1790968149; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jyusYEZ6OMCBSOJianrKz0ypKfJejIPeyJrkqXUe7fI=;
        b=Qa19jkOJz5MSBHWa1LxTk5Gl1rGoSDktmyxJhgcawZriNo+VAiQyvcIv3aqwGfSLtD
         t8N3961RX9w76/B3cTNySgwtv4Af0wTPx9ObP0VA7MRJ3AJuD2NffaGCJtM0OCCwe5RL
         e676VapjChy849rUCARQodHUpTBAHNJm6xF8A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790363349; x=1790968149;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jyusYEZ6OMCBSOJianrKz0ypKfJejIPeyJrkqXUe7fI=;
        b=j35iuRqZRIgvOIt2w3HF0qec9a5X2C4YlI9RdMFHZU7oiz45CuA/3hnceZvlbYJLED
         WbqtZA7M1DwOsD4DZfL2bmnpWQQptL9hlx+xWMVW5Gmsxp0SJjxTV3xikUSQJvzu0bCY
         VvOil1C8wMxzl0qGwSLrfQcTYc//d+ZtiV9Kuez2BzEzdU7ijZ0p8AoyM3UK1ET8y1WQ
         AyCEjG8cw+AaLFdto0hNMEtzaMg9PONtFQHMC5vAjj8aKLd75myJJvR3Zy4YPBp367Hy
         82K2JhVgzGJV1a6rSnkdAiAEphZuAA90wBvD6FxaAfGWvaEk8gtxVGRRD+C2nHnwNamm
         YF8Q==
X-Forwarded-Encrypted: i=1; AKwUvByIqPvsjKLIVY1zqUxWx6+0PCv08mBYlkzV6//sPqK+J0g6LJxHAcLlPOMl0fZEDPNRagNI3O0QA+58r78=@vger.kernel.org
X-Gm-Message-State: AFuF++n3Dp8bB3HevhHW1GYkrNij8T7zfwyJlHAmDv6YIepgDRQuXy+x
	pmXVkKGYO4+lI3Q9mZOLwc7lMQAhazPK5E2hON7X2ytDZX3YsEnyCQh8pSxGrIqPumzQoz8VMJl
	YiwxiaUrN1g==
X-Gm-Gg: AYBFou3x9DHL9Yow15W+TfEMiZbkP+DsWjt1uQIZIQGN0tQeaaiHZSwu5RAWmvW3IWt
	T534z+0wZufaQgOhV2xFqNZ19r2iQM2SownkDgu7uYiYgjyVIEYevH/ogFAr8NfMW1dj0H19cWF
	DC8nuj/xCumz0iKMJETMZngZBk8sAXWRCSyKBwi6a1vvullQBUpNDMldMjtYEBmEKtA1zYHCF/3
	MO2DfzrUEqrqF+tH8H64T1l68jBG2xHc/Im1liT/XCwmRaCajtskZu+uVu4g6F+po6C+YtSyXyF
	snZx5EicyYsbw7emks9QlMo3qQSQZZPqyeL1lO9QC3+o8fGLQijXtZYYMFKTriMbwzmpZGDGtMc
	nKNmL4aDdjn172zMFl/0FxVqsgwUr9cGRiiI1oImIBnnYmjc3XnS45veSZtVDcuN79RFAmb/3QS
	Rjj2Ko18MMkez1hDmbx/HnJZAUP2ygUO1hhog67msBpdcf5+/4Q3MdgR8eF1200mdoHg7qbOx+9
	fBJvUSLlYLVJMJWL+AWK9Tjrvi76v+UOgCLVC73de5XRowlwn2iOS6zUoU=
X-Received: by 2002:a2e:be04:0:b0:3a5:da9c:4661 with SMTP id 38308e7fff4ca-3a64c7e8928mr7642131fa.26.1790363348941;
        Fri, 25 Sep 2026 12:09:08 -0700 (PDT)
Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com. [74.125.229.205])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a64c30b92fsm8468231fa.29.2026.09.25.12.09.07
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 12:09:08 -0700 (PDT)
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b8eacb7c8fso708073e87.3
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 12:09:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxC4682gbqKVTWchAI9ylJiKFFbLCSiiFBtRBSCVT1JdrXtGgn6vb0izNCgNWWe7CrCgNGfzAyQbzZhSTM=@vger.kernel.org
X-Received: by 2002:a17:907:971a:b0:c29:d525:72a9 with SMTP id
 a640c23a62f3a-c2aea0c733amr303710766b.49.1790362848349; Fri, 25 Sep 2026
 12:00:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1789239015.git.ilya.gladyshev@linux.dev>
 <ebd6540ad89a4bb80e2a62d00901b5c827315b66.1789239015.git.ilya.gladyshev@linux.dev>
 <DLFJL5U9DI6F.3QJP9YP0KX636@nvidia.com> <56e036665dbeb0a8f51d697220d5ed84f210994c@linux.dev>
 <570cf649-a8bf-4073-be71-207fbb2bef40@kernel.org> <CAHk-=wh3LLDV2AMZn1PZcU1o3Na-BNcQtP=LPXouLKPZWaiRdQ@mail.gmail.com>
 <DLO1WIACYFWF.3N01DXYFJLMD0@nvidia.com> <a1d5881926dbf4b16dc796fb1da939f32dd42f18@linux.dev>
In-Reply-To: <a1d5881926dbf4b16dc796fb1da939f32dd42f18@linux.dev>
From: Linus Torvalds <torvalds@linuxfoundation.org>
Date: Fri, 25 Sep 2026 12:00:31 -0700
X-Gmail-Original-Message-ID: <CAHk-=widZMoVwT+to2PKPfy-y2gERYWdLsZCZvXcz0ZbXYpt9w@mail.gmail.com>
X-Gm-Features: AclHuK84xe3uYtoS3qkT2jpKdwnf58NHL9DKtWnMUTEyzhDeLLiMiURHSpbJsHU
Message-ID: <CAHk-=widZMoVwT+to2PKPfy-y2gERYWdLsZCZvXcz0ZbXYpt9w@mail.gmail.com>
Subject: Re: [PATCH v6 3/3] mm: implement page refcount locking via dedicated bit
To: Ilya Gladyshev <ilya.gladyshev@linux.dev>
Cc: Zi Yan <ziy@nvidia.com>, "David Hildenbrand (Arm)" <david@kernel.org>, akpm@linux-foundation.org, 
	andrew+netdev@lunn.ch, apopple@nvidia.com, artem.kuzin@huawei.com, 
	baolin.wang@linux.alibaba.com, Liam.Howlett@oracle.com, edumazet@google.com, 
	harry.yoo@oracle.com, hramamurthy@google.com, ivgorbunov@me.com, 
	joshwash@google.com, kirill@shutemov.name, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, lorenzo.stoakes@oracle.com, mhocko@suse.com, 
	muchun.song@linux.dev, pfalcato@suse.de, rppt@kernel.org, surenb@google.com, 
	vbabka@suse.cz, willy@infradead.org, yuzhao@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 25 Sept 2026 at 00:03, Ilya Gladyshev <ilya.gladyshev@linux.dev> wr=
ote:
>
> Hmmm, I=E2=80=99m afraid that since you need CAS for a safe 1->FR transit=
ion,
> it will result in a CAS loop for the decrement itself (like in
> atomic_sub_unless). And this will introduce scalability issues just like
> in folio_try_get(), but this time for everyone...

Note that we could make that CAS case be the thing that only the
special cases do.

IOW, maybe only do that slow sequence in compaction_free() and the
memory offlining.

So we'd have two different cases:

 - the high-performance case is ready and willing to accept the "sees
zero" window and the extra 0->FR state that can race with somebody
else taking an optimistic ref

 - the unusual slow cases that are *not* willing to deal with
optimistic ref takers do the "CAS 1 -> FR" state atomically and always
use compare-and-exchange for their freeing path

That actually sounds like a good approach to me.

But maybe I'm missing something obvious and it doesn't really solve the iss=
ue.

              Linus
