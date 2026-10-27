Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793072641;
	b=4Tn12okn7Inpi1L2A3n4Yys3c8XfOHCiPKukYDud1EMUsYj6upJJIuCVwsPfDoXwmmID
	 D4p3ThChLRdceDQO9VjSowlQhgAIdyZpM+zmvNVwAnEUY4DsdUvmDvBzneqJYnOj0nLax
	 hPeF3RcechKGaKxf0CH4WVCk2qvdGmhWTIYeM9l5TU1x85QXn3ExQUP+awfp6dWpOZ9tU
	 jtJ46pZWXqrOe7Hj0nx7vP+JMO8+GUGmctu3/kd1YJJ+FJlYGGQp7RoBZ4vLQZb3+wgYC
	 pAxbqGrL43rakOGKh4WJJUP2UO/rrg5LPQedOzqMD251jlAusbJWYh4/lH5gQBqvfng==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793072641;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=5qKxJCbfRdRrH3hTlJ0h5gJEmaH0ng7PGOWlvDUhXUA=;
	b=1Wtjz4weLogzEDDGFefHm1WK0yVHX62SvxhdsmqA+3E8m785rxQerv1dieSQmV1zxnPL
	 tbU6FK8JINyp+nkwd9eF9Mf/HN6pN3OHLoFyBEwpMK7RxtxYfaH5XgY1iRMipgGcaaMF0
	 QUp9r5Mkck8+IQ8zPtMPefGaw/dYx/xbei+Q7Iw11wojYA06rU3YWIbqrhWByDlkFR0om
	 1SXfzrbb98MjJ2bSPTuOFAio+d3ORjtD15FVBZ2kw9X/HJ3YrkkYt3/bioJIN8GFoQTy6
	 BLQebzk8mL2hMkhDqXLwdfGxDBWaiOHdpkaPZs/fyIGF+ZtWUjxui+Q/Tx/g3T6RnHg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arista.com;
	spf=pass smtp.mailfrom=arista.com;
	dkim=pass header.d=arista.com header.i=@arista.com header.a=rsa-sha256 header.s=google header.b=Jk9klGgU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5378F606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 03:43:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5378F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arista.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arista.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arista.com header.i=@arista.com header.a=rsa-sha256 header.s=google header.b=Jk9klGgU
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c4697404c2bso471114566b.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 20:43:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793072635; cv=none;
        d=google.com; s=arc-20260327;
        b=bfDIQELFLzOB5NEKftoZLpyOfyRFxMohaZxHt4y68p6ZXey7ALpBS5oT0EctWzpVWj
         S+syyt49w6gtt6GcGVOhbcJIahNGsz23xYPx9RTHfg5XhsR9QEjIwjZRUVuLKT8F7zyy
         X0t2opTjF0EtWZtmq3gixgQWUg+NK2vs8wFhW8CcxNNScfFmQqe1z6QDUcj77OhbIqi1
         RnvnpTeHU8/7IrhN+784xo94D0EJNNS3ZShKbWmhriiRF9IQ700pfNVud2CipLkH2aEE
         w0O9RBaGk8w1Z021I/WSsDwb1G6AeUhpX71Ggp6DdakuwTvwqelGQj26nB1IwLdPXrwH
         YNNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5qKxJCbfRdRrH3hTlJ0h5gJEmaH0ng7PGOWlvDUhXUA=;
        fh=VzqRn8bU8okfrut/teO4lAHktwWOvZeY3OiEljI56Lc=;
        b=OpaPZ+w4aSSRYLtP+dQOkBq7de47ovpxGn5YdgQS8sz8GB3JK3pyc8Mtsl+4HO8pWE
         YMScs6gZ23Qxv6DkIC3EtHqOjORnp/17E0KQFpanbRuJHssQCOoZsFh/HORfVyaNiJTC
         FKvi67CNXrUMLG8vmB5wIAwVXuRjfuFcLRR7dpY+uH2LJGrzCTma2Owhlp3RmEUbvi8O
         +KCGiiPHW4I/RHXrv6d1IiOevG1hVB9uONcoUCOWc86Qnui8Zl9S+hP68x7dbblFaiyO
         ijGWkshoKv8w4WDc4sXf1Hls0fZFOtw4MuKwR0E3fBmJC0oQH+LIKjIR7n5Bkyk20P+G
         3uzg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=google; t=1793072635; x=1793677435; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5qKxJCbfRdRrH3hTlJ0h5gJEmaH0ng7PGOWlvDUhXUA=;
        b=Jk9klGgU8GCrKZmkFhs0ofHkPl3C52FsJVCvOYWx7PjTj+kkHRZn7BK3ECb9H4p988
         csjhO5vqCOnHyVq16sNPNfgZl8cVYqnLVh4+/AHV9f3DE9YZvzU9C2PAdvtWZLzVOY/A
         bjIMnQcvaPVD1Qts2AKCN8ddA2CkscjuAuKsphVYQGjG1qBF+4x4CVQzzI3Job19LEek
         z53oj2K5xfKsoaROJGrQx6CkAoA+fDmIuqWeUEPVFPYyr4U4NFnyuVYmRZ+i146NycjI
         BdJpjrCCZt+2KcxGL81Wg1AiMeSmTJYKbQaHv+5d9SMe5vII742HyniZsixYbPk6IsCs
         M1OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793072635; x=1793677435;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5qKxJCbfRdRrH3hTlJ0h5gJEmaH0ng7PGOWlvDUhXUA=;
        b=LaOe8jy9LZF5LWHSFQhmIljSxNzV8ziczJzf2BOHk9Bgx8MMeHeFU35jroRaA9GOw5
         pTC2rwRwIvG/jonbgEK0ju7ku4fVYCm+1ExztHvyKfCvRY57vV8XAWYzeFJSeZBmlHFB
         eMKkv6I1dkQhBBsWVc48Ext6mOP3h6Zdo/v8X1IsGrXA5nIcBs72BndrRLWQEjjw9Sz2
         rV1OMZ97jlaRKx7Z6kCaqJrvBpPp/x332HqJ2AXNVUeDj091WbB1o6e8qWrOX4pJtmxM
         MisbubvQ7mQIC9nyXlh8GqzjG77RmisZszPO+rAgnKBQUu7h+x1mBX+7Aw1ymdmsBapw
         b4Iw==
X-Forwarded-Encrypted: i=1; AKwUvBzFBSdzjI/zXFvlV0CiKdnbfwJglgPaNEnlQBc9P4mRc+UybAu58vLlDbh7XJkPjBQkY+mnoFn/YhZUgZo=@vger.kernel.org
X-Gm-Message-State: AFq9FYKgd4KxFdrQ3/pqP2BV4i7tidHXW9wK1pwEUkAuywMgXD4utsT6
	zrlc0apwB3pJU7by9K0GgZ+9ExeO/EqxNmoAjHdl6CNCOLoe0zSj5IFPeJ7eJIh8PJCr527eP9X
	5kUHDTATP3EIhRMrrgUlalr91Yr/d1TViOcwxhBT1
X-Gm-Gg: AYBFou2/Iue2q/Rega9YAA6mIQqip67P/fjx0MM9IX1BytF9dqiY5xnW+wZA9Jwmscw
	Dm6tnkkbvW/XYQHxfu47xirX7sydhmjjuHTw3PJJnyqn9K7O/YOCzH1TqLlmvXXgc+A+o1CiEIj
	B6yZRz+oxs+J44T1U4/iGG1912NrY+4/hsVElZ8R8J/nm1pJtwIkgnOIwnU2sGrUKn0g5DPTdRO
	laxcKGaCq0elBO9p5BRdjxKQwjJgEK55sntdMRLoEBbhAsEVn5YZVacd6F5S/8VZ+kT5agez/Bs
	bYqhzFcFNLnJFDzZQXGTac4A7fMYdiyYskBzXfrMiH4/Vyy+/DV6H9/AaPc7JBtuW0Dv+EkdrN+
	6X+Q7Moix0krYNN65cZ2HSwXxH6ZmnhxQR/2QArecqjVs3zUolKXp5B52Hi4iIACrvYeuwg==
X-Received: by 2002:a17:906:794b:b0:c42:4750:8d49 with SMTP id
 a640c23a62f3a-c46bde3aeeemr1002596266b.25.1793072634757; Mon, 26 Oct 2026
 20:43:54 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027024635.366900-1-prasad@arista.com> <179306948792.3327.2977782192715102568@kernel.org>
 <CAKh1g56_WiP3gTMbcWkukb_tK9Fnun6NqLAQKWdU5o2ECL0veQ@mail.gmail.com>
In-Reply-To: <CAKh1g56_WiP3gTMbcWkukb_tK9Fnun6NqLAQKWdU5o2ECL0veQ@mail.gmail.com>
From: Prasad Koya <prasad@arista.com>
Date: Mon, 26 Oct 2026 20:43:42 -0700
X-Gm-Features: AclHuK-1EqxydWR_WSLPmaEW4heYYjA6apJgh5zMMaiBELQB98cyhu7hOmmOXQg
Message-ID: <CAKh1g54bKZYQwyAS_t6FSOfZvt0Gn3gUWqnwg+6Nv4qTT3C6NQ@mail.gmail.com>
Subject: Re: [PATCH net] macvlan: fix allmulti reference counting in passthru mode
To: netdev-bot+sinfo@kernel.org
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The issue was observed during development testing with 5.10 and 6.12
kernels. It was reproduced on Linux 6.12.68 by enabling allmulticast
on a down passthru macvlan, bringing it up, and toggling allmulticast
off and on. This triggered the =E2=80=9Callmulti touches roof=E2=80=9D warn=
ing.

> On Mon, Oct 26, 2026 at 7:51=E2=80=AFPM <netdev-bot+sinfo@kernel.org> wro=
te:
>>
>> Hi!
>>
>> This is an automated message. This series looks like a fix, but its
>> commit messages seem to be missing some information:
>>
>>  - How the issue was discovered, e.g. hit in production, hit during
>>    development, syzbot report, manual code inspection, LLM or static
>>    analysis tool scan.
>>
>> Please do not repost the series just to address the above. Instead,
>> reply to this email with the missing information, so that reviewers
>> can take it into account. If the series needs another revision for
>> other reasons, please include the information in the commit messages
>> then.
>>
>> The evaluation is done by an LLM so it may be wrong, if you think
>> that is the case please reply and explain.
