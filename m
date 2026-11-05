Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793876690;
	b=J4YEQbRi75gocCjlkHS7KMHSnXdrLnP5r3WHjO52irrZH4qIfbwCGI/+l9vS98+V4BDR
	 K2mRSyfpOwbWHEPppePPFtYKTxEt1wgviErJFLh9cjKp/cYBWL64uR+MUkX36RgF4Ks0s
	 /IQuSpvZcYUd0GWybjPnHjp4n24c/Gov1R4S0uQjvv0Pp98SnGLPksmjG9XrhV1Up+pTO
	 GjDfe7adc8zSaZEC0Oe5VRgL/cJANsrhmwaGRsUOt3kE1ETC59V75ECjft66W4ObcsRTo
	 FYjttVMD52VPzrNVYcT+4u02hILPHXm56sdQmMFN81sVPo8PFCepvonAHtUsJAHKHsw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793876690;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Received:MIME-Version:Received:From:In-Reply-To:References:
	 Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=0am8CfLTgv92qkgop5G7IfmmvPUqaNxO/vuHRyrSZqw=;
	b=PPgiuDbW4O929aMJ9cHj6mnSafkaXNoh48uRTA0tScpgdOW3JkE8Avz238Njqt77s/uP
	 BsYijRBCxpX2yIKwKfn9BwplB7FyoRVJa25jJT3wsBv0NGm/lbgi1xNlSN2v9MorekAop
	 buzYfd6/oXc1Bh1UU8+GF+aA0DPUM+wj/bP/7AkS8hNeXBdpfhbAHTVUj0HW3MbBVKpcU
	 ySMSWShxE2h6TAu+KiQUMaJmt83gPFjNLeWBmUVO2i+mFwTlezCRB11A7SAz4dI0XguDz
	 2phg8wEXDvflwElJhUE96pdec04wuritZBjPWKF3bPvjPuphDDbFfbjw0MHQYSgoZvw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b1PlvSnv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AC03606A329
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 11:04:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5AC03606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b1PlvSnv
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6acb9c018ffso898885a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 03:04:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793876688; cv=none;
        d=google.com; s=arc-20260327;
        b=MfXX4HvlDrPqrxRBPXPaqBInlZpjwWzr1d6vSA8PMGgNzHXWmPi9TzyinIA5CVniYD
         dbdlIW3BrDo1TqEe6hRGU5CBpZ67GA3IFMy98/MWisVQrMAeRNDxiKwb4dj6kmsSoWez
         BGL1L4GHnwdGpCaOwONdupmuIBYIBj44E4Mo5dBn82B3gBiJfnIIY+8rNqLoKARuM0+Q
         tVarq8gFN/uEClrvcdn19azTYqWykosTYbG4n3BfAoyCpxHYH7WS5JlP1fL3HhtOwShu
         Bz5k09ISyU5u2B/mIGjMGuayJAhXUrVhJFy6Lo8GpPV+MSce3CYNG/c0rPxVmLH+m5x7
         l/7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=0am8CfLTgv92qkgop5G7IfmmvPUqaNxO/vuHRyrSZqw=;
        fh=FhskCF1eF9YBVKK8SceAhNpD4VirHD8YqE5GEpnL1G0=;
        b=aV73B+E+7X0KxUys/LK99IpmmHe6+KCtEQymqDci8Y6DusKX28mPu0eB6sdtWCtT1B
         e1ydVdLDkfI8VI2Ivk05OP9rwf6rd1TPVPdFuOs700IXje6TxOq7+aT0/FUYQ1q93OB2
         LjxMCssfjWmlIwuUp7Id7N3IIPwuXMuCNqWxR5pauj6mEP+2qCFkB8VluqL4hGPN8ScS
         tKZxD6WM18rlmZ+zGUS3hM5xhZZ8NC21bjopcH7stL+V2d1u6YocqtA98LHiWfoP8z+3
         I98j1EJ1z7GUPK6G6x9RKCynPDm73i0gE9AgJ+Gs56Kj/tqQ294nqZMN5mrgFpW8Sg7/
         kEbw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793876688; x=1794481488; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0am8CfLTgv92qkgop5G7IfmmvPUqaNxO/vuHRyrSZqw=;
        b=b1PlvSnvndvaZQXsu8PAy4yevw7hV0/nJeaKI7uWTPJjANe+cSJUoyFhDheZjkMPON
         Gpq2TLF5sZHYJC6MeRwCp33wmE5/YK8jm7Kozc4HAKBY8aLyk6TmEdoClGIVNzCJEXy6
         LO7JUMRpgYoSqfA6c/eGRgTL/ZZjeVhp3y3mPBOI8Bh+sMXeLUV8MbvfprFiwHdRqRE+
         3u2znYOuR2n2iOUSLYFPhA5OVfrZMR9KY5sokvZI4/z0THslW+CDXmfnH6WXYOtHqBgK
         F6dgEbmqptVpUrrkes75CgdmCu7vmoYE4i7E6AV1H/B2HDVS8sTrJgwQllSEgZUB+t3P
         EO0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793876688; x=1794481488;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0am8CfLTgv92qkgop5G7IfmmvPUqaNxO/vuHRyrSZqw=;
        b=MrNTxP5K/tlDvlW+FPQrQ3wFtHGMvdCfv0Udqz4SmeNSB+iTHmq/+3f1HlWNwwpjAv
         KnpoG2tsS1ztA/q1dzdDQMHHI36CT3F3DvvxhGZ3C0HxhpSMhrSawhw+mTg85I9wwFMP
         xEA7t3rFYaABmYLa9bc+R8bbfXk4k5LHXDaN3CeUKST6JHnt3aUKjQHpy8BBGshLrX6Q
         ajXOkBlsgsiUqC5nZRsIdkH4k9QCgZ/wWHwfsl+5IpZcIyqFq/HCoOkG3aUuiGQ+Tb+f
         CwbE7oY9iH+snZ+kv6arZ9XpskMiBUCP99H0sBBEPBuJoa6rWbUqkg2ockfLaOUGZ+rU
         tPvQ==
X-Forwarded-Encrypted: i=1; AKwUvBx9DyCwD0OBndzsHVBfUYoJ2Y4+y/jb0/kzvQmIalFYMInU3UmpnpIXEWYkWpyvgv82o5+GsIZNvhnF34E=@vger.kernel.org
X-Gm-Message-State: APuU4Z+r0iPBWKV1xB6qqR5ol/EKkXPPFHHAe4ypUuxb2UNKuFWtfLdD
	ptJP9beewZDANzb2zgXKzlOA0cY+qVlqNO/5QI5VF6bvqDv/UJiCOx12T1zMmbBbOCMTWjDO5xW
	6ZfbuhG5IIbq5zrz1V8haWnoXFabwhUU=
X-Gm-Gg: AYBFou1YJTx5mNjoRdPZ0K3yjtuB8il0Di/6AzkuV6/c04uyQj2NFRFlf+SxEmrvaH3
	7FyNy8lWV1PLyPX5f7ce0Lxww2wRq+fMMxvfj2cqPsWE8WSSyb1pFR0DDeN9/xk3SA2LyaPh0SS
	xBbM3uXYnXJqGDUvDdTLuWGm5eigKoOlD6qD8nN4aOoUc2A9bnSFQ1lXacIm4TVTjsv048R9yvn
	XRXWQVSAlXGk0WvULwBEfvUaZFE2XGRJf0A/YNGIKkUCUYi/WCRVsBIV+d6pI2DN0+hILI1RiWY
	pssjft5QLoUWPXtxGzUM23IZSl6YSMllueRfjEl7JSGnjXC81shIsm+0O30f+c6NrlmKNIOna1K
	I4nI9ACSMmxe1++iRfmvK8TXQMZbaxIh4m4ysJ0BrIauSt8HSlz2WGVEyaF129MZWM9arERWylu
	9Fa1xbQk9zVjcR2eDJkerONNi4L9nr3YvdXj7v1bS26NPAdjoMLlhsHDktQAcrFhEaTcxsvI3He
	+uFP3G71ChH1cyPUw==
X-Received: by 2002:aa7:cfcd:0:b0:6b3:cfa0:77cb with SMTP id
 4fb4d7f45d1cf-6b5777268f1mr1117005a12.10.1793876687591; Thu, 05 Nov 2026
 03:04:47 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 5 Nov 2026 03:04:46 -0800
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 5 Nov 2026 03:04:40 -0800
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 5 Nov 2026 03:04:13 -0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Received: from 77377267392	named unknown	by gmailapi.google.com	with HTTPREST;
 Thu, 5 Nov 2026 02:57:55 -0800
From: Florin Badita-Nistor <baditaflorin@gmail.com>
In-Reply-To: <CADnh+D0zSzAyYCLo5cXU56o9X-P3RG3N2ix7ARPrP95d8sBXmg@mail.gmail.com>
References: <CADnh+D0zSzAyYCLo5cXU56o9X-P3RG3N2ix7ARPrP95d8sBXmg@mail.gmail.com>
Date: Thu, 5 Nov 2026 03:04:46 -0800
X-Gm-Features: AclHuK8JAKDvSsOv_WcYjMNCz8gzZNtzoHji_gLTKVDuZBc4kV7FsgmeUAtGpZU
Message-ID: <CADnh+D3nz5aehxjvurK+Fv7gF6n4csMm-dFatvdMmg1fWdGSQg@mail.gmail.com>
Subject: [PATCH net 1/2] tcp: avoid false bind exhaustion with odd-sized port ranges
To: netdev@vger.kernel.org
Cc: edumazet@kernel.org, ncardwell@google.com, kuniyu@google.com, 
	davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	shuah@kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

inet_csk_find_open_port() rounds the range length down to an even
number but keeps the original exclusive upper bound for wrapping.
For an odd-sized range, the two scans can therefore miss a valid port
and return EADDRINUSE while an eligible port remains free.

For example, restrict a TCP socket to IP_LOCAL_PORT_RANGE [40000, 40002]
and hold explicit binds on 40000 and 40001. bind(..., 0) always fails,
although an explicit bind to 40002 succeeds. Both IPv4 and IPv6 TCP and
MPTCP are affected. A namespace-wide odd-sized ip_local_port_range can
also trigger the failure without a per-socket range setting.

Keep the full length for the scan bound and wrapping. The two scans
then cover every candidate in an odd-sized range, with at most one
repeated candidate when exhausted. Even-sized candidate sequences
remain unchanged.

The issue was triggered while developing port-range selftests with
Codex assistance, then confirmed using userspace reproducers on
unmodified kernels. No kernel instrumentation or fault injection was
needed. Booted x86-64 KVM kernels were tested against the regression
selftest, the full ip_local_port_range suite, and a Go net.Listen
reproducer. The Go reproducer fails 100/100 times per IP version before
the fix and 0/100 afterwards with a three-port namespace range and two
listeners occupying its first two ports.

Fixes: ea8add2b1903 ("tcp/dccp: better use of ephemeral ports in bind()")
Cc: stable@vger.kernel.org
Signed-off-by: Florin Badita-Nistor <baditaflorin@gmail.com>
---
 net/ipv4/inet_connection_sock.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/net/ipv4/inet_connection_sock.c b/net/ipv4/inet_connection_sock.c
index e56beec43..755fcea35 100644
--- a/net/ipv4/inet_connection_sock.c
+++ b/net/ipv4/inet_connection_sock.c
@@ -343,8 +343,6 @@ inet_csk_find_open_port(const struct sock *sk,
struct inet_bind_bucket **tb_ret,
 			low = half;
 	}
 	remaining = high - low;
-	if (likely(remaining > 1))
-		remaining &= ~1U;

 	offset = get_random_u32_below(remaining);
 	/* __inet_hash_connect() favors ports having @low parity

base-commit: c6b41de4dd9f2d6856d8d8d292348f7961034152
-- 
2.51.0
