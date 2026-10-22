Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=81.169.146.168
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792687421;
	b=BpDsqETSmtr90pWiPeYbetYYn9SRZTuLV7qfXvhtB4aFTOLq5lm6dqp1kWZYDfMXmWfJ
	 OD2RNobAMqo+e6jeLB3B9IrTqzmWXzbwW+AhRW54isx9J7DkhigfV7/Pw8vbau8yygOVq
	 Kr5GcgfMgsiZ+pqdYXco8NdDJMynNT2erTYmgyXF5klZ9Ra8YyAEof6T8AxvPq8FeoS2E
	 2J42LcbZpIz0I1U7e04wmVI0QKoFuTSy9aTwc0ToMoqkB/TI/LurXJUwLr28zxhBM5ZXN
	 kfZI/DXhPRUBQtkDRh/QUubWci43xT4xOMHmkAXiVUS/q5lNbFpkaasblXYFVRq/68Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792687421;
	h=DMARC-Filter:X-RZG-CLASS-ID:DKIM-Signature:DKIM-Signature:X-RZG-AUTH:
	 Received:Subject:From:To:Cc:References:Organization:Message-ID:Date:
	 X-Mailer:MIME-Version:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=0YdO2+DcsvlJkeDUFu6+x7RRjGowhqUMvLmexnjMxzY=;
	b=IKBQp9WCQvWoWS9ydhRs4hBxdD52rKRItO2I7ZsgApRWe1Mt81OXV1V9E+dTCACF53mN
	 e4qIW3452ILur+B+8ED3AhTCFy8E8VLV7YRd0RO+SvA70useRJkkEfUI+0OHpQlYeBn4p
	 w3htZdnYm0+HCWQAbFMdf7axrJNY1Yx5IPcLwzvpj/JzQd0qO3p5M8qwNMuZBHvaXFyuW
	 PZlmnwSugmZJ2qJHukDqnjKxrSQ/v1OFm7kgp16SIyMjg8Q3EtRVIVe8242txDx/le97O
	 o2YgdhOzchQ4pOgyXfFgZe2CKxAcH5alDXqJV4vBaMIZE7mD9ONFPLZE6u0bCvf3PPw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=xenosoft.de;
	spf=none smtp.mailfrom=xenosoft.de;
	dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=thgJdA7P;
	dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=HsyNE2Bh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=81.169.146.168
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de [81.169.146.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6476606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 16:43:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6476606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=xenosoft.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=thgJdA7P;
	dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=HsyNE2Bh
ARC-Seal: i=1; a=rsa-sha256; t=1792687381; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=rNn9W+t4pF0fXUdQfinXmwB+CtvRbe66suql2cqsBEo7QyNQb0U3CFyoW1RgnKN4/f
    dqYy2Sy1BwniHI91xfvtLzGcFZ9KmtX3V9GQruTCxZpWeYkhwEzeduqnuy5YXciSIHTt
    HxD2osYOIPM6FZCh8YQc4PxyRKsIhLC9isL8OMX6wQV6Xyl4rABzzNQuXtFCtMh4PcmW
    /R2usl5CRWC9eNDAaPHZ7som6rDXvYP2x61J7TjlOAZPmRXqjZZ1v2zQHFv4iqR7GjqQ
    DJdydOIZoBKG0kDJ3/8hFoRHYY4YdS9B0BGjJPCCaQ/Q8IwLJ+0y5pDN2FSVsAV+5sHR
    sNNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1792687381;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:Date:Message-ID:References:Cc:To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=0YdO2+DcsvlJkeDUFu6+x7RRjGowhqUMvLmexnjMxzY=;
    b=lF5rJGRe1eH2aQTDWib4it0jbI64QymZdlseo7Fh2yLxuCqp2ZgmQ4QSqbrMbRVEsw
    CeGl8aXtiyjYrzycC+WbXYjm/8XvCBtEoDTHDWj8Y2sg3mjgODDq7c3dX1JH/cNaThBR
    3NBlegzAVWUGSQ/g/Nfvv1xOGDW9OHIIn0S5iOJXVBc4au4yXH3/86TiHr42KZeFNuQm
    PT8RI5QsQN5ez0o4r567rb5hdKl8+cT+nAqbvAPlopmgShdqkT2qvns+CTUi6bBlE8pB
    STUNWX/BzMyog8bA1rLiZ4f8jMRfWWQeq+ENIBF5AJr9cX/8pvOFwC0SYQwJlEf3M/hA
    y9+w==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1792687381;
    s=strato-dkim-0002; d=xenosoft.de;
    h=In-Reply-To:Date:Message-ID:References:Cc:To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=0YdO2+DcsvlJkeDUFu6+x7RRjGowhqUMvLmexnjMxzY=;
    b=thgJdA7PZwvC9o6BMP6beSfNyYlHTdv98PyipcSb4/VZQTDaxon+7b5g2ZdVFYP2FM
    MGbIXhQ8LUtVc4CLo6tLDqqei/tUZ5GcGlW45VP1IBwu3FPj4Y5g5MtaHnbXMEyVRRwu
    bKiwVVlVEuYKwL2TJS9UKGuKAQKVPl2c/b0vH1vQX6AKZ6jt9Q7x/ht+CcK3GjRxcwvg
    5kP+sjrwHCodfgjH+djRllSNviYPHunSBbydz/oU1Rb4l5A3Iue+l1t8KE3NUBiw36Ha
    LLyf02+4GJsSWCLNm85TkGbTfW5frjVGGwsDghfDA/CvDG/tcTKwZvaELKhUYXagDjxI
    HAUw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1792687381;
    s=strato-dkim-0003; d=xenosoft.de;
    h=In-Reply-To:Date:Message-ID:References:Cc:To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=0YdO2+DcsvlJkeDUFu6+x7RRjGowhqUMvLmexnjMxzY=;
    b=HsyNE2BhoLKPDlVKI29Zv+Sm/0U80JF7QIu6g80w8cy0/maGXC+TkGtllNonZwHJrx
    /KnZTC7UhRDjK6iKQ0Dw==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr4thIFiqT9BURIS+l7Bng"
Received: from void-ppc.a-eon.tld
    by smtp.strato.de (RZmta 55.6.3 DYNA|AUTH)
    with ESMTPSA id e825d929MGh0XeP
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Thu, 22 Oct 2026 18:43:00 +0200 (CEST)
Subject: Re: [PATCH 0/2] KVM: PPC: BookE: Fix boot hang on preemptible kernels
From: Christian Zigotzky <chzigotzky@xenosoft.de>
To: Shrikanth Hegde <sshegde@linux.ibm.com>, maddy@linux.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Cc: mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
 linux-kernel@vger.kernel.org, msuchanek@suse.de, ritesh.list@gmail.com,
 harshpb@linux.ibm.com, gautam@linux.ibm.com, amachhiw@linux.ibm.com,
 venkat88@linux.ibm.com, nnmlinux@linux.ibm.com,
 "R.T.Dickinson" <rtd2@xtra.co.nz>, mad skateman <madskateman@gmail.com>,
 Damien Stewart <hypexed@yahoo.com.au>, Christian Zigotzky <info@xenosoft.de>
References: <20260928110411.844582-1-sshegde@linux.ibm.com>
 <754bfea0-5f8f-ba20-cf48-9c6131f98b49@xenosoft.de>
Organization: A-EON Open Source
Message-ID: <9a77eaff-4c60-52a8-7e87-0d2f34099b92@xenosoft.de>
Date: Thu, 22 Oct 2026 18:42:59 +0200
X-Mailer: BrassMonkey/35.0.2
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <754bfea0-5f8f-ba20-cf48-9c6131f98b49@xenosoft.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 29/09/26 17:51, Christian Zigotzky wrote:
> On 28/09/26 13:04, Shrikanth Hegde wrote:
>> Christian Zigotzky had reported that preemptible kernels don't boot on
>> his FSL Cyrus+ board. The board freezes on running either full/lazy
>> preemption and has been an issue for a while now.
>>
>> https://lore.kernel.org/all/b897b0fd-90f2-4215-bcd4-3714e497d773@xenosoft.de/#t 
>>
>>
>> After 7.0, there is only preempt=full/lazy which removed the
>> preempt=none/voluntary workaround used to mask the issue. There was
>> challenge is getting the console logs which made the fixes difficult 
>> since
>> one couldn't know where the issue is.
>>
>> Thanks to Michal for helping in getting the logs. That pointed at few
>> places where the issue could be. This series is an attempt at fixing
>> those.
>>
>> Christian, KVM team,
>> Please *test* the patches.
>>
>> Shrikanth Hegde (2):
>>    KVM: PPC: BookE: Disable preemption before loading guest FP and
>>      Altivec
>>    KVM: PPC: Replay pending interrupts before entering the guest
>>
>>   arch/powerpc/kvm/booke.c   |  9 ++++++++-
>>   arch/powerpc/kvm/powerpc.c | 13 +++++++++++++
>>   2 files changed, 21 insertions(+), 1 deletion(-)
>>
> Hi,
>
> I was able to compile the RC5 of kernel 7.3 with your patches today. 
> :-) [1]
>
> After that I successfully tested it with KVM PR and KVM HV on my 
> PowerPC machines.
>
> Tested-by: Christian Zigotzky <chzigotzky@xenosoft.de>
>
> Many thanks for your help,
>
> Christian
>
>
> [1] https://github.com/chzigotzky/kernels/releases/tag/v7.3.0-rc5-2
>
>
Hi,

is it possible to add these patches to the kernel 7.4?

Thanks,
Christian

-- 
Sent with BrassMonkey 35.0.2 (https://github.com/chzigotzky/Web-Browsers-and-Suites-for-Linux-PPC/releases/tag/BrassMonkey_35.0.2)

