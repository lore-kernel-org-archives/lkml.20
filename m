Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794577658;
	b=iCYQtaGLAMl1XkqLSb5c2Aav6ArGvV6K9Jh1MUHrYRfmde/JHAuauMT4SeZl7lvpk8cF
	 MVDZPI5jpFCKlXhxX4WFvImd710SDKRqGVLUxkz2aEq7oC7UxhSi3t3VrDxUE60LwODhl
	 nx5KxYD3Bdqt8nXH5GaFTqnaYgww/0A94wMiLL2Vt0dqkQS8qkCfoZ/3A762WAcuLXOuM
	 hHaOmEg2aMJdRy6ZpJ8J9KYK5ftXaW/GvjoonozTSw9lrMw7hFBQFDUMnpg2D7u4jvwaV
	 2ppmljw6ubtdjS6RQcoGNWjwEVfxLpZgLWhj8LckSoVZvdqtBCI1lHX6STZJqfHS6Lw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794577658;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=Uh3RNZiwQ8OEliQwz60GaSWCgjS92PjWqF45e5QPMWE=;
	b=Q9dPcOWsbB8aVgeXDvkSpwP9CHybTQfjdFyRUy2NN5qhFW0fG0XYrCQhwS5Z62mjXtze
	 N9tCb50YjvTlxGI6Diygg4Eg9grO0zVWiORDVjDNpCTXX3ki6mgxI/tk0KIhwPJURm7E+
	 ABTFe3utN/eEliC27HXfGAwhG1mBhO5PpoXmVM7sj2DJcDK4C92Bp3FQseT5TYaKWEdvY
	 li/WKiDWNl8ID4ej6CNr4ScsQthMVJQcuqCAtiipdGfFky3eo7U4SpBMGyAynVmK1Z412
	 T+MQ99bNaA/E8Xz99oVDX1FPNHN3qeRG5l/GnoOHAuQ306Su47WOLVreWA4kWYl+BXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=mChKw73R;
	arc=none smtp.remote-ip=209.85.216.69
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15BC4606A327
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 13:47:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15BC4606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=mChKw73R
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b17b31c3beso926516a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 05:47:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794577656; x=1795182456; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Uh3RNZiwQ8OEliQwz60GaSWCgjS92PjWqF45e5QPMWE=;
        b=mChKw73RMvMekalbwIWe8vJQeNvBuAqoFw9E6LWWYbcMqUuXDvVGlHTLU8n/PqxdKL
         j5K9gDqwD+/0CTMTFAtxDuqyu7cxgmBzY8Ju5hwgNLshJS4w/4lSN3SaYU3JEWz0+Xak
         da8uSjJJ10NkQfa73Hi//PBJluj78+H3S/po8W7LsqqH4uMBbF3g/iYIskDP2aKIdts9
         o7GQQLrvh2y8kGnXVLqcYJMCXCC9Jt9b8+0V65HBdYxpZFkn/ERRJ6MMZIMcrPOgV09m
         7eWINQ8gZ7gPfty3HBdvHYTcxr1IQD88TJYFrwZjM1pbJOzGg17meejlsNBHlIcEqiLo
         XdMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794577656; x=1795182456;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Uh3RNZiwQ8OEliQwz60GaSWCgjS92PjWqF45e5QPMWE=;
        b=jTif+AOOCElCJikZno+CUjEvWy4k5jGoYUmQJiSNpDFvPgAydDz1vb4as4VwkiUx/j
         RWBosA10wuQf0KemfPjjekiXGp3glUlEJiqFXuxSCi3tp9HDECX3uTeBQ51K3EenPn9K
         Ri1i/jlndusVUELWnpiU1DeEEbtLZ3hld7jUAvvMMjKg4thvOb4kbGURwftClQkEbuCn
         G7TIu8xYl/9jvUFmVW8LuemWJFAQ0ghsX/ErcT3xRqGhZXJVTRYeRWFI7XMNWdAKN4E8
         2MRSIws2XbJOHnGXRxtHqX/w81+vtuv0n2r0L3sgx8lxjP+WVx20B3Py4Gm+vFv9KAcD
         xmRg==
X-Forwarded-Encrypted: i=1; AL+hErFtYrWqxpm4pSkzhVGjFqZUfVZFGRLGVwiW+WjOqHc4Z3o3kVZof+hj4BgWQuOJi3TRAwIqwJM1BcUELmw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+XiN4CUykF6eD0H/EZy0uiUJa/KT4xbqcj0aBlAkKW39nXPtUL
	WxDPFfF3JhpidVNMLyt/vkOcqAf48SCejdItnCFcu38wmKbTwhSagILTozOQAs5+SURfHQhohd2
	UOu30AQ==
X-Received: from pjbgc19.prod.google.com ([2002:a17:90b:3113:b0:3b0:a379:b383])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4a50:b0:3a8:c0cd:57f9
 with SMTP id 98e67ed59e1d1-3b1b0a0db23mr2345964a91.25.1794577656089; Fri, 13
 Nov 2026 05:47:36 -0800 (PST)
Date: Fri, 13 Nov 2026 05:46:14 -0800
In-Reply-To: <20260922071945.693714-1-fuad.tabba@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20260922071945.693714-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <179441838666.82439.8379969006436543719.b4-ty@b4>
Subject: Re: [PATCH v2 0/2] KVM: selftests: Fix incremental build dependencies
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Oliver Upton <oupton@kernel.org>, Fuad Tabba <fuad.tabba@linux.dev>
Cc: Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	"=?UTF-8?q?Michal=20Koutn=C3=BD?=" <mkoutny@suse.com>, James Houghton <jthoughton@google.com>, Will Deacon <will@kernel.org>, 
	kvm@vger.kernel.org, kvmarm@lists.linux.dev, cgroups@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Tue, 22 Sep 2026 08:19:43 +0100, Fuad Tabba wrote:
> Changes since v1 [1]:
>   - Use FORCE for the sysreg header rule instead of duplicating the
>     generator's inputs. (Oliver)
>   - Added patch 2, the same class of bug in libcgroup.mk, found while
>     testing patch 1.
> 
> Two fixes for Makefile rules that name a directory where a file's mtime
> is what matters. The first is arm64-only: the sysreg header isn't
> regenerated on an incremental build when the sysreg table changes. The
> second is arch-independent: cgroup_util.o recompiles, and every test
> relinks, on the run after any rebuild in lib/. The two patches are
> independent.
> 
> [...]

Applied patch 1 to kvm-x86 fixes, thanks!

[1/2] KVM: selftests: Fix arm64 sysreg header dependencies
      https://github.com/kvm-x86/linux/commit/b2ddd6af0646

--
https://github.com/kvm-x86/linux/tree/next
