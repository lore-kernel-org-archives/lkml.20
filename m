Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794808854;
	b=1aK7M5b16f/2ddAk7F+GmfzWbI6NTFGUlxdZuH5B58q5jZXeG48TMOXOz8AUT5Bu8gzZ
	 VTxhD3g49bTPnRRMCobL84MtthA8e61Qh76BKVp+48lBKecltR7XS/yGJnAqct8Ni9KyD
	 KMwI4tFHK7y95HISFSM0xS3LNV0PPBuGayS3ps1H4L713zYmSRWwubHh9I42BPBoDkZZy
	 JjuBJqjuknaYUDC0zSo63JXPCn+AxdoWXqSZyqZZuNYLXnfTYRxijyOcq/XXIReyE1cUM
	 aiIhCNA3QViaczdoPQcb0mM1xVyB3QM5YmyC/L43futO4RKqQ9qhUnrtc/5EkDkpoaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794808854;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition;
	bh=WFV4t0eUs0gbqqsFkBQx5rUyLF4Yon8sMLY8mNC/aTw=;
	b=KsP/PZ7k9B/0dPNNfpXy5kloSVNVlCtWTOiy7AH0GuCoB8lMmJ8T/1DRr6hFKjGYxzxk
	 rQUYyeu9GblIpqBmYh1lmzw7sAOdgb4QpsIY5BVsQkFRDktzYwi3Iv97vGZwWalWrd+k8
	 9C4qvEie7YufT8njWWlXZyijJcwzHb2J7zHv79vqSSvWTbAeYEZPAyuz7pmLbI6Ecy/n1
	 nWvuyknVJZGWOq2Ur6l+1tUmYhsG35R26jCR4fOu1GPeEH0NKUP1tX1r9L3jFXFX40aij
	 3gZYxKKMXOzncpeRoYFIiPKQFcZBV7wEGewfYCwecWzl+FT1WA4LTLfgPjz6Gios6wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pereq.eu;
	spf=pass smtp.mailfrom=cryspen.com;
	dkim=pass header.d=pereq.eu header.i=@pereq.eu header.a=rsa-sha256 header.s=google header.b=hAFVUx87;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46CB3606A329
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 06:00:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46CB3606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pereq.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cryspen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pereq.eu header.i=@pereq.eu header.a=rsa-sha256 header.s=google header.b=hAFVUx87
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48e3b22e971so1420813f8f.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 22:00:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pereq.eu; s=google; t=1794808853; x=1795413653; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WFV4t0eUs0gbqqsFkBQx5rUyLF4Yon8sMLY8mNC/aTw=;
        b=hAFVUx87sZVgEQaevZkpavXQfTpkLGFigmhJ/OwHhgf/Udl7Mg6tPyB2IY6ri9roYH
         9XAUu/J8XLcYdrCDdhMgj4EG+1QQ/kqRiGHEApUaBhPUuleA/CDaS6Q0WtV1jQGsRsUn
         UbIerydcMfSpy4sh346iqLnvNKmoqVtOhagBKc5F4YwEwrWXwcG7Mpn1wI3BFxOYiND3
         gwf4FU6cTXvgPBPPK8knzHaAfc+A923nvbbf/fin/+vzV+fwqH/sAb4hogy0h5/rCk4R
         IDB5C1M97aDSCpER9i8No6m4JK6uQPy+KaC7ux12TropOBhFL1bMUkc9rbZ7oFAt09cN
         rfOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794808853; x=1795413653;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WFV4t0eUs0gbqqsFkBQx5rUyLF4Yon8sMLY8mNC/aTw=;
        b=BoSYXoa7/0DLvrtbH/SvftLqv38cMa+FH9YYgT3Uxa/FLeHA1cvSXatRlyKfm00yRs
         kURyXqxzjB3Sy48IjxQP0coQ8hYkUVRdv6KxfKpUjPvLu1b5MLLEo1ebd4LKgrqU1yOu
         krjGtxVt5Vr8Hbp09sL421Gwp9DYl4P+717rMzhO3BSa8vs6T/BlxYMO848UFlBV1vy6
         M/IrQ4bnfjFy7zS4w+gm1wzUt/EwCDdqWLw+FTtaKYoxts9Uw/rDPvwBCXxxHVSQuh48
         ybwsOvXKNdXTi0MetcJO4UKCRLS9DVifvcGF+4VHbhdadJ9Mg8s1sv+RjhcprYrEFsKp
         P9fA==
X-Forwarded-Encrypted: i=1; AL+hErGYJlo5v+aZjwtmhdnR9+Rf78uRpassrq+5VVBX79QYfqRw2LxSVHve9zU4uvqVGfmNudK0/qb65Cqy7/s=@vger.kernel.org
X-Gm-Message-State: APuU4Z8nbZQjs+edPLcpnuQGaqAROTai1aSft/jNnXiKwU7DLHQePxeZ
	IbRC55+dwc9QQyfI/aLuJKF8tduOOYufnFCmb4AsVPZKR8E3pTpvQM6gw6C/BKyBI1I=
X-Gm-Gg: AYBFou3oNwRBmMvjsK+B2uuwccTDa8n3g1k8puPX4VVM74U+QSCY2vYKqqOPiLo6vgo
	EzmvMrDuIzKw+5Cmt0u9zRCbB6jxWO1CA+sM8k5CNiMQjThaOVhkBldZ+X1in+pUda7SLvzjtrV
	bLh4WzJrXV3KfUffo1FcMdqXec+Z3UQLK1k5wW2/bchzoD3WswkoA/SpR7WDBepB/SCFzxZ0qq9
	VjvFTKyBklHNmLXYz7i31PLMD3KHLlcbUR43sfPneSVQ2K6pcftYnUdA8wxff9dTemolHFgQWdJ
	e8YbD1KR+GtPZhPe6k0NsBJxawEiee77OcQgNc4Qei26u+yZllCGW1spfp/ikQZwbedFWsXLHCP
	rNZjlUSDaULaYqp9uAUZzcL66eOzYMwAdflQ5aqoGr7UkH0PpZ9dh6C3o/MFIMzLzI+liElto7h
	4T2YxaRbC3UyQQfSUEnqzjo4U2nYHuabLXb2ALmp61EbWyO8JY0FsBskgE6+ZWpRrprKzTPAht0
	1AswezvDkz7BwouRwV8PjIeDF++iGpI0TvI7nVKH/TnsYPxmVAgjzWl2UYS/p/KBVCnHATwhXTC
	ZQ8qv2yd1d3uz5rmUEs=
X-Received: by 2002:a5d:5e85:0:b0:48d:f391:5c45 with SMTP id ffacd0b85a97d-49c740bcf7amr18562595f8f.42.1794808852035;
        Sun, 15 Nov 2026 22:00:52 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c6020bb7dsm20283638f8f.33.2026.11.15.22.00.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:00:51 -0800 (PST)
Date: Mon, 16 Nov 2026 09:00:48 +0300
From: Dan Carpenter <dan@pereq.eu>
To: Marc Zyngier <maz@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Jintack Lim <jintack.lim@linaro.org>,
	Joey Gouly <joey.gouly@arm.com>, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Mark Rutland <mark.rutland@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Will Deacon <will@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>,
	Karthik Bhargavan <karthik@pereq.eu>,
	=?iso-8859-1?Q?Cl=E9ment?= Blaudeau <clement@cryspen.com>
Subject: [PATCH 0/2] KVM: arm64: nv: fix a couple bugs in AT emulation
Message-ID: <cover.1794808373.git.dan@pereq.eu>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

These are two bugs in __kvm_at_s1e01_fast() which affect nested
virtualization on arm64.

They were found as part of our Formal Analysis work at Pereq.

I have tried my best to get things right and I have tested the results
but please understand that I am a newbie in this area and review
accordingly.

Dan Carpenter (2):
  KVM: arm64: nv: Fix AT emulation for TCR2_EL1
  KVM: arm64: nv: Update the shadow MMU's VMID for AT emulation

 arch/arm64/kvm/at.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

-- 
2.53.0

