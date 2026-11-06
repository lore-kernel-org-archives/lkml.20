Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.241
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793970019;
	b=UYCL4DP1NGxovy45xRPt0PkgxLFJtEIhGnJ60Vu0c+AQq7LSSXCMfC44yWXAlZfdxAIM
	 h8diGebLiEq2LSh+8pVHgxv1DziM+U5hYWdx5r/zLvVnclCIv5iFhPnktrdbO5iSZWe3g
	 vwQpgS9gp8DRN7apTMo+Tm1atum6YSnk4JnfrHo9mEos8Kb2mQhDZ2YuBqcBgnMG5XTdP
	 e8Eyu/efQ+ZhMryozAqrSPEvZ/qLA34TN6O8sS+JvzPWefZsZ+nxUJXLo5wEvJbWoXscQ
	 a9JtAWBey4U+/+7avQxXCJ03hrZaqr/+sYoDJo53Mv/O9d9V18W6o01I3vSafoOuFWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793970019;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=CmVIaM3M0lQoS5Gw+xCsHIl1GWfVDNYrrM5ZXpTz810=;
	b=GzcM/le3YDDoMRaeO9ZR+MmUB85SaYm/bnMPQEHUliMvQDLfQNP8G9qt8OSBJTsOLoj8
	 jPdedA/XrRH0XbrasgIK6/+VvJgxGhlbjU+g8OJS19/+/RVOvq3wsbYJM4aSHYP4BCv8H
	 NFE5TxL5T4VxNoR52DlRzTInTL/9cdZnNCq/Om0CQYr/fJePNIkt+sZf7xYjWuEsO4vZ0
	 DCYUzHvnqkQBC8KF+WCDdQNszoSvV7Z25ivCvS2xOImz14zBeR/XfCaA7ghYUtSocgggj
	 9ph18gtBszUeYfLUqeNO/2qAWyy+arGRXiutQfnNhAb5eXAIc891Urem+iGNYEjFetw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=rtoA7Xwo;
	arc=none smtp.remote-ip=95.215.58.241
Received: from mta1.migadu.com (out-241.mta1.migadu.com [95.215.58.241])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BEC5606A32E
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 13:00:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6BEC5606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=rtoA7Xwo
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=CmVIaM3M0lQoS5Gw+xCsHIl1GWfVDNYrrM5ZXpTz810=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793970016; v=1; x=1794574816;
 b=rtoA7XwopxSmbRRcA/U5X2NtRC51TJ71MhIAgrVaOd2TDbl598/KSis8U82wj6WD6kANsUl/
 NRPCq/aKSs9M22t4VV5Zj5CTV+koFPF99iG7FGzN1aXPJPpNsPGn8q+T2bOPmJGw/gU0BsvIM96
 0s9JXBda5QCxOe0oKLdGkR+4=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 5169183344e430f0;
	Fri, 06 Nov 2026 13:00:16 +0000
X-Mizu-Trace-ID: 5169183344e430f0
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5bff701efa5so3746e87.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 05:00:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBwTPH8KK06GKik4xwZI7OM3xW8+t2WAHCDGh3Hajo9cetW6nACuWNgDuWR7+GO6+XGfymgGonx7RLq5asY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+qNa8bs+7hHBC0B8+GOEU1Mo9SwI50JbZD0YP/z76XmEiLtxBq
	6DfC3x0G8ra0mumZGALPufagLzu7ZFAXXXQF9YUFi1T9VG1Ss674JUdMBDmXmYOPBUv3MNS5arg
	VJY7a/WLDM1qz364MgFeMcc8iMjU2JW7U5/7bPIEr
X-Received: by 2002:a05:6512:2509:b0:5bf:c9c6:ae92 with SMTP id
 2adb3069b0e04-5c0071b526dmr56719e87.7.1793970013173; Fri, 06 Nov 2026
 05:00:13 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105-pin-barrier-v1-1-04ebf118175a@cs.columbia.edu>
In-Reply-To: <20261105-pin-barrier-v1-1-04ebf118175a@cs.columbia.edu>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Fri, 6 Nov 2026 12:59:36 +0000
X-Gmail-Original-Message-ID: <CA+EHjTxoNcx4s4L2DRXLu6VydiG2N3OqRYr+kscghp0jVVwg5g@mail.gmail.com>
X-Gm-Features: AclHuK-w8IPMfkMD2ik_GPs_KpCTf31_7nutwDTH3Csiea4URVFMI1--f_NjCec
Message-ID: <CA+EHjTxoNcx4s4L2DRXLu6VydiG2N3OqRYr+kscghp0jVVwg5g@mail.gmail.com>
Subject: Re: [PATCH] KVM: arm64: Order a later pinner's accesses after the hyp mapping
To: xuheng@cs.columbia.edu
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Quentin Perret <qperret@google.com>, Will Deacon <will@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Could you also give a case in the message that a well-behaved host can
hit? Since 7.4, two vCPUs of one VM can pin struct kvm at the same
time from the __kvm_adjust_pc hypercall (cf533b4d3630), which then
reads it on a CPU with MTE.

Either way:
Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad
