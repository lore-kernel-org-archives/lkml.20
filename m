Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AC7137BE70
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 18:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788373224; cv=none; b=W7xCdHOWPmndc5BiSutrZBdK0G4G8g78CAbudm1pgU0Dg3cNjcLYU+0t/m3ZSG2vhafKo9wLx3sWRIMStcRqRuRBpaRojRJ1YEMIkvYcnx95c7dX1/7kf+nqktuY27dvkhVzpBGVd31dy0WUUfmTfHISSw/v/m2ZVZlfFK2cCKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788373224; c=relaxed/simple;
	bh=PDljbmVAmHmBFdz2B3yDzPAMdq4slY8O0Urg+YWiVAE=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=b4a1t1xjf88g4zbNdUGaYrDGqizkKQZawbrCOBgIti86aopI0tOsWJm7SBtsyhkFHticYLXR/nehOTUhEc66AUCwZFWF/VsEIzerltNx57X4dcY2mtuY5a3o3imOfnvx5yZ/RKDvMzOWNDBek+pYXWbQ7kKJTGnv0XzA8zjMRpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Zs+U8dK3; arc=none smtp.client-ip=209.85.210.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Zs+U8dK3"
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8553305b7c7so1128000b3a.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 11:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788373222; x=1788978022; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :reply-to:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RmaVMPSCKzZBNuIatghtEdi40/dchReDiEo53AEsCnw=;
        b=Zs+U8dK3P8J4Ez2XqXatsSBi/b8kVdXyYp72PQeu8MZltceINWKULjIIj3Nda6Grq+
         8xw48Z00AvSgkynZhlSYEFagN5UvsB2JG5UuPANLWDu8CsplACY4BQsWW04Kz4f5aV9f
         wq2FGVcNBBIwH9JznL3UbNUdN7migHbZp/CNmtiJSKFGa9K1IeFrZHzxVALuyxrYuEqh
         ioQcSdx5Y+78nQ5ex9SHfukhMJMZGNj2isxf1aV6Trn1doq+O+tPPGlgjiFiZ3VXQjEM
         /nB8juNMNcFemyL99uU/xgdz1/0EjzWRo+EuSlLP6oR8uxv6iiSaSurZuzxRpGxT7jKH
         e96w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788373222; x=1788978022;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=RmaVMPSCKzZBNuIatghtEdi40/dchReDiEo53AEsCnw=;
        b=YAOgpqVK3WyOK0xDkt6Pitup8x0pWXwOkukI4vuomHcszD3m5A8Hs7RV6FOLErL48P
         T76J3IcWOtoa8RiQtZdRmJZs/bchHdCArPyvrOEqhVb75noQmXvvfv+4Pe92IpYtfsXt
         jxqs8LguXopLmBTWd8QQrn6r8LuWTLe7nFKDyEn5HS3GFGth0M7oEQc+zRpQXbyZmIaT
         Y4rVaLTMEbvIbP3pwzgNNSmkkcKW/rRtiFQvh5BZbdpr0JmEtizLNsCQn266i1ySObtS
         jGriiJQpWx022kV7ABqkBAWaPeOkgbhsP5qMxEHoqL54YvLS+uxhUJ4unQjmsgf5bQmf
         IbxQ==
X-Forwarded-Encrypted: i=1; AKwUvBzM9Hw9/6MvLy7ZsxAUx/g2j+OHHLNVNy27CL5R6xAMtOW0SOEZFyMe45dkzN3lroPhtvyyBzBBoL93B/I=@vger.kernel.org
X-Gm-Message-State: AFuF++l8PVngxiB4icqLOGbssisyp3bGL2wZjxxFlTDiHfdS72wimqjp
	dMNdygL5W2PIWQWucI47kNaem330zIY97mTrV63CAJq4XwWgdXDl/rHqXZQGurynomylJW0o8Vr
	UXWnsXw==
X-Received: from pfwp50.prod.google.com ([2002:a05:6a00:26f2:b0:848:2e0e:62e])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:600a:b0:857:7317:cff5
 with SMTP id d2e1a72fcca58-85ed4a290b3mr11036107b3a.22.1788373222222; Wed, 02
 Sep 2026 11:20:22 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed,  2 Sep 2026 11:20:16 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.970.g62bdec98f9-goog
Message-ID: <20260902182020.2615443-1-seanjc@google.com>
Subject: [PATCH v2 0/4] KVM: guest_memfd: Fix binding bugs
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: David Hildenbrand <david@kernel.org>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Stefan Teodorescu <fane@google.com>, Dennis Tighe <dtighe@google.com>, 
	Sashiko Bot <sashiko-bot@kernel.org>, Yan Zhao <yan.y.zhao@intel.com>
Content-Type: text/plain; charset="UTF-8"

Fix guest_memfd bugs related to binding to a memslot:

 - Handle errors when inserting into guest_memfd's binding xarray, e.g. to
   do the right thing on ENOMEM.

 - Bind a memslot only once the memslot is fully prepared (because it becomes
   reachable/visible once its inserted into gmem's bindings arraxy).

Patch 4 is a related cleanup to remove a superflous WRITE_ONCE() (unwinding
the slot update on insertion failure isn't an option if the slot is observable,
i.e. if the WRITE_ONCE() is actually necessary).

v2:
 - Fix the binding-too-early bug. [Sashiko]
 - Explicitly zero the bindings entry on failure to ensure there are no
   partial entries. [Sashiko]

v1: https://lore.kernel.org/all/20260826165154.766699-2-seanjc@google.com

Sean Christopherson (4):
  KVM: guest_memfd: Gracefully handle xarray errors when binding a
    memslot
  KVM: Use goto to handle errors during memslot preparation
  KVM: guest_memfd: Establish memslot<=>guest_memfd bindings *after*
    memslot is ready
  KVM: guest_memfd: Drop superfluous WRITE_ONCE() when binding a memslot

 virt/kvm/guest_memfd.c | 16 +++++++++--
 virt/kvm/kvm_main.c    | 63 +++++++++++++++++++++++++-----------------
 2 files changed, 50 insertions(+), 29 deletions(-)


base-commit: 76671054f9a1ff6abb976583cd8da37650acdc97
-- 
2.55.0.970.g62bdec98f9-goog

