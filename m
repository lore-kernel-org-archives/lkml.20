Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DEDE48D869
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 11:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791371624; cv=pass; b=i/Df4oDBzglErTFc8arq/2uIZ/Gg5U2XDkdT7XagHYcJB22LLELx8FUEtySDcVFJOQIGZ/+r/QJk14OalHThiKPOGcr8det7/C+oeHNHh4lYLY0IGmwxFpel8hP6cewD5MrYdu3PvfLAuU8/mHp4gL6Bi/WBvhClrTgS8hH45+k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791371624; c=relaxed/simple;
	bh=f+RisWKCQLZOEfrvNgEfr/uIKD0wCzcM3ghzQdvYe+U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QMdx0407k1iizdMNWQKF/PwWBMzLyL5c4z72ew5N/rO4j+nobZ0MDWx77V++c57b++DI7se6+sadn4+Wi0kMO8vTFqsBMRZ11ITenYs69gtWcF7Br969UcqMWGEmyqmVQBidsTc2Id1mXLNHNkXWW74+ol9h/Y5HfOu2hORtBfQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NhFllpbc; arc=pass smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NhFllpbc"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5ba40832934so5797e87.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 04:13:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791371607; cv=none;
        d=google.com; s=arc-20260327;
        b=fTK4qwlQayG2ML6U9S7h6Vhs63IjxCThw1w0reCl9FcThLVsvHNvP9/oJRSU1jq4dF
         KLzj0xouHrcmoInC+Kb0li8ytn85YVh7xoTd6qun7desWqCC/i3wwo9K0avA2sfvLABM
         C9L/IeSKuq4N+SEsECPkkXs0dVGFtD+xA7fbg41y0FNnZBUoImJ4ixlb78qXAhdLp+sf
         lskm8hNTn6yFcMHw1tD5CXroN4VqBuA8rcL072DqAtJwst9TaK3v2WkLuWV3Xgzg3ZGZ
         tXJv4QWMB0cY2P3lPvXzh6CbWbgE9SPLgKexWJ4xpjCPF2pcuOMa76SnUS88QS2KAUZb
         8WrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=f+RisWKCQLZOEfrvNgEfr/uIKD0wCzcM3ghzQdvYe+U=;
        fh=b7Yzs9Ku2yaIpOjwVL7SNseQw8XocGLqGvPWU9ymtYc=;
        b=kU5eYJdRbQ65Nb5Z6tDhWjwuDYkdMN5GWFSntjn8wAegDZ2YDJURBpfLU6hteUWolQ
         BRq5O4TUFVqKw+pVQ+KB+eJ+E/oc4Wx2GsOn8vRVol5UNRhs2/pssfhcr5IOO7kc+t06
         lhgplrve9Rj3j1NM+3RBiC30XaAIUqYFkPU79hX//FLgYs8wf4BXp6u6Aat7DkzashBy
         NASfU7w25sBMJAvip6O5IYRiP1bDK3OeOgkFFF28uQxveliSeszzFAJ0DTY839zhlAJQ
         fQIq9kmBt1rBRaVgsjauub+/iOkqc/NKEuWETiJNZPBQXdCxVaMdFF+9lhDMrfoMGKaS
         /pdA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791371607; x=1791976407; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f+RisWKCQLZOEfrvNgEfr/uIKD0wCzcM3ghzQdvYe+U=;
        b=NhFllpbc6WrYCF0igkisKJuq2Lg0cbsTJIr/8fVrq8iA10QcPgskFHhSCeSBgX3Uxx
         Y2AvzOxqrDOxAO213eZtroAy7qWAxuj5mPiuOWTIZdrioPHXXXi5JR1Dl/OBrcAFh780
         B8WzJ2TljWUi25aVaPyJ6pEJLmQ0XAGp1tV2c0yqG2OPkel4fw6rRzZj/nqOEzPpoexe
         OkVhQ392gwTOwWXlbCDnjyldDiKnc6gYU4UhBH+5iGAWsHkpvFRGZUyo7X7HQ+o/qmB6
         M6C6osC7gfiq5sBXXNk/klD3cofVsQtfF0HHNk0S64VM0GihxJF2eSOg/1/SYyNRwdEM
         2EhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791371607; x=1791976407;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=f+RisWKCQLZOEfrvNgEfr/uIKD0wCzcM3ghzQdvYe+U=;
        b=wqlUYOtOfsI749q2EQJkm/6POz70AxvF0DFldLjVnqyXvJIftDObVszjWVHSo0A3Z6
         0mbiGPLB8E92EItKBOtnFqcogzCGaqar7aTicuNZijXsaaE/0lh0yex1bw8M9ah1GCkC
         K2RgX1rbo3e0Ir1em79A75ORkfOeWwIx5bUbX5nLRQlkD84HdqcPZlhEH1rr1flmFEKk
         n2LtVhvyey/JUEVEQRA2vIuhxvmDSZ7KBuNdrIe2q5xcNusM+nc8XFKKTc5qPWt0f782
         XqA4aC2B2tynYI40ROPLsHQV5SkwhgrQnNDr+wnrBX8UTgKbtV/0OUzvswfBGanUkK/Z
         Oxkw==
X-Forwarded-Encrypted: i=1; AKwUvBzcACirJxPMJN5xrw29piVdyKqNlk/AWCI+QDqIPN7JdRuhirqKmevLmlyJjecHGtw7v85iEfvFq7EOPeE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLA2pbhxsPfoT9xmAeHDtPoE4F0fVG08tXl5Y6lhC4ZxCpTmDDy
	VmPn4X5gv49ogitIs7zzEjnQHL6/WKCh3uewJ11Am1eccFG3kwZVlgDNkwnB2+MC84mJYWKF/zi
	ALQQ8Di4dmajAd/H1avvMFuxaMPWx54UxrX/ZMiFQ
X-Gm-Gg: AYBFou1VOFvyhVM8XI2t2gTrZOmTo1ljk6+5v+KHfH8q36m0saRW3oqunzsocH4iaSt
	kXPm/2hiuZ3FAQhKCeI4NGe10yZOPBa34QGXWz+MRFabqqTcsuqrLG7QVNiD8vOeMChVUMIkjS2
	DLFhDyKPzl3/KIHz+XvetSEtLm3z6phcJLU0qVEYup4U4cWkh7hAEwWh/EC31SSzDlAyKEjaP/t
	7TlqMecKDIDhnmd3f2ibBzwbcsB6W8B8R7xG06y6jpS2cVxSItC2DUFxQ098cJ+ODizfVs4quBy
	P7hdPnXq8K1s1QyPTNl95TZIP/i66UyLKbRGOxKjI+gto/sJiyHnoq4pM5szx2/eYg==
X-Received: by 2002:a05:6512:135b:b0:5b8:f142:cf3 with SMTP id
 2adb3069b0e04-5bcca65b3acmr273089e87.11.1791371606791; Wed, 07 Oct 2026
 04:13:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261007073537.2454351-1-suzuki.poulose@arm.com> <20261007073537.2454351-8-suzuki.poulose@arm.com>
In-Reply-To: <20261007073537.2454351-8-suzuki.poulose@arm.com>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 7 Oct 2026 13:12:50 +0200
X-Gm-Features: AclHuK8WLpu77qQsvdg4MDduFoR68Hrl6zUyd6Su64I0GC1JFRH6-dZAB7pnQNs
Message-ID: <CA+EHjTy2WuCui_O8sYXviCmgLQfZ-j-jOBQqRY9NOXzMGQ5k+Q@mail.gmail.com>
Subject: Re: [PATCH v23 07/14] KVM: arm64: Refactor the vcpu_load to allow for
 VM specific callbacks
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org, 
	will@kernel.org, catalin.marinas@arm.com, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, steven.price@arm.com, 
	aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com, 
	joey.gouly@arm.com, yuzenghui@huawei.com, linux-coco@lists.linux.dev, 
	gankulkarni@os.amperecomputing.com, sdonthineni@nvidia.com, 
	alpergun@google.com, fj0570is@fujitsu.com, WeiLin.Chang@arm.com, 
	lpieralisi@kernel.org, enju.kohei@fujitsu.com, sudeep.holla@arm.com, 
	jonathan.cameron@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"

On Wed, 7 Oct 2026 at 09:36, Suzuki K Poulose <suzuki.poulose@arm.com> wrote:
>
> To keep the VCPU load/put handling cleaner with the different kinds of VM
> types, we are about to introduce VM specific callbacks to do just the right
> thing. In preparation for that, make some refactoring to add the change
> easier by mainly feature specific configurations to individual wrappers,
> so that different callbacks could reuse the helpers.
>
> Adds vcpu_prepare_mmu()/vcpu_put_mmu() wrappers to load/put MMU related
> configurations for !pKVM guests. Additionally makes it explicit that
> kvm_arm_vmid_clear_active() is not required for pKVM host.
>
> Add vcpu_load_pvtime(), vcpu_set_wfx_traps() wrappers for handling the
> corresponding configurations.
>
> While at it, also make it clear that the timer loading constraints only
> apply for the VHE.
>
> No functional changes intended. Based on a work by Marc Zyngier.
>
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> Tested-by: Gavin Shan <gshan@redhat.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad
