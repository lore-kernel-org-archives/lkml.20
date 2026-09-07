Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4B8F4F0538
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 13:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788788684; cv=none; b=pXgxzT3yachCB9bXXwlEBC77dcWNEVx/91BA6tGWRDLjT1CgaHQCBHGnPeNYHMdbSzgYIqv8YULczpfxwOeyhrMYqcPYnFwzYM8qxGrLfmvTS+VCFByZvzgZEMLFu0gs60Vemz5/Tf98Jx00HqM6x1ASFZW5iBVJEtRBEBOmBtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788788684; c=relaxed/simple;
	bh=tJ+ci/OjwSH4g1HCdnKxOeDgMxc+hJOL4wmM9HhLWos=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pz0k7dmhQuQfiCdAcuLrNo8VKme0sB1jTHylTGShpUBVqI9ylk2xyA6ulZsJi4MuEnjUJclGKjq7Ahz6aNQ8/oNJ3eG+uXxVeKL2S0fJWXAPwnFvYnA2PhdeouxI1qOFA8+ZKUhNeD49trjsjPoC/2FEsJRLQlM65+5TXl3oYCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TUESuyC3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TUESuyC3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 887171F0155B
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 13:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788788675;
	bh=tJ+ci/OjwSH4g1HCdnKxOeDgMxc+hJOL4wmM9HhLWos=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=TUESuyC39HYj6EVNoJmtNo+u8Gw90rhQmKrgfvDOVCjMqKysq/iTciWXc+RGqlCeU
	 97XngaPTehi3rDaxCqJSeed8z+KW7p0c1F/L3StHY4Q+kz1bnvPZK7YzvOFRf+QDVY
	 5hhHKFCOt1zKW2DVSBDONaywTOQ88G1kRQFFfqrZtSug+mwSPCC6CbqDSfNlEtzdZw
	 34MR570w80SZ8aIicpmzaYiVqxenyYRV2nrjm5SzPiTEaFopkeBxHqLRtSAy71Dm2u
	 GsayiaXswEvw3b3PvDOHjR2By003w2LGuMdTnJzDE25llMD5cE2D1SzHCK+QImBi1/
	 pe36niYw/3oHQ==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5b4ae0b3308so2498302e87.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 06:44:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBx9Tt3CmPaxZyIU5uf/vPJQaGTyMrMNEVWDkjLfjnSQyyj+Fmrv/yzdWQUaWYBkkqolcROGIWK1tVZckPk=@vger.kernel.org
X-Gm-Message-State: AFuF++ntAa+cSecFJOcFZOPlPr13PKfHSgGSvdtpvu39+CuTTQnLJPMe
	wc9mPEJnY1uWYKZX7beVfSL7jVihPv46qLl2e3ZaW9Uu72LSzSbxAsswzC2GVJddZ1gnTaYQdfF
	TQPX/q9UDdRIWjtdSgmGrGk9OLUQQJcxDW0YVwGfPUg==
X-Received: by 2002:a05:6512:baa:b0:5b6:1a7d:553b with SMTP id
 2adb3069b0e04-5b61a7d5899mr3225959e87.63.1788788674151; Mon, 07 Sep 2026
 06:44:34 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 7 Sep 2026 06:44:32 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 7 Sep 2026 06:44:32 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <841a008a-1ce6-40f9-95ad-09b4abc7456a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907-b4-shikra_crypto_changse-v6-0-0676f61894b3@oss.qualcomm.com>
 <20260907-b4-shikra_crypto_changse-v6-2-0676f61894b3@oss.qualcomm.com>
 <iow4xf2uflvjduax55tkbhaw2r4436uqvys22u6pbm3ry2gryw@g777gu46cgin> <841a008a-1ce6-40f9-95ad-09b4abc7456a@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 06:44:32 -0700
X-Gmail-Original-Message-ID: <CAMRc=MefGHidh=BH+iF-4F5hJku333p4OMe=g5p7dfw_ieTfMA@mail.gmail.com>
X-Gm-Features: AcwNN1UE-xk-gq1trefKbWs4xIbafCmkL-IwujrEOLIyY7VGNHY6z5QgxqvdZ2g
Message-ID: <CAMRc=MefGHidh=BH+iF-4F5hJku333p4OMe=g5p7dfw_ieTfMA@mail.gmail.com>
Subject: Re: [PATCH v6 2/2] arm64: dts: qcom: shikra: Correct QCE node configuration
To: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
	linux-crypto@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 7 Sep 2026 15:39:10 +0200, Kuldeep Singh
<kuldeep.singh@oss.qualcomm.com> said:
> On 07-09-2026 19:01, Abel Vesa wrote:
>> On 26-09-07 17:33:37, Kuldeep Singh wrote:
>>> Shikra is derived from Agatti and uses the same QCE integration.
>>> Update the QCE node to match the underlying hardware implementation by
>>> adjusting the fallback compatible and related properties, including
>>> clocks and clock-names.
>>>
>>> Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
>>
>> No fixes tag ?
>
> I was having confusion so didn't add it.
>
> The parent change is in linux-next branch and not in torvalds tree
> currently.
> Shall i update Fixes tag based on linux-next commit only? or not needed
> at all?
>

It still makes sense to add Fixes tag even if it's targetting the next cycle
and fixing an issue queued for v7.4.

Thanks,
Bart
