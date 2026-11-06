Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.134
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793975759;
	b=jBNVufpAbui68hoPQk2z1ooFs+aeMkvjK/m6WrGyFj+QAgDNWzD+J3GDZimKRwtFdGLL
	 Iu8/09hD+cJw2WHG7G8K+iTymksXR7Rt3mI41zRzwpIkqYhNKdpBz4kj8scBCFuHP05p8
	 rOw+2P5+lXUbJzxN3ZPf2PWAwGsrprnNxvj7yBrC94NekKjbCtZJcNUzBUqPCAPu1K9DO
	 +v7dR0Mm56OrjIdAjPu+sp8+C3HC6jq/O0PXG5eDq9WTSEarR3mqUiRlPj+pFzB0OgkT8
	 vG3QDQZ/OKd/1ZNifeKbUAmuHX664ASYQaMdUcFbTd5joFsbVrkF21kUn8KXW+rr2dA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793975759;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=9ne3EpNoMJHND53sLVjB8iHYRzBbI+NXjoTQbJvnLE4=;
	b=Jmt708yKXK3NCwHJx9lj0kEc6UoSq8V0a8VRacicQ1kRElgs4+3KPxxzqP6XMlBaZ0kT
	 uBHY0y6vP9bZ41+KPukjFB491zYscX3noEPt0be9QDEDSs2mfc4WS6COHSIcAHl3s/KaE
	 igR46CmRzdanbVwJqvgWHB/VBPoNqQmhBOKNPSizDmJld6PxMZqlcUddlKs2o/412lSzI
	 iX/gLRhj9MqcSmGl6KEXpE/tOKXbEpWiZoSKrhX6G+vmfJmA7Q8Rn7nJ+vhcf2Bx9+eST
	 If6cuKgTY3heobyajRu1CPVpMMc/qkHy8GYkMNCBD225+P7WT+7x9/Ck4RZ7i3fxtXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=UOiPmKzs;
	arc=none smtp.remote-ip=91.218.175.134
Received: from mta0.migadu.com (out-134.mta0.migadu.com [91.218.175.134])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20831606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 14:35:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20831606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=UOiPmKzs
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=9ne3EpNoMJHND53sLVjB8iHYRzBbI+NXjoTQbJvnLE4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793975750; v=1; x=1794580550;
 b=UOiPmKzsKQcEoSPab25f5vJkH7dcWsq7wjBs4xvttqDa/K0UZDvXV1tvNDDpyrEapsPODfem
 eb7MlsyRPvfiIwkM+D7IBGvFdT5VqdSRRDL7Jkso6nhj5uKXIfNtpCr0/7Q+QQKG1Tt25vSrVoV
 nKN3OaB0O5BDwOmWtx1DNtkk=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 4b0fbca80f8f0604;
	Fri, 06 Nov 2026 14:35:33 +0000
X-Mizu-Trace-ID: 4b0fbca80f8f0604
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5bfca2a2af4so73e87.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 06:35:32 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvByiT7O2VgU9f0a1KZpOB/4Y7ZTlFoUZgGvYG3/BIPynHHtJq8CS4LkgkmwOskrB2jqM03L/n9HkBAuYFfk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8R3nmezzzSePNsosBS4dfXSuYoch4RAaW54DqYunJmb57pH5jV
	1HcX5VpcXbJAbAAWiIHqv1ahRzrFSfZLAQQAixv7c6dvNOrxh1BgM00xDaCoIuwtMJcbkxpgxsA
	gsDC3NGsYdLGkAyxEGP6ngjnWGC3o2jKIWnPC9kfT
X-Received: by 2002:a05:6512:4019:b0:5c0:50:ff89 with SMTP id
 2adb3069b0e04-5c0071d689fmr69373e87.14.1793975731712; Fri, 06 Nov 2026
 06:35:31 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105-hyp-pool-and-map-v2-0-44a6ca90190b@cs.columbia.edu>
 <20261105-hyp-pool-and-map-v2-3-44a6ca90190b@cs.columbia.edu>
 <CA+EHjTx-X_2DaO6Yt-AHsP55SFWjz_EYxEr-TB9WSN-ZT+d3FQ@mail.gmail.com> <CAPOPQMB6eU0MYNewcq8HKsEMchwY-X3aT0Km9uULBappFWZcjQ@mail.gmail.com>
In-Reply-To: <CAPOPQMB6eU0MYNewcq8HKsEMchwY-X3aT0Km9uULBappFWZcjQ@mail.gmail.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Fri, 6 Nov 2026 14:34:55 +0000
X-Gmail-Original-Message-ID: <CA+EHjTz-R016BwhcptZ3xVQe+a8C7au6ZL8jwZANdTf=cXRZHQ@mail.gmail.com>
X-Gm-Features: AclHuK_pCYkO0OW5l_wmtgWxAs8e930i-uFO6iYlwOczI7StHxm9o788PZxd9Ls
Message-ID: <CA+EHjTz-R016BwhcptZ3xVQe+a8C7au6ZL8jwZANdTf=cXRZHQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] KVM: arm64: Don't replace a valid hyp block
 mapping with a table
To: Xuheng Li <xuheng@cs.columbia.edu>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Quentin Perret <qperret@google.com>, Will Deacon <will@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 6 Nov 2026 at 14:34, Xuheng Li <xuheng@cs.columbia.edu> wrote:
>
> Hi Fuad,
>
> On Fri, Nov 06, 2026 at 12:03:29PM +0000, Fuad Tabba wrote:
> > Could you mention in the message that the WARN_ON() is fatal at EL2,
> > so a caller there gets a hyp panic rather than -EEXIST?
> > kvm_pgtable_hyp_map() is already documented as rejecting such a
> > mapping "with an error and a WARN()", which is a better reason than a
> > future caller.
>
> Thanks. I'll reword the message to say that the WARN_ON() is fatal at
> EL2, and point to kvm_pgtable_hyp_map()'s documented "error and a
> WARN()" instead of a future caller. With patches 1 and 2 dropped, I'll
> resend this one on its own once reviews have settled.

Actually, like Vincent pointed out, why the WARN_ON(). The caller can
just handle the error.

Cheers,
/fuad
