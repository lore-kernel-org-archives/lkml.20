Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A1264A3859
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 14:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789999705; cv=none; b=Wul2Tn47tOUtv3WW/UsUtPnLprLMSmbXLgooTvepXQtmz0yOKTH+m5Bt2jC/03aM6HEWhNIIYobAuOjkRGXQxYxE1zuejHB3H6PQz28KrL3CvmVPmAkI2YK9/mqUlQtPtxZhkUSYrzj0PPYisQsmmN4e/aC8QUAI/YziUXxk3GQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789999705; c=relaxed/simple;
	bh=TZMnz7ku1/ePw0ebbk7Wd6bOXLwjoKtgzxrRD05Oi18=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=UHDZBQGSvIAIg7aYOvaN7EVxDZIH/GIlyuX+CPhMcqDzy+LU2RZ5thAgICD/APN44EdUS+Lbg9f0iZZO8rsv4k2muIzPh290rRGxEC79FL+lJhIWJFntZ9pKcsTBybiaWZm9/6V2xy4qMPvUlOZNiU4cqqOloG0d2b6HzbtwyIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ie5jv8bW; arc=none smtp.client-ip=209.85.215.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ie5jv8bW"
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc21bc2923fso2752379a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 07:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789999703; x=1790604503; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LpDeX/VcrhnhgWepYxfQ0Bp/j8e4mQHpDLPbBx0bCIM=;
        b=ie5jv8bW7Pg15J1/vCSQiiJPLfSm9G0boQis21Psb0c1lSBbZBhyHZIKaHO8N25Ous
         eZzxxXgyDQ/J66FERakYMFWo0GPEcIF6yuLSZCVvb/0ACEBk2aCVKpU5cl4URxa/H7u5
         eyQpM9xxed7I8GYSW3WrmefSlhBvwk+7rMxHa7oHnCDDFULg1gHu8QYenY+2WCRrObIy
         WS+CU0y5zLqYR1gmv5ddLMYVdCJ7I1usg7mkQw8QNN9ijStsnVYE2QKbp6p6n9TNkwfg
         HManh+Q8DYqx3l9/OG9wpmjfnHedMFpGem06kHO9Vlf955xaOXx5v60YHLoOf8uduY5I
         VP7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789999703; x=1790604503;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LpDeX/VcrhnhgWepYxfQ0Bp/j8e4mQHpDLPbBx0bCIM=;
        b=EkLOG5R6zTERATcc9hJkKZ4xz6kniwVZkEm/AAaPnr+HscrEQkd7FHrv3/yKzew8ej
         vGgqcEMXSKf/WTNkGhFDlfjZQvFnAkKLQQQQ0glcZYCJ9NM8S5C2EBUYecTcl6IztW39
         PP/vzvkR7lJckbEvIOf+jp66QHAk1cbh0D44XchM8DN+WCvai7qj0Hes+HjzGQNkX34z
         hHDGX2oo8D/Ampnzy/ncWxfeyPj0C52zWh0lShs5lbnCM3Py5g81NtezcoyTU9b+9fTV
         ALTLIpJOFxoCEKtu96r7Aim4lM9OKInBb6Ns53i7CKJzSCRxwDw2dcbLiY18uDKtBjcn
         tv0A==
X-Forwarded-Encrypted: i=1; AKwUvBz6PDAOm3ZUKPvlc5irfbdl5mDMLsjSSHRyFTL/kKApQkPF/y5W0bD6c45qvVw2jESi7pcqrEpo00lwuys=@vger.kernel.org
X-Gm-Message-State: AFuF++nVY6TjRKrbsoZuQOrqplJVuSZ1NFyiJTzZaYD9gRbepq5qswvH
	5ul6rugRiXnkdoJrrnZbdaNcoRl5FMReER1hk1EbBar7hRctv8J4zqhXge6U4Bzs74AXDQINcjt
	1+0D9xg==
X-Received: from pgvn3.prod.google.com ([2002:a65:63c3:0:b0:cc5:e56:eab1])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:c989:b0:3d1:c99f:efbf
 with SMTP id adf61e73a8af0-3dd8c43822fmr17321793637.14.1789999703053; Mon, 21
 Sep 2026 07:08:23 -0700 (PDT)
Date: Mon, 21 Sep 2026 07:05:50 -0700
In-Reply-To: <20260908053722.3917934-1-nagachaithanya9911@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260908053722.3917934-1-nagachaithanya9911@gmail.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <178999686416.714128.15872429933837531722.b4-ty@google.com>
Subject: Re: [PATCH] x86/svm: Avoid sign extension of SVM_EVTINJ_VALID in
 64-bit expressions
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Chaithanya Lagisetty <nagachaithanya9911@gmail.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H . Peter Anvin" <hpa@zytor.com>, Joerg Roedel <jroedel@suse.de>, Melody Wang <huibo.wang@amd.com>, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Tue, 08 Sep 2026 05:37:22 +0000, Chaithanya Lagisetty wrote:
> SVM_EVTINJ_VALID is defined as (1 << 31), i.e. as an int with the sign
> bit set. Whenever it is used in a 64-bit expression the int is sign
> extended, so bits 63:32 end up set as well. Two 64-bit users are
> affected.
> 
> verify_exception_info() uses the macro as a mask against a 64-bit value
> when it sanity checks hypervisor supplied exception information:
> 
> [...]

Applied to kvm-x86 svm, thanks!

[1/1] x86/svm: Avoid sign extension of SVM_EVTINJ_VALID in 64-bit expressions
      https://github.com/kvm-x86/linux/commit/c5991239b148

--
https://github.com/kvm-x86/linux/tree/next
