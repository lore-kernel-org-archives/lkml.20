Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A9284B7A24
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 15:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790006351; cv=none; b=RfCfOb/AWbL60Qtj0X70JzNMm/HYmicX5kTb25CBdqrp5dD1I685UBb4HTLmEZXj9eWJfmhE+CKKdKUhGhTnRqn7ktOCpRTlPwIl/uKrPzX93f0fRvNwFsJrHtjRPFtSSZHSzFouaz7ZVg4GEH6pUz/KAp0fP8Hg1xSwHqL+zyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790006351; c=relaxed/simple;
	bh=+vA8+IlTPzIJ3kiWyLjpPWr5FYWusu29ap2ccVZ0Mqk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=JV36fv1D+HDBN2RgYZWHgtjVTNQzKtlGkmf5fpsE8ExyPMHq0000tvs7eI6e57QAQXdmh/ycWMaYJB/SgVA3+DtuBCmnbjrHUMLtcy8H/rL8BO30Cp26uLWf/endbIztWnO1hiE9owVPng68zM373cmoytsJqe3aJ8s6ioRD23s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Izxp9gw9; arc=none smtp.client-ip=209.85.210.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Izxp9gw9"
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-86a880e91f0so5589969b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 08:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790006349; x=1790611149; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HCdnP4avwYqil1ySzLR4xj2VYr6SB0X0kTKdhPBlqMQ=;
        b=Izxp9gw9Br1S7Rt72cnEKozTKjk72m7OMp+1S0HabFE3hATlzwCM6el4DXOKh5mneC
         sGhz3v37soysyqGI+81vuZdKqYS7UPxWj859Eh4NFwjwFFuNLHd1hg8+u2j1r97XP13O
         Jd5OKalzoeyfU8moGvbpvyQFlBqfQYTBrLFcjs2girjN0clfGZ8YIx6wFpwAXqfqMpEs
         vNJvFBqKrFGeY+PKQd3lk3Ztw5av5NqhfA/zwoAAu48DpJtPwOEh/ucj/1ADP2MkesZw
         1dvg20bnmDfO3Q9qUFnE4BRCjdTeI6Tj5MNi338ndjLeZjSMukgnjww2IaXjVCGP0dxt
         dNlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790006349; x=1790611149;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HCdnP4avwYqil1ySzLR4xj2VYr6SB0X0kTKdhPBlqMQ=;
        b=e1IyDpOdLsbXk3H9ACH/A2oPxC5earq1twrFfMXwf/hs0HwVZVXIVHZjp6YvJ8w2qY
         4dGFJ88mxk7Wp7rStBgO/S71WN7r9oZL2u76fCoS/19ZliI9h9ytxlAfD2BAoVIq0ofr
         NBlhefXi2QQ1Tjg9PZMJ/EnmBJmE0+MPO/LSVYnR2/PJEF8JatyB+kCiZvvBj/AOeTjZ
         HjvwiUN6jzflFRcs8twX2EdDJg/mR7Kgq088A28/p5dNPmpKAhwPTEq32kpm/Dl5aRCr
         HMbbQrxnfkso3IxM37J8xhEJVh1ctV9b3YwMLBFzWfsEwp2vqqeyhE1goz29BgWW30CN
         6oVQ==
X-Gm-Message-State: AFuF++kpljTYTBCg6Z+NTFa5aKyXZvFFqS5qss/mAtQjmmy+27l+DXRX
	gm4iUIJsqE6VxFDKvifKoAhtkMvEnlOfELR8clyeHPHrc62UsCAcusfCGDPvCspLPcE3XXB3Mzi
	MWuRsjA==
X-Received: from pfqn14.prod.google.com ([2002:aa7:984e:0:b0:86d:2ec3:d4c8])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:1a8b:b0:848:4754:28e5
 with SMTP id d2e1a72fcca58-874dd6fef50mr15682186b3a.16.1790006349330; Mon, 21
 Sep 2026 08:59:09 -0700 (PDT)
Date: Mon, 21 Sep 2026 08:59:08 -0700
In-Reply-To: <20260824012716.753022-3-dongli.zhang@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260824012716.753022-1-dongli.zhang@oracle.com> <20260824012716.753022-3-dongli.zhang@oracle.com>
Message-ID: <arFUTBLuLdVVaqxX@google.com>
Subject: Re: [PATCH RFC 2/2] sched/core: Defer preempted remote vCPU task
 clock updates
From: Sean Christopherson <seanjc@google.com>
To: Dongli Zhang <dongli.zhang@oracle.com>
Cc: linux-kernel@vger.kernel.org, kvm@vger.kernel.org, pbonzini@redhat.com, 
	peterz@infradead.org, juri.lelli@redhat.com, vincent.guittot@linaro.org, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com, 
	dwmw2@infradead.org, joe.jin@oracle.com
Content-Type: text/plain; charset="us-ascii"

On Sun, Aug 23, 2026, Dongli Zhang wrote:
> A remote update of a runqueue can advance rq->clock while the owner
> vCPU is still preempted by the host. KVM publishes the matching stealtime
> when the vCPU is about to re-enter the guest, so the remote CPU can
> otherwise charge the stolen interval to rq->clock_task.
> 
> Defer clock_task updates made by a remote CPU while the owner vCPU is
> reported preempted. Fold the deferred delta back into the next update
> that can proceed so IRQ and steal accounting process it together.
> 
> This requires the hypervisor to publish up-to-date stealtime before
> clearing the preempted data.

What happens if the hypervisor doesn't do that?  Because it's infeasible to
guarantee this will never run on an older version of KVM.
