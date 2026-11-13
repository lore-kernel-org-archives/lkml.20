Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794577825;
	b=Z6YCugCV3IYOZX8xkRovtZhYCoHbASaOSbY3ehp8/535y3O0jXCxy6FQUgRz8XRRro2C
	 dpGQDmm/yV0WqTQMRvLa/e1pXYbt/8G/WJcjHU2IhCb/QiUKIu3L/7Xfc7hOiLqWfRHk0
	 Y058gz20XaDQJjjhMoQh5xZ37wyMk7K3wSgtq7Kc+ep1ck7ILp0StoiLguJSlXlZDfMsr
	 G+FZ6GBICZ9WwGul5hetLhRQaK44GrrVDRx5u/wIV21a3coqhpPV2OuXpNCHtuseWY+E2
	 QcbDA2KWNPewkuDhgPPhMAwvzU4GAyLMg0iYTovTo9dGni8TTVkIb8AAYlEkXWOXgYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794577825;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=Zqxp8I5tFMzdgWo41Sp5SqieihB7XXuPvOoZVDMQ8Uo=;
	b=5GyF64RYjAHwcqxKfGuDmse52wItyKno7JSMPV/kzMOsTXos6bIBvPw2H+eSl/BeI9WP
	 hMFcYwfabr0gaV0jVMmp8AhvjDvUbNo1BXa0kZM1BTSAzjV3wleaoqomSJzqdrnTR+XPb
	 zZFO3naiE6jx/L7zEHt590yVhowVMblv2mFWnfLmXNh8bqKcGr+3mfZZ/00L7VuqDQ1Wd
	 cXyEkJsEtC60SZlq1Y6gdhLuSnz2S7tDtxn7dylf9ShKJ876LZ3lR1vm007XfeIrhwrQd
	 EhcsJleBO5smqDHL4ehckUCSOxrVY090viNG2lDSjtV8Uo13YL1jUeny1MWJCrxen5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=lUTG+q5X;
	arc=none smtp.remote-ip=209.85.216.70
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B647660A260C
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 13:50:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B647660A260C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=lUTG+q5X
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b07b06027eso1374229a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 05:50:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794577824; x=1795182624; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zqxp8I5tFMzdgWo41Sp5SqieihB7XXuPvOoZVDMQ8Uo=;
        b=lUTG+q5XI2MbQizU4uwiiAtAgyxFq9jqb1nNLCQ4ABT8K/of110pEqsw45kldSobU3
         hUeo0mqy7S6d99KSGMX3p7yIwBFkpdKmi+s1HIJsecVqHqKr24Zd7i5MB5gxYkDQQlN0
         61GHtDIdgOdg6IrtkR2hAgBCFEzOyE0r+CS9pKgc+XTETvrlLlDhf6JepZxYEB6v2bjq
         UiDjgfinC2q3pkT+ihsPR5TWCRJSz8Sh0KF3aVBT4/GhRNTkQQB1BG4BhQwt+FiOrW4e
         Y9wfwb4DjWJldkYGUA6U5DSTItcYh8k+pfE7b+Vo7GxYGUgtR5skyh2l6USA337axdOV
         JEUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794577824; x=1795182624;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zqxp8I5tFMzdgWo41Sp5SqieihB7XXuPvOoZVDMQ8Uo=;
        b=TT6FJaJ/Rlhz1SUARJ9idY50LnYW9WGSTNP1W22qcgGstXyrbOF3//+8Z1YXi2UVBY
         W7VliprbMvsnLwR+KuWaUf6jukOswsLvW+D0Zy6D2EAcPMia3q6ImrhPe2NGYvk2CXyM
         WoMHNiCH3KFxZLFgdLoSdn0gtaAgZTdLb0LOpBCpetdswDt4sTC5db3EeFB8sOxAvLcB
         oYXRQiz9xDwRuJEmsr0veVuTon6MsqsaqUCA0FDoVWBNnODIL+TsowZZsL7ikjvsaT/F
         ph9zif1TtgmNczfPMNURHW3dox3CK7TFBs9DnCBrbzHAa80rUlQFmWGQ6URV0D9zbHGQ
         PBkA==
X-Forwarded-Encrypted: i=1; AL+hErHvgD1dP+Rb3v7L0Bi6TnASic8uwPxvDL7AhDWqqoFHljFCT1u2HX9V9Me74ED737TzZumDGI/Re1Cu0xs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+khvlgdyi1kTL3GC51sKUam1+MRlQO+8tvZo51W45M0ADQEctn
	umlNICvpvyV5ZAU6W9mlGh8JOVsQv8k/dWx0ns3r18cZ8zNH6aEuCHCePaxGPT5Am0Y6eVcn1zS
	9tYlYHQ==
X-Received: from pjblk18.prod.google.com ([2002:a17:90b:33d2:b0:3b0:b36b:66fb])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4acb:b0:3a4:f75d:d194
 with SMTP id 98e67ed59e1d1-3b1b0a20d40mr2509161a91.36.1794577823926; Fri, 13
 Nov 2026 05:50:23 -0800 (PST)
Date: Fri, 13 Nov 2026 05:46:54 -0800
In-Reply-To: <20261022193808.557206-1-seanjc@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261022193808.557206-1-seanjc@google.com>
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <179441775604.76179.10722589436007929167.b4-ty@b4>
Subject: Re: [PATCH] KVM: x86: Ratelimit all I/O APIC and local APIC kernel
 log messages
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Chris Mason <mason@kernel.org>, Amirmohammad Eftekhar <amirmohammad.eftekhar@cispa.de>, 
	Josef Bacik <josef@toxicpanda.com>
Content-Type: text/plain; charset="utf-8"

On Thu, 22 Oct 2026 12:38:08 -0700, Sean Christopherson wrote:
> Ratelimit all of the kernel messages in the APIC code, as every single one
> can be triggered at will by the guest.
> 
> Opportunistically use the more modern APIs so that the messages are run
> through pr_fmt(), i.e. get prefixed with KVM's name and info.
> 
> 
> [...]

Applied to kvm-x86 misc, thanks!

[1/1] KVM: x86: Ratelimit all I/O APIC and local APIC kernel log messages
      https://github.com/kvm-x86/linux/commit/48f7e6d7ef7f

--
https://github.com/kvm-x86/linux/tree/next
