Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01A22221DAE
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 01:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792027398; cv=none; b=GLZXKN3z6TBBYFbi+IAendWhHbQhIpZAV8l8xGvSBUok7bvv32FFPLhfpjAg2b7jQSGkVvRL8X42uBtmej1npoFEV1F+6PXp7bgjWEHs0UnZ66wKg9tOKcDmsIICCImJrotjZuIpn4Z32IclSLcAyx/6nU1bgclkY3m75iribXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792027398; c=relaxed/simple;
	bh=7ficzhK3Rhv6KNOjHabHwbT4xbc1BJMxfoyzCtkPbaI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qNHgnvvDW8vvHQiSATvvhHQpDGQFbm4pphnKaEAd2KqnaycCxt5huIUHwHzdVIl3vJb/2ce5LWbjBObGHM2BkKCTvPzn+uk5k/SfoS9kHyF+Vpeuer/KrtVEeM+zYChgH1gcCasDM2EzN1nJvL7YpxUQCXlQfHeXSfXlYwWnT5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ieee.org; spf=pass smtp.mailfrom=ieee.org; dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b=Vp+NEvvz; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ieee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ieee.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b="Vp+NEvvz"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-53391786e55so77409741cf.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 18:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1792027396; x=1792632196; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tDPLaKfb2lMm0cNVfzQxbfZzYs380EKo9PAZuk6Z0DE=;
        b=Vp+NEvvzOXnEIYPrqn+G5l7eCH3eikE3WhZPGidr4Xe8nWHOU+s188s3wNr5N1jWYq
         kW65cWoRgd7JCPCPo2J7MKnG9ceO2c1i+9Brt1/Ur4gtkL71/5tiM8iyvkAAfZDEl/KE
         Nk1thuxHtD8ZGW42jFHbiLMm7DGjpfLGuiUQ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792027396; x=1792632196;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tDPLaKfb2lMm0cNVfzQxbfZzYs380EKo9PAZuk6Z0DE=;
        b=AfJn3xn1bqW0c1wEqaIvcyVml6wiRHaF5m28/yC+1i85sfJ1u2jt0nYTiCLwZCV/4P
         MSn33cU4E9w12pLzOzYabTcjv/NY4NGqIDqcPTvKB9gTeDRZvtBYu/zVj4h0qvatIQwh
         IrzO6ydEONxUowlUrmoGFnRzywVKE9k5rlS1oSyCr9svxH1KhV84+ua1OYUZDVDVijjr
         3vYalwk4RY+Jn56+Fw+uSnC9fapHM4NpheijEBIOPULHaqmdWvA87//3hcONhOZMdKJ7
         W28szoKfciVHfW+FETR7spzQt+KocDTUym/je6CSMog/xWm65Cq+jnc1u1fNdNUrj9CC
         hMJg==
X-Forwarded-Encrypted: i=1; AKwUvBx00kc2Xyvaa9ZOYCBNVhWjxBySXF30v4/hkEUmmY5H1UKxvxPCX1T4cornsfzxgyu5zP9MXCPJkw6f5hg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJN8UugPUsehZKQxqkXF0goBbv4d+FbzRolEtU0m9H3aO5c6y1L
	zPkCPZB2jVp8Og8VM4ActHJu4at4paRk7t4QT1jmeiG0Gv7qlCQHJ6D2dmcNSgYzIQ==
X-Gm-Gg: AYBFou0PHXh8pKmGKwaXMGKV6T7DKNuAdxNxmFVC+3o/VJ8fBwVHBnv8e2yFINrzDaJ
	wgnYnJ05Nd36BUx7zWy3cyA/HiJUdvuauB8hCod7LKN3bBtjqOIf68TKqVCQmUdKzf6BhZG+EIj
	Md616r8joHTY2aeJUG5VN9Cqr3jaKnHTLb3udnaPRZKcN7y5T0LmkufIDF+VW+rClytpvVPQCw3
	Ixq72beumeZbdTDc3FUqfKK2+myUkEyu38KuCgkjv2AB82BGLhaQ7IU+4MCcfhutuTzK68sMfNe
	OvMucscrMILzlN0Hkx7iQrzMNK2xWlAfxMRHE87/VEGUTKy46NKMQ4yPl2oUOJgCW9dulYkuUV/
	X5SdmVxzpnOKvBLRTv7kB0OuWQf34/dX0tC6nvqWQXuEfz2Lz3/1Mr+tImqlANurYA0L4Wpd4z0
	56tp3Fw6AnLcPWoPls17ruG1bBRaWTORGV+5waGSkM60gnxirME7UqLyc2olsNiiq4Aw==
X-Received: by 2002:a05:622a:c14:b0:535:521:75aa with SMTP id d75a77b69052e-5359fba2477mr270509491cf.48.1792027395839;
        Wed, 14 Oct 2026 18:23:15 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.googlemail.com with ESMTPSA id d75a77b69052e-536128071c9sm12258771cf.21.2026.10.14.18.23.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 18:23:15 -0700 (PDT)
Message-ID: <80a12db6-8617-44f9-aac0-c4aa69de0a1c@ieee.org>
Date: Wed, 14 Oct 2026 20:23:13 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] staging: greybus: replace PTR_ERR() with %pe in error
 messages
To: Julia Lawall <julia.lawall@inria.fr>,
 Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
Cc: johan@kernel.org, gregkh@linuxfoundation.org, vireshk@kernel.org,
 elder@kernel.org, greybus-dev@lists.linaro.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 outreachy@lists.linux.dev, gservice341@gmail.com
References: <20261013022402.6322-1-pavankumaryalagada@gmail.com>
 <2fd23f9b-7eab-4afd-aa77-93a5b9ff0c75@ieee.org> <as6mC7sZnpqIKxN6@user>
 <26a2a4af-5d27-4bd5-b284-3758fa7a67b2@ieee.org> <as-wgGhJAGgYBZ7-@user>
 <9f3e98b4-8c11-62bb-49e0-99873c6fea8@inria.fr>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <9f3e98b4-8c11-62bb-49e0-99873c6fea8@inria.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/14/26 2:14 PM, Julia Lawall wrote:
>>> And if updating everything is a task you're willing to do,
>>> then I think I would prefer you extend this change.
>> I am willing to make these additional changes. Since my original patch
>> is already in staging-next, should i send a v3 of the existing patch
>> or submit a new patch covering all the relevant cases?
> v3
> 
> julia

Yes, agreed.  Thanks Julia.	-Alex
