Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.146
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792489401;
	b=EzyXl8/tPVbfJ08r0EtqXODNfDUyEBaxmJce1j9BZ36fcW6vA2uRLZIIlAQy33AhGcB9
	 CszmQgAQgzWvqN73lN9klGTrLRsnR8etS0HP8da5fL49lTF+DDnLFINJ75N73GNwdbNim
	 eh/WjO04Af3tgT/YG9aU8WajxY/nD+FXqLePLOAxk6mcdC/lFADAxSSoQBfsvQSsUyMxK
	 todmbYzpOHLANspQi/l9SgFRaSEiXCTwuo2goR9Jrb/AzQ8zxBo+1V5+02eYaFt6xoPZF
	 dI5IdegeK9A80ST76kFP5pT1WixLKTEKy3YaQNLDBnB7URApMaRiYRJlpL6Lm13VtCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792489401;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=HgTVwb3F+rR5TKN+jjxZshU1/6qgx7+oJ4ISamhUpHQ=;
	b=iJNtkgMQF7B3D8d5A6EqChEvBMTTjUdGDiFKKmWsCU/iRIRuHwW+BPrkigEuXO4jFK9B
	 yo9HKK47dxfSOOAsMEKi2zCo0nLEQXxWLLvh7h2txenoSnNmK7clNkrddqsGwCZqnz4BT
	 V5UVpTGDyyvggVKuPBUzX27SzIhh2kmP4iqKo4EJHLzd6cNhM1hrVkG3ZNaFpsDifoQbJ
	 Jyv3iZO4DnGPon+zwAqpVxgaYE2NnkLcj9gl2jUdA46P7Y9k2Vyx/yDZZ+UefPIhtuD6G
	 gEh9zewhsFkUb0/eTzhKlslhJfS8cK7ibfhyF1Lorct2enku0QSEgg7cJD6Q7XYLSDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arndb.de;
	spf=pass smtp.mailfrom=arndb.de;
	dkim=pass header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=ect9xLBN;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=gwCnOt6N;
	arc=none smtp.remote-ip=202.12.124.146
Received: from fout-b3-smtp.messagingengine.com (fout-b3-smtp.messagingengine.com [202.12.124.146])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C79BA606A321
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 09:43:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C79BA606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=ect9xLBN;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=gwCnOt6N
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfout.stl.internal (Postfix) with ESMTP id AE54F1D00105
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 05:43:19 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Tue, 20 Oct 2026 05:43:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1792489396;
	 x=1792575796; bh=HgTVwb3F+rR5TKN+jjxZshU1/6qgx7+oJ4ISamhUpHQ=; b=
	ect9xLBNrA/QQyIvJAHn/kxzKeGquixM4dNHTz+JoSeUghqx72Nq5Gt6d7RXbuTb
	rI+PKJyDp+MGxLItf50Q0E4BlFBKaWKpuJnB8j3ZyaazXGHkfexqcnRB07GJ4DET
	hIUDEo14Iaq4BOJJjiKWOpUYZplkc1aoJ9h2T1kmIVXJa8hhoQH/UAIH5B3LkCds
	JGLRfGx942nctWCRrA8YFz6End79rPGM+M6ntGloJ3lU9DuWPjJq3TMXro10KwbN
	Y5x8w0CmHxBKyXT+MKNtqGA558bZiizok3exQIK5EDhplK183IGz7RwkGG9v2UUL
	H0IIW05loGd5LJp+QCHKFw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1792489396; x=
	1792575796; bh=HgTVwb3F+rR5TKN+jjxZshU1/6qgx7+oJ4ISamhUpHQ=; b=g
	wCnOt6NpxIOUHhp1kqoJZ/VjQfRVLq6+aee6r11Dizc+NHUvmJUWyMxUQzTpSKsp
	bqJ/x0JC4DG3Xv6IewPKpM9q6R6CjfAZ5V50YSdjlOaHK8EKiLcJqQ2+TUcyZp8U
	OLoOsJobkgTFQz6RqPnuM0UlotPpUReJ9NfGM5S5XcwJ7g1wLAfaobyjr1y1SolK
	dpQ1aEe8Uz4hJJ6I1h4LFGnl2YB3pNwN9f2kqizpFJ/nrdZ6mADJbWUyS1PRJ9wE
	3Z1lOSmEKYGvvzr2jGKFZpykIjKahkO4uqPMJgRvL849IofsEV3daExwo4cQFugT
	azA6jiDgQIbd7NZLN8mbw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792489396; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm1:rsa-sha256:c1m8m8O8jaf4XIEqr3wdPUuLE5yTFFobJvHz2mDBUZgQ0Hr
	iu6PRv60Q6qZeNUrBmeTyx/FgphavuEqlTBtyLIMLKntiLeKe294RREWyrZVndb0
	+iB2dPGSPW5nvz8VaMoXaM+YPxNbGiM5Unp8NQ4E800v04nY9mraVn+TMls+qXFb
	g4QB+9n94bZ4/n/beUYQSW0dZRyOkzKNLvvjGcbuU1C37UXiyFrkvZcVmfrAeT8n
	PKKY4SbJiLhpX0JFumHOiG23u0I0dfZaAeAga/ySOlcr5MYn4r0N94xvCadV7Okw
	Pg2J9Gd1CKvD31LQDvzvQBdKDL/K288/hz8mBsA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:L3jx9qnNLdMiOQOQkobEHWl5tzMW4MO3EXtmgGI+EWM=:fq2t1sJR2bCrmZ5YnEFzddjXHTlx0BGA7+KSRjc5ruY=;
X-ME-Sender: <xms:sTfXapr1QkXQSSNLitk3IOG2xGrbZkg4WVGLT7gUZna9z3AJVaN89A>
    <xme:sTfXamfCsXfq2o8SF-mpgjNEmgp38ZCFt_3wi3U2teVvyPi3u3DlviyN-aIA9LhOY
    ybVRcG_UQZhFSHt_DTsGejLPLoVHyJZcEnsnvPFZ08DCFNVuj0bqP8>
X-ME-Proxy-Cause: dmFkZTGEiQL7kIgdq8iuPD8iNY3eXKynF4OU4W4smM/RzfjXkPvORtgagH6BtllNmt05Zn
    3ZifGbXRG4//mIPD8CxwyDTXHXt57cz4PzrkO7NAuAk714hL21i58CHYcH8ZBCVrCcufeZ
    q2pRQDlQrPeVgCy0uX+e92J1mz38mEBvtxQNG84RAm2Ne+IPQIXgDNBc+FNVHfH7OVRIcC
    8vxO++Ezeycvzt3BV2s7KPvd0FnO5N3bS982CmzivF0Qg7Eu7LbjQ7fzxrKAXzGEFQ7eXI
    yGc6eurzfOW7V/Nqi1Ue8J7R8uWJxBLh5BZX31eLDAUijeAZqtyJ4u057/lpwP+W0Yx1da
    AMhI3wDadHi93Bi3Xftk1G9Qru/WRFd539kPyVZKgLY9UvhTZ06rlqDkf5tlpaAaf/Qk7K
    cnBhpHJaegr+dZEYBM2StGf0aCbGU8r2E7kTJrPtEqPEv/rnXBY+nX81w2NXlNMHzyjzlx
    IA8vSZgyrVQgS2hXHxvPDBTB55lS96QrR48pbs7ZqfslvWjzCk4yaM3ZI1oFcV09nCNDrL
    SGIG/0QmUSvqmw6CMMl0yzMgkrKut/0HJpHh6gMaObY16sJ//J2TYnIeRHVMauzjCKC4+2
    t8rdeYAkFqR32TC/t4KctE25MQmHFMMUv9iXPTQlsD3L2oSez97MCmBUJG7Q
X-ME-Proxy: <xmx:sjfXanuZdC-iO0xBPVlMFQgX-KTPlNuF61eL-AxDKz_G4pj2zL8t-Q>
    <xmx:sjfXap8Fj6NHrdMq60JajTK4fYwW-hoSo49PdnQQ_DMUlbRXkG6IaQ>
    <xmx:sjfXaq37m2jjHK3D15WyrN-eKDus5n8821wAU11s5x-MioVDVDmGBA>
    <xmx:sjfXamDw_7uZwktuBI6xkOZ9dh-iX30iWFbHJYfP-AuWFiKKNdjhxA>
    <xmx:tDfXarIcI1-pDh21O5anRLKFVmFAwke9CITZdedS9l7sU1NRaL3jNScu>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id B7D8432A0093; Tue, 20 Oct 2026 05:43:13 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-ThreadId: A0r3NTwFBk5k
Date: Tue, 20 Oct 2026 11:41:59 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "schuster.simon@siemens-energy.com" <schuster.simon@siemens-energy.com>
Cc: "Dinh Nguyen" <dinguyen@kernel.org>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 linux-kernel@vger.kernel.org, "Chung-Lin Tang" <cltang@baylibre.com>
Message-Id: <686f4ca2-0fb6-4a73-9cdb-0edcccafdd62@app.fastmail.com>
In-Reply-To: <20261020085630.w7je2ev3f6ectshy@dev-vm-schuster>
References: <20261019165015.2656521-1-dinguyen@kernel.org>
 <f13fd39f-1ba4-438e-a1f7-fe4184adbc26@app.fastmail.com>
 <20261020085630.w7je2ev3f6ectshy@dev-vm-schuster>
Subject: Re: [PATCH 1/2] nios2: remove libgcc for lshrdi3, ashldi3, ashrdi3, muldi3,
 and ucmpdi2
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, Oct 20, 2026, at 10:56, Simon Schuster wrote:
> On Mon, Oct 19, 2026 at 11:20:56PM +0200, Arnd Bergmann wrote:
>> diff --git a/arch/nios2/Makefile b/arch/nios2/Makefile
>> index f1ff4ce0f1a2..173588c31abf 100644
>> --- a/arch/nios2/Makefile
>> +++ b/arch/nios2/Makefile
>> @@ -19,8 +19,6 @@ UTS_SYSNAME = Linux
>>  
>>  export MMU
>>  
>> -LIBGCC         := $(shell $(CC) $(KBUILD_CFLAGS) $(KCFLAGS) -print-libgcc-file-name)
>> -
>>  KBUILD_AFLAGS += -march=r$(CONFIG_NIOS2_ARCH_REVISION)
>>  
>>  KBUILD_CFLAGS += -pipe -D__linux__ -D__ELF__
>> @@ -37,7 +35,7 @@ KBUILD_CFLAGS += -DUTS_SYSNAME=\"$(UTS_SYSNAME)\"
>>  KBUILD_CFLAGS += -fno-builtin
>>  KBUILD_CFLAGS += -G 0
>>  
>> -libs-y		+= arch/nios2/lib/ $(LIBGCC)
>> +libs-y		+= arch/nios2/lib/
>>  
>>  INSTALL_PATH ?= /tftpboot
>>  nios2-boot := arch/$(ARCH)/boot
>> 
>> 
>> I expect you'll have to copy a few functions from the last gcc release
>> into arch/nios2/lib/ to make this work, at least (a GPLv2 compatible
>> version of) libgcc/config/nios2/lib2-divmod.c but maybe more.
>
> So I did test this with allyesconfig plus minimal hardware support
> configured in nios2:

>  lib-y += memmove.o
>  lib-y += memset.o
> +lib-y += lib2-divmod.o
> +lib-y += lib2-mul.o
> +lib-y += lib2-divtable.o
>
> This seems to be the minimal set of runtime dependencies.

Ok, very good.

> In particular, modpost wants (across various modules):
> - symbol '__divsi3'
> - symbol '__modsi3'
> - symbol '__mulsi3'
> - symbol '__udivsi3'
> - symbol '__umodsi3'
>
> Interesting enough, divtable is not explicitly exported but implicitly
> linked via libgcc all the time. It seems to be required e.g. by lz4_compress:
>
>> lz4_compress.c:(.text+0xaec): undefined reference to `__divsi3_table'

Is it just modules that are not in your normal configuration then?
It seems easy enough to add this one as well.

> This makes me wonder a bit about the how and why of eliminating libgcc:
> I fully understand that we are playing catchup with gcc/libgcc here;
> when gcc decides to emit calls to a new lib, we have to export that as
> modules might use it; but where is the difference between pulling it
> from libgcc or from the kernel runtime? Longterm stability against
> 'disappearing' symbols?

The underlying problem is that the kernel is its own special environment
that is neither a standard C library nor a 'freestanding' implementation
and only vaguely similar to a mix of the two. We need certain parts
of libgcc but for convenience we want to force a link failure if the
compiler ever generates calls into functions we explicitly avoid
in the kernel like 64-bit division and floating point.

> So, for NIOS2, the situation is quite simple, as gcc is not exactly a
> moving target any more, but what is the situation with other
> architectures?

It is very rare that libgcc adds a new requirement and we can usually
deal with it when that happens. Every new compiler version requires
some kernel changes and libgcc is not a big part of that.

> On a more practical note, while technically feasible, I'm not sure
> whether we can actually vendor/copy directly from libgcc; I think all
> code there is GPLv3 with Runtime Exception. (I'm not a lawyer yadayada),
> but I guess direct reuse in that way is problematic, given that the
> kernel is GPLv2 only? So I guess we would need to do a reimplementation?

Right, the easiest way would be if you can locate a downstream gcc
(or clang) fork from Altera or Codesourcery before it was merged,
if that still has GPLv2 or a more liberal license. Reimplementing
the functions otherwise is of course annoying.

Adding Chung-Lin Tang to Cc, they contributed the original files
to gcc back in 2013 and may know a copyright holder that can
provide a GPLv2 compatible copy.

I also found a similar implemention for m32r that was still
GPLv2, maybe that one works, see https://github.com/gcc-mirror/gcc/commit/38b2d07632#diff-4de4f3b573100be00cf40045c85faaca8ded1f13ef80df1822889cbd6ad639a8

      Arnd
