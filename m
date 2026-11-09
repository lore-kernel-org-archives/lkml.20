Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794222619;
	b=Gat5rS24nkmP6u9duHJ7QGDz5o+T0wMby9ykFp58lQuuHreNf9+PrRwEsw8HdjRwshD7
	 R7tD7mc7EOt1UHsFcsKWGdygc/6ILDQklH6JdMigHhCIEF2jHS7mS3md1gP6qq+KB/N//
	 pYKejWokoeckSRMFWjwfJFE3rVQe1e2mc3Adk7n4y1CHdZtTOsaYGWUUkL8C5zTbdIJQE
	 XalfO8HAbYlXkUnvEbAamTZtU8nG41kC0QE/HXWo8ueNzxd/BAg4PUyKJ4dqB4wAZLkz1
	 /LuZBQtjLUuedT69mbMMb3dtPpN/McvSrFpkCyNcXUj/VAsorXTOfWaV4LruUwWCgVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794222619;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Scanned-By;
	bh=J5dhqbhYXQcY38/MwfGJS4lj6d8vb41ZbZA9Qsq+Ke8=;
	b=ITxFPtRA45dGUqm92AbgS2A6nXR3jpFMyAFmBr287lMslPEEs8QF2f2B7v/LPyAJ3CEJ
	 ch53AJgmhr5sIL/b6n/iEZQRHyN3yxuRB89hAu17rxhwGmG705zOkJgggPV+WbarSGqca
	 5sQbhOxo867Y84sXpaO4PQPGUZFrRJm8kqWWy4fr87Geso4id/0tKVRZPHVfOiBqL17O4
	 0rY9nhC7GiOx8tC/P2N+lBI/gbkr3exX1j8QQlWmILEcejJbF39JTWzmcJuuCzYc+6ohj
	 B5ZIMJg1/GsOWcZAaP5FZDiDe612k74bS9Maxe31TxLdoFRRJkphsD2tzdZHvfhVJyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=AXJQ05ab;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86061606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 11:10:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86061606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=AXJQ05ab
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794222617;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=J5dhqbhYXQcY38/MwfGJS4lj6d8vb41ZbZA9Qsq+Ke8=;
	b=AXJQ05abBEtXTH1sx32oC8cpfj+JrbI3owFdrL3WGduKkDVor0SAJqNbJoRX40rp4e3J75
	VvDoRdqY5J915n7YMSKEnja5NAsSXbfa6u8ot92nYULK1PNRXS5GOETYcNj4DGJOjWa441
	UhWEC1BHYEfTqZCQXf7SaIvKkN4ZZzU=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-198-Xslz7O5XNmCcEFKJy99xCg-1; Mon,
 09 Nov 2026 06:10:14 -0500
X-MC-Unique: Xslz7O5XNmCcEFKJy99xCg-1
X-Mimecast-MFC-AGG-ID: Xslz7O5XNmCcEFKJy99xCg_1794222612
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 13F911955F6D;
	Mon,  9 Nov 2026 11:10:12 +0000 (UTC)
Received: from onestero-thinkpadp1gen7.tpbc.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 7CF551800480;
	Mon,  9 Nov 2026 11:10:09 +0000 (UTC)
Received: by onestero-thinkpadp1gen7.tpbc.csb (nbSMTP-1.00) for uid 13628
	oleg@redhat.com; Mon,  9 Nov 2026 12:10:11 +0100 (CET)
Date: Mon, 9 Nov 2026 12:10:08 +0100
From: Oleg Nesterov <oleg@redhat.com>
To: Zhao Gongyi <zhaogongyi@bytedance.com>
Cc: catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com,
	ruanjinjie@huawei.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] arm64: ptrace: don't warn on missing siginfo in a
 group-stop
Message-ID: <avGqEOamCMLjOD8i@redhat.com>
References: <20261105113051.97810-1-zhaogongyi@bytedance.com>
 <avDGjYYR6Tj1sVgP@redhat.com>
 <7fb3d264-ada7-4dfd-be21-05ce370686a0@bytedance.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7fb3d264-ada7-4dfd-be21-05ce370686a0@bytedance.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

On 11/09, Zhao Gongyi wrote:
>
> On 11/9/26 2:59 AM, Oleg Nesterov wrote:
> >
> > ----------------------------------------------------------------------------
> > But can't resist... The old comment was obviously wrong, the new one doesn't
> > look clear to me. It correctly explains why info can be NULL, but not why we
> > should not update orig_x0 in this case. May be it should just say that exit-stop
> > always comes with info != NULL?
> >
>
> You're right: the comment explains why info can be NULL, but not why we
> return. The early return is intentional: it keeps orig_x0 unchanged
> during a non-seized group-stop.

Yep, this is what I meant. And this looks confusing to me. Lets suppose that
the tracee was stopped because of JOBCTL_TRAP_STOP. Why should the behaviour
of update_syscall_orig_x0_after_ptrace() depend on whether that tracee is
PT_SEIZED or not?

IOW. To me your V2 looks more understandable to me, I don't understand the
Catalin's concerns.

But then again, I can't really argue, I know nothing about arch/arm64. And I
do remember that I tried to confuse you when I reviewed your V2 ;) Thanks again
for correcting me.

> I'll wait for Catalin and Will's thoughts on the wording.

Me too.

Oleg.

