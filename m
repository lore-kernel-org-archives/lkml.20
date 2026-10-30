Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793333638;
	b=AnMCQLPhttvdLIowl2VSQqJ97ZeSboWeGBeBW6ySdE/yN5ADOtWIuqanKkTR2ixAnw9+
	 39dGbIyJ5OZLDTbI6xhustmqtGq3TDoxKFqPuIfGX+ieWj0jLDeaNqVl4KopwG4iirQuc
	 jxX8Wv41KBsMs440oixuR0DoG+2S7UwLBfjSGcsh8m9Mfy13bmd1vKiQln9ZGGnsOeOJj
	 8S3INmrc9qJZzC+IXO5jOYOU+F9VPSkkQA7A/H1dunG22MhhS6BTRfmY3K4NkYfY+AG+a
	 H9JP9dbwLBkVpcnKm9P9Eh1C1Hu0bp3aUPfIDe4uvtekCaqFkqcBytKpkkE/cJylLXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793333638;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=cui/fkfgWpCfLIzu0sMbQtqdSWprMFO0xjMUt+zFXCg=;
	b=cQTS0T4frthSRjf2hJXAH9fh9YYFH6nqyUqUC8ljCATfypaE4FKMOAiHvIlUs8/ziqvE
	 20mr1Sdk7M+riHxlTQy1QN56K6xFO4l6kF4XGh9uqX692oNPVNSiPmv1VlxHv/cbfhOWj
	 9Of2/43vMVCtVCmPQdy7UPsU+ub/RYlfkxW+1Jq8EeT4QGEyL89PxlHi670UZ2dEkM7Ik
	 n1krdjC5Q0HcDEOoFZNHbXB8iIfzAHDYum8rUzQlzqDGS9fYG4hxUmforg9lqRR9Bl3Ez
	 fTRIj0VaqSqPYQflFQ5YnS2WDhIdL4jX0qhVibW9sfIm4VoDxHt7WJmiqPXnN1C3xkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Wz0HzG9L;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A2CD606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 04:13:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A2CD606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Wz0HzG9L
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-36a2551d7b5so1828354eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 21:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793333637; x=1793938437; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cui/fkfgWpCfLIzu0sMbQtqdSWprMFO0xjMUt+zFXCg=;
        b=Wz0HzG9Ly9LIjZaB3SCPFuZ206HoWn737xJUnImVrGdvogShozN4wr8BbyZQisWRQS
         LqQqMM3VHPYz6UgTh8QkSgXm27oZ1sA1vCqR+m9zDy/exrtYijqNGGy2y6wYXfGAxQO9
         mXYohP7FCQF6SFNZJMuJfhkaY8TEwtVMdDPmM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793333637; x=1793938437;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cui/fkfgWpCfLIzu0sMbQtqdSWprMFO0xjMUt+zFXCg=;
        b=aJBjNqqYi1fYrtPW+x6ElyDM9Nouc6a3pbT1CihcVVuck/0kXNQeDEG0kYInc4J3eQ
         dL2bBwmA8ZRS1uGD1+jgCgrsEaNjr3NaMx4qQKXGQrPyrcS2wW4ZS0wZ1OAtGqLtquuV
         PQPL7hBdNCRbSwuXUvynL8UwRWtzTreDsGDCkL3wPsGirAQ6VC+ABu5Htm8YTr9VmP1v
         aFCfEeflGR8xBgqkW4S+x9MxRVSnOAZFw8iLpVFrBlZexosLW5AYO0HCiTQrfgZeUrok
         Z4eFzgqIPvSj6Yjw+GNB1wwAVb2yhZUkbkpy2NS/mD1hlbyHtMFPy4kDoEKRGpaKejxJ
         WTlQ==
X-Forwarded-Encrypted: i=1; AKwUvBzjrisJNSHV149CbNB654Pnb9kOOZke9rmNLxsco4aleHjoawFLSrM0kyYLGE3mCou/mFLAS2TY/v35xx4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ4P0Y9ZaE3NL+keD6YodVwtpS1tIktvR4v4TPc7SrfWfG1t0OJ
	MucxyE8hUqtcSD+xrA4M6wLGByBmI45pQZOyk5Hq0OfYqC7Q9ZuH3pczPXbgCFPUVw==
X-Gm-Gg: AYBFou0Mpvq2fKOJde0Q3SSexrDuPIIMkE7+n1j18vwWkdkLUxJcgB/HF+dBF+RbfzZ
	VyzSu2ZsHzNn91JVTLL9E28oC1QemsNu2PpzzzfVrsfv9b+EXhHP+m00TXiDm0gjVXZDgxghpil
	z9KU1VuEsSVd/8agdpDJjzGPloZ6rgTUTPhmEjTE54Gd+GPVfiizTd2NWNy3S1y96xRBypiktON
	/Rj3Mo1LVBWcb3pzSRIrNW4Q9V8yOB36tyuLxXcy6IcFgpXCFgRASz49J37TB38AaVFwb7WU2J2
	YWK4uoz2qxXkwTO10s1a1FvnoPSv7FYFUvrDsCG+d37e8pBA/CxbOAyARii/3bi4XsZYrtzwK3a
	5fusebokbK0XSm7wFLsmNYcmQdWFRZwzzp88ZjFX/OpCxrTx1ImnLUGNDq6gxUSoJUKJefXzxQh
	94wwpZ4fA0H2nEV4CcjvqVZMKh8gJMhIT0mv+Vc/Lwh7LriSq0MLdmuGUFS6AQJta8nuilRvLNs
	Qa0MosziWKPecV1SmVSM0+xTQwHPwFdtKCoIKNeCTO06wQ/vVt2jOG6Au1Hphtz7Sy6tgpp9dGY
	FsnhmSwNPlIFYz3bHsxbk9RDR3BQONlY1JNDkMCoMifUR8Dq9iR9m29q3KwbotswucOTvw==
X-Received: by 2002:a05:7022:eb50:10b0:183:942e:8493 with SMTP id a92af1059eb24-1ac5a67f97bmr1611157c88.11.1793333636971;
        Thu, 29 Oct 2026 21:13:56 -0700 (PDT)
Received: from google.com ([2a00:79e0:2031:6:7476:5b7a:d979:2d91])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac0e738445sm3485807c88.0.2026.10.29.21.13.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 21:13:56 -0700 (PDT)
Date: Fri, 30 Oct 2026 13:13:52 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Brian Geffon <bgeffon@google.com>, Barry Song <baohua@kernel.org>, Bo Zhang <zhangbo0325@gmail.com>, 
	Minchan Kim <minchan@kernel.org>, Richard Chang <richardycc@google.com>, 
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v7 00/15] zram: redesign zcomp and rework backends
Message-ID: <auQUjtWYOuhf_M8T@google.com>
References: <20261025021839.1542805-1-senozhatsky@chromium.org>
 <20261029200205.ee2a4788b8fdba4a75c2edd9@linux-foundation.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261029200205.ee2a4788b8fdba4a75c2edd9@linux-foundation.org>

On (26/10/29 20:02), Andrew Morton wrote:
> On Sun, 25 Oct 2026 11:18:16 +0900 Sergey Senozhatsky <senozhatsky@chromium.org> wrote:
> 
> > The series has a number of memory usage optimisations and fixes
> > that result in savings from double digits KB to triple digits
> > KB per-context/per-CPU, depending on backend and its configuration.
> > More details are in the corresponding commit messages.
> 
> Thanks, I'll queue this.
> 
> >  drivers/block/zram/backend_842.c     |   6 +-
> >  drivers/block/zram/backend_deflate.c |  98 +++++----
> >  drivers/block/zram/backend_lz4.c     |  85 ++------
> >  drivers/block/zram/backend_lz4hc.c   | 105 ++++------
> >  drivers/block/zram/backend_lzo.c     |   6 +-
> >  drivers/block/zram/backend_lzorle.c  |   6 +-
> >  drivers/block/zram/backend_zstd.c    | 133 +++++++-----
> >  drivers/block/zram/zcomp.c           | 298 +++++++++++++++++++++++----
> >  drivers/block/zram/zcomp.h           |  53 ++++-
> >  drivers/block/zram/zram_drv.c        |  71 ++++---
> >  10 files changed, 546 insertions(+), 315 deletions(-)
> 
> I've always put zram material into mm.git's mm-unstable/mm-stable branch. 
> Because "ram", I guess.
>
> But it's a blockdev, so I'll henceforth carry it in mm.git's
> mm-nonmm-unstable/mm-nonmm-stable branches.

Thank you very much, sir.
