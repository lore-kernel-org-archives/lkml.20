Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794848395;
	b=TR3MdXgAmPUgw4prKgvWfczuis+msqfs+topToxhCSnfoSoc6/Bx3wocMGfS/ROVAG8L
	 BhAOA00Izk05cdAmGrrPTVcw8pSzgkdX1OtVzPGMdK8JjvqkCR80Yd7+8if3BJ9WmxHLp
	 bLfveY3SZMhz9N31r1CbWJlgYg6oI+UW3HVUq7zx15EH7nxPQIgWtQ/sWO1Su6zU+kO4Q
	 TlAirW7/9qr0S68CtYZdGQ32aAq6ssUFVvjDsrmTlkvpilKWCDwGyWj2vYJq5DyEb/wbf
	 E7la6gc82WynUlCYv5HexyOF0PPaCpVLcbzS+o8q2hIjKpIO0ptSFtCgrPcZEoz2ybw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794848395;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=LyUzJZvYwUSiIXUd0aX2M/LtsBwgiCS4YLA14UCXzmU=;
	b=1YFlG0OjMrkiKm6v37pZpf4BiobMPFt1FSyj4EooLyECgx3y6ivWU+KXt3ozREAuDdvY
	 Lnh/uxrSx0uN4gilEJhRZvQHYWxZ0PkeTLl+WXG2nNzoTeAgeUpq9jujs+TWrP7rvmilt
	 94MMQ/CSmuzQ8Fh62WxRpP0Y7MRVv2K3FkWOpePDD8L96m5v9jboeQr25MfOcV8iyXh9h
	 wM9BRzzGPWRFwZ0bnpIoucBbXeBLzyE/fyZwgE1LeXZRuWXQasleY06BCDmBMd0GcODzI
	 aGNutKZtPULIZhIDibufJKCxJ3c9KhIJD5Jd6pW9xgj5RXCgJhphFwrDNiU9EW93/qw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=purestorage.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=Z5fwdaq9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.177
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A89A7606A322
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 16:59:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A89A7606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=Z5fwdaq9
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-55ade1de0b4so49366631cf.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 08:59:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794848393; cv=none;
        d=google.com; s=arc-20260327;
        b=fSLHrwQ7oIGyPh7fAjhlWyG2AGtV57sJzuOBaCMcggYR2vp0Jl6EgfWaJRpmJeGx9h
         4IUlxVyAEBLmQqeUL6cck42C2a3kJBi+X4DVOG1/sWZyvJesXEZ9j/EV7xuYIEy6L5wd
         jDG5VNa0qJoBY3S8X0SOhZOsfn6DgFJrXRx/UyMoLOd4FUJf7PLl7XkZ2c5XP7y2aq19
         AaE1jy8eWF3iMRIOETlNYOpWlIpZLPGJedQZwXuOq2gPyh5LnmclXVp26hjkX56R4U4T
         zmZCfdCZsQGLkPO3wUr6MtsW4MdGZR90T1dd7/XMbRKDTUm0VRXRdC7h0xzQHdp62d/X
         l5PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LyUzJZvYwUSiIXUd0aX2M/LtsBwgiCS4YLA14UCXzmU=;
        fh=AJ3RdTghyvIi6S8L8HfQ3xoW1vWQl3j7kYfMd2stRf0=;
        b=EsHZOKkraeoLLTFhOPB5huKizOi5HYwsjegbp2zWkoRcwicRnfqj9TkXoOMqJxLI56
         /OoxBfU00JSc5nY1ytEohfvj2zn0c6K4OPugJxsmuGiiCrdUwMYwgXnuQEMiBtW9HC61
         MEst4YsIaYUzp4/RLc7oymI6UOoI4E84dLu+4xiBo773xPwLQhmapqzITHo3Iq9TKEIW
         05kH2BclalYe3f+me/8JmLL90JhTqiZL9jQZiFP4F9Da40PTyLaizqiXjq9TE0pf0on7
         93jQlSLk7A+61DDllcmfSlC0MzP4KqCyFtq0sIAzKqxdvIz79EIccN+eFVM2pgW1++je
         X4/Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1794848393; x=1795453193; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LyUzJZvYwUSiIXUd0aX2M/LtsBwgiCS4YLA14UCXzmU=;
        b=Z5fwdaq9D3p6yQEb8r0Nt84u6Qktc/WMVNsuY+pCDhEquI6dVAaHJIv6M1CF51xXLK
         4k/Uv/CBaPJjz6UNKjA0BhFACbQFectFNQLBW6tqxWrp2EutSb6ELiSrrA8VhP1NgdYb
         LGbvz/vXjYIHOAjOKVX9KaWXfdk4L0RWOPUYL/Xsuy8gisNlSCk18t6jGwNL5nADGknP
         BCGG7oxt3cNaPI9dqtqoY4Kk6krmULRTDopTx7pIM+HaRTAKJXUEhLVyZxd2FXUkI7pP
         cmtEaAL1P9E6pI3PpC/N7ObvxFKXge/qyWapcdVJ/Q4isOaDWkriIXmy8uk5NTAL8tqu
         84ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794848393; x=1795453193;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LyUzJZvYwUSiIXUd0aX2M/LtsBwgiCS4YLA14UCXzmU=;
        b=2G220s8uRHQJrlOvtlJ+XQDQm2qZ5k19lTAk3PoJ4PT7KjTQZb7rDPZeePRwmQRQBy
         SES/IM12JcpXrMgpwW6F2e2Q6S9yTDpBiydLnGgxN7FD5NwHstsPgIKlLJWxb/x1941H
         NvRV/EqJbRNHKp76TuyFqWM6wW2BP4R1RQtVXQL7WPNCXUW+PgQL7aYx4QTnes60YSSo
         r393oBNtoco78x7jBqq31tFW/Pq1qCt5IRwz446HCUdBNsSD9bbBROyZFG7kK34oo9ku
         VGmRKQpBE7XAc3MUFA2BRKywadTglS2J7pbOUqLWAainKBLaEnRRCpsZ2S13zQPZeP7p
         Zi7g==
X-Forwarded-Encrypted: i=1; AL+hErFMUlsrSSp0bVAMRCOLzErVeLve9mg78jsbbyRy3sLR6J+OYyhyB3CrmhyzLGeR0ZoJe49T3kkj/XbGzMY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+bizpBl4UeEe+O53cAIAe9XL0s53pNigFJ4oLKV4gak/p0zbgD
	SGDNYnHcRRat4rOMMwZ/da+fupR4CG9ZZvftUCaQc5CBw+G2u5LL6aMkG+8vh7ITg1t7AuyFqXi
	s+5nNFGCogQHWgZy1Jwuh/i/6FHinT6fTIug5l6Awww==
X-Gm-Gg: AYBFou3HKA4CzJssDfcDRUy51UGUeEZWJ1tQiujgrPaoTcV/pHNwp9uRJT394W/CfdE
	5US4r3X8t/CUZHYo4vLKlZU91bTKr4fEVAYAuwnlw0LN5nUCjgAWRBb1iYiPQp6rX88e9aK+7E/
	g9n9a7Zj3CC0Gyqc1puQse2VpXxIBMVJ34a5TnaPS9llCHoPlrW7VWb1a+R4mRCnkc3iwQPqnw3
	a2IGHRBzvzCLR8VEXggTZ6dO8v0WiXKtmB41V60R6XzXFcEwr+cb/1+1dJQLaW2nSVRxqcmawha
	bZl36gybxhyyhQoB8tdKIbgM0XYSivnB5K42HCe2V6r8XwTbXJUFl0R6I4qiWpUrDZL6+ktS674
	0HALo4NKOzFOqpofY3b/fUMmekaEpAn7Xb+iL
X-Received: by 2002:a05:622a:2b43:b0:535:a20:8277 with SMTP id
 d75a77b69052e-55ac428750bmr192288761cf.10.1794848393240; Mon, 16 Nov 2026
 08:59:53 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260922200718.3941465-1-sgogte@purestorage.com>
 <20260922200718.3941465-4-sgogte@purestorage.com> <atSzF3URmcpP2_i2@shinmob>
 <CAMof9cVxoNxM70uJa=N+a88YBMmh+EKfXrrckXz=N45U0EKQcg@mail.gmail.com> <avmUgnb87CHqIDOL@shinmob>
In-Reply-To: <avmUgnb87CHqIDOL@shinmob>
From: "Surabhi Gogte (she/her)" <sgogte@purestorage.com>
Date: Mon, 16 Nov 2026 08:59:17 -0800
X-Gm-Features: AclHuK8RTshQ1zzlMGqiOg2bjry7pMYM23qf5thgpZg6U8-MQSo8hd-mAE0evc4
Message-ID: <CAMof9cX9TNaXdL1ugdnCwxVG1Us8V-=c=Uk+YVKsMwFEYR7Vvg@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] nvme-tcp: parallelize I/O queue allocation and startup
To: "Shin'ichiro Kawasaki" <shinichiro.kawasaki@wdc.com>
Cc: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>, 
	Sagi Grimberg <sagi@grimberg.me>, linux-nvme@lists.infradead.org, 
	linux-kernel@vger.kernel.org, mkhalfella@purestorage.com, 
	randyj@purestorage.com, adailey@purestorage.com, 
	Hannes Reinecke <hare@kernel.org>, dwagner@suse.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 15, 2026 at 3:36=E2=80=AFAM Shin'ichiro Kawasaki
<shinichiro.kawasaki@wdc.com> wrote:
>
> On Oct 20, 2026 / 13:48, Surabhi Gogte (she/her) wrote:
> > On Sun, Oct 18, 2026 at 5:26=E2=80=AFAM Shin'ichiro Kawasaki
> > <shinichiro.kawasaki@wdc.com> wrote:
> > >
> > > On Sep 22, 2026 / 14:07, Surabhi Gogte wrote:
> > >
> > > Recently, blktests-CI runs for the kernel at block/for-next branch st=
arted
> > > reporting failures of the test case nvme/004 (with tcp transport) and=
 md/001.
> > > The kernel reported a WARN related to lock->magic, and it caused the =
failures.
> > > FYI, here I share the failure run log at md/001 [1] and dmesg at the =
failure.
> > >
> > >   The md/001 confirms a bug fix in md driver. The bug was triggered w=
hen a
> > >   nvme device with tcp transport is used as its backend. Then the tes=
t case
> > >   exercises the nvme-tcp driver, which this patch touches.
> > >
> > > I bisected and found that this commit is the trigger of the failures.=
 When I
> > > revert this commit from the block/for-next branch tip with git hash
> > > 34fbfb9d8d1f, the failure goes away.
> > >
> > > Surabhi, could you take a look in the failure?
> > >
> >
> > Yes, there is a bug in commit 61b0ed3be81b ("nvme-tcp: parallelize I/O
> > queue allocation and startup").  To know the queue range before the
> > queues are set up, it moved the I/O tag set allocation ahead of I/O
> > queue allocation.  blk_mq_alloc_tag_set() calls
> > nvme_tcp_init_request() for every request, which takes pf_cache_lock
> > of the request's queue, but nvme_tcp_alloc_queue() only initializes
> > that mutex later:
> >   nvme_tcp_configure_io_queues()
> >     nvme_alloc_io_tag_set()
> >       blk_mq_alloc_tag_set()
> >         blk_mq_alloc_rqs()
> >           nvme_tcp_init_request()  mutex_lock(pf_cache_lock) <- WARN
> >     nvme_tcp_setup_io_queues()
> >       nvme_tcp_alloc_queue()   mutex_init(pf_cache_lock)
> >
> > So with CONFIG_DEBUG_MUTEXES the first connect trips
> > DEBUG_LOCKS_WARN_ON(lock->magic !=3D lock) in __mutex_lock().
> > That matches the call trace in your dmesg.
> >
> > Daniel Wagner posted a fix for this as patch 1 of [PATCH 0/5]
> > nvme-fabrics: fix connects with isolated CPUs and queue mapping bugs:
> > lore : https://lore.kernel.org/all/20261014-nvme-fabrics-isolcpu-v1-0-3=
55156be27b2@kernel.org
> >
> > It initializes pf_cache_lock for all queues in nvme_tcp_alloc_ctrl(),
> > right after the queues array is allocated, and drops the
> > mutex_destroy() calls so the lock stays valid for the lifetime of the
> > controller.
> >
> > I ran blktests with his fix on top of block/for-next (34fbfb9d8d1f, the
> > same tip you bisected on) and md/001 passes with no WARN related to
> > lock->magic.  Without the fix, the same tree and config fails md/001
> > with the WARN at kernel/locking/mutex.c:625.
> >
> > With the fix : nvme-tcp: initialize pf_cache_lock when allocating the c=
ontroller
> > lore : https://lore.kernel.org/all/20261014-nvme-fabrics-isolcpu-v1-1-3=
55156be27b2@kernel.org/
> >
> > ~/blktests$ sudo ./check md/001
> > md/001 (Raid with bitmap on tcp nvmet with opt-io-size over bitmap
> > size) [passed]
> >     runtime  1.779s  ...  1.814s
>
> Surabhi, thanks for the confirmation. It's great taht The md/001 failure =
is
> gone. Said that, now I face failrues of other test cases: nvme/062 and 06=
3.
>
> While I was running blktests on v7.4-rc1 and v7.4-rc2 kernel, I observed =
the two
> test cases nvme/062 and 063 fail for tcp transport [*]. I bisected and fo=
und
> that this patch as the commit 61b0ed3be81b is the trigger. I observed the
> failure with nvme-cli versions 3.0, 3.1 and 3.2. ktls-utils version is 1.=
4.0.
>
>   When I reported blktests failures for v7.4-rc1 kernel [#], the failure =
was
>   not observed by some reason. But now the failure is observed in stable =
manner.
>
>   [#] https://lore.kernel.org/linux-block/avBz7uOGYo2y426_@shinmob/
>
> It looks like nvme connect can fail for tls connection with multiple I/O
> queues. I created a blktests patch to limit number of I/O quees to 1 [**]=
,
> and observed the failure goes away. But I'm not sure if this is just hidi=
ng
> the failure.
>
> Are the failures observed in your environment?
>

Hi Shin'ichiro, I ran bltkests with ktls 1.5.0. It contains the tlshd
commit 3a6658e
("tlshd: Link the NFS keyrings per handshake instead of at startup")
which fixes the keyring race during the handshake. Both tests 62 and
63 pass with it.
Can you retest with that version to see if the issue persists? Can you
also share the kernel logs of the failure.

Ref: https://lore.kernel.org/linux-nvme/CAMof9cU5s0ck20fcSAYSvK-xpcP5_Hv2Bm=
N20Bh3btpLum7THg@mail.gmail.com/

Regards,
Surabhi.

>
> [*] nvme/062 and nvme/063 failure
>
> nvme/062 (tr=3Dtcp) (Create TLS-encrypted connections)         [failed]
>     runtime  4.678s  ...  13.619s
>     --- tests/nvme/062.out      2026-11-09 20:12:01.056000000 +0900
>     +++ /home/shin/Blktests/blktests/results/nodev_tr_tcp/nvme/062.out.ba=
d      2026-11-15 20:21:09.213000000 +0900
>     @@ -1,6 +1,10 @@
>      Running nvme/062
>      Test unencrypted connection w/ tls not required
>      Test encrypted connection w/ tls not required
>     +FAIL: nvme connect return error code
>     +WARNING: connection is not encrypted
>      Test unencrypted connection w/ tls required (should fail)
>      Test encrypted connection w/ tls required
>     ...
>     (Run 'diff -u tests/nvme/062.out /home/shin/Blktests/blktests/results=
/nodev_tr_tcp/nvme/062.out.bad' to see the entire diff)
> nvme/063 (tr=3Dtcp) (Create authenticated TCP connections with secure con=
catenation)
>     runtime  3.123s  ...
> WARNING: Test did not clean up port: 0
> nvme/063 (tr=3Dtcp) (Create authenticated TCP connections with secure con=
catenation) [failed]
>     runtime  3.123s  ...  7.313sost: nqn.2014-08.org.nvmexpress:uuid:0f01=
fb42-9f7f-4856-b0b3-51e60b8de349
>     --- tests/nvme/063.out      2026-11-09 20:12:01.060000000 +0900
>     +++ /home/shin/Blktests/blktests/results/nodev_tr_tcp/nvme/063.out.ba=
d      2026-11-15 20:21:30.207000000 +0900
>     @@ -1,5 +1,4 @@
>      Running nvme/063
>      Test secure concatenation with SHA256
>     -Reset controller
>     -Test secure concatenation with SHA384
>     -Test complete
>     +FAIL: nvme connect return error code
>     +WARNING: connection failed
>
>
> [**] trial blktests patch
>
> diff --git a/tests/nvme/062 b/tests/nvme/062
> index eabe2d9..69a05b6 100755
> --- a/tests/nvme/062
> +++ b/tests/nvme/062
> @@ -55,7 +55,7 @@ test() {
>
>         # Test encrypted connection
>         echo "Test encrypted connection w/ tls not required"
> -       _nvme_connect_subsys --tls
> +       _nvme_connect_subsys --tls --nr-io-queues 1
>
>         ctrl=3D$(_find_nvme_dev "${def_subsysnqn}")
>         if ! _nvme_ctrl_tls_key "$ctrl" > /dev/null ; then
> @@ -77,7 +77,7 @@ test() {
>
>         # Test encrypted connection
>         echo "Test encrypted connection w/ tls required"
> -       _nvme_connect_subsys --tls
> +       _nvme_connect_subsys --tls --nr-io-queues 1
>
>         ctrl=3D$(_find_nvme_dev "${def_subsysnqn}")
>         if ! _nvme_ctrl_tls_key "$ctrl" > /dev/null; then
> diff --git a/tests/nvme/063 b/tests/nvme/063
> index feb07bf..900bb9f 100755
> --- a/tests/nvme/063
> +++ b/tests/nvme/063
> @@ -46,7 +46,7 @@ test() {
>         _set_nvmet_dhgroup "${def_hostnqn}" "ffdhe2048"
>
>         echo "Test secure concatenation with SHA256"
> -       _nvme_connect_subsys --dhchap-secret "${hostkey}" --concat
> +       _nvme_connect_subsys --dhchap-secret "${hostkey}" --concat --nr-i=
o-queues 1
>
>         ctrl=3D$(_find_nvme_dev "${def_subsysnqn}")
>         if [[ -z "$ctrl" ]]; then
> @@ -88,7 +88,7 @@ test() {
>         _set_nvmet_dhgroup "${def_hostnqn}" "ffdhe3072"
>
>         echo "Test secure concatenation with SHA384"
> -       _nvme_connect_subsys --dhchap-secret "${hostkey}" --concat
> +       _nvme_connect_subsys --dhchap-secret "${hostkey}" --concat --nr-i=
o-queues 1
>
>         ctrl=3D$(_find_nvme_dev "${def_subsysnqn}")
>         if ! _nvme_ctrl_tls_key "$ctrl" > /dev/null ; then
