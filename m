Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 207F63D47DA
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 06:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787900222; cv=pass; b=btxvH+Q+mleUHp+f/1vkE5eGDTVfcYrh0j3Ytg0QaCfpU8RxrWQ9pNABjEBZWkTSpVztuXXHjjvHT1m+CjgyNtuJyZe0k7qQtOcRUFsPBkycoPsz1615BLQ763hfxqT4Dr/FKVQ+6UmE/JFzYjboKXp5yIO/JzEoE/fE1vghLBQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787900222; c=relaxed/simple;
	bh=pR8lzbcrGU+mduT81ko12cR/81LPWWYiWTahcEa6OJU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HTLR+ElNfq90tUceWqY5N8ysT5jlS/CGaF9Okz3mcUB8gmnpKZmEXKD6Tuz4RLIpLO8fcLSWN7QtlyHlhguwWdiLCXKRykU0r5VzDJPKIsRwBzrhkexmU7o7B7ErxUZs5ZyYZG6ON02fkDhdKqCb/KaDJjyrnB3Bm6sSA+1rUr8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cloud.ionos.com; spf=pass smtp.mailfrom=ionos.com; dkim=pass (2048-bit key) header.d=cloud.ionos.com header.i=@cloud.ionos.com header.b=i6bTVJ6w; arc=pass smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cloud.ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloud.ionos.com header.i=@cloud.ionos.com header.b="i6bTVJ6w"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6a6142b49aeso33554a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 23:56:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787900217; cv=none;
        d=google.com; s=arc-20260327;
        b=AO8UepKJ2/oEg4I9ok5qIgn5NaymtTMYP+ZTyIVkfCOp4w449QlrBqLbtO6b++f9Kz
         YjX5vILfzObhMFjPGA1jmH/5/8TACu2SWVMIr0faXPFdXmE8ql7oJ1TgS9cOwUFTossQ
         I7rKeyg6LfNW8HZtA1b1b3q5zglK4qAfbP2rD1KCnRQc64pbbaRQSFe1OcRhFC9uEyXj
         7BfBgA+nDMBK804OWZIZaWKeg0cBwl7aKttZAYN8hvQshtuaRO5qDgH3ugM4y64AfRiW
         yb/KV5Il1LhhvdZH6eOys8cVwBxSoH15BRKXlHULHwtSukPi6itehBSVyKTBNFOSFtEP
         WLaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ClJcyzcXv03ttdoVDIVXl7vZcyMM3/8g1hhdRTAECV8=;
        fh=fcsnw89equRmdVGq4BQUL+3KmJdh5Q/9h8IftA1KJWg=;
        b=HotlDCXH/tBTGno4m+tm8g8wZzAJySq8SFRGcQD8yclfKh1f+WRfI4U2XbC8STmH6s
         AdThHdL77HB3hUmoKYnQEOr6Y4yXncEtQsVvSv3RuKmgsjZYiEStyOIjv4vn3n0r6Ugg
         dclt7NJL0PXmtVLzmBgGIVAk3k3e3l9CvQCPW+MLGMYSdVjBL7/S2cWZJCSPmprDZgI9
         fG7yoAMSBm0956/eD5u9PKFNZS2Gr+9d7l9aCbrswK7dQEMqKwA1K0Pg9GdfSDcRHscV
         /GpwUujyXOJrZbXzfZKUZgp6uz4JdSnSK3olBaeF7IcO4Wqrri3thvArrnoaVq9f5cRY
         v3eA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.ionos.com; s=google; t=1787900217; x=1788505017; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ClJcyzcXv03ttdoVDIVXl7vZcyMM3/8g1hhdRTAECV8=;
        b=i6bTVJ6wAnY38qnwYo91JD1OK2ype9VuxTINuqhk/xX4p00fPj1Lsqijmxbm7VYm98
         c6EnIjpvKUvvpBK+YrSLlVmV9s3vYS54ar64MnNhessLhEnCzlj/AMp0KrwKYh6TjVtw
         m0U9XwCLlxu/Wm0tzn3ytl8UrZnSs8f+F9EIEleBmf+xucvVW3meJtfP+1WzlJbY3yrI
         VZESC6jIxjCo36QsCj5I2JhJxKZCZuvgYzRaNaunx66WYowOAzb8w1EBOIPE2typs9Bf
         EKgfYTvkd/TIsPmYCt9JebkiijXQsodPobWZ8JFq1RyzWHPtLosF+IKpYgz3nuVGR2al
         YvAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787900217; x=1788505017;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ClJcyzcXv03ttdoVDIVXl7vZcyMM3/8g1hhdRTAECV8=;
        b=FS6iuIyucu+ElLBzhrmigX7bsqsVIRL/b1+iOgXzU1fmQZAjg/dWeMndZHZt9IMHgy
         52QzYIS7WBHBaFks5OvObb+y+pBE8pzK8yRa3sAZCIcRYfp884YWFFUdS+hF4bgS0xol
         UwUVkwnQFdokZ7+Z2nnsuVvKj/X0K4GkxWFQiEjE9uew8BAOW/Bth2/wJ0M0D8d/TCTB
         w/91qmVjvy/patMszFTvIfL96cvcy/WUS51OOSCiK+m/Dl4YXDyT+D7KftkxbSCcZ2sL
         oBPVCTxNVNB/pca/ZrXCMPmwTP8y7ejSQIJVSgxJEFqPe3qbK551/Ytg82p7s3OziQXm
         DphA==
X-Forwarded-Encrypted: i=1; AHgh+RoEhn7ViF+GsewT43ogYPGFiMwWJxWpKpFWWpRruVTReG+nFOXRbMTbffXH5Qymyacgn3PesMejjM+3fMg=@vger.kernel.org
X-Gm-Message-State: AFuF++muRbKGezehrSHPtYvKdzKZSNgGai4fRu3mlmzZXUN8ueafYJIZ
	R5IosF+b8xq/ZGgEpgYKAunKLSfOdAG7A9nqkpZSo87hxU7kUpH0+3FJt4enoPb0Tr/cnxANgGN
	OBdVs1I4+y1vOsBDHtZWYcTGs3KoYPNT2eai7DMeiuythGQghH1VAA7vNVw==
X-Gm-Gg: AR+sD10Af1O/21QPgfda7SQ0gwEQ4bXs6KysuhudO/QEvtmReWq2XzQKcpugDNdG/1o
	I3tqAorXilUaX5785FdNCNmLyX60JDRNGbkPMpXlNtq9nqXrFVXww9gimSFDwwzKaxhdhAbclvl
	CjjQYoq6WaJxI+v7IxXGAC4flFtMhgpM8ObAGGCAgYt0ltlIxrH/ThNNs6jhPWS8GlrwQ0++mTg
	FaqUs8Wotq29uRzOQEAjqovWkt0JiwUkUnursW82S/l2MqC6Duq0+HpeKzBaesGQ+aJzdJ8wV9n
	HlsXk52IFurFyH0gmvZJCg0TUieotctXhdWhoUpvmNwW3aIFAJnIty7gQq6Z5ow+XWxXySkpDIh
	0ng==
X-Received: by 2002:a17:907:1b0d:b0:c1f:4754:d87b with SMTP id
 a640c23a62f3a-c2556c18157mr145957266b.1.1787900217282; Thu, 27 Aug 2026
 23:56:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CA+0ovCiJZz6O8LzsS9Dq1-JE1OE1L_OTA6Mr-WratpUE6jczHw@mail.gmail.com>
In-Reply-To: <CA+0ovCiJZz6O8LzsS9Dq1-JE1OE1L_OTA6Mr-WratpUE6jczHw@mail.gmail.com>
From: Jinpu Wang <jinpu.wang@cloud.ionos.com>
Date: Fri, 28 Aug 2026 08:56:45 +0200
X-Gm-Features: AcwNN1WdLy54onDAnumUWqn32SBPHutYhZ4YRkU8KaULyqBmFlcvls2nylPuDos
Message-ID: <CAMGffEkQiuEC7vP9aWzdppJ+2O6pkCEdoqkJhzqVE3Mm-jp0hA@mail.gmail.com>
Subject: Re: [BUG] rtrs-clt: general protection fault in process_io_rsp() / rtrs_clt_rdma_done()
To: Farhad Alemi <farhad.alemi@berkeley.edu>
Cc: "Md . Haris Iqbal" <haris.iqbal@ionos.com>, Jason Gunthorpe <jgg@nvidia.com>, 
	Leon Romanovsky <leonro@nvidia.com>, falemi@asu.edu, linux-rdma@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 28, 2026 at 7:22=E2=80=AFAM Farhad Alemi <farhad.alemi@berkeley=
.edu> wrote:
>
> Hello,
>
> As part of the kernel research at ASU's SEFCOM
> lab, we hit the crash below. Crash reports can be found here:
>
>   https://github.com/farhad-alemi/public_bug_reports/tree/main/135-rtrs-w=
arn-on-peer-supplied-completion/
>
>   Oops: general protection fault, probably for non-canonical address
> 0xdffffc000000000b: 0000 [#1] SMP KASAN NOPTI
>   KASAN: null-ptr-deref in range [0x0000000000000058-0x000000000000005f]
>   Workqueue: rxe_wq do_work
>   RIP: 0010:process_io_rsp drivers/infiniband/ulp/rtrs/rtrs-clt.c:502 [in=
line]
>   RIP: 0010:rtrs_clt_rdma_done+0x732/0x1450
> drivers/infiniband/ulp/rtrs/rtrs-clt.c:637
>   RBX: 0000000000000058
>   Call Trace:
>    <IRQ>
>    rtrs_clt_rdma_done+0x732/0x1450 drivers/infiniband/ulp/rtrs/rtrs-clt.c=
:637
>    __ib_process_cq+0x149/0x440 drivers/infiniband/core/cq.c:110
>    ib_poll_handler+0x78/0x280 drivers/infiniband/core/cq.c:157
>    irq_poll_softirq+0x1ea/0x500 lib/irq_poll.c:110
>    handle_softirqs+0x191/0x5a0 kernel/softirq.c:622
>    </IRQ>
>    rxe_receiver+0x1224/0xc940 drivers/infiniband/sw/rxe/rxe_resp.c:1567
>    do_task drivers/infiniband/sw/rxe/rxe_task.c:127 [inline]
>    do_work+0x1aa/0x720 drivers/infiniband/sw/rxe/rxe_task.c:191
>   Kernel panic - not syncing: Fatal exception in interrupt
>
> Our reproducer.c is available upon request.
Hi Farhad,

Thanks for the report. Please share the reproducer.c so we can take a
closer look.

Thanks,

>
> Happy to test a patch if that would help.
>
> Regards,
