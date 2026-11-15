Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794746529;
	b=e9xm4oLAtkIp7faJ+1C1c7tVBtgG32mxNZyElM9wVw7T12mXK2V8zp4IBTWST8PZwNzb
	 QTaogx/WG/yAuSj1VNEKqn3GdRh/RdoNEtZFWz8sAi7+ytXegx9vDhw0nwb2mfPCJ8pro
	 phgMLhk+S32dsTCAv2PPdIvB84QiKst2I0dmhngMXsFamP1DPvdjUq9CjFwvVSeTuYQKQ
	 yD+fyp7jYL2Fgu1uQTqUkk1faZUI/EPzAX8QQB17l6tLQ+d2G7CYgxL68MnNnOt4qcuKs
	 igOmTdVKvR519Yuo+SK4PYpxOJK9uCrhwSnelct8q+hlILSTd1cbw59h6L/fVihRXBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794746529;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=XlAf4PQU/2HL7ADnQCu3Rro0yhb+MVC3ik4t9nS9H5E=;
	b=c4N0gT7dqYWIpKsXbAQJ+W+NrZ7P2UkPuVJQwUul6fjfthJ9NuqWWDgRCEw44xr2hi9R
	 EDoqSHR7dRA+vGa699Xc44Wdcfmis6QefwElGs7eERQUJ6kujcDrIFUddNtGkNFQJx5bm
	 NuqB+BrHkr2CU39KlJyX2oYCjXDqxhBoesgS7Ze4EBI31EBuIsn71Ex1PxQCPJhVDAfCd
	 ltG0PRMF65hG4oOdQsS0C/vHGeR5IQs9m4m9vSLhkuFxlcwzFuYWIupGvlDxjv25R19km
	 v5xv/i7mEiTHYZPFS5aIRDqvucohzv+18lNh7UoxvcnEAf8jE/4BkRVL1hUWjJjmNag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JSg+QPAL;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA96D606A31F
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 12:42:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA96D606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JSg+QPAL
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-491846221ffso2307805f8f.3
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 04:42:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794746527; x=1795351327; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XlAf4PQU/2HL7ADnQCu3Rro0yhb+MVC3ik4t9nS9H5E=;
        b=JSg+QPALnqyb4xWfThYgwoPiiSMbwvN7+84slATI16Gh3ck/WVjdmqYsY6N3kzHb8X
         LoUk/b5xxaD3CPVtL2oPmc6sw8Cg+WfJvky6Ujn9Qz72cbZVv4KdoofCKLFCL/FgMsHN
         qMrE3syYUb99v6Ywz9bqetkKo8i9Ktird/SXMxTyHQbzFSr9v4qaq+1yGrgDRtxysTxJ
         wMwLU/EKAA7p9jMnWDjbriscauKUu2ClZAgxFWgtX+6M+zM20b+LQwNjYxg6HcO9CCJ8
         pJ7AgZ4wJPKPpsr998349QI2lMdLa/lvOmBeE4jhgO2rKAKXjzSt4MoX26VQED4J07QF
         +rLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794746527; x=1795351327;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XlAf4PQU/2HL7ADnQCu3Rro0yhb+MVC3ik4t9nS9H5E=;
        b=thmoN4dIRq1dEOL9HCPxjYHjpS/q3KWgqFr8g5EWXknlhkXjj92ZRYxVLjrS6KFIjK
         XEvqciYllwdmaRWViupKAKxgW3MuLKXcvejoj2BEMwXKatdmf3+2suK1nyVvrKIpMStg
         i9kxVD8QQ9xFLDp+FDm8Fdwv1t5zqF6x9cqUlzMCkiF7H0yrJFSQFvHpcykVoIRukB6h
         zJgmmBC8djXztx8UI3swclLv30Z29aBmzC2xlS94LOUi84VEFBXx0IL5Wdlw1ZLHLyfb
         lKVOBpmHePGWgecpv25cAq+EEfDIZVcsvvkv5dxZ0ftJ4g3/i1/tefj08MqYZN6fLBDf
         ybpw==
X-Forwarded-Encrypted: i=1; AL+hErFmxvthZmsr2/q0LC16G8wPM9FqcMiRHbd7xU1TXNXAgW0m/BVV0FLbkU+XcD5tL3PUZrctCC7lfVTirmI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+WGuD28b8ENwXwaYERlT7zA+ngCmz8XEqX0da3hHkDNrnX1+0G
	q4FFquNlNFj2LF596XnkWTqwKptZJnGCObp1JkOUrvplsok5FQTWZxjX
X-Gm-Gg: AYBFou2N/ATHIzBD2kEIYJCVu2PN1BZdJFQQkEKRGTfZ9amKHVmNuBsl/mHGR/5XKUk
	bI9lFWiIXGyeUmemoHVGu02CulXPWuuJvot3S9HaGnmvJxhUECzOBTkzY6cjwLlfa53hn1DYaEu
	5gPyr3UGlfdVtSxfd17rp33m768jtnfG5yaqBX71JHcJCAyA1GQTfXlKh2kL9CTVWQ/tcBlmh07
	txbVbpuAGAfS/p8yUiB6Bt63+pP6s83yOMiNM55fRz0kJLU+uF6el7G9D1XXfm9TGtgLufN62nJ
	c0wmrRAkI25DL83OIQArsZBDSVojZgNHu0j98+sSuB7QyNmjdXxaSQ/PXwz9NNSobADFaIGU0pc
	QQ/MyXUYpDdl6rOe+DfohT/2D0W4VQnawdhO4XNXvUD4f9w2FV/YGzJd6kmBat6XyMMp2eKuhzW
	IZa/mUlEnu9SslMdGuxyInU8BX9P8g4J7Nup2MtT5KH9OPqIza1RQSSF3LVk58QJv/ds0gO02Rb
	Jp4SIBB1Pf/babjdvDCI/iwvB3NHcUjm9Mz1ezwLRIDoRjepeZdR+Qd2IbMFr3SJbmyGKOsGahw
	w/JhEZt5mkLX/mM+cIy4MgV2kTQPO+tnS6jSl/qv0Y3uqdavoL7zGpzr9YgJ8mqfiQ==
X-Received: by 2002:a05:6000:610:b0:48d:e696:8a65 with SMTP id ffacd0b85a97d-49c72ab0c18mr17718549f8f.46.1794746526929;
        Sun, 15 Nov 2026 04:42:06 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5fb58fefsm18020780f8f.26.2026.11.15.04.42.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 04:42:06 -0800 (PST)
Date: Sun, 15 Nov 2026 12:42:05 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "H. Peter Anvin" <hpa@zytor.com>, Borislav Petkov <bp@alien8.de>, Usama
 Arif <usama.arif@linux.dev>, dave.hansen@linux.intel.com, dsterba@suse.com,
 linux-kernel@vger.kernel.org, mingo@redhat.com, terrelln@fb.com,
 tglx@kernel.org, x86@kernel.org, kas@kernel.org, hannes@cmpxchg.org,
 riel@surriel.com, shakeel.butt@linux.dev, kernel-team@meta.com
Subject: Re: [PATCH v3 2/2] x86/lib: Use REP MOVSB for large memcpy() on
 ERMS CPUs without FSRM
Message-ID: <20261115124205.076cdd63@pumpkin>
In-Reply-To: <CAHk-=wj0MtJpBbwNr=NGh4kFPM__Wf9Hq+LZ1Qv1Yv1SCpjaLQ@mail.gmail.com>
References: <20261111234608.GAavT-QFRo6EtvoL0y@fat_crate.local>
	<20261113141137.1113517-1-usama.arif@linux.dev>
	<20261113160300.3f0d0a37@pumpkin>
	<CAHk-=wjmnpCmhyOta1EBR6D8_JFgLNz7Jb2s_PgbPq6cBiQ0wg@mail.gmail.com>
	<E9C129F6-61F5-49CE-8948-064DAE86EF4F@zytor.com>
	<20261113233703.GCavefHwxVZX8mGFCm@fat_crate.local>
	<628BDCC5-B599-4B70-B512-E13DEE926DFA@zytor.com>
	<20261114224504.7574f7f0@pumpkin>
	<CAHk-=wj0MtJpBbwNr=NGh4kFPM__Wf9Hq+LZ1Qv1Yv1SCpjaLQ@mail.gmail.com>
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

On Sat, 14 Nov 2026 16:56:16 -0800
Linus Torvalds <torvalds@linux-foundation.org> wrote:

> On Sat, 14 Nov 2026 at 14:45, David Laight <david.laight.linux@gmail.com> wrote:
> >
> > Otherwise you'll need to spill to stack for even a simple byte copy loop.  
> 
> I think the optimization should be for the inline case.
> 
> Once you do a call, having a couple of push/pop instructions in the
> target is a complete no-op.

You certainly don't want to have a lot of available registers.
But even with a call I'd have thought a push/pop would be noticeable
for short copies.
If you need extra registers to unroll a longer copy loop, then I agree
that the push/pop will be noise.

> But having extra registers free could help at the call-site,

There isn't much you can put at the call site instead of a 5 byte call.

> and if the 'rep movs' is inlined you only modify rcx/rsi/rdi.
> I think the calling convention should mirror that.

I think I'd go for rax/rdx being scratch and the final values
of rcx/tsi/rdi being undefined.
What you don't want to do is have to preserve the destination address.
That is always better done at the call site.

I'd guess the compiler option could have a option to say whether ax/dx
are scratch or not.

I'm not sure whether the loop I posted runs as fast as I hoped.
It might need interleaving to get a read and write executed on the
same clock - but the AVX xor loop didn't need it.

All needs some real experiments.

David
 
> 
>              Linus

