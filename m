Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793914453;
	b=EOhfhlbq7lHBiMpzw8j40aiI/acpBFd/WhOK+KE2/AwnNI/SkkOi1ZO95qFBXMr1NXnH
	 AnYJl6HSDtR2MVGveotgyuGGfgYNmNehRrEkeSM1/k0rbH8eP3E+1rVHOPGf6xHA2zw0L
	 r7QRRXFrAwjoGvxHPHcZyXNwOy4JM9XSfw0BPyse2yiqSUweRzGJ8auu2P27sdN9fvqB2
	 epXwTPhXjaqfyJJ+yfAJz7zkrvnWZqrF0ssEo9XcLqtGU0XTt5kQJf5q533KCF3YSz1bW
	 JlxdFmjrMornLuzgQ5+cIoNymRV6rS+kMoC4wX7u6xg3k4yTUR5oxVbPtmCYFJOHjhA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793914453;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=SI00QxGGBKrcJzsigG/IXk3v6J7kiDinn5cvl23JkuI=;
	b=CYbPvzXzDz000DUzw+YLgPtYHrhTf0FLC5Nu79CUZSuP+hWqMLtXGJQe0rVVEWxQiNk4
	 yXxfgp0DPeV4+fMOF+yVUuZ6ptCDarXCyG/s09APM62w2Hfjdj8vMUIV8H3fqkovuAD/0
	 uIRB7ZV3g6JQWnNZr6N3YQQgOpKsqwnJXBhi3DeYXW2/wYwu1BN0beg7JgcKgIr7ciu3g
	 L44pclgSxxJyP36TPPrLhn+2sp03sOsIBMp1RwvAh5Mzfn5Im/stA3h3n/MvbE2PHu87Z
	 kx7ghVMwNg7jjIiUxxzgBNtD0VlKafPQhMjOAyT9HZqnwTwrWXo0gHtpN5dtkZQ/vrQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Hl+ccYah;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA43F606D83C
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 21:34:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA43F606D83C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Hl+ccYah
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b1afcd2d23so2300200a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 13:34:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793914451; cv=none;
        d=google.com; s=arc-20260327;
        b=UIy2CQxeeWdCMW1ErdwUDnxI+pSuiK/MQKP8fb6owXVdsnOOyI886fBEyqtQnCed18
         EYSHjrIXwJw3b2N6xb/CnXB8JmgdKWmIk6QpqK80fku+btz9XZFUzdwgiMRk5ecxOmW/
         FwecTYaOVgf23qWPtdEyLqWRiFnSpGMF/N9gBZoJmw/4sHe/7SVdvOROst12lqlA6P3t
         PhCEFby6fL8sGTKNM5gx9eCaRD3ruEBgaq/AdWn0BqTN8WlXQVN93MKTl0+TTnAteREn
         tfaeRL2vL5j6BP3582w/x0tlHN3UKDH4Zl0OzYKZH9zojkM8xsqrc5gTuEGu/6CNUEQY
         EDyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SI00QxGGBKrcJzsigG/IXk3v6J7kiDinn5cvl23JkuI=;
        fh=3btH3VHMwzH10R3D9B0slkTd7RujN+Ay+2s61xlQCJc=;
        b=dR4r/N1q0e/KZRUaeFlRgDLBMp+KXdwXKSpe9XARN4KUY1j0Fe7Rhhtu6+JiKpiHAW
         8oPq3g9LxPtG29cwLUT6eE0DJnnoLod0eLm51wDMJrIZAu4icrFQoouakXzGRURTzL6F
         vmaZxBrZIBqrmj+MMxr4sFYD8wC+hM0uPgGcTyY+axqcrwcx4HBcecwg30VPA4mdj4Bi
         FO8Me/GAWGoWXoK6YlQnhKM4+UTSc0GvDy3gH/mCS6V3PQC06LYPuUTt9Jp5kPIeEs1y
         UTygr5dZyXNX/9GamqsMQWZobftPVmOmMuRpppBAcV9bAX+Aj9vJNW7M5joJ2sDqDdls
         bStQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793914451; x=1794519251; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SI00QxGGBKrcJzsigG/IXk3v6J7kiDinn5cvl23JkuI=;
        b=Hl+ccYah2c2TJGKzEuwCSZ2271/KIZUZBHSnk/+2IE/cCUZsXxa2GexStU3GPccu+L
         c9pguKwDW+Sf+Fn+GA68uVtKE0t0VnesyC9yU3Jw4FKh2SwwCcWgdL2nNGu0/Ie35U8B
         MGFXARhSF03AY42sAaITfjloe8nQY7YlibBJwWQhm2G09NxtgMXOGI+31ENhOhfFM+cn
         w91MMdS5EWN2I5AhdOUPtXuGCNt3rlaFsouQf6OUuSgJlQBtaB8pXMA4WlaGx4kg9P6M
         1zDjWLxzILMZlaS3Ofwh41t66qSb1pk/CND/b/5SIoRVPIhCTDyNDTAqPkiK5WkbHu3D
         c5EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793914451; x=1794519251;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SI00QxGGBKrcJzsigG/IXk3v6J7kiDinn5cvl23JkuI=;
        b=xKS0elTBOxvp12Zfo+UUxtW3sO3oVsCJp6pL13eN7k8Ze6AVca9QEt5VxPQr9GNTry
         oKPpBC6dRmAujC8SAkA+hM9bGe9irGqjxhs3hEHcFHbynPGbwEBX2nQL1EscLoy32dA5
         FmwgtJMW/yeh3NJjhCtHI1/B0JYR58Rka/KiQTSYmr9ipCUkbR73RE7YSzxmQ+FLDYAM
         Hawzu1utlamcuNAjKvJrATu7TDZSytsldklMvlbwcIq+vCOADE1M0Irdp6+7PbP3DsjK
         243kS19KRhiHTNtLhO41I0LfKUeCC4ncXuDCzsp8vvcHdvoRIvTspIMpsrYIEHqIEgH6
         c5fA==
X-Forwarded-Encrypted: i=1; AKwUvBzYZbfX3zv6Hla22moEica8vAGbmRkXEo78ssYGHchvWbJSAxoy1F7lEWK5Wfc6jI5SEKcUDWEQDZN8jrc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/FYYQMaPNgRZEZK3gpsr+qBXMcZNjsaw22LeiAdyjXuHP2RSEM
	7HFbzeDjYXnVZZFuIr5LyexkQMxixMsEqSiPhivq///Vf6mymEpBjvV8hLOT2JA5cu9h+dfp9o2
	2RZI0/ZAtf115nlc5G5zlB/fr1ZqK9Gk=
X-Gm-Gg: AYBFou1y72WS1Bh9UuqxkH85DLhITX0T2EQN4GSL/7pcmZDMj3vfURH//zk7k2UQhB/
	ZlUT/wjoZaVRhFxtw8tpgZdBsXOWPZdth5r9URwGX9o0N0/2X9xv+FStSPrezgYtZdRZanKpooo
	lHsu2G55GDYfVBPGnv8/1fUBLxuKYNSsBrz9qj8gIZpnBiK7FAcQXCymod9LkMpsuBjxGNkbQsa
	tigy4Rlj2Htb/fYVAwdFH1MHcVdzP+zEbotL62dmaAL3CpPIb0cOaszID7fOSG1XYO1Kbo6W5Ru
	jcqW4l4DRE8q8hpsqLn/n841bVQqcH4DmdjZRUcn+74qxdLUtinSGg8YKugGa+ccqqgQMdcAblp
	CX/EG3gCa7rGAlzWtuYjcUNGKLmRquii6mkdDDyISIT/YS5BEGU3CJ5vRWHOcTNUZxHhkY9c=
X-Received: by 2002:a05:6402:3883:b0:6b5:114d:cf36 with SMTP id
 4fb4d7f45d1cf-6b597474b45mr392264a12.0.1793914451121; Thu, 05 Nov 2026
 13:34:11 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261031010232.3361085-1-samarth.colleges@gmail.com>
In-Reply-To: <20261031010232.3361085-1-samarth.colleges@gmail.com>
From: Samarth Narang <samarth.colleges@gmail.com>
Date: Thu, 5 Nov 2026 16:33:59 -0500
X-Gm-Features: AclHuK_MtBiurCXf6HQzaNhcFD5EDBMpBf2QfAxGsVk3Isuov9i5p3cCovbCXtE
Message-ID: <CAAbz3fQbs_+aubvjLmApkGaYtiAdQLZ0RRJKjjpRogFQmCDeQw@mail.gmail.com>
Subject: Re: [BUG] crypto: starfive - DMA left running after timeout while
 buffers are unmapped
To: Jia Jie Ho <jiajie.ho@starfivetech.com>, William Qiu <william.qiu@starfivetech.com>, 
	conor@kernel.org, kernel@esmil.dk, hal.feng@starfivetech.com, 
	changhuang.liang@starfivetech.com
Cc: Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, 
	linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

The two addresses listed under STARFIVE CRYPTO DRIVER in MAINTAINERS
(Jia Jie Ho and William Qiu) both bounced this report with "550 5.4.1
Recipient address rejected".  I have added some more folks on this
thread, who seem to be active in the STARFIVE ecosystem who perhaps
could weigh in on the report quoted below.

Thanks,
Samarth

On Fri, Oct 30, 2026 at 9:02=E2=80=AFPM Samarth Narang
<samarth.colleges@gmail.com> wrote:
>
> Hi,
>
> I found two DMA cleanup issues in the StarFive JH7110 AES and hash
> drivers. On timeout, or when preparation of a subsequent descriptor
> fails, the drivers can return an error and unmap their scatterlists
> without terminating previously issued DMA descriptors.
>
> Line numbers refer to mainline at 83f32c773255. I could not find any
> dmaengine_terminate_*() calls under drivers/crypto/starfive/.
>
> 1. AES (jh7110-aes.c)
>
> starfive_aes_dma_xfer() submits and issues out_desc on cryp->rx (lines
> 471-472), followed by in_desc on cryp->tx (lines 481-482). It then waits
> up to one second for the RX descriptor's completion callback (line 484).
>
> If the wait times out, the function clears alg_cr and returns
> -ETIMEDOUT. The caller, starfive_aes_map_sg(), subsequently unmaps the
> source and destination scatterlists (lines 520, 540-541) and propagates
> the error.
>
> Nothing in this error path explicitly terminates either DMA channel. The
> descriptors may therefore retain the ability to access their mappings
> after those mappings have been released.
>
> There is also a descriptor-preparation failure path. If
> dmaengine_prep_slave_sg() fails for in_desc (line 474), the function
> returns -EINVAL even though out_desc has already been issued on
> cryp->rx. The destination scatterlist is subsequently unmapped at line
> 541.
>
> Since the RX descriptor transfers data from the device to memory, any
> later execution of that descriptor could write to storage whose DMA
> mapping has already been released.
>
> 2. Hash (jh7110-hash.c)
>
> starfive_hash_dma_xfer() submits and issues in_desc on cryp->tx (lines
> 150-151), then waits up to one second for completion (line 153).
>
> On timeout, the function clears alg_cr and returns an error.
> starfive_hash_one_request() subsequently unmaps the source scatterlist
> at line 235.
>
> The TX descriptor has not been explicitly terminated before the unmap,
> so it may retain access to the old source mapping.
>
> DMA provider and possible consequences
>
> On JH7110, the AES and hash DMA channels use the sdma controller,
> associated with the PL080 DMAengine implementation through jh7110.dtsi.
>
> The transfers are flow-controlled by the crypto hardware. I could not
> establish from the driver source whether clearing alg_cr fully
> suppresses further DMA requests, drains requests already accepted by the
> DMA controller, or retires the corresponding descriptors.
>
> Even if clearing the register prevents immediate further transfers, that
> does not by itself establish that the DMAengine descriptor has been
> retired. If the controller can resume the outstanding descriptor when
> requests become available again, a later crypto operation could cause
> accesses using the previous request's mapping.
>
> Depending on the DMA mapping configuration and subsequent memory reuse,
> such accesses could read from or write to storage belonging to another
> operation.
>
> Proposed fix
>
> I think the error paths should explicitly terminate the outstanding DMA
> operations before returning control to the callers that unmap the
> scatterlists.
>
> Specifically:
>
> In starfive_aes_dma_xfer(), synchronously terminate both RX and TX
> channels after a timeout, and terminate the already-issued RX channel if
> preparation or submission of the TX descriptor fails.
>
> In starfive_hash_dma_xfer(), synchronously terminate the TX channel on
> timeout.
>
> Both functions execute in the crypto engine worker context and already
> use wait_for_completion_timeout(), so a synchronous termination call
> appears appropriate. The cleanup would need to preserve the original
> error and account for the outcome of termination.
>
> Would dmaengine_terminate_sync() be the preferred approach here, or is
> there a crypto-controller-specific shutdown sequence that must precede
> DMA termination?
>
> I can prepare and compile-test a patch if this direction is acceptable.
>
> These cases were identified by a research static analyzer for DMA
> lifecycle ordering and subsequently reviewed against the source. I have
> not reproduced a timeout or late DMA access on JH7110 hardware. The
> reported issue is the absence of established DMA retirement before
> unmapping, rather than an experimentally demonstrated memory corruption.
>
> Thanks,
> Samarth
