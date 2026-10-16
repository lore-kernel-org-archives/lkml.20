Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E50A70808
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 04:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792125858; cv=none; b=C/U86o7AmWH5KRzlfHS6x75XmhAweVkJ1YVQ58KG5OJpxocfxPQTtsg4FQ4gR2pyktQDCTs1deJVgznBMq81mlQP4/f23xi+2iCYwooMVHqiaGYK8paSLhlEKIy9oFMXDt08OlCSAdrLUIkBubgkLuwflqH7F4qnsSSRZMkx3KM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792125858; c=relaxed/simple;
	bh=qijEVR3ZfwMQmmtpsAvdV+g1DfB4sbwoHiaGcv+TK9w=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=dUAkf4Iog2Aee/V8fVywIKvuEx2WebiGBFfKNG5/eugYy0Wo7CdRHk03XwvG9WNjB6sCS/aKN2NU2SNjDUiYp2Yvdz9T2mIEWtP1YYlXhwOdz60Ix/nOoax+uP9yyp+pquT1fCfdgVWztC5wkbHJ+KmWCuvAFsXdiAe4kGxdcUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DddqOVVg; arc=none smtp.client-ip=209.85.214.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DddqOVVg"
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cfa4e4684bso40743615ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 21:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792125857; x=1792730657; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :reply-to:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tmAk3Oh+oKVK8d5pqejtpcee3315xk02eIJBQpRYvbg=;
        b=DddqOVVgIez38+yBkuwS5Nw5kVK9UUbJB6IsdY+0j0oi+C78EkWVrpMvLDKF0jiref
         QJNPcUVUqM2/lzxtCEHJt+IRVpd8LCjcYWS23iCPML2NCJJOhrZjuurGQJVMu5+/rOIn
         +eDLWIBNdvIkZLJ1rNT3VJHWIxhwRqumX+jxHxMBmaC2XJS/BCCSvkYV4kHesqTxaOto
         yNvTncCb+pU4sJO/ByKWaY8zktx70c7UzcvU8HSof6GttU48oRNl5H+vs9nPYbPpxAS0
         /KcuQLryBn2rS7A1NMqeoP8yU5SMHZy4H0KS7NCWCyyhWh1H6Udr1vhMNSVo2WH7m762
         FgjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792125857; x=1792730657;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tmAk3Oh+oKVK8d5pqejtpcee3315xk02eIJBQpRYvbg=;
        b=oaFV8/QFOdP4/bl+L9vy147q+BOEw+aiqufRQvjq2u+sMxAW6uLDFXzTD5hE27wSFf
         6117jTmyOc4dt5J1ogdgOVS5dTNT/z2XMylh+Rmpyssotw1n1Cva1QJHJplYRVVitUiQ
         A9ATYl8fxrwedpkb4DYnhOjs1wqnWCZkhKl91jB+2OKXgvJzpRycmSdPQnEx2gEWQvW/
         3IgyLv2IVe6XokGcYzbxo0mp7kcyy3CuSoPv3L7WIZ7Im7RNYSkjs2LhQdF08pn+50UJ
         rTMfyt5Ph8QbJW2t3Uso7ECDKcf9sBWqIVmSQ1rYi/9jvpWwrfKP8Yf/Rr1avpDsDGWK
         hQ4w==
X-Forwarded-Encrypted: i=1; AKwUvBwVK2iivnqGYho/g8B3FHGJgZF32bRdPbn9ble51muOnnqtSKEzI+lrABVa9ZShSykDTTz62S2ELP7Drqs=@vger.kernel.org
X-Gm-Message-State: AFq9FYJGmfAOCG5OfYFBluvGlNdvR3jF+ZuqhOvkpuS4gRDk8SmcGeWx
	tJKPPaTCb3g8FayO1qRuVjlF7J6EzC6pyVNJKi2SLBVXDwCAw8aq2LknqqFtazRQbN+sUprzJ3r
	PxBifZA==
X-Received: from plu15.prod.google.com ([2002:a17:903:368f:b0:2e5:d262:2f9a])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:2f92:b0:2e5:98d7:8202
 with SMTP id d9443c01a7336-2e842cd44b8mr191901645ad.13.1792125856508; Thu, 15
 Oct 2026 21:44:16 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 15 Oct 2026 21:44:05 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.176.g3575e65682-goog
Message-ID: <20261016044415.958618-1-seanjc@google.com>
Subject: [GIT PULL] KVM: x86: Pull requests for 7.4
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="UTF-8"

This cycle is "fun", only the "mmu" and "svm" requests escaped without a conflict
or some other notable mess.  That said, I don't think there's anything particularly
thorny to deal with, just a lot of minor stuff.  Details in the individual pull
requests.

My apologies for not getting the guest_memfd in-place conversion changes sent
along sooner.  I really wanted to get you a pull request around 7.3-rc4, but we
simply could get the code ready in time.
