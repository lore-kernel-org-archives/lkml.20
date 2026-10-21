Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.208.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1792562539;
	b=OW8YrhUWwubZq/0KOSJIVWLFbI9S3NFkPBuxHlDmSWlF+qCn0HIsoIiB4SzykfWv0cFT
	 m02jxlZQvyJhleywKPXUKfR3Fh/2lAn0TUDdDOpjs1vC8zNW+10oVqVwqS5cBki0Ohot6
	 3G/t5GgGvHlOeNesAnql7oG7m1/jIpFmyGFsn4AMPmGTE+OyBN+tc1N6nNbSyDXeJ+lPA
	 ybikF7buMcVU/VhytNP6ajrbgZrynzRcvwaFu1s68LiAGp/Go0ir1DRF5Sy5IYKUtzwF/
	 W6LQjIHeVUHVXigTq8lClJ3HsVsOCKKHsz5quvjlsilLlRkETmllCkmT/uaCEQugqTQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792562539;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=IacpiwJ4trEF06DZEwSPiBZm3oyojoTJCMDmBR33cR4=;
	b=4a4LQOp/bk9g/SA1E7F0mE2VBJmkyt8NfcwnHtqN4Fl4klX6PJ2LlHTi2AmtsmC6zt8K
	 WbqDU4ctQ/9jQ4Nm23S62vMo0ZXRwlezi0uSy4VuJWcKJUF45/AkNHABawhO5k4ZgCNf7
	 UUH5C+tqBwQ39cjY3I+sodbC7paXb/vPQhBsD+n52r8ol00TFqXItp8pC7QLoGh64UwL0
	 V5zRvVmzOB//Hw0HamEGry/yXcR5DhrjDnsmaX8PwoCrDrmYCVglCL09bK3QaWKbgAG0O
	 M1YdzTEzfFz6dJ1o4PHmBr2VSYoxMDcYAAcQ1aaqQy2wc9mzok4Gy6GButWkzLTQb7w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=q3pkhCUv;
	arc=fail smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26844606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 06:02:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26844606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=q3pkhCUv
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6b1b12de661so7427a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 23:02:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792562537; cv=none;
        d=google.com; s=arc-20260327;
        b=I0Wh/B9Gbgy95H/aWyJPo7yZ6thoDo8av9b+ZtvaJ3/PaBCWR67gAvEovvmo99lFC0
         upjG52z5AlwK5xBpGYpz9USE/ZzcCXpbKgtrRKw2QtP5ni4z/Yka4R6wMH+rW54GI4D1
         QIe7aUkFWU3nNM5QFJm1JrXOo3wqmeRPE00aSNmNmcn8b2S5s0NoXi1IXE4GECa7NP2+
         UmONpyV+yurUL2hJh0WcpuLpoGmMwHttdqQ9mEF6RPLxJuPmkwDo7JvTrZfRmiuszxLY
         0BT3+Yv0RSU+9Z/JVBEVJwvozkpnL8K2bxhRruDia5vat1+AEPOuisdnTDktubr+om2J
         liRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IacpiwJ4trEF06DZEwSPiBZm3oyojoTJCMDmBR33cR4=;
        fh=4NWiyPmlBOgxhzTvWeEjriYVon+LDgXMnxRqcbWAMkE=;
        b=Zv9m+9zjd1Rkjp/gZVFzbk0XvyKlDK+tzROrrDbW1WToIVREdGZojDBH6fUGkP6L1b
         PJj/alx22w0pQaodBAQXvH0KIFKBH3IcaqhsMaMcQVCWBW6jDH2utNvddLZl59hbZ3LJ
         3oNcgu5SSG29kfY6BEmHqd29q95Eya/hvpJ/QJbaUcXzEY//WVX6zc2+lNagXc7jiOdj
         JKKaq193n4TEJdniAH7keFm0iFTETXHfBHTex/i5JwrQ6xe4gK9Z4i3hH+BUduXpgQO/
         Wfe9S2w2V/cg05Z7juSZRpP17QLBVg0iiHpDupS1Uqv5nYtiJ63xzuMg5ptF/96dq93x
         VxKw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792562537; x=1793167337; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IacpiwJ4trEF06DZEwSPiBZm3oyojoTJCMDmBR33cR4=;
        b=q3pkhCUv9nUWBOZccrVMfzeDkaV921iz33aeRXyR17AE1y9cSqfFjgkx+NyopNSRLO
         QOaUT05nQybti3UWD6V4kgP1ewGD3TTnrp8VkN6OR6RxDsTTYIOAwDKZfb2Fmz0QViXZ
         npUW3rOyr3WTDHIlFT4/KQPJMMroas2DVNOQ46D8RJpdtPi+oAxmykdTnrH4/gBYi7y1
         q12HUqRjipCLCo/bs+uO9YCL0K2bTvdmk02L/3tTDEFMlXy7F0n1F9mWNX6T67lJYraf
         HQhvsvGr1DjM79SYNDcVXSoaHnrHCs5vujebegCX8hGUd2mIKbHrhr5jd9g2Mipnwkbm
         CKow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792562537; x=1793167337;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IacpiwJ4trEF06DZEwSPiBZm3oyojoTJCMDmBR33cR4=;
        b=A0xUf3YPeeqPeHIfEYEEpKw8xkV97ji0xtXe1WBW10NMBAozKzYeSu9T7Oe0HF8SEY
         DRh8t/5NGd02aRg8cttFqfuwwSy6Yit5CBIHPv1yk/7Ql62anKLpmouRpmjeeOEiE+JQ
         evkU3Ea9aKXfWQCwiVPs+WYBZ+xKZXIAFTFopv9odEH4obD0IG7bhAWYnWmM3sLkohcw
         Wa1rIwW0sZsVRcs/eW+CDUUpFSBRQ0VJAU1dxLO7eRNVM70R7eitMUv+5Kfqe2dICTNh
         Hh8lKoT6P5Aq/+3qVcIstcFPftxNrCbpgLDFE1woOm5CJLnSAEWqmA3QGPDEJLbp4fkP
         vwyg==
X-Forwarded-Encrypted: i=1; AKwUvBzVDjWSW3j4tID591sDTrMdhXVwOG4tBMwIJL2UB9drHoN+HRbvewB0qiZc8g4cp3GPThv7kaQ4TlUR3gI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKRtu4SSgVfGlYvrTKZe8dGeOsqqdw5caScH6MiI2Qf89iEBUcH
	P9JDPKgda1kbRjPoMGTulx4tavsi1yHNnKe2nTiOAn4Q28RE73wGxqlwhwBeYLEj6HDnC1eS16h
	fNRmB5LAWdF2cqrVx54dG4K7bhmaxb9VSyq9wmbGD
X-Gm-Gg: AYBFou2hbQ8YDDx+HbjdktYQSGrguYadzvQJc6U42JdYVm34yetzFMn2ENkB5MNpW+C
	aNdfgJr4Zwl13UYKYf22WJJ0o09EGB9uyUgks6BQPJ+nHSJpD2ZkmpP0fYh6klwfCGt/vk3uoDy
	A9YCEvGqr72woZNsgxeTAgPF4wR0QZ3tae7tPYDR7+rVZJLcgvRvTIOY77y+1N8Nifd8zVc5JjI
	bNesLI/VaWbX/inJxrn4mcmdeikbRfGjdpYX+GNabzcGPCpoo1BWyZb6YaeWHPXtO3NVuQK2Ljl
	Lw+Y/vaEpzNTS87asGwKk+A9ivw2owP9WweVAjd0c4YAB+RuZpKCLctjvTrUXpDeYztUkBNLs3/
	miboMS58AvFB79/BI/0WRZE3+cvqfDTm8uuH6DSeZNorQneqChdwiJR6RKmvmtf6jKVLv4qQ=
X-Received: by 2002:a05:6402:14cf:b0:6b1:bbbf:25b4 with SMTP id
 4fb4d7f45d1cf-6b3e5a5474dmr95391a12.6.1792562536864; Tue, 20 Oct 2026
 23:02:16 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020163835.4076594-1-tavip@google.com> <20261020163835.4076594-3-tavip@google.com>
 <20261020182043.4bad43c4@kernel.org>
In-Reply-To: <20261020182043.4bad43c4@kernel.org>
From: Octavian Purdila <tavip@google.com>
Date: Tue, 20 Oct 2026 23:02:04 -0700
X-Gm-Features: AclHuK-S0Ui5RYs0FXdYffIYsww7_eDbtV_O9m-OKB2qGOVBMwFfZsAC_baGNN4
Message-ID: <CAGWr4cRLv8k8HHnz7Euh4FC+JXoPLS_vGpu+3X=ORZSats=XCQ@mail.gmail.com>
Subject: Re: [PATCH net v2 2/2] selftests: net: packetdrill: add test for
 negative sk_forward_alloc in tcp_wmem_schedule()
To: Jakub Kicinski <kuba@kernel.org>
Cc: Eric Dumazet <edumazet@kernel.org>, Neal Cardwell <ncardwell@google.com>, 
	Kuniyuki Iwashima <kuniyu@google.com>, "David S . Miller" <davem@davemloft.net>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	Willem de Bruijn <willemb@google.com>, Wei Wang <weiwan@google.com>, 
	Shakeel Butt <shakeel.butt@linux.dev>, netdev@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2026 at 6:20=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Tue, 20 Oct 2026 16:38:35 +0000 Octavian Purdila wrote:
> > Add a packetdrill test that drives sk->sk_forward_alloc negative via
> > tcp_collapse() on the receive queue while sk->sk_wmem_queued exceeds
> > sysctl_tcp_wmem[0], and verifies that a subsequent non-blocking write()
> > under TCP memory pressure fails with EAGAIN rather than returning a
> > negative copy length from tcp_wmem_schedule() and failing with EFAULT.
>
> This is failing in our CI, it doesn't need any packetdrill updates,
> right?
>

Hi Jakub,

Correct, no packetdrill updates are needed.

>
> Here's the AI report about the failure:
>
> The new packetdrill test tcp_wmem_schedule_negative_fwd_alloc.pkt is
> failing in our CI (both the regular and debug kernel configs, all three
> address-family sub-tests: ipv4, ipv6, ipv4-mapped-ipv6):
>
>   tcp_wmem_schedule_negative_fwd_alloc.pkt:105: runtime error in write ca=
ll:
>   Expected result -1 but got 3680 with errno 22 (Invalid argument)
>
> Instead of the non-blocking write() failing with EAGAIN as the test
> expects, it succeeds and returns 3680 bytes. The kernel log for the run
> also shows the test's memory cgroup repeatedly entering the OOM-killer
> path (try_charge_memcg() -> mem_cgroup_out_of_memory(), "Out of memory
> and no killable processes...") from inside tcp_wmem_schedule(), rather
> than the write() being throttled and returning -EAGAIN as intended.
>
> This suggests the test's reproduction recipe (tcp_collapse() driving
> sk_forward_alloc negative while sk_wmem_queued exceeds
> sysctl_tcp_wmem[0]) isn't landing the socket in the TCP memory-pressure
> path in our test environment, but instead in the memcg hard-limit/OOM
> path, which the companion fix (clamping tcp_wmem_schedule()'s return
> value) does not need to handle the same way.
>

Thanks for the report!

> Could you take a look at why the test's preconditions (buffer sizes,
> cgroup memory limit, write() size) aren't reliably reproducing the
> negative-forward-alloc + EAGAIN scenario in our VM environment? It's
> possible the memory cgroup limit used by the test is too tight relative
> to the data pushed through write(), causing it to hit the generic memcg
> OOM path before/instead of the TCP memory-pressure check.

Ah, looks like my local .config was the issue
(CONFIG_MAX_SKB_FRAGS=3D45). With the netdev CI .config I got the same
error and OOM as you are seeing. I'll fix the script in v3 to work
with both 45 and 17 skb frags.
