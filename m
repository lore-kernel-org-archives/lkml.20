Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 854BA535FC2
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 13:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791984786; cv=none; b=q3GkkJnzraHZjjFEbRy+zBnIDG2wk1NiRSowC5iwTF1ylTmKtwBpbr5mbvsRJ3B5RSwySzaoOqrdL1+8FZx/q1MviHLtpRLi4OAex/WT9tKN/UeyA+YTUjjGGzLdGXZVXD51PPBLpfxU+1Lr3zytTI+tlRlKpS10Df7K/6L4fMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791984786; c=relaxed/simple;
	bh=SPu80Je3dTPDgjXd/xtDzro2TjdOg+amy0NWrDljosw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=os4x0xGPP4Z7jY+Omf6mvZEp1PDyeT0Je1rZpU1U/qPuTBjdEAWhQbI3fohRvWEda8V58kRRpAXYVIEnXLDHsH/2EkotBVisUog+QqhQAhEPV6a735iBlRICBT/5+dfIUG4pOO1EFavrbb3EYGyVU892+W4MFNDXjEiO48z3Gfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ieee.org; spf=pass smtp.mailfrom=ieee.org; dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b=Zysgiwzg; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ieee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ieee.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b="Zysgiwzg"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-91b89c6caffso3098826d6.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 06:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1791984777; x=1792589577; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=73j1Xe+ZfqaJi3on6arYGnmiJ9i1fPqoI4qWuMUvRuk=;
        b=ZysgiwzguiA768gLunEoptXjGhw9IhdcXFelwHTkAizujtkcCr1vXMCvQrslumkY1i
         vJ6wdSZWE7Bzc/qypjYs6wipaWPiLgUyPkW/fhFssjOgG3Zln2N8VahV47Pi0rizYVL6
         4GYVYsU4uFsNmMqfgrLe87hScq19hdk9XaGNs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791984777; x=1792589577;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=73j1Xe+ZfqaJi3on6arYGnmiJ9i1fPqoI4qWuMUvRuk=;
        b=K6OeHYdzuwnR1m4jA4A46SFi6d/yUq1IqcrFjUCtFlB19IpNrvtBeS/mlNc5SugIsR
         QfItpJmfcxG0uTo5RUP4X6TLFkVsF12kynIGMxGH4svHolnW4z6uc3by9ywWOrghXAbf
         ZBxLygS9xdeBldBonStSOvFBY0P4taM/TsRpehIJDmmoxwY/etXUORTqCzGr91cqF6/2
         SbPO661YAnqmW2zglHTq2dk0R9tej7Kuf5X+mfh3oHSK3gB2Cp8qJJPtl3zCECE6dmTg
         CmcBqe6mIcsCNMe4pFnlMavZd3wrqFz530CwzEDaXCpto5HOLveJ8YbSL3uGaQ7QqaGy
         eP6w==
X-Forwarded-Encrypted: i=1; AKwUvByUa4sPorjzu2xrQMWwTZNadRofbkQM1AFlMB5oSNf+vdyLzibRWnrCDNSLu9EmAjRG2DwCySw3YNiU5Tw=@vger.kernel.org
X-Gm-Message-State: AFq9FYK7k7AOXjQq/DkG20ChRoKSmIdNoYVZJvZi39lq3m9jLfgHtaW6
	b94HpUdGJzbNPTt7IAZL+zmlX4I558sdBxxTGge6wti5vj8VdVJ4iepREgeJCoGubxk8oFuRD5j
	FlnHNVw==
X-Gm-Gg: AYBFou2fqhN51Ipqi8EIAscRoxL3/JvtPWgRO3GxuO7P5lz9pytPXL6ms4mNFTXPxM4
	Pvq/xil81at7gnFUFWQcJGdCG49ZcTHkz9zeSm9jCwCRNx6UUOHLcVT9A9e9oKv+WYE7nHNIohg
	l1VEeiYCSNDay/TsQoLFrjVFFEgYhb/QcLqXVHl3YbwLSlit0xzvtKEs9HLoTGqJpW4c0Y5J0Iv
	DqAxvpX5f+SJStvCIb6EqlCkB1rKwenxQu8JJXaqI+TMuzAQqREhY2yZTMExr+eEToaehH4Za0c
	OQ29EThLp3TMnRm71KX1vdRFtRpuJt1TcBTzJc8NDk651bD9vZ5K6YlbpqduLad63q48YsPdZmI
	iS8rb6mrktKm+ozgA2yYaxyV9OMQL0BeeyXXfBfgKB6Qa/W4+Rm9C66KChjphDK0HBpq0Hw4F6k
	7OtZ28v7aXxEDg7n9ZHVKpmww+9erXyMlx3NyHT+8qn1JFZ4KQrOFhJ/b0nM5H8RZhgQ==
X-Received: by 2002:a05:6214:f62:b0:914:4bd3:d98a with SMTP id 6a1803df08f44-91b554ec1admr254244676d6.14.1791984776796;
        Wed, 14 Oct 2026 06:32:56 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.googlemail.com with ESMTPSA id 6a1803df08f44-91b97b62225sm53259996d6.19.2026.10.14.06.32.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 06:32:56 -0700 (PDT)
Message-ID: <26a2a4af-5d27-4bd5-b284-3758fa7a67b2@ieee.org>
Date: Wed, 14 Oct 2026 08:32:54 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] staging: greybus: replace PTR_ERR() with %pe in error
 messages
To: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
Cc: johan@kernel.org, gregkh@linuxfoundation.org, vireshk@kernel.org,
 elder@kernel.org, greybus-dev@lists.linaro.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 outreachy@lists.linux.dev, gservice341@gmail.com
References: <20261013022402.6322-1-pavankumaryalagada@gmail.com>
 <2fd23f9b-7eab-4afd-aa77-93a5b9ff0c75@ieee.org> <as6mC7sZnpqIKxN6@user>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <as6mC7sZnpqIKxN6@user>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/13/26 4:43 PM, Yalagada Pavan Kumar wrote:
>> I think your suggested change is a net positive, but
>> doing it in some spots but not others means it is
>> adding a bit of inconsistency.
> I agree that similar cases elsewhere in Greybus are worth
> checking to keep error reporting consistent. I will look
> at the other Greybus files for cases where using %pe would
> be appropriate.
> 
> Would you prefer me to extend this change to the other
> relevant Greybus files, or keep this patch focused on
> fw-core.c and submit a separate patch for the remaining
> changes?

I guess I mainly wanted to understand your intent.  I don't
really mind your proposed change, but I would really prefer
to have it be part of an overall plan to upgrade all error
messages this way.

Ideally error (and other) messages are done consistently,
and so changing them in just one file sort of raises a flag
for me.

Can you survey the messages elsewhere in the Greybus code
and get a sense of how much work it will be to do this
comprehensively?  Your current patch affects four spots in
one source file; how many others would there be?

And if updating everything is a task you're willing to do,
then I think I would prefer you extend this change.

					-Alex
