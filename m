Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=67.231.153.30
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793019588;
	b=xEwvSA4KydUjub6gGeVem6rXSc2jOVqMNn0PtEXIHgMG9VzyyTwd9Fk7pD4SJ8DETOT/
	 5m+fcNZMDFQP+qi5WlOPXLxV6/2hhKmQEZUOJjuI6i1GgluB7n595sdUzbx7lZTbw/vPn
	 +D8o/nf3p1jb4RxB20RcnWawQ5vY/fhlUy/33Qjk6UeBlMfab2G0A8S7MqJsxEyZhQGIE
	 k5vyRwp7LVt+iY6l04obACVAiVxAS6Upd2Xk/Fdp+AYcqFwrp1RB8IP9iU2vr6eskyLn4
	 rLiAxI8N3mkGdfoWFQaUk8gL9eiMZm5m9DKOtmgQ7yQu8snd70+RPVCFZxR6tK4KTRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793019588;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version;
	bh=Ylh0ZRGYkm3k+/2Sw0RkV7Rs+/pu7YAFHX03rxum3h0=;
	b=T+b6BJFPw6gLeKywogLYlLSNHCsuFslntdH6Yy+u09SZNOg1ReAzPxJCljf8pDuQowwh
	 GbAegkME2AL5qAGyMcu/m0F0yKK4ITMR1aXmhUvXhyTiZdmf0yhSQi7LzlO1zl9bp0S5Y
	 KM9d00nOVyh40gsReGIF3bfjMELhlQpLG6O6ozuAkmhsSwMy+qaUZbneF56tMVmx+m2u7
	 nHFvDlualGM8l0i6etKF4X+8gutm4rt6uttNbg09eRd3hJ9zrv3k3WJrAIX2LP6jTe8nD
	 oNHcxUCMhOUgTX6s7SIhlkmy1JH2/jOdI3evcoblDwQ4E/IKkrjwEboCTOCYRL38sCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=M9d5t80n;
	arc=none smtp.remote-ip=67.231.153.30
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7201606A31D
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 12:59:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7201606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=M9d5t80n
Received: from pps.filterd (m0089730.ppops.net [127.0.0.1])
	by m0089730.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 69QAtBWw2267254;
	Mon, 26 Oct 2026 05:59:24 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	pps82601-s2048-2026-q3; bh=Ylh0ZRGYkm3k+/2Sw0RkV7Rs+/pu7YAFHX03r
	xum3h0=; b=M9d5t80nb/srchutcAsrh5+nVyBXZYlnYMQtFkiPCsyO0P1XkdphV
	YmFx/jm+vsKyRa/IjiB6cj2eeHxkYlj4X3vxGtrDJpLxygraH7FQm8KNRqVLHvuY
	+YxQPE4cU2BfcuYWjk1fRk3NdjKh2t6GublcxN0pHQYQFFRIb8+jMmThREpQUXYE
	rJUoLB97QRHdxBxN/MIPCvUK0HazmBeHkPRQrzWxy+NOumFWH//Z6yk5M84mTUlj
	rPZJ2NF0BH7P9+uvxbHaGxgr/sgw+Lqn7W9gUgAEx3okinVFyBmOnh62MqKV3PnP
	xJLDidbho0gosNHJovXB8QixMdD/OqzcQ==
Received: from mail.thefacebook.com ([163.114.134.16])
	by m0089730.ppops.net (PPS) with ESMTPS id 4hgr5n192m-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 26 Oct 2026 05:59:23 -0700 (PDT)
Received: from localhost (2620:10d:c085:108::4) by mail.thefacebook.com
 (2620:10d:c08b:78::2ac9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.56; Mon, 26 Oct
 2026 12:59:22 +0000
From: Ruben Hakobyan <hruben@meta.com>
To: "Michael S . Tsirkin" <mst@redhat.com>
CC: David Hildenbrand <david@kernel.org>, Breno Leitao <leitao@debian.org>,
        Atish Patra <atishp@meta.com>, Jason Wang <jasowangio@gmail.com>,
        =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
        Xuan Zhuo
	<xuanzhuo@linux.alibaba.com>,
        Alexander Duyck
	<alexander.h.duyck@linux.intel.com>,
        Andrew Morton
	<akpm@linux-foundation.org>,
        <virtualization@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
        <virtio-comment@lists.linux.dev>
Subject: Re: [PATCH] virtio_balloon: batch large descriptor chains for page reporting
Date: Mon, 26 Oct 2026 05:59:11 -0700
Message-ID: <20261026125911.753798-1-hruben@meta.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261025200808-mutt-send-email-mst@kernel.org>
References: <20261025200808-mutt-send-email-mst@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: gPwBMYUX77H1GdAaAehk4gVWy3gfM89H
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA1MSBTYWx0ZWRfX/wNdMHc+/EtN
 rdTGV6nH1uaW0e1MI06Ces30U+OMiY3HnDexehqRw/h0Br+neuJ8MNCqTLNdqCV9qTmEKVcP+gJ
 M84DkeCyxgJ1o/zfsbnzXx3MuTBuquA=
X-Proofpoint-GUID: gPwBMYUX77H1GdAaAehk4gVWy3gfM89H
X-Authority-Analysis: v=2.4 cv=Vr62kO2n c=1 sm=1 tr=0 ts=6adf4eab cx=c_pps
 a=CB4LiSf2rd0gKozIdrpkBw==:117 a=CB4LiSf2rd0gKozIdrpkBw==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22
 a=855S8uPTkML1Oy45N9_h:22 a=VwQbUJbxAAAA:8 a=20KFwNOVAAAA:8
 a=SjX2uGVl9HjTzPjVSL0A:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA1MSBTYWx0ZWRfX/NeanwFrptU/
 aDJrb/u/DZyNVxCGI+vUZObAtDsAZkAPkQBp2h2mj+9pGq/NMmanZ0psx+iwiJuQnjh9PHxLlJm
 M0nr3pqvWpKjw7fX1fcE01lG4I77NmZ3c4kBor9p8GwA9cM6CUiiWtklAJS0eoKvMtXjUirdeNY
 JGVqsPb2l2KdHETMRiXGYNhnQc1UGCw/uCTD/gnvMI7N5gd+eJog2we6aSeuDctYPi6XlpJmcl6
 +AxzBwOuuBX3sRNNa4gvRNT5uAYsjNBXzN79qrPfe5DSvG5W3thhuTs8T8apYVNjrV3tpXvEtCH
 QjjSQ9ciuF0P7BZTtbZrnlJrjup+2Pw7fSzZa0Km3NSEbi1vy1GcpaISEuzjdLyt23qWIk+ZkzM
 EJ5ECA9uQGtDJoxn00G0wMObe7I++aI1yDZouRN5s9D2Kbwc/wY7E7ggo9ZrHibXS97hYU2FkKa
 /Hm57otoOi19XzULVIQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01

Sorry, I just realised the other reply went on to the wrong thread, so just
reposting it here.

On Mon, Oct 26, 2026 at 12:19 AM Michael S. Tsirkin <mst@redhat.com> wrote:
> On Sun, Oct 25, 2026 at 04:56:41PM -0700, Ruben Hakobyan wrote:
> > On Fri, Oct 23, 2026 at 11:04 AM Michael S. Tsirkin <mst@redhat.com> wrote:
> > >
> > > Great patch, thanks!
> > >
> > > On Fri, Oct 23, 2026 at 01:19:19AM -0700, Ruben Hakobyan wrote:
> > > > The virtio_balloon driver reports a scatter-gather list of free pages
> > > > to the VMM so it may discard unused pages.
> > ...
> > >
> > > It's not just a question of convenient, is it?
> > > Rust is buggy wrt to spec as it allows only U32_MAX.
> > > So it is also to make it work.
> > > So should we maybe fix Rust to be spec compliant and allow 2^32 too?
> > >
> > > I think we should definitely recommend U32_MAX in the spec
> > > because otherwise it can not fit in the used length.
> > >
> >
> > Thanks for the review!
> >
> > Sounds good to me, I will CC virtio-comment@lists.linux.dev as
> > per your recommendation.
> >
> > Agreed that Rust-VMM should also be fixed in case 2^32 needs to
> > stay the hard limit. I think here for the driver, we can be more
> > conservative as long as we stay below 2^32.
> >
> > ...
> >
> > > > ---
> > > > The wording in the spec is a bit ambiguous because it uses "chain
> > > > length" for both descriptor counts and the total size of the memory
> > > > ranges referenced by the descriptors. My read is that the byte limit
> > > > applies to the sum of descriptor lengths, which is also what rust-vmm
> > > > checks.
> > >
> > >
> > > quote what you are referring to please, also in the commit log
> > > not after ---.
> >
> > I will update with quotes in v2, thanks.
> >
> > >
> > > I would also CC virtio-comment@lists.linux.dev - spec should recommend
> > > U32_MAX.
> > >
> > > >
> > > > Another option I considered was to limit reporting capacity based
> > > > on the largest possible block. E.g. for 64 KiB pages, the largest
> > > > block is 512 MiB, so limit the reporting capacity to 7 to stay
> > > > below 4GiB. Although simpler, I found that the time to reclaim
> > > > was quite a bit longer.
> > >
> > >
> > >
> > > So I was going to apply this actually:
> > >
> > > https://lore.kernel.org/all/b541ff170218bd5d45b551b5132e7cf2c490d761.1780906288.git.mst@redhat.com/
> > >
> > > which makes the question completely moot.
> > >
> > > Does this have any effect on performance?
> > >
> > > Thanks!
> >
> > Thanks for sharing this. Yes, this would also make sure we stay below
> > the limit. Regarding performance, I tested this on QEMU and it calls
> > virtio_notify() after each completion.
>
> Who, QEMU does?

Yes QEMU, sorry for the ambiguous wording.

>
> > Using one chain per entry
> > creates more chains, so QEMU can use more CPU time to reclaim the same
> > amount of memory.
> >
> > If we go with this, I think a QEMU patch to batch notifications
> > could reduce the overhead. Alternatively, I think we could create
> > larger chains here but make sure they stay within the 2^32 limit,
> > and keeping your approach of queuing them all before kicking.
> >
> > I am happy to share a patch with my thinking here.
> >
> > ...
>
> Oh. It's just the driver being silly and never disabling
> callbacks.
>
> pls just add virtqueue_enable_cb_delayed and this will fix it.
>

Ah great, I tried with virtqueue_enable_cb_delayed() and yeah it
largely fixed it.

So regarding the patch in
https://lore.kernel.org/all/b541ff170218bd5d45b551b5132e7cf2c490d761.1780906288.git.mst@redhat.com/

I see it's in a larger series, so just wanted to check if you're
planning to send this patch separately? Or let me know if you'd
like me to do it. Thanks!

