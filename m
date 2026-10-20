Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.208.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1792535891;
	b=mYzrGBxcl28j+tkRfXJE3G0lw+3P8KwRF9DvOHSvs0BKEYjupvt/+j0yfLbgqlXlS7bB
	 5nrCHS/MdlWHuD8N7nektQ8C77zNxtN0ac4IByDbmjUBttjmVH3MPW9naN7Uv6wHoM/49
	 sA0hCVL4PChDkxm4FUMFpCdGhm7/K0zKtwgtaG8+V849muaaTyJrCxXc7p6jmjHegwOVU
	 Kp3VWdNwlQ20UPKg5Ki5tO6RBPFPgc+bHovwE4nEBH3y5pvSIu9fbBK6nK2qp01DIxx0/
	 bFaXrkVdeGL7srMzyWAPtp8QPoN7MGfClDq+pVzTck/AFnJUi2uKL8RIy4ikDYABXXQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792535891;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=TLtnvNpQNgeDJo1fgrIbFUzYRY9b2V2srLedu3XuhAE=;
	b=GzVMYx7sHDT1Sqg/maoovO1+XGgvOTGBXE7Zm1fRrkLLB2XXekQ3RlFjBJt9qgsZwD/Y
	 RZ0zcKNO8rPgu92enBB26lod1Yd9IAA7sx3GKGGSEQozyaq+Gor3dQURyddWV0ILVYP37
	 NNUCl0L+50r1S7eNmPFyJ700llryteMkxyAYdMZcb3b8/28GOe4qO6YQXr8yrDRbZ05b7
	 bxgcU0H07seqLT5S0rm47TagwKw7Brs86wJUTmpYclWCgAOOQw2zwflO2V+qPySVomFiw
	 PxnuBU4WljHHOojqe26yIH5vTK3DZGsmyjaDRDh9jEJ9I5uOqZAVF7xLbCBAxIqhEuQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WJB45SwR;
	arc=fail smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EDA8606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 22:38:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8EDA8606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WJB45SwR
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b3dc272dcfso64640a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 15:38:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792535889; cv=none;
        d=google.com; s=arc-20260327;
        b=ZP2LslajJ4YjXbD9u2gtctrEHCZtkodKgzTkyaXz/H3udhEXsd1z+RF0gd2D2oQLQ8
         jtglxvyTQUENg9ffW9pkippy/yhnRfc7bkbtR7vbV8H0LfkOuwlpK5EqNRhSUgXvHNke
         /5wCr+mlP56lB/mC5tv3zS75GadSuwYGl79tF7GRDp12kXomafsMhyx37aV4nxyMM07Y
         t1kFBBVLHhU5lFrYDmeepQPQEtsD44RbPgaq+xlalmGtrn+NOXPxRYaC/2AM8HCCOgOk
         lOdxAHbtZ9DjdeSfeGEZvjwNYcequU0kkhJi/v8Y+SgHEhQiQ4RfbdTXOcrUkdGHaFRa
         YDkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TLtnvNpQNgeDJo1fgrIbFUzYRY9b2V2srLedu3XuhAE=;
        fh=W5WHBlqWYtZlXFKHS4U8K1KcGt2TPvuVU/S4I+2prB0=;
        b=TI9589Xo5rEUIVfU/Im75yxUjqwT7Zf25YS6qi+l4wwlh0W+aq9c/4FN8vJs2cBuld
         ax2Ek8knW6im03yE+8yuDxwhVGNZJSatFvZE06IAY1/XY3LR2r9a2pllu47Wu434ltCq
         Hji01bq+X2QYhtYQ2Ds6CWnAdoG04oDqxwVnfCMtbD6EDl83CT9Ojec1WF6oKDj5ptmr
         6CKA0JUE3st3EqocCigkNqfO0egyA2JwNQXl0jT80mKMslPOwSoEHeoYe1429nXLTSb2
         lu73AcYIA9WqdzPpkkrBF65epWYD3ba2UxCylgMd1sxo5d9HvvZPB4hcQZq2HEqmVjo9
         ggQA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792535889; x=1793140689; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TLtnvNpQNgeDJo1fgrIbFUzYRY9b2V2srLedu3XuhAE=;
        b=WJB45SwRHe2VKaU3d/Vr+/IHsPa6KuoYUIvC95e+N0nJ/Zk72QhmK8+kH3+9epY7Z5
         UBnl9OUuTmBOqJAnDz2bx4akTEUu63tsNUhRjbpoEwtvNdKc/YnUR8m5O5Vrfo9T6Uig
         BDKgz2EYmEe3a0enk2AgU4QcrvwzdwcFjEbJ4u+PHRoJTtNekiKRA6tvFWbQ7+mPfrff
         JetkSEfqBFy9bpD+Zgcherr8e6ftOvHpiTdl0h/Ds3YPCc6ke7wKQjNk72/dQBB48r+R
         zQIDtRAWX39k8FAWFC8ehZJ5h6QzyAusEdMQ2qMWaIAvD/QuODSUdZzvJoC0wsNv3PBu
         yKrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792535889; x=1793140689;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TLtnvNpQNgeDJo1fgrIbFUzYRY9b2V2srLedu3XuhAE=;
        b=XBarhZn3kaB/OWOU2icN04B7f574DIrDFiKxqNXpA6d7pT2RHSHgmF0S4UF7Bsv2O7
         mdl+33qyoE8H6z/cOxs1ZTt0Zv7mUbDCLqcwfFI9GZyfJ2Su7XCvD0hxXC02UOfJh4Fk
         u0T7NduoVgQp5jmrOt1aC317MLGaRGPV8ULnPmEvHHysab74w5BvITE5jcEqE2RNcew+
         h13Hd6/BeUppHBOPxvaacdUbm0t74OLnLJxSLVxWgRAG0KVBShpeYSFW+esmRGEdUzyh
         UbCd+gO24gpOWazXxCJNU3bBzlPmbjK+MPlLrtMCWO10YDX96uz+87NZg+Nv33+f+xMu
         pQig==
X-Forwarded-Encrypted: i=1; AKwUvBzsK3OwzA9an8x4QUzNGNsGuCd+GMK76c2jzxCFgu94MEoFthK3m4YTWsyEcsClZULtFWXaGoeMWj3/39M=@vger.kernel.org
X-Gm-Message-State: AFq9FYKYi4a+FV3YH6n427+/jzKL8joSiqZUfLZcB0VR0GR6UZ+C32PZ
	dfd2bTaU379nAkf6IPO5xWsZ9n4KWr6PEUaXunxmgHkjSsNvQjAZF9Q4ciHp/gUu+U1wVJ/494u
	190PjMpgwVjpKztqy/l1gLTO3lSroIwo=
X-Gm-Gg: AYBFou1MtXBgdTx0YYA9ht/EHL5e8MfZgahEoE0x0489bKKEIQlQfPFgFU2XPxPjTrb
	QSMuW3cgB5q22bZg1AxRTYj7j7vRIfpEBGlySegjPZU6MoHAMe3DtPaS1ZtHDEVCZUaW3whqjzx
	zp2LCHJ+dm9LAUL8d8WsN69cOo3pHrkg8C1Yr6G3B5cZcobaSuGsqyKSvBM4b2biYul8R+Rouff
	bIPIJsLKhOTF/qBbD0EY+SERHGyfk+4TcvmLOxO+zmtyXIRwDu/sFlpvr72fSpGT286SKkWW74G
	J6jndhELqw1PyiJ1kg+cfIgcvKKdMVyz9xpUlSrOihs4qqY2ClxNqc5VdAhfWYt6bdQi561bZYE
	/D8JFFFjdeNsh+rKD8yxxUrG1jaeeKopw8FNAdZhFtKOgrxIyKH/mHB/2yeYTdfelkkgn26JyWl
	uUva16IQEHjeHl0V7o69UjoGlLlYfZH8g0PPgflj7Eqx79XXNIoWo1FR5BzDCagDeRsXyvdqpRT
	SyCBRr+VS0fiUcnIuHdfSpxu+ba9QJIxouocmhIn/cWmqLWYA==
X-Received: by 2002:a05:6402:4018:b0:6ac:62c2:bd35 with SMTP id
 4fb4d7f45d1cf-6b408ea5bb6mr75290a12.13.1792535888632; Tue, 20 Oct 2026
 15:38:08 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020223002.1749284-1-rosenp@gmail.com> <179253561146.3290.7437858872851210199@kernel.org>
In-Reply-To: <179253561146.3290.7437858872851210199@kernel.org>
From: Rosen Penev <rosenp@gmail.com>
Date: Tue, 20 Oct 2026 15:37:57 -0700
X-Gm-Features: AclHuK9SSZzO39ohnmmvK6xYVSjvLP-OkhM9UD2eXH3736I82s6zox-rYqEtSkQ
Message-ID: <CAKxU2N9cQjHtoKBLkoOjFQzbz9xzmMQ_UxvXB7g6yvVxK_YKwg@mail.gmail.com>
Subject: Re: [PATCH net] net: emac: release DT PHY resources on teardown
To: netdev-bot+sinfo@kernel.org
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Christian Lamparter <chunkeey@googlemail.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2026 at 3:33=E2=80=AFPM <netdev-bot+sinfo@kernel.org> wrote=
:
>
> Hi!
>
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
>
>  - How the issue was discovered, e.g. hit in production, hit during
>    development, syzbot report, manual code inspection, LLM or static
>    analysis tool scan.
LLM
>
>  - Whether the issue was actually triggered, or is only theoretical
>    (e.g. found by code inspection). If it was triggered please include
>    the symptoms, like the stack trace or error messages.
>
>  - What hardware the change was tested on. For driver fixes please
>    mention the device (and if relevant firmware version) used for
>    testing, or say that the change was not tested on real hardware.
>
> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account. If the series needs another revision for
> other reasons, please include the information in the commit messages
> then.
>
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.
