Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B9794A014D;
	Thu, 17 Sep 2026 12:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789646794; cv=none; b=ZW36Z3qecaLdmhvquUgKxrc8e+ujSgpgRE7E2sqaKfX2hzT+e0+ulAd5kNQe3aRkFcFyE1do/w13/iBqQJeSi8CEves/a6tXM7fB2EN8ghbs10slWuAoM+Vdl+LoLSdjOe6JuetTfUF8LbtKsJ0dTCZGywJBwmoBRc/V9e64wt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789646794; c=relaxed/simple;
	bh=//QwQsRr/HpkI7cBV/K/ViUXLRN7LhO8JZ13tvqFiqY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FN7z6pDrqbxL3vgRuOtkQKv3xI9frHQ73xO76fsDuaPlnVDFZkgn3D+bXNmd8fxVnIYiQ2bNUzj4+OXL+bv0Pg4SpK4YGJm+LCjVXiXN660K+q3JjIJqwUpYybDBv+AEIGwVdpWs1Rsyb2tpxayrsVf3oCV8Bs0mip6X1GD6kdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=KrLtkiXT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="KrLtkiXT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F2921F000FF;
	Thu, 17 Sep 2026 12:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1789646782;
	bh=z8KgodzGvL6kysjH/RXLRsiuM+KiQJGFvLKLGZ12Alk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KrLtkiXTqDYDJpO5ANe1ujT+tCbl+boucBEicXVUJpHEO4OKQXBpGk/ciUuW1xb6l
	 vwFDFeGt0fe83BtcWAyaD7/LwbqeomhoWgcmYzXAbsdaNdKKynY4i248P0OCku3sKD
	 4sIRIFAOGbrV1gPR8Jnea+RayCYKmHKi3CzO2JXw=
Date: Thu, 17 Sep 2026 12:58:14 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Daniel Matyas <matyasdaniel006@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Daniel Matyas <matyasdaniel005@gmail.com>,
	linux-staging@lists.linux.dev, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: axis-fifo: Added missing binding
Message-ID: <2026091743-sanding-shallow-2472@gregkh>
References: <20260917115023.292302-1-matyasdaniel006@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917115023.292302-1-matyasdaniel006@gmail.com>

On Thu, Sep 17, 2026 at 02:48:48PM +0300, Daniel Matyas wrote:
> From: Daniel Matyas <matyasdaniel005@gmail.com>
> 
> drivers/staging/axis-fifo/axis-fifo.txt file described how the
> devicetree of the driver should look like. Convert it to .yaml file.
> Issue found by checkpatch.
> 
> Signed-off-by: Daniel Matyas <matyasdaniel005@gmail.com>
> Signed-off-by: Daniel Matyas <matyasdaniel006@gmail.com>

Why twice?

> ---
> 
> Sorry for adding another email. I got locked out of the first one for 30
> days...
> 
> v2: Corrected syntax errors in compatible:
> 	xlnx,axis-fifo-mm-s-4.1 -> xlnx,axi-fifo-mm-s-4.1
> 	xlnx,axis-fifo-mm-s-4.2 -> xlnx,axi-fifo-mm-s-4.2
> 	xlnx,axis-fifo-mm-s-4.3 -> xlnx,axi-fifo-mm-s-4.3
> 
>  .../axis-fifo/xlnx,axi-fifo-mm-s.yaml         | 257 ++++++++++++++++++
>  1 file changed, 257 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/axis-fifo/xlnx,axi-fifo-mm-s.yaml

staging drivers need to be stand-alone, in the drivers/staging/
directory, please keep these files there.

thanks,

greg k-h
