Received: from mta1.migadu.com (out-72.mta1.migadu.com [95.215.58.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1810446C4B0
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 13:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790430899; cv=none; b=bCpPohfwUzx9qt5sZaJeVdb3mUCE+qjMVrCoGJTV+sq/cGx80smAy6ZF2zhKp8raMVQhyxDkFFs/n25ob1kPoS8K+UZ/TCkPusIK3kIS1lXKAX1s3WsoLWbFOnZutnxsD9KbHV7PcMkJjhkHChWoFl22ywiPYvrfxCRYUSxBkoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790430899; c=relaxed/simple;
	bh=uV1gUFauIFFwAoGKortGYvqxA0j9X10wY+UMtq1n/tI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=Mwar/WZboo4/pDfRhYW+EjZU1ZxyJSWBq+HQSZ1qncURVLuxrRIwM6wuAzHhKrVgEGtF0WShQ1LYT7hC7WnEYfqrWYd0AumXgCjoAUv/rCyVJKp17D5bAKD0sqZS5PYDaY1H7WEADzFg2d50SraEtlT+0OLiBqnvOaCSz3cfzyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=dQUix9nl; arc=none smtp.client-ip=95.215.58.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="dQUix9nl"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=uV1gUFauIFFwAoGKortGYvqxA0j9X10wY+UMtq1n/tI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790430891; v=1; x=1791035691;
 b=dQUix9nl7kfSRHqYaveCa8n9y1UUKHqJlupSsz1zkd602LFPeWfO57j7A1I8RpZykey83A+q
 UjC7vAuNZzqBcCbs2Hnqy2C3cNC1A40kgJvSKCe6yAuLeHIaHm0KPhFVlmD57aY2KHKrJx+TzBR
 Vb4Pxeo0smAsOhzi7aGxWLm0=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id ca2b2b4202485a3a;
	Sat, 26 Sep 2026 13:54:50 +0000
X-Mizu-Trace-ID: ca2b2b4202485a3a
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 26 Sep 2026 13:54:45 +0000
Message-Id: <DLPAS1T6DHBE.LUGVFAKFRVSG@linux.dev>
Cc: <martin.lau@linux.dev>, <eddyz87@gmail.com>, <memxor@gmail.com>,
 <song@kernel.org>, <yonghong.song@linux.dev>, <jolsa@kernel.org>,
 <kpsingh@kernel.org>, <john.fastabend@gmail.com>, <leon.hwang@linux.dev>,
 <zirajs7@gmail.com>, <rhkrqnwk98@gmail.com>, <puranjay@kernel.org>,
 <xukuohai@huaweicloud.com>, <iii@linux.ibm.com>, <hbathini@linux.ibm.com>,
 <chleroy@kernel.org>, <naveen@kernel.org>, <bjorn@kernel.org>,
 <pulehui@huawei.com>, <yangtiezhu@loongson.cn>, <hengqi.chen@gmail.com>,
 <linux-kernel@vger.kernel.org>, <martin.lau@kernel.org>,
 <eddyz87@gmail.com>, <yonghong.song@linux.dev>, <mason@kernel.org>,
 <ihor.solodrai@linux.dev>
Subject: Re: [PATCH bpf v4 1/3] bpf: Wait for an RCU tasks grace period
 before freeing trampoline progs
From: "Florent Revest" <florent.revest@linux.dev>
To: <bot+bpf-ci@kernel.org>, <bpf@vger.kernel.org>, <ast@kernel.org>,
 <daniel@iogearbox.net>, <andrii@kernel.org>
X-Mailer: aerc 0.17.0
References: <20260925100342.481242-2-florent.revest@linux.dev>
 <22e95dbf944bdf6b657249657e884617f79972a92430f17abd47c472797ec4ff@mail.kernel.org>
In-Reply-To: <22e95dbf944bdf6b657249657e884617f79972a92430f17abd47c472797ec4ff@mail.kernel.org>

On Fri Sep 25, 2026 at 10:47 AM UTC,  wrote:
> > diff --git a/include/linux/bpf.h b/include/linux/bpf.h
> > index 1d2676782d70..d4f732996b47 100644
> > --- a/include/linux/bpf.h
> > +++ b/include/linux/bpf.h
> > @@ -1770,6 +1770,7 @@ struct bpf_prog_aux {
> >  	bool offload_requested; /* Program is bound and offloaded to the netd=
ev. */
> >  	bool attach_btf_trace; /* true if attaching to BTF-enabled raw tp */
> >  	bool attach_tracing_prog; /* true if tracing another tracing program =
*/
> > +	bool tramp_linked; /* true if it was ever called from a trampoline */
> >  	bool func_proto_unreliable;
>
> Does this comment accurately describe when the flag is set?
>
> Looking at bpf_trampoline_add_prog() in kernel/bpf/trampoline.c, the
> flag is set at link time, right after hlist_add_head():
>
> 	hlist_add_head(&node->tramp_hlist, prog_list);
> 	node->link->prog->aux->tramp_linked =3D true;
>
> This happens before bpf_trampoline_update() has generated an image that
> could call the prog. If bpf_trampoline_update() then fails,
> __bpf_trampoline_link_prog() calls bpf_trampoline_remove_prog() and the
> flag stays true even though no trampoline ever called the prog.
>
> Setting the flag conservatively is correct for the free path, since it
> only adds an RCU Tasks grace period. But the comment describes a
> different condition than the one the code tracks. The field name and the
> commit message both say "linked to a trampoline".
>
> Would something like /* true if it was ever linked to a trampoline */
> match the code better, and stop a later reader from assuming the flag is
> only set once a trampoline image has actually run the prog?

Done in v5.

> [ ... ]
>
>
> ---
> AI reviewed your patch. Please fix the bug or email reply why it's not a =
bug.
> See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/READM=
E.md
>
> CI run summary: https://github.com/kernel-patches/bpf/actions/runs/361228=
63248

