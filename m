Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794696309;
	b=GqA3VhEtOeFzZ87gQmWlvQMqr7/+4sus0tfruGAgTLFQ/eMzUkkqBMi2tboRn7UYhuVA
	 KYZKPuAH98LeUS4dB3jEimvh+6xvoiR+uYrg4mhyf0gEv+ltWScoDmwihRTQ+0R5QJfye
	 vXKPa2SVaVG//bhtdAAQ1FunI5UFZQwNbciv/xaEhJP9j4oJgwlolmPAV7UBfogsGMSch
	 KN81XOa4Z8EL8BJl99ZJ3aWMrLlRXb+JMrjDCkYzqxznLc9YqlDLdc6hsekjhtRR3QtSt
	 a+p8kZeCcWluR43xWn4kNudrb3AhX8IChbHW3e51xMS7byD/qEjW/FiPqwB4Ms9Iu8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794696309;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=YjA4ouCvKnJp8ps8+zXo+2oINvf6/roGIb1PKqkhiy4=;
	b=NXjwSp/TYt5WNQztFsCYJ+nIS4TjqM/eGQrNLfoa8qOXFSoVEQx1zSdKy9nmfIwchi0d
	 t8nhn1EVwFwRQwNoTzsP1jMS4tOWPb+ytfqjMQZ46ewzEk8KiIwQaoeY696QwSRqSacgF
	 J/N8vUA50mNxUWmOxVjMWpJs5RBRLySTxZM/tUFMCs+nJou1Hai6lqUMovWEBs+DpU/Uz
	 I2Lp6Hlyw337mOhZeMpk+LHi50rgpdjCBhvJsazZmKyzUpbyKpYmHVZbjUKCV1+H5Urey
	 4F4B00TnkusWaUCrbDQJTi3/rWxHRo1KSEvsWEYdpq35xhJD+zzroXPwpOcY/5nA6rg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f6SjB1Y7;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E17FF606A327
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 22:45:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E17FF606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f6SjB1Y7
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-498f5fa5103so879948f8f.2
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 14:45:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794696307; x=1795301107; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YjA4ouCvKnJp8ps8+zXo+2oINvf6/roGIb1PKqkhiy4=;
        b=f6SjB1Y7+4h9mohvJUSEACOgdW7iZXfR1Xal/dWdo+hWhIRc8cdfDbRBOXyWlaH/gA
         n+cED1N6qwt6kes+mheGTS2Dh1Z4J8ZrfShIE5rosp0e7fO5t6WZmLH2utwfAt866Dfg
         dFmSYEG+BYDcqUZcCwec5+rwm6wRjh5cA5V0qd7MWBP+eXInyvo9DfWtSGLZVCIEmk0b
         P4OmubQcDrtyF1hGB7AMs5w5OGU+dk+gJQXhrDaGUmAiKNa4bKaL/6BBaEiLyKXEBxhU
         xBBJioBvTsNplwjTml2X5p2BYDDWJ/+YJn7DC3KSVFZz+BaOA5bUOGSBZpQ4QGIPrF7k
         Ackg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794696307; x=1795301107;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YjA4ouCvKnJp8ps8+zXo+2oINvf6/roGIb1PKqkhiy4=;
        b=nshJkOpAvcl5YCaXvNXiKnhHaivFk/HfwJRAOEncQe+ojN/IDXvGHlAY6UdXgDzeew
         cOz57t1UOu/y1mCLlLv23w6RbmfGLI4u1XPwwhnl9Bb8urQGaos4M2vbCPTmRDUFQuCU
         hIkRqHniVzHWXbH4TQ2tnPncl1czximf+TRM2dKAug/Gc425oowi2NXa0don7YDTQ/HR
         sJKT45Rzkrtve0OizIjaf98zwfj5dxLOY7xyPT3kT0GQvspeabQXNnkOkKUkT3oZDpBR
         5iFGVK4UR3fPCeXpOMOBbaBxQuDyZI5qiyWwvol4uJJKOJmbowWSg4MamOjHM7Po1k11
         dQaQ==
X-Forwarded-Encrypted: i=1; AL+hErHkX1eD5Cz4VxcpGplZB8P3dNQCEgNV7amxeYcnCNh1NpGFZYpl14/1dRCSYdXMk4y7n+lJ6WjaSSBmAOQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ACoN6RKM08RrLTp2BJfIEnVC/P1K4lTeXlaAudbsEVoeKa1og
	44QqB7uas5NcSrBSN+MPNabYTUEKXIIBgeGJJsMEI6v/hTzy3uNDbhvg
X-Gm-Gg: AYBFou2GWYwX5CtxvbnQJhHUstZtCDQo3JNGjRjvbpTwbQvQEBhJ+ZCIS5P9Phm9De4
	c/aV+S1Udmt/GX9Ky26mjGMVNZfcgc5so/OoU6ysP46GcJYiUZi6avAbByJvylq+/SJope7AEAQ
	2QFv06XO44XCgQx01XYffIGeqseMXIjxr/qwP5JmBrhkly1k5/fM6OuXJVdkA4WW66wLu0Nt4GJ
	ApUWlSJeSOWKzMX0JBacGEosTuWrxe4RX8ggYkQFE61JEIuVrlCCWrckmv2Ja83q0ccHrpO6eWZ
	mH2ytlgqDdArxMOBwCPlUfbL7y1LQA6/vO26p2L8g8GrA2TMSle+CmWGNOM+Cl1GLvjPPmaZ9pN
	qAW+f/7IJMbDwRtYBA5XY981ZySvoaDLeJcavcXcSVuHPU3Ckw+i0JV/rDUhw9BAmkVwjAwP9nq
	eGFynLt1ju2BsXIRQfuBg8HFjTr6e9oVO1VrDizYZm3h9FkmrUNCepVBoZPbP5a3on5yKD7+H7L
	yqBNwXXLj3/7ypcqu2MFXx8GBAr0Nz3q9f+qlNGSRh0DHeutFNsu7iaPzHsOuGQGiITEQ6RxxqX
	qukoVVcb16m7c5StTNdJxVsBlkODAt+HqZJWF9Jh2Svx2stzuIn7XWqal5UahF/A7g==
X-Received: by 2002:a05:6000:240b:b0:48c:6f3a:fe30 with SMTP id ffacd0b85a97d-49c712ac861mr14121224f8f.15.1794696306938;
        Sat, 14 Nov 2026 14:45:06 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f1c0e0dsm12401811f8f.15.2026.11.14.14.45.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 14:45:06 -0800 (PST)
Date: Sat, 14 Nov 2026 22:45:04 +0000
From: David Laight <david.laight.linux@gmail.com>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Borislav Petkov <bp@alien8.de>, Linus Torvalds
 <torvalds@linux-foundation.org>, Usama Arif <usama.arif@linux.dev>,
 dave.hansen@linux.intel.com, dsterba@suse.com,
 linux-kernel@vger.kernel.org, mingo@redhat.com, terrelln@fb.com,
 tglx@kernel.org, x86@kernel.org, kas@kernel.org, hannes@cmpxchg.org,
 riel@surriel.com, shakeel.butt@linux.dev, kernel-team@meta.com
Subject: Re: [PATCH v3 2/2] x86/lib: Use REP MOVSB for large memcpy() on
 ERMS CPUs without FSRM
Message-ID: <20261114224504.7574f7f0@pumpkin>
In-Reply-To: <628BDCC5-B599-4B70-B512-E13DEE926DFA@zytor.com>
References: <20261111234608.GAavT-QFRo6EtvoL0y@fat_crate.local>
	<20261113141137.1113517-1-usama.arif@linux.dev>
	<20261113160300.3f0d0a37@pumpkin>
	<CAHk-=wjmnpCmhyOta1EBR6D8_JFgLNz7Jb2s_PgbPq6cBiQ0wg@mail.gmail.com>
	<E9C129F6-61F5-49CE-8948-064DAE86EF4F@zytor.com>
	<20261113233703.GCavefHwxVZX8mGFCm@fat_crate.local>
	<628BDCC5-B599-4B70-B512-E13DEE926DFA@zytor.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 13 Nov 2026 18:21:23 -0800
"H. Peter Anvin" <hpa@zytor.com> wrote:

> On November 13, 2026 3:37:03 PM PST, Borislav Petkov <bp@alien8.de> wrote:
> >On Fri, Nov 13, 2026 at 10:36:30AM -0800, H. Peter Anvin wrote:  
> >> Well, we can put a request in for compiler support. This equally applies to
> >> other compiler runtime functions, for that matter...  
> >
> >I was going to suggest that too. Lemme know if I should ping my gcc folks...
> >  
> 
> Seems like a good idea to me. Presumably it would be using the rep movsb convention.

You probably want at least two scratch registers and to leave any value in
rdi, rsi and rcx.
Otherwise you'll need to spill to stack for even a simple byte copy loop.
But yes, you want to be able to patch 'rep movsb; nop; nop' over the call.

Two registers might even be enough, one to hold a 'remainder' length and
one for the value being copied.
I think this loop should run at 1 write per clock (two clocks per
iteration):
void _memcpy(void *dst, const void *src, u64 len)
{
	u64 val, rem = len & 15;
	len &= ~15;
	if (len == 0)
		goto short_copy;
	dst += len;
	src += len;
	len = -len;
	do {
		val = src[len];
		dst[len] = val;
		val = src[len + 8];
		dst[len + 8] = val;
	} while (len += 16);
	/* copy trailing bytes */
	val = src[rem - 16];
	dst[rem - 16] = val;
	val = src[rem - 8];
	dst[rem - 8] = val;
	return;
short_copy:
	...
}

I really need to dig out my memcpy() cycle counting code again.

David


		
