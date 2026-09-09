Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CDF746D2A3
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 23:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788995397; cv=pass; b=fZ5CXSWkkAoAIeHF+hWhAHfYyh3gA26i5sD0oi1cB3Te/vOHVLZZwYqA4m18ym8QoHVXAv43dIRgGjCvT96oPby2ZMMgt3HKMnokHsSr/jiyuQ5FeBloZUAJ2d1kn62eRv0ntAr2Rl2EORDc1GkudkAPTjKVezCfyUpoATmEavA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788995397; c=relaxed/simple;
	bh=HXiVsDK4HEWAyDApt+QKqpShDg89TTd7E6INOjLYEDw=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EdL7F5SPEPGgcde2wK7g52vzw/Y8lv0KPD3yXJBDDuoHDVhUKnQvmxD7gYx9E9NfqZggAAC18o3/vxMuNSahUaGWBUgALFayvKyIya5bGB993N8GRzjc3fQimtDJDHRtzU+59jl5MW7pijh6KqZOtdlSy4CoiWjhaLKU6XiRnU4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lV1fdJRX; arc=pass smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lV1fdJRX"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-90cdfbd148cso17670366d6.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 16:09:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788995395; cv=none;
        d=google.com; s=arc-20260327;
        b=AiskcR/Kq6z4N4TEpJdhQOMZFt6ZqAERERsCqwgaDha0OD0wk7S9wtBND3KUSnpwow
         Zc3hGQcI1JRDq5ot8LhP1rLQ6bhVALFWwkNFj/cS6IvepEHLjjK+ez3ajcn431aI2hoI
         7mblCpno3nixN6DQNOD72FGAY1c6+8ERt8lHrmVjkdImeiC8XW+kPw8iFQ+Rz83e4Xzm
         tB1akNMcCkKBYjFs4ef5uNfRKCAbNyEwGO4Z98A2SIcrXxOUzg32P2E+hvUDCrvfVgo5
         QMMTxR0VvvQNF3WdhktSh7DbayfNGvtSk65nL9bGthehEE9+diuTt4AfjhV6OYX7uVHI
         x6aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=ZjZMi+BrlV8AXLFB5QByJEVcIGfPTEkRQ9POMJ1s+OU=;
        fh=Lu1lCPtxgW9pK+J4umId1eDtS2oUc/wYWvFnWKUuVQ0=;
        b=dTHmkEZ8HVgFnIGvefTsKeJrxQ+6SzHe/V6h6FIeFqe0ZKJrmkF5bWuCz+XU1Un0P+
         yB5892BjE5qBCC2O+JXxJfUHVYyQ8u718Tf0O/k2UDbpF7NOnz3IbKcRy8cPHJzKeKw0
         zWQc2aaBjf+s2bU1u11CS9VYUmlhEiRZYJs+RBkjo3bhVeylYiXgyGk5Au/E7QkZyAgI
         qSAG+6HagukXfqsxNtFxu/pB8GkLE3O6oBftkHzJZHNun6AzFDYlU869Uew3wNdPzO7e
         bh1enWLWu//ERpoKpoHCVHkVQ72zkDC2/ray+nHcOL8s7wFoarBo6LpYhMXMc11MZQis
         /B0w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788995395; x=1789600195; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZjZMi+BrlV8AXLFB5QByJEVcIGfPTEkRQ9POMJ1s+OU=;
        b=lV1fdJRXzj5oB8vO/oGCDhhZaFOrCI1JxwkG9qr9BGAjjRy0k8dZnZFAd7eVxv7jBn
         1z718ozIVMKuvABYsyGTbKdZQt6wqxeepIhDmJUf55XbfbDqnzEg1O8ommCPkPdjkOC3
         ID7IRpEWavNXMahMQUyk+1AHeuogGa9XkZ0HjsRjfDedKjRF2/JVGKkNZYZMShz7Wq4Q
         9tt26zJFVumNvu5HG31qycggmSRUlbnuVwxlEQmOYUG7N13/GetnUPYsn+NdKcPo5unB
         CzvDsM90KgXNuFtee6l7+U4LZ9gNaMhVuOcPKSnvgh/papAgME9sV0p7DkQPpA8gSAMa
         +GqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788995395; x=1789600195;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZjZMi+BrlV8AXLFB5QByJEVcIGfPTEkRQ9POMJ1s+OU=;
        b=S0wYW9OH+IPTHZtYAACZKudGerE6SLFPkOpaocofo6sz03CcY9zL4olNf437oJnIaK
         4Zir45+ePWYx8C0z2UMWx0QJpTQsfM/kmf6LGBXbCwrBQgRsBb4EhGj0olfeJs0076V1
         3voBe2d+LTl6s0z3CLiMpxjhbZVRGhw11iRsTbTEonot6RobI9sMIJZX66u3tvnKfv5j
         S4PUWHdAZYlHnFjB7uAsnPMnf3yrafUfyqUEOgJESXGdbberi2v3RPNp9H67ve7VkoYy
         kNeSuGqGge2yEeW7EwyeSPEfT2HPGjiwUHvcA4fyJemFB0fJeYNwG9ZamViaTFu2lrbx
         FAsA==
X-Forwarded-Encrypted: i=1; AKwUvByaVBbiwkBKZMFGwmW8FwHf5/6ZSJiKgsmIWHyeFfzzI2njnH+HXnNRe6rR/rcGi905bPr6C/0fLamgJlA=@vger.kernel.org
X-Gm-Message-State: AFuF++nE9ezQFSHxImYUz54KBOD+SrDwL6NsTrf4Xr/xEjcLpk56hhxF
	nfwfZaBd0t6/K5FptPRmu+mMFtWcb9R0ui5gKdzIYswKoqhAoZHYVXsvkt+px2c+S/h3DoFpwRn
	XCoP5gFZ61IgCT7y/reTE9iO2sCRO8yBrTV6ubR0R
X-Gm-Gg: AYBFou1Y8ldN3I4DjZq0PxcQdvMBHGMYK5wEyVARPEcyUGEOuwjU+6s9siucZDmCrsM
	qeJCEAOxNVys+vwWp7K00k25bXMGccGexGmennNGNVPkBerFSFsJ2BPxIJmByZUx353t4bWMazb
	06Jm1nmx0l9aJxSvLY1tYTzfkVht+OkU2+JOkaQJvERNQs70QhYyvlF59p+ebCVi8enF4Pra0dp
	nYda3piNtCDzWkM07w5Xs+FObm/c5b53e1lt7qRdJGqh0iq2liXtJmV6LfsE5LcpmW3cwQKrAfo
	Rsn2JG4fH1dhqeJWaq7qtE7vmWgLL2jmifL1jeODC4KEIoXRAvk8hzD2HBDZyscpJLHUr16jHK0
	qTwudwJzvo4isMLZenJv3HTHPOSW69YEfajVrBB7M
X-Received: by 2002:a05:6214:19ed:b0:90e:9460:1c04 with SMTP id
 6a1803df08f44-9106b420805mr157144226d6.28.1788995393662; Wed, 09 Sep 2026
 16:09:53 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 9 Sep 2026 16:09:52 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 9 Sep 2026 16:09:52 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20260904004342.3162959-3-seanjc@google.com>
References: <20260904004342.3162959-1-seanjc@google.com> <20260904004342.3162959-3-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 9 Sep 2026 16:09:52 -0700
X-Gm-Features: AcwNN1UqXVvxXkiDwIUg-skUc2h6LmZIfMxUe1jAdz2H8yG8B26L0C8Xq3BTGEc
Message-ID: <CAEvNRgHQJ4YdH-SQ0v5vmwgJHfuqkSArJk4=iQA-Hu28iaLSOg@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] KVM: Use goto to handle errors during memslot preparation
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: David Hildenbrand <david@kernel.org>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Stefan Teodorescu <fane@google.com>, Dennis Tighe <dtighe@google.com>, 
	Sashiko Bot <sashiko-bot@kernel.org>, Yan Zhao <yan.y.zhao@intel.com>
Content-Type: text/plain; charset="UTF-8"

Sean Christopherson <seanjc@google.com> writes:

> Use a goto to unwind early memslot changes if preparing for a memslot
> operation fails.  This will allow moving the creation of guest_memfd
> bindings into kvm_set_memslot() without needing to copy+paste the unwind
> logic.
>
> No functional change intended.
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Reviewed-by: Ackerley Tng <ackerleytng@google.com>

>
> [...snip...]
>
