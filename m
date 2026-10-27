Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793111751;
	b=t1tO9e8M/eDsOnCTYWzw8UclEDEAr4+z8751ZXA0apzen3qHjcaHMnkD7pUvQ28or4s7
	 EyB+T8RYbLY7QwYaHAtSE2vkxAq2mqAHz6CoSv0tSp6fA1ue6LY3EspSeB4kXoxptuYgH
	 CxX82VJptio29/8Lu9pi9fllgkobZBi3oNbNXXgwBG2/zyaXSN7FaDMRObdfXKK9H0RDd
	 M9Xm4nptdKNO/OZTvENe6Lc84OVxrteLY5cICxK8ZriU/Q70TWdF32m4yn9M8v7eADXLr
	 otlxfWoA1VA9VdL1jfU2UUtai3qKRDD+VdTnnDK6LE0DQ4k+7DLxX8MfyoefNJZUaRw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793111751;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=8ntivL3sfq13MqlxFs7OFXeUXQKCco09Bn0M/NaUypI=;
	b=gYEAQvZipseysCgH96FzmOkuTuRoxqdMfA7uWAnUgAVAt9ozysNZlzKzXDVPXyiJx/hy
	 Y5zIvuKncyf531DyW9C4bx1npH6egx6yRs4pIlDD0Gh4BCrmFH4dC8cd5pjiXJVaEza4S
	 5en1n53vjhfcq7d5Y+mMQD9r3pHs46HMPg1O6RxhYz9iBkaNwxCsI9L1OjBXAasuZh+EJ
	 HYrkbDoWj/mOOROBAjz1DN0/bcgz5o5a87AI9X9SID6HXsM5Vxr/HHLBYqVRf4oqqAeo/
	 n/iLL/DroQDYEPrOM0IJNAbdalk6mI2vfaTSK7Q7ChCV9k6CD+Dp0SANOYlAcjEi1vg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="BPHrw/GM";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.50
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86210606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 14:35:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86210606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BPHrw/GM
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-825b40f8a26so2075848a34.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 07:35:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793111750; cv=none;
        d=google.com; s=arc-20260327;
        b=BtSRIO9C6DErn1vgrzb2lEGDcM8xMrE6vTPyH00EqKcQIXQxBfTI2KlFJXMrtzvk/f
         2qTgFkjCTn7WhQjDJ0mCCLDRM+QlCZPY8yJNgIhGwtHSXzyB4dS8CiNgEh8OZYvawHHh
         PAn0l+NVzOxpOgN7S7Z+z8uPXFLhSyo8mafOdriVYmOcLAG4aHVmGToFEgx5eD1Lnrip
         tc1DXmBu2twOvBGYLOrz6VRWAjRp9pNNWjUIDCnXw8XqHKw+RhK7ora4a1EupxoeAe8I
         7dTBC2ELXo0me2RcZmZA847KVxAqmA3BG42usyj0CZl7csPF5jKm7RM9dyNkafB9EbPQ
         76Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8ntivL3sfq13MqlxFs7OFXeUXQKCco09Bn0M/NaUypI=;
        fh=J0KyIEzaaDBnE6zZ/Kc1lmFNiX+yJZ9r4ZiSrUm/2Ac=;
        b=oEJw0eQM+rTGMjPRcUK/zU3dN4ssDPx6PaUDFBpV25U6Hb0Tm7uatGBh0si+BLDbXD
         VB2OFSKSlufx3ZRgYYorEs1WLHn06a6sHC1cQFKAX/Zym28eEMklTJFROZYOK517LMze
         i+tu1Bqx2fho3EOe8DbrJXeUHf8jcR9aEtiD0QHRTlZoVnVKaO+mVryMW6B5P5aFPN6b
         AitJYTRKxdOdI3B3owuKjtCXvTzbybzhLVpLd6IAN6ED3I5k8oPTiXXiJm8rcBCuzyx8
         7wdYOh4yDj/Hum5zkYd0+OtG5zuRRpB5EAzTvITolJUge84o6GbAARkyWnAaPXer5NMq
         v31Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793111750; x=1793716550; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8ntivL3sfq13MqlxFs7OFXeUXQKCco09Bn0M/NaUypI=;
        b=BPHrw/GM11uvEr89aRC5HWLHrjkqGaOlu72HZu20IRNW12CbqeqCrUCf9XjVaO8BdD
         Tm8BiiEkYjWF0IWDeKpX2/TO106vYj0TEZYlvPNycwaNkFJ4w7/aWhfXp9YRH+HERKRx
         D73zV2v0PFjqkX+1jrsqekj6gkctsf1ZHTYzfhrQXEsRMxP5J1+IkurjxaHjIz+3PUwS
         W2fF3Itr3kRg4YOPfQ5ZamB5CrmSIzJZEEd7XCc/Qx2awoLw67BeMJMwsILLq2Pjmaej
         tYXdVRezlI4XL4vNDCmp31+c0oScTJVaeljRSMVdvMVe0N6YtdKl7ws9yj7/XN6uFh9C
         JcQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793111750; x=1793716550;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8ntivL3sfq13MqlxFs7OFXeUXQKCco09Bn0M/NaUypI=;
        b=Jl90DAmXbYe74Qq32EB9oWaUjqz0sHkp+lZeSJVg5g6EFXPhI5htHwQXQFR8amLUY8
         mlb5Fe3dAFx66rMlELKS7QKD9DbYm6ZhBuS4+un1pVqqsgKFsF6g6w41IxYdPU9gmZ5l
         474AAxgkzIsicMDEYZaruMYxZlf2I8OUrsyUKovYwMrHJ7dbSDq0Ahb6iYMkMRDEiIfR
         e4CdkOK2wQbG0pWo2+6qaJWqN1CUtQFMAId/uKEBmpVTHJTnl6q2804p9sRmPrsfIbHl
         sdNEbw9xGLiKamAHRNQFYV26hI4yGPRommWfketizKxv99unqw6cbFZOns1xoMndWhmF
         bBZw==
X-Forwarded-Encrypted: i=1; AKwUvBzQV5X+SNzMTZFoyw7mCpGTOM8XqxdkdKahJhgcW7+P/mhVPWRSkmfguzAC5TEnoHVtmco+dIPSReNFCDw=@vger.kernel.org
X-Gm-Message-State: AFq9FYIoOz69+b4EraO/h1rPTC42vTmJSLrphfLaTjbpUwpuAyuGCsBc
	l3uvSHRUzhVdpvOZN9kBLVzyx70l20KkNPc5rrRNUBUAPkMqvu4RJda2cTYiuzZtUz9M+v9g2Eb
	1N+yJF0rf/1WSbFlglU/PJiSlCHFfJSbNEoT/GO4T8w==
X-Gm-Gg: AYBFou1XyBpelDcsGXEaW8XkNmI0SCIZi23pXkpbVF9OtdjR4insCbXwMMOuPQr66Gt
	1dwYWF8mWLOQCYGCzqkXD9mMMd2JKzlzXLM1NIo9zoZvl+484v8PhuJPBKB1g9a4T6Fviuzr50h
	DoN9xuxKzPUdrq54tFt2T3XIs5t/qIvzoXVPqsI6iiqp1PNPxmqFyvV7BVFd29jv7xEO4H6S+KE
	gPF4Cv65R3LP1F1+5aRdDS/hSCq3EOFv71i+LpIuS5zXVGqwBrW8LnFU8hiiFzjTh3tx3Uj3lkD
	J4b3UZ1/77xK/v7w4HDToNnz6URjFgxxn8WzCqfmaeredCXKN+xX79b1PX7Usy5SsuqsDMIJhh9
	UYeeaMb6QWvRqvNcqu12F77skUziYYUGCV+wTxz0GLDO3olKqrtQA1HqacSE4gnUaZ27t
X-Received: by 2002:a05:6808:3023:b0:4f4:e1d3:b295 with SMTP id
 5614622812f47-55c0035e550mr5910025b6e.63.1793111750418; Tue, 27 Oct 2026
 07:35:50 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026083252.12684-1-mmyangfl@gmail.com> <179300378438.3327.666635400432470005@kernel.org>
 <cde7570c-50bb-4813-a461-04154d4cfa65@redhat.com>
In-Reply-To: <cde7570c-50bb-4813-a461-04154d4cfa65@redhat.com>
From: David Yang <mmyangfl@gmail.com>
Date: Tue, 27 Oct 2026 22:35:14 +0800
X-Gm-Features: AclHuK-AndTJtYxew75qcWywswF0KFWtkUg6fXVQy29AG-fqIS6AS7eX9kjSkck
Message-ID: <CAAXyoMPTMtSbbq4FeTJPDD-gfcawEOE6HAucEhG7R+MXdjUDGg@mail.gmail.com>
Subject: Re: [PATCH net] net: dsa: motorcomm: Fix function parameter types
To: Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, 
	Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, linux-kernel@vger.kernel.org, 
	netdev-bot+sinfo@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2026 at 8:18=E2=80=AFPM Paolo Abeni <pabeni@redhat.com> wro=
te:
>
> On 10/26/26 09:36, netdev-bot+sinfo@kernel.org wrote:
> > This is an automated message. This series looks like a fix, but its
> > commit messages seem to be missing some information:
> >
> >   - How the issue was discovered, e.g. hit in production, hit during
> >     development, syzbot report, manual code inspection, LLM or static
> >     analysis tool scan.
> >
> >   - Whether the issue was actually triggered, or is only theoretical
> >     (e.g. found by code inspection). If it was triggered please include
> >     the symptoms, like the stack trace or error messages.
> >
> > Please do not repost the series just to address the above. Instead,
> > reply to this email with the missing information, so that reviewers
> > can take it into account. If the series needs another revision for
> > other reasons, please include the information in the commit messages
> > then.
> You should reply to the above questions here.
>

Reported by sashiko
