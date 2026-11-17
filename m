Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794934031;
	b=eC99lWXVO6P2t4RsYz2ugbbefyzr+pMoVvcBz3fdy884fGwy0/zEbXivIkv7l8dhOhbB
	 CoDUYS0SpFmeVc11ZuDsPaMifWIUdO1MZAgUZSLsF0TL3oAmsASx1T0dBvgcwVEk2wMab
	 rN14qgijP6hTysu6ntySKgVjCZTeLmyjJaOCrojsoYidhb/tchGRgVyrv06Y87EfsvGwM
	 fymJWrZK8JeiiDL8eTUMAMOEFci3hXQ+A6WCba2vie/2PXHAtGr8pr6F4nneAA/6TagWo
	 HqAGnkPpiTL8KFhT1o0MEDrH1MzAzn6ZlPa8d4D2iAvKITJCyi4KAmLojtROsUJG+BA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794934031;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=jd6+ZfKNXNj4bzpM1N39t1xeNHZL6yxdxFvAuL1XklQ=;
	b=aAQFpkC5lWBhPtMwBpM3/dU6Fc7TfhSHvfm0eDImFgtGQv93X0zSieZDoBNGo3xc1Gnb
	 N0U3qNpWCypflbi4x2/L5+KK7tz6XzqrQ6EMG2U16chGnn2ijfNhduMoEA3OMSR7ZT/C6
	 A+Z4f/e9V9wHwdFOnHOO1/+N2cf4rXnCD+Y0WVM1OpvLG3+/vLJHt8uqGpKsCzmBTsHsw
	 BvLxwR0o0QAshz9Tz44YvREZQqXLlyBFfRhLedn5ALph9o/9AnU+9VjeoLomEOyl+kHqL
	 M61dhfjUA1RcAz4yL6Uxl0uFrPKx2lUMA74OHC/mRg0q4nXEb0+b8W8PSpg9tbwuT0Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=szeredi.hu;
	spf=pass smtp.mailfrom=szeredi.hu;
	dkim=pass header.d=szeredi.hu header.i=@szeredi.hu header.a=rsa-sha256 header.s=google header.b=ivkn2Tcm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.176
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2940606A894
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 16:47:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2940606A894
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.a=rsa-sha256 header.s=google header.b=ivkn2Tcm
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-93f22a8515eso5750985a.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 08:47:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794934030; cv=none;
        d=google.com; s=arc-20260327;
        b=LNt1EkUtnEvkufNWMJWWO81WE+DefM3Zq1nvtb5p6J6MSp7+M9EzmetzA92/Az/zfN
         ItYVwas/zyMa94hAZY04IKOZ44DtSpOd7rY7zPr/yEehC3SlqhdKbpWyMgdKWozTdrFF
         7/USMpadX0n4bkCGucGcuIse3RGL130wZJ29P1SBdagRtFYe4jOyQV18WZvCRTmHtj95
         mi1fWaoKN7k0K4G6tAAaSk5DMcXkGoHz+IEPog9xc9OCUg4oNMjyemzqWTfhuh/3+9b6
         6ZL364q7omm9JS1EhpBYaZyDFphztCeK9WwSlx4DwKgLzcLJuafuyrTOrV6rmAB2Yzxp
         1o1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=jd6+ZfKNXNj4bzpM1N39t1xeNHZL6yxdxFvAuL1XklQ=;
        fh=mxqibEiIVF3V3bJY+uIhkwybt7DgKtNzdJ5R5F4c0nE=;
        b=Coj90BdKB0sJEoh6SI3Nlp97p8qWoD3tg8PTAax/jycfyd+rZhqcXPYNwEtvPUtzdK
         jvysQ4dIiRXOkipEa8PFzAP3iUnbbUrA2AnlgG72TuiyyU4RufFapdiiigLJK+uE/Jo9
         RfwgkwF9lHpZ1wnXt5hb8iDxNCNWOenB3CuAFy4NHD48rxmc4/6C91qXgd+I0+uQEJiV
         0/vL3ox2mbCUi7VWyWnaMsOrIP3EDmZMilpoxVxIjohniQ6SqckE9WHFVzrshKCXcLx8
         iA9leYx5aRVn4jbah7fqJ4xF+UNwBJyakPbWdw9BpESY2PufXQzzZVYwqFEYopdX3iuz
         lFGg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1794934030; x=1795538830; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jd6+ZfKNXNj4bzpM1N39t1xeNHZL6yxdxFvAuL1XklQ=;
        b=ivkn2Tcm0phLkCKz0qlD1qdYjHEfiiI7DmcQf1gfgzzqFU8tgtZ0s/1PPpbxxRFqnl
         5JfkZ8gM0KTbYDR1UDcx3Xs6JZcu+F47AO5PQoYtjfXiMBtl6fbWPHOc4rsLezSH6JMD
         yCbL+pT0ioAZgnStS2CJ0cqj3YZVmsfSewXMY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794934030; x=1795538830;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jd6+ZfKNXNj4bzpM1N39t1xeNHZL6yxdxFvAuL1XklQ=;
        b=URJkrSk64KTDiDSerIj7kN5k9X5semvO5SlD7CdCBMAlPETdZ2ldH/vA6RpOvweA3N
         XSBBY0RhP25ULhR8LwQolDpT+j1dm149nYnPtDyOz3Kp4zKcq7KHRsh+Igrm84Z9ISAn
         L2nmgGb97PpRuEZ+lzngyjISp3eLCI668Gyw1HOpbI37ra4Vu9/CjoIgFxm+UWZv/flC
         HOZdPbjliUvotMVkjezbLyE191th7niLmGtT9kWX8Ex5PryZhLxjJpzMiEGD/sdRIJCv
         kkh2zc7W9q19Eb5T371hJZWsGX0Mwm5NzOj5iy1kwufu/smi7F+2RLM6+atT5w9akyGe
         TDIg==
X-Forwarded-Encrypted: i=1; AL+hErEFdSvI6bNk4/6maOpcK1wnSljuFRBOBHGpRzlZvnjyrIOHpkri/r8/pl5keDnUjlJVUJ8Zm0YVWfTMHPA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+gKXLOak5pJnkSZOWdYOZZaFCG6aSMfHz4uebaD0aE1/WehgyN
	0uNHu22CAS4jPF2x1TlF5a/gFaWFkimH0siz5au1brmf5ztpnxmolk31NJb41kHzWPBM3kW2mMa
	2vmMafpdtWv43XOXjMa93hdEqz+oMENPTydDitG7Emg==
X-Gm-Gg: AYBFou055G9UA8NOzWMDqRIczb9ksxkm/g2DMVem/vWKRIk7/yIRgCEkylorCuDbLWS
	UIiXfg4dSMmsZ6WKQIF1KPiKZz7f5TtnkQI4+siuDr7Tmbf68tFJ2XOo4bS7HMqpoSZ3zWuASc4
	821Q/RySQY/1XpeSC3gEgZK0Xf9BIrbVK6aY3nm62ni3EFHCBGggCKsq08lvE07ZDg69kvYiYbN
	B0sjIp2he926aobhjylXkn89JmUJf+QdRYIAFhLan/8Ufp4OoBgSmSSl/4E/gsV1nM5Vbk19dzs
	Uv2TA54nahsELorlsrdwO1xW8sESNkAxDzH4bRuBdfnUPfVJ5aTxBmxK9LtjVOTc2+7R50kkutA
	e4nnRuTf1RFWEs6SWjXAkDxKWIA+PfMrt1APi7H4mlld9RCDOkvSiAC5joKEY7TSPtgx8Fy3lJR
	hZowgYSgV5MHE=
X-Received: by 2002:a05:622b:c9:20b0:55d:36cb:d2f6 with SMTP id
 d75a77b69052e-55d36cbd522mr82984791cf.8.1794934029641; Tue, 17 Nov 2026
 08:47:09 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261017094601.3434882-1-hengyul@cs.unc.edu>
In-Reply-To: <20261017094601.3434882-1-hengyul@cs.unc.edu>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Tue, 17 Nov 2026 17:46:57 +0100
X-Gm-Features: AclHuK8wmcKKsdp4Cx0Jb35BfV53xmf2JhwPHldvoPOcuRVA7GxYXeCz_kxkfRg
Message-ID: <CAJfpegtmi=SFYeX5YSq-Lch+FbkP4NszUTnnuwj9Mr9A11=eDg@mail.gmail.com>
Subject: Re: [PATCH] fuse: preserve ENOTCONN after failed initialization and disconnect
To: hengyul@cs.unc.edu
Cc: fuse-devel@lists.linux.dev, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 17 Oct 2026 at 11:46, <hengyul@cs.unc.edu> wrote:

> Record INIT failure in the channel before publishing initialized, and
> check it in fuse_get_req() after waiting for initialization and checking
> for disconnection. This preserves ECONNREFUSED for failed INIT while
> the device remains open, and restores ENOTCONN after disconnection.

Applied with minor tweaks.

Thanks,
Miklos
