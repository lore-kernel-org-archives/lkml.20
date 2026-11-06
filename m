Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794000031;
	b=5Mkb8K0B2VA2DGyAwmL+n2BXnOl+eeMoT38AKhYJFL2oAfXGnmIY99U9F2ijICOI/I82
	 LA0JWtDzhl2NbDQbPk1pFEKi2ZA03Xr76LTtxzdkF3knaKgY2eYIN5Hm6ke01vlvo91d2
	 3AlvgsNC7cIX7nbuoiKCr/wFC4PvII9xJW+sruzaCpXMz1m6B6isnSCMZL4KqYrrv/2/c
	 UBt0Zukcor01JC/XQ8GKVwPFD6vrQ8JCefMzCrHcWqokBuQRGhf9E0W6wkHufMnDwiAJH
	 W6Ofilo2xb3BKoIPWcMt1oCcndSLyyjPWClxGrgYBboXaQVesNSVo2RbjsaCQHfnvUw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794000031;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=dEASJP8cPGURwGTSZkAlcNwWe8/bY8nmtMI6AXQzVBA=;
	b=jAZ8LbywWowr9XZ9KztV8K/cVmphTVzZ6YQpLj2UejJAIeWfNpbpFjfrcAdatdSANcK5
	 tQF46gdpB8K0N+wVuBqSjsgnlsmB1NxS1EwxeJeHbebCc/K8XSNlodPIxdJSmHfroRSWV
	 ml7ex2OQG2UXtAkWIO5u73MfXxaW/+WONdGaDdXaA0PZnh1vSWM52fFxUQUL59W8nucmx
	 VvdktvROXiD5W78rLiGpYbIyKIbTQx4wd0tFAVRlHLABh7m08ZKiFC59j+WBJd7XhXDTd
	 D1ucG2kVUQvMwTVAkkUXsJxP9oE6KzSEWOyRrkCYThoDklsZTRFLfe6CGmP9h+GqM7w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ZJqjhSH7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF7CF606A329
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 21:20:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF7CF606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ZJqjhSH7
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b571a45a2aso1835a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 13:20:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794000029; cv=none;
        d=google.com; s=arc-20260327;
        b=V8NSk7k6lck2QGrJLvZq/IgAkEr4U0MJii473kjZmPSrAK1qvuLSPfdforThoGaWU+
         moQ8X9/CbbVTJVcTAt/KNh6L7uyYW0kHvxIHQ1o2Eetwey+nLUCFtk74Oy+IOLviaitT
         xSETKNYw4jcS+i8xRSn29TDj6yuGS6jhiW+nGBKgCybgwKmw9Fsu8UEz9u6WcKQaQzfC
         zWgYLyM8NmSElV789Y80GGZvhUcHGnSgfIwC7dOC+ayF1IZWzRH/WfHskcdUlh3XM5ri
         y+5YxiKQHu4CJZxCIMlYFWNZQxJe8SJ/5xzgcVT089xO5izmigD6+Z5gU590Fj+fV8V8
         NvAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dEASJP8cPGURwGTSZkAlcNwWe8/bY8nmtMI6AXQzVBA=;
        fh=iXZwuOnq80HlsdDHJdzyy92Bredkl6qOf71yZ63YlD0=;
        b=dSICWOMlM3WQZwjNMT31Yn4ypc4Hv4RJtrczw58SA8LhOgmEJB4D3sIeTnMOy+ZOJ7
         TgOEy4gSDkuWVbNqULsAMHj7Ql0pRNe6WwS3ZZfpcglo8LAjvHjxZAVMxLq94Z8txCSu
         4y+1CAGiQNF+fjtzCqt4CgEkbHybAmp6xs6lbcjUf5LbSapW64xnOifBa+UmffSIqv26
         XiL+GmKi6xB8BDbvfd53vn0GE5z3Ox8parH7ICfw0h2c0E4M4J//8sRSlLJpZvvGfnn+
         7ZhBuKW7hzlNuyNBoBXA4T1HwBiEttRRUDzIHwOXSSYJiY2O43xfq6gDhGHPGmKXRFKE
         1qTA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794000029; x=1794604829; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dEASJP8cPGURwGTSZkAlcNwWe8/bY8nmtMI6AXQzVBA=;
        b=ZJqjhSH7PAHxPDDqpUN6vGJkc/0roGheqDnG5neNfKgE0s8l9/n5zOViHpddfjKA/1
         NN7YnadMOedcZG8vo55+RpGBZMzq5Zvm/M41dmNJ8Elat7NJQKd0Vnsomh3uq8q/uaQk
         eFibAh1LGHNxgvGe7PJpF7Tk24Z4zJkTRb6Ajy4CGVebcUeHg6vnkZ3ul0RpL7+Bc/G6
         baZcu+nU2GpHmn93DtWBLuauJUCc5dnudu0LGB4S5QYVS7Oekll5y0SFL+c1mbhKMYMx
         VGlRbqDEba9BpLMeixyeeleBiPc2VhJqdMdKYrm2VppvSrFTDx1Riu49rfHpiU3qhaKg
         fJVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794000029; x=1794604829;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dEASJP8cPGURwGTSZkAlcNwWe8/bY8nmtMI6AXQzVBA=;
        b=u+jd9jjbpumNOkhH/cSN6aBL6aRfyWqVZP2+iF/TZ0tOoVy+/+1CkRW0aROpbFVc5O
         U2FRiZe5QcrLFRCqn7cZOefkfG0Njv15uhP7wEYwQv8hOkwPpIlEhjIY5NSxz42sR5PY
         /KtT09E2OcUAK/eZ23e9Cxb6AiQ8iBBh7iXbCqrvp4kXfXrRIbEAFkVGkltzkny4me9t
         A+uxA/ySGT/Dnt976sZ0krlF7oNB099AOVcZyEr0IACcWvMq8JOPpYeSHBYwKoKj0yqc
         ypXVJwbK3HQBPviDRu/EiFhrav9virVhhDQjNXzXfKhoNxIx0zVAj2VeVeierl2koyTx
         0iIQ==
X-Forwarded-Encrypted: i=1; AL+hErFaHz1S1XpE4f67762qoE+1p7AxJaH1wTyyJ8L2AkX04JFjQXlp5hstqLFyZB4Das6mMWAEJcc+mUBSZZg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+bj5cqZbp1pxEyH6FedhiNSkIBlfGCZUQdOfZF3bqrr2XV69Pj
	rKfx1rZ23rYbEANdXKPYHaUqjAZCrnZQM8AHrwJ6WmgmVcTl5jNhM040YX9NygFoSrhCbr7O5I6
	P4IKojGXqpanDLAhzoRjN+dmx0jf9KVMB070lKR7i
X-Gm-Gg: AYBFou0t1yw4Amg0AEbwG6uKs2py87OLiRecntnkwyT+aQYXE8Ik3a0ziuFl92/RL8O
	zvOuOAaY2qb1yEcmX997FqP8W+Meo2TrWjKI+3XoTGxP7lh/MZeP9rgryVHHJY6P2e4ZU+LEzEf
	8oUQ+NqVnlYjYU8usBb7ut2R0W3dAn3AO+fIV80/XacdGztJAMQfDAyZKPyck9AmpjRIgzxGm37
	xyXwaUGWtbqgk5QeIzfUa49L2xvGDtPbpSi0rbjD4EuJ5q9m29i2EkO+SFcScFpxbW3vHjl/j8g
	4VoCmXJ8UiOkKQnbsKiT7aOJoWGrKZxALndPzpAxBCwfw+Om0lzKXgihUCRLstuy9tMi91e404X
	6W3IInfemn1VbahTMgB9E85nu8lP64ZlDUmouDkM+UhBPdki47RtClYII8+XaRlPndpnK/tnP
X-Received: by 2002:a05:6402:8da:b0:6b5:77a4:e7c9 with SMTP id
 4fb4d7f45d1cf-6b6fa3c759bmr8754a12.2.1794000028655; Fri, 06 Nov 2026 13:20:28
 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106013927.166209-1-zide.chen@intel.com> <20261106013927.166209-18-zide.chen@intel.com>
In-Reply-To: <20261106013927.166209-18-zide.chen@intel.com>
From: Jim Mattson <jmattson@google.com>
Date: Fri, 6 Nov 2026 13:20:14 -0800
X-Gm-Features: AclHuK8gDDUzygB7xOSLMvBuJupD6Lp3-Om_QG8PNIiEO_YVjCf-4zFUNn3jTVs
Message-ID: <CALMp9eRAJfDSdxi72e0JS+jGvMGEPThwfo_VF-7Fbs3EmhcGjA@mail.gmail.com>
Subject: Re: [PATCH v3 17/18] KVM: x86/pmu: Advertise PerfMon version 5 on
 Intel hosts
To: Zide Chen <zide.chen@intel.com>
Cc: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, kvm@vger.kernel.org, Yosry Ahmed <yosry@kernel.org>, 
	Andi Kleen <ak@linux.intel.com>, Stephane Eranian <eranian@google.com>, linux-kernel@vger.kernel.org, 
	Mingwei Zhang <mizhang@google.com>, Das Sandipan <Sandipan.Das@amd.com>, 
	Shukla Manali <Manali.Shukla@amd.com>, Dapeng Mi <dapeng1.mi@linux.intel.com>, 
	Xudong Hao <xudong.hao@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 5:50=E2=80=AFPM Zide Chen <zide.chen@intel.com> wrot=
e:
>
> From: Dapeng Mi <dapeng1.mi@linux.intel.com>
>
> KVM currently caps the guest PerfMon version at 2 for all Intel
> platforms. Now that KVM emulates the basic architectural PMU features
> introduced in PerfMon versions 3 through 5, raise the guest PerfMon
> version to 5. Features that require additional emulation support, e.g.
> architectural LBR will be enabled separately.
>
> PerfMon versions 3 and 4 continue to be exposed as version 2 because
> KVM cannot safely virtualize AnyThread due to cross-VM information
> leakage. PerfMon v5 is supported because it provides the
> AnyThread-deprecated capability, allowing KVM to indicate that
> AnyThread is deprecated.
>
> When enable_mediated_pmu is disabled or in the non-Intel paths, KVM
> retains the existing cap of version 2.
>
> Signed-off-by: Dapeng Mi <dapeng1.mi@linux.intel.com>
> Signed-off-by: Zide Chen <zide.chen@intel.com>
Reviewed-by: Jim Mattson <jmattson@google.com>
