Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45C0E485CD2;
	Tue, 15 Sep 2026 10:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789469377; cv=none; b=c2brIbq3n4ml/QwGsgSllyDM5auLP/xsA9/zf6gSOJspZGPhEaFrszhyrcozxb1qjXlEicvTuo4dtB4nLnJj9SpAiWXtV/cNE6DK4IZYKhoynSaI3kEUA357gtZARSKEFtgrRy5fWsHjbrPapzSMRsI2kp+s0VpmApisCc2YTJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789469377; c=relaxed/simple;
	bh=774wphgNFyW4INBX/BB4cagaEbxyINTdU2cfoGrqC2w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lgA3aLWaNMNT5lTwwKgmFBFyI466ZVfMOaqZ2RvgP6cAFptNx2plkJtL4awgqb1XRZ+aZ8ESonPjjdC9SH8UnnRZ54tlh/m0XLpW8Z3/52jHj11tS83C8l7xz3O6CWEMoJnfpLFytfXIHQ4EBS0tnK3PLD0Y866PXU+pVBi2rVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F2DIpqBi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F2DIpqBi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFC6F1F00893;
	Tue, 15 Sep 2026 10:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789469376;
	bh=LvnE+GCpZr1qwdkZzz2J/xPLsAEVgUoXV4kSymGCgoA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=F2DIpqBiAiZzgzI91muX5bQY4iWjjQT2erv+yupCqFWte44UQyknPiZw9e+LQQCfr
	 nsKsxzJWwBw9wHAH44btMrWgr58WUpXGaT7pIkk9UY/5O7S7jluvXPvUYQhsauezaZ
	 b457nbtspH/2KA5/l98cIF24qeRg/Lv+KdcMP2R2kY5j935DuHH3zBHOpMQNVTXgHg
	 yIe9Y8KbhEr6RpVc8OAcuTnYw/eQW4Q9rUlHs1LQRbr/7qRf2jM9c97YJ09mQcgWZL
	 yTwT/B7jaynxA2bMUYD2wcCMYpjcJ3nLK85n4q4/tPgXQl5Yj2EFCOOp6LM3HKCyu0
	 WDHWh8fjw3VjQ==
Date: Tue, 15 Sep 2026 12:49:32 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: genevieve.chan@altera.com
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Dinh Nguyen <dinguyen@kernel.org>, Lothar Rubusch <l.rubusch@gmail.com>, 
	Ng Tze Yee <tzeyee.ng@altera.com>, Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>, 
	Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: arm: altera: add Agilex7F SoCDK
 multi-QSPI compatible
Message-ID: <20260915-therapeutic-jackal-of-temperance-1ae852@quoll>
References: <20260914025052.14354-1-genevieve.chan@altera.com>
 <20260914025052.14354-2-genevieve.chan@altera.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260914025052.14354-2-genevieve.chan@altera.com>

On Mon, Sep 14, 2026 at 10:50:51AM +0800, genevieve.chan@altera.com wrote:
> From: Genevieve Chan <genevieve.chan@altera.com>
> 
> Add "intel,socfpga-agilex7f-socdk-multiqspi" for the Agilex7F SoCDK
> board variant with multi-QSPI flash support.

Why is agilex7f the same as agilex?

Your commit msg is pretty redundant, just copies diff instead of
explaining odd things like why do you have exception from rules in
writing bindings.

Best regards,
Krzysztof

