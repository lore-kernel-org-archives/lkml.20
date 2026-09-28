Received: from mail-oa2-f13.google.com (mail-oa2-f13.google.com [74.125.231.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61F414BB815
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 13:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790603065; cv=none; b=JACNZPwylbbJtBF4TdiJw0WJ/1jw/xk5q7ZSzoVABBuV6aJ8e8zSJAk22z0EVJTw2AziH3qy/VFKwtCFfgHc3qHKya4UMly6xf3CQJSwe0NLKokl3tTxuAX7MNUa+Zrc17CsybarvORuENmvM1lx4e1Xqut5HWdLsxyfOmcEx0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790603065; c=relaxed/simple;
	bh=GovrrZN3cHyF7Si62BejyKGqmJUiVqEeTzDNhyu+l7I=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References; b=eu5flDrSwrKdKW1N7RE8MSA56wYF0WJa+xPlIXYyuKpBVWNqi6W8rMOYtxNpCg4dQaTGORDHwakmcMk2ag3rqNsnOyESXx6HPC5dargLReZS50O0pfCudMc83pGUqL/iq6FlaBIdwpXsoJMrQGZfRgcNnTxswC6gP31TXB3pSVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I1mrqWpK; arc=none smtp.client-ip=74.125.231.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I1mrqWpK"
Received: by mail-oa2-f13.google.com with SMTP id 586e51a60fabf-46ac6e5d8f7so1409966fac.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 06:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790603062; x=1791207862; darn=vger.kernel.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=OqSWB16/v2nKqaGPKDp/hMATqYQmRiJplxi26oO8Rsc=;
        b=I1mrqWpKIyYVHM2mopl6yYRHDwrulVZbbF6uu3h5rKDvIeTItVCmKw5AUiOksIuCfQ
         eFEUqz9ZPvzm1t6cQ/NINZilvbKt8uqX5cHtlvg3qznVv0vk0pXDf7/rxVUap6WzWVx9
         5w1nMpOt2dG8Ms/7S8ssDdYopIlSJRCDyb7XTLK30Fvp+212CsfCzaDDfqKqI5iGR1sz
         HFEf0np+OBbXMTBffRsQoGMqYLs9q7HYQkHQWGT1mwrv2MVkVG7TBtSSkFUzk/6QkMIB
         IguvbvIKZishggAu3DEMhsJ6IZlDBCfCBg4PIqzpbXLYEiXEdsnnW70ZQUy54y+A6/Jh
         9pmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790603062; x=1791207862;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OqSWB16/v2nKqaGPKDp/hMATqYQmRiJplxi26oO8Rsc=;
        b=SM0PF3XYIzWT090go+TJPMxvWlnabs/hrJZR+dL6nXvZsatwobImYkG/ay+L5d2TFw
         PS8s7QJTIRBqDPSbwlNSqL7Z9mSPStsd3+00JyM+EwIm0tH3yCg000AMbbszhOLrIwMW
         vZK5lsa2cxVcyCzt05auh2966eV3V2qQah/0pAa9sZPY16RGkl4ZWlmuh85XeYxh6EsB
         zfe4PIbyWv+VsAXjP5thpcXSkiQBVPvYlb4aWSi2TeTdE+s9NmJJVkceu9/KX4/CineC
         qawwpj5DWM97YEt2SfCa+vV+H6uFbXgxqxJlAnv4Z7CtD2zd8W9bepr5dEcyz37ij9xO
         Ezeg==
X-Forwarded-Encrypted: i=1; AKwUvBxuJjXwi8K6DFyhzjSsEOKESKBGWHDZgmIVLzjrRP/WpSFwxZNWB88ThWPwG/plHG2lxlqgJbthCT9FsMM=@vger.kernel.org
X-Gm-Message-State: AFuF++kG+LGgCfrLAwDAl7zGWUz2hD8sHjX1XHwrb+UD4wOAAE8jzAc0
	FLB4qHfuHLU2rVgo4nzX9pHTwaB+HhVRlE1NmYg1nMjeQiKKQ0lUKDWp
X-Gm-Gg: AYBFou2awq4t0a61B+fpzS6nwOlta0jK+yiQe7Hxw8PsXy9H5TxJN3xXLiI5POUzA+a
	2tSkkFmfQ5/pzndlnqtMWNi2EfgWyQp3CQj81AwNMnRK6SVCusnir29gYdBpLfoT6FQPZfuneBt
	LyWdluYZo9Ioqjv3aIr3NxZf/gKa+23pJA3dIQwkKEw2Bbpk4ocb9siWoeHeS38RFfkaYHzCQDw
	d0mo+acL1HBt2A/JIVh70S3/s8vIsHvmUeE0usp9/8nEs2GSjN5rkvlhiSHVLAfT6j2vJ1OhpWm
	Cs5m0CeSKNevJyQEcYKUhcdIBfEJKxk3OEBNWO7DqTGtrDGxU69cM2R49V8mNvQDmJyO1V0Kn2M
	h4eJVim0kIiNbKiG+MTROwirov8874Tgx5jP5aBRLA1m8pQCTZXeRPsIZtfOWpRBfrwVqmBtk6W
	s+NTzn4lFGUqvYcCV44HV/8UO8oz+HAfH8CFveiirDI42wA+Bbu5IOBoOBECJWkvbnMNXRx+JoE
	PdQeiAddGoZRplzhaMktYa/kj00VmOF93ikbJ2EEV9yBAHn5FYFtQ==
X-Received: by 2002:a05:6871:eb03:b0:48f:e0f6:c46a with SMTP id 586e51a60fabf-49358a317cfmr9008681fac.56.1790603062123;
        Mon, 28 Sep 2026 06:44:22 -0700 (PDT)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-493356565b6sm10053356fac.9.2026.09.28.06.44.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 06:44:21 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Amit Machhiwal <amachhiw@linux.ibm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: Amit Machhiwal <amachhiw@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Shrikanth Hegde <sshegde@linux.ibm.com>, kvm-ppc@vger.kernel.org, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, Gautam Menghani <gautam@linux.ibm.com>, Harsh Prateek Bora <harshpb@linux.ibm.com>, R Nageswara Sastry <rnsastry@linux.ibm.com>, Alexander Graf <agraf@suse.de>, linux-hardening@vger.kernel.org, stable@vger.kernel.org, Avi Kivity <avi@redhat.com>
Subject: Re: [RESEND PATCH 2/3] KVM: PPC: Book3S HV: Add preempt_disable() around virtual-mode HPTE bit-lock users
In-Reply-To: <20260928122837.8782-3-amachhiw@linux.ibm.com>
Date: Mon, 28 Sep 2026 19:12:53 +0530
Message-ID: <tsn9jxuq.ritesh.list@gmail.com>
References: <20260928122837.8782-1-amachhiw@linux.ibm.com> <20260928122837.8782-3-amachhiw@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Amit Machhiwal <amachhiw@linux.ibm.com> writes:

> kvmppc_hv_find_lock_hpte() requires virtual-mode callers to run with
> preemption disabled, because it can return with HPTE_V_HVLOCK still held
> until the caller later unlocks the HPTE.  Existing virtual-mode callers
> in book3s_64_mmu_hv.c already follow that rule.
>

That make sense. LGTM. Please feel free to add:
Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>

