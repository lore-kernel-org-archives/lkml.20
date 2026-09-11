Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B137B345EDD;
	Fri, 11 Sep 2026 08:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789117011; cv=none; b=fRoCu/PTsA15/uo543EcOGJj8LD/WNKIybKOxz2nVrdlKZjulgCTmEF+go5tew39bsJ8XKqFIm+v9+j1gvAQZ99ElxrLY+Tw7pWHneGrOVZ9lN3Q7KNXmbW/SrbNIXQKhnLcEKagM3ophRpHtqjxboxyGsSyqBh6zw1EJeCYGQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789117011; c=relaxed/simple;
	bh=gkfJgdI6XeM6ZAlM1xQfobNUauinfKZ+a21KsW6Irf4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mj2NSckIMEGovflAROlx63iVAExv7/2iQcGB9gDYKhFmk1WgwAzpWVsaH9y4CNxhwTxuKgPW7aBIbM8/eeZUcZSZybqpgFw1Vh8uRCtZ2upzdUPiOSndR/lwTmKZL3pIlAHjlchbUAP6jQNzh5td/BlRWUA4Z1H/vNDpSnfk6ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MVMFtAxQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MVMFtAxQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 829661F000FF;
	Fri, 11 Sep 2026 08:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789117010;
	bh=gkfJgdI6XeM6ZAlM1xQfobNUauinfKZ+a21KsW6Irf4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MVMFtAxQ2Azvbdm/Hc0AT4Q1b6OdOJwNIPPFpjXercYHUM+ebmkZmhDA4K52HSsI3
	 JN3gOrx3C2iC0iFu6xk1Qv19WfCzDuSfwpza8ZPjQZxGr9m8gwSG8JigG2KDLk8DYg
	 YFJJKvWwjowrI7Qo8WCwSxJGHplt9DdFi0C9hi2HgES3kckThrBZfYA4uTnmdZEgPp
	 rJ0go04t9ULPf68ORcMMmw0G3Jl6pMWhGAOKIsC2V8bM3DMbenlX9Zx9LB8g4skRC3
	 CGAZwZ6gQuwFxCy7DxB5UyOSUhg0rXWy9poh4dL/Ey9i/tmqRR8gZIuCfh8U62OM7h
	 aVnKz+VDTLFdw==
Date: Fri, 11 Sep 2026 10:56:46 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 9/9] arm64: defconfig: Enable Qualcomm PM4125 and
 WSA885X drivers
Message-ID: <20260911-tireless-sincere-flounder-5fdfb0@quoll>
References: <20260910231642.1794948-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260910231642.1794948-10-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260910231642.1794948-10-mohammad.rafi.shaik@oss.qualcomm.com>

On Fri, Sep 11, 2026 at 04:46:42AM +0530, Mohammad Rafi Shaik wrote:
> Enable the PM4125 and WSA885X I2C codec as modules in
> arm64 defconfig.

Why?

Same question as usually. I even documented it in maintainer soc
profile. Dunno how to improve it more.

Can you tell me?

Best regards,
Krzysztof

