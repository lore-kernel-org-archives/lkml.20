Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792693692;
	b=Hi5TRG4BsvKl1Nk6ir1cYvpfmL651eUCaR6c7YaQdFd7xye1FFTU2TtsOu2g3/wFMj4B
	 0ebOxkSyxZS/SXr93JkPrH6iOoF59o8DS/1N8KX8uTRzciop3SZ84xf6tjjsQ30VByG/c
	 3MVolPj2/jxhFHG8mzvmfQZ0h+0aYR8hLRkz4PsviPWjEd66Ghjes1C/cTMu53Vs/vOl3
	 gAyo0gNjP1ffUUPbii4zGh8mK5aSET7enoBVToA7k6OdrioZyYfcblHl1fq0TJ1mJSDdW
	 n4ILUG4fvwX2jEsqXFOOnL4Mmdb14tQ6GkkPkDoRJqRsE3rPb3Sb2Hoy0ttnrlDEIXw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792693692;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=S1+YftKx+XxEXX/NnNJUaZR75ZwyTED1s15L0G8bes4=;
	b=vwCiaXWDaI/Z75QFmIWcFCF8idZv/gOAfeIaRMafDKrLGtKlQn3ap+WlKFaYMcmZms4K
	 mXezvDEEKA6fY88Uq0/yZVfh3bfgmVfxtnVX6RkD/3YcSkqQKrnrut3acjF6htjwVdgpY
	 oLdYajLzF/h2CHjSmLBWKGpIRqnFLpP7a33FwK3wquzh8VVKAnTQhHTEmAhn8yfivrwTY
	 B8uWmubtK6VdcEg/7ZUJyCEt42ccweD7Vgs2ezliX7zdzZlKlrlzy01OEoQIT9OfUaeMZ
	 KySqy7shak1z9/ibsnfZNTphitq7AFZ2XlnwK5nI3CoEDKCs30OSXPwo1v2nV637K6A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gdSzZV66;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D967E606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 18:28:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D967E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gdSzZV66
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-185fd3a4ca3so52557c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 11:28:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792693690; cv=none;
        d=google.com; s=arc-20260327;
        b=DDWfVjAv9RpagJq9Z78zzotJPyY8trFp5iCoIGs+ptK3ZFz29f0koODPX6U6eozn5R
         opCqc7dvBV86cOxi+OR51bqIuG6WzjFjymCIOXM1+sZg2hoL9OfxIs0G9hwiG0BGSeLU
         WE4pv296P7DLilCJ1DvlA1MdcM6+cVj6wpHpHpe79mOow0OK4UV6qJ6dhsTvAcc1hdaL
         O8gaZKXzKH+owUu9xpaSznS4T6/Ng0WJvOHzsCRqz5ypgH0Cx9W36rUwMPyYSr6ObTcd
         FlIZOs6L6r2w3l+5Xna3If6OrIBMenQpiz/g7OEyVxGGXLPn4z4m0NQlL16S957cCldo
         VIvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=S1+YftKx+XxEXX/NnNJUaZR75ZwyTED1s15L0G8bes4=;
        fh=Xp7Qnw7qhXN9HbQVCgP/hO0C6z93uYnMnjDcmPN52cw=;
        b=IhQRiGk25BfdXU0Os7uDNGd5qazAUZQlrbdwEqJ3QdBfhfZzXMM7W1Zo88bUAvnK1/
         RPcMM9txlwl8ZGOosSXkFJO8TtLMyyLWh3lZ61P8YdD+0trWz2wLFfJkQJ/soTSVlhH1
         VAqTDiz8IsNPjKlBrp2blk6txmyZcCcc/+Q7iP6i675g682ahf4knNCF8B766EbKES+J
         BNkZ5gUJaVcUHlvrj+ec12Jy3cyTQch5jqdu44jV6Dmfu/cXFfl8kkLtNc1kTySBCzvl
         gQ4OwcAtuTcuFUOLVyCKWymkNsH+QNqmQweqdt0qBiHsIdktpYhHBOBxKIWZMg6BS3v0
         FfFg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792693690; x=1793298490; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=S1+YftKx+XxEXX/NnNJUaZR75ZwyTED1s15L0G8bes4=;
        b=gdSzZV66Whs1yT6V5lTsMpJmNYjTchtBvkIP0XNjJvGHR4e4uc9Zb0Wz7lCtrbDj6w
         dM74nZTziYfb0JmosgubFM93InqfTEQm4JqX5ElxxFl5fCuXpV1RZ5fFlViKt6XLNPza
         FCMoRnL5Wkz8Cj4P8bUZfSTzu67S8c3WfVXJhsCnvz1b86fbkmfVlVIiO9t6lhBdi5zM
         6+FVvcCq3H46NBkfWdGUuzELwc3LSXZHeAq9bX9zbMic+3RpcmqGOTXUGKqsPFUXs/Jy
         usxkHv6/X4Hv7uISr4zxhI8G+J3vTqq0jeDvZLK89DMmx7nPUc4EYCEyDSqgouzoU8O1
         uomw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792693690; x=1793298490;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S1+YftKx+XxEXX/NnNJUaZR75ZwyTED1s15L0G8bes4=;
        b=1ZELAjikzy/xx2cc5ZtHM8C2PouhlJd4gpOHAGppPbRANapO/qk1D53E2OrlFGZFXP
         7czYo697rFU1Aq4WQ6/gIDCMwKl/diD0OBNffQBA8F5ZNT0HG7oI6EagSgx5rgX92KjH
         NJX7j/15iu9xUZyfLOZFZN5vNSiwXVg6RbZm5Si3EjrIkr4yv76PDAkDpAzPEKq9jsO1
         ZZoRpbP5kTHKbsuKpOrHumoCvRn8J/z1hYCULwjY2BPUEVV8PNLti7WsafoGLLIKS238
         7M5gP+v9qlrP+dP+S8qUISKnq9p6CJtnwY/vUOGn9VTGA9WbbTLbqVORL5eiuvdXZ+zE
         ArZQ==
X-Forwarded-Encrypted: i=1; AKwUvBzS4r+1IjvSUVFPTks/kolF/p6JlhYu476mDZ4Fu/p/HtkmVrHmzovQgccV19hj5MsJawr3FHW6h9c/HfU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKC3s2URjhtphZJ6Law6XcJdQyN0zRbPGMw7F19s7xc1gmE1hCs
	xt1YiLm979I1Tkk90n5HcM10Z2UrPt+7quwK8zUg7PTXry6Kp9lAUoFDFIB1C8fQFNGyudGEg0R
	OWRdr7iUUVT8VMH1sTYzGc3DpcHSCbKQ=
X-Gm-Gg: AYBFou0UfdfdbWK9iibE3aowF6n/ja0A4ov4yfVezF/K0rzjAqztjiyLX9HElnOOmxy
	LhVt/dFAD5MEjItf72qC5VQmcUpnoeUQWD3Yit1RqJbYlXjEQ2wptaGSZqdSIWOQiO85OdtI+GN
	9U8JEkFwMR+YC/82p3v4s45dbQ0GpIPZtLmsYI/sSwfATNhhtkKPh6qtdPLAyj3JX55SndVQVm2
	MYzP6f0rYnoPPCXU5t1ioO03BOwwe5EWOk5uyM6/Js1LAa9NP4lSKc4CG8c85S+6O28xImqQHAt
	V0LuOlYZwAfcKR/lAgmbzCR36p8Hzm42hKx9aJmjA96zbK30N7J0O7BcdEQrNZX9xgkX+HX/t/x
	FlqYdYnDhDzqIqRW5COxCho/X8DEAmRKic4YvHcZ7lYhyXrxt6RovSmjTVO4=
X-Received: by 2002:a05:701b:454d:20b0:165:dd90:1f54 with SMTP id
 a92af1059eb24-195c74c48cdmr52805c88.47.1792693690270; Thu, 22 Oct 2026
 11:28:10 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260911045911.1327413-1-lcy8047@gmail.com> <2026091111-appear-stopper-6fd6@gregkh>
 <CAKefsHtZ-S1Gjm7YQFhmYSh=rozsrBJ0muL7JEEXc6uhMUOnwA@mail.gmail.com>
In-Reply-To: <CAKefsHtZ-S1Gjm7YQFhmYSh=rozsrBJ0muL7JEEXc6uhMUOnwA@mail.gmail.com>
From: Changyul Lee <lcy8047@gmail.com>
Date: Thu, 22 Oct 2026 14:27:58 -0400
X-Gm-Features: AclHuK9w2-Pb_7bsR25XQi13p0o3nGGrXKm-nzXqbp1vNTqP3Xs_2IWseSyaOyI
Message-ID: <CAKefsHuMzUr6LForJnx4ZQiBUMLQm60_iNEKmjxnGDTVxr88Cg@mail.gmail.com>
Subject: Re: [PATCH] slimbus: messaging: hold lock until transaction is completed
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Srinivas Kandagatla <srini@kernel.org>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 11, 2026 at 08:00:28AM +0200, Greg Kroah-Hartman wrote:
> On Fri, Sep 11, 2026 at 12:59:11AM -0400, Changyul Lee wrote:
> > Fixes: afbdcc7c384b ("slimbus: Add messaging APIs to slimbus framework"=
)
> >
> > Signed-off-by: Changyul Lee <lcy8047@gmail.com>
>
> No blank line between these please.

Will fix in v2.

> And how was this found and tested?

Sorry for the delayed reply. I wanted to reproduce the issue on real
hardware in addition to QEMU, and obtaining the board took longer than
expected.

I found the issue using a static analysis tool I developed. The tool
reported that slim_msg_response() accesses txn after releasing
ctrl->txn_lock.

I also used LLM assistants to help verify the report. I reviewed their
output and ran the tests below myself.

The race window is small because slim_msg_response() accesses txn only
a few instructions after releasing the lock. However, the bug can occur
when a response arrives just before the request times out. The request
can then return while slim_msg_response() is still accessing txn.

I tested this in QEMU and on a DragonBoard 845c. Both tests use a
test-only delay to widen the race window.

1) QEMU

I first reproduced the issue in QEMU on v7.3 (c03c1a14507d), x86_64,
with 2 CPUs, CONFIG_KASAN=3Dy, CONFIG_KASAN_INLINE=3Dy, and
CONFIG_KASAN_STACK=3Dy.

QEMU has no SLIMbus controller, so a test module registers a dummy
controller using slim_register_controller(). The controller's
->xfer_msg() only records the TID. A kthread on CPU 0 calls
slim_readb() and waits for the response. A kthread on CPU 1 calls
slim_msg_response() with the recorded TID.

A response arriving after the request has timed out does not trigger
the bug because the timeout path has already removed the TID, and
idr_find() returns NULL. The response must instead find the transaction
before the timeout path removes it, but access txn after the request
has returned.

The request timeout is txn->rl + HZ milliseconds. With HZ=3D1000, it is
about 1000 ms. To reproduce the race, I added a 1200 ms delay after
releasing txn_lock, between idr_find() and the access to txn.

Without the fix patch, slim_readb() returns -110 first. Then
slim_msg_response() accesses txn from the stack frame of the returned
request, and KASAN reports a use-after-free.

  BUG: KASAN: use-after-free in slim_msg_response+0x29e/0x2b0 [slimbus]
  Read of size 8 at addr ffff88800340fd20 by task slim091-resp/72
  Call Trace:
   slim_msg_response+0x29e/0x2b0 [slimbus]
   resp_fn+0x9d/0xc0 [slim091_test]
   kthread+0x32a/0x410
   ret_from_fork+0x365/0x570

With the fix patch, there is no KASAN report or oops. The timeout
path waits for txn_lock in slim_free_txn_tid(), so slim_readb()
returns -110 only after slim_msg_response() has called complete()
and released the lock.

2) DragonBoard 845c

Since the QEMU test uses a dummy controller, I also reproduced the issue
on a DragonBoard 845c with a Qualcomm SLIMbus controller (qcom-ngd-ctrl)
and a WCD9340 codec.

The board runs v7.3 on arm64 with CONFIG_HZ=3D250, so the request timeout
is about 250 ms. I added mdelay(500) after releasing txn_lock following
a idr_find() in the unpatched kernel. A module parameter controls the
delay after boot.

I enabled the delay and triggered read requests through regmap debugfs
by reading a WCD9340 register.

  echo 1 > /sys/module/slimbus/parameters/test_delay
  echo 1 > /sys/kernel/debug/regmap/217:250:1:0/cache_bypass
  dd if=3D/sys/kernel/debug/regmap/217:250:1:0/registers of=3D/dev/null bs=
=3D9 count=3D1

On kernel A (without the fix patch, with KASAN), the read crashed in
memcpy(). The msg pointer was read from the stack frame of the returned
request, so msg->rbuf contained an invalid address.

  Unable to handle kernel paging request at virtual address 17ffff3dd280000=
1
  CM =3D 0, WnR =3D 1, TnD =3D 0, TagAccess =3D 0
  pc : __pi_memcpy_generic+0x7c/0x22c
  Call trace:
   __pi_memcpy_generic+0x7c/0x22c (P)
   slim_msg_response+0x118/0x2a0
   qcom_slim_ngd_rx_msgq_cb+0x16c/0x56c [slim_qcom_ngd_ctrl]
   vchan_complete+0x400/0x5e8

On kernel B (without the fix patch, without KASAN), the read also
crashed. The txn->msg pointer was read from the stack frame of the
returned request, and its value was 1. The kernel then crashed while
accessing msg->rbuf at address 0x9 (1 + 8).

  Unable to handle kernel NULL pointer dereference at virtual address
0000000000000009
  pc : slim_msg_response+0x74/0x140
  Call trace:
   slim_msg_response+0x74/0x140 (P)
   qcom_slim_ngd_rx_msgq_cb+0x8c/0x1a8 [slim_qcom_ngd_ctrl]
   vchan_complete+0x1f8/0x228
   tasklet_action_common+0x128/0x180
  Kernel panic - not syncing: Oops: Fatal exception in interrupt

On kernel C (with the fix patch and KASAN, using the same test delay),
I ran 7 reads followed by about 170 seconds of continuous reads, with
196 timeouts in total. There was no oops or KASAN report in
slim_msg_response(), and "Got response to invalid TID" did not appear.

I should have included the discovery and testing details in the
original submission. I'll include them in future reports and respond
to review comments more promptly.

I will send v2 with the blank line removed, a summary of the
reproduction and testing results in the commit message, and an
Assisted-by: LLM tag. I'll include the detailed test results below
the --- separator.

Thanks,
Changyul


2026=EB=85=84 10=EC=9B=94 22=EC=9D=BC (=EB=AA=A9) =EC=98=A4=ED=9B=84 1:05, =
Changyul Lee <lcy8047@gmail.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> On Fri, Sep 11, 2026 at 08:00:28AM +0200, Greg Kroah-Hartman wrote:
> > On Fri, Sep 11, 2026 at 12:59:11AM -0400, Changyul Lee wrote:
> > > Fixes: afbdcc7c384b ("slimbus: Add messaging APIs to slimbus framewor=
k")
> > >
> > > Signed-off-by: Changyul Lee <lcy8047@gmail.com>
> >
> > No blank line between these please.
>
> Will fix in v2.
>
> > And how was this found and tested?
>
> Sorry for the delayed reply. I wanted to reproduce the issue on real
> hardware in addition to QEMU, and obtaining the board took longer than
> expected.
>
> I found the issue using a static analysis tool I developed. The tool
> reported that slim_msg_response() accesses txn after releasing
> ctrl->txn_lock.
>
> I also used LLM assistants to help verify the report. I reviewed their
> output and ran the tests below myself.
>
> The race window is small because slim_msg_response() accesses txn only
> a few instructions after releasing the lock. However, the bug can occur
> when a response arrives just before the request times out. The request
> can then return while slim_msg_response() is still accessing txn.
>
> I tested this in QEMU and on a DragonBoard 845c. Both tests use a
> test-only delay to widen the race window.
>
> 1) QEMU
>
> I first reproduced the issue in QEMU on v7.3 (c03c1a14507d), x86_64,
> with 2 CPUs, CONFIG_KASAN=3Dy, CONFIG_KASAN_INLINE=3Dy, and
> CONFIG_KASAN_STACK=3Dy.
>
> QEMU has no SLIMbus controller, so a test module registers a dummy
> controller using slim_register_controller(). The controller's
> ->xfer_msg() only records the TID. A kthread on CPU 0 calls
> slim_readb() and waits for the response. A kthread on CPU 1 calls
> slim_msg_response() with the recorded TID.
>
> A response arriving after the request has timed out does not trigger
> the bug because the timeout path has already removed the TID, and
> idr_find() returns NULL. The response must instead find the transaction
> before the timeout path removes it, but access txn after the request
> has returned.
>
> The request timeout is txn->rl + HZ milliseconds. With HZ=3D1000, it is
> about 1000 ms. To reproduce the race, I added a 1200 ms delay after
> releasing txn_lock, between idr_find() and the access to txn.
>
> Without the fix patch, slim_readb() returns -110 first. Then
> slim_msg_response() accesses txn from the stack frame of the returned
> request, and KASAN reports a use-after-free.
>
>   BUG: KASAN: use-after-free in slim_msg_response+0x29e/0x2b0 [slimbus]
>   Read of size 8 at addr ffff88800340fd20 by task slim091-resp/72
>   Call Trace:
>    slim_msg_response+0x29e/0x2b0 [slimbus]
>    resp_fn+0x9d/0xc0 [slim091_test]
>    kthread+0x32a/0x410
>    ret_from_fork+0x365/0x570
>
> With the fix patch, there is no KASAN report or oops. The timeout
> path waits for txn_lock in slim_free_txn_tid(), so slim_readb()
> returns -110 only after slim_msg_response() has called complete()
> and released the lock.
>
> 2) DragonBoard 845c
>
> Since the QEMU test uses a dummy controller, I also reproduced the issue
> on a DragonBoard 845c with a Qualcomm SLIMbus controller (qcom-ngd-ctrl)
> and a WCD9340 codec.
>
> The board runs v7.3 on arm64 with CONFIG_HZ=3D250, so the request timeout
> is about 250 ms. I added mdelay(500) after releasing txn_lock following
> a idr_find() in the unpatched kernel. A module parameter controls the
> delay after boot.
>
> I enabled the delay and triggered read requests through regmap debugfs
> by reading a WCD9340 register.
>
>   echo 1 > /sys/module/slimbus/parameters/test_delay
>   echo 1 > /sys/kernel/debug/regmap/217:250:1:0/cache_bypass
>   dd if=3D/sys/kernel/debug/regmap/217:250:1:0/registers of=3D/dev/null b=
s=3D9 count=3D1
>
> On kernel A (without the fix patch, with KASAN), the read crashed in
> memcpy(). The msg pointer was read from the stack frame of the returned
> request, so msg->rbuf contained an invalid address.
>
>   Unable to handle kernel paging request at virtual address 17ffff3dd2800=
001
>   CM =3D 0, WnR =3D 1, TnD =3D 0, TagAccess =3D 0
>   pc : __pi_memcpy_generic+0x7c/0x22c
>   Call trace:
>    __pi_memcpy_generic+0x7c/0x22c (P)
>    slim_msg_response+0x118/0x2a0
>    qcom_slim_ngd_rx_msgq_cb+0x16c/0x56c [slim_qcom_ngd_ctrl]
>    vchan_complete+0x400/0x5e8
>
> On kernel B (without the fix patch, without KASAN), the read also
> crashed. The txn->msg pointer was read from the stack frame of the
> returned request, and its value was 1. The kernel then crashed while
> accessing msg->rbuf at address 0x9 (1 + 8).
>
>   Unable to handle kernel NULL pointer dereference at virtual address 000=
0000000000009
>   pc : slim_msg_response+0x74/0x140
>   Call trace:
>    slim_msg_response+0x74/0x140 (P)
>    qcom_slim_ngd_rx_msgq_cb+0x8c/0x1a8 [slim_qcom_ngd_ctrl]
>    vchan_complete+0x1f8/0x228
>    tasklet_action_common+0x128/0x180
>   Kernel panic - not syncing: Oops: Fatal exception in interrupt
>
> On kernel C (with the fix patch and KASAN, using the same test delay),
> I ran 7 reads followed by about 170 seconds of continuous reads, with
> 196 timeouts in total. There was no oops or KASAN report in
> slim_msg_response(), and "Got response to invalid TID" did not appear.
>
> I should have included the discovery and testing details in the
> original submission. I'll include them in future reports and respond
> to review comments more promptly.
>
> I will send v2 with the blank line removed, a summary of the
> reproduction and testing results in the commit message, and an
> Assisted-by: LLM tag. I'll include the detailed test results below
> the --- separator.
>
> Thanks,
> Changyul
>
> 2026=EB=85=84 9=EC=9B=94 11=EC=9D=BC (=EA=B8=88) =EC=98=A4=EC=A0=84 2:02,=
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>=EB=8B=98=EC=9D=B4 =EC=9E=
=91=EC=84=B1:
>>
>> On Fri, Sep 11, 2026 at 12:59:11AM -0400, Changyul Lee wrote:
>> > slim_msg_response() drops lock after idr_find() and dereferences txn.
>> > If the requester times out in the meantime, it frees the TID and
>> > returns, so the handler writes the reply into msg->rbuf and calls
>> > complete() on txn->comp, both of which have already benn freed.
>> >
>> > Keep lock held until complete(txn->comp) finishes, so a requester
>> > in slim_free_txn_tid() and cannot return while txn is still in use.
>> > Call idr_remove() because slim_free_txn_tid() takes the same lock.
>> >
>> > Fixes: afbdcc7c384b ("slimbus: Add messaging APIs to slimbus framework=
")
>> >
>> > Signed-off-by: Changyul Lee <lcy8047@gmail.com>
>>
>> No blank line between these please.
>>
>> And how was this found and tested?
>>
>> thanks,
>>
>> greg k-h
