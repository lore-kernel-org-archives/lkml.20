Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794924346;
	b=FYjCHsJYGnTzVPjT31zYeMKLS6WgYQhWY06Ci1PKzfT1/gUxrWVq+7oC/vpqI/zu5aLm
	 D6SaVVIXC/ebOcyI9FW/ICGC3RcNnoDJJTvm0N5VUPiFIoo4Puk7hFubS5y2b+5lEg8PD
	 frk8YgCOUQ4iwe7e4H9imuqJrx86le5wcX3+ne2rWtkBWwh/yi9axrAWo0C57DXvzos9s
	 s4+/faRbUIi+3klfBFtSARU3pi/A5gbNpdvrDgF9F5/2fuN5crjZFmoFqne1pwMtDPLFH
	 fyF9inu7oI4DQ6wYVurCeEp/Fg3iyGVIptu574MM2xupLSGPoPalyPs0uN3TwbcRI1Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794924346;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=ngfsadg2SKwRZORmemooRU9fe+LsEp8AELUWW3EroVQ=;
	b=bf8VeJuMCoj+yARSh1tgmmGLRGibK5+7hvMqh181hFs93smMzsdtpkmjjw3HBLYYHK40
	 kLmSC1HKOHBokTfdAoUPDP7WZhZo49/jiEIBSVOUAe9LShUakSJF03C1yv7U0HMZMzWns
	 ky9DGSxlv2Tk2wi7qQM1JpmwiriACtNda7dmdgHTPIEI2RmUYJ35hK9QdFeaBZbs6sCVH
	 mhyAlOTfW/CrUVtMZZrp2wUQli3uCuEcuzax6unBjbWYnxx43YBZc3D8rxE7RelPRhqxk
	 4hONKRIVRoSSq8BKg3ag9Oc7mbfwP6tLV+QDu+CyRCmKkyllfORYcCLESkhW+Dokmjw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=gQaQzXh4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.47
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FBDB606A334
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:05:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0FBDB606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=gQaQzXh4
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5be58ad9600so8829e87.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 06:05:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794924344; cv=none;
        d=google.com; s=arc-20260327;
        b=kP3+WSemsEjgz2Gr8hpSavCbgwNQGooitxCN/BteO0Yj40MeVD23LXhHP/ri/2sO4R
         BYkv8QA+LVGoM+jdCu4tDAw7KAJ/sSHMyGFibbSgnIjHMa53U2D30q+Q+Jo7+oO3CToM
         Fn8LyLARMzs2O33t3oOsHPy6PLmwtqG0F64+BbOyE9FXg0pq49/hWIj41JOztNb6LLEG
         Eq4ExAHQx0jVmq0tAFo2jSvp32PV15Z4y8bR7ZqM3p0uzTgbcFdLaJTnMSWbhiGBBQzn
         IYRRQF4yJQUdlai2Xq5+VSVPBGfffRy7UqEY9Tx5x/t8igtwnrvk0MAYtm8R/Q3dfgAZ
         ErMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ngfsadg2SKwRZORmemooRU9fe+LsEp8AELUWW3EroVQ=;
        fh=SWnECWexChnb1MaVw+ydR0R7WugB+dI0fH1FmGOLT7M=;
        b=A06bqVzqB3/FmKGlMWnApvRpOvESikwz3V1W3738sZsgu+AU4qhE9WQfUVQuHIQvJ7
         6XJvimm5MJt/IpA6bmzsN5Pp8OCTOAeh7keeXxvVjFyNTGS78D1GCfbVm79n0Fl3J3cw
         s7QpX5DnLBWBhZ/tC4dy/uWK9HSJJ5UXeiHYSOMgbzo4wLIqOHVpDcmVWRInXpOkSBhR
         rqtB3wL5sk3NEOhDhjGlN6ugAL8mtOOosg7iSX6DIPVLsOyoIOM3eCeIAMCi7tmwaQEu
         HWrEs135nh3eoo3lgBJRDg7OG1jXw62R1l4hnYYLNnM8D1zLFESoXH4dT1awc0atPTdh
         +y1A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794924344; x=1795529144; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ngfsadg2SKwRZORmemooRU9fe+LsEp8AELUWW3EroVQ=;
        b=gQaQzXh4+kvCyesNc8fnwo3aUbPi8d7oSq0+OtSe7pXlNIH6BFEex5GHvXcFPBBb3M
         HiW+tdfhrYcsifnwoCPwTnugWDnSsRZB1FTNngFJ4rb9ozR+a9rvskfMxTh+QbUizdQt
         heDpVPP3qganrP1xo0HTVOs3i4RYBU+A3xa4PcdR9ntDHBaB8kdeuE+QL14uVfwMDLgd
         bRvGSQ66j5jbeR+bjY1Aw9zESB1nU2GsDza4YHgdWnzhQ4ubhAf0Yy6XhBTnPUhMBunj
         7OeLywIl7unRouMFEvam5oAyY9Of2NZUYT+FUUMiOaGwugm7JcQ5POV3JByOv9vJBpQq
         C6Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794924344; x=1795529144;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ngfsadg2SKwRZORmemooRU9fe+LsEp8AELUWW3EroVQ=;
        b=RVs3lWZTYZp86hJbB+MUjR2efBIToC9DmLTqofGm/joxGnqEoB4fwQCSB/AcfIo/53
         F5MZd3m7ZFfAD07exylW6L1y9fkzCHe9ZMp8ILpfnis8XEurQV8oEv9dwaH/xwBWbBRB
         7uF96x1UYA/HPjNHi8HpOPk1q1LDV09tZ2scQvMRNGIb7VAJQNcdsM7P5SXFDaDH/5i5
         PCZIXmBoXYOPdbFIIJ5Gclh8fjE0cj4Kd8bjW1NgTWkJgj1bOPZJgTTXbMwvyFvspTYM
         5dOImQUUrt5mu3LbILAySMpEF8kZfUCUeasp8cGIP38aaF2m7BWYF1wNLPEgVNJMGLW1
         XVvQ==
X-Forwarded-Encrypted: i=1; AL+hErFFkXcJS3poMThvJuQY5c1EvcHljCTvR7LLmpb7SC9Lu/pMmUUxJoATLj2Os1Ihf5og11f3aXHg7By5Wm8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Kw5Bm7/6WHlCS9ANfKDjKco+fLM8k7JLa12i5H2P4/uV9twrm
	EOPKTK+MFtHsxUN5FpDIWc06qmwqwslaWp8QsQqjaBNU6uc07xZJLKmFVFKWOCzRCd/TmH0P3UN
	xDJVu+iOnBajQbaoqdGg87rfje7lP3sJLvA94kkHO
X-Gm-Gg: AYBFou1NAOcPuh5sRVWOTmfYSCIqBrokZOmudQrfe4dQx80H9ByIYHFzcjE7U9mu0eg
	EPB/wDerOAKq9s0U4FpV2SkdB+QpkgrPCffLuQboaAhlnqSBBdiEor09AOahVy/lCLzBpaeA/xw
	VukHtLHIk2DKCfflFVRbksHKmPRnLzfQZpZn06LxZxkhjqAKqiwIDg3KMr9ok1MhW6DKOJyxTFj
	KLF9itv12PjwQ4z6LJwtcYMgHUs8/YnVMQSUwhm/XXTqafDtaDMBizfxWD9/JPwHGCHteUOuNz1
	a6MCupRcXVL+SDw+8qs6RY+oHeq2yblFoogj81rNombYvEo636laSQmfkBsCWhz/7i5WsK+DO5i
	hHt6vcs2VwNiYmLGIholC0tqZZwrpH5EVEGO7La7nJbIQKbqu6pGJRsM4lvg+Gi3Us+jxol5IeR
	ZOr7tJOxmfzqoSMO4MQMxzAMQ=
X-Received: by 2002:a05:6512:1111:b0:5c1:4f9f:1ae6 with SMTP id
 2adb3069b0e04-5c1a217f086mr131117e87.15.1794924343575; Tue, 17 Nov 2026
 06:05:43 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116164358.142785-1-steven.price@arm.com> <20261116164358.142785-2-steven.price@arm.com>
In-Reply-To: <20261116164358.142785-2-steven.price@arm.com>
From: Fuad Tabba <tabba@google.com>
Date: Tue, 17 Nov 2026 14:05:07 +0000
X-Gm-Features: AclHuK9jKHIPqUkK3esGB7IzhXZkIYCyUzZ9ZlR4n4bgSHCJJEi20GuUOPH-oTg
Message-ID: <CA+EHjTy5xBmavNWSYPjqU9qXtssV3ZHzsUr1s_4bVOt1GnDLVg@mail.gmail.com>
Subject: Re: [PATCH v3 01/11] KVM: arm64: guest_memfd: Check mmap support when
 preparing memslot
To: Steven Price <steven.price@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>, 
	James Morse <james.morse@arm.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Joey Gouly <joey.gouly@arm.com>, Alexandru Elisei <alexandru.elisei@arm.com>, 
	Christoffer Dall <christoffer.dall@arm.com>, linux-coco@lists.linux.dev, 
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, Gavin Shan <gshan@redhat.com>, 
	Shanker Donthineni <sdonthineni@nvidia.com>, Alper Gun <alpergun@google.com>, 
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Emi Kisanuki <fj0570is@fujitsu.com>, 
	Vishal Annapurve <vannapurve@google.com>, WeiLin.Chang@arm.com, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Kohei Enju <enju.kohei@fujitsu.com>
Content-Type: text/plain; charset="UTF-8"

Hi Steven,

On Mon, 16 Nov 2026 16:43:47 +0000, Steven Price <steven.price@arm.com> wrote:
> Check the guest_memfd backing file when deciding whether an arm64
> memslot has mappable memory rather than checking whether the slot is
> gmem only. A public helper function is added to be able to reuse the
> static kvm_gmem_supports_mmap() function.

nit: could the message say why this is needed? It's a no-op until
patch 8 defines kvm_arch_has_private_mem(), which makes every
guest_memfd slot gmem-only.

Cheers,
/fuad
