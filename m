Received: from mail-qk2-f3.google.com (mail-qk2-f3.google.com [74.125.230.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76A8A57C736
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 14:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.195
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788965670; cv=pass; b=hKgTYrMtGHeVsEvPO3IltGsIqRdyQYg8XYpRupMnqzDP5ELI/ZzBbLldxOpqLjtGBPuEIq+/SbPsrpPHIvvQKv/Yv+Pp1MddmsuVu1FRUcZCBXHfSRrQbW8/d8BHuLEHS4AWLi7Ws0hU0ozjMjKa6cTNI3hbzAihRw0FSYPZGLk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788965670; c=relaxed/simple;
	bh=4xAGJJ70mlqdEm3Xz/8BQ6RoQZ90L8GHwhRK9Ys25cI=;
	h=MIME-Version:From:In-Reply-To:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o+O4g1f9jGpCFs7uVooqqsudbiFZCNLMlqKKvTKif9FTpunaWWcS862Mf1AY7pQziIZxJM8LnXfByRry1+lJ9jpex4tL6rU8TP2D5nIKiXgBv5+NQZakQ1ZQti9WY2I4WjS+a3swH5LLtaZ09XYjQ145DSKcRwWX25j0rKvPag8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ppprXH5h; arc=pass smtp.client-ip=74.125.230.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ppprXH5h"
Received: by mail-qk2-f3.google.com with SMTP id d75a77b69052e-51bfca7f85aso44624481cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 07:54:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788965668; cv=none;
        d=google.com; s=arc-20260327;
        b=bjrWtK97tPPNB5Nl7X6PpXk5dHc7KaGXD+HLH7iB1kxAur1lZ7V7TmnWPM29EyHNED
         kCMZxiwOyomzKSN6p46e4Aho1YLtN4bZ9sp4wuoqFsjSpmCZsnU5hefIShTLNwrYlNA4
         XNEgzLtRuiBcpSwqE+fVQRMnrvxUEILQPlTcFX5rW1c7aRJutsJdbpuMo2J8ph3RSkbs
         pj1YaPfq9mAaTTQsPGmQdCg8fFI1xsMFBvu/2LLS4WFs8YECPBR2G5SygrZeGLcfH1aT
         YwWfRh2tHkNA613svevJ//rE7WZNHiPI9CZ943DRsoxj64Q8Nu88UT9xTm6S5+Xgysdw
         yWXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=4xAGJJ70mlqdEm3Xz/8BQ6RoQZ90L8GHwhRK9Ys25cI=;
        fh=q9pi0Ux836BKWgJjegy4x5OPj9b1t/VBpSwF0fnHm6E=;
        b=jObF9L4NU5FJ1LWy1rmWRp4wzMzF9oyY+8iKHg205un0Yv1oFzMR4/vkSYXUp0iGj3
         PccZo2P2j+mVLLt+s2M6fsnxP7yzlJsSSqFdJleuYvvS5RZq/oBann6MSG1RkaHB2B9t
         BuHwBPVVKP+ah9OfWjF8+dDVC0qiZSgOdR4dRNgFtTBsjfMLN7kQyw0+EeRQbsU/nZP8
         Kq3EasVQ5MIB9s9m+mIpGlOmpaPMPFrT9DSskJGA439F4lbf9Og559YiJbEzuF6MaszG
         gPSoRy4Afq1+2OfFPKBryCvMg5B+Q3T7y2B/93avmHFhCK3Tni/VClkJmuxmRkJKj/JB
         uPaA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788965668; x=1789570468; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4xAGJJ70mlqdEm3Xz/8BQ6RoQZ90L8GHwhRK9Ys25cI=;
        b=ppprXH5hfRqpNoZGQiKzysntKpnrNSb7w14BRw+QnOkLiwU6uRhsbF5P4pRUn2lMho
         G2/ZBsNMDBEB2W4LPPB87Vs7VJ8CPvVXa0Di2/RafxZCT38YA8Sz3ko59V6d13RF4T1v
         RTlP0pvENfzAZKvDBABSCFlq8tJ43nVlJAWwBSDgM8V2rKIpN9IPRkccDDJ/hXX15nAl
         NZ+ECg+p9tu14dC2AZxCB6auA5yuW1A7IFDQfE9/xh0xq08w6dejuiD8iEYsL+dvi1NM
         5HPVj43e6oaqiIubdN3vCqMhiNAFO0UqWQzaSFTS/9wuqA6AKcw0mvtjjWaI+rtGIplg
         4lxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788965668; x=1789570468;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4xAGJJ70mlqdEm3Xz/8BQ6RoQZ90L8GHwhRK9Ys25cI=;
        b=NXj+N4/2S+/3HJUTJzKO9IjblAv+UgX+YtQ7M7okXNn+/DT/u87osW4eIblp9/aFVu
         uaLhhmxzjvN9INu1xfux/l/w3Oz5W4tbvcCNPacWq5C0whhTAY5cXQrvqHGUwMi6QVI9
         uG8zkJ46h3cOzVJkZ6gN+EeJ9PP4/EqBZiA0OdvmTa3HcCWY5SyYpIgSR9VieAKXWLbQ
         DGjPf4iXvTNojeMzXI3Dr3jLlbEfxAgtpGgU617gvmqDByLSq2BBfUgawMupMkwiWy4L
         9d+HMoZ6IgjvUhNe+aH1eATwMj7CKdzm440LQiaYkodB0PpCA89sQZiPHvLpWVtQHVbH
         EmqQ==
X-Forwarded-Encrypted: i=1; AKwUvBw8jcV09HjQE+6GshOD2kKXgP9/WKogeKh8Mr6CQQLYMODK60wozooqx8QWeem0c0SXQAf9uKqX2Bi3bnw=@vger.kernel.org
X-Gm-Message-State: AFuF++lakbm5yW86MVH9TjQM4MgXYzSx3nzpiHR0f5Cn2Pi+5pC/hNMR
	PARorUmimSz6C1hW3koZvh96pKQvm43p+OFDfJcrkWSvrScnghTHmr5Q0zfC5n9ZsiybgJETANd
	jDMOdQsuiRnWl5GqC/7zYhqM23joT9ms=
X-Gm-Gg: AYBFou2Qy/gsX4Mub/KVxtDQEGjBgqfCTOyyY728Qag7wtoj+4UUMwtEHZFV2B3vgnx
	eZ4b6OVrHHFpjV8RgJOvckUTdRifTSYHzBqDgS8dbFnaiBaNf5zo1q+84dY2j7rhOSy5TNZ4Vmh
	lTq9S+WjUh8GaUcuYwJfrZwwiAFfUte5foClqJe39Qef0a+WOf8aRnth5GOmQ/xmSEfecAE+6FS
	GBQbDAp+bz+/EY9Faw7hzcvTJUrpayOzXQfLq1TY1ym8WaA9aJiL6U7NsbHqUiz+n2w2PbJpd5V
	ybTBTgU7aHbPfUlneTnb654X7tuuZ4cKHfl3cBMP8EWoatC871CK8Q==
X-Received: by 2002:a05:6214:4e82:b0:90c:4422:84d1 with SMTP id
 6a1803df08f44-9103f043439mr445579496d6.30.1788965668174; Wed, 09 Sep 2026
 07:54:28 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 9 Sep 2026 07:54:26 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 9 Sep 2026 07:54:26 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Tianyi Chen <diannaaav@gmail.com>
In-Reply-To: <CACGbirSdR30=YTPQGN-=202jZqiF8gBSewhq+K_fTSNpq=DMhQ@mail.gmail.com>
References: <CACGbirSdR30=YTPQGN-=202jZqiF8gBSewhq+K_fTSNpq=DMhQ@mail.gmail.com>
Date: Wed, 9 Sep 2026 07:54:26 -0700
X-Gm-Features: AcwNN1UWv2D_GKiUaOtOtW1R2NBCj6J4Tg_MXEtj1RtMJ4y8_q8aYCl2gqilq0A
Message-ID: <CACGbirTZFsyQhOszpfiHhrd7Red-L_Z_=ke7DbRDe5SQfzi9Pw@mail.gmail.com>
Subject: Re: [PATCH v3 RESEND 0/2] selftests/mm: Validate selections and scope
 memfd_secret setup
To: Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>
Cc: Shuah Khan <shuah@kernel.org>, linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Joel Savitz <jsavitz@redhat.com>, 
	Tianyi Chen <diannaaav@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi David,

Following up on your review:
https://lore.kernel.org/r/d6ca7f47-39bb-43b4-92d6-63ccc148ebdd@kernel.org

> Who would set it at this point?
> Can't this just be
> VM_SELFTEST_ITEMS="default"

V3 makes that change: the default is initialized before getopts, and only
-t changes the selection. An explicit empty -t still fails validation.
Both patches use Assisted-by: LLM, and patch 2 carries your Acked-by.

I have resent v3 at the start of this new thread from my Gmail address
after delivery problems with my previous address. The patches are rebased
onto current mm-unstable without changes, and the focused parser and VM
selection tests passed again.

Thanks for the review and the ack.

Tianyi
