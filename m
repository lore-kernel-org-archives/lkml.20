Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794497072;
	b=wlVJ8AU7+5wIuvBx77gMEn8w8EcRVvrPKC9kdbJXfuzUzV4KtUjYzU8dJLCf1EtRizfv
	 I5jYxZL4NaiDGLJtMson/1AfJiPUNpIjs9w0hODMnk/Gbcf0owAr6bL4hJHqarfTML8/n
	 WhT7bWga66Z15dgKjTLBCgaoxFjRqZuEtvRLioeB0G3ZPWouAnT12Hx8nUbTZy/y/eak1
	 E++eLG+ApyQvrxZ7H1NhWgyQrW1pVViWiH0f95OWJ3oNk1zB7r7cgyvvkRyTina86uaJS
	 0l/Aq+2WQgep91Wywk4HR6kMjyCFO9D4U8Ln5EIPlVkB5nGKhUS18b4MYWYU6X267NQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794497072;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=Q/hSB00nnXY/Rl44MkuXrGpYIad8DW/remMu/2suJRg=;
	b=W3FaC29Vnt9ezorOmSQ492ZCh00wgbncaedVxG6rKKRBNHh83f7elE09Sbwp4Oxbwqnj
	 LvQ4Od1q2/zvf7v8dy8LXMbSH3tm1ZXLTNEgLF4fMjLoYP3zkIUHGBGYgQX2qE4UxGPnb
	 r8AM0FbJWt5eyUWAHv/JqUJo4NB+97Don9Gq8xQZAVHX0LsKBe9OWrgYQGzwdN9K3BExv
	 lV//2IXq0gkNuSKRh//90JmxGq87v1ErROxaxl/a+hEdEaXWih5R4WEa0D1MsK5gDWbGh
	 LqYnWesz16MLFWUuxdSoKX7W7FTvAMt3+ST0tM7ohG7avbxhNV6YhBIOaT2op8zQoew==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=LLKpbhIj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.178
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA04160A2607
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 15:24:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA04160A2607
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=LLKpbhIj
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-8b30cbfa628so50290097b3.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 07:24:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794497070; cv=none;
        d=google.com; s=arc-20260327;
        b=EpX7Yo2DDkFmXHHZ3d+ycmy6XA97ia7vz2rDMCRCBUPL5yewpwxdfYrkh9evq5kK4S
         r+qUPwwVYxF4cC26S4d56gxurRsFbHE64UQwaqbGiFVj3neYWrxLtwLPMRuh1DAEUIVA
         mrI8LrIBrrkGWvh33kmQ//yR5Ak0AOwnJF8g1AAhkr7dtMljxjJbTICTdJkaKt6T98Zu
         Lbzqzdaf55NEF1OAitUgComJk9cKav4DpxE0SqqX2n0slkyL+EmwECIVDb0lMvMs3lVv
         cMrP3D0N9kb5ho36Ansq4LjR7jbKPS2GACgjkPD9hQ7dkbQ0axWhbry8bG1ysy3G+DZM
         TimA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Q/hSB00nnXY/Rl44MkuXrGpYIad8DW/remMu/2suJRg=;
        fh=V+G5VGflRPwTJibyo9hluHwcXjfk6Q0pULVkFdNZOJ8=;
        b=DL6qnVpgd0e5SgP0ZhHvjnekUgX3Y9GhlW20A327Vm4P9T/o6eKzIisckLb4tPcZKn
         xd+uYt1r7g4EUK84y/CTDhnLmb17iguoAfvbU3XtGz9JLAs/QDX3w+e/ZkXiEwVWky6l
         vq0tdAYMgrMnUsaMhLGIQjxwW7h9T+rrWHLf0mHTXuevAo3azDKwEmJZoPgXMKvSOSY0
         orKl/lgT+vzqU4T5NSGmw6qt0o30BwkB3hMofuzwhAldJxyQ0PVWn8JnQOqx4kc5Jnt1
         0kEVKSVFwzsaSOxXuG4CU8zEQ3RX3DNCMO2QphYZgtySGDeqSuAfawi4WpJBs6kSQLAa
         00NQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794497070; x=1795101870; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q/hSB00nnXY/Rl44MkuXrGpYIad8DW/remMu/2suJRg=;
        b=LLKpbhIjfHDN511rzd+qXmS4GpLMIlIBtVaRxdzlvFKG1BdBXI2pzGayO4Nn8o4ipP
         7lUXGY2QFlCRcjWFEtPYD6shPqmBFkIK1tibVmRHIw4SwoC1GB/1y13aNFVMbTnpq7ma
         rKhD4M8u/AkidxHiiMPqSApmbBzLML5tdTGiRTrHMH27mo6ZKvizbI0MWR4/v0m9dzYA
         dgP5dMuEeoRe9+5WAPkjwoSOpXYcJfjxIlmXgCs46K0vxgMP5EM46gWzNilLf7K4sydN
         p6B0bYw5g+4Q7sXV8xwVVBfLsDz2a7u45970HTYB2UFEd2TjI+FXGzCKydOejs3L8Gg/
         rXng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794497070; x=1795101870;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Q/hSB00nnXY/Rl44MkuXrGpYIad8DW/remMu/2suJRg=;
        b=pZHRjwUXnNn9U339mfaYFmLp1aru3a7wOMv1kfkJSs1eWTmpjdC6Av3dZONI1LOnkR
         YYJPbNqWRHJYhI8NohlntFObHHQbk+sgxA6kBUKfZL8bQ30AQeZV0T9USlm/ECiAIdp+
         kihLOSYHWaRffXRYD2f2BQeOf0NGyJh7GH4kBRz/924hX43bBdjrb22XfM96uWY5PFDp
         8CMAXPKl18cEbuB6VTVH0gXvYBtTzHbzDbFI6yP9S/qznKqoeoGJmUPDRTkk2GqEDQ2S
         MjIesgLcPim88hYi3AoUKkYEYfgLZeD5c1KhAdXp3rdr+zmqaD/NoHsnx/KI0M93zUQI
         I8jw==
X-Forwarded-Encrypted: i=1; AL+hErFwHAD/An/l6QH9k1z096wMxAbSjIWxYZRt3l7/DwUKrqWi3Rf98jKd4EcFmWTaCsjuoksdnqG0abR1wUY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/TnN5ZdOohT17n/cwn2PqMqeZNK36IAASQVKagIbY00NpMsmtX
	+i5LFR4NNrUUKR0mzHprDfK8peJ/qBiYaMeGa8yrPw9iBgf9k+tpfCU2bJu4w4kZ7rwbYR/W8EN
	ZyuZwmYNG1onA1mMwKUHtpzjmdR1CQkvcFZxcSntC
X-Gm-Gg: AYBFou2Q6OKwv4KBQ5127nXo7r4rHInFcvt/+/78Q91TSyu4iBHHrvPkzuo1jrRvD2b
	JDpC6GOqb7pIRs88QJbzQRRUHEA3jbEck1D7QlJG2YjgBg5PTn4tWsNkFKXhby9Q6w9X5stotJp
	mX3ITPB2tqgOEp/eCiMnT8upcTJQyCn8XYfRS2v2G3GI/mDrF/i8XB3rcgzEKXw7xheWIUCit5q
	3Mp7tcIo4YcRrTumLVwXEXDmIgakG6sjYECtHYPUXXcGixeOQS9rYziu7r3JKjlZ1crqX9SJOG4
	IP1patjPllGswUtLU3XRjjWefsuP79rzZbGugEtnkMbyD/CDraKCE73exnm07kypU+WPMAL/Ypw
	jwmAShHDfTCXt5U7iuw7AQpt7xm4/9CPnCKyRCGZpQO3/KNCD20Eom66HqAqE/LX/UjYr
X-Received: by 2002:a05:690c:c4e5:b0:8b0:e55b:9b71 with SMTP id
 00721157ae682-8b3a7e54ffamr43606057b3.8.1794497069638; Thu, 12 Nov 2026
 07:24:29 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112151203.3129005-1-vdonnefort@google.com>
In-Reply-To: <20261112151203.3129005-1-vdonnefort@google.com>
From: Marco Elver <elver@google.com>
Date: Thu, 12 Nov 2026 16:23:51 +0100
X-Gm-Features: AclHuK_3g47BoflRYwHq6Qbj-lhfMZMVmGOOIC-sl8R1Wu2mLENIUu_4Qo3wGTg
Message-ID: <CANpmjNO=L_pCgRxY9FGffqjHirkHCQE6nZL2oSD-b8S8dGwbRw@mail.gmail.com>
Subject: Re: [PATCH v1] checkpatch: Add context-analysis attributes
To: Vincent Donnefort <vdonnefort@google.com>
Cc: apw@canonical.com, joe@perches.com, akpm@linux-foundation.org, 
	dwaipayanray1@gmail.com, linux-kernel@vger.kernel.org, 
	kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"

On Thu, 12 Nov 2026 at 16:12, Vincent Donnefort <vdonnefort@google.com> wrote:
>
> Checkpatch doesn't know about the context analysis attributes and
> misparses annotated declarations (e.g. mistaking __guarded_by() fields
> for extern prototype). Add them to the known attributes list.
>
> Cc: Marco Elver <elver@google.com>
> Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

Acked-by: <elver@google.com>

Thanks!

> ---
>  scripts/checkpatch.pl | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index b8b64f720191..5210b4ed25ec 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -526,6 +526,25 @@ our $InitAttributeData = qr{$InitAttributePrefix(?:initdata\b)};
>  our $InitAttributeConst = qr{$InitAttributePrefix(?:initconst\b)};
>  our $InitAttributeInit = qr{$InitAttributePrefix(?:init\b)};
>  our $InitAttribute = qr{$InitAttributeData|$InitAttributeConst|$InitAttributeInit};
> +our $ContextAnalysis = qr{
> +                       __guarded_by\b|
> +                       __pt_guarded_by\b|
> +                       __rcu_guarded\b|
> +                       __must_hold\b|
> +                       __must_hold_shared\b|
> +                       __must_not_hold\b|
> +                       __acquires\b|
> +                       __acquires_shared\b|
> +                       __cond_acquires\b|
> +                       __cond_acquires_shared\b|
> +                       __releases\b|
> +                       __releases_shared\b|
> +                       __cond_releases\b|
> +                       __no_context_analysis\b|
> +                       __context_unsafe\b|
> +                       __acquires_ret\b|
> +                       __acquires_shared_ret\b
> +               }x;
>
>  # Notes to $Attribute:
>  # We need \b after 'init' otherwise 'initconst' will cause a false positive in a check
> @@ -551,6 +570,7 @@ our $Attribute      = qr{
>                         __ro_after_init|
>                         __kprobes|
>                         $InitAttribute|
> +                       $ContextAnalysis|
>                         __aligned\s*\(.*\)|
>                         ____cacheline_aligned|
>                         ____cacheline_aligned_in_smp|
>
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
> --
> 2.56.0.567.gdb80ae8cd5-goog
>
