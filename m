Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE2DA448CE0;
	Tue,  6 Oct 2026 16:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791304263; cv=none; b=gC/sLkCF9WDvIO9uwHCbzYquRSI+FeJ0ZvLJXGIsCkGEl0F8cOu0yb/qPZmEJE+tEEQd9YKcbBTlmyH8x5o9oNvgWuSWWHvvUy3xocklCBmAfq7v40vXV3/F7MGTb7qgjK2gtvsOvXKOcK+PGSL6zG8OkoovzxSEttzVIoDEAPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791304263; c=relaxed/simple;
	bh=f/+xtJjwgh/KO8pEVNU6Dra5VomeS9TP+drph0+Qyyc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RE3C14H72HTn4AHadhu6wY0TnOksjITvIp83Fti6+sVy0VwzMh1UllZd9tAsOBbIKqLWT1ebiYek3Q8QzPHvKUoRF9F57Gbu8R7/T46FnEZTlTJwr2B1grxSPTchaDpcWhx5I15iqiMlmgYlPghOjHDJxmVLcHBiCTPYfPS+x60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ZOIamDdt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ZOIamDdt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7A1D1F0089C;
	Tue,  6 Oct 2026 16:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1791304261;
	bh=IBecjwPeJwaxoKEg2gZX/H231yNJpJCqbcnNTJfUOxM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZOIamDdtVy7mDbaM8L1tfFChNZqDAMyBEi+NzUlVY+6mJZ99z1hUj3dV+3Vs2xZoR
	 9yLWroQNZSX1aysuZHa68OP/VZlWhkqiWmz6a7WwkasfK1/kENSMbAs7FodIRLetaa
	 tm9kQxp8hQkNaXL1wKMdbj2C0gkTvi19kg831jcM=
Date: Tue, 6 Oct 2026 18:30:57 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Raiden Lumine <2557597107@qq.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev, ovidiu.panait.oss@gmail.com,
	jacobsfeder@gmail.com
Subject: Re: [PATCH 2/2] staging: axis-fifo: remove obsolete text binding
Message-ID: <2026100632-washtub-active-0952@gregkh>
References: <20261006112955.208744-1-2557597107@qq.com>
 <tencent_DB7D53C376BBFA9CB0F63ED6E7FE56C6B906@qq.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_DB7D53C376BBFA9CB0F63ED6E7FE56C6B906@qq.com>

On Tue, Oct 06, 2026 at 07:29:55PM +0800, Raiden Lumine wrote:
> The binding is now documented in
> Documentation/devicetree/bindings/misc/xlnx,axi-fifo-mm-s.yaml, so the
> free-form text version in the driver directory is no longer needed.
> 
> Signed-off-by: Raiden Lumine <2557597107@qq.com>
> ---
>  drivers/staging/axis-fifo/axis-fifo.txt | 96 -------------------------

Staging drivers should be self-contained, please don't move this out of
drivers/staging/ as has been discussed many times in the past.

thanks,

greg k-h
