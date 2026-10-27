Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793081675;
	b=ii+f0OzbPmUjDk1o2mYBjG9iWjJcKRm+GDy1I3Pic9Et0ihXp369HvHn5j6RC4UhLxEL
	 UV25BvCMrj96WhcZ23ulvw3DWpFsYTG3hVMX4kL+1W448qiw0hUYqaSC3RxHWKV2Uywap
	 gUxA60ml5nUE8unha8zXXaAQLgdvAKVzYfMc0NQq9gTLDKLbtHJk935WbC4fwdPqnzBE2
	 XOkXh+XVGy3llEQAMsU6Y3Si95T62/6hyWbdjBjSMVtUb7+phhF0/SuiUVR/8L1qL6dHY
	 omVf287GSuX4pNw9ZQc7O8xulYfpj+KK06TPAn9KbKOORAoWhT7nRsix1b5l0QfH2YA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793081675;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Aj57gDgkYoxrbL3zRJ5xxNDor6hGOsBG1Hto8fARzGQ=;
	b=3o3Nf54f9IhFx9RZ7EeqF0LayAAY4IKbrv9IueQyE2h39lYaqk09FVtvkbCGb75FZ4uJ
	 IfsBAUhdUi88hImoWHVNRKfv0lCKffwazGWhO6uzWT+2WnnHjxl9KhUlp5K+Dutq+dAVV
	 e7R6P7lgG4o7M972+Xj16kTvVvxZjn8fZEud3dOvM+C4WhVnqJpPWXR9nGUR1RuSZwrxi
	 1ior7rSxCoHq4PdFjqnu7qfe6Y6LEwps7KvI683VJuL2tHg45z6OLiaZRzQRwjSCQCYOu
	 3xECnydioo1gKFg2fkunMDP5Yr7SBeiR4PC2vWX3uPjGL5wiq/FXxTRSbXHUMtRCDxw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jujt5EfL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.50
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E4DF606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 06:14:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E4DF606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jujt5EfL
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5ba35c0df4fso3650836e87.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 23:14:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793081673; cv=none;
        d=google.com; s=arc-20260327;
        b=QL8D9+buH69bLgia5sxZM30O1SDMxQibUkNMfUIkZ4/1pouVD5oOBYXPTK7XzjuLQZ
         TOKMijH8OOvLczCqKp9ChO6tTNtGsvWaoi7Mn/vPELwIEVWcCnKtEzdWfh6dA5nt7lOm
         SduuguZgFrHP1WCu9DSloO+RUTm8aFdjRbZIWxwWaPK7PmHXLHRtTPxRAy33EuwudxnU
         RSC40PsX1P7MVO3wLf7RLCBGTxCgnu4993HWVGAiGAvpSSCnVGf2//LFK08pH/yzmxd/
         Qn7lCsPZbrixWlZQOqfFrQAsljmPBZftqxFY0vhYGqZmPRJonyJ+gbAeotKsB63ag8eV
         yTQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Aj57gDgkYoxrbL3zRJ5xxNDor6hGOsBG1Hto8fARzGQ=;
        fh=DVY+hYJ8/1G9cOZZvJVBS1rh+pdCrKVuu9vGfrViWMc=;
        b=IzErtN5rhdpdZTDn/GyQvLLVC5KrLQ87N5ZmyL+6NTaj3ipmtWJ/9Y19fM7Mmz9jCa
         Vtx3NvE9fx18WhBEzK55Bu+mKgNiUOhNMfomfZtltE1HZqT4P453v3p6FWqPpOoc9feL
         QZtbGI5jJEmvMr50vT1WwTNEHT/3qKxLqVki/C14/+NcabeoT56F4sbkj6HLuJ+wxfyU
         XjvfPeDV1KUrmA31vrF/LrjO2aHXc9JLHRhbzVIDEEzuM1nl7cs68on2ETVRQ76PKx2Z
         c4pBFghbu5NpSuQDypfP8ZMKXLtpHmBrSW40CO4uid/mNcyYxoVjIDOjHlKNPqYv8jb8
         N70w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793081673; x=1793686473; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Aj57gDgkYoxrbL3zRJ5xxNDor6hGOsBG1Hto8fARzGQ=;
        b=jujt5EfLxkWfiU9Y4LvukWaGftjve6T81Pji1vz5Co5DA0S7dnvzB4wcmrcapqnPFY
         uHN2zOVjKMVDva+RzQWTQ7s7XpRm9IUxWnQ1ncEFt/NX2/bAIpgqIIS9d5+zb8uaBNRd
         u66QVycfeiGTQxRmzNPJW3WuBdHRZBUZeC+gJmW5xrVOzlESZ1T95qbydRaheqpvkO3J
         fcTGZ5NllHVChKMNOWQyUqVQ+WowGNwN4poykAPAJS7Ow1xwV89azF4nau3dDGt6pI1K
         d7lxZbkOBlukE7M841WRhcX04jaTj4wMAVQoI2nANEMUaMSJ7EsJ3/aht8F3X8xR6nc/
         wRog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793081673; x=1793686473;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Aj57gDgkYoxrbL3zRJ5xxNDor6hGOsBG1Hto8fARzGQ=;
        b=DTn7fsOWMTFqZgnfgTrCosJtJalojYDIrwjQYk10CKcG1eXXF/fbN0awyr1vwwgNWw
         1Q857/YJkaI6xZzTLEfg0F6wa1WREKu/GPqcZaqG4T/hl/S8jRqvCjICVPQnhhevYka+
         F7ebqGTSZ6B7yzmXq2ZDZUDb3l9con21FmbFqHhfB/ZueTw30HAbtm4O21Ut7FNsrtWb
         kPZrUb6WY75beu/s6vxygNjIoBZzHqZrQXe4K9CZq09FxJEscxuTwpUklXrpE59yQ3zP
         aHwG+iXvoQxnDiOhog1ZAUBjVQ4HaqIfEtSg0pZI7vCRE4lPSAwdPgm1/Ck6sQ2AEbWT
         BxKw==
X-Forwarded-Encrypted: i=1; AKwUvBxsK+uruTkkDINB8KiDO/Xn2Jp+VZicd0AgzBjvQKlHvmtkDXWLDW4JlRJCLhBHtrAbj7MGHRSro8KhKgo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJwu7DvFDz3iMEGmzlTzPHpDsEzz/PbGZDL4/W0tfzaACWVV58T
	zX65EMwXIq1hq+Pl39l07D8LVF8gzOsuNHJhBJD6pjv7LLnGrZtAsAju+gmzuONKrbVxxBsATtg
	rayguDjM1Jbc9f5ReFWjzdG1Mc802c5o=
X-Gm-Gg: AYBFou3Raf/cB6/SRJZEsRQwGdQaK/7iynwP0QyxnWYgYqZYJcFER0SgvnMbCdNhk/1
	C9mqjdQmG8wp4aPY7ZEG1Kj8YNoP5HiR1lvGD7Dm3srpcK7GiHBAOFChBXh+B/YFhOvYdWM79pp
	sD6KITUPSdmcpXifkuE5b5U5EwOtU2ks5JE1m1X05HF4qnvno7XPsgeEcHJm0iydzAzDsADICa2
	PlGyyqCVzvC2aG/T0F+ggTnXMGHAWWjFHItuprYi9mPP7OLHUF8n5D6QEqJ7zn3nCmkNpygsqwU
	7M5ZqkG8dxD0bOsXl9rdTp6KeXkpHEAVqLcQMK4QRKCJ1ggtxdUzgNOqC4lP1yBce2QQRNAG99M
	KZFaHW61gjuCVdxbPmIW9fLs9G9z51FtogxoagJuyhbgNSJUSqMuD8OY7MMYD1Vt07MwT7ApjAs
	vZ0V2r8RVRmY1q/L1ZA6MTwuWxPxGfPj3KFNV+tTs6m+/zp/V1/pw=
X-Received: by 2002:a05:6512:1247:b0:5bc:f2d3:f940 with SMTP id
 2adb3069b0e04-5bfb71f7292mr3160287e87.56.1793081673092; Mon, 26 Oct 2026
 23:14:33 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026095208.58504-1-yzwlhm@gmail.com>
In-Reply-To: <20261026095208.58504-1-yzwlhm@gmail.com>
From: Jason Xing <kerneljasonxing@gmail.com>
Date: Tue, 27 Oct 2026 14:13:55 +0800
X-Gm-Features: AclHuK_cgrQyrWKFQVlhzabXNnx79zQhN2Alc0sBaVdOJyWNDAmLNbsinkEAfZw
Message-ID: <CAL+tcoCsZs3JL4CdmAP6oNk8eZD9tmtzyeQEeBnb1m9+ypMp9Q@mail.gmail.com>
Subject: Re: [PATCH net v2] tcp: Fix fastreuse cache initialization on first bind
To: Zhewei Yuan <yzwlhm@gmail.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Eric Dumazet <edumazet@kernel.org>, Neal Cardwell <ncardwell@google.com>, 
	Kuniyuki Iwashima <kuniyu@google.com>, "David S. Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 26, 2026 at 5:55=E2=80=AFPM Zhewei Yuan <yzwlhm@gmail.com> wrot=
e:
>
> inet_csk_update_fastreuse() initializes the reuse caches only when
> tb->bhash2 is empty, but both inet_csk_get_port() and
> __inet_inherit_port() link tb2 before calling it, so the first-bind
> branch is never taken.
>
> As a result, SO_REUSEADDR binds never get fastreuse=3D1 and keep
> scanning existing owners, and SO_REUSEPORT starts in STRICT instead
> of ANY.
>
> Initialize the caches when tb2 is the only entry in tb->bhash2 and has
> no owners. Timewait sockets are also linked on tb2->owners, so this is
> equivalent to the old hlist_empty(&tb->owners) test.
>
> Found by manual code inspection and confirmed with GDB. Binding 16000

I thought it was discovered by an LLM.

> SO_REUSEADDR sockets to one address/port in a KVM guest takes 4.18 s
> before and 19.4 ms after this patch. Existing bind/reuse selftests
> pass. Analysis and testing were assisted by an AI tool (Codex).
>
> Fixes: 8002d44fe84d ("tcp: Check hlist_empty(&tb->bhash2) instead of hlis=
t_empty(&tb->owners).")
> Reviewed-by: Eric Dumazet <edumazet@kernel.org>
> Signed-off-by: Zhewei Yuan <yzwlhm@gmail.com>

Reviewed-by: Jason Xing <kerneljasonxing@gmail.com>

Thanks!
