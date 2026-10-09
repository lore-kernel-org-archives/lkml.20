Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 131FC49D59E
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 10:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791540695; cv=pass; b=GO9/FuQpcaPqu7Q0Judh9Ikt+EqQ1/PKiu0fd+plg8wAAr5UR+aNWQUQRMBsldFEAPRZhhDzmENahongRRc09/3gn2ELdwK5M5i5ShywzMRVnzdyjAzLIGjYiLCEVuZnv7reTk8w7QY0Mfb+Ao03yTnCfxgfs7AS06gV1hpZm14=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791540695; c=relaxed/simple;
	bh=jO2JB94/A3Hvfgi2+EqsO7+q4h2Kbsj1cn+DHY7QLyI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aSYIXBcPu04f+Rs+gD1dWDDdyMlTppDOjZD54coXp3luQa9AOo3Wgx4NWsRPM8SJsrrMTJHVO61RyF6MLf+bkqzt+0GF4/noDx2KpvapCxxjrUK0vbIPLBt52QA+QYP+Rl4NW3qTm55nKPVTnVvBeLCL5cWskDK8ILhEbDkWeak=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eSROX79p; arc=pass smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eSROX79p"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5ba429b64c5so5786e87.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 03:11:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791540692; cv=none;
        d=google.com; s=arc-20260327;
        b=jS2924X1UzC/Ln2/nuG8r2e7Z2Hg5xmdHl0YpKZ2ufzrocFMwGhzlK90hey9I+porK
         2UsIHqQ/ZYekDDvclrYuAJzM+dXOokaoUV3jg80upIcFLk9LD8TK1AScsocIbg19CSj+
         8hcuvfSDLCWQydbqbwUi3AwTJOnHy1NjpAnqbXLhql1ErIROm35QDzZ2z2OR1SrBn1An
         Wiuj1lyEYF/jqeL8QTW3cQtJRctcya65JDJBUmFlLXO1uHFURFo4oP69kI7Gq/z0DPmi
         1P3R0hNVAaLlrLLqR8ghFhWJfGuX6igG35ACDhgn4tzGuvGeKss+HrO517GKk+NAAhVS
         zfaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=X91Ea0i/B9gu1Cdd3wVY7vcLKA2e9/BIdZO5hwAmvwA=;
        fh=MgpWYbHWp3gepxuVLiFJHrnwdooJY/VXfUi7VwiOAP4=;
        b=XLM5OCK1WOSZvpkzF2cHgPo1hftk9jL2tCnnQ8Jrgo9k8DoBO32sFID5zl6qxtyBGy
         HcybIF5Sy8RA1DXAOGcREX5IVn2+GgPk2NLPzo4CGHVMjDIc6K5f6lMfJxvbX7wY9Nyv
         gDUixi1RIiKJMJe7et+dtjB5YySW4hzefwFWaUdeoK8YdDlY000SfVfnaZMy02tZlY1F
         mmLGdgUz6QOOy/5qY7yh9FwyMx9/R3Ln6MfTsRh0bsfyv8gJjpuujM+axAjDcX+CJanH
         OtR0ZqjxWzp4Mg/dFl6uqqGmo3NT+oj961ZZ7KB3GqchrBbAFMjF2he5/jgtYT/4f1G8
         BSeQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791540692; x=1792145492; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X91Ea0i/B9gu1Cdd3wVY7vcLKA2e9/BIdZO5hwAmvwA=;
        b=eSROX79pzkn4hyu7u8sLvL6KKUZYTIFCTxGR45qbMbaDVBNMqAOqZ7IyntCcI/BVr3
         LdN4pF+L1SfV1gL8qgPpFBRSS2QFEhBm4uxUx5+lXKDDnBQYlpno8Zjd8sSKBXPMIcdU
         BoQoUZ1DFCt+9C0F/yCymSUQSymhOGHP4dv++kRKDlFsifGWnaWIRc4P93pJZko6d3VO
         4tFpa+OKIjP46BPCD50Snk3SxwUWend8pYkQ/cMJ7SXteOam9d+8QXKFW2C4dH0ZB8lS
         vEN5QDvtSd1pp6RBfoCpcgMZuVIoRORLx0c/lN9dsFD/Nuj7KPBZ1tFg6cVO7LDx4mu3
         1Y2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791540692; x=1792145492;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=X91Ea0i/B9gu1Cdd3wVY7vcLKA2e9/BIdZO5hwAmvwA=;
        b=Egd1spNFJf3xa9ncweII7a2+dH14pZdXLcyFai0uVPwZrpMFtA9Hj4FfRqvdoimifu
         Z0xetn8shRV/0mjV0hfxEV8mR+r5eiJ4BRiJILdVu3HhCKl0UuSfUfn2pNiwmmKTqgH2
         UZ2bpiZ4cRoCw0jWrdLip7WAyA0cOMIjkLabtUs75VGr+5qQUy6J8Jtiwh2R1gL4KlPq
         v6+RSuydmlqXOdhQRZJ/GMBuhY23HhXtTYYYE0PobDnHJAWLghcCVUWSiqwxJfKOiq4G
         vmaDxGVGwTvIM3TlFwiM/eU/SE50ld/OReUEGO01tQhy/yADuSRks69jno9reUk44XYb
         yRHw==
X-Forwarded-Encrypted: i=1; AKwUvBwnyYpSgpRHBFXud3/sG3e/vnd90MO5b955Dcfq3qT6KPTs5GykGICRm4cj0sJ0Hu2HfKf8YX02wCignBA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKjIEwZqf9uVyU1EaQT6UG3Ew0CisI01M06PJff4JgftpZ4CI88
	ECzwVoURvWMln+C+QX9ZY8svloB73j9l8dxtPOKn0UfEaV+lFABDZ8hI442djq+Y8Zz4gpZzbQj
	HLThmRooaenW5A39jkcnVOtVpCXtZzJww0YzpCptk
X-Gm-Gg: AYBFou2WkNmL+rmAVBVvXw1YxHOrDKzER1AOgXYO7ruqSjcnLKLKOX5zDLaLaGKeOQ+
	9dOGaLJH5quV5zLo+RlCQvpfyi+XYonXKupVqQv4snmpE6hkG5ZRv/hWKfdbIqdYqPsc8Zke201
	Kq15BEPL/uh9frVumOADjlRNOe9iTxYDs5q1409u0QRn+ZUS/w7JwInqQHKBC/8qSTBja0uqYHo
	MIdOEfoyI/RgyUJIaMmK4QETH7bXABo1YMUBKmdPfvNQgWGVX+EcrLBW4/WzfuoCNwisEeigq4W
	JOAX117N7cjXQLfzAmpdfsvIl4KIJPoYoXdJa3jcZwl+3gc8DFv331K3A+WYeI7uM/s6FI4DmcY
	Xp1iq1yRJy1DrMA==
X-Received: by 2002:a05:6512:6619:b0:5ba:4293:fa55 with SMTP id
 2adb3069b0e04-5bcdd5286e0mr89466e87.3.1791540691538; Fri, 09 Oct 2026
 03:11:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261007073537.2454351-1-suzuki.poulose@arm.com>
 <20261007073537.2454351-15-suzuki.poulose@arm.com> <CA+EHjTx-niYPnnRDvAAiY3MXLpSYau_PhiBTCiE9mOYUChASPQ@mail.gmail.com>
 <86a4on2qxz.wl-maz@kernel.org>
In-Reply-To: <86a4on2qxz.wl-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Fri, 9 Oct 2026 11:10:55 +0100
X-Gm-Features: AclHuK9LIRInATLITNjOUiJu1KjVGIe10ULmW_HxdmRBfJcwxXlgGARzP-Th6tA
Message-ID: <CA+EHjTxZM2kEtsG7+pq7zygA8Mhwzai9PL7+ex1K35BPVSt6hQ@mail.gmail.com>
Subject: Re: [PATCH v23 14/14] KVM: arm64: Prevent unsupported vcpu features
 for VM types
To: Marc Zyngier <maz@kernel.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	will@kernel.org, catalin.marinas@arm.com, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, steven.price@arm.com, 
	aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com, 
	joey.gouly@arm.com, yuzenghui@huawei.com, linux-coco@lists.linux.dev, 
	gankulkarni@os.amperecomputing.com, sdonthineni@nvidia.com, 
	alpergun@google.com, fj0570is@fujitsu.com, WeiLin.Chang@arm.com, 
	lpieralisi@kernel.org, enju.kohei@fujitsu.com, sudeep.holla@arm.com, 
	jonathan.cameron@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"

Hi Marc,

On Fri, 09 Oct 2026 09:55:52 +0100, Marc Zyngier <maz@kernel.org> wrote:
[...]
> A rebase would be a terrible idea. This thing *must* go on its own
> branch, and not depend on anything else.
>
> I can however fix things at merge time. is something like this what
> you had in mind? It compiles, and is therefore perfect...

Yes, that's what I had in mind, but please keep the PSCI 0.2 check
from kvm_vcpu_init_check_features():

        /* EL2 implements PSCI 1.1; the host must not dispatch as 0.1. */
        if (vcpu_is_protected(vcpu) &&
            !test_bit(KVM_ARM_VCPU_PSCI_0_2, &features))
                return -EINVAL;

Folding the allowed set into the mask covers the rest of the block you
dropped, but a mask can only reject a feature, not require one.
Without the check a protected vCPU can init without PSCI_0_2, and the
host then dispatches the forwarded calls as PSCI 0.1, while EL2
returns 1.1 to the guest.

Cheers,
/fuad
