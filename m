Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793696686;
	b=mtS3a9rmB63UBlyX7BjRAqHPIMOIydAkpR4rxnL8p5fyjZfUCJsrbYEsu9SMm2JZwdHs
	 +BKo7bJFUVbqQS7jyYE3GNvw3iVAWdgU+IAvSW/R1PwmhIKKSoni4WjwzKANnAIAOFSrY
	 Qmn7a4RT3Gd810bQbhCIUnqQkWPJkjK3gjtOGoI4ULkJvhvMU1eBk33C78Wf+3gT86K2f
	 QVkfKY1aPX8VhA2fjx5mFMdyZb4WJOWnADZJNYfQv3TF00kl3tclAD9AEQliBuGbtu7B1
	 PRmXkh0PkkLWzlKSfYJvIWJuI0Dp4BVmSCd0yidJUtQq7s5FI5cxFjMvKW9MvtNQY6A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793696686;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=QibTS3hRHWBtrderPfFItxtuJrimy/UpjW7x7VnYyXc=;
	b=CgGmnsV7qY/HmQb5tZdVBuD3CbEKFHFuhPJsI6LpC5w0JaJ2CNLXYYNui6xZN3vy/gcM
	 Fe8t7TdnEcHbwqo//KPPl+/IHmqSOBQqzuDxm61cTwCq2kZdNoL+l7eF3IbZCA+uy9ZeH
	 Z0GFlhn6II3YXCR8jiXPp9nb36lr5EHv0zwLedC3TNmgfEe+KIM0LTa889rOtCwp6xLnL
	 JsAz4oVVrRs/J1gGHklmjLpz7XKytBz/aw5fvvbOPMb/VlYj8aiVcBp/xJxDjT10midIm
	 q4ADs7rMFUlDx/fxghUQyql8O06zKkqBmBr+LnCYLsm5lpUYEj25QwNTIiLrO8r7rcw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=smartx.com;
	spf=pass smtp.mailfrom=smartx.com;
	dkim=pass header.d=smartx-com.20260707.gappssmtp.com header.i=@smartx-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=NoUTn0BX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.176
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E769606A335
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 09:04:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E769606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smartx.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smartx.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=smartx-com.20260707.gappssmtp.com header.i=@smartx-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=NoUTn0BX
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3ab4891fc73so38146761fa.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 01:04:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793696684; cv=none;
        d=google.com; s=arc-20260327;
        b=T/Na7MMJzUT1HS7cluiS0mj6Er73neUhNio1YhNBVLaR8Zau3LqZeWBIT8+4r7Lupg
         f8nECJbFFJhSgNuQqDD11U9JVTE4i09La6OS9t+gjMBlEMeXbId7cyAwg0Cph9do3SF0
         ujmuhnbKtBQ6+IiMUxlIcQtfuOM8Q/GOpqzpwSt2nZ7gYzfrTHOOO0muGEe3sMm7z42W
         s8BNIucgzYS3tZTGxaQg2KC5/yJ7nvnerCySkIArNB4ea/+2INR7bRlhiEbSG4E3xu4J
         FSZWQ03RivDlgY4hYV6vNG4GjMTuAk71KWfvPl5fmNdknqR4qVtAeP+vchhYn181U60p
         p53g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QibTS3hRHWBtrderPfFItxtuJrimy/UpjW7x7VnYyXc=;
        fh=iNhh2I50JcZmim3E7VbMkZFtHr6itY8VM5vyZiwBrNo=;
        b=oTWhgMT41DXBH4x3ljdqVv5NFvVv2pZb9ncmYuFWBi7989O1zZve63B1TqfAT0wgpJ
         gTM7AlM6a8VFGyoBOp9RdkEwA/Hl8DJuD9gi0MBLU7YuCkw9bdAEiNPxCMqFBV4JH0gp
         K8GKyTJ0FjCsltpnnUP1z9dT7/J9q38VDtjlAxgurZTdds6ItymyT7k6y9Soj5qu4MR9
         poGCdn0mRFV0lxkyfN84FGaW6IfMTCcU0gsqDEBv+B0VbZW4I+icaI5gEN2KImpMVGEx
         kuXjIeCjgeI+TjV0fWCVxxE+aRb+nw5ShaWQMD9JrK1rrLeaUKhDEXGTJ3WY10fn0/4q
         aFPw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smartx-com.20260707.gappssmtp.com; s=20260707; t=1793696684; x=1794301484; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QibTS3hRHWBtrderPfFItxtuJrimy/UpjW7x7VnYyXc=;
        b=NoUTn0BXtDsnFq1HpMu0aGhl74vF6CKggAagce7kXJrkwzVVNgCdmEOWGPBVK+PZUa
         Etp/6wMflgBrUvrlEbhJpj0KHK68dO1qsnej/4oCGRTNlUyllk2VSFvBpJ/oijFF3u3x
         9J7sfZNzCPkN+6LxdDMXV4hIOZkEBaf3HaU4+2CBLg0mihokJbbiFUqVJzbJaTNByS4+
         4bwRXeFn4TXwNvbD4p0mIan+1sD8jxz8AOSqBvN1PF1sLCAYyvm9keSfuvDve6ExsbVy
         OWUJdr2MoaeK7kTi52hhSzF5qPFiLX2qRwDITel32YzXCyD09x8KdVs+QeOv8U+ffg3J
         qngg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793696684; x=1794301484;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QibTS3hRHWBtrderPfFItxtuJrimy/UpjW7x7VnYyXc=;
        b=iJHhrai3zRqH4TRRcgBoZCYfj3fwGLHKGtFwnY9pfZbpY0Sp3DPU0Ua4JabwArBMpo
         g0lkcex6oVdSMUr8L8xoHeIXsfysJgxJWjpb3utH4r0MnPGgpvX7fr/K+WnCS6PBZPJH
         YnXn+1JmAB2oyWappk/ctu4+uOUqfmfQsDPTmdgWTUNCxjKZABdaqdCnoMIVPGr1YRxH
         TjE8WFhoIFO1oks2rfHNLn92qE3vkIPVGc/d0WQ6VfYu0E/rmH8meQ5l+8LXuflU6O12
         3zCI6j6t81GMMfEXOdGQGYPGCCIH7XNlRSxVnMfXw3MRLxNI9Vv1yWH3Y2jgs13sv7Lp
         pj6w==
X-Forwarded-Encrypted: i=1; AKwUvBw/y7xlk9ZhgoU2ucIdAswWfQPoVI+XeBIsTYn3c8Yb1GHdhs+EzhsmQfHpqfMbhwh6TMi0ZgbubFEas24=@vger.kernel.org
X-Gm-Message-State: APuU4Z+yMB3D3itKlkq4nyR8y3L3ogN/SA/JaDIEXB21zBrVdiNwL8sH
	nEo+tBhzCdI0wITbgyLW2sZT/oe4z1MxNHcu1cdEowRAsBhEb50lZzCviw4aJFJTCGf2P8zupAn
	Ga++kOpSQdWrbWl1GPbkb1fbSCHMmLsTwV54o+VgEjvmFdrG5zM7+yPPZUxBRccyAIdc97+rlFv
	P+gz2mGz751zTQMaUrEDao4jnjqI4bge742A==
X-Gm-Gg: AYBFou3MM05UyxP/eBdtsh6oUocFuyfin9VyRgOBfDzhQpwugCFgsmhPHEXdt+2ielI
	hPlkFDiPE7YUn3tmN7p2kOKcGNYVSiMgH80yNBB+XmD7uu57qGmFatxtyKkDD7zigbf40/MYq7g
	uBekauVUF7/ImqpPQEu+UmCEGcPgN7HLwWk2UVPg0J5ERbJj04+n0crO6k09VJ7lEv7fwUvV0ul
	xlqdvs4GM9y4u7//Bd+hRT1FBOdIGjT+vix9v68fl8H2Tr803723CG8GPbJZf+RqmAXORlxQwys
	3IbtTdBP/Ku8zls1t0p4HDEQe2WoJxr96X9HT2Qtmz2js54VKs+CXju1YApoh5hfH2jY7nmMXpv
	B1MC1vMHNepcfc/R57jhva8xRBz444tbDzzOtIhqn9tuiCIH0jLZ882YtQO7DWr0e6JB9EJk=
X-Received: by 2002:a2e:bc11:0:b0:3ab:34b7:2535 with SMTP id
 38308e7fff4ca-3acb7a29983mr29493411fa.9.1793696683509; Tue, 03 Nov 2026
 01:04:43 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261009030111.57784-1-lei.chen@smartx.com>
In-Reply-To: <20261009030111.57784-1-lei.chen@smartx.com>
From: Lei Chen <lei.chen@smartx.com>
Date: Tue, 3 Nov 2026 17:04:38 +0800
X-Gm-Features: AclHuK_pmOLLTESyZi7anXUIO5GW4TaRMlcQcRNW9nXAneDiHkZvFfsScA0IpS8
Message-ID: <CAKcXpBxKzWgez34rmpqEmV9hw2JiKBtjJsJqVnKk=ySytxkU2Q@mail.gmail.com>
Subject: Re: [PATCH v1 0/4] Expose blk-mq tag sets through debugfs
To: Jens Axboe <axboe@kernel.dk>
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jens,

A gentle ping on this series.

It adds a tag-set-level debugfs view to inspect CPU mappings and
driver tags, with links from request queues to their shared tag set.

I'd appreciate feedback on the overall approach, particularly the
driver tag lifetime changes in patch 2 that support the debugfs view.

Thanks,
Lei

On Fri, Oct 9, 2026 at 11:01=E2=80=AFAM Lei Chen <lei.chen@smartx.com> wrot=
e:
>
> Block debugfs provides views of request queues and hardware contexts, but
> not the tag set they share. This series adds a tag set view for inspectin=
g
> configuration, CPU mappings and driver tags, with links from request queu=
e
> directories to identify queues using the same tag set.
>
> The series first removes a stale CPU mapping comment and moves driver tag
> allocation and reclamation from individual request queue initialization t=
o
> the tag set level. This gives the debugfs tag files a lifetime that can b=
e
> coordinated with tag allocation and release. It then adds tagset/<id>
> directories under the debugfs root and links each request queue to its ta=
g
> set directory.
>
> Tag reads hold a debugfs active reference only while copying tag fields t=
o
> local variables. Releasing it before copying to userspace lets tag file
> removal complete even if a reader faults on its user buffer and needs I/O
> to a frozen queue.
>
> Based on Linux v7.3-rc2.
>
> Testing on a 192-CPU x86_64 host with KASAN and lockdep enabled included:
>
>   - null_blk queue growth and shrink under concurrent direct I/O and
>     debugfs reads, including 100 cycles between 1 and 192 queues.
>   - Shared tag sets, shared tag bitmaps, three-map configurations, and
>     repeated device teardown and recreation with old file descriptors.
>   - Unmapped tag reclamation with 256 poll queues: tracing confirmed
>     allocation, reclamation, reallocation and reclamation again for
>     indices that became unmapped as the queue count changed.
>   - Task-local allocation fault injection, including hctx allocation
>     failures that rolled the hardware queue count back.
>   - NVMe loop with two namespaces, 50 controller resets and data-checked
>     direct I/O. These resets retained the same hardware queue count.
>   - userfaultfd-controlled stalls in tag reads: null_blk queue resizing
>     and NVMe loop controller deletion completed while copying to the
>     user buffer was blocked.
>
> No KASAN or lockdep reports were observed in these tests. A hardware queu=
e
> count change with NVMe queues already frozen has not been tested.
>
> Lei Chen (4):
>   blk-mq: remove stale comment about non-present CPU mapping
>   blk-mq: manage driver tags at the tag set level
>   block: expose blk-mq tag sets through debugfs
>   block: link request queue debugfs directories to tag sets
>
>  block/blk-mq-debugfs.c | 298 +++++++++++++++++++++++++++++++++++++++++
>  block/blk-mq-debugfs.h |  22 +++
>  block/blk-mq.c         | 143 +++++++++++++++-----
>  include/linux/blk-mq.h |  13 ++
>  4 files changed, 445 insertions(+), 31 deletions(-)
>
> --
> 2.43.0
>
