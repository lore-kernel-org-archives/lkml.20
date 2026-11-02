Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.230.114
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793609168;
	b=ARpbj3tFu/QA6LvBje2ttRp6XniAcIih83ozXSZLxfw4SXpxLCkQgMQdbWhVjwS9Se61
	 6Qguq55P0NPQsSOJBCVg6wB+JblxaimKhjVkvUrOv7YAwr1vaiWO/mCvsgrLBUBH+/M3L
	 t/Ymfqve2u8HcYBtLnX2Tfojzta0AN7Wa2IhOOfFJCq/df2xgDAvGvsfVRhl91KuRJQV8
	 34xSZYlXTbOJa+TQ3pYnsPifGtUgvQfSSXjU0VZOHN+0VJgs0MnEWTSjdUs70/ViiaIN/
	 BSimMG7erhI2tL5Q0pahW5n0MvgSSoBpcS5UF083JQ4m7PqycVxDCvlwkcMdvSDQXbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793609168;
	h=DMARC-Filter:DKIM-Signature:To:Content-Transfer-Encoding:
	 Content-Type:User-Agent:Cc:Message-Id:Mime-Version:From:
	 X-Lms-Return-Path:References:Subject:Date:In-Reply-To:
	 X-Original-From;
	bh=fkdHJk8QQRuS99Uc5GE49DCjtU5u9to+Rk8I4s2WNPU=;
	b=aelRyUResXyD+Wt28uEg0FLzt3WVc0Z7aX0X4whaxS9BPhVtnLOTaCfsXnuPuRx8eVq7
	 e+xIoX3v7IWiTKczWqvNEiLEJbD4gCdnUCOhSmu3aEoq6Ch2/gA0QaHnAU5fObXmsPb/f
	 vUeyEkQGMIhwQNfwGYEax02DamPCs0JfG1lbAFf+n/FBeBpLJM6vAhpfL23P9PdJTTTh3
	 Xh4eBIp/XQsO7pJ9DY9vAfMP8sNMptERNPCyjFfYxG/MfrmJc6+UDUA2soAbh5o86AsY+
	 XKi2AvK7gzNPQb9StMaQdSs9PM/bqJvepCF9ualoQsAxRXNWRr7GWdXUZLZJoBnIhpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=iKvQtl60;
	arc=none smtp.remote-ip=209.127.230.114
Received: from va-1-114.ptr.blmpb.com (va-1-114.ptr.blmpb.com [209.127.230.114])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98865606A335
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 08:46:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98865606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=iKvQtl60
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1793609156; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=fkdHJk8QQRuS99Uc5GE49DCjtU5u9to+Rk8I4s2WNPU=;
 b=iKvQtl60VKC7KY5oseQXOFdHZCqTieWhzHEHaieKm4Q41DlL92H/kqzhHmZyJPnWEXEOkA
 r5VKrtqULsDEkv1Qb8u9k3Nk5e5RsorZUcW0dg6WLXXBBOStwbGB4wW2UWdh1zbc4GKd9h
 UJVsaqibFZMMHRDpKZglBwO9oj+Ek9bwc76owZxkLEVez46lJN+vFFiev0Eg+/EW7Bt3P9
 Oz+ez8v5HZtwwQ63J/uhQD61bvWk9tQL93dJKkfqWgaIA0OwUqn0ZlgE3zsm55dgyJGZya
 IsevLdpFMM00sSBXjn1yF4pBvZkrc86NfonPAGm+xwwFhdzgukzJSmGTL1OFSg==
To: "Jinjie Ruan" <ruanjinjie@huawei.com>, 
	"Catalin Marinas" <catalin.marinas@arm.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=UTF-8
User-Agent: Mozilla Thunderbird
Cc: <will@kernel.org>, <mark.rutland@arm.com>, <oleg@redhat.com>, 
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Message-Id: <8028d335-c304-49de-81fa-07fd446cf9d0@bytedance.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
From: "Zhao Gongyi" <zhaogongyi@bytedance.com>
X-Lms-Return-Path: <lba+26ae84dc2+b7588e+vger.kernel.org+zhaogongyi@bytedance.com>
References: <20261023110710.10145-1-zhaogongyi@bytedance.com> <at-czRUYRPRxi9dy@arm.com> <d8aced38-fb7a-4359-b3ab-c625faae5023@huawei.com>
Subject: Re: [PATCH v2] arm64: ptrace: don't warn on missing siginfo in a group-stop
Date: Mon, 2 Nov 2026 16:45:35 +0800
In-Reply-To: <d8aced38-fb7a-4359-b3ab-c625faae5023@huawei.com>
X-Original-From: Zhao Gongyi <zhaogongyi@bytedance.com>

Hi Jinjie,


On 11/2/26 3:54 PM, Jinjie Ruan wrote:
> 
> I think maybe we can refer to ptrace_get_syscall_info_op()?
> 

Thanks for the suggestion.

I checked ptrace_get_syscall_info_op(). It is currently static to
kernel/ptrace.c and identifies a syscall stop only when
last_siginfo->si_code is SIGTRAP | 0x80.

The arm64 path here also needs to handle a syscall-exit-stop when the
tracer has not enabled PTRACE_O_TRACESYSGOOD. In that case, the tested
si_code is plain SIGTRAP. Reusing the current logic from
ptrace_get_syscall_info_op() would therefore fail to recognize that
syscall-exit-stop and could update orig_x0 from x0, which contains the
syscall return value at that point.

We could refactor the generic helper and consider recognizing plain
SIGTRAP there as well, but that would broaden this fix and potentially
change the behavior of PTRACE_GET_SYSCALL_INFO. For this patch, I think
the local check of last_siginfo, with bit 0x80 masked and ptrace_message 
checked for PTRACE_EVENTMSG_SYSCALL_EXIT, is the smaller and safer change.

Thanks,
Gongyi
