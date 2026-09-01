Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CA4F3CFF62;
	Tue,  1 Sep 2026 01:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788227261; cv=none; b=HSeS0B00o/yoGU5EjzQisYYfwMLUPPyfyQZ3tN+83nnRDGiIky2dTsaFk478TNXBb8/xIN4vdwtFc42k02iJWxmRsFlm9Odn0/x2XicnmG4usEEFn1uZtjjCkJoXMCm0Hoy5jaFHJsxYEISPsrcnmzhqEygWOSkLSvcYuV1Grps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788227261; c=relaxed/simple;
	bh=RKxzqc9OhnVUOh3qHozCjh7T1CJIA4dk3TuAwUMw9os=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Q/cK2r58C8kCjK5DlT1Tl3AvFxiUc276A4M7PFjQPQdgqAttUnnbLjBZEXAukw17994iW99Ezg3GVhpOXtoeAtcZnjrIs1BPJlEoqDqRppTx1seu66ueTdIBJwznnjOTsFCG1gmHkTblaVZEmYl/6X41aL0km/2qaw5sTXTUPYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TsZ6Lo9Z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TsZ6Lo9Z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BC101F000E9;
	Tue,  1 Sep 2026 01:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788227243;
	bh=VU1A0I+4rhrqmuV2PfmzYIUV6CnltACrGDwnKwjSUv0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=TsZ6Lo9ZTFp//L0tOacSKPgvxtxHyEOXWsOmaVHAqTYkV3etlgvt4ci2pDmJyMY3G
	 swxBQhfO3bFUzprI1rhceBt7pmnrRdKygWM5qKPqWnpNhP+CmHAdAwRtzJee6O9E2+
	 w6eaz10MRrQetP97LBscSSL2MmFkOwU0nZvBvpRd9F8OlIbqnr7wPwpmiAbChxay6B
	 njmn8aU+tIuKCBxX7NTWOioFgGooVnCUQZt9M6FbXUyHoF3DXCy16uzzxIWCbsSF28
	 MyTo+luBXYgJPROd2P+1ZNQ+4MlOU6yeF+3LKRAt+GHe2gYTSkrrrHkl16cfYOOYiF
	 ppIbJZ0TU+E3Q==
Date: Mon, 31 Aug 2026 19:47:21 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Mark Brown <broonie@kernel.org>
cc: Palmer Dabbelt <palmer@dabbelt.com>, 
    Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org, 
    linux-next@vger.kernel.org
Subject: Re: Missing signoff in the risc-v-fixes tree
In-Reply-To: <06a13fc5-7efd-4a77-ab0e-5f1caf35ba5d@sirena.org.uk>
Message-ID: <2cb1c894-f075-4512-d6e1-ce9ea3c945e1@kernel.org>
References: <aog9BzBzb-2Yfgyz@sirena.org.uk> <06a13fc5-7efd-4a77-ab0e-5f1caf35ba5d@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 31 Aug 2026, Mark Brown wrote:

> On Fri, Aug 21, 2026 at 12:56:55PM +0100, Mark Brown wrote:
> > Commit
> > 
> >   3c98c44748385 ("riscv: patch: skip fixmap mapping when kernel text is already writable")
> > 
> > is missing a Signed-off-by from its author
> 
> This issue is still present today.

This should be fixed now.  Sorry for the delay


- Paul
