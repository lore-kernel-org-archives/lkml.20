Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793958852;
	b=L1QVe1y08xdCNPu/gdH0b7SbGa8FDmgQB5wDDOXnvuZwBG2ZxZ6ER2ylVO8J/PSrhR0G
	 +PcC/UdTKPTcnQfPhzNBietiE0/gOlZVCV77vdisu8B1sc/JTONhhroPvPL9/CBm5wyCl
	 WT3AwX39tLClP1Cs783f1TnTzXio2gizR5jOhEAKXBg8w2/FVl8aYcm0PZ/gdVVjK7aLb
	 61SKb9k+ISiG8N8sqhr6oUaKIBgGNZv7hA4qxcb8SEkFT/1+wCRneYznJOGLejT++4YCd
	 hPKs2EfXe25HYn1J9DcBBQP2t64AYUzVhjGKk0HyebtoHgDmC7Rv3Ii7gWCmjj4u4PQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793958852;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=/qUBJvia8A4m8j44qWWCxqxQxXk2NNL+JHI+sUxPvXc=;
	b=m5MmR9NG2K5vAU7ZPYmnXMTfEmaEsqAVl1Fv3lOjAulgea73MMz+rT33YK2jZX5Jxjj/
	 yYnVPlxKSIAZ7ExcbvCk5pOr2URIMNqGhoU5WaMHYwthUfRCtvV/HxwFnOGEU1ya12xyu
	 nx+62b5tALcqmVpjk+uJ/67RWwTxqgMLhtG6f+iGFuY8x/2jkBsEoV654m34utndkJC7C
	 kcmwWP5zPHN9wy/W4YyLcNLvtwArNosil5To1URNlfxLYHqI5fIm/W+5SK5DbZ0i8DrLp
	 MUvC2rnuVHCyNTGf/knTSdLaSbthp0RPdrgIz0Bl7tZBD3kyp2wh/53hWx1bXb7ImvQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B2GNyqHT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.45
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8E2F606A33B
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 09:54:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8E2F606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B2GNyqHT
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5bcb6faf862so418560e87.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 01:54:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793958850; cv=none;
        d=google.com; s=arc-20260327;
        b=D3xBNL8/2BCYBuWzI4nmXgIgcHZ6J0bCfQRqFzEIUVDOynqa/lLmsfuB7oOjolcB/R
         bfw0sTJpqIhDkKgpm63cwqL/lpKGGrvgqmL41Mst0SPAFl4q2HVINm8LJ7DMOa36hNF1
         sablQqToexLf+kp3/DewvXnUkIfab2myviwSWFkqWhasxqxRgjA48CJX6nL1DiuceE/9
         m2PQVJczMceN4dyjCe78FoYJL+iCOkfF3VoKm+CjsglFBNSui87yLl/5SWXkXHezr6EG
         0K29l46j3svpplWDZBVN2N2e/AaT5Zyvb/utVJ1Ylmv4Ff5P0Hs8kocfEiuEHZOEtVd/
         o83Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/qUBJvia8A4m8j44qWWCxqxQxXk2NNL+JHI+sUxPvXc=;
        fh=y70lOfCnXaNwURK0pvRdoJQPGGhss1zGb8t2rTpxhPU=;
        b=ZJ6xpuCbHmK7fiYbTlpK57RQuUPTY0JvQHt81uCbvQ4HVMzEKrmOwyJ9wjXmSnzRxJ
         ywAIg1H/SRWdcSdYzQXJxU9U3awyAlWsbew8ePHeW7DYAVSfOdyiIgP3peBxNL7alKar
         vRvSJqW/MY2DmjCMd5uIwGRLTGv0TqZoXFb+xLDVWg/sPai4dEyJPLvRy5uAYkKZs+z+
         bOiDehVaqHY++0NuQw6oHdJ6RRC+VTqaYdg0DicCbY0ET2wAA+KLmlQ3sySrwFX1wfXS
         7DHUZWnSdXoEOs8WU4jIKqMJ2KGeQBaiLjc91CIDJrRGkWpBF/UfkpqcpSJpRyGU4cN0
         R2Vw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793958850; x=1794563650; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/qUBJvia8A4m8j44qWWCxqxQxXk2NNL+JHI+sUxPvXc=;
        b=B2GNyqHTw+bplblnkMuH26j++KRCL/oDDyzsrqB1IxCYAMLGUYggu3gxNT2HsNDBzk
         6E5ynqe9zZI51CA4CZ7J2o0PRN36aP2IXdnJcNRVXbZcG6MeKiFfZKhF29i2YRSmgFQs
         g7R5UdpgjxiTPB/5hvukxDxMhF+d5+9E9to2AT7qKjgCT3iNz8qv7pM25iAPrftwNAfI
         L19rw91YsEZrsLLabtq/odhS9rCw5LlF7vEIsP4+WkK8ZQK3S6BeNJueb9m1Bo6vsKze
         zRxwFuPIgYlpu7mJdcYd5igFvAibYDqAUKXo5sBnWhDU+vtX95zUCXDCm6PkmsxiH+IH
         EKhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793958850; x=1794563650;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/qUBJvia8A4m8j44qWWCxqxQxXk2NNL+JHI+sUxPvXc=;
        b=f0MK2AqjAJjzK7ddJaoKaFYhm6OTy6IXQ5D+f0kyqXnzp2yLFoRwgA8OvXV4R3FiUe
         lL33yaTABxH8UQrqzEHU8Mg72zkxxQm21zbDcgIRHUn6Pt0rFGDLtDzL+QxySbliFWes
         yomBaerf1o2CNRL2HroVFBSBSVDQYMCDHN5uXcQIiKQu+fkENfCdoAnD9EGsOGCLeuGi
         6kCd45risDpgl94epVa0rLkzEVRtOxavzSQ3+akal0po6QD0SqQefoNhNUxniEdo1Kmq
         mt0mX7owKIjzTZuljUymg1mKbKj/bY02LdTnS8Q1zfDWs1Linhaf6UPwRYc/bYAPa97d
         6BIw==
X-Forwarded-Encrypted: i=1; AKwUvByOQlaVL4+p+5Dq77J9XayPCXKNW6GO23IuhKAkAo3s2JrEqO6lSsr6/LB1ibI1o+5i1FpoJuDnBhhQSQU=@vger.kernel.org
X-Gm-Message-State: APuU4Z93j3AYNgoOkHxmPI+2ZKinCrc/9wu62lseYIUBVxjE6OVQHFLa
	XISc7kisQEjmyl7rXD6b8KkUQeSBvkxv+6rvNvZr5TeymSOC7bDeb5QVIvugp1mcYYChT4HCwtW
	Q6ZFd70pmOdohN6C00l6WDr8tnZfmV18=
X-Gm-Gg: AYBFou1fP0PzBdCcBfqkYmsXDYnDrjWsq/WTxLYUjAFQBAcidFJzmbmj1zT2EGIJuGR
	xx+yX4vPB3djDqpwlys2enDLYQhyJyWKFbNU9722C07io5ChGPY45pGnzWxa22sv44CpM8vNBtf
	Rn2JVJdvpVZ0s4jkVsswlnxvNEbwk/lJG3dILtVCjl1MdY6DkQPiOxlLF8S0IY0zmWVH5Kdref9
	gVOipZfneFK9A4bYI8jtltBLk8HCthw77y7W5K7sRROXaCztK0dZ6tAWTxaFqa4jlyvcSIbyOTw
	5cjzWBEBvdwVL9y5ZIA5pNwcpZ1Gya/qDyJ4ZzkuAkWYPNQHE94fLCrtuIIlUctlgdjz8uFqDYB
	2oolaomQ5TuseaTqCigtjWUXkdMTsQ0sVQLUnZ/RteZU8MmHbf+I4S5p8Rnp6Cxego0aI
X-Received: by 2002:a05:6512:3f23:b0:5bf:c239:71ad with SMTP id
 2adb3069b0e04-5c003ad0afemr607795e87.38.1793958849775; Fri, 06 Nov 2026
 01:54:09 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261017030927.345454-1-suunj1331@gmail.com> <20261023115747.2545223-1-jinyu.tang@linux.dev>
In-Reply-To: <20261023115747.2545223-1-jinyu.tang@linux.dev>
From: SeungJu Cheon <suunj1331@gmail.com>
Date: Fri, 6 Nov 2026 18:53:57 +0900
X-Gm-Features: AclHuK9nk148RfY2GyVdkkH5dnZpSne9-B4ydq0oLeo4XvcO3mtFibrpLrfrSO0
Message-ID: <CAGwK=3r0LRuhYNWZ1Rq573qWFv9HNwHE_MxqXJa6Bfuc1QtWTg@mail.gmail.com>
Subject: Re: [PATCH] KVM: riscv: Only fast-path dirty-log write faults on
 host-writable leaves
To: Jinyu Tang <jinyu.tang@linux.dev>
Cc: anup@brainfault.org, atish.patra@linux.dev, tjytimi@163.com, 
	inochiama@gmail.com, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, andrew.jones@linux.dev, 
	pbonzini@redhat.com, seanjc@google.com, kvm-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, sashiko-bot@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 23, 2026 at 8:57=E2=80=AFPM Jinyu Tang <jinyu.tang@linux.dev> w=
rote:
> Tested on QEMU 10.2.1 with a private memfd mapping and dirty logging.
> A guest read followed by a write corrupts the shared backing without
> this fix; and with it, CoW occurs and the backing stays unchanged.
>
> Reviewed-by: Jinyu Tang <jinyu.tang@linux.dev>
>
> Thanks,
> Jinyu

Thanks for testing this with a private memfd mapping and for the
review.

I'll include the additional fix pointed out by Sashiko and Inochi
in v2 and carry your Reviewed-by, unless you'd rather take another
look.

Thanks,
SeungJu
