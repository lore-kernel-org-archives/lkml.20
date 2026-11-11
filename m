Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794369910;
	b=CbuhWwa/0ZcZcQFjJZ8oVSOXIk0IpDPCL4FS5ykq1QU2tDFtRVAVHwDMAlntDfbPGagL
	 rfTOZVNm3CxeJ2rtZJ4XWxEHi0I4bqsp1x3Rsfr28w1EyUWcKr2ElKLsBQv7Ca6TVhh7d
	 e9gLnbeMzIsuXqxcS7jE8dAGgiZqX7GoGMOT+gXoWKfbtsIyVcYdll8PTpGPL3peVXHjq
	 qETd2geaJdIxDUUd0+90Y5FfWtp4fOnHbUeoefZVSJXUKyipbZs/6OWxGpoLaSsN1yWV/
	 lmi2thb/oPcx37Wd5Troyxpd/S61CTk5WZFHPRp83ZdEpUqAN9A+/p+As4xc0QEgHFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794369910;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References;
	bh=pqYnnRFRLqeNXaNeclAUIXtFB5ln4VyCuNDPTaVNNkw=;
	b=XvCQNTH2RMKi4PQXNQp+PQ49Jo8MfAxQpX+EtnH6PCer2fbXX15RRK+nbtSvKA0bTz8a
	 zqVpH2Cfaa1VuP3uLKjzehugghHXNhnbR8qYHGPR5NjgV6ls07t2kWlQiK+0CiYWAcfAA
	 6xVq0ux10gHv38/hZ8rsTXoTd/BvEZbCFeymOq9CkBrhV9Ci7zb/q1DHWGP7nPV22xLhD
	 61bj6R6dxC/k8iFyKvGmU4IlMSllON0cbhrddSyk1gkk+l9RJxIj7xK6DHO3kO+7tJ+au
	 jJKvle/Kbqv3O0qTe0eujkifTG74EIR3AXYu8DmzibnBaKZ0rwO9LouBLzSiRLJe/Mg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oDfDvh7w;
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55D12606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 04:05:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55D12606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oDfDvh7w
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1b3ada81853so2463233c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 20:05:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794369909; x=1794974709; darn=vger.kernel.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=pqYnnRFRLqeNXaNeclAUIXtFB5ln4VyCuNDPTaVNNkw=;
        b=oDfDvh7wZ3eq/CLXuZgNPFMIRIUVrP+RY7Dc6E72JO4v7+mrbfqqVq4ax+bgb9eAQW
         xRZwDfg2piTlJyujpAhSusVQA2DA/Mr7lMojcgQf+svhG1eaEOCoEzLBUL2jhTnaRHRo
         E6W+deIyACCWMPEzMjBJOxIARrnlq0XM92qGlKtGNt/KFxnLqFKTj+0uaIuO5bYVgEfJ
         oTZFAqbGUwmWds9fu6Lx5X5vrZm+YdmHdygpkPo8cf8gSc6Y3kKe9BxBmmlMGuJqxdcU
         gdwkLV0z9RQsCSrftrpHVl1TXnrxGEbNjvvj3YqUaVNyBJBIFBIq7LgBaG/eaH+mkyUm
         amXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794369909; x=1794974709;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pqYnnRFRLqeNXaNeclAUIXtFB5ln4VyCuNDPTaVNNkw=;
        b=dnJw8LFfrrnYQT2X1Km1KTQEskLaF/5KG4w1dkekndrejtc6OnT5NXnRxJbrbe5Ecf
         hH8hS0CLNMAy0SZvpOPDLDuhD6cWaRmMdXsEVg6uOtGIRJmKYt2EtDok2TdQHtkxcKaf
         0nly+ib9g2bY3ZUI7NAHOtMT4jNhNY2sIZqlilnyXfsDxaXsbEiJuM+14BLrafNN0EI1
         TUkUS0Heo8nJqHVyHP/2oi1GouWw4X8KlKGDhgGWQ+5tv4ALsFrPj3nUDWX4XPYv6L1l
         64owd9Ut1P/ORoIzVK54OfTFvFaEFH/r71CkC1MQQ4aeVH5aiAa76PmTgIJJyMabHl84
         Y3Tg==
X-Forwarded-Encrypted: i=1; AL+hErEVXBdX7AF3uNArqW/+iDSH7xHIZ6aWPCgWvMA5fTAYBl2jlshHLRsGHPjji2peebPayRP06aPQsw7GfBU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9dq6LrZpfbDASfxtaKjqX/hHew+VpQFabpQZ61nKg3SdI4wNYb
	4pJAXxZUkG9X5gR39KrASyhayXxGfr5GpSX799+XpYvRlr1ZlqIsaUCC08mFwq1S
X-Gm-Gg: AYBFou2Daph8zCnI3KYpzHy/UPTgXmm52iGQJ+RkdHlHy5xKWm5QxpI31Ib62WMeeo8
	auCcpTDgA1TIdxiOrtmdpVQN+xbHTJ0TdWXt1AM2UOuXxT+lKPbOZEh4x01H/eWGcrAuPK4OZ8i
	HXozKI5UgIeCOKMs90707qHYV7mLRu+1c5qYdgXU+fgzrLcycYY9VPUv+uQTCuTO3MpBwQp2YEE
	fz9w7L46vVbHHAO4+i1rWY0pxExpAXj1rTNd8nPTbkkudNb+0xnpjDJDB6H3cK8vQjg7llhI432
	UgNTsipjtsh9gx/yv2N3TU5aKi0E3XyAyU1SAhAl2MkeoJPxNH1ujrAJb7VeFhWvxv8sxIIEDZv
	EQiznI3cr2Ps5bMDD5NgZ7LoB+hfsDtH2Al4/VHzABqha/SvMNzt9QBXSC5HsfKEobfuYJK8SZ7
	z9Znvg7WcCft+CLxYbhhiduLStzM+R04XWdMFgLdIgkAYU93rSO3zkkJc5kdIrjLNwca2ysa2v+
	r1tBAIv1eZFSPCnkLjImcI/38d26vZPu7093AxrxLKZf3bxZY1K5Xv6mdUMHqs30Do3AOHJonXv
	Ebpjpx14i/sAT1TrjbD9enSjc/s=
X-Received: by 2002:a05:701b:4558:10b0:1b3:9b4d:85f3 with SMTP id a92af1059eb24-1b3c030a90dmr1350639c88.19.1794369909127;
        Tue, 10 Nov 2026 20:05:09 -0800 (PST)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b20c55sm10475642c88.8.2026.11.10.20.05.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 20:05:08 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Shrikanth Hegde <sshegde@linux.ibm.com>, maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, chzigotzky@xenosoft.de
Cc: sshegde@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu, linux-kernel@vger.kernel.org, msuchanek@suse.de, harshpb@linux.ibm.com, gautam@linux.ibm.com, amachhiw@linux.ibm.com, venkat88@linux.ibm.com, nnmlinux@linux.ibm.com, mkchauras@gmail.com
Subject: Re: [PATCH v2 0/3] KVM: PPC: BookE: Fix boot hang on preemptible kernels
In-Reply-To: <20261110053238.3794500-1-sshegde@linux.ibm.com>
Date: Wed, 11 Nov 2026 09:21:32 +0530
Message-ID: <ik2481q3.ritesh.list@gmail.com>
References: <20261110053238.3794500-1-sshegde@linux.ibm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

Shrikanth Hegde <sshegde@linux.ibm.com> writes:

> Christian Zigotzky had reported that preemptible kernels don't boot on
> his FSL Cyrus+ board. The board freezes on running either full/lazy
> preemption and has been an issue for a while now (years!).
>
> https://lore.kernel.org/all/b897b0fd-90f2-4215-bcd4-3714e497d773@xenosoft.de/#t
>
> After 7.0, there is only preempt=full/lazy which removed the
> preempt=none/voluntary workaround used to mask the issue. There was
> challenge is getting the console logs which made the fixes difficult since
> one couldn't know where the issue is.
>
> Thanks to Michal for helping in getting the logs. That pointed at few
> places where the issue could be. This series is an attempt at fixing
> those.
>
> Christian, I haven't taken the tested-by tag since patches have
> changed quite a bit.
> Please help in *testing* the patches again.
>
> v1->v2:
> - Re-order to avoid preempt count dance (Narayana Murty N)
> - Do only hard_irq_disable on PPC64 to avoid second warning. On PPC32
>   use local_irq_disable to acheive the same. (Ritesh Harjani)
>
> v1: https://lore.kernel.org/all/20260928110411.844582-1-sshegde@linux.ibm.com/
>
> New API ppc_hard_irq_disable could potentially be used in other places.
> There is similar pattern of doing both local and hard irq disable and
> likely not all callsites need both. But it is a larger effort and due to
> my time limit, it will be taken up subsequently.
>
> Shrikanth Hegde (3):

Thanks Shrikanth for posting v2 based on the discussions. This is
definitely in my list of todo things - to go over the historical
reasoning behind the divergence of hard_irq_disable() and
local_irq_disable() between 32-bit and 64-bit powerpc code.

I am also interested in knowing, where else we were previously using this
pattern, like in these patches, and were they only to stop lockdep from
crying or was there more to that.

I will get back on these patches before end of this week - and hopefully
we still will have time to queue this up before -rc4. 


>   powerpc/irq: Add ppc_hard_irq_disable()
>   KVM: PPC: BookE: Load FP and Altivec before enabling the interrupts

btw, small nit - ^^^ this patch missed to add Suggested-by from
Narayana. 

>   KVM: PPC: Use ppc_hard_irq_disable before guest entry
>
>  arch/powerpc/include/asm/hw_irq.h | 17 +++++++++++++++++
>  arch/powerpc/kvm/booke.c          |  7 +++++--
>  arch/powerpc/kvm/powerpc.c        | 14 +++-----------
>  3 files changed, 25 insertions(+), 13 deletions(-)
>

-ritesh

