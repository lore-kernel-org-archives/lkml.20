Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794173498;
	b=KzAoL9Qo5MZIJQtReq9oNDPwyxakJNUCOaZ7//07Dz7rAo7280ph8fPaoACUWeqvbNmt
	 NmPHvH1uDo1NsJBcwh4B05iwsGPyuWcfXjSu2sD/KkEnn9zH8dqpafHp95WlV37P7wmgs
	 XdusjKxLjENNwpnlQqpEC18JElMPj2V6JaE/EUcOmoQSv2fgr80aWJFIjb8QPPnTFwQtD
	 Sq7wz7yxA/Jkq1TNUfEcEx4U6p2ePpqaKaTfXEt3zleEbazofIbIMtgsjn/w2z9dcHZeN
	 igKVjY3WAxjf3AXEEoiGa0+1GhvcQYj4cXen66TA18Kxja4gcB0wIhfAwM7LtCYst6Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794173498;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=mNnSytHabs4CSN2sn2OhzEVzq3LVe6ObrYpizxNtHsM=;
	b=PF6ndh4qU35JTmItbm7lT9stFW3gpHKv/nC+b+CqVuKaR5J8oZzESd1i7wACTgkLMRU+
	 hcNxe/Fu92IofIzXwK80hTP4vzuxfmboqFxvjUOWEpqSaGzeua4G9PCSpuT/u3BV+fxq8
	 mEkCCeor0xSneY/C75AEiN++SlA5x55vKMvjZ9pNePazBzg3Co/d+KrvpEMY8bk5Ylu4+
	 X1efMs+ad82K932H1tGKzaJPxRSjiv7EWObzkMIGXAPw5+eJQvznDL+0cZcIMFQxZ1zi9
	 r/VYc/UjZ1ijeOi0RKPXjFmBJzbYxYcHHx0Jqc/HvlHtQ5lhmtdgNhxJVyN7v6SfI2w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SaNgY0wi;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.45
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74CF5606A320
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 21:31:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74CF5606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SaNgY0wi
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-8470d7d430fso129959a34.3
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 13:31:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794173497; cv=none;
        d=google.com; s=arc-20260327;
        b=aK+HuTJanLQSMVN5wel6NB1kwkp6WkD48daSjGZtuJ24q7XbHsB74r9oA8XJTObftE
         CB5nmr5X0KdCF5NgCfBFxBTOc3sR4rdc/Ty4z0Io/XBUEZRZMmlmA2WswPcOlNYS9hg8
         zUrWjFBdt31sQSzQ2EWtQ7S9JOEzhnOyV4Bjmn673Y9zxWxpWp9CiTRuwVILebjYjqEL
         B/fJwFGsm2ke6AIXuEV21pXLeo2Qo/9ldkavHI6vJqDjs0tl172YWStPPGMgG4Hsr8qY
         KrXXQoJHTm+95UNkPYiNGgYPrpU5SpLVwpQyEXUZ6+FYhBPc+Y/yCjP8T1jfHqxbSQAL
         /NiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mNnSytHabs4CSN2sn2OhzEVzq3LVe6ObrYpizxNtHsM=;
        fh=1Uc5HFXBXWNrrqbnH/qMAso+s/ujCS5eHcU0bMRzyng=;
        b=bw7HMUcy1RM8+9SYA9X5SWU2jrNmwUjGzPJs78nxF0uBGsJL1z/pfCPqndcawVFmpR
         zplEegAKC9HWh0R5TTkM7oFalkqIbh7hrxwO2349fvWshyeTnDN5spx+QIbFOlXwCQ7k
         TPMqTXA8uECoSuW9qv2Xv9k32GTnGfV5uriVr5KmTPx0VF01j18m990NUuRj/2Do0MOf
         CWEd22UXrNrXGO9bAaXJry1976nRco8qWqp+uA5ixG2BwtTumg+safmc4xUwKclW4DlF
         ACV8zeP35UU3ScbEzZJOoPaA0YD7HUfqhcjxI9ByWUWSYaaexmWw4Ei2DDkxKBcYvCCF
         X0ug==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794173497; x=1794778297; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mNnSytHabs4CSN2sn2OhzEVzq3LVe6ObrYpizxNtHsM=;
        b=SaNgY0wi61CAMHoAaSAQElsriA2ewO4xeY3dct06JAYBGplqD3C6/rek6GQ+oVhW1V
         c96l3/xt+NQ87IE2kKzyUC2egVoZkyzkRlIIJzKNijtNlJsI6TytrvFuQOTrS/kIQiCs
         MttP++uinY9OyXbMycU/YsPR/3kINXZF2w7XbDEX8JRWjqiagJ62o3+LIrskahKivXjs
         LuDenNmzPDb6qxKXf+T67kSCeN6+OWZEV6TK0AfHduSy+uRlVJY/adPJ+hPutNEE8QEk
         9uxME+zB1P0yQWN0JTWXMlCvV+J3DVbCyR7jdd/aubIZGtKQxQKapbarULmtBmqbOF7O
         7XrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794173497; x=1794778297;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mNnSytHabs4CSN2sn2OhzEVzq3LVe6ObrYpizxNtHsM=;
        b=1E2PytHA6y5KyDf1Lu+1mcn7FYOh76hYctJEAgrcEojDq8j5AOevaWc02Q/EwU3nL0
         UcpABgzwM+CDX4tVHZvQvHDZTRwZeNe/OdLbugw+s9cP99cELQmt4PU9oD04q/6/lqJg
         L8/b73+qh1n0DyUzGEE1unR9FZEa7YPpIVmP3P4YyK5y2RS15iUqwQanfSHHCnGrQA6K
         6d+3enlKtyNI2icjz4cOvpExwRdUlWRWQXOFS6ISU81Wg+lKbzAzZiBBZimYETuT9QV5
         elASljvuwAJlgTFziGboUDU++TU2h+dNpxuXKGYGpbQo8RezZyQZx6ICql6ON1KZaVV8
         1RPw==
X-Forwarded-Encrypted: i=1; AL+hErFBfLeTFbJ1Isy1clM0M/bgOZ+f6SGmRWnvo53qzWVJuYogqgUg/b2MSOEMr56QO6+yCcE2SGN+Qmy3+JI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Gsqf0l7Ou0MKZKGl/aWzl6Zb8QJlUJzXGBX1Xr6pt7cEGgp/T
	Y04K8kbFzTdXRevEsepEt6QbkAZ5ckk7BeurWyMiyNxQi1uDInkZPnHtV3fUKa9uAgO5sdV6UsG
	IuVAhIt+iazxrAYh4U6BFJ3/NEgltd5lvmVksVFA=
X-Gm-Gg: AYBFou2R5qvQUdEcizjIMEiaOSjHIdgQ9vNTkhsk+PV2l/4EMUAP2lQn2w1LfZ3n+Ue
	KFd+T3uQb2/l/mvxT4LKwR1XJIUHAIhasIUEcAQTV93qUf4QGi1+7h1pFvOyu6GWpNPT3SuBiD1
	GgEt0vJ0oOzz2V1SJ2Qku0bBF/N04nrIZPSf+6+pSin9wkLttqy7/bN8BU2l4XnrHp7mph+U7kW
	s+dqEO78hRhVO/CLXv0GIj+6EKSqVLP0MMn1ykbU5sWerjjujNY2kMG4wWZS9Wr+kKT8WEjy40t
	4vf05+qokTMNAp0ZRbFAwTIj8utY8kgg0mEBCxx1zrZ2RoTdxwSh7j8L6ke7DuukBm2BfJy3PlZ
	H7md0vzxzHM6AmSavnmYM7W+Un6MPL3YoKPGLseXX1k+VNYpnWTjmxo+iqzTpq9d+cHDlrLCt
X-Received: by 2002:a05:6808:bc5:b0:53b:1d13:dffd with SMTP id
 5614622812f47-568143a72e9mr1609971b6e.7.1794173497308; Sun, 08 Nov 2026
 13:31:37 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261108210357.1633411-1-mmyangfl@gmail.com> <179417201494.488859.17405768719520305251@kernel.org>
In-Reply-To: <179417201494.488859.17405768719520305251@kernel.org>
From: David Yang <mmyangfl@gmail.com>
Date: Mon, 9 Nov 2026 05:31:01 +0800
X-Gm-Features: AclHuK-7rjeMC6REsEvqypnWoJ8UWs35DflZP2w5x1Ar7W3Kfyao2q3Crk9apyI
Message-ID: <CAAXyoMPFUTnyw9+oR9_RTi0EA5og8zXt6C4pj2ceqMEwb9+GVQ@mail.gmail.com>
Subject: Re: [PATCH net] net: dsa: motorcomm: Reread port flags on bridge joining
To: netdev-bot+sinfo@kernel.org
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, 
	Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 9, 2026 at 5:06=E2=80=AFAM <netdev-bot+sinfo@kernel.org> wrote:
>
> Hi!
>
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
>
>  - How the issue was discovered, e.g. hit in production, hit during
>    development, syzbot report, manual code inspection, LLM or static
>    analysis tool scan.
>
>  - Whether the issue was actually triggered, or is only theoretical
>    (e.g. found by code inspection). If it was triggered please include
>    the symptoms, like the stack trace or error messages.
>
> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account. If the series needs another revision for
> other reasons, please include the information in the commit messages
> then.
>
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.

Reported by sashiko, code inspection only.
