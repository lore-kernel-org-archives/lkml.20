Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794577735;
	b=5sfIMvJC/XN+5zEyMZ94ulqlU2a7IoQ5BNDy1woUYiU1PNmpFicvAfFQoiLGTnGtAs6S
	 0zR2FZLkkXqI6JOagA0stwT2LvCwWkJyx6XgD+w1IMSyqAgQ9oMv3EGmR7K1fVsnhYRf7
	 6pm5/E56uQ1prelIn+WsA/0Nh3nF2eeAhsyiYkBXTgZ+hYk68ZtURRfdyS69HU3StsK2E
	 5eSOzZ3Q9sRDv3HvSSjDlN6CxsV1xuYaMRVL9AwEa95ZXSgHfY6zO8Ea0s2xTikKDz09S
	 4gjawP0luTfeo2chFEtcJ+QMRDjObgYDyQ6A4bd1eSUN4UFKtQK50jGQNOtNJ41H/4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794577735;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=f0mqUtjmtEKSM7QtosFwn7r3CB9yvkOYXENOb7wxAHc=;
	b=p1UMBdfoZoOIkf5n5jsZGRVotz0vJ/8sc1RoBPqR9Q7MaveakQrG5YhzjLzOyJFLwquC
	 JLeMb3kGt6HJP6Y6aKB5Q9iwyknpRphTYdtVJDekqkzKmAbs3nYbh5UzIXI6gPVqJQft3
	 ovWH0upYeubO3XHbdbMORpEox708upMo4ZxrHGNrWJT+28hgUvgd4fbH75MR9UILcj2Ze
	 kx+dguX3uoCmsFrBF/O8fYPCrZ1+nGysCXBSjvFTQbyOnxaw2lXWchE/rggssXWlkmi1n
	 PW6gfK6//Y44w8KxHaE5yGAyb9u7/JrXxo3oeMMLh8n+gJXuTiU6jFddJgZV8KzkaLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=NKzQN7o1;
	arc=none smtp.remote-ip=209.85.214.198
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38C86606A32D
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 13:48:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38C86606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=NKzQN7o1
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ea71803effso9426655ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 05:48:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794577735; x=1795182535; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f0mqUtjmtEKSM7QtosFwn7r3CB9yvkOYXENOb7wxAHc=;
        b=NKzQN7o1hq+eIgmzDRPEQXoBCBAb2DfPn1hLe1z5l/Zxra+wGxUmLA1nDviibkWXKv
         VfGm92w1nunOEygWaMWOGDlaMKEgUUP5TGvIywezSPmUlXFwdy3BncVSYXJ5nsTxgYgc
         pMaXlcQjRP7usGzcp6SG0GMQ4daQ76KB3fQslN+P1Kn/fOtAzDrmUmh4YelmtP4UWY3l
         ZFLpKb+RevlsEWhHkwqPXfUE/AKzbu5o0TAbU8XJRBEt9QRbDZ5/pRNRMYQYSBEtHSSa
         br3TUUrRFDxSKbWR2LUdgCUvI7PImGenUWSnh4UfUgT5uGIrrWTubqs9coPO4C3fr9KE
         /kuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794577735; x=1795182535;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f0mqUtjmtEKSM7QtosFwn7r3CB9yvkOYXENOb7wxAHc=;
        b=ATf+2fAqNsRWtOlYVUgjEfwJwgznu2LM3GAIeJRsIxUDlfCwntiX12mYnollclQSy4
         kaQ/IwFZpDpkH2FQZZKnAbIxFGdPe5tEhcQ9+rYoZD4iYuAcZ+PicZPFVQY0hd8GLs3J
         nEThsw7DaNdVt4iy3ZJ3dvwWJ3oBkST0hVqOo4ScRU+hnewfHpJnGM4G9MAxzPcps/0L
         bzGjh8vtNWmMOFwmPLKafR8avfGZlCKfk3LeDvasAPvpL6Ujea4lRJ3m9Jc1VkGOzUqn
         0sFQkdGNLDtYL0OC6VYIqS6m2fGShtmpOVFC/RlQ9hD/KmCxBt1I/K5z6Av+JzjribjV
         s3zA==
X-Forwarded-Encrypted: i=1; AL+hErFDCFivjCOt4y1N3X/+ca3hza2quwqX9t7Jxl/72a7iPVTc++ARFkPKOMJ72Zzto7VfY8QF+Etcv52TRlc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+DPk/dpGBccbxzF1UGi0L5Q9/hMwrx4emqwDnOc9muF4MCgRdq
	yGm9cK7IDWxGSKFNe9vfCKezrzEqH7yZiG71LPnykFZH4spDl5MKS6JIiikXhtPkQX+rf2zFdym
	qOF3HHw==
X-Received: from plka4.prod.google.com ([2002:a17:903:f84:b0:2e8:18c6:a093])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:2cf:b0:2dd:ad73:5b68
 with SMTP id d9443c01a7336-2ee0dc933admr24674335ad.24.1794577734295; Fri, 13
 Nov 2026 05:48:54 -0800 (PST)
Date: Fri, 13 Nov 2026 05:46:32 -0800
In-Reply-To: <20261105000127.63664-1-griffoul@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261105000127.63664-1-griffoul@gmail.com>
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <179441817184.79877.1477945347866691080.b4-ty@b4>
Subject: Re: [PATCH v2 0/2] KVM: Allocate small memslot metadata with kvzalloc()
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Fred Griffoul <griffoul@gmail.com>
Cc: Mushahid Hussain <hmushi@amazon.co.uk>, nh-open-source@amazon.com, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Thu, 05 Nov 2026 00:01:25 +0000, Fred Griffoul wrote:
> From: Fred Griffoul <fgriffo@amazon.co.uk>
> 
> __vcalloc() makes every memslot metadata allocation at least one page,
> so small memslots waste most of their lpage_info and dirty bitmap, and
> memslots below 512 GiB waste most of a page on their 1 GiB lpage_info.
> Mushahid's patch [1] switched those arrays to kvcalloc(), and Sean
> suggested dedicated helpers for memslot metadata with a pivot that makes
> sense for KVM instead [2].
> 
> [...]

Applied to kvm-x86 generic, thanks!

[1/2] KVM: Add helpers to allocate memslot metadata
      https://github.com/kvm-x86/linux/commit/bd0ac62e682f
[2/2] KVM: Use kvzalloc() for memslot metadata that fits in a slab bucket
      https://github.com/kvm-x86/linux/commit/7a6d1004c2c5

--
https://github.com/kvm-x86/linux/tree/next
