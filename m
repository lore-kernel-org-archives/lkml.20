Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794213270;
	b=g6Sqxz9b6878hPsrz32/ZbBqaInUgjx3oXBTJNk/keQWeJwFuxX8KBQ7amBTCpHrpGox
	 IEUtw32tdv4jenklzpFtMS/UVRLm+hUEPZO91+s0j4op4Lq+qHJtn5NOpOfoSQaTo+kSX
	 ia93jbr0suDthJOBybheZk7Q7AWXc7yaYOpRPHkhR7cW+Vc795wCEfDUcRI8/rSrlcqu0
	 rMGjfs3TT+IoRVPEmsYR6ZjR6njhZ4PQox6aTDS2q0trVAGtl9oQcsxefAJ5X3O8mne4q
	 laZeRavtUk6u5x44/5OqakLAIeAxHVb88F01fjyDlbwHVv0znh9nLm3MNPUufMd+QnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794213270;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=c4oUrKNqRmXGAABQI1ffO/xz156j8z3MxBWtBBOrMPM=;
	b=et2xxtQLiHEf7A67WHSeNWIZTsU526EJb2Otnp7Dc7dRY8Sb3yh7kVOWLQAC1Vux7xP2
	 huGRxm0CQnHxAbv8a0FPWXi0Iob9n2e1V1/fnH94m++yMRzbLNCz26MUMGBcIgqmRg8EP
	 SF73qaZ27oojEtM8aZoo4E1K9fJTwSBQ0JzNkQivCfJbm5VZ2FE1U9a3OrCwY/OWMqASh
	 6tDS+ilmXjgC0GkDeP/ar7K+A261VhVWtJ/o5Rf4wJqAY69WdR61eCYGXefDMcBZLn9kJ
	 f/o/kwwwnZP+rM1+hfj678RdfKN7KY4IiqyZAU4WUIdBrFO8tFB8rGhiQmQAx9Via9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="m87H/yaZ";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id F2C16606D816
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 08:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m87H/yaZ
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id CA7791F0089F;
	Mon,  9 Nov 2026 08:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794213269;
	bh=c4oUrKNqRmXGAABQI1ffO/xz156j8z3MxBWtBBOrMPM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=m87H/yaZAxnEor9h5r+tCH8Ghg06b2gxj+b0CMQuR0i46OjyPkPymxM2UBdMzxIml
	 hzqzOBo4hGT8wpYTV2r+FcLU2j1A/6uc4LaostTmJFM8/5JapOE0vooZwImPQvfaFb
	 WTBKrlmdVykEu6FAZobvfN8HL3Z2p+3sjoIASTseZOhx1igWiscM7wpSJne0ZM5NMO
	 4EAWHVd4S/V4Lo2I9GgPdKJorLcBba25idUUx7eUkV21p01ULTQ+kSVhnrmH+Y5Qro
	 yKL10EI88QIX5l0+T6G4PsewgzBQzfxxtIQETWv16+nQabmPdXjq1H0HZ9BIPvtn3H
	 PqRp1li2mtZ1A==
Date: Mon, 9 Nov 2026 09:34:26 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Yige Jiang <yigejiang86@gmail.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, WenTao Liang <vulab@iscas.ac.cn>
Subject: Re: [PATCH v2] regulator: as3722: use the platform OF node setter
Message-ID: <xzj4mdofe6y7qvy5aqte3fk5myprfvkz4tnnga5cj4dbch7zxg@k6ntb6ypxstx>
References: <rc-review-20261103-19-ee1e37733b2e@gmail.com>
 <brzyrqnyrayxdpnyginamtdewj6cp3odhndlstjp6kupnr4q3e@rt73ebxxvbms>
 <20261105100342.34730-1-yigejiang86@gmail.com>
 <179406780591.3424803.16395424488807885604.b4-review@b4>
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
In-Reply-To: <179406780591.3424803.16395424488807885604.b4-review@b4>

On Sat, Nov 07, 2026 at 04:10:05PM +0000, Mark Brown wrote:
> > Use platform_device_set_of_node() to synchronize both fields and
> > give the device its own reference. Use __free(device_node) to release
> 
> >  static int as3722_get_regulator_dt_data(struct platform_device *pdev,
> >  		struct as3722_regulators *as3722_regs)
> >  {
> 
> > -	pdev->dev.of_node = np;
> > +	platform_device_set_of_node(pdev, np);
> 
> Are you sure this is safe to use during probe(), which must of necessity
> happen after platform_device_add()?  In particular with the interactions
> with fw_devlink.
>

Good catch. I'm surprised sashiko didn't spot it.

Thanks,
Bartosz
