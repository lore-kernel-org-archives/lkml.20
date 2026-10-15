Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7901E409279
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 08:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792053096; cv=none; b=L/FmK1lvb0XuRW9epOr8CJF55ACc5CfG/FnrGUQ+5PuQgL/sYonyo4DDL6M/62rZS1TWe7Z/qKImSY6qVQ5rNOrBQRcK7GL7AsU87WH/XfsMzK6y619ucwxd/mypY8sQ8sma5e8xmCt39GzeKxMPxHJ95MQgCTTrVvbyYf/WMIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792053096; c=relaxed/simple;
	bh=jKkt1iNvsxHUGA5bhDGX0xwa8i7BsK3NGZi5C0TuX88=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=WaRxzxPf87yTauZg8RDkWX1VhfnMTwbQh+pXswXQRzUQJuZ0HqTBiGgGjC48CMeUqBw4qxLRUJPu+5JFX8rkfmJdLLE9Iyxioy/b8RvxIX9BH10qEAK467MsCyle4bAVdNjvEFCC5SfX6jJA7o1cLUNUsrin3SkyJqS2bYUbtgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=d9tWdK//; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=tZYxDRGR; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="d9tWdK//";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="tZYxDRGR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792053094;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=rFwbgB4b0eAbrHpOLeBLl4+Olmm9e/LTPTBUOO2whA4=;
	b=d9tWdK//oKLqGLEAqWCARKejUWSSRh1K9GU8RDsYCNhFnGr6Cmq+Qx30mO0M5A3e3K3c6u
	3mK4Tm/fJ/yo0MlsVWprdAMFqxxSM7YIdSyE3UPCyl9tT/tj5YeP4KINz4rizyUA8CP4Jq
	jcWK3BDsi6/hFUA3DtiMaCt3jWkCWdM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-596-kx4IYCo8O-CqbvDXkGvLkg-1; Thu, 15 Oct 2026 08:31:33 +0000
X-MC-Unique: kx4IYCo8O-CqbvDXkGvLkg-1
X-Mimecast-MFC-AGG-ID: kx4IYCo8O-CqbvDXkGvLkg_1792053092
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-48c415561aaso3148714f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 01:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792053092; x=1792657892; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rFwbgB4b0eAbrHpOLeBLl4+Olmm9e/LTPTBUOO2whA4=;
        b=tZYxDRGRqi580wBNHQELnLfNYH+zCGBmnaBN4kotgMSfKuYcaSi5DpUlSz0Dyu4UIk
         PUwlORUmzFnYe5WSZ1h7aI+A1g140btlYcl/C8txqZ+34z0SSfzUGa6LI13k5uaFE04w
         5k7I9gi7yURA42BFpqNABmZAXcthurcKnWK97x/oTdkFzwVOWtIWetaRCI0OSsgshx9l
         ldgTiRPwhiqxdnI3Gj+VVfA0/TBuIj6kuFDvWv6nh564JJeUaClqyOIa2TXYGbFHY1D5
         IWsnHIz7iVmzy4oAm78/Mf1ll9lx4tS1Lx4Hhuz9WMM93JBzYzxTaCNV0ERIdrUfsIhh
         q65w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792053092; x=1792657892;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=rFwbgB4b0eAbrHpOLeBLl4+Olmm9e/LTPTBUOO2whA4=;
        b=mCvSg6T4sH+fVSYji+j5eXT0FkSNEwpZtEFA9xfqCC8C3ValjvE8WvJB7oT0brW2uW
         AG8fNG4LvBDo4oHkOxQoOoEC1o8tEH8jc4+qomVtsuWegn+Tio9LHkZIeXrDHu+vGQGA
         84V6blm+1J063J93SebXRmmCd3P3cz1Y0FyRwvyeOWRQGi/+VhLP8NduhS4D1pdFOpg9
         OGs1flKCE3OfKSmmPGIlphC3Ox7d3S4xeyfQk3uEVQviTdoQaQWQlQA7LHOr+/DQtFar
         zhOxYu4vl4AZpwO0/9AVtsHtkLwS2WB0wW2z8UNk34H5LOdyq8u2zYXVJeyaNI1wLv72
         nbow==
X-Gm-Message-State: AFq9FYLOB+al8TXy51LMxEGIohPDBtTxdfIllV3bS+LglkGCUcaI1ugH
	A7iUatd3SodUrLNzWJC7R9TFdhGWM5cOYh6s4OrxJfQkGbzBSXCelGdsV38VFFzq6tQtjvvMMjP
	G6BuriAUqMDi06ohRHackwXryO8uFCNo9GhTC4eeuuRWOBuV/WQu0KzZDvk1+WP4JYVIYpKUMvU
	1H4HnaSCV7qrSSh50EFeDDOHQ5pda3wQkYRgGwaUOplC6FshqTLw==
X-Gm-Gg: AYBFou2ANX7gQ1JMd1dg3LLUFdiXc4sG6sHIM6BQobfSB4M9AquNdn36f/BQn8pZ01k
	D1rEc90eaQMHw8n2Y8x2I2qVKUnLEsbFSmnYxBg7t+jh0ALFhohu+mpM9Pkgc0AdkBqU8izBtjc
	1STRU0LMyWaVQ0x0O/Kzj+Wmo3cnc61SgIkEGR4dhy2B244UNOlAfv0UqPWDyBB6Ry5699jJsT3
	opVD1cRBZA/j06eYU2HX7yjg3QKaN6s6vf0AK9FZF9aWiSJ/GM9q2+wM6NZ/REfFvSPQioc4J8f
	xn5D2BqngK6aSwwmmFuROCqwyF+rMrBJKO7sMxxMeFcmPW/5xh7ctszdMAdJzw8VMO8EzQDAg+n
	rZNjSH/i4qDrXWjI95C1IXGXFVJAueEMUcOWH+kSJJpnq5eP8qnzj6Rd6thKgtznb1r/eJnXENC
	pZpKhs
X-Received: by 2002:a05:6000:4a14:b0:487:15a3:1cab with SMTP id ffacd0b85a97d-48dbaadb081mr34984964f8f.18.1792053091665;
        Thu, 15 Oct 2026 01:31:31 -0700 (PDT)
X-Received: by 2002:a05:6000:4a14:b0:487:15a3:1cab with SMTP id ffacd0b85a97d-48dbaadb081mr34984900f8f.18.1792053091203;
        Thu, 15 Oct 2026 01:31:31 -0700 (PDT)
Received: from [192.168.10.48] ([176.206.82.153])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48df50bd11asm3008872f8f.8.2026.10.15.01.31.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 01:31:30 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org
Subject: [PATCH 0/2] KVM: x86: Reset MMU back to the root MMU when leaving guest mode
Date: Thu, 15 Oct 2026 10:31:21 +0200
Message-ID: <20261015083123.790030-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix a bug where KVM fails to unwind vcpu->arch.mmu back to the root MMU after
leaving guest mode on a failed entry to L2 via RSM or KVM_SET_NETSED_STATE.
If KVM also frees nested state before the next entry to L1 (or maybe even
after?), trying to construct the shadow root will hit a NULL pointer deref
when trying to get vmcs12->eptp.

The only known instance of the bug is in patch 1; Sean's patch 2 avoids
the moving the reset to the place where the vCPU goes back to L1 for both
nSVM and nVMX.  However, it conflicts with pre-7.3 code due to the separation
of kvm_mmu and kvm_pagewalk; and it will also conflict with the stable-worthy
v3 of https://lore.kernel.org/kvm/20261011001303.723721-1-mlevitsk@redhat.com/,
so it will only be applied to kvm/next.

Thanks,

Paolo

Amirmohammad Eftekhar (1):
  KVM: nVMX: Reset MMU back to the root MMU if loading L2 state fails for !VM-Entry

Sean Christopherson (1):
  KVM: x86: Reset MMU back to the root MMU when leaving guest mode

 arch/x86/kvm/regs.h       | 2 ++
 arch/x86/kvm/svm/nested.c | 8 --------
 arch/x86/kvm/vmx/nested.c | 8 --------
 3 files changed, 2 insertions(+), 16 deletions(-)

-- 
2.56.0

