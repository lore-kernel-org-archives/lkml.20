Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794577904;
	b=vFNYzbRGvV2qjsa2K3W0XJwsPWb6haPkcCrsoWDjHtotmMdSS+/F0VCv9Pjn88daYWPA
	 II8XoL0blqYdOC1fQFe1LkLKj49fPrPnG0b2WKjnRZCIxF073PteXAo5Zvo0QQsRV721W
	 GPH9sRE+jgvd/aQVbunwrXx7HL3lrBAnJ0JzIiOa+OHV+9w2CT0ZynuBWpacWXi4NYwUi
	 0mP9hhPf6omArIUv0qjEAsHnuMP2hssqeYFQzBZfUVeRMvWbcfF9VaEGm5iqUFEomGivm
	 rB7hIgK9J7imiVjDyUr/TBm4D7Kjh3NVfAwWFOeEnPT/rCBQKiZtLa2bMJVpWIYwU/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794577904;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=YIE8VEJYRWhCkJWvyEOnnndUa73C0JCVATcw0I8ubTo=;
	b=Ik7XGZeGlfHQTaKHvRzIiLM1ZaRsik/LzGuLananMXEVlVZwbxgtYgZZomWla5u23nwV
	 kC5vSpCP18up4YZCt2Lj8m92uBCuxzLF0YM8zgToICBWqEJ74dr+zmSekaisVIKKhcHNR
	 0n2/CkP2zGMy4IEA/5aicMuIcJ/bdleP0njuvpJPRCcOohJKARjfk6/KMdHXcjQzjZG/j
	 VAfQXFe5Z2wukRmkbWI4KFc0QqV54uHMsY+nTHjpAA34GCrpzvEfj+MG8EgH6kujfzwDm
	 NFIFXMEBrNY0qvIdnVXLKvxdpvww/mU6XUNDcIevl/Nt/AacapPxZWFVuMIDLmHQ0ZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=G5AOpCbs;
	arc=none smtp.remote-ip=209.85.215.200
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04A86606A883
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 13:51:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04A86606A883
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=G5AOpCbs
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc1ca15334cso1265157a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 05:51:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794577903; x=1795182703; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YIE8VEJYRWhCkJWvyEOnnndUa73C0JCVATcw0I8ubTo=;
        b=G5AOpCbsvqSC0G/XXSEz2mlVfpHDPTAa3AQVgyRQVA821CP1OX91YR4+/31qMc+Qej
         ZOWeNWEwR4tvJmMFOcybT6Qme9WagyxLzgcKibgtAOBqwNytG3jSvk7O46mMKSH6I+97
         QizErgeXDq8BBp9fxprG6NR2JgrEi9/RnB7c8L1Qn55ZB+T0uCOKF0TKFxnFicSwCvgA
         j95IUBFcLHFo/dMcJDEm9fAthQmBHet3jZ/kuYftJ6k+M2IZvXr8ZLFueFC5nx7wpiAU
         6zMHuHDe7zfNzVJ8XrgLDpEV4MGae2W/bAnglHO5nh9Vd12bXQCTw+S8J/jeuGV23Elx
         13RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794577903; x=1795182703;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YIE8VEJYRWhCkJWvyEOnnndUa73C0JCVATcw0I8ubTo=;
        b=Hofme8GgzkB+KhbVITX4WkuVm/1PcbNivrKZO6aLRG1IXwrB4qXI4sUadH3i+EIoZc
         rfm83hQsdMWzy64sSz1790A2K1dynmtASEu+wgmNJUaJNg3XIC/1WUPjyxTwoE4JKiCX
         ZBOT/Jr9Hz4rcWiXwtrIgNtpgJVOuQCJHioSIk4vhMGdObKmWG4NGwCaEKW9pTR0NuX/
         0URX+qAr9XYtA7c5iBLA72fekZjMQptnpm9tKUsC5VI3TqmjDm6OnasurrKYoo//rAA5
         ti+24G0sPR8W7NUDiONaoMDulDq4cI2NO4WtLnwGVbdWDhy9z75VgbLJ66dlUWLmQ2iN
         A0AQ==
X-Forwarded-Encrypted: i=1; AL+hErHGIFfnLjhbu6GbpMLLs3pKrS/Vq5uUReU9MOPz5OPHFtjqyVQuG3cKjQznZ3FohdKRmF8Mn3sKOdBTwrA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8C22R1/1jEhAF7Fr0R5i3KoA0F0mIV3I80LJTh2ODqQKHI76rJ
	hUdXvSoj7YpEzV+wnxcr6MmAYO3MXJYVOQGIN4j4WNccxpxt1lIplJbtrTlQ6n2lb7U5PA89qg8
	OnGqylg==
X-Received: from pfik12.prod.google.com ([2002:aa7:820c:0:b0:89f:41ff:99c0])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:4eaa:b0:3e2:8c23:4db3
 with SMTP id adf61e73a8af0-3f7a1fb906fmr2565211637.0.1794577903175; Fri, 13
 Nov 2026 05:51:43 -0800 (PST)
Date: Fri, 13 Nov 2026 05:47:16 -0800
In-Reply-To: <20261105223000.3036448-1-jmattson@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261105223000.3036448-1-jmattson@google.com>
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <179441815559.79553.11044729914453170233.b4-ty@b4>
Subject: Re: [PATCH] KVM: nSVM: Mark all of vmcb01 dirty when restoring nested state
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Jim Mattson <jmattson@google.com>
Cc: Yosry Ahmed <yosry@kernel.org>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Thu, 05 Nov 2026 14:30:00 -0800, Jim Mattson wrote:
> When restoring a vCPU in guest mode via KVM_SET_NESTED_STATE,
> svm_copy_vmrun_state() updates L1's save state in vmcb01->save directly.
> Stale clean bits may result in the loss of these updates.
> 
> Mark all of vmcb01 dirty after svm_copy_vmrun_state() in
> svm_set_nested_state() (cf. svm_leave_smm()).
> 
> [...]

Applied to kvm-x86 svm, thanks!

[1/1] KVM: nSVM: Mark all of vmcb01 dirty when restoring nested state
      https://github.com/kvm-x86/linux/commit/69a4ba37c75b

--
https://github.com/kvm-x86/linux/tree/next
