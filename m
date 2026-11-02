Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793594645;
	b=liStZEHngsaDkQReTzFDJIkjP9j5+7JMzz41bPmXaFv+THC79h/BMdkDU69Qc/6spETu
	 ATXNxYkWCmEYQMxuLkf66L8fetjjMI82MUYu+i9jUhx9EDzd1COxq8Tu32jM+lehGqHzD
	 LzDgQ8v4mWoa80BrWDmW4kmgNNfXn3GHhsbPzA4j63N86z5/vbTwHm71K/UCjpBB3Tmw/
	 hLprnaoSw0yNLrEUrwHVFJrdMHXJCzuOP8YtCMWgr90tDHi2otF4jyNpzt6et47249Wye
	 teDbVK1zcNtUj3TDN6GJHzOcwy6up3gVBmlQ++qeRrcfGQLQPtguAVAR6aoU+H9uBnQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793594645;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=O6Cwq/TYI20Xap5XXma+Ak7imjQ/5PuMjwKwFGT+f70=;
	b=eVgUoYzaif07R/i/Du+N5x8AR8yH9HNy9fZu+GzNfYSTRTmaIfboGJVxc8kqvAOfl2Rk
	 0NCx/Zc8FWfmTr+bmn1uPtYvChJ4hfO6k0JSAVGzUJ6kbjEbQKv9v9y6scGSgtN4zCG27
	 mhdizM1MKYNAKfFlLgx1RKYEItFSyWo/+c/8VKIlgC8ic2+6QjRiQxy9neqMamwOCfpyF
	 G2r+TxAoxfgq0tJAMIUQEvv4WmVLoZlfT7vqbH5op0lvTbuqUyY7ARER1Yoh3WEhDFUdx
	 WdgiXyVbCK56UgYSDfKmjkoulZx0Gt2eAZLBO35OCdWtJJpjBjNgop/3nB+EkcWj+kA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="ywOVfQ/8";
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.50
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F648606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 04:44:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F648606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ywOVfQ/8
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-67b9bd530b7so1680325d50.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 20:44:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793594644; cv=none;
        d=google.com; s=arc-20260327;
        b=Gny/xOL5kw6EwLiGyocKGu+wi9BDLO2/ndt9qKyI0XoWAfK+UdzTzyi78t43JrJxC/
         fWc/FPcZt7GQaepg44iDDw0OhRsk5fCOJFBeBrqECJypzChCBEK7aTheXErpxptvjGkf
         5+bLqArdc8833d3c/I+CjuFmhiNUkUvCeifz/tyJVtr1JcrXvdiUHzYrwMSvFDm++6Qy
         jYHc1Q3VbvjHUGHgBzaC0VL17Tp6v8FxMiNWwNHgeurV3bKGUTE6A/2MH9X2p5lcldQn
         tiahSiB6m7TJUC1qO0l6ab3TLDArPD7tAz644o4zH2HoHv9B/xm+WnBChhveBLFvuIAj
         n1qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=O6Cwq/TYI20Xap5XXma+Ak7imjQ/5PuMjwKwFGT+f70=;
        fh=SkXNNDdjqos8xqv1GzvTeKoHMgScBPvkxX3S7oDWLx4=;
        b=abEd3Q7FUujILdKSzJUy5VAP4ujBlcRlrRy+o1ULjCZ9ywEDEvjHxeFOo6CTezbTwE
         1DF1hGamNjv8u+oRaa4p6CW0MA9PHnzAnzmiTF8TbNlYSSSg23UcGvfrUfg2HoZjw9hI
         pXpADqXsdJqRIfuqevBEeNrsECnRkpIuSzZuqTon74PktTODiEW30bpmDwhxPmh0BHyZ
         oA4zHIE9QVt3NLinmG3Z5nDNqSDP9jzZ3sQVnPTEOy8GrCBGT5dBGvVRU185iC7OvptQ
         ZcBx1nLHdylLfbhUmpHGLcg8QUQ8jg21rZVUAco0kfDk31QU4fsaF5hqIcsMoDe/YSKK
         B9og==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793594644; x=1794199444; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=O6Cwq/TYI20Xap5XXma+Ak7imjQ/5PuMjwKwFGT+f70=;
        b=ywOVfQ/8CpQwC6A2QrKzyJosYRmO1nomFHzMJv31aIs7fCgdDQqdasj6EXUcd4uLYD
         xEQaTON66QGacskLoEV1x/V5qpsAO3hxANBXnPSI745VxoMVIqlFF7Lq5wxwxd2BDGLo
         vsD8I6sPqFogDEZJbaY7oxSOnc0kihoYzLM8TlCWyvTHLxC0pXVeUeslpY281Im5aWz2
         keeglxV50Ad2dT1rK59bwtLhlnCvLsMJa3lbXg98qw3eRqdvVppqynp0Y+wgmyKhNmxz
         zr1c8p9uzQ7Sc6UypSwLrerLFgE21RNdIMx3aaZOW1YrDdfmxcwIqMl2rmB2ysmU6wK4
         HaJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793594644; x=1794199444;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O6Cwq/TYI20Xap5XXma+Ak7imjQ/5PuMjwKwFGT+f70=;
        b=r7I4CmsHgckHeTA6PZV4EMW3T0UtjX+ppA6SQueCi811T7KEVXRZxIAgzdmySeINVe
         H+Ha+2VfOBqB3RaYnWXZpoJGk0GHjviKmwU0x2RBMBWlcwjAprM9jfEJQ5kq4ggvP131
         q7hmcKjKFoEdA3tUegwg6jvnq35Rrkj8o+lT74st7Hs8WfIV6gnGzfiIGrqPvVDOW4FV
         hsGdB6IzSfgbez/L2x+NZBS/+n3syIbEuixxKUN76jCxxi/w0jIk7a+fu1S1d1ATqMW/
         e6loTgC21HqK1cfB1qTweZ/b/x4QyCeeqU3Fn6FdIa8ji+IErXGf52Ril/p5jpts8EWP
         sGVQ==
X-Forwarded-Encrypted: i=1; AKwUvBxTT1WP4UI7gdzdgx3+amcnAB+41TUwxZDbIRZrNsjqiecJsuJnEtdqHJTccwjN5Q78v0Dbq2wBpLw1UI4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+RjuQoU0m56S8LpFItWs4fqsZpv92iHOyJJxZGEtWcKPBUTAjP
	bTKTXgteIuOJjuktHm6TJEX62rAhf8M7TMB9s/CF5EDngNacmxDX6x4J6i3Tk0z93y4A/aB94t3
	JsBNZ4h4ZzAh5OO5ncGL+zx2eo6qr+Yo=
X-Gm-Gg: AYBFou2OeU54TTizQUjfpQawAHfLTlfCd7kP5nCuCWIiTXEbV9IO4mRjA4V4Kj8LQi3
	uhx6+cuKXMDR0r+yF2Fkc5Iqgj3uWCO2PdKWNT+7vtBHzFwVHnMqeklBM4Lr7ipasjxq5GRRNYM
	2j3GSdK0SHS0R1akFFr+sCoeIIdVNZ8sJNk+zyueF1Fo7a1hxP6Gt1dGYCwTkukg9lhs5cb5/IX
	fDTrDF+GqT9TqvCBChn76evTyGTLHI6XYPy0lWL6VmWFSwcNVxE5HmpwCDGoEBcz6OBsrsflZng
	wfpg4xLrsKOBQXkJnKYarZ2RV2mZa9x/LQ0qB8zNhK4WASZ8HMZFDcJ7YWKJMoHRZ0BDz3hLsdL
	mynBDhtK51zv3EBeR3XhnxU/hSChemts2qmBW3szg5xDoRPWU4fvAPtbXBkS9
X-Received: by 2002:a53:e1a1:0:b0:679:9e0b:dc4a with SMTP id
 956f58d0204a3-67ba502f05fmr4965690d50.49.1793594644085; Sun, 01 Nov 2026
 20:44:04 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261031-tty-dont-use-autosuspend-removal-v1-0-7bdadcadc4dd@kernel.org>
 <20261031-tty-dont-use-autosuspend-removal-v1-3-7bdadcadc4dd@kernel.org>
In-Reply-To: <20261031-tty-dont-use-autosuspend-removal-v1-3-7bdadcadc4dd@kernel.org>
From: Shubhrajyoti Datta <shubhrajyoti.datta@gmail.com>
Date: Mon, 2 Nov 2026 10:13:53 +0530
X-Gm-Features: AclHuK9vZb9AMAN_Qfd5MGPYCq7hcmIITeMPXc1WAqkUrzre3J9_8OXCQvnjwD4
Message-ID: <CAKfKVtGHZ5-yQacfzqs_cK7LTb6C6GXCHNrJBk_7ecyNtJkqaQ@mail.gmail.com>
Subject: Re: [PATCH 3/5] serial: xilinx_uartps: remove redundant
 pm_runtime_dont_use_autosuspend() calls
To: Joshua Crofts <crofts@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Michal Simek <michal.simek@amd.com>, Peter Korsgaard <jacmet@sunsite.dk>, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 31, 2026 at 10:40=E2=80=AFPM Joshua Crofts <crofts@kernel.org> =
wrote:
>
> Since commit d1706f9da9f4 ("PM: runtime: call pm_runtime_dont_use_autosus=
pend() on reinit()"),
> driver core is now responsible for undoing any
> pm_runtime_use_autosuspend() calls on driver exit.
>
> Remove the redundant function calls.
>
> Signed-off-by: Joshua Crofts <crofts@kernel.org>
> ---
Reviewed-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
