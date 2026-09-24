Received: from mail-wr2-f10.google.com (mail-wr2-f10.google.com [74.125.225.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B18E43EC824
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 07:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790234331; cv=none; b=htDZX1X8aLO4azcN4HptHP7qSP10+cl7tJZDcAWarqMbZOyfW3VnWa9TJUeR4Q0413T4yGjkUQg6mQmkYZIKUF7MCktggwFULhIF/X4w0Y9pFR5Vj4r4DCgbLMDFmeyF9SKrSS+iHn5cjJJ/1wfwNfK9iqbOJ6OZMZyRwsI2zpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790234331; c=relaxed/simple;
	bh=RkQZIUAkC/CwNHAccWBmK7QrU2UwzqU4lzfZ5AArSQ0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=tYSdGb6/URLLiHPfR0Lk22aDbUGJb2meMl9SxEW4wYZCUcG52Eks/diPNhfc0AIjhladxnT1Y/gQfFCXq29vtqol+dvWF+uKbfqwN9JtLYGx1OrkP0oRgH2zTWCIpWW4nM+WsykunEF2lDk3kIeYpxm3NujDwvdyP044lCZzNZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oGp6lhUf; arc=none smtp.client-ip=74.125.225.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oGp6lhUf"
Received: by mail-wr2-f10.google.com with SMTP id ffacd0b85a97d-484373a2e82so922989f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 00:18:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790234322; x=1790839122; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=523fTptxsOAJ8wEQL/CwkuoPNTaX+slLlXT8PVpSULI=;
        b=oGp6lhUfWvnkLvJ/MVURmlhVmC6OALMjPL+LGNxfAwbC9qlCXbRrSUzDdyqAqn/J9L
         gmCMyGvkx4+uvATE2wOhLaY25Z0PDT/JjIvISRjXw0olQ+JxMiJcooXVf1KLKzP6n0Rf
         fcBHr+kl1HyjajyY5VRWVRIOxc0tjdXYxx0SUppJOdy2KsfWvgzoCQFBCsDKzCGtYaL/
         FzN9J7qrNLCOaG0ksSOW1G1hwYz673P+1mobMhbpPzlPPcqyQLvOjng/FNyDOT7SnH67
         8ow/2hhWHqYj1tQhm2tWUylVxK+ie9chXkffpqjsHy6YqBVUuGgW3I/e6xGqA+Kv+T6g
         SZqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790234322; x=1790839122;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=523fTptxsOAJ8wEQL/CwkuoPNTaX+slLlXT8PVpSULI=;
        b=SxktY+PZeytH7VamcgMIgnGuW7ZlxcgE0aM/OcRfh53YWFXMGgLAiEfBUnT43sG1se
         HJjKD7rwtWRpKF0tQIzvnfiA8QQA4hckv0XTmSiIF4LbLCPiDlIoY3ov5w5G38tXZKKl
         r318ltaWu/uA80/tdzfA7N7uALKfqlJwOV7hJ4PckJhk+XZgvs3kPXDX6JphwdOEQlcI
         ljBXVVPONmnyHP0kr2iK5Bk8MgZqOzFPY2vSQ7K7UHSycsJDjZC3xAIwQSHKLeVkhTQD
         Z6x74tNnfpWqv3U+aCtjAr9KId5W3tqTxbtdX4lv/W8UMKMDneUduOvYB6VzGQrI85Tq
         7oXw==
X-Forwarded-Encrypted: i=1; AKwUvBxU0LhWxyNJwMNtfOhKAINmHIj96hhzriJ18ynhbUBCUfZdLakGMq8bStPUM/l9IcLkbwWSuGaOrtvd9Vk=@vger.kernel.org
X-Gm-Message-State: AFuF++lggTyXcHiYmRn6k896SDSgAv+6MJGcESuHpoN0ZZ3I+x51UcsV
	qoZClcm3kLh8KVctl+TQBB66e0Szk4G9SqZEiR/A/yFKSw4uZHGrtFs2
X-Gm-Gg: AYBFou3pM9EyGKgDfMZy1pA9oMnGcZCVo9w6p9SrtlHCnPiTODHiQYWIoORuNXo3aiS
	7tJLaxaSFKJCvd5urE+4TS16NPDZAbL6WzzRVbdU6Fiwi6Zwq0dA+N1QVwiUDBDk38zpyQLR5Lj
	jZc/pJ4QpXNfQo4PPmAWSVMlEicY2apJV9AEI6MFMddVXEwVyZ42g+X6p4qbFEOkfshyBRXYA2x
	stYFtIrrMOGIwpGc39iKyOVV73WGhea9/Fr2rhK29CXFrK8+SZm2sCKnZ2iRwdFjLYsu5PeaAEY
	//7SvBrYV1f9gDyz33hGxNGkQUwOOxZBO31RfLwB2FHiC6TWC65avC4BE21YrhpaW/70SP9WYP7
	d3kl8O3vhum2juhCmhXEv95eH0Gp+kIfyQoGuP3/nQw1ImFqNbmPvP/hx6ayxXt5I6GsekeJEWl
	xE4kwGqNrN1LBRn7JR2qHf7OByehmLk2osbO425AIey2tOYZnlqTUL7IShyXjy78UUD23LdyJq0
	OlayHiF21/A+RwJ7UwLJAmy97JXMH2pQlPZ377G+lJK+QPMJZqkjzyzYY7sGUZAwlvcO3Lm3YjC
	yyJSWVIJ0P8cd+Roz8i3O+/cQfK487nhLMkQd/gBI+2Lm3B7
X-Received: by 2002:a05:6000:4012:b0:487:8ec:bbd2 with SMTP id ffacd0b85a97d-488716c9360mr2499338f8f.19.1790234321688;
        Thu, 24 Sep 2026 00:18:41 -0700 (PDT)
Received: from localhost (nat-icclus-192-26-29-3.epfl.ch. [192.26.29.3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-488682668dcsm13312703f8f.1.2026.09.24.00.18.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 00:18:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 24 Sep 2026 09:18:40 +0200
Message-Id: <DLND3P616VVS.RP36A73FJ1BB@gmail.com>
Subject: Re: [PATCH bpf-next v1 0/6] bpf: Scope callback arguments to their
 frame
From: "Kumar Kartikeya Dwivedi" <memxor@gmail.com>
To: "Ihor Solodrai" <ihor.solodrai@linux.dev>, "Alexei Starovoitov"
 <alexei.starovoitov@gmail.com>, "Andrii Nakryiko" <andrii@kernel.org>,
 "Daniel Borkmann" <daniel@iogearbox.net>, "Eduard Zingerman"
 <eddyz87@gmail.com>
Cc: "Amery Hung" <ameryhung@gmail.com>, "Emil Tsalapatis"
 <emil@etsalapatis.com>, "Nicholas Carlini" <npc@anthropic.com>,
 <bpf@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <kernel-team@meta.com>
X-Mailer: aerc 0.21.0
References: <20260922010333.1226537-1-ihor.solodrai@linux.dev>
 <DLLGYV7DI406.JRNDNAZ4S29I@gmail.com>
 <ddb3c0eb-2a95-4af8-a9b9-a0624d38a7bc@linux.dev>
In-Reply-To: <ddb3c0eb-2a95-4af8-a9b9-a0624d38a7bc@linux.dev>

On Tue Sep 22, 2026 at 8:13 AM CEST, Ihor Solodrai wrote:
> On 2026-09-21 6:55 p.m., Alexei Starovoitov wrote:
>> On Mon, Sep 21, 2026 at 06:03 PM Ihor Solodrai <ihor.solodrai@linux.dev>=
 wrote:
>>
>>> Neither has a local fix: both arguments point into a helper's own
>>> frame, with nothing longer-lived to anchor them to.
>>
>> It's the same problem as a pointer to callee's stack.
>> check_stack_write_fixed_off() deals with it like this:
>>    if (state !=3D cur && reg->type =3D=3D PTR_TO_STACK) {
>>            verbose(env, "cannot spill pointers to stack into stack frame=
 of the caller\n");
>>            return -EINVAL;
>>    }
>> CONST_PTR_TO_DYNPTR wasn't spillable before 7.3, so nothing depends
>> on parking it in the caller's frame. Reject it there too ?
>> and then no need for REF_TYPE_FRAME complexity?
>
> If we focus on the nasty bpf_user_ringbuf_drain() bug specifically,
> then yes, check_stack_write_fixed_off() change patches it:
>
> diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
> index d62c0f74cff5..f261423e9282 100644
> --- a/kernel/bpf/verifier.c
> +++ b/kernel/bpf/verifier.c
> @@ -3668,7 +3668,8 @@ static int check_stack_write_fixed_off(struct
> bpf_verifier_env *env,
>                          verbose(env, "invalid size of register spill\n")=
;
>                          return -EACCES;
>                  }
> -               if (state !=3D cur && reg->type =3D=3D PTR_TO_STACK) {
> +               if (state !=3D cur && (reg->type =3D=3D PTR_TO_STACK ||
> +                                    reg->type =3D=3D CONST_PTR_TO_DYNPTR=
)) {
>                          verbose(env, "cannot spill pointers to stack
> into stack frame of the caller\n");
>                          return -EINVAL;
>                  }
>
> However it doesn't cover some of the new test cases:
>    - user_ringbuf_callback_park_data_slice
>    - user_ringbuf_callback_park_kfunc_slice
>    - user_ringbuf_callback_park_clone
>    - user_ringbuf_callback_park_clone_then_slice
>
> (not counting the diag message diff)
>
> The original suggestion that came with the bug report was a
> cb_dynptr_id field in bpf_func_state set up in
> set_user_ringbuf_callback_state() and read in prepare_func_exit() to
> release it there.
>
> The cb_dynptr_id seemed way too specific, I didn't like it. So I've
> tried to figure out a feasible generalization of the problem, and came
> to "verifier can't track a lifetime of a ref tied to a frame", and
> then to this series.
>
> I think we need to decide whether the REF_TYPE_FRAME is a useful
> mechanism in principle, and whether it's sufficiently generic. It at
> least covers the cases in this series and more.
>
> For example AI also flagged for me parking the vma argument
> (PTR_TO_BTF_ID) of the bpf_find_vma() callback. It's low severity,
> which is why I excluded that from the series, but "reject a reg type"
> wouldn't work there AFAIU (we would break many legitimate programs).
>
> Opinions?

Ok, I think I didn't realize the issue was broader than just CONST_PTR_TO_D=
YNPTR
type. In that case I think what you suggest does make sense, and might help
generalize the behavior across different cases.
