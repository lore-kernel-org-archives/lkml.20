Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [81.169.146.164])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 991053E4117
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 15:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=81.169.146.164
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790697118; cv=pass; b=Bww7vNW6TQ4vvOTjDOEWrlktoZZlshvStOdCSV0EHOQG3vKzcnZ7oYhxSHlrA091+TGohfnAZifnkHa2RkxKf4G3X09dxriBcR+PY1lBv6QPYll6xCjMRUJOv29wiBPiNG4tPsK768APPHWE3IXloFuNLIkIELgoMROth7O6v64=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790697118; c=relaxed/simple;
	bh=oE340zc4oBZyy7x9fRcISgyIozkhFs8LH39VrOoQshI=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=OQz4uRnKZcCEubFFFWefBKXRGqVk+A3W9L66nwREmHAyzvz5Kz/attyMQ4F4ux0xaZ1TgnEWTcWS+JF4CPoqpKkiNFIQVTtazJhh7rG6U8KKXaO/mu+JuQeASrFIpcuERY8hJSypc42lKiNvnEe10/9eg0QGvjXcFapRz1amYmg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de; spf=none smtp.mailfrom=xenosoft.de; dkim=pass (2048-bit key) header.d=xenosoft.de header.i=@xenosoft.de header.b=Qk3vrtfs; dkim=permerror (0-bit key) header.d=xenosoft.de header.i=@xenosoft.de header.b=w22YaIeD; arc=pass smtp.client-ip=81.169.146.164
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=xenosoft.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xenosoft.de header.i=@xenosoft.de header.b="Qk3vrtfs";
	dkim=permerror (0-bit key) header.d=xenosoft.de header.i=@xenosoft.de header.b="w22YaIeD"
ARC-Seal: i=1; a=rsa-sha256; t=1790697085; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=BfBw1Kox7QYgb+0KVqCyhFFXfyq8Db1+0jQVdVG4idNZO02VRtQSJMV0ZU9WZSuEyn
    Ln6vst6Onw34SYteilna/hnNm97EYzQRuivw0pnP2j/1hRW6/JegbJU1KegyYqPpWr5i
    1vorPk+swH+64y20U4vt/VFnCBSXO6+GM0dZUpWAyouzxi5ACDrHDfvp75GMcqyvaT+z
    mIYF0pnNeuunTxiS0yMNGR1UF2/184HMDi3Gbbpw3nx/MDpom6KRyofSD7Pc4PbyYS7w
    lhGEbAx/Y3sIsVea9i5e51I1RR9MFpeHQ0yo4ldf7Sr9Nhq2J3V94s/fnO0KlnYkjhvc
    vEsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1790697085;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:Cc:Date:
    From:Subject:Sender;
    bh=AMFhK9C963GdR47YZmuko0LM73Hc481Vl5AjQq5eme8=;
    b=UsJjCkolkzPpbcbDJ9svSoiVaQfqPBABkjsj1i2lN5zwhHT2orckOdVxqbKlxEmNFT
    BInocFQcfz8/EWzCR8WR3XdH+tB/j6seRgWCoxeuwxghXEP55+tWdm+vvNnPzpdyA4an
    jD4XDhrk8/d+6kpkkyB7EpbOakdr1RN4PGMJexebRiPP3XTtIcPbyRwYaMm9x/vJgRat
    PxYJQVwGq6ze4UuX2TrEnHgEIWX1+gICEIgM56jGZaebiUCesnZJwQGfiywXOCpmrQLW
    XTCPboLyBProzUgOn4I/8igniXQImBeKvculkyr7ap102YoAtcQiuFGDl9aQ5iuoVpdM
    T4DQ==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1790697085;
    s=strato-dkim-0002; d=xenosoft.de;
    h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:Cc:Date:
    From:Subject:Sender;
    bh=AMFhK9C963GdR47YZmuko0LM73Hc481Vl5AjQq5eme8=;
    b=Qk3vrtfs/0sysRkxStCaLN4M2rP7mxrBxq30Q0FV82zGTkVLbZk+ndTHRG4KlzEaBL
    I7sJejk9S/Ljp41OxIrQDsGR5qWLh4Fx5gt8sGyAKNqyPYOKcgMxv7BOrt1az7aLMu9T
    E1laK2gUeFYWUDXQps9/A0gGSlFD0TZ1NHg4uEEKhrJLh6hoRJdf4e3h1nqMi2FFT5XC
    T4tAVFKP6H9dH6HkfBJA+lv3ZSLYgQWt2MhNUspQBcEyvKD8orbfJz57WL22zZSNIQd7
    iDXdrOSSZlbhzm4434bFhdcx4JSuz+SWCdSfgqWLyvxB/UEi7w2RINsFkGtvec3msw5J
    5GFg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1790697085;
    s=strato-dkim-0003; d=xenosoft.de;
    h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:Cc:Date:
    From:Subject:Sender;
    bh=AMFhK9C963GdR47YZmuko0LM73Hc481Vl5AjQq5eme8=;
    b=w22YaIeDYiMfwNQWidISGMiPfu/azzcbcM0Z8YojukOiwcu8TzBaV/7hps428h0WhR
    lq6h+LnKNN+da/p/kzAQ==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr4thIFiqT9BURIi+igQ=="
Received: from void-ppc.a-eon.tld
    by smtp.strato.de (RZmta 55.6.2 DYNA|AUTH)
    with ESMTPSA id e0463b28TFpN54M
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Tue, 29 Sep 2026 17:51:23 +0200 (CEST)
Subject: Re: [PATCH 0/2] KVM: PPC: BookE: Fix boot hang on preemptible kernels
To: Shrikanth Hegde <sshegde@linux.ibm.com>, maddy@linux.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Cc: mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
 linux-kernel@vger.kernel.org, msuchanek@suse.de, ritesh.list@gmail.com,
 harshpb@linux.ibm.com, gautam@linux.ibm.com, amachhiw@linux.ibm.com,
 venkat88@linux.ibm.com, nnmlinux@linux.ibm.com,
 "R.T.Dickinson" <rtd2@xtra.co.nz>, mad skateman <madskateman@gmail.com>,
 Damien Stewart <hypexed@yahoo.com.au>
References: <20260928110411.844582-1-sshegde@linux.ibm.com>
From: Christian Zigotzky <chzigotzky@xenosoft.de>
Organization: A-EON Open Source
Message-ID: <754bfea0-5f8f-ba20-cf48-9c6131f98b49@xenosoft.de>
Date: Tue, 29 Sep 2026 17:51:23 +0200
X-Mailer: BrassMonkey/34.3.2.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260928110411.844582-1-sshegde@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28/09/26 13:04, Shrikanth Hegde wrote:
> Christian Zigotzky had reported that preemptible kernels don't boot on
> his FSL Cyrus+ board. The board freezes on running either full/lazy
> preemption and has been an issue for a while now.
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
> Christian, KVM team,
> Please *test* the patches.
>
> Shrikanth Hegde (2):
>    KVM: PPC: BookE: Disable preemption before loading guest FP and
>      Altivec
>    KVM: PPC: Replay pending interrupts before entering the guest
>
>   arch/powerpc/kvm/booke.c   |  9 ++++++++-
>   arch/powerpc/kvm/powerpc.c | 13 +++++++++++++
>   2 files changed, 21 insertions(+), 1 deletion(-)
>
Hi,

I was able to compile the RC5 of kernel 7.3 with your patches today. :-) [1]

After that I successfully tested it with KVM PR and KVM HV on my PowerPC 
machines.

Tested-by: Christian Zigotzky <chzigotzky@xenosoft.de>

Many thanks for your help,

Christian


[1] https://github.com/chzigotzky/kernels/releases/tag/v7.3.0-rc5-2


-- 
Sent with BrassMonkey 34.3.2.1 (https://github.com/chzigotzky/Web-Browsers-and-Suites-for-Linux-PPC/releases/tag/BrassMonkey_34.3.2.1)

