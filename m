Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794064663;
	b=mRtMAGjKGJgf0MbAApSf3arpHcluRAiHKa6A+Kf4hfSKNAIshXdeRsDmk8EvcJ8qNqU5
	 z6hoxyKI2Z7x8qST4nn9rm4pCLsXzcCOIAPIpGAAeU4z0fmNIyByRWbs/52OpPuHRyC6n
	 yw/kseZmUEbwTtWghcjizTc2hjry9gOGcJavkVBGcjpd0MGjeKhkMBD9jksjplIF+JsFl
	 Hxt7Zgv3+L2jpFX7ubYuTfundyE4uJy5aOZIB/+PVC5jLL9im4LZ8FBjJGBdylRgHvtcL
	 drRII3mCD2EznZ9xKqdWu/0s9ByE8I6dk25EIo78nMLj6DLT0RQLGLiYwdxKvU7itlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794064663;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=MeF/1bFkHYSuxzskpfZlny2NzE7wY2okieEwz4QfiGw=;
	b=Yeh4nBanzJTJ1STw9pUI8ZUDrepcBQPYFwG2ng63h5gHQKertxLxsEtOEWw8XE+ECErD
	 OI+V9YimJGXhyaX82oXdQWOQu0o5KIUjnpw39M443o5l8SqsbSdbz2bTDXsuqybYRTDsJ
	 sC5cpe43f/msPWpcxTzUtmAX3fuC9whaFhkOJykOMsiLZzPZ9p2UWaGok8X+Wr+Pj78cL
	 4PKSVNEyMU16RKgXvgiR/W6rcdA5DvVMXwfVmbrEHlhfxIkWnA2X4BK941I4SqcALB8fD
	 Jy/LkXUajvxx/MFlR7BkebaR5S+NKHE+JBTpyW978FPmuhmaXj0Q1t/cNxrayWWYuiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mEx9JaoF;
	arc=none smtp.remote-ip=209.85.208.177
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F7B56082BDC
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 15:17:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F7B56082BDC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mEx9JaoF
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3acd304b5fbso10419501fa.2
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 07:17:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794064661; x=1794669461; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MeF/1bFkHYSuxzskpfZlny2NzE7wY2okieEwz4QfiGw=;
        b=mEx9JaoFVWqn81xBnARZosOA2nexoirrYwD4tcRgXFTI4v7vXnV8xXRdGkhzNYK9Fn
         BdI46ZJRyvh0BagG3hjda4IwH4W6CrhfIlmg52m/q9Is79OjTCAneo2dGtS/537dvkI4
         xLJrZbGfBZ6oUR2eCZRxRnzUyNfnhx70JiVyxXo7tDb1Qcoir0tEvY5RETs/UGFVn00j
         8l50nzCYoNt5jBeKeDeoqM2YiMxcsy/8EuDCf3f5Ewybi2OkpSxoLHAQ66RM+2Jz2XU5
         sGajPlZRf9VswyfQkzPoMlkaJun1HnoA9UwDJgfcbmyIQEeQeDLukm0C8630NrppMLGO
         3Lmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794064661; x=1794669461;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MeF/1bFkHYSuxzskpfZlny2NzE7wY2okieEwz4QfiGw=;
        b=yOzVfaPuXOTiht8ixRBdUrWXS+vtMwpD1JN1NDwsx6VYDkXFSL/cOj8qXzf4jtEDI6
         MJJ+ROhn+5vb7ySc9r5WivmDqFyixgMBOayrEnvbQsAtD61h3MpByoIQZVMsU+JbQ3jt
         jp9dX3XMZFKGiP9y6fjhKZya4Snpk8AdWhvsnzGZ7JWoAucwbashsYmq0ETT03mDXgkf
         YvpdFgOGloI5TPlUDmuYpljuBR36GvCszclD4YwVPaKKvbr86oiICXmf0vScwzxLyVU/
         4EKBXfUCqkfwGS73uSele6R3pIEVMapvZoumhBv37dn3CYS5+jRwHI28izNdNZ5aKQTW
         f9Ww==
X-Forwarded-Encrypted: i=1; AL+hErG7VyZdtNW6UakaeJP9HsaldF1LG1WZPZotB23C0pzbZ0BRWkmIz1PHEdkeS1/aKyXWeVgGctgA2Q/HCbQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+knCDRFz2YjTjXjKJzg1U5GF/x3RWDMn72ErtPjq3CaXow3ZF2
	lfbkl62cVxk310VlTtWGTPnMCp87d3gLyiN3l4sy0gPxRVVyr3dNOHRa
X-Gm-Gg: AYBFou1SW4nglW0BHZsShoMpfQ8apdQ7HS5lPOhY+VzlIvaGDOi5TRWl9ZICt53cDXE
	t6CNy1BJdpW/Qd6bfzyjrt9TJflHEAgZxzliUNxlPRp/K4vk35yIxz/Ll68/dWQlHrJIQrE4SCW
	HgErB4aqJWApwUC++RgaWjvUi7DMmmGqy6bQaXUQ1mLla3CIYnT6C9spPR5VC2jBUFvdQcLrWIf
	VugzRlhq/ihy94dQmXcCtDGvfFy1L0V3p+u+SwELWVS7X+4ctdSYZr8RApMyP0X1ToLYneQLqX3
	ZpBPLWUU0stMhn6zHiu9BXVSkQfHa2MXzcjQIIIRYSZpn2bSJJDmxTsph9NWukshLT7l9xHockh
	OLUyiD354pvGWATy5QyF+85DqA9OZXeCccyvOTvUdXJ3+yC/2ERDcaxj/v18fjZda82XBcKfbjp
	SsEPxha1cXYItLSDU8m8mKkszvROiEpOjXqEy6NMsnEz2lc3Oh19I+gYMDryrrGP/UBShewtCJN
	CakyBhua+4mzDF4fsfD9ip1r+SkySIz/82+1MqAGBXzEgZx2C6mMw6eBrCM8A/aGUJjy5gIKK9/
	dPw5UNR7DgEpcCyV7bqunGaTWQm2NUltidvMTQnYvEE=
X-Received: by 2002:a2e:a542:0:b0:3ac:41ca:1104 with SMTP id 38308e7fff4ca-3acf36e890bmr11461021fa.0.1794064660640;
        Sat, 07 Nov 2026 07:17:40 -0800 (PST)
Received: from thinkpad ([92.36.72.88])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ad976a9911sm1616151fa.38.2026.11.07.07.17.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 07:17:38 -0800 (PST)
From: Andrey Zakharov <dedemorow@gmail.com>
To: x86@kernel.org
Cc: tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	hpa@zytor.com,
	luto@kernel.org,
	kees@kernel.org,
	linux-hardening@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC] x86/ioperm: boot-time switch to disable iopl()/ioperm()?
Date: Sat,  7 Nov 2026 18:17:24 +0300
Message-ID: <20261107151724.74703-1-dedemorow@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261027220904.15896-1-dedemorow@gmail.com>
References: <20261027220904.15896-1-dedemorow@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Sorry to bother you again. I was just wondering whether anyone has had
a chance to look at the question above. No rush at all.

I would be glad to help if a boot parameter for iopl()/ioperm() is
useful, and I am equally happy to leave it alone if it is not. Any
hint is welcome, even a short "not needed".

Thanks,
Andrey
