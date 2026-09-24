Received: from mail-ed2-f16.google.com (mail-ed2-f16.google.com [74.125.228.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8295F361656
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 06:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790232496; cv=none; b=FDvRTtfPoV438cv9HEaSRlY5ITXiwJaM3cEUCzJM9RnupkMsdz1ICiCD6CVdGVy8wurNXidxK3aLgvji7CUK42+fVRHvqzATSwFv67lvo1H8id75WqXRtSJs6OI3++1VVyd+KXs7sWjvBpJPVPJnfalHphSGH2AxuFdza6JfIis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790232496; c=relaxed/simple;
	bh=/BcelbpT7CGhnfElWZJzPti6+AmMa6ROEiybn3GdoFo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Eg3jNMxgY63duqba9WUAvjDgho/MjGHzXqwSCsO+Tv5MO/Fy0GBGtvgw2tOI+2TvsNewtAHu9i/MviefDL4WswzLROvxiHHp+HIg1YIuPIOyXE02Cgz052WDB1Sj78IdzzoaotN/Xpt/dX3HfjsbbxAkIcKL/tX19tQH9onPLJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=OGFK0UTL; arc=none smtp.client-ip=74.125.228.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="OGFK0UTL"
Received: by mail-ed2-f16.google.com with SMTP id 4fb4d7f45d1cf-6a9984f9adcso2962749a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 23:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1790232493; x=1790837293; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TQSx66yiUW6sVcxiGO0Odu8TWkytfdb3yKLMsf5vKh0=;
        b=OGFK0UTLh74qe2B7umXcdJFXbzEwPrOq4uaGpPdWITgXiKEnm8D6X4uHY+ezy/K2u4
         SZTEkYKElcn38ojzd6DI98J1x8Lc0y3Irv+thn8gTOa0tikTdfPdJzF6tfvlvnLzRSun
         gXQa6vvveDWzX6Yg4mRZUBlOET+XouHOHfU80=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790232493; x=1790837293;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TQSx66yiUW6sVcxiGO0Odu8TWkytfdb3yKLMsf5vKh0=;
        b=y9APE7YX3aj4dkgI0m9/KRsN7tqN/1ZiESpLNVCxkeOtWEigdtN3Dvfj4Pk/useFJW
         0n7uHvEjaIPDc38Fa9p/aZ8TC31P4Mbro/phKYLetNaMk+Bcxlfhv8YRpfNQxyWGol9t
         +MKkicTZc5jzO+RQY4JvL2FAVA+syqWcl/18W6t+7IOP//9dV5Z3lKYzX67Nc5EBroT5
         wLXi8DLdDYgxTDc1S20DeLRqzNtk3w9aFo6qsOOochgpM5Ds/ynsG+eucKoK6+qAVVLj
         DznimPChdpBh9YKYonYNUm5dWfL5lhsoql7iPUk64g5IfnBAZ4NCTOBQh01Gl59uLsf0
         pwnA==
X-Gm-Message-State: AFuF++k47wUyeoECvGgQ24aG8nggVIGD/XTJrypU6hRft4p6KdmNtSii
	5bdyNQY0N/MhetWAar3II4DDx9qzNevpUSr6wsjUciVmbFkM+BK1Wf7EOkKMO6j0jNg=
X-Gm-Gg: AYBFou2wBPEDwMO0uBI4lzAsqxwGeCWxU79pG7DrOnsXa27AwF+Rgg43cVAjlvqo5V9
	izi182UfZTt6rQGTi2NaIaXG0IYgmC77rqha0jjaaXsO+RRDr/Vzu9UgwfL9v2GRAu8AJSmPSPG
	WJcFjrK650DZyz1+j383LFyZMfmaZT2MuPYsShZlg+sjHrRfJsoaaiPJJUP4i73bsLbTZAYy1fF
	LU/6YC33LNtFI+16x90E0WfY/2Oya+nCBQUP/GI79dD18C4anPJMX2ETGruFcmAyO/wS357mEjY
	hPkDpzcvhBz0WysxyFErhP5Sz56LRsL9218mh0ro4GLUvd/t0iF5VaEDaU4cahB2OFYeh5ghKxd
	F0L0ptMzdyGYIFP/IGf7td8S/X/BvH21jwq1lG/wsMMkyzcM7EpV/2GAtDAQ6FlHdgOXlmDD99U
	JEalF8UBUa49ShR5on8UMi9U4+CvR7RfNzMM2K8yMepV9auGmPAX7Eg/8b7DHHnRtkbZfpQ8sc3
	+rhsZjfDxPtw2GoyLQ=
X-Received: by 2002:a05:6402:23c7:b0:6a9:e7eb:f52f with SMTP id 4fb4d7f45d1cf-6aac90a9049mr971517a12.28.1790232492657;
        Wed, 23 Sep 2026 23:48:12 -0700 (PDT)
Received: from bender.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aab386e5aasm3155851a12.9.2026.09.23.23.48.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 23:48:11 -0700 (PDT)
Date: Thu, 24 Sep 2026 09:48:10 +0300
From: Petko Manolov <petko.manolov@konsulko.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	dinguyen@kernel.org, arnemaximilian.richter@draeger.com,
	martynas.grybauskas@draeger.com
Subject: Re: [PATCH v6 3/3] arm: dts: altera: add Draeger M48 CPU Module
Message-ID: <20260924064810.GD6325@bender.k.g>
References: <20260917163157.1380860-1-petko.manolov@konsulko.com>
 <20260917163157.1380860-4-petko.manolov@konsulko.com>
 <20260918-strategic-hairy-kelpie-46e807@quoll>
 <20260920075924.GC7878@cabron.k.g>
 <042c39d5-0642-4bcd-b965-61fce77b52ae@kernel.org>
 <20260921090659.GD14552@cabron.k.g>
 <89e1e02a-1a41-4c40-aafc-172c44ddeafd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <89e1e02a-1a41-4c40-aafc-172c44ddeafd@kernel.org>

On 26-09-21 16:16:45, Krzysztof Kozlowski wrote:
> 
> I gave you already precise expectation 10 days ago, which you ignored and

"precise"? :)

> repeated "what shall I do". I expect explanation of the hardware in the commit
> msg, especially the non-obvious things.

Is this:

https://lore.kernel.org/lkml/20260921090735.3174292-3-petko.manolov@konsulko.com/

sufficient or you want even more details?


		Petko
