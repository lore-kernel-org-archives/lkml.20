Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95ABD196C7C
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 00:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791504252; cv=pass; b=N/QLoa7nxUtkyac5yf3mDXVPl7xowV4Z6kvWyo558RFlp15nOcWWX4g51Tqt3fr0JkDammxqQRr19+hemlgIW9LzsKhY0PG98zNqGOwOkyCP07KVeW/LTOVkqgM4ee69N43WurkphqX+HrkJmQ9NdNxVZhkeNB8DiZ+Ij5n/aYE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791504252; c=relaxed/simple;
	bh=AfAyWJyoYAUZVrBF2564jVEKZBur8MkqHqXOz3xZdYU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nV8pYpSM+vfSRFxgwQIgh8neIgKAafwy9Ax3ZAeTbfTvsd/mALBkwNjtiiXF20nk66rdvqIsTlxg+OcOrbWjIBdTNEpO1zrAE5Mnvp2gZdqrNnx3E4YUA/ubolAJeRU/flMxS1GOl7Qemb1f+76xv9xTHb37p42XrO1HMTBIQ2Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ia/X0uxF; arc=pass smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ia/X0uxF"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-8ac8a2ac52bso13698817b3.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 17:04:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791504249; cv=none;
        d=google.com; s=arc-20260327;
        b=pYVfzK95V05w2MvzqimQOtfyw189TRRn7J5BSK9ZqM+s0hLX3aaQAIj/yfg5hv31e+
         m58rCzI4kRyD1JWoZCMVx/7HTudcVGqhex1iXRoj5+Yb414AmI27zF/5H7mluX0jchYw
         OAJkeqTDr5ap4y4pXk83mT7dyu60QZQpPoDdvDcJuGIf5qsjbTVtmxWB6O8g6B/kyvA+
         2HkRmtYnG+pC1z48CcEN4XigZju9uUATXL7AQmOJnSQE9FKEetr//Y9LQBOQI0JU+tKB
         hjROgjUQpY+6KkIwzkfKIVjIxrjl1Pvfbb5jInYJgMNcMStm/Ca9iOrn7XXGiGo6gcO6
         TyZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=AfAyWJyoYAUZVrBF2564jVEKZBur8MkqHqXOz3xZdYU=;
        fh=cxbqdHoOF67wSAgCK50KZkCpU/3VMa4Ig2QXgd+oTzc=;
        b=TnUdoQH2p2mlm/t6y6e1M693QshBvARm/vv0gMAC3s/pjykq/SJgIs89xVbxbP5jC4
         ld6ZWLma7CqrCeXU70cnfyz7crUrXOZYDrLKDrADxk5skZBraLXOZAK4EHJ2IPHR3L+b
         h/x4Jz2AZsPcTicdx+hZauX14H9sBKGKqG7tQh9BFhiVycdLrg9G1qWkLRFvEpAY8L48
         8fp2jOJ6xKnod+RtjEiUMnd07m+/PzPOMXxZcULI0VWmt6ZrakISZ/tFZx3DEnoL8FnZ
         M7uG+CDJMn6cfi15KWUgK4Y5rhzouqJGBO0stTLywn5puKOoLsG6udWbtgrF6SFNWskh
         KPrg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791504249; x=1792109049; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AfAyWJyoYAUZVrBF2564jVEKZBur8MkqHqXOz3xZdYU=;
        b=ia/X0uxFWVCQZ5IfG4zyznkuQyXElpZendI0w6PgZG//UbUlIGaRaUp+0yptuuImP2
         PhDNMxGy2vIM6ZN9t/NWyShU6m4CHIGO80P8ftB3miCUIb92NH0PJPtV8+FqKRLbT3fv
         OjCzcabjz5u9v/tx5vWCgk2SLuqSCWyemHzf90r5jMfqlL+SXsn8kTePbRsN9fNV2MML
         eV9Nubf1d0SeqeJ6pJ+t4r1DlTBBURr7a6uipR8EHTKKXxt+IUkvYcJWXmFVlfIHev1z
         k1ZzpW70X06ccpzkpjWRh0VAd8IjjnPGVGbi4d5nRHDSYKP/iMaERPz3boDBCs415ft/
         ZujA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791504249; x=1792109049;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AfAyWJyoYAUZVrBF2564jVEKZBur8MkqHqXOz3xZdYU=;
        b=AX2D7o/VHQ7Ovv889Kk3JqNBIIUkaoUuwyUE0j3glRNOCWxOlhqnvNVvRbTeCCl2z4
         L/nbfw8AQWhlGsX7sgWyLIg6Ti06FkHMHYMmusI3+/fbEey4a1+QJU4jrbXoOXIxFEMK
         f0JPtJib0ck2G2KDn2TPZ5W0+nvFvYInhnGnbR/HePuZRgqbgWkb0+xT4rCU7umBdrin
         I1ZmFrc82jHIT0TFbvs+WrzaNuMOYVTmoIZPgEQviyCIYdiPgBm/WA+9WCjBCDhUbmuo
         sGSWw2aidJYMEyC+OVUTCBcQrmeY3irYXM44bDmb2SXtznkB8rP+TpNiBBpbSY8k2o2t
         yrNg==
X-Forwarded-Encrypted: i=1; AKwUvBx2do1og9PY+9tNq7sZXqU1Vb+9u3DjNlPvXwN/rVFaVjwSMColDSFTFTYz2O9YLI5VCAnYutDO+OdmgMs=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ64/+nSzrpIKEwpwD+d3XYj8fxovo3VKLTbM/805ZAHKFBdEGv
	uTLdl1Q3di37XGWQS9NK3eUUxVAtcqqgqz7hk6h9yBqcJfh3SVMG96sWVo7sE3gd+XAPUeQ9T75
	4O29EIdNuUO0iGwHVE6elnrpUWW9XREY=
X-Gm-Gg: AYBFou2DAAYGXrQhFjJv8w1qSYamFjXL2pnbA+9Q7YeVOt5CKxQEvraESOIOsOUECk/
	Vr7Hf/wrZhYEoIlCXWXwaPyDa43eI4bZrlN5r1JN3QlhF56is67Z9APs2nrGWUswlzx7V7yR37g
	corzqe9njfjLVLD6JlO2GFcHdt+is0E+EQCYtAMh83F079gwzoMMHLKkuvZJR+Sn9nEae9DFdQ6
	S9MHkE3fKGzwFFJJaqyKfJvfPW0gyxBwZQBn5PRtBsbrmUK6rPdMG4cwQXUrT+SbST6EkGjZwCD
	DvWigSnMMfFNbkK7jVc+GRBsAH2fGPLUknaJQCLaL2OG7Clg2nMzdADzDQFz8y9wJX/fIseu6Ot
	BHVjmlkKjZA==
X-Received: by 2002:a05:690c:6e81:b0:8ad:7131:9178 with SMTP id
 00721157ae682-8b07d3bee19mr2337247b3.12.1791504249249; Thu, 08 Oct 2026
 17:04:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261008-apple-m3-m4-kvm-v1-0-7bb4cbf3d63b@gmail.com>
 <20261008-apple-m3-m4-kvm-v1-2-7bb4cbf3d63b@gmail.com> <86cxtk2utm.wl-maz@kernel.org>
In-Reply-To: <86cxtk2utm.wl-maz@kernel.org>
From: Michael Reeves <michael.reeves077@gmail.com>
Date: Fri, 9 Oct 2026 11:03:57 +1100
X-Gm-Features: AclHuK9Ag9bDa5bK4MghchktXbtliwMAsOllt0WW00_OPCRuwhkusEjtb_E3AmA
Message-ID: <CANpmGNv4uYRLALMLKZn-HJwTiqJO90Fx23DOO7K7d-PfSWn=2w@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: Apply existing Apple CPU workarounds to M3 and M4
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Myria Sarvay <myrialsarvay@gmail.com>, Yureka Lilian <yureka@cyberchaos.dev>, 
	Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
	Neal Gompa <neal@gompa.dev>, asahi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marc,

> How have you established that these CPUs suffer from the same SEIS
> erratum? I'm all for working around bugs, but I'd like to make sure
> the new fancy stuff is indeed just as broken as the old shit...

We tested both the PMU and SEIS fixes together (as in 7.3, both fixes were
combined into just the one apple_cpu list). It's probably a good idea to test
them in isolation, thanks.

> For the record, the EDKII build in the QEMU EFI package that was in
> part of Debian Bullseye was able to trigger the bug semi reliably
> (series of writes to ICC_EOIR1_EL1 for interrupts that were never
> active). This happens on handover to the guest kernel.
>
> I can provide the binary (and a few scripts) to test this easily.
> Should they have been fixed, we can always create a second
> implementation list to cover the PMU.

Can you please send that so we can try? That would be much
appreciated, thank you.

Thanks,
Michael
