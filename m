Received: from mta1.migadu.com (out-62.mta1.migadu.com [95.215.58.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D636F371868
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 15:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.62
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790349758; cv=none; b=Fdz5i/ihS1Zv2Qk1xTgO+2sKpBwd1Qos4rslNzfI7YdC4ihKMj9u68sP1D8J5Q7wdGXSn6VtJXbhAxtf+kIhM/OmuWdwtg3+7Jm49zEyWIdMgZ1tVNgqvfrhaGvfrgH8Os7NwtMRo4YHEQKzgOw7oxTh9ghQAjz/5HWVViTzyfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790349758; c=relaxed/simple;
	bh=z060NorVjkdchyRWUzkmKu19VquiP8XV8AyIxkINsfE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mTW+McH6QkoAUqWociSgOTXv7SPCB+xfNbi9Ngqz+RIQM2DnaKC2BCMuI5W4T6UAjTeoBfIP+JNvTpJYWj5d2yBotpMIMA4Jqd/hE6YLfnVIZnzavRNEpt1KxG3iPDuyOm5DWp90GYoNrLbb+QeREzm66N0RSMKrw8ej2WMDeo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=YKwr0zlf; arc=none smtp.client-ip=95.215.58.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="YKwr0zlf"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=z060NorVjkdchyRWUzkmKu19VquiP8XV8AyIxkINsfE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790349754; v=1; x=1790954554;
 b=YKwr0zlfW/JHsocYquG4Dq6Do2Vffw/g7EvImboh/FRaqcbp72oAlJykQeq4RScWz3ALwkGo
 DilQc0173VU7xtNeBaeo2Nt3NXcxqeGjcvSEp58Nysu2zkX8MFlYEXpgAnh//MX3VxFx/aWADeR
 07H+7gwU6jAcQRUlW2T72dc8=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id c7d2686a1e72047c;
	Fri, 25 Sep 2026 15:22:34 +0000
X-Mizu-Trace-ID: c7d2686a1e72047c
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5b8e81e2a0bso5634e87.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 08:22:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxjackP1hGIYSpZ6PHsHui2o/dCCyX00Ra9RhlEve2IEQdZmr7vZfbRSbxJ2kejsSOeJmtvRgi7IOt9Tm0=@vger.kernel.org
X-Gm-Message-State: AFuF++kpRyyc63ULsriQnm2ZI7f00f0hWQcpSg9KhkBClseamnIfCXCM
	0jMdXZB/vzUamZOkWqTzHfIIh6WfTGTfI4kNtW/+eRvG5E9NbpE9WUMijohoAOM+qrLXeEfK0ba
	Rn+gLbJLhn9XgEparnwd+RT+7r+X8mq0ibrX4SHg0
X-Received: by 2002:a05:6512:ba4:b0:5b8:eb6b:2a52 with SMTP id
 2adb3069b0e04-5b8ed09a59amr43196e87.2.1790349749415; Fri, 25 Sep 2026
 08:22:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260925090619.852995-1-fuad.tabba@linux.dev> <20260925090619.852995-3-fuad.tabba@linux.dev>
 <8733ux4bow.wl-maz@kernel.org>
In-Reply-To: <8733ux4bow.wl-maz@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Fri, 25 Sep 2026 16:21:53 +0100
X-Gmail-Original-Message-ID: <CA+EHjTy2hfn0qighn2kZ-Gyy_3nKtwiRCGMrox6K-Yn22ZkP6Q@mail.gmail.com>
X-Gm-Features: AclHuK_gTf2iqS9h2Xa5Ix6rBbxV4n0KGAvJD4FiA9vRXr5yyjusiCbOGjiate0
Message-ID: <CA+EHjTy2hfn0qighn2kZ-Gyy_3nKtwiRCGMrox6K-Yn22ZkP6Q@mail.gmail.com>
Subject: Re: [PATCH v1 2/4] KVM: arm64: Clear HCR_EL2.RW for 32-bit
 non-protected vCPUs
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Quentin Perret <qperret@google.com>, Vincent Donnefort <vdonnefort@google.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marc,

On Fri, 25 Sep 2026 16:01:35 +0100, Marc Zyngier <maz@kernel.org> wrote:
[...]
> Apologies from repainting the proverbial bike shed, but I find the way
> the above is written very hard to understand, because you are
> describing minute aspects of the code without giving the big picture
> upfront.

Writing commit messages and comments is hard! :) I'm working on it...

>
> I'd rather see something like:
>
> "pKVM maintains its own copy of a per-vcpu HCR_EL2. On initialisation
> of the hypervisor's private vcpu structure, HCR_EL2.RW is set to 1
> unconditionally.  However, nothing forbids userspace to create a
> non-protected, AArch32 guest. Since HCR_EL2.RW==1, entering the guest
> fails with an IL exception.
>
> Make sure HCR_EL2.RW is cleared when the vcpu is AArch32 at EL1, and
> that the HW actually supports this."
>
> which describes the problem without the reader having to dig into
> code. It makes matching the description and the code very easy. At
> least for me, YMMV...

Much clearer, I'll use that for v2, and give the other messages in the
series the same treatment.

[...]
> That's another example: yes, this is all true. But how relevant is it?
> Are you clearing RW just for the sake of vcpu_el1_is_32bit() to work
> and prevent an UNDEF? No. It is so that 32bit guests do work. The
> above really is only paraphrasing the ARM ARM.
>
> What you don't describe is that if ARM64_HAS_32BIT_EL1 is not
> implemented, you let the vcpu walk to the cliff with RW==1, and rely
> on the CPU generating an IL exception. For me, this is the important
> piece of information that needs to be captured.

The comment should say what happens without AArch32 EL1: RW stays set
and the entry fails with the IL exception, rather than EL2 switching
registers that are UNDEFINED there. I'll rewrite it for v2.

[...]

> Other than that, the patch looks great! :)

Sashiko didn't complain... :D

Cheers,
/fuad
