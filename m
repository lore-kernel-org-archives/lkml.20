Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792854563;
	b=hNEtc86RYfgxrLZgUMDZRKCCnCd+EzKxT/qxhSqbMS8Xjp/QE55wm5qTBkvFdfN8Ysyo
	 UZ8M7SEt/nu7fNSsu3cZhQ/+M556g1JyEDhrwbd7nMkALW2bEtjF9POzaE4QDl+8JwDUt
	 zCUbW0Pg0yLoqxGpaRzodRGkK2PifUDBvlmfTbsWMlK7Q6UkIKR82vTHA6H2ddoVcq799
	 ZFYPTkOMWkBY1xuD46pzfhQAdrwheXVUAlSRKOUsOwCRePTKrHwSsN2PoO6ssg2ymwPGT
	 Tqvsv1AyksR7CrjRxNrYwjRAf0BpRP13vNkG/Nqqa/B+VTgnE5NDknzZBgbJiQz49Yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792854563;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Scanned-By;
	bh=MjAMERdRwkFgyYyTaGYqHUCEpETXA7poAfSS4lm3v4U=;
	b=XzV510gYI3NDs+LyFgZ/ho8YWvdPZFBCg0VVkOrQevfaa32A40LjA/1/1qI1VKYw+9TX
	 fETc+UOKqoBltCbfLfBjvHI8yA19ZJUg7g2LQ8kpd4qrPbc/PGMmwiDE/VzlgmBbUsF4L
	 scptbQCx+w2/0Bbtnnb40qiXynGoF54mnLmgJTxpz+ZlVeFqxCdH95VMcpqXvMPfgQ7Qy
	 41xbb+yaczHJ41f5iacqi6EERY9H4pIJqcWuIYJRm/uSQTtjvFiTNPbCcVyT1zODR5wXP
	 bfWRJbPSpNOgeyarCyylL2zTGxHlLSo6+wMb6aPWFSc0V/YvVPOjoCS0zJzdOwFV+vg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b="NuIq/B87";
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCE6C606A324
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 15:09:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DCE6C606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NuIq/B87
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792854562;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MjAMERdRwkFgyYyTaGYqHUCEpETXA7poAfSS4lm3v4U=;
	b=NuIq/B87a+l2lqmmzW+s33W6+de/3zz9FDdFIAzE90b6RCyj8527V0z5fcSNoaMiaGFyRN
	y3WM+Z1c/Mx223i8S42utiS5Icf+T2C4jsvC/822KgoFpLjP7RQKJODN9IGk1qi0TcAiHA
	EIsgoE+dgYJHuPtj6bmneR/vvoWzmfo=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-386-MsNrRDUuMIGd6_WsmBl95A-1; Sat,
 24 Oct 2026 11:09:18 -0400
X-MC-Unique: MsNrRDUuMIGd6_WsmBl95A-1
X-Mimecast-MFC-AGG-ID: MsNrRDUuMIGd6_WsmBl95A_1792854556
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C31621955F5A;
	Sat, 24 Oct 2026 15:09:15 +0000 (UTC)
Received: from onestero-thinkpadp1gen7.tpbc.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id BD14518005B7;
	Sat, 24 Oct 2026 15:09:12 +0000 (UTC)
Received: by onestero-thinkpadp1gen7.tpbc.csb (nbSMTP-1.00) for uid 13628
	oleg@redhat.com; Sat, 24 Oct 2026 17:09:15 +0200 (CEST)
Date: Sat, 24 Oct 2026 17:09:11 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: Zhao Gongyi <zhaogongyi@bytedance.com>
Cc: catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com,
	ruanjinjie@huawei.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: ptrace: don't warn on missing siginfo in a
 group-stop
Message-ID: <atzKFwYJmosK3qFd@redhat.com>
References: <20261023110710.10145-1-zhaogongyi@bytedance.com>
 <attf9KALBQyOGyco@redhat.com>
 <beb5fc93-4cca-4dc9-a4e3-f406e8c9cd58@bytedance.com>
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
In-Reply-To: <beb5fc93-4cca-4dc9-a4e3-f406e8c9cd58@bytedance.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

On 10/24, Zhao Gongyi wrote:
>
> On 10/23/26 9:24 PM, Oleg Nesterov wrote:
> >
> > So it seems that we can just do
> >
> > 	if ((target->exit_code & ~0x80) == SIGTRAP &&
> > 	    target->ptrace_message == PTRACE_EVENTMSG_SYSCALL_EXIT)
> >
> > ?
> >
> > I'll recheck... If I am right, perhaps it makes sense to simplify
> > ptrace_get_syscall_info_op().
> >
>
> Hi Oleg,
>
> Thanks for the review. I checked target->exit_code when the tracer calls
> PTRACE_SETREGSET after waitpid().

Aaaaah, I forgot that wait_task_stopped() obviously clears ->exit_code ;)

Zhao, sorry for noise and thanks for correcting me!

And let me repeat, you patch LGTM. But I don't think I can ACK it, I don't
understand this arm-specific code.

Thanks!

Oleg.

