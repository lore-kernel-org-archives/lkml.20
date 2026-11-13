Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794591681;
	b=wYN2fTbQyHvSedAfD8HsS3HlCeMQg2/747cExO+7neFWdiuRyOVVJ0HQBOmoCgHdTNFV
	 dbDKKwJUrkblXWJlLsh1o8WJlcrBag5eacr0CBi5Q43bWrjklVHRj8/cHevAY2P8X0yRh
	 SqK31/5BiLCgd/RfMZqPQKn+qQG9aqB6WaoX3yX3q9VSmzxBt6T2lNd7isRzabuLVppnN
	 NKEvZCSXSXIR69eDHkmndDIcRmnWczViGmECtTdHjHOe81W0COpkG3TSlL5rAbeE98W8F
	 5i4X6rqAK1PtPZj/Bh6mbLVpi4Zd/VILuMc7b0fXAONRL9NxVe2yzf3zC8zzga69lNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794591681;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=tc/REKiPvKgSLIQ3AGM6k8C66RPZcVposVw3GvV28wQ=;
	b=XEf1V3zI+73+Y71lafrJ6YDMFS3OPZUCxo9onuPO6grLXKX7LWVGJQx0tECiBIOGY+lO
	 mgvSOcmQisJtBk0h1h3mjHWXhJE8eat9D8jTajHOxdvrkFM963QRkvPXfj4MJhkQ5pIUD
	 SLoY05uTkki8J4t6aKjZQ6sodeBwBuEx2Ex5KR4b14Vs3ByBBP9Nn66Ps83IjfLVAL7jT
	 BrfyrY111RhREfWt9jN33IbSrXCEnj475sZysOlLr0+iL3uVh06WoqajBpL2WliJtrcLA
	 oQOKbWAIotRwyzXPN2rdHd5gQFJ3tygSjB6AbZo3Px9IriQHAv7Fnm89JcNrlJ+eISQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=hbqVD0W1;
	arc=none smtp.remote-ip=209.85.167.49
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BD2260703E8
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 17:41:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6BD2260703E8
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=hbqVD0W1
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5bfa7c09c9eso1469619e87.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 09:41:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1794591679; x=1795196479; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tc/REKiPvKgSLIQ3AGM6k8C66RPZcVposVw3GvV28wQ=;
        b=hbqVD0W11jZHvNKkJlTz3rw56J0kw71XrEjNtx+Z6W/qmRUqRlknerjtClAtdILDJK
         y5uBxHb9i+jMxj++7jayivLZ/HyHQ8Y1ao6ThppLPhdiyCnOXoMtqbJLlzbNPSkpjFCK
         GBWiiR4Tfmzawa6MISDQjM8QAXuphkLINzOX4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794591679; x=1795196479;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tc/REKiPvKgSLIQ3AGM6k8C66RPZcVposVw3GvV28wQ=;
        b=W3xD5glKr6bq1LKWmPi5r8WtcgRN1R1xCX7bGuC2qBCpLsY6CxEn2suPFaXZzQWB3p
         kPJIfZoUQu3Bn/p4j/zT3oJ1939HozX9HWIXsjuiQo4BuxKzH0HeWn6WUBRE16dYkQ23
         i4V10PneSFjvm6XCNtr4gVxmm9VClQxdgahGjPGhVYy16Up0VNz6ySJpJJr8FD9lGuyO
         /v42GTD0wvx54atUI8AknmxEJ8B5gkw8OK/IGB2yNxD+s42WD0G4sQdnBbtkSu3w+guU
         5KhNOP3qsOb7ClcY942fiFwuQgwJkSOQpmeatJf48y7eriVPc7VcC8mPCvjq6xS+3CvE
         yX2w==
X-Forwarded-Encrypted: i=1; AL+hErFwB6F/+IT60KSeNG7QNY4CrmqO5bN+CFNg2l0dxQms0YQJQmqtjuCGMHHu8ALr1zqDi0b6xACZkYmMd10=@vger.kernel.org
X-Gm-Message-State: APuU4Z+xciKnJAt4XKFllIvuX2kMM2Qznd/lPC2wocBIXqTQ+mSBpWqn
	FThCYK/WXgJWoQ+obBiepAyzvvofWaRy7jZee9gPsRxXtJPxC0iWy/pQChBqDnzGB2sr3TewGhx
	G4T2LcYGVyA==
X-Gm-Gg: AYBFou1sgFvbrPh1e7b5IKETYMF9IcXC/RZD1OC+jkcU1ETiwbFo5TYMedAR0QVdm/K
	q2C73PPyrUoyPXqyis7UAaQKJvlIIYrsaAH30DwBe14bdh9wyaAujCpq9eLlbSbmwE106CoXI0O
	VWtY6wQIjvhZigbwid5ohq3k/F6V8zPKzEer9qlUNmLl7K/vhmsZ4LbQWROFzStq3v2S1putpoC
	3Cb1NrFEhnKBnKXtDi8iWYhxvzIr9EIyXe7Qdhwnmk7RMwBbrC7kwHdC+atYm760DSpSamhoeWM
	+PUp8QlsV91mBkud5jzxrx/FcSzRlHXVCs27dD38PyX9Km1mgwTNOqHEHLj3o3DliFEWyOA5yrk
	ePFnQI7earYeNIvSt0YZvlwZkQ+lwIzSxLh6O4arZEcGqd9J1pSyNP8+tfwzgMasT9EyJkr9m3O
	bLLJvOm5AH8eud+pYP7kWW7h9pxEebbBFKTG9T8QlfDqFLqWkfNm78D8fn8/Iy9NsagBBkw1JEU
	kRn8sSXK8uA209Q/tFjIGd5w1eWj0WciLI2BLKjIV7iR54ZGHesHmhJk/8Mzn0wswRn4qbkyzM+
	rj8X528/KQTciYvG2HaA+naybVwV2zGDVCvX46qGQ2cd3AtRNtRZ0DMJH67D+RlcT1MJhn3UZH1
	i9Ie/fdU2qec4SqCtbT+pvT6/
X-Received: by 2002:a05:6512:104d:b0:5c1:4e90:27d0 with SMTP id 2adb3069b0e04-5c170a26614mr1322107e87.66.1794591678510;
        Fri, 13 Nov 2026 09:41:18 -0800 (PST)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com. [209.85.167.43])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c171356420sm967358e87.68.2026.11.13.09.41.17
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 09:41:18 -0800 (PST)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5c14f7768acso1349278e87.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 09:41:17 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErG8uYFi7fOz98txJ8xy2hIE9Mx5d79vDQy7aUcqzEh8W5YwId7XGQuesxzjhSVoAhs7bSPIv16mM/5NYPQ=@vger.kernel.org
X-Received: by 2002:a17:906:d542:b0:c29:d31f:7d6a with SMTP id
 a640c23a62f3a-c509642ad87mr262487566b.35.1794591283338; Fri, 13 Nov 2026
 09:34:43 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111234608.GAavT-QFRo6EtvoL0y@fat_crate.local>
 <20261113141137.1113517-1-usama.arif@linux.dev> <20261113160300.3f0d0a37@pumpkin>
In-Reply-To: <20261113160300.3f0d0a37@pumpkin>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 13 Nov 2026 09:34:26 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjmnpCmhyOta1EBR6D8_JFgLNz7Jb2s_PgbPq6cBiQ0wg@mail.gmail.com>
X-Gm-Features: AclHuK9Tx-u1cLBBoFseqePi2c_o4rjSGK73bAbWs8FQgU2bxJ4phHHbgmChHCo
Message-ID: <CAHk-=wjmnpCmhyOta1EBR6D8_JFgLNz7Jb2s_PgbPq6cBiQ0wg@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] x86/lib: Use REP MOVSB for large memcpy() on ERMS
 CPUs without FSRM
To: David Laight <david.laight.linux@gmail.com>
Cc: Usama Arif <usama.arif@linux.dev>, Borislav Petkov <bp@alien8.de>, dave.hansen@linux.intel.com, 
	dsterba@suse.com, hpa@zytor.com, linux-kernel@vger.kernel.org, 
	mingo@redhat.com, terrelln@fb.com, tglx@kernel.org, x86@kernel.org, 
	kas@kernel.org, hannes@cmpxchg.org, riel@surriel.com, shakeel.butt@linux.dev, 
	kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"

On Fri, 13 Nov 2026 at 08:03, David Laight <david.laight.linux@gmail.com> wrote:
>
> I was thinking more of something like:
> (written in the email so untested)
>
> static always_inline void *memcpy(void *dst, const void *src, size_t len)

The problem with this approach two-fold:

 - many memcpy() calls aren't actually memcpy() calls on a C level

 - many memcpy() that *are* calls on a C level should never be calls
in the generated code

That first case is for things like structure copies etc. And it's
common, and it's important, although for the kernel it's usually a
non-issue because it's *typicay* a small constant-sized copy, which
brings us to the second case...

The second case is hugely important. The compiler needs to turn small
memcpy() calls into just loads and stores. Calling "memcpy()" for a
known 64-byte copy is hugely inefficient.

We used to - long ago - do that "constant small sizes" thing by hand.
It was a huge pain. We now rely on the compiler to do it.

End result: we must *not* hide 'memcpy()' from the compiler for
performance reasons, and we cannot catch all cases anyway because the
compiler generates implicit memcpy calls.

This is why I really wish we had the compiler just generate a
different sequence for 'call memcpy'. One that used a different
callign convention - preferably just the 'rep movs' one so that we
could just rewrite the call with 'rep movsb' in place.

Without compiler support, we're kind of screwed.

              Linus

              Linus
