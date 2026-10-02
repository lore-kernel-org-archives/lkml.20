Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AA3F459AF9
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 09:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790933069; cv=pass; b=Yymb3u30xTnve2oMixKNO8exiHDZrfZtGccsHwpuOrJBv2g9uMhKwD+R0Im1hGnntSs2hpiWUlRqqUMHi59H/QBqP4CX5ASfmcGzBSpms/DwenqxkXzyKQwNLquQXkTTueW+7pDsL+X/+3crt8GL0ggwFSzhBR4DjOb5piZSWjs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790933069; c=relaxed/simple;
	bh=7PmFoTV1MhIrlyB9q/nIr5bTRr/fQsMqTgmO60KsB8I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lzmqGDH2fBOfZWnrmNlyT0h7f0Kd92e1NG4aIxTHOY1vbRpjTcdqqFRGj0clM1a8gD3Sk2/qE/N1/k1KtDy5QiTF4LU1JM9mEV7/U2YHBMpGXvZ2FB9zBbjGO70eSxyiuY1uZ93XNeZkpddeviGLOaqK0Bappt69i+aWSwWOdoM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ARP0Bu1C; arc=pass smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ARP0Bu1C"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5ba40832934so4277e87.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 02:24:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790933066; cv=none;
        d=google.com; s=arc-20260327;
        b=eKFr5/WckFO1LdC3Yk11xu45gC4ixcKft7jFrIXQ2SpxEhPHATDjt/0nYUF8kOB//d
         KhDovWqh1//KnHigxebGZan0yTSc0W3igwvC28DKfHseoTmaymVNQGz7LHHmS761VoBj
         OXDolRL6h3JBOZrfdDqcMGjukjaDuE8mdUKi9QyqLFmxohRxMNb4Fvyiiln9OrbcQCgS
         Tj7/zpri3aJFrWEPq8phucVBoWrtmOy3mdgB1h3/IU3pl8T1al5qowalJ7L3NK2s92XY
         +AlBhrQBsmZCPrpgOV6qsOauqTjce6ZLsLWDtN3jweo4za/RXu5EtpHsrYNwiisPS0p4
         zeSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=7PmFoTV1MhIrlyB9q/nIr5bTRr/fQsMqTgmO60KsB8I=;
        fh=cT/qXRwLMeSr/x7MZ7uvpUFsiIpZ+KY+bZlFiJfEPFo=;
        b=SpT09dTwjteKhxDZwcXvOFWJIyBbC0YGkJfWwaEUzLn8Rx7h/VjLOuDB9IohM4PG87
         V8rInKI8EAE43jomxs8FKuqaEBN4HPaHVY/Osg37I1C7kmGbbvlexrU17LbpaCGzx/Qp
         t/0QbAWgWq3NKMCqVEaZgR2IK5kYktSLJWYSCd5ZvqENiXm6vK6bzrz9oJIqQkVvvs7m
         UrUrvJlvzCT1hvK4Su6oePwir1xrK9/BgvgElxOXCriS6IxJQlfuF+Y/YLjTXKlpf4Ti
         95fqbFMUICkQQvuIXcToYlNDcnMaTxO6JaWOyp9tm1xvdNCiBFPBU7MeB7Ogn2rVFiVq
         NZqg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790933066; x=1791537866; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7PmFoTV1MhIrlyB9q/nIr5bTRr/fQsMqTgmO60KsB8I=;
        b=ARP0Bu1C8XEPPsE6on7b3PkqYH7IR7Y+6Nln/Jmj1l+Xw08FUBTjOFpP+SQKPNkQdw
         LTIf2ZF1BlysKAROzOShdW1sY6Pddoj+q0ZIkZpq43A58G+dYAA+1PkVDXjw4Ocx9K0l
         8LhYzSQY7qR4G9sPOqalrMaWJRQc8jsE1g9Vx2BniTInxKTnWFPqXz6GCF9ttnNJZwkv
         VbkB1xuVczdlz5UXvDn8fNFC/D6RL39iTOYj13OPc/44e23EmrBS8A99zFHlFX5YQwdR
         +HMLamDY5GZDjvLpGopvrc8LEZwKisFC9mULn9BhZLMGpOqd8TVRGVpaVw6JpBCDs2kc
         ygYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790933066; x=1791537866;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7PmFoTV1MhIrlyB9q/nIr5bTRr/fQsMqTgmO60KsB8I=;
        b=hl7N1oRiCg0QLo1pccRYMLc32ZO15t9c7n1kzOq7I+BFk+DeQCbtkeuE/U08tinIjz
         9qupZ+c3+GMwHw1P6pMHftNi8SQeDPkNviA9mvS6CHkbSqA89rNhcRgTUxcikEjtESRF
         heM8pH88nnIwrI3H+BHwy4+tzK1fo3TxJIIGvC2JEM5Uc4dEbr5flbQpfIYjIOIG36b8
         OvIcn88MMclqZChJyOzmcFE3CgwflArdJXB2HvsMwGjKL79wr9xfs5X9pzfHYgSZa82E
         pye98tcm04Tl+Z9itm3kVNV0ElXBUVBSvRdAyXY5prf89/RkGMYNnPzgX7v4AmtZ3LgA
         5z1Q==
X-Forwarded-Encrypted: i=1; AKwUvByqNRozZaUjjcqHVBHFBZKvZq34CEx1CMF++v8Egz0os0WNWpwuFiaSG6exHMFauwrY2J7C3cT2PXKeMUc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLXK7WU6ir1B0ZqotbQelhuqcUbFVOijqLfQoV6amV0cUb57ah3
	uHpSjU2uK5cHZSRYIYaZ+AILlJFvMB91+RD7lbE3LSmGb0jnEDfQgdBqBPkOoz7XcC1vtTh1mhm
	XgLJvnyVcpsWEvOAc1DW/pJHOlSZhbv2zn7rn7bcV
X-Gm-Gg: AYBFou3t4jiSKQfbL1xytHFOpTOwUT0Ff75LrMsuXSi56Xiyx7cXWNL7b1DSZFQCnas
	g616RqrxxgOSNgB4xpxNgYlz+5ZdgWvkDKMyVWVSuyEiMcvYcdiKEKTNIlqJJT6kjIzqaliBgMS
	FGkiArfQe6uB0y8O9Ugqbc8eQJY0VYVX2XmVKeX5APp3FVkKi6BOTk+VLWavaGGx8V8AGsrL468
	fyBko6pMYcW8/4c3FYgDIMR3pa2q1VxKCMIVDnLc4rFcA+OGl6MlNIjNyNAagFy6r6dmjncCI0/
	WyuvVeqSd8NfqQtnSJTiqa7Ovn+tS4hAzb3SJN36zYdV6sPUCO/CQvcAv4Y4W90xdFVLFaSHoT+
	lfD7+ZUxO//Q+0g==
X-Received: by 2002:a05:6512:b8e:b0:5bb:ff6f:b4bd with SMTP id
 2adb3069b0e04-5bbff6fb595mr82503e87.14.1790933065552; Fri, 02 Oct 2026
 02:24:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261001210703.1597150-1-suzuki.poulose@arm.com> <20261001210703.1597150-14-suzuki.poulose@arm.com>
In-Reply-To: <20261001210703.1597150-14-suzuki.poulose@arm.com>
From: Fuad Tabba <tabba@google.com>
Date: Fri, 2 Oct 2026 10:23:49 +0100
X-Gm-Features: AclHuK_iAoRmEqRhd3Pqw1bLNIyTQ_Nu4t-bE7ReQMk3jjFJ4DGtZ7fagNuCSDg
Message-ID: <CA+EHjTzz+nmaMDQBXt2e4RU8YcsJOJkVevygJHsq_jbon8PsXg@mail.gmail.com>
Subject: Re: [PATCH v21 13/23] KVM: arm64: Mandate VGIC v3 for pKVM VMs and Realms
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

On Thu, 1 Oct 2026 at 22:08, Suzuki K Poulose <suzuki.poulose@arm.com> wrote:
>
> pKVM does not trust the host. Realm VMs follow a similar trust model, with
> the Realm Management Monitor owning the protected state instead of the host.
> Add a helper to identify VMs that run under a host-distrusting hypervisor.
>
> Use this for blocking ioremap of vgic-v2 into stage2 and prevent creation of
> VGIC other than v3.
>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
> Tested-by: Gavin Shan <gshan@redhat.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad
