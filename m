Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.167.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794925056;
	b=IPzY0CQt6uhMHeU9l/9JvwNqD8wthjDsKKvL4DYKnRGTAZ5CGtAt2iM8mDqqibpB7/bR
	 ugXV+NxZBE4MtITI9DDLCyxlRH1kVoHqcMBitP2uBXvi2o6IqizOtJWK9bqiAQseMz2I+
	 eBEDAWgzXDoNVIDLiY4ENHS0gnyEnNN1tNVxX4O3/cy1eV+d1aW6tQNbJ0ZnAPjpkgTFk
	 mqg8TJHlsGOjS6v6wCMS7ULWqn1J/J46fi91tZGWDaLUVHRRCbOq4/drcGWaEdhy58yuu
	 31/39sPPF1kjH+P9k6lykK0hhFYVzvmoZlVNhIVc74hk8zCWj/Qwh8QeWzhCsG0aQBw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794925056;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=BLybj40HRrk+JRnjEtELwllmhvie6n0a34/NGObtXmQ=;
	b=z7js7HPgZdrSw9gebAHWVMAstQhNckur4FNBF9dY68nY5AYJ5A2Mmc9+3U8MjSou9gBr
	 JivLmtS1/1tVM40uNVMfNzyA23yVgu4oobrQReaGSGVU0KV0R2zfwIVQaCUkKz76C6e/P
	 /oHUaMdojJKhTgbMlLewj8Gp/uL6KwkHM83DAd99C8RqQEYO/Rc94MNIAGbFTRu321FLW
	 rS8X3Mt2OEqTTCzSW1wJpDBMNJv0NUXHDvMsSvFTzsfiJcl2Vrr3By+IHB7+p6MZKFxuo
	 W+qHeJegEb7Wtt+shCGvIqDFlc9QT6dz1Xh5iytOrita90x4AWGoGLb9lfmfSvS/2Lw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=NE94En1o;
	arc=fail smtp.remote-ip=209.85.167.42
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61CCC606A323
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:17:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61CCC606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=NE94En1o
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5c14bc5a743so9514e87.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 06:17:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794925054; cv=none;
        d=google.com; s=arc-20260327;
        b=kGhDtnNJfMLhPaXcMCiBDL50y36Ge79mPc2dPCkmkdzvV/oMUmHuxrHDZwlzeaSxna
         l2QoWEjdfaOVC2feEIsVAc8ticPShoTZnZh8RdTxeA4WKoW2b8Pgj+dEnXIMhDDtk99f
         ovgRms0K3jYsM8CVao4jE7CNCtU5VZqsqCSrlkOz3pa+IFhgXJIkM0qqLEbCZZeDyRFT
         J7NigcC8wiQF6IPOcREE6C4jvrCJdBnhRy1aBXpVmBKpbb1pDT1/GxCl+60vipUHH82n
         qX+LSD+1sqqRyumH3EjC0KLwQvFeK2FemgU7AFpuKWBFwiqB+qFjarjKLXmTMKGqJPo4
         QSVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=BLybj40HRrk+JRnjEtELwllmhvie6n0a34/NGObtXmQ=;
        fh=zGjRkfDbukPjgCmcpVIqDICgYIpLRsKWKK2UCPFLfSM=;
        b=WVtxMPHGRDLRBlsD6kkbakE98kuKUlJHgXhBbwtpsMPo6t5jqVk/dQGyy8QYpY7I6L
         W9n/znUpszd6mn/PBykiqFOS4ON2YMr2O1lhFNlJIsmI9vulLeQqhw69xEU8u4Y5kdHD
         liHyl1WJrdisILS5zgJsYH1j7RPhlmswiQHAbDQQIqXxGG9JoNjSGU/CCFjjJm6M3JJz
         0Qc1HhfeKOQFakWzm9nn9uWzkJirnvvbZMHwWPy6gjffhMdw3foe2n0V1zaJB8ibTyZg
         bDaVck257IFpbYwY6Uc+oz1J4fjeFIKLqkop8yM2pqk3IBNF5JuXiUfP2029zGu/4gBA
         9JEA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794925054; x=1795529854; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BLybj40HRrk+JRnjEtELwllmhvie6n0a34/NGObtXmQ=;
        b=NE94En1oWtB7M3svNNdIZ1CeyqcH54dsjN8edk/eQTOdNaL+DYx3WuyhWvAE6Vo+jg
         rIWdRKq0DOR1MKVnm8VeaDk/gdFL/a3sKHAVGQ7Dpx9jprIylDRjEEqKQqa3g8+kXADm
         Xe8qrYxqroN41QyyPemqZTK7OpIGJq5+VU4wXmGXvsW84y5UzlvGZQy21fdWduwkObjO
         KOfEVECEd1jW4X9tCrsgr4QTeXRImEebfcosttWTWIPgVtjMmThcZKM4vb9+AGrrnvb7
         gfmnIvQLyoMX6S/VPZIBQfnVOfDTCO8l4PulQD3QtoOB3ze2vcvRun0+gARfgM+//b7L
         wIAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794925054; x=1795529854;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BLybj40HRrk+JRnjEtELwllmhvie6n0a34/NGObtXmQ=;
        b=P7zeXxhq7Mv5EqbtVGC77obwLyd2q/TY5bxXjWp3Xz/VBiLkx0xyAiK3GK+bVg5Gx0
         hMoMy+RA8MiH42qvZ3MLbHwqgRGVKOZk2bAztFG3GLddwx6/vftmJrVWZ3d1wL4hMeKP
         T/hLXLU6209TOEBP7kiDPugSq7IbQwBPir2ZqMTGsJ7jHJzSpFrqVydAn1BH+H8BxsSH
         qLLdeCma2OxOSlnJZ3tngRhBiCp4DcU1UqJuvENcfjvZUrwi5GPRbP0htMqk5xPIL2UP
         Kl8Ythy76U5jJnGRtA5yPboTlx++23O6HaJ2FlhlBcn3r4ZzcTFsMQFPCFRiElMhZ4wS
         Sfaw==
X-Forwarded-Encrypted: i=1; AL+hErEAiIkuptVSWPdqtB943tRmLfk8smqPc+wWr7SVF27HDAkCOY6k2kwejE0YBLXdYYdluI+xsee7Rz4PzR0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+yyQfAUdE0dORqqrGdhLF3hQh0E6L4hEAPO3gFw3TMM41jnvQl
	mQqS5k3gN5sCW2S8W63IIPhTNLvfGJaWo4vOzjCYH8m9ryllegPYTP6vGSHqMBJmatoMRUtK6N6
	F46MfB5JUbIyb3NhGpBoHLvWEvBrAEKjSHqBR2BSA
X-Gm-Gg: AYBFou3NcxeLFF65OSAf8URbDmgypfV6u7BgSMr5FT3COA9vPPF3WqjV4MCHB1j+ne4
	naLw/fll38pP5hhlEo9n6/7P3tcBvTRw+6D+Xpvny3TS6SW0uRapGC8TwLZIsle00O0fNyPukfh
	Q1lM0Qeqj9fSc50TW4g+7GdYcLSwxICMONWEnYrGS7AFmj3deg6203+z0o1Jtp9vU1hz3Cl6sV/
	m3rRXsr1dMFUrfrWy65g0TjBCG1wo2dptXOr+NxrlZsqSvBt3pEMTFtMf9z8lZTR1gLXYm6xSfx
	EtsNnynInfmWicAs/mY1gyGcvJ4GdEhgNU1Pzwgs3Blmf73/tVZiaD2Rcl39OQIskCG0djezXe7
	iIG0wuwEp51DZfqxg4nWu/9XiDyOvzg2z2eoAAnZQubSnGLmul/Ry6L/OQyKvpWCqud5OnRM9zv
	2tzeHntSnU/NtiN9hnR7Nzk84=
X-Received: by 2002:a05:6512:1320:b0:5bf:f060:c0f3 with SMTP id
 2adb3069b0e04-5c1a218237bmr141450e87.12.1794925053973; Tue, 17 Nov 2026
 06:17:33 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116164358.142785-1-steven.price@arm.com> <20261116164358.142785-4-steven.price@arm.com>
In-Reply-To: <20261116164358.142785-4-steven.price@arm.com>
From: Fuad Tabba <tabba@google.com>
Date: Tue, 17 Nov 2026 14:16:57 +0000
X-Gm-Features: AclHuK961RRQGs05YcwTvTpXpMcWfGbS65nrobWrGykL5gw3Ev5XjAPi08pa1t0
Message-ID: <CA+EHjTyeE0gbLgfiDePPVRR88GFVa7G-G8sr8k6vzM7v_uHxdA@mail.gmail.com>
Subject: Re: [PATCH v3 03/11] KVM: arm64: Handle attributes in stage2_unmap_range
To: Steven Price <steven.price@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>, 
	Oliver Upton <oliver.upton@linux.dev>, Zenghui Yu <yuzenghui@huawei.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Joey Gouly <joey.gouly@arm.com>, Alexandru Elisei <alexandru.elisei@arm.com>, 
	Christoffer Dall <christoffer.dall@arm.com>, linux-coco@lists.linux.dev, 
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, Gavin Shan <gshan@redhat.com>, 
	Shanker Donthineni <sdonthineni@nvidia.com>, Alper Gun <alpergun@google.com>, 
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Emi Kisanuki <fj0570is@fujitsu.com>, 
	Vishal Annapurve <vannapurve@google.com>, WeiLin.Chang@arm.com, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Kohei Enju <enju.kohei@fujitsu.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 16 Nov 2026 16:43:49 +0000, Steven Price <steven.price@arm.com> wrote:
[...]
> With the introduction of private memory support, we need to
> handle invalidation requests with filters for a given type.
> Add support for passing the attributes down.

nit: what this passes down is a filter rather than attributes, in both
the subject and the message.

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad
