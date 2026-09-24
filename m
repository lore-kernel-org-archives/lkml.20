Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AF1744F570
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 16:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790268402; cv=pass; b=TWUqRp+QzuN2byLv1zvBTDFpkZ007zINingfQGQVeQpyTCs+zecbxa9z6tJrUd9KpHAku79Bk19KlLgrOruOFUUF1PAx8TSIgolAx493dt6s3ODV1EfwKtpa+4ur+kEY2SMRxFGh7mxCvRRt9ollKwETJ/1pWNBbeiwCQJRqoqg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790268402; c=relaxed/simple;
	bh=1cXW3vatV8F+/xKYHsIZj6m0oENun3ZkfwN0yguL/Jc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l+g1KJ/Wp8MuR5EXP554vFd8mwinCq8v/weWJrr/JENi4rYd/FfvQJemG1pWYHvA7CKFtX71vRSEzLjQcVuh1Sfbp/ZBHeXjsKWXw8ZjNyeROtXGgGrivmANPNT4W3Q6RNCyHPjd4qymMjIj0nyBGwOV44Yu0xCk+MzGi30ur4k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=W/xn51l6; arc=pass smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="W/xn51l6"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6a9d74e8292so13412a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 09:46:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790268399; cv=none;
        d=google.com; s=arc-20260327;
        b=PhAXsam9kvxDhWCjVK8yXmSf655IdspcLhfYpm4qpuoQWzLPpjbOxkZ5+oCLqyLHpH
         lrujSrsYw6QEghSLcKSa0DGI5wlBkn+1iSPtejhLtjq9+WxT06EE3xyj9USJAM/Ka208
         vO9/UZLLTnpbUtVFwRcVIYJxDdnX3USB6Z/0CKZfrh8Acsy7rmIPotgNcp/ECwicCGvf
         cOUiGr45eXAwiaxsTXqrGmPoRI2nY36JzwpxZ+7LQG83kVMPsd08XGpGrCkQGT8dVdCF
         7igivFzlmSVr0GCpd0nuOaJ7OjpUCfeHEvFfyDI4iYYMlAh9kTbrt6Vqyhbmu6+JxWTK
         /hig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1cXW3vatV8F+/xKYHsIZj6m0oENun3ZkfwN0yguL/Jc=;
        fh=d1fyxLgtL4iFbYON05vnk8+FlJ9lXy2gwa5W2S3Xa9k=;
        b=iFSrR9mrj0HlCDqBBlKor96OQZAbTzzZXuD61LQVRMf3IYlKgrX6wHOFUAaqeNslHQ
         /Y/Fxg1pS8swUIxhclLGs7AryG/fZF4v0FyLC2QXiyCMVDCr1q+bQX7qAWYfcwAjQEFI
         p0LLEkWteeCRd6NGWhYdqWWEC11Jp1T/8suBbU4OGSPLwQPue81zXRTzXO2SQmN9jgRy
         iwdGeNH2nTM9OhTKZmn99YoZtjZiZAYcTr5SNVbib/TLcFcBiNtrSh3OrWO4d++51gQu
         lTJsohsbnza1ASZ8Lrz80Zf926N7RN/emWUKaAYo/VEDBhg1BRzZi+4G9KFstcJAmnYq
         w1iA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790268399; x=1790873199; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1cXW3vatV8F+/xKYHsIZj6m0oENun3ZkfwN0yguL/Jc=;
        b=W/xn51l6NzSVih2HqUKdXGxxmv4Tmrv+s9GKT+U2sVRnYb6kjsQqjfomhLL7OKqLrG
         iRvRfa2wKty6g/b69ByMQYVJfkaZnJPOrv7yBvpZBC95kv5LDAPdD4mAvJgbG51cHXjw
         QNR2KSdquQeqzvbe36+RKwMApMamenkJfN9UGRSSFBv+b7ffUEs/X9hBqqxpuwMyOhp8
         TeQ4RosMgzmFeCNPxn40ZB0/kwTyt9r9/DKs+bPAGkNQmVUmRb7rC7qlfEbTLPvM8Y04
         3uogy7aVb4Z+dNZ8w8hoRLMV78VdDBUXsRZ27I9ehpImH8BMlBWKy54iikmSfrpmuqZ5
         DFTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790268399; x=1790873199;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1cXW3vatV8F+/xKYHsIZj6m0oENun3ZkfwN0yguL/Jc=;
        b=Y5ud7TD5chfXRSBs8R9hwO+8TevuroF243+a+n9vDaFIH280/El2flsazyLqO8RYZ3
         A8bDrPnm7ZdtOPMGw3twKm6tJhhMWzjPrBX4pQtD/O04L3DIfMhxsCea8GN7jBXP/JwK
         I/nS5INKU5aKnwHS0mJqwOhXxxrI7V5qoxO+O5ET1w1MlEPKNjLeRdTXsAcHwoa4zlP/
         wBigyj2KORFj925Uw977sBicy3ld4l1CtmeGazHuQBwSOKqgGVQEF4071tKc99l7nHp/
         jlaYi8Ru3hMvk+rIOMPLCngZ3bMKunX3+YyBzGZXFZ+f7g7ip6oyLvmanaJ5dT42v2Kv
         f0sA==
X-Forwarded-Encrypted: i=1; AKwUvBzEODlY9Qos2YM/twgExfDcHPz4BNsJAPsVWWSPl4pKnl8jk5JcFEAPm3U1V4j71qVm+57h7ZGT184D4Tc=@vger.kernel.org
X-Gm-Message-State: AFuF++nUXuniRn0CIu0dW2yzZEYUD0eslHowraSPq7NoFUHq2IkTy+Yi
	hd4qJ2zKg2DJPd3GE/oj5jwrjKcdI5tKfGDVFWsFysfJ20Lzujc06fFbYiFeQUHIaLWMYvreaCg
	Q6SbPy02QTQLz18jcCcD62n3gQfmCBnDWJvptdNYl
X-Gm-Gg: AYBFou3Ek8r7Qc/9xEFyG+buGHZQqYnCb5Gmr/oP7dIP/kCZadqDowsQD5evKhzkmda
	mmYp3uuJ8Ti13RQ+ee29XLvIhtFM7j9Z3qT2tSJsLX64Hh4MyAiPcQx0Vb8pHq6Jh9JSoQIszFS
	SOTalunM09I5gQosWeNwiJBKyBT3UxVcGTnPoNTwjdfRe5sjiXZeEHnZi30Ekak/cJDiU7allTH
	jQsAsfjo/332eFlutark1BhHu6a8MUtWImX9JV3FGKLfuadi0nz6Niai+cIO7yp7zaB9bzjJ503
	CvZL7Npn7q5rv42n4D0v8oLNSSqfwJpf7k9o6qzxJbD+mPozZvViNU6vU4fe2W/8YITOGtsfe/e
	L5i1kdA==
X-Received: by 2002:a05:6402:3245:b0:6a1:4eba:f09e with SMTP id
 4fb4d7f45d1cf-6aac81acde2mr45538a12.7.1790268398282; Thu, 24 Sep 2026
 09:46:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260922204348.717198-1-sdf@fomichev.me> <20260922204348.717198-2-sdf@fomichev.me>
 <CAHS8izPwLBCJXM_0Df8P6S-FVwAq+TaRKn3uTh1h=33Ffj8VmQ@mail.gmail.com> <f566591a-cef3-459f-a39e-86addb0c5d7e@gmail.com>
In-Reply-To: <f566591a-cef3-459f-a39e-86addb0c5d7e@gmail.com>
From: Mina Almasry <almasrymina@google.com>
Date: Thu, 24 Sep 2026 09:46:27 -0700
X-Gm-Features: AclHuK_lFxOWKHj7XdxYi2ldzbsg0ymUR3nA9hy0ZeSa1JCd6RB5vZNVqgY1d-8
Message-ID: <CAHS8izOwo2NZGaxtxaMcjDu1APY7ERLjsHN4B_Oucqs4jZafqw@mail.gmail.com>
Subject: Re: [PATCH net-next 1/3] net: netmem: add net_iov_area freelist helpers
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: Stanislav Fomichev <sdf.kernel@gmail.com>, netdev@vger.kernel.org, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	hawk@kernel.org, ilias.apalodimas@linaro.org, axboe@kernel.dk, 
	sdf@fomichev.me, bobbyeshleman@meta.com, kaiyuanz@google.com, 
	linux-kernel@vger.kernel.org, io-uring@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 24, 2026 at 8:41=E2=80=AFAM Pavel Begunkov <asml.silence@gmail.=
com> wrote:
>
> On 9/24/26 16:02, Mina Almasry wrote:
> > On Tue, Sep 22, 2026 at 1:43=E2=80=AFPM Stanislav Fomichev <sdf.kernel@=
gmail.com> wrote:
> >>
> >> io_uring zero-copy receive and devmem both maintain a bounded LIFO for
> >> net_iovs in a contiguous area. Store the freelist in struct net_iov_ar=
ea
> >> and provide common push and pop helpers.
> >>
> >> Leave synchronization to area owners. Keep devmem's area adjacent to i=
ts
> >
> > This could be a follow up change, but I think synchronization should
> > be provided by the netmem/niov infra, rather than the area owners. TBH
> > the infra providing an unsynchronized data structure and letting the
> > area owner use it and shoot themselves in the foot feels error prone.
> > For now we could use a comment.
>
> I don't think we want it. The duplication is minor, but I'm not set
> on the per area index array approach, and it'd make changing it
> more difficult.
>

What is 'it'? I'm guessing you don't want the freelist array put in
the net_iov_area at all then? Because even that change will make
replacing the freelist array hard to swap? Or are you objecting to
just letting the netmem functions do the locking.


--
Thanks,
Mina
