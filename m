Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.115
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793040901;
	b=ZB2PJHg8V0WB7LyJVEHjzMSHWB+/ThmPPVNm9qSZ3gMqw7VcwBLIaq5ZAbKE9EyKk68L
	 h+fyUwpdQklLu6I31CSYSIw7RNoqn0+XYosJMmB9cMaulBqDXmVyruv+I9bECMty1F/H9
	 Bi2azqSmWkYIzctIlEo33uFy4sVRWO9qVuWmpyy27XUJp7mUSTrcMbOE8MiUQQP49DR3f
	 ecaRshTsrZk0hE8khtQyTO4n2DMFgPqP3kq8p9WS4kJlbbFad9ROo7bAvIWaXJwHYKdkH
	 7wbg9MmXD32iwyMvtqTZO0zFC7XYDfGMhz0qh8WYW7LKWLeRA8yUVtu8Hh7FT/JcoXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793040901;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=tmyLomRU3odEzGMBEnqER8cvULIdSR4sKslKh+g3oUA=;
	b=mknxby4LC3jvLkEnqm+6+r29NjgGhUuUSWkkJU239tm9guAAWLAucrIYisB8zSm9B68j
	 nT6El+zMufyt2njtsL0pyXH2prJMNabKmfoGA2hCDxERYO2+ALs/UyGf8F5f1kOFYVdvx
	 piR80z/8eN63MMoFBptvyFRGyyCwbmOJlaekxw+9cCYm+lZmT9oRNxRLPt5geae9NPNzI
	 epESp5J3Ch3QeAkr1gc+Ry5YnxlXYqL85akbp0r88aSOaC2uIregTGINSjYCRrvVdvhoP
	 4oEDVF6y2RvIInr+nhSso9qmk/GJb0AQ8sv34iUd/sj2wpJMx920FiGc4YZQ+0HbSvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=BC+fGasF;
	arc=none smtp.remote-ip=91.218.175.115
Received: from mta0.migadu.com (out-115.mta0.migadu.com [91.218.175.115])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C88F606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 18:54:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C88F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=BC+fGasF
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=MoHfFpJAFkB5Xy3qYToV+bmZRv6HdYN4+v8GE4amOTE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793040896; v=1; x=1793645696;
 b=BC+fGasFzkbbQjcU8+z6jQ2UlUIvtfG6FpLyPkwwttDvDce2fmn/fwPw0KAnO1jx2tQehaPR
 eAzNbXeW1f4X228/OW8FzHrhp3qvlnOFU+S+UFxk+fc6kv3mm/ZmSt3BrsAy6xBTBRebEYpCIuJ
 G0MbbJB+xmAmej41WITCEqxA=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id f8af9d19a826a8a7;
	Mon, 26 Oct 2026 18:54:56 +0000
X-Mizu-Trace-ID: f8af9d19a826a8a7
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5bcbb378fc9so1724e87.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:54:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxaXMczedGLzF+lXlBOLAQMdhRpw/uDFy/jUKlJz6dJDnBdLZRlpQYjbbvSNZhIgok+lpVxvxt/co2fPGk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKu8qcUDBNCfferlL0jLtS1BioC9fRDOJSkTpVPi2On3V34X10n
	gwiokwDnOO2R5JiV6yhtMgpMj/xf9GBkf/cqWt52gfykJ5XZABjcqsSB8AWfbRlDSAbds/jCpId
	XXEmpEY/9u998nGyommdZ2TtaA+cjQRgBrNNjIw3I
X-Received: by 2002:a05:6512:691:b0:5bf:a5c1:d20 with SMTP id
 2adb3069b0e04-5bfb7a0c36bmr234023e87.16.1793040892816; Mon, 26 Oct 2026
 11:54:52 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261025075138.2919734-1-fuad.tabba@linux.dev>
 <20261025075138.2919734-4-fuad.tabba@linux.dev> <4066f726-310c-4168-bc06-1502740703db@app.fastmail.com>
In-Reply-To: <4066f726-310c-4168-bc06-1502740703db@app.fastmail.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 26 Oct 2026 18:54:16 +0000
X-Gmail-Original-Message-ID: <CA+EHjTx8Yy0eYQauYX7CYR1TFbJXLFJBssNfWtr72s=azLFY0g@mail.gmail.com>
X-Gm-Features: AclHuK__ZiaYmPESVb1fdiC9S92LDB2sGT2vZe3GOgGEAspZkMFDfe1sVpLPpQk
Message-ID: <CA+EHjTx8Yy0eYQauYX7CYR1TFbJXLFJBssNfWtr72s=azLFY0g@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] KVM: arm64: Add context-switch of ACCDATA_EL1
To: Arnd Bergmann <arnd@arndb.de>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Mark Rutland <mark.rutland@arm.com>, Yicong Yang <yangyicong@hisilicon.com>, 
	Zhou Wang <wangzhou1@hisilicon.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 26 Oct 2026 at 17:33, Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Sun, Oct 25, 2026, at 08:51, Fuad Tabba wrote:
> >       return kvm_has_sctlr2(kern_hyp_va(vcpu->kvm));
> >  }
> >
> > +static inline bool ctxt_has_accdata(struct kvm_cpu_context *ctxt)
> > +{
> > +     struct kvm_vcpu *vcpu;
> > +
> > +     /* The host never uses ACCDATA_EL1 */
> > +     if (!cpus_have_final_cap(ARM64_HAS_LS64_ACCDATA) ||
> > !ctxt_is_guest(ctxt))
> > +             return false;
>
> Maybe add a wrapper for this as we have for other features?

Thanks Arnd. Makes sense, I'll do this if I respin.

Cheers,
/fuad
