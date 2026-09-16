Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D64614A99DD;
	Wed, 16 Sep 2026 20:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789589801; cv=none; b=ExrG7BmHOngiCo/9hIXGoYTJZXSQ8CYLfnT8hdAAEdnaGPOdpo/zlznTy7OBu9UglMlrM9C6ltbpuaCwW2iAEafpzvTSrooXtPe4xJpD79DQDUuP5uiALhyMh5eJ7GW4R5nxNwqUKsPtgvIEyFK6Sc7tznjyBSH1VwhSDyAUhxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789589801; c=relaxed/simple;
	bh=OcFN6md4Q6Yo5+Cs1U3k6jcEZB1bIbQJp6SSd8MTKjo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L/V+3NBBgZCrHeYJw6UGSBrvrVM9slDXOMHgv1F4K0Qf1zxegdMap3dTrZT6IOUYaF1qu781xktb1jIL4h6nXeISxDk7jVZxkfL1is4OunwZY+FeMmcl3wvqzjj5Woy2vZGbRBJoK4Hn/aMBe3P9CBSAGQrA0U5cf9yn2z5VVQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B6vv1/Jo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B6vv1/Jo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BBF01F00893;
	Wed, 16 Sep 2026 20:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789589794;
	bh=3mB+LC2I42yw1SHICxB9+/yHK+D+mH658s5YrOuCxtU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=B6vv1/JoQwwO0EkvVWP1917AgPk2HncZ6erJJcUGSZVJS8wxYRcW39S9Bj/QXC6uu
	 a3GX6i8lOBgvz5IB8VVeJqbWAHbo4jMvzGZf9zLFYKmG26yJS5uJzL4xjO/E6EUIGk
	 VJByy53kK2eLxY6CYSWtjsD+JOnnCkSEPNLVcUXjvYVu4PBROB4FHMLtIxrB5++F25
	 g4Y0rVRBXgOCxjdjcTqxSUpHnktS1veCSKG2HcBLS4yr9ufQMBMP9HINl6bnAPTFww
	 PvbWgoio5qQA0u7DzaySX5q7Zs8M1adS3EsqiJ6GveHwO4GCJ6o42/vr7HsYVw27BB
	 RECHK6/KHo95Q==
Date: Wed, 16 Sep 2026 15:16:32 -0500
From: Rob Herring <robh@kernel.org>
To: Dmitriy Okunev <dokunevdmitriy@gmail.com>
Cc: Frank Rowand <frowand.list@gmail.com>, lvc-project@linuxtesting.org,
	Stephen Boyd <stephen.boyd@linaro.org>,
	Peter Chen <peter.chen@nxp.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] of: module: harden a call to request_module
Message-ID: <20260916201632.GA1397924-robh@kernel.org>
References: <20260914122425.137413-1-dokunevdmitriy@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914122425.137413-1-dokunevdmitriy@gmail.com>

On Mon, Sep 14, 2026 at 03:24:25PM +0300, Dmitriy Okunev wrote:
> In of_request_module(), the string 'str' is built from Device Tree data
> and passed directly to request_module() as a format string.  While the
> Device Tree is generally considered trusted, using externally provided
> data as a format string is fragile and can lead to unintended format
> specifier interpretation. 
> 
> Fix this by using request_module("%s", str) to treat 'str' as a plain
> string argument, not a format string.

'%' is not a legal character in DT node names. Even if someone modified 
a DT to have one, would we even get to this point. Probably unflattening 
or creating sysfs files would fail first.

Rob
