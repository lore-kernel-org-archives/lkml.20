Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793774999;
	b=nq8nfIVK0bR/3j+R3eMXaIARXctRgNcl+aFDw5MCeUqqdlf7yVQYBozt0WROefCwVH+l
	 1pdVcQeKu6F89virSwNoeBVD39hC4JJPdl0/E1MTjJUR/k1yCV/uuFN74k2Leklw9K8ft
	 ZzcywlhdwJtX0lahzZ/WDQB6ieycnRvy6Nx5kv6lAvL5II00NUoYF9YHkciVxZwL200Zq
	 3PcXIME/GFg6l/6Emuh2thx64D8cPilRBAAwXSpmWP1dlZo6yZ+aQR9KPrXUmHUqMbFQ6
	 ePSSHcIXA8hh/v5F2Fiflqo0S004kgn9dBYkU80Vzo6x2731JAS/T+Rr/SuHjfVbPFQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793774999;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=5eZ4LEZGvtrRKhIe4vx+pLxIESEbwM8aVSCBjXhFuXk=;
	b=W1ZpIl8kgKxjyS6RnTBFhMWRCh4OOX79yhT8GvqcIpyABFR75bmxnmxsDczdzTqQFxsT
	 iIYJLGAJMvrDRBof7VUj3u329y+mVtx4T8osU4jXiOlIk5O0xeTGwtPBGQQiwBxq+FC66
	 pSTGfxJ63v04H0xIYtLDWuI6d5FJxQJo57X8g+wHmvRECzXp3f1JZEJSm5N6npYxdTUdF
	 7QCvCUcF17DSCJARyCQMIKkAiprVFt4/2N3jBAu+3Z0j/LekYlTrQsO5xvFc2JMF9uj2G
	 beOixGPGqIknYYukmJjSuolmqnEzQToZlyiGZqpkoeMEFYDFs4bBkFRtlqEzNvWvn6g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=syZnf13A;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71E57606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 06:49:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71E57606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=syZnf13A
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b561b60b78so212496a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 22:49:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793774998; cv=none;
        d=google.com; s=arc-20260327;
        b=KfCgt8je5aV0itYuaoBKHTJoOCIsXpJqk0MrnQ3ecenatQvQvapPS0or4o4icB/P4/
         X1DUW8WJ8KQOZ9kEWvDTAYQQWH0Ur1CvuOoGAL4c7imVMLfyz9MmSzyo/ITqaQlgv2I+
         pcxW+iYn+WZEfQpRR2YkRp4D2vqWeLPb7Pw3d/rw9HcJGLo8MimICZC9akBPFGLlroJ7
         duhL2z5qZRK/3e5dIEPopm5SgAQWZq9dq2pIKw6mm5WTme0PpoBIKKRX7slWkfmHmYS7
         tFG6sXgrApxSsjqRjf/Nga0eCOmIbcA4WmEl6+aOiYrvyMP7i0AjTsQjDPqpfpZv50Ve
         JsRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=5eZ4LEZGvtrRKhIe4vx+pLxIESEbwM8aVSCBjXhFuXk=;
        fh=G9suUSzBi46dPnm6B4JbyMSoDspBAri4kqZr3KuxXRQ=;
        b=lInIPkch3ygmfmtAfh4kUQG2MazNSyfrikdx/1O4+SALhJx9fE/bOAoxrCbKBbqSeT
         BuwhEGm/mDmfhrDzqXVgTPcNbkWegXGnLvq9d3KCvz/jqLBV+s5J39OkQbYRjCFuamvG
         bd+SV2kNyL1QHRj/wRVF+LI38aPYWZqy5nxlmqxfcIlWvjXpBdIeTSSZIOAq1ZaQRQbh
         bEyK5+yMdhhVq2NmQIBLmAXUp1ayrhnL66Vfd8E1cVnrjiZ/5twcnHX3o38Vhwr1SyKc
         zcv5AbpyNFvMIPkR80cuJCwp8ogO4GLPZiiFtK7N1fLcMVPcm+iNXJnCTulBSQlR8cav
         Bdpw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793774998; x=1794379798; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5eZ4LEZGvtrRKhIe4vx+pLxIESEbwM8aVSCBjXhFuXk=;
        b=syZnf13ABHMGrpYG4p/7M2Uo9um5pkv/sooPhCNEXF97g2Usjp/m8czs4jGo9r5Flb
         O4PStf+pJclIciDtTpLz3ktN3S6tolXxiWF5eS1EWnfCYaKJPUU3U1sumuT7EDb5pdI9
         nKC5aquyuzlvXJ0w+Zp6Ykq7zJEwVkmweU/Gm9321QUUYW5I9ZPH6ILXcz1WYeq9BvBX
         +NxmknCyHPeEx2TzktNWMZuwHRI6/pTWspTIv6kK6sEvLY1Bd2iOVRGatDghOWKHL5tW
         xBWCkJ1eqt+ppzaZmnny81N/mhZZgootFyGkYvPH3XFdB82mYJgwOv67KydNeG2Ng8fk
         Alvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793774998; x=1794379798;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5eZ4LEZGvtrRKhIe4vx+pLxIESEbwM8aVSCBjXhFuXk=;
        b=Rb2n2X/SNqn6+eIp89vSF7zABmlzR9cByK1dm7ofOjI2QMLTTI4gBixvkeCR4uNoBM
         HS5lkjDwaZCrg+EzMePP1E8BhSxjMLFs51WQ4BG0chVxyexpGcxdZgCnvLmUQxjLXetG
         FHw6RB1uzRxptqK3ZwMfKYhCnz0vAOED5p/bmz/xW6pwRTegAVr8e9nKBoaUMh/hfXkp
         JwT1UuQ4bFs/2eTC/ilUQT9Bhm9xHr9TzpoBTpvCJpqy+oUha4KZuXenhyDpu0TEJyyW
         GzYxQS2x8nqMdJGPXybbYwW05oNg2LkUK1TedIIjR6AHuNTayBSd+qQmx8Dh7Js55Q5o
         zPKw==
X-Forwarded-Encrypted: i=1; AKwUvBygxlKLRZedeg593t6ihvZdop7IzEXGHsz7a049/9vqH88C+m4+DVuiuZFVVQbeX1zPOo3uk8lxBluHaKw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/hAYVhtapMnNAFf1jFQfSIf9Id/BQrhgFd8URN6AGK4/XWqZoH
	e3Pxh/pvRBRdB+ovKdSi/ln97xkLqwajkwKGB83Ho/t7riupqPJHhiMt23/8bvFWwcUEynfszvx
	k9JCZHqOiQiRWQ+Ja1//437I1ST7wOHg=
X-Gm-Gg: AYBFou11gO6Vp2br/R+w1cWdQOH5XfNnsuEedZrSuQbJ8a5xFZBHgBdotpSb/Plb2tM
	5Gypi4jVIVV7P4ejI6ncJhHWDlVHg1tMlXGjdhJOerc+XHGvw+acJMTwOHB9gyI9uprxrCItU5X
	/PX4xXbWzpXnW3be31yq+QZ9Eqzf96dt8s19Ezicaas5VAxtmplSDApZZaiUZyIv1jxT+h29x3e
	2y7iZIgT3jle//RnfzvKwRoI/UGyQ97RNjt5vOlYTe07i69CYK/x7o1tTDWqPCEtKL0/+JZFdme
	mbXHNhYUFDk8JDhgjMY6gikvH/ifg6UOzeKD1FG+i3PDM2QijBlWRbV86nnv4EThT0ZkkgmQ1sx
	sMSIG2igJedfZrRvpWb2BJY+Jo5Hp4Uh04sJ4/2yA+XWHARZrzM9V8MHicMzk5O2mNuWE5w==
X-Received: by 2002:a17:907:3e19:b0:c48:a838:c17e with SMTP id
 a640c23a62f3a-c49d1307e11mr1648258466b.14.1793774997661; Tue, 03 Nov 2026
 22:49:57 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103060658.696994-1-martin.ankerl@gmail.com> <CAKwvOdmXSH2W0evc6XF+2yjr1qg3oUExiy-pF+LAx4_iHycu7g@mail.gmail.com>
In-Reply-To: <CAKwvOdmXSH2W0evc6XF+2yjr1qg3oUExiy-pF+LAx4_iHycu7g@mail.gmail.com>
From: Martin Leitner-Ankerl <martin.ankerl@gmail.com>
Date: Wed, 4 Nov 2026 07:49:46 +0100
X-Gm-Features: AclHuK8oh8kpHv8oZjgJYiffPFA4E30_6N-HyxL3xKPXCKJkWV692Org4-Ci9f0
Message-ID: <CAAFOosZkUXst22MOVUyJW6mdjnAO2XgKWJ_NuFp37QJWk_nk-w@mail.gmail.com>
Subject: Re: [PATCH] x86/cpu: Use prefetcht0 for prefetch() on 64-bit
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Andi Kleen <ak@linux.intel.com>, 
	Youling Tang <youling.tang@linux.dev>, Nathan Chancellor <nathan@kernel.org>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Youling Tang <tangyouling@kylinos.cn>, 
	Nikolay Borisov <nik.borisov@suse.com>
Content-Type: text/plain; charset="UTF-8"

> Thanks for the patch!
> Is there a reason to have the cast vs simply use "r" constraint and
> deref in the inline asm?
> asm("prefetcht0 (%0)" : : "r" (x));
> https://godbolt.org/z/xezh15oMe

I mostly did it to be consistent with the 32-bit prefetch() and prefetchw()
in the same file, but it also has a codegen benefit. With "m" the compiler
can put an offset or index in the prefetcht0 itself, while with "r" it needs
to compute the address into a register first:
https://godbolt.org/z/j311eYzsY

Thanks for the ack!
Martin
