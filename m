Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.91
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792607917;
	b=wzKl224cEP5eVwsR+IWl6deY4FL1XeWm+tedtR++Daxv5A7CjKy4quYrDmBiE+XsluT6
	 QE9t6EIOPzmFVMt5mGrEnZ3LWFKeeO5gyhUs3rAAJGrgbW8pe5SdJTwumd4Bhd9+6dijv
	 ZOFYMK5ESBm/GiAHvZzOlGugPjVJIFv0WApkPmywkOADB0Yvt3f0uTd1Qy0oxwWGYyw6K
	 zm2LSjGdpC4xyxjcsZh+MOFsXZFAAOJ8JeyltmKk2e26iwhWG24d+AXNpSqjtiBWaD73d
	 icssADa2KiYw76ROzudfbQ+xX8MFXBTIJ8BFZfXqiZFzkdGwMzf+tJg9Dr4Mme2ryqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792607917;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=K5lls2oC5CObBW2Bul7MC957A+BWsqy4OwbmQJto8Ic=;
	b=H+V1d3Ppc3lpsRRXwr5yGWzP0e7Tb19rfnv5taajrB61KsqBFCy8+eRDBdC08h0YO8nr
	 ybOOELGMaGKNcPO7btfeoIInqBDnwf0n/Nos4nxCiKUNtbqycaGFSBZsyoUjiw45aB4ex
	 rZc22Z62U/XHt3v7pVJY5/uXg7pgCyCOPfd4RUhZItd23/hHMYFSJOnun3hFyFyLvADqF
	 DFfuyT+7CGPXrtocO2ul3Fgfvn67qaYV8OOaytLKtJ6IeeU9lB8McvDpSeYruCgXr+ygW
	 t4B5TGGNGrQkaE/63TvsL/knpRJ1VMQc/s2GAU1+4WsdJ5e/gYemU7k+hR+MEmWRNUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=gE3Ge8o+;
	arc=none smtp.remote-ip=91.218.175.91
Received: from mta0.migadu.com (out-91.mta0.migadu.com [91.218.175.91])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A328A606A327
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 18:38:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A328A606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=gE3Ge8o+
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=K5lls2oC5CObBW2Bul7MC957A+BWsqy4OwbmQJto8Ic=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792607908; v=1; x=1793212708;
 b=gE3Ge8o+zTWGXb2BgqwzwR+bae3CLDsVucyR/vVPSbl0lIjLSj+3DzAfFB+z+LgDxcR4s1EU
 YZh7SizZOYLFA0VgP29v2CDl1yzhvTicNJYYTBzKk2ex4VIin+kqjDMi7ZQhPDf/dmHu7keCdJ5
 A456T9uZXDR2quWjVz5+TADw=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id f13bb8adc30a76e2;
	Wed, 21 Oct 2026 18:38:27 +0000
X-Mizu-Trace-ID: f13bb8adc30a76e2
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5bcbb378fc9so1477e87.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 11:38:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByseKC8hYxlietaNP7pHTg6VqMs3SDJrXItwFrYN236BGiKznQAinGgLJNub/Ja8j3wEqrAzLQteRFT/tY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIxlm2+t8XZNobiOKjZjOmUufQkewvVHZ5mfAHOm0EgSe2iW2AE
	igmCEeWVZCLgPmI4s8P/t2SvXeVjul+8phmV36+m25X+6MnU6/v60kIsET2W37aMWv/TUOSxhOP
	PWf/RkEoGS3eUHMnu1vfPdocNIUCauFwhPzX0PG9t
X-Received: by 2002:a05:6512:12c9:b0:5bc:ed54:d5b1 with SMTP id
 2adb3069b0e04-5be66f68de8mr421311e87.14.1792607906645; Wed, 21 Oct 2026
 11:38:26 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020064306.1542865-1-fuad.tabba@linux.dev>
 <atc2Y4gHwtGlffns@gremlin> <CA+EHjTxMGFuZHPp8ULkpUiGhXos8f1B8kZ1FDigFE7afR=X6AQ@mail.gmail.com>
 <86o6cnywvb.wl-maz@kernel.org> <atjSmLQbm7-_oRPv@gremlin>
In-Reply-To: <atjSmLQbm7-_oRPv@gremlin>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Wed, 21 Oct 2026 19:37:50 +0100
X-Gmail-Original-Message-ID: <CA+EHjTyCLkHwU3NU_s9zeAknG0nU-C9yeB_8VzGgaZvka3vyvA@mail.gmail.com>
X-Gm-Features: AclHuK9BI7fqOPfsqs2U3z4LJDf8paxZf7HpBnvRQgffL6hBNeQHYJuBSCqAjb0
Message-ID: <CA+EHjTyCLkHwU3NU_s9zeAknG0nU-C9yeB_8VzGgaZvka3vyvA@mail.gmail.com>
Subject: Re: [PATCH v3] KVM: arm64: Sanitise ID_AA64MMFR3_EL1.S1P[IO]E
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Mark Brown <broonie@kernel.org>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marc,

On Wed, 21 Oct 2026 15:03:04 +0100, Marc Zyngier <maz@kernel.org> wrote:
[...]
> I don't care about the name, but I don't want the rest of the proposed
> changes.

Let's leave the rest as it is. For the name, would you rename it when
applying, or would you rather I respin?

Thanks,
/fuad
