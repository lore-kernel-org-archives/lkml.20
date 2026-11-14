Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.137.202.136
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794622934;
	b=NeY62Wdvz/Y9VKOepLuNNgxee6XxmdItJk+aLSEj99gxHbbMHWc073FsWlFNV7YIjpRv
	 3erxq+HK3lf5+yJNYefy2POtIGyh3vBB0cPrQYbdzjLCoa02UGlHSm5N4sfSrajRSExyc
	 vuHHuxWO9BAqHbKayNOn6MVO74PL4gCxTrOz8xL2W0zI1U27irB4ie8AdwQeCr52SX4oa
	 aTl9r3U4DSMuhQCE9Y+CvqnQBUTgfb7Qp3F401SWBwlm6l43Gz3dJ+oIyQx0AbawsKGpH
	 RnITPYyHscHSjUOF/q35AFsseQnBQt7VhT1Wbfpjn4q0fEiHv+FVLDwOXBxiLJ3uxyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794622934;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Date:From:To:CC:
	 Subject:User-Agent:In-Reply-To:References:Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=AIQbKLU43LccGRdCT2aBSjvUNYwADfWwVpipaPEX5yE=;
	b=LTIVFBOzvRxfKUlC+NhQRTSF7t0xbwV69D0fZ27/vfJHg/jt/u46XO2FnU51y3Ekvo0p
	 6pKE07XakhFhVT7XyjB9btd3m7OPnrfV1VVjVZoZzTixop/BCokODrPLgV5z73rwH3BQc
	 ilSDjf40QyuFkRBKdVBfwNqj5QRcAPYIWoqMd41Evd1XrwfubHABkuiIuvOKIdFY5SCZ2
	 Y9FNTrEN20aaeQglsT5auFp8W4BIkHRMlwoOzF/NHQ0EqfNB70vLT7wJLN5JYFQQcBY/j
	 Zd2eJqWHUkOJInpSGPaIg8VkoTeuwb/99m56pbn9cACqzuCFQ+pHfnTJbVILsgEnksw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=zytor.com;
	spf=pass smtp.mailfrom=zytor.com;
	dkim=pass header.d=zytor.com header.i=@zytor.com header.a=rsa-sha256 header.s=2026102901 header.b=oipzlGEN;
	arc=none smtp.remote-ip=198.137.202.136
Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A0D8606A323
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 02:22:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A0D8606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=zytor.com header.i=@zytor.com header.a=rsa-sha256 header.s=2026102901 header.b=oipzlGEN
Received: from ehlo.thunderbird.net (c-76-133-66-138.hsd1.ca.comcast.net [76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 6AE2LSUm3991062
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Fri, 13 Nov 2026 18:21:29 -0800
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 6AE2LSUm3991062
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2026102901; t=1794622890;
	bh=AIQbKLU43LccGRdCT2aBSjvUNYwADfWwVpipaPEX5yE=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=oipzlGENzY2Kcmv+sjX1xsxIs/F5idBbiPree/Qcj2b9RS1k6efUAF0NB2z4OoKi+
	 K1dDKTVS7A8HCxQbwG2R3Kiy9qNFJPTGRoXV/DujZHTz/kZyG0xLCB8fJECLhc1pT9
	 +IhFviNfMbqzjXmFJy+4rAgXRRkGqZQjNSNOTTVL9AqAYMIkkWcQSezdLGWB/XLTgI
	 iGu3mH8V50gCfi6KPe6p3BuZ2Hc0DdixOJdwStco2ei0UyBwdSHlXS4PhnUJuMNqBl
	 qIVunAND1T84Nu4CknXpKjWPpShr5WfMu5SFO4OYOmpLtY16cWzIjuC+rL1Zh9fe5s
	 HOp4Bjn27lwiw==
Date: Fri, 13 Nov 2026 18:21:23 -0800
From: "H. Peter Anvin" <hpa@zytor.com>
To: Borislav Petkov <bp@alien8.de>
CC: Linus Torvalds <torvalds@linux-foundation.org>,
        David Laight <david.laight.linux@gmail.com>,
        Usama Arif <usama.arif@linux.dev>, dave.hansen@linux.intel.com,
        dsterba@suse.com, linux-kernel@vger.kernel.org, mingo@redhat.com,
        terrelln@fb.com, tglx@kernel.org, x86@kernel.org, kas@kernel.org,
        hannes@cmpxchg.org, riel@surriel.com, shakeel.butt@linux.dev,
        kernel-team@meta.com
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v3_2/2=5D_x86/lib=3A_Use_REP_MOVSB_f?=
 =?US-ASCII?Q?or_large_memcpy=28=29_on_ERMS_CPUs_without_FSRM?=
User-Agent: K-9 Mail for Android
In-Reply-To: <20261113233703.GCavefHwxVZX8mGFCm@fat_crate.local>
References: <20261111234608.GAavT-QFRo6EtvoL0y@fat_crate.local> <20261113141137.1113517-1-usama.arif@linux.dev> <20261113160300.3f0d0a37@pumpkin> <CAHk-=wjmnpCmhyOta1EBR6D8_JFgLNz7Jb2s_PgbPq6cBiQ0wg@mail.gmail.com> <E9C129F6-61F5-49CE-8948-064DAE86EF4F@zytor.com> <20261113233703.GCavefHwxVZX8mGFCm@fat_crate.local>
Message-ID: <628BDCC5-B599-4B70-B512-E13DEE926DFA@zytor.com>
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

On November 13, 2026 3:37:03 PM PST, Borislav Petkov <bp@alien8=2Ede> wrote=
:
>On Fri, Nov 13, 2026 at 10:36:30AM -0800, H=2E Peter Anvin wrote:
>> Well, we can put a request in for compiler support=2E This equally appl=
ies to
>> other compiler runtime functions, for that matter=2E=2E=2E
>
>I was going to suggest that too=2E Lemme know if I should ping my gcc fol=
ks=2E=2E=2E
>

Seems like a good idea to me=2E Presumably it would be using the rep movsb=
 convention=2E
