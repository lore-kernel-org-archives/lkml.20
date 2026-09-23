Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 057EB51FCA9
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 16:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790181454; cv=none; b=FzDcA2nxUlsox+lEWWLqSvtkVYGJ8M6yaEMhomug3G4rWkLe1/Dys4HZKsB//AkiZ39IJ5MuNW5pCM2mUWI3vS+OzbMxDNwLtgtdvow3OKDujoEQ2JIClX45RbsYVEi+hBRHSFSLiCB6MFPfsbmRleMonkfJjViTzOIRDCKtiLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790181454; c=relaxed/simple;
	bh=QC2cfQtOr3mgwhs8Ewza8183LqZIUPFCL0wxrCHdNlQ=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=MQ7nlavfsltsmEI8pfxtoLAlgoT+vG78zlQKlj/2/FivUcIveNKOxUzsusXEbd6YoDxhE4+vyBWJf0FTQ1BUWRduFpbp02D37rRNhTjB/Cvu6jnWxCZ0ZEPgBVJqr9PqYeldakcJz6thwwqp5IxEFOAv6aOGTxlXAh3+k9wCVc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oBq9D0Ld; arc=none smtp.client-ip=209.85.214.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oBq9D0Ld"
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cee1ec30f2so11458315ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 09:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790181443; x=1790786243; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :reply-to:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Db4OSh1pbWLsHf6Y89zz48nYvEY5ZVSH6l1sOo99aqg=;
        b=oBq9D0LdjtVIgRrqgRoeNbMRVYicZkQzViH9nvyrsNVCx9Jd8P1GRGSc8kZF9Ntj2A
         tvjwF+xJDJCa6tDfzJrc3zolQjziqAdcsyisJiUIVN7Vr8azfe6bmBi/7rQmO9XZZOw4
         rSypDh829PQOpoW3CROjqcYTAhH8slA9mv3J0k9ZQ7/UxKxBxlkSHsT/pQv/x8OMI5AU
         UGO4Z7Q7BF5caiZrwzOViHH/4eHnLjV7vlLhAw7i/Bbvrkwd2ygArulxcFH9IVoFyNBm
         L/dmEasNXqyJiosGu4h+ybbMiffZlqqQ+k2f7iapOFcmeMGvIV8v24iuOuLZK9xn0YVs
         Z2xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790181443; x=1790786243;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Db4OSh1pbWLsHf6Y89zz48nYvEY5ZVSH6l1sOo99aqg=;
        b=mSzFkptCkO1WuuA3f9bgj4llZ9m3qeAYSloiOH7Tl2g4YdlIvyW1x7wY92f9Nt4T5J
         aUcDqlZIiEr+CFct4pA20iI1qxUu8dRMPY/c2Gr9gwt1KNZGJidCoZi4LC2Z9ZXihXj1
         VYVb7wobuwW//nHJz4WzQxvyi+LAzRj6xNxnHUQJwy/mQwpSBhceynWePWcmONJ8fww3
         cN4X+OSiyVgta8mU/wg4LXGgZMSeNQk3NfQiQJs204PdpSL7qvUN7Bmsvdy/PMWgzLjJ
         v6SGC8LpLiUAKWmXIp9mdcbE3f0jruxC/SqIWj621JV9FlvVbvhz4NjXMzKMVy22dqYj
         FFpA==
X-Forwarded-Encrypted: i=1; AKwUvByugjii1CNGdjF3C8KGykWqM6YtP3Ql+Ab1JJJ2AkADBZFoHsuucTYHB+0Xwl4NWv/u9JfqRrQ0Bc14/0g=@vger.kernel.org
X-Gm-Message-State: AFuF++mWChIdzuefe3xwiQDRI/sGX1prYFOhDQDKZ5weaULYj3REb1JK
	ZPTKGetEtOC/HATQLSIH4nz4jXrYBOMfTqNsmPpSQUWUX4h/aRWe3HubRbhdakUBKvQfu+ACdBF
	hWI8nfw==
X-Received: from pltt17.prod.google.com ([2002:a17:902:d151:b0:2df:4d8a:26b7])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:fc85:b0:2dd:c053:ec74
 with SMTP id d9443c01a7336-2df69dc7525mr28181045ad.39.1790181442700; Wed, 23
 Sep 2026 09:37:22 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 23 Sep 2026 09:37:19 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260923163721.1584779-1-seanjc@google.com>
Subject: [PATCH 0/2] KVM: SEV: Fix intra-host migration cache bugs
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Stefan Teodorescu <fane@google.com>
Content-Type: text/plain; charset="UTF-8"

Fix a memory leak and a cache maintenance issue related to doing intra-host
migration on an SEV guest.  TL;DR: the source VM becomes a non-SEV guest after
intra-host migration, and so KVM fails to do the right thing because its cache
maintenance stuff keys off sev_guest().

Sean Christopherson (2):
  KVM: SEV: Free have_run_cpus during VM destruction even if VM is no
    longer SEV
  KVM: SEV: Do cache maintenance on the source VM during intra-host
    migration

 arch/x86/kvm/svm/sev.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)


base-commit: 30b5175943e709911702d8a9364145e911f57e3f
-- 
2.55.0.1082.g2b9226bbc0-goog

