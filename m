Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C9254DAF96
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 11:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792408599; cv=none; b=HMLISOA3GOrICZcqLQM2dQ5s2WN08u2Pwk8HQzRFHWLg5qpQ5V9qFbmnPHOUweeyjqbf8Ox6MWhbhYodVmzEcj1gioyODPiS0XnuBBQvkOBZfiXNKt4HMUBtjnviiCpRrgvQJoizJ7PdSq2Mh5SsNna0/7xyF3QkW+KsAQxUhYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792408599; c=relaxed/simple;
	bh=EWf5c8ljj/09dklnGXsFMrD980MsIpsyxtjkVc+RqkA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=LCbbq5ku/G5y+tuKQfstZc1xLS8iSBq4Gg0y9w95kCWifjL/hNgAe0DPIjQSCZ2S69MH3Qu5wVOpeMYRF0VnKyBhYpHnuOKiICIHnxK3qsHh82i3ztY4JkACUno3EN7J0RLS3C+BQh5aPYLaEnCGZrkzTC+ljkBYRNhbCyQSYlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com; spf=pass smtp.mailfrom=cloudflare.com; dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b=WsKynFkP; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b="WsKynFkP"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6b1dae0febeso2282673a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 04:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1792408594; x=1793013394; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fGQ+9YD2bGTiX9CIhcjMfZ/cpyi6knaOi/h3v5oGsFg=;
        b=WsKynFkPeL99ECm9Gqb1tfUTap0V/zRLCWSnbmNpjJr3xgaY958BOuR5aUwvcRrtAK
         X6wJDFEAbXVYj1xDqgZDplKYnjPNfb7YbMNCfv/AMRmMybsl9Uh6dT8UfYqadrhm+uUu
         507BcFi74m51r591jRl1dUgQ0S4oskznqQTbhfiT+etWfDWuFN5ccGZJQdJfbQ2iYQ98
         6B3LF2wQCh9djcI3TcMYnE69W9usn+TAmTeVDItvoXpqNwS2qKYgCIbf6xPTXvePK8VA
         Q14xAg+EhwV+4mf/dSKpvkdZnNcjSYoYe0BfutMcDPazTvpVOUOIuPJm7z9BDRZOIa31
         mDBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792408594; x=1793013394;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=fGQ+9YD2bGTiX9CIhcjMfZ/cpyi6knaOi/h3v5oGsFg=;
        b=FHqmIeMXoe1ys6iQmY7X9fooqjxZwhkiu8t5G4FW3KlwbFpIeW6q0u6kc3mk9Nq17t
         SQ1hM/+luVNxLptJiw+KEFhfMCzgdcIsEN4mntd6gpM7URykoEPhNlnIhvWyYkfTnCVQ
         INvyX4nku9o+/+rj5fgJyphS6BREXx0qtjGqoluJVKGz6uQ8Ip3Hh9wr57r+PWoizT+3
         o0jEzKA/ADhgvG+1ZpyeINgo0tbsdytr9+1SzWwv+BZYTuBYVPn95SFCFeB/RKEI5PAi
         fKbz0SqsxAOe6nyrQbA5ha5yOPjnnj9WPueSxx3KL5B48uvNCjVM8+dYhl2VGydO17uC
         eDPg==
X-Forwarded-Encrypted: i=1; AKwUvBwxEFI8nS9BnWYCmRt5M6K2UvMIxFE2FQ7xyr74K6HRfrc0yMJzkTZo0RwAkFz4SCUk0LAl4PDboj7zgMM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ+0E/s8UL+bE7IP34+O9dqwU3AGUDvM+pGvcHl41WID3V00BFj
	LbEoY62fVdyVvXxBaLntjhS4unJfexyyQxWj8kPRXfBURoDBq6q3jKV9R5Z5zEKFDy0=
X-Gm-Gg: AYBFou0hi1q1gJA7/DRxkHhjWL9Qm9N+kE5/BZuSEey0VBSQbgxjsZpAVQ2N7vzk3/g
	VajKhF0Fax7duh4Ia5hj91ooUvCpayObxx0ZVQBzMkF+FwPFVf21iguqHTrppheG5UfmKK/lVqK
	bLy9s4fVs+fYwh1Qfh/ex41i0eWYWXRSf1tdZ+zUsiH6zqX/uKiqqd/fPMDquGHwtYFn5PdU0EJ
	9kgMOXzmQIPkwO3hiUlu4lERmA9jFM53LcqzpkQmvZhA7lSXexr+Mm0KKJYdQk0GhnY0Qyo6/Aw
	ObLak4z+L2qnrF/JfObDsbRm/44iJxMJCcIBFme2O8l17+vv6QWj5cdJWsrwlgz5J1IkjK21jDE
	yd/uK1mevOAH6tqkuFkrKsi1lNUsqU2DbRNuhtFM7kIUFy+++N88pAJFV8n2NYlZP7gFW1ALmMi
	jZo9zTWqG7evVm3Hj6tqZUPtkrVfLXw1HebLN0z1rz+B62IPmkYNp5IK7X0ZWD
X-Received: by 2002:a05:6402:270d:b0:6b1:c7d9:b631 with SMTP id 4fb4d7f45d1cf-6b3a8191a46mr4712969a12.23.1792408594035;
        Mon, 19 Oct 2026 04:16:34 -0700 (PDT)
Received: from cloudflare.com ([2a09:bac6:5067:2dc::49:220])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1e9e44sm3663824a12.32.2026.10.19.04.16.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 04:16:33 -0700 (PDT)
From: Jakub Sitnicki <jakub@cloudflare.com>
To: Michal Luczaj <mhal@rbox.co>
Cc: Alexei Starovoitov <ast@kernel.org>,  Daniel Borkmann
 <daniel@iogearbox.net>,  Andrii Nakryiko <andrii@kernel.org>,  Eduard
 Zingerman <eddyz87@gmail.com>,  Kumar Kartikeya Dwivedi
 <memxor@gmail.com>,  Martin KaFai Lau <martin.lau@linux.dev>,  Song Liu
 <song@kernel.org>,  Yonghong Song <yonghong.song@linux.dev>,  Jiri Olsa
 <jolsa@kernel.org>,  Emil Tsalapatis <emil@etsalapatis.com>,  Ihor
 Solodrai <ihor.solodrai@linux.dev>,  Shuah Khan <shuah@kernel.org>,  John
 Fastabend <john.fastabend@gmail.com>,  Lorenz Bauer <lmb@cloudflare.com>,
  bpf@vger.kernel.org,  linux-kselftest@vger.kernel.org,
  linux-kernel@vger.kernel.org,  Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH bpf-next 2/3] bpf, sockmap: Restrict iter-context
 sockmap updates to iter/sockmap
In-Reply-To: <20261016-sockmap-update-limit-iter-v1-2-23fa946db59e@rbox.co>
	(Michal Luczaj's message of "Fri, 16 Oct 2026 23:09:14 +0200")
References: <20261016-sockmap-update-limit-iter-v1-0-23fa946db59e@rbox.co>
	<20261016-sockmap-update-limit-iter-v1-2-23fa946db59e@rbox.co>
User-Agent: mu4e 1.14.1; emacs 30.2
Date: Mon, 19 Oct 2026 13:16:31 +0200
Message-ID: <874ieiey9c.fsf@cloudflare.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, Oct 16, 2026 at 11:09 PM +02, Michal Luczaj wrote:
> @@ -10341,7 +10342,12 @@ static bool may_update_sockmap(struct bpf_verifier_env *env, int func_id)
>  	 */
>  	switch (type) {
>  	case BPF_PROG_TYPE_TRACING:
> -		if (eatype == BPF_TRACE_ITER)
> +		/* iter/sockmap only; type check rejects a freplace of any
> +		 * iterator's bpf_iter_sockmap() subprog.
> +		 */
> +		if (eatype == BPF_TRACE_ITER &&
> +		    env->prog->type == BPF_PROG_TYPE_TRACING &&
> +		    !strcmp(afname + strlen(BPF_ITER_FUNC_PREFIX), "sockmap"))
>  			return true;
>  		break;
>  	case BPF_PROG_TYPE_SOCK_OPS:

Explicit bailout when prog->type == BPF_PROG_TYPE_EXT might be more
self-explanatory.
