Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24FD237F8DD
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 07:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792137256; cv=pass; b=J+BA5jzVld86BPNm2qCiOhRur7TC0WRXYTkqmov+rT9W6K5BtBlXECGZtEldVZqu4JOrel8ShhxwU7PfrpKIViry8cIxZtmW/QNiFOjT+3nVHc7b3MuuLLYBw/7Qv58BbFHZaywpzunMvW9J8zUWSW3bHHgwLB1h4N6JBrgGVeE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792137256; c=relaxed/simple;
	bh=KLwhpQm2UjBGZ/IU6JuN7xThtHaXDHsHEC+uZW/NhEQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tj40rJUiDMWe9tmi9erhbzQ7b7DLmnd2O3l1V9d63XsAonbas/9GgFOI3VBt5+jPMSPeQ3VbrYUQwbzkWYMvhIFz3rhhOkfuibDUcbX2LFwDB/E9wEU8VMJq5JMNy3qber5Ux/BhtkqGa6wbcGbHT4NzKeucBBLdRMeOFISBaM0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=weOufLrx; arc=pass smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="weOufLrx"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-35f036b17easo1938705eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 00:54:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792137254; cv=none;
        d=google.com; s=arc-20260327;
        b=MWEZRmO9T0Z2BZTKWzE7uP1hINpHICc5K0kaif62thXk7ZT6Kn6MMoHYQYLLsL+eQ0
         VfTBT0Fg/SLWRLV1jKVmykcwd2R67Dm3dzDQZp5DweRMIxG6WDyOJKShCh/MFBq+nLIe
         QcVuN98KVh1ed9C/dVlj/q4ldf+9Dnfid1gfU8mpnYFoXB8NP7Lqs8ZjNbjc3Gc/ci6s
         cs8gLLIRyI80v7z7dHEAUdXVrailsHrB6vKaZXUgI9/JjF35GUQ1QBhaILLuzyjOephq
         H+Ts6yafctqqb7xAiqC98zkpFbndW7kxwyHSSDDbGaov1w5XaWpZC9MzT+R9ZjpNRddM
         SSHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KLwhpQm2UjBGZ/IU6JuN7xThtHaXDHsHEC+uZW/NhEQ=;
        fh=QnRosBfvOpK8UHt9s6XFQbpV3UdT3gJx+jFfPNiwhKc=;
        b=HH14CEGst8vmtfJ9pMxjjJQq3R3zsSj8aknYUw1oeH1QsGJ8WzBQehtEFBTl0mAH5l
         LQL7llrLNkdfJkUlsN7xyokrvf4c/ndyVXoin26UcKcdwWa0JMBme+Z/MToPYB4kznyZ
         wDvKOP5Dz9LUqrRt5AbZc237dmBIQ84gUzkxkBFwVQctUJfx8LsgFT4YH2ZmCf7x4iro
         SdFoLio0holL6ZOVffCxNy1Qd85+niaEdg+3eKHD7c/SN1fo/Na2dIwqP2sJRCOI7T1o
         +7z45jpmU+kdGaDs0tqzapl7ZOcm7du0oEoM09Ei/F6syv1h4upcnqVZ79/2Yu9AtYrA
         4y8g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792137254; x=1792742054; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KLwhpQm2UjBGZ/IU6JuN7xThtHaXDHsHEC+uZW/NhEQ=;
        b=weOufLrxmXvntHLb6aF9ExyGYiZIKUoo/wDEnuwclKkgTxCAGctFjtSmJnXOS72Ofc
         qZqnR3IbGTjlvL1FnptfQqgOTN973+u6UXJ9zdgnALbBjg+uqkQchzrbOV1dhocS0hyw
         uiDYJcSljRap9nMVOV5hEPLDefUO5KIt3eR9xoSTS4xCWPojXifLN/F9ofzDC2QVyN7z
         b4i3UOnks6IZa2Y6GpdDRL2zfzDgNh/Pv5KxZtkIg/UtnekGCrc7bAyUUzXwD35Vy/6H
         oQ9cWw9bFOC23EeU/454+2xR2JmYSlRXkTiZnln9xaq5kMlVMLIHdzcfhxxcE886xcE9
         P+CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792137254; x=1792742054;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KLwhpQm2UjBGZ/IU6JuN7xThtHaXDHsHEC+uZW/NhEQ=;
        b=1RGe87aCmTN1s5z7PWEn1nXDSwKI0A2QntpIq9fTBlYFGYL9NehShneTPQYdJj/rlu
         WGSQ2cBcjh472Ga6EIZNTkII5Emg9wV1XNG17mkWoL2x9g+LPy6UQAq3rh2/Q21DKNkg
         iAk4G+8EIFvj8dbIv31Qqtnxr18GkJ7882WIiU8s+/TCgdsnZ76Odtrxjay4IDjr7Eie
         KZYPho3Ffaa0+0cxb/M0MuTNKu7/OoUxhD9O3jksErKZZ98x4tXNv+LNZb1JlSbGl+sQ
         KZv/+sYmfv1qLSh/cIw5N/hKeWnptscMnebGj53kLK9Wc6Jrv8h69crHu2kxhszocwl7
         pdcw==
X-Forwarded-Encrypted: i=1; AKwUvBxC2KEzf7jCb3sjJz9PeMZbM2QGrwEpfQcC7T6DCIp+YX2H8Vz9AumE820KKJv4KhGVdtfY218XcKArXm8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLlPqa96eg3zj9WxSlPLs4CHgSqHkoSJ0KAqFVGYQCh0BThQ6Dr
	HWVu4wXQXQAYAAA/X6EL66v03xNM2XoGFcZVggsELWUedDe2NlPuWgzWChVRYtStp3Z9FBrl8Zj
	MLqPJvzX9PvDmRkYP6L5vcyaSZowMZxO8NsdXoE9I
X-Gm-Gg: AYBFou0tKHhwmSfX9JtwyldStwSn1oDLm2+2dTgAmhqbCT5OJtuoij8rMtu0yjDlJhb
	zBn/sqNi6u35wwlCoVSkL1SAbA/VIAEAOSiD7aH+ZkA5FCjpq5twBzbnxptMO4EzXb+hzGLXp1l
	L2HGRgBJWTueYJzfcXvraTx6LMuKiB4gigrRMs3YFBUqiJ98MTt8KGrClR4b6xZdiVH/m0d2LnX
	H6qlQEa52SYY4qRObq567xEoSpfmRwdVvdlxsUHIaw6ukg9OUD8aQACa31YAA+2nEnp9A8ZlUCA
	r1XBJ4YSRlH8xyufsq0+HW0uZbM2C7VhQNlT19wUwIlfh76vc7ZYLqnS6oh/Ow69C8WeswZ/o0x
	64nC2p4bR1l4iGpBVq7VUmet6xT/Lg1kOmcQNJpoIzX8xblnSA6mSmSIfzHIht14jITU=
X-Received: by 2002:a05:7022:ea86:b0:153:7a27:b7d with SMTP id
 a92af1059eb24-16a626f6e93mr26850863c88.20.1792137253208; Fri, 16 Oct 2026
 00:54:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261015073736.2944215-1-tavip@google.com> <20261015073736.2944215-3-tavip@google.com>
In-Reply-To: <20261015073736.2944215-3-tavip@google.com>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Fri, 16 Oct 2026 00:54:01 -0700
X-Gm-Features: AclHuK-X0MEqM-qiZR_C1C8OlSnnVfLtG_uH9dpCSScAmzQL4uL378qfzqDiPp8
Message-ID: <CAAVpQUCpFC-7J=uEgBfh37hFb5BCJvhJQZx7_YKEDCtvbGrGWw@mail.gmail.com>
Subject: Re: [PATCH net 2/2] selftests: net: packetdrill: add test for
 negative sk_forward_alloc in tcp_wmem_schedule()
To: Octavian Purdila <tavip@google.com>
Cc: Eric Dumazet <edumazet@kernel.org>, Neal Cardwell <ncardwell@google.com>, 
	"David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	Willem de Bruijn <willemb@google.com>, Soheil Hassas Yeganeh <soheil@google.com>, Wei Wang <weiwan@google.com>, 
	Shakeel Butt <shakeel.butt@linux.dev>, netdev@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 15, 2026 at 12:37=E2=80=AFAM Octavian Purdila <tavip@google.com=
> wrote:
>
> Add a packetdrill test that drives sk->sk_forward_alloc negative via
> tcp_collapse() on the receive queue while sk->sk_wmem_queued exceeds
> sysctl_tcp_wmem[0], and verifies that a subsequent non-blocking write()
> under TCP memory pressure fails with EAGAIN rather than returning a
> negative copy length from tcp_wmem_schedule() and failing with EFAULT.
>
> Assisted-by: LLM
> Signed-off-by: Octavian Purdila <tavip@google.com>

Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>

Thanks !
