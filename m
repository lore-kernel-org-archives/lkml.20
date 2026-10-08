Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73EC93F39F1
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 08:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791446504; cv=pass; b=IBOx/RblzB02smLkO9Ficp9A/PbHbJ0gHetJ/PYFVlZpB0ePFV3z1YW63QsGd3Mjr/+jx4xmUq/wJGS8cJIjdtDrSo91OIIAWJ3rRbzjDsWpz7MNj/bjAlCcNHmuJ9BfC9L6vgdkd8mp0c9d0mYOeNuzT07Kdbo3OdR5uUFir6o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791446504; c=relaxed/simple;
	bh=R6nAreG5dHBsQuH2nuqKg9p2FY/GhdxubP7/yDE5muc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XYdMDWH+F1yVt+OCZ2q5YWjKvIk+kTcWqhMXdyZ7KH7PwzmlJkdY4nGG4quWNPyI8hIWicpi02QDpvPpRfDPSoHdEtlxuVe1FDVUFIFWe1SijBl5j1NxjY/suNuqngewgIze1nbMeK0NgVcpAIx6TK1plXPPuwXOdJzEGVsCZro=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M40mbaAU; arc=pass smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M40mbaAU"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c2e38b61974so11277966b.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 01:01:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791446502; cv=none;
        d=google.com; s=arc-20260327;
        b=kj+kYFLpR7sM29y8CTTuBNBLydKXHzB24eDnbDWJjgjQ02Efhq6Swr9bc7mvpTiC8K
         BHWB4t2aiaN2C/cPnOeeCcCQZOKP7o9cgxFzzV6aujYZndOZ7H8UrNF61wB8LTwCzLCW
         p/28Lv0G4C+lwArMvw9XXrm+jMVEi4zke/Yg6CXsfM2w5lCa8kgzH/AX6GmEwaXyAvhv
         8Az0lF7KqbJKgO1yx0oNfaRlyHXSyqc5Ht1waeKY5aXnHi44QWUhwMd0F7hGS5++t8AG
         dTke9FRCQyNw53FwAw4FWiyOdXxvG4bB3tNm/Ff3jGq2oZ/YI3k67adkMLkpCMHdZ0XO
         7FWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VPO3NQmYgI3jpB+3gN4RVKiWcaKRTUg4yVkiuK0YsXU=;
        fh=7Rt85d2MtyS7khthmnj7xG24Cb4a/Dw4klfwqEfRbEk=;
        b=HxaWQg4BV+WhwLRQXjAsFgUlZAnSrJTuMW9wwAj7az0/wiFuTgtT8PslAa41AjOgB0
         +CjTbYDmGtUh/lr87QjPDuhePRWTTlRaZxZizupw4W6iEouFnlWRJ5C5rhX+XUdCgMqj
         bv5AJqUdV1tJwE31QmojXRwKKuc1IMP9+LwCy2yJdiOAndI5S5/ifoZJ6G8R3s0EyrZU
         /vrs129YS55w4s6daPbeP5SOIbNCHdKYFHSuxVcDYIKxLsK/K0mIBaUs3p6z/PA4G9f6
         JD89Xa5N3oxng/lTtXO/AX/iD82u01UUlDXWIQjdBOXOsOaDn+P9tW2zoiAKo5UvHo7i
         F3nw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791446501; x=1792051301; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VPO3NQmYgI3jpB+3gN4RVKiWcaKRTUg4yVkiuK0YsXU=;
        b=M40mbaAU/Gn+59DUGIfGSOs6kK8wKryodWBOBOF/f8KPJhSaAjY09LNfziYU8I8qXh
         NExf/vKRwtFjUvZjw5bDJBfrxMNrSNdTQbZQ4my2vw0XSwvZTnXGQ9qq/Ckn+/RGHkMz
         KpRxdlh9mLyfjFCKlm7lj/9339N9oOt/reTLg5mfIz+puzdi7AgEDrluk4RB7ZRUlgK+
         5ryEosYPUsM2Ix92GzLdo63Ivnm6BinHA1GGL/Hx5Ao+TmP6J41+Vb0EVAozzhTPGWXn
         sidR26gpxGwwi5vJtq+4tLPL5JHy4ffg75dfEmOCueuODHg9t6uKytP6wDvjOU3CK28Z
         aGeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791446502; x=1792051302;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VPO3NQmYgI3jpB+3gN4RVKiWcaKRTUg4yVkiuK0YsXU=;
        b=ieLNDAazaFYNoEIucFcLttK3fA98BQKaGWWrGhGlED06rC3Rn2e+bSLMJUVbn6pwbc
         vuSrtAAE5S68mnGoZ+n2B/10wmydVgjmXGAEempFDeASMCHArUkjJn8i7p3okBPdE258
         Ud+GJj0FK8Gq4xNmw5YxS71At/jJ34c/HZqdxteOxHHrcoBWE7Vm8Y2uwUue5RpqhN20
         fLiqVDro9FTIu1TaKtxEhkxC/QfZiMUgQRLo7JymXBCS4xyKITcjooSEG4TiVkf+87Ai
         BDAL2KFupVxPlAmLOY5objsL9Yoe+nmbUUmyFOxC3vlA59Elt76g+CPklRK8Y2u+BH7Q
         bsIQ==
X-Forwarded-Encrypted: i=1; AKwUvBzc3KKelV+Zl2gmHchM2ZPcI8+OaMhLAnFpj8iGKbo12pEOOdhSvMvps+ywLsOD3wS0Xo7mJIR6c0rxZGA=@vger.kernel.org
X-Gm-Message-State: AFuF++mgJ4sji8pVNwdahEhAe56e6Xzr5ORVy2v3KhsZH+T0swbyC/hl
	tqRuAl6inaQvnUwyesr3zkGv4Nk0yJo18ck5z9D3zfWZhQ7Ofhxh1BOojiZX6/88s7jWY+CgmfQ
	Tr5QPwmn3x51ZX3WyXQe1uHFcCUgUBEs=
X-Gm-Gg: AYBFou38d0crc78MCWNzyQcKvsAyCLQnTBV0oYvyVv8cTbLKNveDNRh7t67vsmLQTxh
	OE0clJ7b6wQfW00fwf4nOVo1QTnUVeN1o291fDZGlfRhe9ag4W5hkqoS/GLTVYg7X19TfmOuMl+
	yxoqy75y4HdlvOZGh3FTrzUFLJgC4ADoYQEzLrnYHed8Mf1nOOTn799uzxTPOyPtAdDXIcfE3l2
	VCOkcssYqLXWduBrW5nrfrQRQz/9Lgw/pKeBGNqmcAe6XkLOVYsuDV4WJRZbZcjrEwFvq0ZFtcS
	b30R4A7YmrZKHmBbLpiC6xTE4UDJXWWOJ7i9BAcm5VdOtQLjpzDjS+v2dDQOfCeiM2Awgjl8fjc
	YUtiSq7z2xiu2IM9EA/HgTQ==
X-Received: by 2002:a17:907:2da4:b0:c2a:f931:3fbb with SMTP id
 a640c23a62f3a-c3190c21de7mr152857966b.2.1791446501129; Thu, 08 Oct 2026
 01:01:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260927064434.3692113-1-nicoyip.dev@gmail.com>
In-Reply-To: <20260927064434.3692113-1-nicoyip.dev@gmail.com>
From: Chengfeng Ye <nicoyip.dev@gmail.com>
Date: Thu, 8 Oct 2026 16:01:29 +0800
X-Gm-Features: AclHuK_Lktj7p5BchFdW-xuICfCC3cq_YAKfmoW2RSWguLyK9_uNfG9-zdSUFUk
Message-ID: <CAAo+4rVktdBnFKfgJ5PjEQsXqHAJ=NuOXNyhJHQLkej+vGKVwg@mail.gmail.com>
Subject: Re: [PATCH net] rxrpc: Prevent reusing service connections marked for reaping
To: David Howells <dhowells@redhat.com>, Marc Dionne <marc.dionne@auristor.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>
Cc: linux-afs@lists.infradead.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 27, 2026 at 2:45=E2=80=AFPM Chengfeng Ye <nicoyip.dev@gmail.com=
> wrote:
>
> The service connection reaper changes conn->active from 0 to -1 before
> unpublishing an idle connection. The I/O thread can have already found
> that connection and acquired an input reference. If it then allocates a
> new call, rxrpc_alloc_incoming_call() unconditionally increments
> conn->active, changing -1 back to 0. This violates the reaper's final
> assertion and can panic the kernel:
>
>   I/O thread                           Reaper
>   Look up conn and take input ref
>                                        Set active from 0 to -1
>   Allocate an incoming call
>     Increment active from -1 to 0
>                                        Assert active =3D=3D -1
>
> The kernel reported:
>
>   kernel BUG at net/rxrpc/conn_object.c:465!
>   Oops: invalid opcode: 0000 [#1] SMP KASAN NOPTI
>   Workqueue: krxrpcd rxrpc_service_connection_reaper
>   RIP: 0010:rxrpc_service_connection_reaper+0x768/0xbc0
>   Call Trace:
>    process_one_work+0x5f2/0xf20
>    worker_thread+0x46e/0xda0
>    kthread+0x2b2/0x390
>    ret_from_fork+0x36e/0x5a0
>
> Use atomic_inc_unless_negative() before taking the call's connection
> reference. If reaping won the race, leave the activity count untouched
> and return through the existing BUSY rejection path without consuming a
> preallocated call. The caller's input reference keeps the connection
> live during this check. If call allocation wins, the positive activity
> count prevents the reaper from claiming the connection.
>
> Fixes: 3cec055c5695 ("rxrpc: Don't hold a ref for connection workqueue")
> Cc: stable@vger.kernel.org
> Signed-off-by: Chengfeng Ye <nicoyip.dev@gmail.com>
> ---
>  net/rxrpc/call_accept.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/net/rxrpc/call_accept.c b/net/rxrpc/call_accept.c
> index 47824120f1da..87bc3af2208b 100644
> --- a/net/rxrpc/call_accept.c
> +++ b/net/rxrpc/call_accept.c
> @@ -299,8 +299,9 @@ static struct rxrpc_call *rxrpc_alloc_incoming_call(s=
truct rxrpc_sock *rx,
>                 rxrpc_see_connection(conn, rxrpc_conn_see_new_service_con=
n);
>                 rxrpc_new_incoming_connection(rx, conn, sec, skb);
>         } else {
> +               if (!atomic_inc_unless_negative(&conn->active))
> +                       return NULL;
>                 rxrpc_get_connection(conn, rxrpc_conn_get_service_conn);
> -               atomic_inc(&conn->active);
>         }
>
>         /* And now we can allocate and set up a new call */
> --
> 2.43.0
>

Gentle ping on this patch. Any feedback would be appreciated.

Best regards,
Chengfeng
