Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11D384A3D5D
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 14:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789999660; cv=none; b=lfGl2SnSaOZ0mgimn5vkBgtzeP/lX/k5KHtfJIj5H1aFyvqaPf8HpgMbPF9o8pQImvt5XOUOaMmi7mdJgH7gVMxWvb56LtEOzS6iRg8ghBBaPjdMSNvc0J2yk90Zv6OYueuYaliy7422+q7eVsajcVqjjQ8+7ARAxGQ+iDYG8XY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789999660; c=relaxed/simple;
	bh=H6U+NrUZCNS3U4kbSRRX3iFdpXv+xC/rYAKOBOA7VTk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=CoDyPdSL+ehrxo51fEOdZjjfhwC3rkDeGIA/ozQ7lYwzqnSfBgHYfuAQGrjaMCQ0yszfEdlfwN5XSw/YonSV3ST+T9LcmSRPBiNIVRvQ9w0uIDSrL7DrMVZM5tYDlaEXzYQ3ZmVs1UJ/lpyfZoscT4OdxhW2k0tcEheFJ0fAyMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wSgymvSC; arc=none smtp.client-ip=209.85.214.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wSgymvSC"
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d7443e0f0bso57421145ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 07:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789999658; x=1790604458; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2AOZ0dxtbhNLe4ChlfbGRfBGQxKrpw6L19X975I6OgI=;
        b=wSgymvSCGSzFn+1174sAUEHfZDu/peAdoDs4/A0XGNTfo+I1bLVbtcghnCOOTf3Cux
         FcoroZVDR3RaURws6q5MRq4ciFhcDoNgj4d3ZDSLKfnXlVgJSL8CCBY7/qRjiSb7+cL6
         piJAxgdTRBCQZPJY28WFL+60Tzqss0wvALmi+goCeICOxytzLkUgwA4KAYZzc1vbdKFw
         frdxcN+qaDd1MplWboSGreWY4pJ+z1EYAPAAUrQh3RZr35CFbjjAKFEeSbdxpjFuszWR
         IkCGQrzQBR0hwYZD+ugtPX8Akb7PvpKI0feXaAe6y2h3gxptPaM4TPOdwJMViRFu0fpP
         b4KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789999658; x=1790604458;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2AOZ0dxtbhNLe4ChlfbGRfBGQxKrpw6L19X975I6OgI=;
        b=1aEMPsNval+DV/R8xA3TdTCkzQ2Y7KmVRt12rfhIiA1xGnzP80Uq0ai8kuAqJ8IOj1
         EkKo1ZgCSVVdowLWghid9ascyi4bzsG3vdzSUYbUUAnuhQaN9Vf6b4IcpHelQvTeARc6
         lgRpFT2RaSHCxfH/baiMnJ0TOB3fest7kAJfUxE2sAkplwLM16RIkeJmWfcnIw8Ad0aS
         W2hYF9ot9Izz4x0fyCjjlCxwKsCC2CL3TDZa5PajbU7JMFh2ZKQdWPug8ToxsWOmM+67
         44Th8X+yHJgWLeKz8nStIuVGCrid3o138FNakl7TXmy3IRsGmx7Tb7Sw7c3h/IEdw8qe
         sNKQ==
X-Forwarded-Encrypted: i=1; AKwUvBxFjPi+VS3kPFSZF351Mi0mMyuVFJ8BlwRCaS5iWQtO2VvvFeC8AR/3XIexHx1dsOIAFMk0d5GaEsyuM6k=@vger.kernel.org
X-Gm-Message-State: AFuF++mwIpyf7HtRTGpIkD8kHG5np34qIgLCjVeF3s3cXsWQJMo3RlUt
	iA8deVTYj4dSJ06bjyvoL6i+arTUAFNWVD3aYgAyaWf3gd8l8uJY1CPN8X3amOp0Gd/mhHD92+f
	/OA+ROw==
X-Received: from plg10.prod.google.com ([2002:a17:902:c24a:b0:2dd:2c40:5497])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:fc84:b0:2dd:c053:a6f3
 with SMTP id d9443c01a7336-2ddc053a789mr109068815ad.37.1789999658205; Mon, 21
 Sep 2026 07:07:38 -0700 (PDT)
Date: Mon, 21 Sep 2026 07:05:38 -0700
In-Reply-To: <20260901090839.3338955-1-nagachaithanya9911@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260901090839.3338955-1-nagachaithanya9911@gmail.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <178999929029.756055.7044021691861299387.b4-ty@google.com>
Subject: Re: [PATCH] selftests: kvm: Check calloc() return in vcpu_get_reg_list()
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Chaithanya Lagisetty <nagachaithanya9911@gmail.com>
Cc: Ackerley Tng <ackerleytng@google.com>, David Matlack <dmatlack@google.com>, 
	Oliver Upton <oupton@kernel.org>, Marc Zyngier <maz@kernel.org>, Josh Hilke <jrhilke@google.com>, 
	Wu Fei <wu.fei9@sanechips.com.cn>, Andrew Jones <ajones@ventanamicro.com>, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Tue, 01 Sep 2026 09:08:38 +0000, Chaithanya Lagisetty wrote:
> vcpu_get_reg_list() allocates reg_list with calloc() and immediately
> dereferences it via reg_list->n without checking for allocation failure,
> unlike every other allocation in this file which is guarded by
> TEST_ASSERT(). If calloc() returns NULL the test crashes with a NULL
> pointer dereference instead of a clean failure message.
> 
> Add the missing TEST_ASSERT() check.
> 
> [...]

Applied to kvm-x86 selftests, thanks!

[1/1] selftests: kvm: Check calloc() return in vcpu_get_reg_list()
      https://github.com/kvm-x86/linux/commit/b57917fc2b26

--
https://github.com/kvm-x86/linux/tree/next
