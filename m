Received: from mail-lr2-f12.google.com (mail-lr2-f12.google.com [74.125.230.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D6F3822A1
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 07:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790666199; cv=pass; b=YJcA3vpGuii6TGbzGDstVP1XgbtGNiylrlGkfVyMwlZLYhwbG3Ia0t7ajo3vEOhq6KFhwz5cLLEe2X8FD/EYTcuKwjrCR5AIJNx/EUYTjPYsh/X+BhhA5mtutkobH2wua38B1k175JqXkvseZDFvlE7EzxnDym921BDGP1baeng=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790666199; c=relaxed/simple;
	bh=3FsesW7qrrCUuDxnT67q/DYl7INNeb4HegPSlzYOH6s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IQNCiYDFBU/FFE2YLkTi7ALQr/UqXsM0uf/i74uADKINg6rGl4/hp5x85FNp3pMvjOwN/uhfaoW6JticcLRTD4pbywC0tOVbwaJGBXvnxatypK/rHuNkVjLcGGhxpZEMwdB8jDrL8mokZ45FhovcXA7xBccgGJff7OI3KzlfagM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cloud.ionos.com; spf=pass smtp.mailfrom=ionos.com; dkim=pass (2048-bit key) header.d=cloud.ionos.com header.i=@cloud.ionos.com header.b=C9y2i9r1; arc=pass smtp.client-ip=74.125.230.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cloud.ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloud.ionos.com header.i=@cloud.ionos.com header.b="C9y2i9r1"
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a59e4f8f2aso3437771fa.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 00:16:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790666193; cv=none;
        d=google.com; s=arc-20260327;
        b=MBeXTCI9hqzYjk2L11fI19b3zcIGHEiM2vzVokvlLB64f5kxD+/O4zsbpImqCwk99j
         1nuDz+bAAGG9eA/ip2ShmuJcCvpfYuvS1zUo+sAGKBIUEFQe89bHK9knWNGpCu6YjL/i
         5/CMhXOPsErX0L5L0ejNmLn3jyk21uT9ThgBHC1PqA59VB9SkYT1k25ufPXB5zceM7uT
         dhWohlJkANB/M1bloHLQx7FtV8MB7fTWqTZInwofeaChSp9kGibEX6rvwWL8vSt06rJW
         ZOaKeY+603tYJm6lrox90z0/hma3gWc4hxqyVAVG2zOKal4LO07V1sf8/92Z0l+F24m7
         xWWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WhgHZwKUgXgdevQt+gPZYqRRgdry8oanfBmQ6gGzpUM=;
        fh=0S8N6GA/3XkoHJ6yFRW2wemfHk+Rjr50WhH7631fPS8=;
        b=QhWIg9EUCVYL34X1sQ4KEqgT+BrAQ+IKnbso7QNZsKGZiT8t/FiJ5+cqcTuKVI2q27
         Lk4Q5GhQfgv8YWiHPKuI2JOrWDF6A5ZS+i/0/pX1gj2/ZmkHM/bKi8RaT+Zg2FRhuPiZ
         Wh3r8gsqFwUuwXt8p0keKgVRTztCeWG0QeaNr8Cu0+Oi0EyyTTZWHCsKSgN31VtvoQbe
         bQImYj7UdHhtCzY1qutvyEmsG5VaRNs2eRPShMuKujrBmn4/TJMuhd9c6lozyWnFtwGZ
         djj531Fjr/+5pykOpNN8Qoqq52WmiMVixw/nABANTk2ozKs9S7kVDUaxpG34P0fnCbFt
         ctpQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.ionos.com; s=google; t=1790666193; x=1791270993; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WhgHZwKUgXgdevQt+gPZYqRRgdry8oanfBmQ6gGzpUM=;
        b=C9y2i9r1j+abclBoOnqaI9fatGircUXum24g0sKw3NK7bURGU2AcCfFg11X4S1oimq
         vE0ApKXR3htEidqDiW7H1dhaOW//Gymqz8yY65NLD/JbZGqbFrTjlKEy9qbNxZDkA388
         9jSreRK9rWJIsYKGFi6s9WWsTNnCq7l6++7Hk0ob7pfA6Ml+wmKwVzmU6HVcKdUISsvQ
         SVRcK3hn2aynHjxca4g5C3p5a454Kuq99xjbM3kXYQoiyYbkqd22gEr1i/3ntFv3DSB+
         OhaSIB774ke6O0Imb8m2BXOj1cPHGbj7ms0kDKV0OpJEFStSZyKkDY5YjjXPmG1YLFPq
         Gbdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790666193; x=1791270993;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WhgHZwKUgXgdevQt+gPZYqRRgdry8oanfBmQ6gGzpUM=;
        b=zywhrBMkklkL66kk7v1Et+OAiaLSudix0oq7yvRigbglLA741CKE2tJk3oIht5Iq8m
         UjY2uuZiho1FyRp3dp1W+C5Sjm6emWnilIopCD4xvn17k04b/YTmod0wJcfQIB3HEr6d
         J8uiNtvTRsg5vRMKhMWv09B09G6+yQBRyMpfqu8bWuVyjwkPQXCFosRcHC3BVpKUkIP3
         BO/R/V5/niQQDMOHdf/b2AAFtyMomynLtM3CmFtwTcV9FPKkSrncD9F1ZZrBc0OOHMVj
         RQeU05ApL9E1gaA50MFzZUjvIHyHCJau++761+upb4EPmI8WtR7/UuUXEf0xyKVWbK9f
         j4DA==
X-Forwarded-Encrypted: i=1; AKwUvBxM2ZZZ9g26P/zKOa81dhIedmaQfaXYGywUTRa6xvI+PpCckAfHQ9vq74BT1qx7B6oEF+HWoK+Bc2I32Mg=@vger.kernel.org
X-Gm-Message-State: AFq9FYICQ9oVfIFH7C2rZO6ceoADTZpV4vwsOMwbQYUqTy4QueOh6rzK
	OY3eUvmXF4ARrimnXqaKnOri+PQIfiCIlhqEYSMn0y0sLH2IWFxsBeTZQfVy6sYFJ5BZWax6WYC
	Dnq2MJUEvQM/XhN1BNZAkQ5+RgGCkIYNKeZdCrPyoPg==
X-Gm-Gg: AYBFou01rZeSeNSXelEzounwckd1f1yKg+8ywevkjvi66JAelz+5HBZXDd6EbkvCbwp
	fyUdEsXgmk3DU43hcBOelGB24RcwuRlVn79WoBjITXL5OK5PH5H6X6nKAoR6tOitgoBiIvhWeYz
	ws8nReSgIqOAruVGyPR1g5TaEsx5CTecbbNQrhk0BZOoaa2z4466og0qFgoV2Ov4RpwWFrqJu2N
	RY15GKtTAuRVZQ93lbGEK8QyQhyjR0hoVpGbXzQQPRJ2617wr+/pnihbFyDdWC5NNTeB5Ym08un
	4BrU+FtpJxG63wIYixJZmk0LxN7qf/qvvDOtFlQT9sM14qSRP+ItjiDQx3jNPLqeAwc=
X-Received: by 2002:a05:6512:1396:b0:5b8:ea1f:120f with SMTP id
 2adb3069b0e04-5b8ea1f12b5mr4002276e87.6.1790666193242; Tue, 29 Sep 2026
 00:16:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929054222.1576877-1-yhlee@isslab.korea.ac.kr>
In-Reply-To: <20260929054222.1576877-1-yhlee@isslab.korea.ac.kr>
From: Jinpu Wang <jinpu.wang@cloud.ionos.com>
Date: Tue, 29 Sep 2026 09:16:20 +0200
X-Gm-Features: AclHuK96qQhAQnCyE5jgVePYa6Ry3VCKnc88oqxBv8jb7K_-AxFU1N1PqJnE6f8
Message-ID: <CAMGffEn6Ou6QhViG+M26iqyVP5vgv3VNPRGO14ydxjeAtc7mQw@mail.gmail.com>
Subject: Re: [PATCH] RDMA/rtrs-clt: Reject a zero queue_depth in the
 connection response
To: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
Cc: haris.iqbal@ionos.com, Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>, 
	Farhad Alemi <farhad.alemi@berkeley.edu>, linux-rdma@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Yehyeong,

Thx for your patch, there is a fix reviewed already:
https://lore.kernel.org/linux-rdma/CAMGffEkQ8tZZcrLp2Sc7UyZoqAyBoYMdkPhGvHX=
7RGqrwSmJzg@mail.gmail.com/

On Tue, Sep 29, 2026 at 7:43=E2=80=AFAM Yehyeong Lee <yhlee@isslab.korea.ac=
.kr> wrote:
>
> rtrs_rdma_conn_established() stores the queue_depth the server advertises
> in its cid 0 connection response without checking that it is usable.  The
> only bound it ever had was an upper one, dropped in commit 0e8558476faf
> ("RDMA/rtrs: Avoid Wtautological-constant-out-of-range-compare") because
> it cannot fail for a u16; a lower bound was never there.  A server that
> reports zero therefore leaves clt_path->queue_depth at 0, and setting up
> the first I/O connection trips
>
>         if (WARN_ON(!clt_path->queue_depth))
>
> in create_con_cq_qp().  The connect is aborted, but the peer has already
> tainted the kernel, and on a kernel built with panic_on_warn it panics
> outright -- all from one field in the response to a connect.
>
> The rbufs array is sized from the same value one statement earlier, so it
> is also allocated with zero elements, which kzalloc_objs() returns as
> ZERO_SIZE_PTR.  Nothing dereferences it: the WARN aborts the connect
> before any buffer is registered and the path is then freed, and a path
> that already carries a nonzero depth is caught on reconnect by the
> existing "queue depth changed" test.  The WARN is the whole of the damage=
.
>
> The in-tree server never sends zero -- check_module_params() rejects
> sess_queue_depth < 1 -- so this needs a hostile or broken server, but the
> client should not rely on the peer for that.  Reject it before rbufs is
> sized from it and before it is stored, but after the existing "queue dept=
h
> changed" test, so that a server which drops a nonzero depth to zero acros=
s
> a reconnect still takes that path and still disables auto-reconnect.
>
> Reproduced with rnbd-client over soft-RoCE against an rtrs-server patched
> to advertise queue_depth =3D 0:
>
>   WARNING: drivers/infiniband/ulp/rtrs/rtrs-clt.c:1688 at
>     rtrs_clt_rdma_cm_handler+0x1b27/0x29f0, CPU#0: kworker/u8:5/56
>   Modules linked in:
>   CPU: 0 UID: 0 PID: 56 Comm: kworker/u8:5 Not tainted
>     7.3.0-rc5-nvmerdma-atk-g72d3fcf802c4-dirty #23 PREEMPT(lazy)
>   Hardware name: QEMU Ubuntu 24.04 PC v2 (i440FX + PIIX, arch_caps fix,
>     1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
>   Workqueue: ib_addr process_one_req
>   RIP: 0010:rtrs_clt_rdma_cm_handler+0x1b27/0x29f0
>   Call Trace:
>    <TASK>
>    ? arch_stack_walk+0x94/0xf0
>    ? __pfx_rtrs_clt_rdma_cm_handler+0x10/0x10
>    ? ret_from_fork_asm+0x1a/0x30
>    ? process_one_work+0x6b4/0x10e0
>    ? stack_trace_save+0x8e/0xc0
>    ? __pfx_stack_trace_save+0x10/0x10
>    ? __kasan_slab_free+0x43/0x70
>    ? stack_depot_save_flags+0x29/0x7e0
>    ? worker_thread+0x45b/0xd10
>    ? kthread+0x2c8/0x3b0
>    ? ret_from_fork+0x36e/0x5a0
>    ? _raw_spin_lock_irqsave+0x86/0xe0
>    cma_cm_event_handler+0x3e/0x240
>    addr_handler+0x1e0/0x300
>    ? __pfx_addr_handler+0x10/0x10
>    ? pick_task_fair+0x46f/0x1a60
>    process_one_req+0x10d/0x510
>    ? finish_task_switch.isra.0+0x1d9/0xa70
>    ? __pfx_process_one_req+0x10/0x10
>    process_one_work+0x6b4/0x10e0
>    ? __pfx___schedule+0x10/0x10
>    ? __pfx_process_one_work+0x10/0x10
>    ? _raw_spin_lock_irq+0x81/0xe0
>    ? __pfx_process_one_req+0x10/0x10
>    ? assign_work+0x11d/0x370
>    worker_thread+0x45b/0xd10
>    ? __pfx_worker_thread+0x10/0x10
>    ? __pfx_worker_thread+0x10/0x10
>    kthread+0x2c8/0x3b0
>    ? recalc_sigpending+0x15c/0x1e0
>    ? __pfx_kthread+0x10/0x10
>    ret_from_fork+0x36e/0x5a0
>    ? __pfx_ret_from_fork+0x10/0x10
>    ? __switch_to+0x572/0xdd0
>    ? __pfx_kthread+0x10/0x10
>    ret_from_fork_asm+0x1a/0x30
>    </TASK>
>   ---[ end trace 0000000000000000 ]---
>
>   rtrs_client L2644: <s1>: init_conns() failed: err=3D-EINVAL
>     path=3D<invalid address family>@ip:10.0.0.1 [rxe0:1]
>
> With the check in place the same server is refused without a splat, and a=
n
> honest server is unaffected:
>
>   rtrs_client L1870: <s1>: Invalid RTRS message: queue_depth is 0
>   rtrs_client L2649: <s1>: init_conns() failed: err=3D-ECONNRESET
>     path=3D<invalid address family>@ip:10.0.0.1 [:0]
>
> Fixes: 6a98d71daea1 ("RDMA/rtrs: client: main functionality")
> Reported-by: Farhad Alemi <farhad.alemi@berkeley.edu>
> Closes: https://lore.kernel.org/linux-rdma/CA+0ovCg_sG8gaZXXj9zmOrpxRt=3D=
8+-x9wvycVNUKwWmMbr6-Yg@mail.gmail.com/
> Cc: stable@vger.kernel.org
> Signed-off-by: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
> ---
>  drivers/infiniband/ulp/rtrs/rtrs-clt.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/infiniband/ulp/rtrs/rtrs-clt.c b/drivers/infiniband/=
ulp/rtrs/rtrs-clt.c
> index eac38b57b00d7..5c2c65c15a65a 100644
> --- a/drivers/infiniband/ulp/rtrs/rtrs-clt.c
> +++ b/drivers/infiniband/ulp/rtrs/rtrs-clt.c
> @@ -1866,6 +1866,11 @@ static int rtrs_rdma_conn_established(struct rtrs_=
clt_con *con,
>                         return -ECONNRESET;
>                 }
>
> +               if (!queue_depth) {
> +                       rtrs_err(clt, "Invalid RTRS message: queue_depth =
is 0\n");
> +                       return -ECONNRESET;
> +               }
> +
>                 if (!clt_path->rbufs) {
>                         clt_path->rbufs =3D kzalloc_objs(*clt_path->rbufs=
,
>                                                        queue_depth);
> --
> 2.43.0
>
