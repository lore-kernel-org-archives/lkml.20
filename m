Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794361009;
	b=3qy1uIm9OFOK6OxmwQ1/gFI1nzelmxqMhrUTnyet6Y3vIo/ju0J+ye2JLpSlZbWKfpPj
	 3UY6PqCOMQnIyZPK4NlLOEHaqBBduBPT/cvdq+U8pc9uc56N8tnSH/7TtvfcYRfgEqhv2
	 BvL46DPAYb6y4e2+eJ/5MJiOOYdTqFbzewXDP1a6Ko/KHFiVuGke8LsI+/aJov3JbVTmW
	 az1ee+AnpQHIdSvKojGjUpp5Gpnhoip0Ov0gVAarDaEaplKYm/bd5UF00+ArXpx35QC3M
	 PEizYo5E3B1uGofJuvA5ZNd5gyKDbPm2vc54Yh4RevPBLEViQePjor2bxccma21gDrg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794361009;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Content-Type;
	bh=mr5BgwNWNLFbzsRTVc1D1CNOKnrs91A+YQxkYBWc+cs=;
	b=5OGs82nbEay40nI2nfzK+PHbhd41IWo84FCpUy7nqlGmDnliTNMWtDtzLn7iJ845N8oB
	 9qDxm1xkmipa6zuNScmQdhCn7ekNdnFk7VKiLNVcT2J0iu4bhGByz6NoFc+sxlgO+T2ST
	 TGagaVuMF++RF9deWJiIXIl9v3vVDMpBpMoDM5kwQ8s1PT5d69mmGGq9NqFgJQ5fVmolD
	 euISgVysgab64P18O58Gg/MJboE7R0bs4MyBfUR0CxqcQt6J6BMs84kzvzzU2Nx/IFRk6
	 0/2EgrcYuZfJ/tCksnZyrDJTG2gVcCxw3j/4qOsAZGcfvNOzVuhqkZM0eJZD6+7foHw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OP7DSPyY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C98D7606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 01:36:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C98D7606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OP7DSPyY
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c4d427836e9so350182266b.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 17:36:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794361007; cv=none;
        d=google.com; s=arc-20260327;
        b=arVPbUCGg9S9CQtbHo9ZXYMmURVgntg/v0LcEZMst/ouqKKLYhHUWows4BEKPs4Zck
         VLATxg2CXSEFSSVCi8WoLMHL5MdK6kCJNqy9h3FLZa8ciu5UPL2z8vPTbXlrKVtmE91l
         L5khB5icxGIumCf3x/ZHcJtQm+xyMU3hWMNJn/fdlH7Yk8TILcre7Zp4pSEN/u9o4D2a
         aO/vq9ZPLUJX/U2NHtw4QvcqLYHrdONz+Gr9HWVtzUP7tb5V6FhkSbVPs7zrj/vX+x7O
         5AiZh9NP3isT4GDNYwYwQAYg5uBX86wNevLLhszhtuOxY854vNw/HE3bTp9EIxTQwNy5
         B9VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :dkim-signature;
        bh=mr5BgwNWNLFbzsRTVc1D1CNOKnrs91A+YQxkYBWc+cs=;
        fh=V9AeBafJgTW96HdC48wsxGAfd7Fe9P2uAL8tLCjpUN4=;
        b=YGkkDffKEb5KWPMw/z37d1QPBtCq/m4hxq2DczOu24meuQHZyaA50Ek0bMruKov11V
         xh7S6OtvZZai93+rhX4JbgXxhtpJ1DwXqrz3jLpzcKYnqAKfg1KFAyjOpsGwyt4i6J71
         zUAJ8SbkP3HLjKOcgl3+Iq+bk/9BVS5tz+SAey2D/nOBBqu0PgN1Oh+EL/BPEwN5eHtz
         uoJCrBEAKbEXwZoVMgctwrAopvaxO9Uy5cjW8vYJZnKGXhlTac19RKp3+DQgG1bcIH6k
         2xcT8k4wFyyeQ5tGRLy3hiz6nmtGwdzkxIExF9Kl83GW1wMhf+asSXXK9EFfWykpbVJB
         1OVA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794361007; x=1794965807; darn=vger.kernel.org;
        h=content-type:to:subject:message-id:date:from:reply-to:mime-version
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mr5BgwNWNLFbzsRTVc1D1CNOKnrs91A+YQxkYBWc+cs=;
        b=OP7DSPyYFl0TeMey889QUkX4OnbxR5FuqyBOize4m0R4XFEWDF6T3wgYtkCDmFwX1P
         Ela5RwuXJRtnytdvCbkC0NiCNq1r4ibVP7oOA4gCGL1SJMjFs4/0ZEi7XoZAXHKKdGeG
         4SYDkaBbanjqzo2uI6E0sf6o/1sjULndo0t5cNSYOIPg8LCfdN7Rvbd7QrvANVciOKhl
         yFJirakBDzahf9zbRiV6jixkCcYB2xn9PH9s6d1k1slyzdrS8w5YvK7TnvQQ7cnr/LR5
         +cxHBfiN+mrjjVQ7eLNW+Lhgpi41V5uRX4t6iETAnCj/wwYm9Kl4Je6d+tVGM8erHTDg
         F4Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794361007; x=1794965807;
        h=content-type:to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mr5BgwNWNLFbzsRTVc1D1CNOKnrs91A+YQxkYBWc+cs=;
        b=1QYSXsxU3V9RG4F3hdNO/Xz36DAENhaTS6l0RYC8s0pJ7nlxDUO26/UPtrYoaccVcO
         i13LDf1NPO14jAiWBJ+wH1qNHnv1x7dafVkDZzvJFHlqUVWiFtNHSdrRgt1BnYdfrH89
         tMfiyte7h2P/uM2lrvaINLZ+nwGGfyUidVKLX/mjCCP7N2gdVTC1AS4NxOqPuAOcKsWP
         LrvG6A4Lgf4837SlTj8iFleEoFrYLvo3KjtiRCkIAX8OKF0dfbA+O91voN0ixe1h0MHn
         ntBQrtpMLhiu/BrqS/vLhCjdn2Wa3F7bdwr8NQFWF4Sw3A1lysYqr83jZSzA6vtPyzQr
         h9uw==
X-Gm-Message-State: APuU4Z+L4RT1dMUbpzS025PQBjdwqO9NzQBHTw3Y3o3FKVdh5YBQXWgV
	yVVWKOBKZ1SNxVhjpoxV+e+/+uvgxFSZU0Q9rnwSud01TVZMavFbuG/bDkV0bZZYdlBE5SUHAwN
	xVepiOJj0Q5MVNVGPLZ6AdaidlgWVkDglsHh4
X-Gm-Gg: AYBFou0d9Wzjk0+sP3WPKN+xgtNkBG5DxavR+iC/+tGU4yQawFrVRI2bh4jBcoqCQVL
	RDHNTZAOPSpWh/txhuF8C/X+xsoUeD0n2c6TWcsTrZAprrNkSd9D5jOXjZw+ZMqNYgp515p0VkI
	akv7kTtsWB0pfzx/ciizCJ4h0XUIXMqIQ/cn4Q68G5xLfez86zgMaXrKJmwGyae5+oQHpjhNAil
	1DA9fJEp06UJi1WftQexz3YkH33PjIJbWXlbt8GlHOJTA7kv1VQPyls2G+E5k7Zpos4h+j1H+MG
	9cWq2x5e2Csd0ZPaVmp4NAR8cJ0GhDZ0zd2yFQsmXZpp5kwO55gFDTMdltguygYWeE7rCA52DNj
	UDApNvCZTUO3q3ORwD1DUjSWUG4nIoD/71fY8QTu5soY+CIEOWsXesV6kcFnXCMv1ghQurKjqlE
	Mpq8poH+zf4s2gN/nmLz2oCHBmsftiAKscVeIEJADZIjAUHgIVTZmRy2OKr2eZB1ny6/fvFpr5s
	Um+
X-Received: by 2002:a17:907:da2:b0:c50:51e1:c141 with SMTP id
 a640c23a62f3a-c506698966fmr52400666b.2.1794361007047; Tue, 10 Nov 2026
 17:36:47 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Reply-To: ludloff@gmail.com
From: Christian Ludloff <ludloff@gmail.com>
Date: Tue, 10 Nov 2026 17:36:35 -0800
X-Gm-Features: AclHuK8K8m_2Xlo9Qy_Ngvkv-ioW4MzU3JViz-9ud9W6njeHzxjo-t7URSbEpBE
Message-ID: <CAKSQd8X1AJ-rjkj82258Ofk_T3NLspyFzDtbyO4T8W80KzS0Bw@mail.gmail.com>
Subject: x86 VERW clarification required from AMD
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

With AMD SB-7029 refreshed by AMD SB-7073
and with AMD SB-3055 out as well, the updated
AMD TSA doc [1] continues to state that...

  "Execution of VERW at non-CPL0 will not clear
  the relevant microarchitectural data structures."

Intel doesn't seem to document such a limitation
for VERW. Can AMD please spell out how CPL3
code can transition between trusted vs untrusted
without a roundtrip through the OS or HV?

Also, if VERW is CPL-dependent, then so should
its CPUID flag, ext.21h.EAX[5], be... right?

Thanks in advance for the required clarifications!

[1] https://www.amd.com/content/dam/amd/en/documents/resources/bulletin/technical-guidance-for-mitigating-transient-scheduler-attacks.pdf

PS: That doc tries to portray 3055 as theoretical,
which it is not. Please get patched... asap.

--
C.
