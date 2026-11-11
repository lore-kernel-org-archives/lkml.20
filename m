Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.152
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794420415;
	b=31jz13bpzAR2smDrMFV/pJ4VPILClwMdNYgQ3sBWtNGh2P17mzgK4JtzAoyaZ26bqPKg
	 vaZ7SiCcyGI7g8FOuXaK9SVjU6nOlA7btuq+oLDWEhu6mHZTKD+m58aWEw54PHIC67hUc
	 +Erv913b6l6LWxS1XBCNxWF5Mw2lYwqHSUUKgTQ8xzeFvHFuIb91D/AqZSweMEwZoD5fa
	 4AzsReizgSM/a9CaoYUE8Oi1TODe3rc2CtSxfiZxBtCuIw8wx/shY69UVYbN+0SRguach
	 xNqRWQaMwuUrotIYnJ8v6B99FdfegrL62DhIC/rBycohQcZvqCC84dQYIP+bLTGd6jw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794420415;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=nFABM/SwyM5n9FbKHYal/oQliYZ3pyaRcZ9nUutqbLU=;
	b=pOf86GHlQeTnC0fCf6tn51BOXzesLfV7bn1OBkiu9E9xPy9C4a3KoY1i+ljf4SmqOO4D
	 T3dIIIHqYtYBTiPoC15rVPmJYHkTbTeZ5DVlnT7MYvqra1QtafT0F3XJ3zj+/eyMHG9mH
	 q33ooo8fluBl0M77xxORpnRQkfRSjch9aSHCnS9K01Kp0e292wunhUK2+ULj6yeM/yQWW
	 suEzVOjz4WWHb/FBAm7SyJwpSIUE1yA0TcM9dyhJ//2yJpJAWBgQAdtt5fe8GF8+vNK9s
	 x5bQTjjR+V/lcevtzdF7Ehk84ZLUQT0qOiGa3vfCThthL6Gj9ikOQdd6coODEkh/3cg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=xWo8ryPw;
	arc=none smtp.remote-ip=95.215.58.152
Received: from mta1.migadu.com (out-152.mta1.migadu.com [95.215.58.152])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 658BB606A324
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 18:06:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 658BB606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=xWo8ryPw
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=nFABM/SwyM5n9FbKHYal/oQliYZ3pyaRcZ9nUutqbLU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794420410; v=1; x=1795025210;
 b=xWo8ryPwoqxAreNOvZdS+yfwTOEApcWL3Uhhxc43UyCobh8VY7+0xb0a1DuVSl8MMgIPw15V
 njfcfomGCy4PQ6a+j+1N4uQKnopVYXUAQmKZE59DoL859L8TbLuH8+r3NES1fbI4x4wKYNgEi2E
 FlOgXqnau+LLgtmsCy56eA6k=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id c7d70ba1aa6be416;
	Wed, 11 Nov 2026 18:06:50 +0000
X-Mizu-Trace-ID: c7d70ba1aa6be416
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5be58ad9600so189e87.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 10:06:50 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGeQUS7LMFixWPMf2EWaRoAgp2Zx+WXL+Q0K44neWOaho541VuHLUs0fcbc7awq42jePTFU+u+aEOEGUnI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/bTFAMcgTcEB7Xqg7u4HBGWgrjw9eKrMq+f8TWHqBkjEuOLeOO
	I1ItOABcHb6Qz7N3EMZPtJJF86EZ/rRUWxrOA7f3OIXE9+6tCAfHY3v2nbUMeZMU/9+vBS2jXIH
	RiaGrs7lRZkycbTFf2whiQhKEZ9Ht/FlaIFmvru2g
X-Received: by 2002:a05:6512:3054:b0:5bf:f0fb:2c9c with SMTP id
 2adb3069b0e04-5c15d3f5907mr196823e87.5.1794420409621; Wed, 11 Nov 2026
 10:06:49 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261001135711.1640520-1-fuad.tabba@linux.dev>
 <20261001135711.1640520-10-fuad.tabba@linux.dev> <5fa8a1fb-4e2c-4746-8a70-a47f387ef0d6@arm.com>
 <CA+EHjTyCcGPMte9=HuqyvCS7CCCt80Lc_JQuA+1e3ZE+3A0zqQ@mail.gmail.com> <c426f5a3-d161-476d-8911-99903ecf8e46@arm.com>
In-Reply-To: <c426f5a3-d161-476d-8911-99903ecf8e46@arm.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Wed, 11 Nov 2026 18:06:12 +0000
X-Gmail-Original-Message-ID: <CA+EHjTzJggL5gwBT=5+eF-30=W3rHnwtQoCguiqYZrnV-dhQNA@mail.gmail.com>
X-Gm-Features: AclHuK-obnEvFeK-oZDjiRcp3WhqMlDvWCrbcxoPgPML16ljc-27phGiA9oxoSw
Message-ID: <CA+EHjTzJggL5gwBT=5+eF-30=W3rHnwtQoCguiqYZrnV-dhQNA@mail.gmail.com>
Subject: Re: [PATCH v4 09/18] KVM: arm64: Implement HVC handling for protected
 guests at EL2
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	catalin.marinas@arm.com, will@kernel.org, joey.gouly@arm.com, 
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	mark.rutland@arm.com, steven.price@arm.com, vdonnefort@google.com, 
	qperret@google.com
Content-Type: text/plain; charset="UTF-8"

On Wed, 11 Nov 2026 at 17:50, Ryan Roberts <ryan.roberts@arm.com> wrote:
[...]
> > Yes, where the mitigation is the firmware one. The host can disable it
> > with an ARM_SMCCC_ARCH_WORKAROUND_2 call, which EL2 forwards, and EL2
> > doesn't enable it again before running the guest. With TF-A that's
> > only on a Cortex-A76 without SSBS, the only CPU it implements the
> > dynamic workaround for.
>
> If the mitigation is via SSBS but SSBS is not exposed to the guest, I'm guessing
> this is safe because the guest is expected to set SSBS=0 in this case?

Yes. A vCPU is reset with PSTATE.SSBS and SCTLR_EL1.DSSBS clear, so
the guest doesn't have to set it.

Cheers,
/fuad
