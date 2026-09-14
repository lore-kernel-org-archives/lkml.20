Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1474948BD29
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 16:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789403800; cv=none; b=j2s6qI3Tjhx6SoxLvBAK0BLCBJI/QU901u19W3+aQQbsX1Ldhm1LU4uxCvtEnn6Q9egcQ7wOleZMQROHtgQcEaDcZ8Dk87X0fCXyyUQz4IGNTN3Up4D5AfGObVe0FIquvTtG1Xvlr4AvScYgQ+bjvsgCjWjD6lFmqLc0RqbXmPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789403800; c=relaxed/simple;
	bh=VU6XSoDNyYs2RYhP1KvaM5xmSoV/t6Q+v10+XYG9mxk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sceUEDwITiNbT8M34HmM6gPhdx9aoZzRaWtnHTG1PZZDHjURpyBfrwO5co8jiQ3GDrjGoA7EEzN64yGsgF3GFVpY45S+qN5hTl4Xg27Q3+UjJLT3cbUHmjp0NF4oKn0VfULlQc02Yq9RXVztnFN0d/74qfU9GS9qGA5Gm/lOzI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Jzw91H1T; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Jzw91H1T"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c294183384fso569373266b.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 09:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1789403796; x=1790008596; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wmTFxmEmG/1tF7ZdBl682LQbn7LRjy+UTZgvHJaQIf0=;
        b=Jzw91H1TJQWaAvIUZTR5oYkRLe0rmuLsBcZD7oCH8oX6dk+diRSz9tW5+cmIcs8O2a
         wwrWr5UJib835/6ATjYNQwK2ITglIOJHuzp5oj3tokVp+MIh9uXuwRdhcflt6uXFczrA
         V4N8sapnUWDhrFEu4l+G3ouy3o9GAZrpHJA3k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789403796; x=1790008596;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wmTFxmEmG/1tF7ZdBl682LQbn7LRjy+UTZgvHJaQIf0=;
        b=1X1xU+hVE8yFFEOlQW9b9HSTVBzxcMKn3x1uBJENowd9SbrZCXLA/ZqWL9wKBJvKDp
         ZxvTzcJh/JCIG9hQfvGmvs2p/0vbpLLplRR1P+KUlgYQp5GV4a7kJjkACzOxNKBNUjwa
         FY3ap7OEwUtQu2FeyjpIIG7Jtgun/RoZqLkpJ/IBTDbsDDc19JUD8OZXBnRKd2Obe3Ym
         AU5q3GfRrtjBjGpWZYXtmDB4k2kyK2ewA4blYTvjg79QmWNmewXLKP2DfdKghfxCdVGf
         QJEQHICxKhwsX2NEo3N/YNYoqkjBaJZ8+rSn32W7lgyYrYn1es0pQWsXXivwKGv4T37o
         h8PA==
X-Forwarded-Encrypted: i=1; AKwUvByq7pBskobBeJaewA6ZF8cHymT1jed5j8yFtGu1iO20J9ciLLJyr0rGHikdejs7cePq0G9Gw67yv6y2oOE=@vger.kernel.org
X-Gm-Message-State: AFuF++lPC9xaU/k5zOx36FzaxyKH9AJ3sq+4JOEpWN2tLuB3fNFvnJOB
	DHo3lKShEEqSM2uaKRPZhEWZUM7GILT+E6P0GjiIBoXgj3US1pMKfhIcSn2fT7lfqK2K6LprOmw
	JNcmczI6gzA==
X-Gm-Gg: AYBFou0uIfqC7laTHdBU/ZvoMWh9SOsjbhSI5QQeOaqX+IZCFDOKtfvKTXQBu36nazt
	n9hj4tWe64FvYumcGUaIfrV0UFjtPlBOIM/sbwvX7fMtnaQzYOQjnN3wGdCMC0BbD5wSsjwkMaP
	M/5Qqo3hkeAm2HddZdyJpGj+Gh7SXO1IAw1C1f8JtoHvaiMk1eLhe6oniPO16fU4GBxukO6TANB
	eqRejcqj8fsOHTLlKDIIOS4qTlC0RD0EXOHn04REEc3CNgD4+cIxmD2aszFvFCqkTYvNw+81vAG
	V4vKcBHclZtGvBHs6acf28wim4JooVJlnRK7XYtOvLwXq0vJvMprtKWXiBU0uXeXa/18wMt99R1
	uvKWmtWRcHyJCyILl5ci/TvvMe7rKCREi0kzAAhG8Llz0Gb5uikIi8HWh5UlKLFOCkW+TYEHZ5n
	v805JBb0QNllHwczfbKffXUBaF3saAf4JShSxuKCT9o+/Fb4U8WJlfDftgZ0c2Y/hOoFDG5Y2qN
	lCheUO8eTcsNLXmkwVGIq59X+H9bXk7YQakDfQkmLyjw/N20BLiLii86es=
X-Received: by 2002:a17:907:9486:b0:c24:adf4:5c73 with SMTP id a640c23a62f3a-c29b861e801mr222761966b.1.1789403796211;
        Mon, 14 Sep 2026 09:36:36 -0700 (PDT)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com. [209.85.218.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2965c4e1ffsm445564766b.7.2026.09.14.09.36.34
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 09:36:34 -0700 (PDT)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c294183384fso569361966b.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 09:36:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwbppRmOM+rvvV9sOhRSxFsrpxyuNkeP58cR4CRMzspNPCqaRXXBNeA2FeIfj0dnLGmZl/FHTETpfkfiUA=@vger.kernel.org
X-Received: by 2002:a17:907:d8f:b0:c25:c54d:d1a2 with SMTP id
 a640c23a62f3a-c29b864787dmr222496666b.18.1789403794342; Mon, 14 Sep 2026
 09:36:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260913225356.1033865-1-dave.hansen@linux.intel.com>
 <CAHk-=wiSPMB4tZB4mngU5wUJ3qJj5HwKc7x2E1dj4YnxCGadeQ@mail.gmail.com>
 <2a15ec49-7b83-4881-a9ec-a1193602eb4f@intel.com> <CAHk-=wj3H5DdeRqnWWz7PwH1Qzb1PgQWf9S0Ce3BjZ+68LjXuQ@mail.gmail.com>
 <CAJxLxMXGE64kSaTRZq-HkVTzM8eKwJRDhGNM_-sy2n03hj_Wfw@mail.gmail.com>
In-Reply-To: <CAJxLxMXGE64kSaTRZq-HkVTzM8eKwJRDhGNM_-sy2n03hj_Wfw@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 14 Sep 2026 09:36:17 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiK3neZvhjQr4SZw86i_D-PWJK74HRkMe2JGkGMYrSb6A@mail.gmail.com>
X-Gm-Features: AcwNN1VPxrdUKAO1fldEtwntBZVwxNaa3tgBb6Fqqx6O4mYOJ_zNslxIH1x8bN4
Message-ID: <CAHk-=wiK3neZvhjQr4SZw86i_D-PWJK74HRkMe2JGkGMYrSb6A@mail.gmail.com>
Subject: Re: [GIT PULL] x86/urgent for 7.4-rc4
To: Orson Peters <orsonpeters@gmail.com>
Cc: Dave Hansen <dave.hansen@intel.com>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	linux-kernel@vger.kernel.org, Vernon Yang <yanglincheng@kylinos.cn>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 14 Sept 2026 at 03:12, Orson Peters <orsonpeters@gmail.com> wrote:
>
> My minimal reproducer did explicitly call mprotect() to make the
> reproduction deterministic. But on a multi-NUMA-node machine
> pmd_modify can get called entirely transparently in the background
> with memory pressure.

I guess any of the paths that end up calling pmd_modify() will trigger
it, and mprotect() is just the most explicit one.

At the other end of this argument, I tried to find something else that
does what MADV_FREE does. I think the trigger is simply that "clear
dirty bit, but leave it writable".

And a shared mapping writeout will do exactly that - but I don't think
anybody does writeback at the hugepage level.

So it may be that MADV_FREE is indeed the only case that actually can
trigger the bug that otherwise looks pretty much like a generic thp
issue.

                 Linus
