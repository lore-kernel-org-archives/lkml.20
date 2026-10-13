Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2117E5226A3
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 15:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791907133; cv=none; b=oRayNyh7PhTT9q/KMuoVBuqaNd871zjY5wy+SEVYgd8AuLmb+1IIUmC4itV+FMTbM4imA2gP+QUPcj2P7sEpDhu/+a6gIPiq1T6Rf+yl/VtsTF/GihGztPlUwERWonrg9YoEmomgtAI0My+EyQWVZe85q058rUoJJCEQiW4fveo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791907133; c=relaxed/simple;
	bh=we7GQLW48ewpf7gL0yHQpSstUw9okwSRbE2uUcRtOAs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=oY91fMeQ11EL9/Fn7+yhLw8xJ0I1ltCtYHe+4tPjhPb7InoB7yBD1mVwguezjz6EYrohCLJW41+siwToX6EMGzEGKDNAGhBZQFqerugfq6qvQv3H7mmECknVwy/14SqBOn/9hVJDTmzY27rpHLePPLik7DTLv56g1dtc8cxLA9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OXZcinze; arc=none smtp.client-ip=209.85.216.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OXZcinze"
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ab2395f104so2908959a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 08:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791907131; x=1792511931; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0CcaGc7x43Lmmf57o9kW270RkoQygwK0STsr2qKvChI=;
        b=OXZcinzenbp3yyjpFxI7UiRWX6paM5ixDafNOUwSar+Ce3wVOp7EmRpF3JK3qHode1
         VWXjSyhh+BwY6dYSDpGmzMysAu+A53Com65dLkJKS0vCyDJ6pXxTFrAnAk9ibUHTLHNx
         jTp4mtto8tf2/unqgIgaJkmyBORQNIzBMQwee95gYrC2Q6RDp41t+aooIG8pj1wHWwd1
         +Z2LJvSHbYn8GGSbidxR6GcIRkboUZsuMvJLJZZ35j00f1xyP0gW/lToN66l3ZbbTqg8
         G+LXlBGt1P0miyvQea49eyWvuiatpNuLKtP4hfoqwNpihynmfBvgfkOV9VQGdz6th8BD
         RGag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791907131; x=1792511931;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0CcaGc7x43Lmmf57o9kW270RkoQygwK0STsr2qKvChI=;
        b=Hi8SDy+381z2l4XSGZkgOCUc7up4xGSYp0CJCdLVrSs134HXuHNcuCApvOpomWa05e
         fYeXidmfT5EqaWJjcySu97Y37ID5GvUehlWweh0EbET65BRkjqiqSAIc7vYCTvx9O+aS
         fe7vSFvn1Q+DG/529z4oFcouznK8p4SZQj7rbLWr/wFxjZ5S4BsLutuMeuqWpp2OH/jI
         2mXCeBdJBiJ0i7/wQ5yHNdgVoCpe1trTSeSbw9MLDf2p19oH42vUoPyREjuMzVU5jfj5
         FdsGZcVqziZoMtzMW8uJfF3u3p7UzUWWnvQiymkyebWsN4zd0WSAPtDuNOHpvl+xcEji
         cEAA==
X-Forwarded-Encrypted: i=1; AKwUvBy4X2lKWBggFWIdqP0p0uZIH+64CdbB9KPQB8/ATTZ7LEjzpmsdLmczTPz8HOHA/HZTbXs+mbnRYwScPMU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIqJ7wDm3FuQ5yzMnKoAlopukR1PdFaDNwzLlxPGBmQw6A0uaM6
	zQDO8MNCFrA7lVK16hsTv9vigiB8X4tDzHIB0FRuvGL7mJNC7qdcII/V1KOZYWjfm1/Q0EuN5ix
	+nsjdmw==
X-Received: from pjbbt14.prod.google.com ([2002:a17:90a:f00e:b0:3aa:fddd:36cc])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:d44d:b0:3a0:b312:1fbe
 with SMTP id 98e67ed59e1d1-3ab3a911731mr10196421a91.23.1791907131101; Tue, 13
 Oct 2026 08:58:51 -0700 (PDT)
Date: Tue, 13 Oct 2026 08:58:50 -0700
In-Reply-To: <d0d23c2b-493a-40f2-839e-45d8e1d9d833@open-hieco.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1790171702.git.zhang_wei@open-hieco.net>
 <b614e927c6c1ce9265cb9a37b296b0b30598da72.1790171702.git.zhang_wei@open-hieco.net>
 <CALMp9eT1qMk7V7=md68LEXvmWH5ecj1YBn-YHoQ-vzJziaP5VA@mail.gmail.com>
 <ec1fb2e5-87c5-443f-9bd6-6983b96f63d7@open-hieco.net> <d0d23c2b-493a-40f2-839e-45d8e1d9d833@open-hieco.net>
Message-ID: <as5VOtJ6sItowUnt@google.com>
Subject: Re: [PATCH v8 5/8] KVM: nSVM: Fetch DecodeAssist bytes for
 synthesized faults
From: Sean Christopherson <seanjc@google.com>
To: Tina Zhang <zhang_wei@open-hieco.net>
Cc: Jim Mattson <jmattson@google.com>, kvm@vger.kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, zhouyanjing@hygon.cn, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Tue, Oct 13, 2026, Tina Zhang wrote:
> Hi Sean,
> 
> Just a gentle ping on this. I'd appreciate your thoughts when you have a
> chance.

This is on my TODO list, but it will be at least a week before I get to it (merge
window and other horrors).  Sorry :-(
