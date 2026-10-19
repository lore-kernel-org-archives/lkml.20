Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792426133;
	b=ICqYc19T4RYy9qghpXBX7ASgoZuOjlN/LehVGF1FtOhCDLEolg0mcgiwpxNeyn8V/20O
	 3rbwQESaXtZ4BEv5h7SxnnmpNRpA1D93NhM3iVslL/8V8keDuc0cbtIqTLs4ZHFaPnFwj
	 Gjalbg31YTtgbSEHpcUI4nNVq1JUXJtk4Jwu6CXoklBB0gChP982P3hHVM4RGK4mCCpBI
	 /RzRZZtZZF7JEAoKqbZlQyctspRFxRPRIa1+bLThvrHiET7Bamg21wqsSZ0cbtWZSrCDd
	 ILLt/wPiP2zRaX8Y24s9q22bY7ZQIyAyhzo5aCSG0y96tBF/XLJfsmQPewnnow1qjJw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792426133;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=msDS2Uc5/Enhh4r5B5bWo/aF5i1pI4GZznS9tXeODFc=;
	b=QUjfRKd9/FNeb0YMsw1K4Je9A9ikQzgH7UqWJtfZNLo93qngispWGVGxEQy7zrsU1MqA
	 jjRwihUfJKQVYHfvPjANm92CaoJV+IGKY+pHSQMddjDfMpXB+mYMILNRjCw5vnZSNPU7n
	 hUHDxed0NDl6xwKEGTqkC/hg01htXuiUJ6OK91RgKGeJc7xEzTPMrDKGFwZ8OEUydynhG
	 43NL85tDQWVrp7Ak1JZM1xhyVvdNp9QiKKdCn4RjBoTfLsCprEgSSsAofS5MTzpLbUiny
	 inYjcOU5XLwvipgpRzzSZoYsgXoVAGsmk+4VTYFYQSv/0z1ceZ0EnVP0IySiAzzt+pg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=m12T2hZV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55EEE606A33F
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 16:08:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55EEE606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=m12T2hZV
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-38759bcd877so1392737a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 09:08:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792426133; cv=none;
        d=google.com; s=arc-20260327;
        b=RJXOg0eKduDMm7+Axo89tTYd1eBstM5FXzUTWkllkdM7MN0+zakM+BeLSreI78Tcyw
         HonkTFSTLL8aM36yeWtV4wpeaRtN5H/e2KY1RTSWWlZN6vSZIqVvIMGjMIJlNZm16CaO
         sxn4NqgBS4F13RpwD9D6cU81AXJ8eYj6D8wGYdS0ADukKmdasFsUvcWbr/9DKdDfNBGh
         EZ2vYa8klu7Uj6jYpkdN2ZKcW+vr7ksEQF6N6uMKBcflJ9/rGKDzsagoH+KuJopF+AgY
         vxP1ZVI0bGaVNnjydEgRTzau5GDrKSqt64YXArgXhdjHG6rl9LOl0R/6mvGYOGD97/Xu
         q9NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=msDS2Uc5/Enhh4r5B5bWo/aF5i1pI4GZznS9tXeODFc=;
        fh=NYtwXodbk5LE8TYWn6M+v/pJUOUgEqFsoNwkV5pG02g=;
        b=Ygmy8AUNQhLVdoQX9vYmOaCuurgtJLmIdZ/9QD5gXNteMWrJ1awQufI7f0MEWoLpCr
         vLStBHT27VaFw0ukbc97p3HvLErOtHmftVlkvnTd4WC9bm79mQMalYl5qjUbpzdOPj9/
         HqqAP9uCS83gefr/CbbfVvt0IxUh7+Lm/QoJLDaPgwmc3W4Af/9/X/NBpa4fTN9EM/ce
         GyYEWfmpHOLEJTXPmrKsH4uZzSUSyGJjAPY1/EjLaDgx962J0SvGTLZZUmwPSVfBWRw6
         pBcVxh6RarSQB6wHG0Gn8offCLmj4xH2VHql7MS9EdHNqB5pz7ee+Jf3eDuTE8LlkKCU
         kCEQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792426133; x=1793030933; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=msDS2Uc5/Enhh4r5B5bWo/aF5i1pI4GZznS9tXeODFc=;
        b=m12T2hZVaWUMbmCqdm9gVfugj/lXfdK+nmnfQA22fKj2jBfRrHywGX36XLxQA+ZbnQ
         Boj2/YgXC5SnV2N0DnStQ3awnauG5JLVr+Jc7ZzQ6NyuBV5XS9AoV8E7/ogNOv8CXMPD
         KrFFcxoZN1YvxhSfAXbZJdZSK4axGx5A/60laZgZZC+Z4gifvMOl2RYRD4uDXQC6LZva
         xQbDR3EaGDoSr7hWq6u/ei1M82R+fT2bNodj7CQtpOS335QnFEyDjH40JDgHgjihW7FI
         fT3RD5huikbzB+KqacRvyQksW/E2xge0qZ36TN7LcBtntIjCGttV9WPRE2KCxFto6snl
         RUFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792426133; x=1793030933;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=msDS2Uc5/Enhh4r5B5bWo/aF5i1pI4GZznS9tXeODFc=;
        b=ImZiuQYZvEa3P1anV4VtXTO5CrtSHtx3kpuA2WUxxWhKp/z697t3xwc/DHWQA6M5Pv
         iIM82f9y3RmvU2lOs2Nad4GPWp9wlhG79mdwG/dtQXKU2LSfxWfGyoyi/DicX/tJbHkP
         ptxuXf5M1mRkhXcoiodz735pwLM+nFFjE6wnfRbDfKedDZp3S7DVfpPsPKHzMhqf6TCe
         9AhHCUdQJzhKkMnnVoMbjPo7byfRt1UMhSCMGN28IcofPU8qhp8DlLCc8vthWPHbBb6A
         RLYMmjHaFZUMJ8PO65GRzVYVK5lo9gNcOVQLGavT3lmInK8j8Gv8OiEChg4snCUgTwRZ
         Vdtw==
X-Forwarded-Encrypted: i=1; AKwUvBzCHY1Jh6NcArfQq/RibriOe6ZiwuM8OLNuBS6S7gVWQIqKu34HZD/ebBU8XlGE8pKexGusOwtjMGwVPa8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJleVbTsRR/Z80T1CQMOmSRRR1F7zosX2vF6XNkMEBquvtRv9ZV
	sObUjCJKIjFFSEyUFwE31pEx9U467brGo+v9BMh0BlkESL7LZrO05kc/xNUVbnOhw0BPdhyhS29
	z6wZf93t/vqKHFTPq65A/lxw0vYAN784=
X-Gm-Gg: AYBFou0CLlQtLBVviQ7OOSJ1Q1XVQI1de0cM/zhVnzjEqqhYQ0L46KRwFYgH+3tweKi
	FFSLY3VqIoOdHV0gJj61gwuAc5t49YLIm+LRbkdz8dZuFOdTpMbbamPBDlH8TSCQ2SohMbpv/b6
	RP+El4QSEVPa6EfRtZvDe16wcuw6d0HhOzhOcDosOKu/9bc1RoB42qmkYTYlpNVCR6CePa/lbN7
	c0ZZ13AjMJXqwWlK4k9j2Zg90SjwAXf8mFg7MgWv2um0KukIn5A0Md8OBM2yT2OciRen1xS3B7g
	+2ps0Ed5uYTO6WhXmIqLsd7KrC07s5BYQgYQRxSLiTIIDiC63ONJMxD1eIVHjIXTuF4Cr8fBZmV
	lBgdUt26p0sFAVyQL9r4i8E2PvW4hiERXiAgyrLSuBEEfFvlk/eVGT2HBonoGJNgoM9XvGZ8rfV
	JdHPYswf2GO0Shuqj5HM5LcF7JV0gnwVcVvQ==
X-Received: by 2002:a17:90b:3c05:b0:3a0:e4ce:31fd with SMTP id
 98e67ed59e1d1-3aceefc4ef4mr6323225a91.10.1792426132592; Mon, 19 Oct 2026
 09:08:52 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019080709.477548-1-18983559317@163.com> <atX2FsqHIkOvhrLy@redhat.com>
In-Reply-To: <atX2FsqHIkOvhrLy@redhat.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Mon, 19 Oct 2026 09:08:39 -0700
X-Gm-Features: AclHuK_1vW8c3v9yVgPeu8TsfazzwGD9-e2JI_KbLz2M4NCvt5GeP6hDT09wjMk
Message-ID: <CAEf4BzbX7vmpd2da4eKphX1r8=QXGey_1m32-KP=-8FOkFk15Q@mail.gmail.com>
Subject: Re: [PATCH v1] uprobe: Assign session ID before publishing consumer
To: Oleg Nesterov <oleg@redhat.com>
Cc: Binbin Deng <18983559317@163.com>, mhiramat@kernel.org, peterz@infradead.org, 
	mingo@redhat.com, acme@kernel.org, namhyung@kernel.org, mark.rutland@arm.com, 
	alexander.shishkin@linux.intel.com, jolsa@kernel.org, irogers@google.com, 
	adrian.hunter@intel.com, james.clark@linaro.org, andrii@kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2026 at 3:51=E2=80=AFAM Oleg Nesterov <oleg@redhat.com> wro=
te:
>
> On 10/19, Binbin Deng wrote:
> >
> > consumer_add() publishes a consumer on uprobe->consumers
> > before assigning its session ID.  handler_chain() traverses the consume=
r
> > list under the trace RCU read-side critical section and can therefore
> > observe the new consumer while uc->id still contains its initial value.
> >
> > The race is reachable when an uprobe at the same inode:offset is alread=
y
> > active and a task hits its entry breakpoint while another CPU registers=
 a
> > second session consumer.  handler_chain() may store the stale ID in the
> > return_instance consumer array.  By the time the function returns,
> > uc->id has been assigned a nonzero value, so return_consumer_find() fai=
ls
> > to match the saved ID and the session ret_handler is incorrectly skippe=
d.
>
> I guess we don't really care, this doesn't differ from the case when
> consumer_add() is called right after list_for_each_entry_rcu() in
> handler_chain().

that uc->id is important for "uprobe session" semantics, which seems a
bit different situation compared to barely missing consumer_add() in
handler_chain(), but regardless, the fix looks good, we should apply
it

Acked-by: Andrii Nakryiko <andrii@kernel.org>

>
> But the patch looks "obviously good" to me anyway, so
>
> > @@ -1032,8 +1032,8 @@ static void consumer_add(struct uprobe *uprobe, s=
truct uprobe_consumer *uc)
> >       static atomic64_t id;
> >
> >       down_write(&uprobe->consumer_rwsem);
> > -     list_add_rcu(&uc->cons_node, &uprobe->consumers);
> >       uc->id =3D (__u64) atomic64_inc_return(&id);
> > +     list_add_rcu(&uc->cons_node, &uprobe->consumers);
> >       up_write(&uprobe->consumer_rwsem);
> >  }
>
> Acked-by: Oleg Nesterov <oleg@redhat.com>
>
