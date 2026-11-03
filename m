Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793702615;
	b=rKhqETxEoC5Y11tanN8SZMvAyQ2JcsofHnWuINwAFvZ8aH6Dom9GyoLp4ntqZEOp1fPr
	 xH1xkQFyFrk2B3EizLsTIJSgtQx4U+GQcZN8Yjti93kPYLBi5jrD9buTlRFyiGzYpob1f
	 WzJVheBVVlXZ+mLJ2QAyJa6QlpstsgURkkwVTHD56CKoJ6UytQwqHVfod9fpuKDi7lesc
	 Ul7P1dlHzCcWkEvRZ9kdT7oLgyi2I8k3fDrv8W2kn0u4AZm1uDXff1TqsjRmirpOyWKeA
	 iHXtCBq5BkTtkNOGOVL7Xo4iW1Mh7jFCpcctr80sEZN6QgKFwIqOh3XLgvL07xz1cjA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793702615;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=+2clxmetH1f6hKvvIm6D4A4xikxCFsBoxO8NB0gBXdk=;
	b=PjJwZbC8HxPYfv2z4vPYuf1TCpfnyWDNJYXSvyflgXo2i4G1qyN7pZtCQwl1jTzxMLe6
	 qUf/oP48klWuzSSeM76siVHA1voIRbFSuDe3IefMiDAaW6MQTZdFT6OneqgM2AR4proHQ
	 MlY2uxO9aoXYwYo4926YU1UcBR4MSkFDGANenvRIOgF5giHQz7BQzo95ebAQX07z31q13
	 0Ca8JCf5Xoz2ubmgtJiVpjETWpy6P67AunKrTdCCyBVd5OSJnFiZnwP5OQG3ERSC7IpKv
	 zZ/br+TxGZlMepcSy0OqFWvgcH1A9PXHs5WCBrA0KRfaoeuFR77Vkucz0IeYvmF1Ung==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pvHUVb+T;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.45
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9513E606BF8C
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 10:43:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9513E606BF8C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pvHUVb+T
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-84e513874f8so2780059a34.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 02:43:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793702613; cv=none;
        d=google.com; s=arc-20260327;
        b=IXYKVTeQFQHL8CEeWmXkgbDB4eBnXnG2iPfnY9oTs70PMmiJmqKTVERlz0V79069Y1
         7MtaT5L3bG8O6ctcysT8Q+WIId0tfP6RbAR8TT1uKUFIZob5wKPmQUZRL8Z1xXSKaH/k
         aWCA4/K4xDXXgrX4iAKvw6FnMjh/6ISwh8RBg/wcUXlUeg2cozbVZ2IaMFXalgnnoXkQ
         4qm3wwyc7NiHLzO6j3PQZ9C/fCCSKWVP+vlmTYR3EF+p3jgakPB7cuumfXF3ucWMu5pL
         cAZsMQkGKYxZam3zFXJO0HCFQ1EHWVozZ+MIA7QUTQamyiCL/x5DyqgU2zqGo92BDIpR
         K8rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+2clxmetH1f6hKvvIm6D4A4xikxCFsBoxO8NB0gBXdk=;
        fh=YccwASdL0ZrW2b6PRZhmzkqvzyAyO0nSRGKIWgxFml8=;
        b=l6OQvNAtwiKPIHdNdl6NwvtFnUacIO/qrwVopQPHUrxF5tBbuNf88HJD2A0UQnxNoW
         BtMw29JiL+STYZeFzjm31e6oQcyzSt7VvKDQwza9DRFRrdxWqAXqoVKqBwiz4ygUU+Lm
         Imd6y6fq5/ggAZJb1AP7Z8iwgPhmD0qcRedzR+HCFrIZ058ANmQXlOlmw2NIrxnK8R1/
         L8wxAF5diDJvp6tLg7RRfffHX+AONxdpq2+Ry0+idyBpRKnY88fbNw/nz4qqTDYx7rJa
         nODFqnFPhbfUhyZPJ/m5Mz2oa30aX4z7XJ/uoQuJffR8oMzXzj6nen0EyJkl/c9OmUqw
         N6jQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793702613; x=1794307413; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+2clxmetH1f6hKvvIm6D4A4xikxCFsBoxO8NB0gBXdk=;
        b=pvHUVb+TZmgxclqFDg39YmdZ72npbnrQBfllBxOMX+Ta7oW1AwDG9k9Kvxdyi4PU00
         cjSP3Leaq2CNcma9d8zP2NByk/xiCQHb3q+CXX5H1tzZXDtaYp2Oa9CUf6fgIqVkNH9r
         8Yol+azpqA3Kn4y5LqnbDDu5IjjWf1rBENKk9POJFQs7sbp+nSMaP90xLalxpWY3IJ+Y
         xLa4t1Wpvt43sSMGTetP2PpWOE5d79YozpiiUlPOS9DUsFp2ssr45HyUoi20klm85TPV
         qCbK5xappNbZwz8RfxogE9A8wmOBt81ZM0RaTJ2zEBqrmewB2Si/01plMLlRQA6EeCrY
         AAjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793702613; x=1794307413;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+2clxmetH1f6hKvvIm6D4A4xikxCFsBoxO8NB0gBXdk=;
        b=cOTfGHfjGyQLBPg3iwkdHtqn88PtM8G1fpKWCd/XsJ2vGlk8cZrvGH11MishLpXwBl
         wq0gJgQZekj246TdDI3QfBAWPBttl/JCXLB1FfvbPacweD37ohyaeiMfEcSVBe608kf4
         oL6jILXcQX3E43pyxhQ5duwZgVF2AexfFm1PBIvWXNrrWxB+tdbt9VF3DJaPe1zvMzZG
         rRXwlzIzQBMG3MN+OVHsl8RAySp+dBpEh71/pZo/UMyBLj0qUZsNQ22OUXU8ai7nRSLM
         O5+8tLmeH5OgewRZi4PiDwAYkZ2A8uqzQcap4Qyp+d4PUprBTSt83fHRk8zAQ1/XaP91
         v7PA==
X-Forwarded-Encrypted: i=1; AKwUvByekPgTy1LeLUy/e2r9x2bzJEzZZVWwox5lqgBju8641omwwRAVLfpHeUuAchu5WzXO6puFrdpI+VsjRJ0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9QmBQPaoAOZ9TQvkYSr/5or+VfNiQol/SudvgIpaRyYw3l7gmk
	75UcZ3t0SablQg3/WUCUgzc3YkMaZakoog57wRzt5FsIwvI+sVK8KLxNVFlvPJBDi4qy5XmoS0d
	qX+8Z81sD+j2n1r0HH2F4XmhwxPgC2o8=
X-Gm-Gg: AYBFou0hEir6+19UcXDJr/52XW1Wrb3qqZAKCDDAx160rJq8SA4xXd/kjMiNJ3lh3rX
	UiG9tvK+Og+1XKnLTULdFcLV922vlEjNspNRzM67avVeHWUuUUPVeSYwshroo8jjICNotqr7qAw
	3xoBMWI/Xh3JSWnEWcMUKxD6eENAv+zz6ORDRvc7XQU2Rf0usnpRvgGvMoV+U/H2DEdCb5zyDYm
	6grk9xqoHzpDkZsPEDo5iSi89qYNKik7WsDiXUITGrgyZ0oKH2qeNHzNVguLqRBIEuPNaN1s4kN
	ASUwu1feOeUAtShVUQjm2qqCVQfZhVPvoJXJM43tniz2eEC09omuvEvMTqmgpYcC0zPftiycqMG
	aNlm5FUJxWgcHlcbi9GcHt8r5jzD1JaotksnL+Y0mvrVY4Xcu2cEdr3VVzrY=
X-Received: by 2002:a05:6830:3114:b0:824:659a:adbf with SMTP id
 46e09a7af769-85d364be1b5mr12424576a34.5.1793702613420; Tue, 03 Nov 2026
 02:43:33 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261030032314.1978575-1-zhiyuzhang999@gmail.com> <179367762613.488856.7087052675164086918@kernel.org>
In-Reply-To: <179367762613.488856.7087052675164086918@kernel.org>
From: Zhiyu Zhang <zhiyuzhang999@gmail.com>
Date: Tue, 3 Nov 2026 18:43:21 +0800
X-Gm-Features: AclHuK-oQ_9e5ylG83bQrdxRkkrucYAPnzsIDVk3iyXuWtU1FMLt9B2kyf0M3b4
Message-ID: <CALf2hKugxdDx0TmsY-ob5Q9gPzjRcDc8Dv7bhAV-oMgB_=r5zA@mail.gmail.com>
Subject: Re: [PATCH net] tcp: restore IPv6 af_ops on disconnect of a v4-mapped socket
To: netdev-bot+sashiko@kernel.org
Cc: edumazet@kernel.org, kuniyu@google.com, ncardwell@google.com, 
	davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	matttbe@kernel.org, martineau@kernel.org, geliang@kernel.org, 
	netdev@vger.kernel.org, mptcp@lists.linux.dev, linux-kernel@vger.kernel.org, 
	lyutoon@gmail.com, tpluszz77@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 1 =C2=B7 Medium: 0 =C2=B7 Low: 0
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [High] The patch does not fully close the bug class it targets: an IPv6
>   skb handed from the socket backlog to tcp_v4_do_rcv(), which then=E2=80=
=A6
>   ...
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/20261030032314.1978575-1-zhiyuzhang999%40gmail.com

Good catch, thanks. I can reproduce this by widening the window with a
socket filter.

For v3, I'll keep tcp_v6_disconnect() and make tcp_v4_do_rcv() drop
non-IPv4 skbs before interpreting TCP_SKB_CB(skb)->header.h4. The skb is
from the old connection, so dropping it seems safer than passing it to
tcp_v6_do_rcv(). This also covers the ACK path.

I have posted v3 at:
https://lore.kernel.org/netdev/20261103103633.2707416-1-zhiyuzhang999@gmail=
.com/

Could Eric or Kuniyuki please review it again?

Thanks!

pw-bot: cr
