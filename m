Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.137.202.136
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794249192;
	b=FxPkvgf9Kk4Zb2UFJBSO780RJS4+LGU2sPGXneZ7dkHUdpnvy9QtVRxaODI0D9Hw2pII
	 4S6ecOrezRitUrPVgLwyqonthWKgTgRX3I09apXr0bwSUt85GQgJpWwSZoHgy+oZU5B8F
	 FIRCovTiE4hRhN4cXV4/J4xq52gs9gNkJHQqHwaHK5sIAM4NSV73d/BLpKkjIo0gCa+LO
	 nTXQO+rFLR0RgGvq6Xh9EEtznH6/IBij9Na3d6vqW90qCdqJDb7XPa0ShHktia+rmotpl
	 849T1JHtI4cEOuRSdYzVXdmkeviftyK+Hq1nC8Yqo2hrmpa8VRku7Jrv2cAeAEedGGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794249192;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Date:From:To:CC:
	 Subject:User-Agent:In-Reply-To:References:Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=2oUG5RL4oF9Bagom1950zIho2zdDaGXSCPdxbH30cMs=;
	b=YN/TW9fC2xGUZXiZpK3bMmD1Jj/HuGDjiiCEMRN/1UuTCiVTt8vhMJ/MpjkCxzApXrgh
	 RybKKSBKcS5b8HZ/w5ZxP0UCZvTgR5Lp3jy3SPWqwHzTnBbbOFo9YCbKgZ+waY0APX760
	 hh9HERrTjc/TremSULQp/RGITrPu1P6gYQb0lXjq2jCoY8UaImN62ILJewc2XH6sE8M/8
	 tjoH9qY02Ip5gZSsufimPfaUlR0Hg2mL7GpPnkltlIP9CE7XN4jni81T/Ud1ylk/oihJ/
	 Dq8dI96GaJWEO/PCe0A6CesHwlf3W8oP/LHI2taZ+gd71FQD0zvm9B6UMOKEBq1XOOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=zytor.com;
	spf=pass smtp.mailfrom=zytor.com;
	dkim=pass header.d=zytor.com header.i=@zytor.com header.a=rsa-sha256 header.s=2026102901 header.b=Ga4QCJmN;
	arc=none smtp.remote-ip=198.137.202.136
Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A3E8606CC54
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 18:33:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A3E8606CC54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.a=rsa-sha256 header.s=2026102901 header.b=Ga4QCJmN
Received: from ehlo.thunderbird.net (c-76-133-66-138.hsd1.ca.comcast.net [76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 6A9IW9cc1598047
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Mon, 9 Nov 2026 10:32:10 -0800
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 6A9IW9cc1598047
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2026102901; t=1794249132;
	bh=2oUG5RL4oF9Bagom1950zIho2zdDaGXSCPdxbH30cMs=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=Ga4QCJmNe8Bep6WEaJPZUYp85meRO157IBBvHPDLv55L3PLMGiBIyHW4w+pGgFjs1
	 2Gf7H44LmrswwhYxVyMwLgxchbBhQ+UXDPi5Yh4mpiy7NsO62QPWJGIoRac/HfpC+p
	 VE1kqXgsezZlWqho62sLvw9hQ1KZYxw7wQUtIfR1gLGvOLdXEjN3BH+b/N3buqPjck
	 JxyZqRbuAxD4uLzj8kHywBfQolcfYS080GS1ssHhJ00nCQGWI1ruY56DMDITuvFe13
	 HtAklBbXjRpyVliI5ss8a5EYT7XH1QfCMX1loJMEZzUd9sVKQwd4Qsg/XOxHFm3me8
	 TYS4q4In0jscw==
Date: Mon, 09 Nov 2026 10:32:04 -0800
From: "H. Peter Anvin" <hpa@zytor.com>
To: Arnd Bergmann <arnd@arndb.de>, Arnd Bergmann <arnd@kernel.org>,
        Ingo Molnar <mingo@redhat.com>
CC: Richard Weinberger <richard@nod.at>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Thomas Gleixner <tglx@kernel.org>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Peter Zijlstra <peterz@infradead.org>, Will Deacon <will@kernel.org>,
        Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
        Yury Norov <yury.norov@gmail.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Boris Ostrovsky <boris.ostrovsky@oracle.com>,
        Alexander Usyskin <alexander.usyskin@intel.com>,
        Anthony L Nguyen <anthony.l.nguyen@intel.com>,
        Przemek Kitszel <przemyslaw.kitszel@intel.com>, x86@kernel.org,
        linux-kernel@vger.kernel.org, linux-um@lists.infradead.org
Subject: Re: [PATCH 7/7] x86: simplify 32-bit instruction set selection
User-Agent: K-9 Mail for Android
In-Reply-To: <eaeec453-892d-4ddb-9d42-0510db8b9c88@app.fastmail.com>
References: <20261105163440.2381661-1-arnd@kernel.org> <20261105163440.2381661-8-arnd@kernel.org> <4207CA81-6023-4DFC-8FBF-2C5C8C036CCC@zytor.com> <eaeec453-892d-4ddb-9d42-0510db8b9c88@app.fastmail.com>
Message-ID: <D58976E3-E2A3-4577-BC64-5845CF4F82C6@zytor.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On November 5, 2026 2:01:40 PM PST, Arnd Bergmann <arnd@arndb=2Ede> wrote:
>On Thu, Nov 5, 2026, at 21:17, H=2E Peter Anvin wrote:
>> On November 5, 2026 8:34:38 AM PST, Arnd Bergmann <arnd@kernel=2Eorg> w=
rote:
>>>From: Arnd Bergmann <arnd@arndb=2Ede>
>>>
>>>The -march=3D compiler flags select both instruction set and tuning for
>>>a particular CPU, which works well when building a kernel that can only
>>>run on this one type, but has some counterintuitive effects because it
>>>is not always clear which models are compatible=2E
>>>
>>>E=2Eg=2E building for Geode LX results in a kernel that can work on all=
 on
>>>all 686-class CPUs but crashes on CPUs without the CMOV instructions=2E
>>>Building a kernel for 686 could work on Geode LX and Crusoe but fails
>>>because of the CPU generation check that detects these as 585-class=2E
>=2E=2E=2E
>>
>> Crusoe (TM3xxx/TM5xxx) do have a handful of compiler/user space visible=
=20
>> items that are missing from i686, as I recall notably the long nop=20
>> instructions and *possibly* fcomi (I *think* we caught that one, but=20
>> I'm not 100% sure=2E)
>>
>> As a result, it reports correctly as family 5=2E
>
>I don't know about fcomi, but the P6 long NOP hasn't been used
>in 32-bit kernels since your 2008 commit 14469a8dd236 ("x86:
>disable static NOPLs on 32 bits")=2E From that point, I believe
>we effectively treated Geode LX and Crusoe as 686-compatible=2E
>
>binutils apparently uses the same definition and emits long
>nops for -march=3Dpentiumpro but not for -march=3Di686 in modern
>versions=2E
>
>You are of course correct that this remains inconsistent:
>a kernel with CONFIG_MCRUSOE is still built with -march=3Di686
>and CONFIG_X86_MINIMUM_CPU_FAMILY=3D5, so it will fail to run
>on 586-class CPUs without CMOV=2E
>
>I'll fold in this patch to make a MCRUSOE kernel actually compatible
>with all i586-class CPUs, unless you have a better idea:
>
>diff --git a/arch/x86/Makefile_32=2Ecpu b/arch/x86/Makefile_32=2Ecpu
>index 1735a5f95d33=2E=2E9a3a1b1c2452 100644
>--- a/arch/x86/Makefile_32=2Ecpu
>+++ b/arch/x86/Makefile_32=2Ecpu
>@@ -21,7 +21,7 @@ cflags-$(CONFIG_MK6)		+=3D -march=3Di586 $(call tune,k6=
)
> # Please note, that patches that add -march=3Dathlon-xp and friends are =
pointless=2E
> # They make zero difference whatsosever to performance at this time=2E
> cflags-$(CONFIG_MK7)		+=3D -march=3Di686 $(call tune,athlon)
>-cflags-$(CONFIG_MCRUSOE)	+=3D -march=3Di686 $(align)
>+cflags-$(CONFIG_MCRUSOE)	+=3D -march=3Di586 $(call tune,i686) $(align)
> cflags-$(CONFIG_MEFFICEON)	+=3D -march=3Di686 $(call tune,pentium3) $(al=
ign)
> cflags-$(CONFIG_MCYRIXIII)	+=3D -march=3Di586 $(call tune,i486) $(align)
> cflags-$(CONFIG_MVIAC3_2)	+=3D -march=3Di686
>
>     Arnd

Yeah, the problem isn't the kernel, but user space=2E
