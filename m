Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.73
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792751912;
	b=UZU8cSaA+agdBeurrXzUIO2lhmE9TMwuxXBtTLDxh4HWPOr7+qU5HbJnAQOc5A4VENwe
	 uX98rK6l9BabN3vArmw5PGcH4iQ2Ktvq7q02Hh666LlCsc2EII9yyNUo2Fj3zHrbzT2mX
	 mJyIOmK4JwyW4DJNqmnbgRVu1MPHZRN2msmk/oUHaFrirVTQvKJw1QqIznO6Fs1bcbF7Y
	 5Cui6+dgmpUVy1Uf+/ZvRGxioGHK3ItZ5i1KplEm+KgMuIevYjufW7AqKixYjw+F9w5S4
	 U4cK1svutSs9fJIw2deRJW09nQavdTW8ugLykitnYs6+xoNbVarGCxjCc+y8cX6BMKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792751912;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=cLLRVkOcST0DyQ8J/JKflZi0Zz/mIu85uAsHsW1TVFg=;
	b=WJ5vgdfVu5x11oghxOFEhueZFW82tHuHWdn1frkSgl3Bqje92FHmKaAFYjgHUm1mbdAp
	 9m68KMRr1DzDqv8W1J7UDNSTy1t5pizYVIV5iL3OBafJbqD8LO3U0W6tCI5rDMfE5rqtU
	 ZBppwx9w5vu5PAMl6qaWs1ApmpWtYDGKgvtE1P9m5CeSDFXZ0Yd9HNa2Py4HSQ50FRriK
	 kFQAHDUuGUtSJSDHqpRQFh4foA0ZT8ECwHSPjLi0vvm9qcIYXQ+jX15vazQ3HRlFJMByu
	 e3YG91iOOgqyjWcnRAp7liMmy0icQQkJEtP5qnpU3w7Bup8HXlN1dYDW9lozbSZlC6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=wfyKlkHU;
	arc=none smtp.remote-ip=95.215.58.73
Received: from mta1.migadu.com (out-73.mta1.migadu.com [95.215.58.73])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C18D606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 10:38:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C18D606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=wfyKlkHU
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=cLLRVkOcST0DyQ8J/JKflZi0Zz/mIu85uAsHsW1TVFg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792751909; v=1; x=1793356709;
 b=wfyKlkHUts97FSALHB1JY6s8OPWvgzatECATx8ULBCYmk9MDWedb36zFJ8pPWAR85iaDIWNg
 MbOTj/b2IRQuzUP3gdqZ0cW6qRlnH/ZSfEZ8PndebtYRiNlBS9X5C8DfQDImj+JlHqVifYh/umS
 P6Pxb1QBmaf0Tb93/7AyeNK0=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id a02d05a86203f22e;
	Fri, 23 Oct 2026 10:38:29 +0000
X-Mizu-Trace-ID: a02d05a86203f22e
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5be4a7b9e6fso4966e87.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 03:38:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwgaolYc+VLQfc2h1UKjtqKJrcVfk4CRaSiBjsqNNvleOVGS2+IwGJyz3UuZJwXvJehpCJGqiCIi+bDJfg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJTtW4IK2BIg2FSl62K9aOpk4vTi2gnyMHWZJNeIZ/EKXHjNPIV
	7bba7jJ/iaZSq9Zwgl5pe7FVxNlGpD0oIdg5C77uLUqW+Nowe7PIcrr4J8+z8nZqZIA9EJAfqgC
	sNZTtN5AbWt04GioYvy92qR/yjBIVuykBslByNi+k
X-Received: by 2002:a05:6512:3e26:b0:5bc:fbf6:2352 with SMTP id
 2adb3069b0e04-5bfb06d38a0mr119014e87.9.1792751904240; Fri, 23 Oct 2026
 03:38:24 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261023070110.1833446-1-fuad.tabba@linux.dev>
 <20261023070110.1833446-2-fuad.tabba@linux.dev> <86fqxwzul7.wl-maz@kernel.org>
 <CA+EHjTw08SZC_3Uodt6ew6vXVH-doW-8G41fVCF-rmaKsv+0fQ@mail.gmail.com> <86ecdgzp6m.wl-maz@kernel.org>
In-Reply-To: <86ecdgzp6m.wl-maz@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Fri, 23 Oct 2026 11:37:47 +0100
X-Gmail-Original-Message-ID: <CA+EHjTy0jpY3sdVCENJRj_kfRDwbZ6TpkCAHQ2xUO-7ZuErpcA@mail.gmail.com>
X-Gm-Features: AclHuK-Z7-qsjF596RnJ21sZzB7mzj2vXd60dbcKuOxyJq8KgdnvpDHBkQR87RQ
Message-ID: <CA+EHjTy0jpY3sdVCENJRj_kfRDwbZ6TpkCAHQ2xUO-7ZuErpcA@mail.gmail.com>
Subject: Re: [PATCH 1/2] KVM: arm64: Hide FEAT_LS64_ACCDATA from guests
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Yicong Yang <yangyicong@hisilicon.com>, Zhou Wang <wangzhou1@hisilicon.com>, 
	Arnd Bergmann <arnd@arndb.de>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marc,

On Fri, 23 Oct 2026 11:28:17 +0100, Marc Zyngier <maz@kernel.org> wrote:
[...]
> No, I want this fixed by enabling ACCDATA support by default, which is
> what we have *already* promised to userspace, and see the fireworks.
> You can add an arm64.nols64 kernel option if you want, which is
> consistent with what we do for CNTPOFF, NV3, and other extensions that
> depend on FW enabling them.

Will do. v2 will have your patches 3 and 4 from [1] rebased, EnAS0 set
when the guest has LS64_ACCDATA, and an arm64.nols64 option.

Cheers,
/fuad

[1] https://lore.kernel.org/all/20240815125959.2097734-1-maz@kernel.org/
