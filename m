Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=62.72.0.81
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793395188;
	b=Id/cAhGjYp8g5GDgysGoMttoX76TFJ3mnLpOHdesaYspZyW49RFQoyp8ixhwTr+2A1HR
	 JtiQsNsuQ1kbzYsY8fFwAqnvbCORTi3dYbNI5S9Yt7xTy3xRNgmFj24kUfgg8bj8IyVGj
	 6IRH++oWu5pLPZ2g4LWl2UR6B7N6xw3tCEyXwEVFdU37BomAMtmXtJjA/sX2IRy0u7vvI
	 rbhgJ8uoxUPfboPEqYgZBWvui4pXsK7MHRG7uqp1wtr81ro1p0I6+YoPyRZFnmmUbldd/
	 01KW5wqN8ZAyWQbmY02n+/Yq90AdW9SOQgBcFLy/Z/1134RH/BSSum9T/IywbkpF4ow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793395188;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:cc:
	 Subject:In-Reply-To:Message-ID:References:MIME-Version:Content-Type;
	bh=EbmEgpNrclw3FJ5w3l66lU1yS0lnl+gAefGym+Bc9Es=;
	b=ElLsBwAw43kNNTt8kM/77f3/v3Acfk0MCeDy/luZrUr4ITaU0jpRUdxJ50bacs8m6f8N
	 UaJR35zbKYsEviV2wLpJBzm0YJ43qMTJjkwirFf8yIWNlWWjidHaWBaeLrfdBBI/RJsFT
	 AV9cU6hKDW0To8c/iSoobl9F83WDBOyDP6L1DOhBj5Pqd4EL1kaetq4SPn8MhuWUykXa6
	 mszECTKiGnDXg6d3sITWXWVKBGg2ATuqq6KoaLk3HmEn2QMA+TZRKACZ2c46pFOpYvmRC
	 1SVCI5ZvM0prpJEt37WWVwB3BzP1icC5LzG2E8grg1/bRUQyQvVMA6YDO7PxiUgAQ5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gentwo.org;
	spf=pass smtp.mailfrom=gentwo.org;
	dkim=pass header.d=gentwo.org header.i=@gentwo.org header.a=rsa-sha256 header.s=default header.b=ERxqMAyL;
	arc=none smtp.remote-ip=62.72.0.81
Received: from gentwo.org (gentwo.org [62.72.0.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8915360A263D
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:19:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8915360A263D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gentwo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentwo.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=gentwo.org header.i=@gentwo.org header.a=rsa-sha256 header.s=default header.b=ERxqMAyL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gentwo.org;
	s=default; t=1793395181;
	bh=KMwGBLiWrhlfByGeo1iA75zagaHMei5yC25q/mBzdfE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ERxqMAyLX0Hp4FSzptvMcfb/5nCDlT/sRgWW7uKisLZ5naqkjqdJnjEGjNDBm7ekf
	 YSh8A95FBVL3hD1IWx0Uxpfl1UgpTb70BhGiHy9seJ9wH9jUkWYHLaqcOUsjaYXLnO
	 UuTflRWy5/yiArzWGZ5J7+Uh4U2i5hc1EYZdGb/4=
Received: by gentwo.org (Postfix, from userid 1007)
	id C84D6402A9; Fri, 30 Oct 2026 14:19:41 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by gentwo.org (Postfix) with ESMTP id C6AF5402A4;
	Fri, 30 Oct 2026 14:19:41 -0700 (PDT)
Date: Fri, 30 Oct 2026 14:19:41 -0700 (PDT)
From: Shubhang <sh@gentwo.org>
To: Cheng Yongkang <teel4res@gmail.com>
cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, 
    Davidlohr Bueso <dave@stgolabs.net>, 
    Manfred Spraul <manfred@colorfullife.com>
Subject: Re: [PATCH] ipc/msg: align compat version-0 msqid_ds with native
 IPC_OLD
In-Reply-To: <179334902854.2381848.6451191384765841519@gmail.com>
Message-ID: <b8bd012b-ca39-cd4a-5f2c-727e4f58147b@gentwo.org>
References: <179328314077.648427.7284615104475689945@gmail.com> <20261029115514.fd04df0fb01f070f0e960eb1@linux-foundation.org> <179334902854.2381848.6451191384765841519@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed

Hi Cheng Yongkang,

On Fri, 30 Oct 2026, Cheng Yongkang wrote:

> Hi Andrew,
>
> Thanks for the review.
>
> I'll fix the Fixes tag: 4693916846269d only moved the compat code, so I'll
> drop that attribution.  Both omissions are present from the initial import
> (1da177e4c3f4) and predate git history.  I'll keep the stable Cc.
>
> For the dependency, I'll hold the v2 and rebase it on Shubhang's
> unsigned-long msgctl_down() fix once that lands, so the repaired compat
> fallback cannot reach the int truncation.  If you would rather queue them
> together, I can send the v2 on top of his patch with an explicit
> dependency note.
>
> Shubhang, please keep the unsigned-long correction in your respin.
>
> Thanks,
> Cheng Yongkang
>

The unsigned-long msg_qbytes correction is retained in v3:

https://lore.kernel.org/lkml/20261029-ipc-msg-qbytes-v3-1-fc3f4307c85b@gentwo.org/

Thanks,
Shubhang Kaushik
