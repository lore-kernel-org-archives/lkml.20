Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5DDA221FD4;
	Wed,  2 Sep 2026 00:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788308232; cv=none; b=dyvBbP3G9sdyFoB9reZGfyg/TiIfY7lVquV259lTKHmzMIaCOlnXjWBGUCi4fngYvbxB6VkYXPhKu9nnUD0JvHObMz9nQCvNR1rsCzMsJv+K42IylMqUCMcyWDqdTz9pKQS3sZ2O3raY3qNOekGI2RlKruQq3Yd6Dy4KguZTxfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788308232; c=relaxed/simple;
	bh=8y/eoI7jVwhOdL0geinQ0gDnZ9NK27XzsSCZbwX6knM=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=KbU2qSAeypUzYD7k8Txv9lKwgzr0UumyNr8Cf7iPsPRc4iId06Jd0Gf1r3DF4tvO41JdfHrwk5ceFnPXhk9qduKPrb1lGjf6Rsy/+FwCbMjQDbJDxDJj59sSh9TR/YvK4YXE0hJfkIVBSDOkHGRQwqHsfGXN0acnv0DsAGKjhbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GjyQdgHC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GjyQdgHC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9FDF1F000E9;
	Wed,  2 Sep 2026 00:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788308231;
	bh=FFHPut+Xq2Ea+rkcvqGUhCh1a+lSyQIPTaGYORuhApw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=GjyQdgHCFzqoqFBuxCIfmvoSztUITn24xhAGXlt0hn9x0F8F8Cgxz1MstlQYzBE6t
	 IdM26bC9+5F94mw29ktD62FrJkV01KbmD9uhDbCNA2cVP85dP8eGpnQeiA08AVBXa4
	 Zxzfisb+rjN4naX4eL6GI6WUlohZ3rR/NFi8L1tmX0OnhJNn5Ewwo9FvV3neiELvvg
	 iEDYPD1vXK785RI/q8ZHY4jKsmXhnmfCWt61WNQ+dJ6byX6TtZJEcQjss8id0jAu6V
	 Tjexq5L5XsLR6LQz0r8MUJKjgPFhEuB6BrtEjhllSh33ZGvdkfRp097OHMAQCWlzIM
	 1J9zCr0exKdlA==
Date: Tue, 1 Sep 2026 18:17:08 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Yukai Wu <xiaoyewuz.ruster@gmail.com>
cc: Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>, 
    Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <pjw@kernel.org>, 
    Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
    Dongliang Mu <dzm91@hust.edu.cn>, Shuah Khan <skhan@linuxfoundation.org>, 
    Alexandre Ghiti <alex@ghiti.fr>, linux-doc@vger.kernel.org, 
    linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] docs/zh_CN: Update arch/riscv/patch-acceptance.rst
 translation
In-Reply-To: <20260829022344.192491-1-xiaoyewuz.Ruster@gmail.com>
Message-ID: <6ffd979c-6d6d-e631-79eb-680ea3766c3c@kernel.org>
References: <20260829022344.192491-1-xiaoyewuz.Ruster@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 29 Aug 2026, Yukai Wu wrote:

> Update Documentation/arch/riscv/patch-acceptance.rst translation.
> 
> Update the translation through commit ed843ae947f8
> ("docs: move riscv under arch")
> 
> Signed-off-by: Yukai Wu <xiaoyewuz.Ruster@gmail.com>

Thanks, queued for v7.3-rc.


- Paul
