Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794691849;
	b=mC6BCM2dmY3Wmwmwac8GTEDboHdzgQTKB3pqHIaFSKLvUMJbyGnodvdaKTT6MgR731ZC
	 vIvZ3svqaVvywooezknBiBdx707fqM3TMmnOyZYIXkFUyOAsP7ZW4FCbQ6TAXYMdR64k7
	 v2+VZOJf6AST0z4n+zzPkVg1jXxdV6C6gnzU+M3uZP0L7EDuMUKUwR/VI4goIpel4KZex
	 5NNzaR3rZeCm6g3MDDXS7tygBpYwbKCU6H5w8n6PFngdwYCugvlWVtjblPGvT51R2Ucfb
	 BvOcbGe8LPHVfm7webHcnNHk6myqALwNP+4vE4VxsldtjYqHusX2BE9h/PuhusXdKMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794691849;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=vju4Tmf9HxWLCGDozxlRYY/dKPR1MEju5ORsVHds9AY=;
	b=NCV6jwSHX13UjJjU2WfrJuWUnHSMjQfzJTg0IaNJCXTE6k9txnFvJq4LPfopPJe3QhZC
	 w5WOSid+HfZLGhEwfqHZyaweetecLA+wuc+g+LqQKff7KZQWivk7ZcFeXXWOYZHjXDZDr
	 P63OP/0kbYDJUrp6FmhoKulRapCG+1qFE5l/LZgQ8YmkGrLG+kSPDBwfMtggt1NmWC2dr
	 MaxWmwN7ZaCDkurqGlEYaxu70RlIW4GggytMB/G9S3x4QTlFPD5mT9Yy2oij8KSUZcM5b
	 uZzrwI5NMbW6X8vTjPG9ZEZrRA8lcF4pj6McjBklhHVJaEVKTzH22HrEiS5h0NUQyNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lWlSLmZa;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1F5E606A331
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 21:30:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1F5E606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lWlSLmZa
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a2072b9832so17852755e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 13:30:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794691847; x=1795296647; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vju4Tmf9HxWLCGDozxlRYY/dKPR1MEju5ORsVHds9AY=;
        b=lWlSLmZaPq3CwNa2GvJ5HLBZxwrHAyR4KYWcNLYDoejqq+bHE47WezKQusTce17cqB
         UTWjdD/IlmKTsXW86lcI5Re+obIoVIb9t86LrcMAeziz9eDWUmhlf0tEDJWLXl6iumFV
         A0KOTfltxQB7iH/1NZqAz8vQsctKFp7PZfZL10agBOyW0+/+Nlq4fquLxNOefQolK0q1
         7b1VyBrgPTzn3K2O93/7d5x0teNBV9W1gjmQsMpDfJX8yxuUQvPJ+6K/Js0FjGNLg/bj
         pddRJxGyyKNTa55ItmUV+vqh3pU2XKCHu2EjpM7+mnWtIVQHlY7yLwHWBA9Qc69Hd/il
         +DeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794691847; x=1795296647;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vju4Tmf9HxWLCGDozxlRYY/dKPR1MEju5ORsVHds9AY=;
        b=THHNJmRzn1jRmwwdFfUQz4Vv0mDsQtT/MzIVREetkWIv11LL58hY95ddtLM3Vx5Lph
         OsVvBO3H9KeZarMokKtbPR0tgQQshabsdXzpCF2HUfoz6dCyIJXnMdWSDLaFr1x2+l0k
         L4yYPfNbkMxh0YhMOdrIO+jIcNnU5iFvxYCmEyhliK1AfPfZvl1uXnsbMjpmZBFbr3ke
         B/QLfOL9kuR9I5aUq5pqgMotsNciXfqHOLSJ8aWgYsSOabQPRqIZYMYGPJPzuw+Qhgz6
         uh5YeHDyu3lj3HWgOzmJ+/iuLOdc0ixqTwIrdMR/s20sHbeA5HI01XWj0YlEU+3tTpPr
         7Vgg==
X-Forwarded-Encrypted: i=1; AL+hErHZPUD0e0LVMDoaUvLuiELt+zkQSLLA6Br4IvlIptsZGVAYYR87aJtSOmQNWl00gVsDRbb/XlD2E0BUsBs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/RC86Xs/HQMT0q/nnmsVWxKEVqyZgoK94Tr38HNBq2j7gGO7v8
	KIBp1bvTpcBsbSmx5jF6pwsFj1w+OR3EqoEc1llE+N18wLYwS8tzGl/d
X-Gm-Gg: AYBFou1hAisiScbJTsGJtYPvWplY/Voft94x+FW52D1SCnL/zoZhq/y/RNNEPCmJMUN
	kMSqUJpM+XLO8FqPNVvyq9lIBPBKbpLDxOQiRODZLZ8A/pTjgllwfgOeG0aBMpDwvqjQtR3wha3
	UpQ14AWzoUKafV946U8IY51X6SK1RAMiZAJ71rSk1m0Uk+YUCSxLGDiNqLo1jsoKAq4KbSeHn5T
	pLcrNLjP7+dCnkqXI+K2BgOVbKQy+AX7hMtX2TJjy4tkWDQ7aprMOuqZTptTdJsGHpxLZIqgr5C
	LCOARuXpM7TEq75q7aDIjvFAiOy1ygQkyS8Rm+aO1myWj1nVwgMxqfXPL7T1AQ+45V0bRv2vBAm
	R0gt5kB6O/C4a+ImXfLreaaMlXWsbdJUGrbh/er8OC7URasdmMVDMBJRSkdUimohIGXRX13DClu
	PMyeLe7/7MSMgQKSVCmdkK9FYSLMtnhhDEO6lvgvN2MfT3EyMHCNK9kmzROLrM1BUediTtiVTYi
	y9PTHa8VgBOJTEkexYsiv9zdGoPA4fn1iO/naQDtqBPGkR0jIyL9HULqT5HxN8e+ohVOWlADozP
	cCZn5LXwy36xSyvJjWMcDcU5NWE=
X-Received: by 2002:a05:600c:2784:b0:4a1:d49e:9ce with SMTP id 5b1f17b1804b1-4bb4e2918b1mr187322445e9.2.1794691847097;
        Sat, 14 Nov 2026 13:30:47 -0800 (PST)
Received: from flare5 ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c603f4e2esm12803478f8f.36.2026.11.14.13.30.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 13:30:46 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Robert Marko <robimarko@gmail.com>,
	Guru Das Srinagesh <linux@gurudas.dev>,
	Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Lee Jones <lee@kernel.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Bart Van Assche <bvanassche@acm.org>,
	Bean Huo <beanhuo@micron.com>,
	Stanley Jhu <stanleyjhu@google.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Amit Kucheria <amitk@kernel.org>,
	Thara Gopinath <thara.gopinath@gmail.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Georgi Djakov <djakov@kernel.org>,
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-usb@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-scsi@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH 16/17] arm64: dts: qcom: Add initial Halliday dtsi
Date: Sat, 14 Nov 2026 21:30:28 +0000
Message-ID: <20261114213028.1933448-1-lightofmysoul@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <0cac5090-a135-4a6c-8221-846b34ed5513@oss.qualcomm.com>
References: <20261109-halliday-dts-v1-0-289114ab8197@gmail.com> <20261109-halliday-dts-v1-16-289114ab8197@gmail.com> <0cac5090-a135-4a6c-8221-846b34ed5513@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On 13/11/2026 13:10, Konrad Dybcio wrote:
> Please add the other idle states (D4 and E3) from the downstream
> devicetree and match the order of properties (psci-suspend param)
> to glymur.dtsi

Thanks for the review. D4 and E3 are already there, as cluster_sleep_0
(0x41000044) and cluster_sleep_1 (0x4100c344) in domain-idle-states,
just above idle-states. In v2 I'll move that node below idle-states and
order the properties like glymur.dtsi.

> Please use '0x0' for zeroes in reg values

> Let's break up such long lists into one-a-line

I'll fix both in v2.

Best regards,
Stanislav
