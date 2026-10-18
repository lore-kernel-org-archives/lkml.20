Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81A0927A462;
	Sun, 18 Oct 2026 11:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792324336; cv=none; b=iRT2BASYVRBKuANxww0eB0nGvsTeYo48U3E7gqDjYBQLE4hljwGA2BQaSDiFIB9wRrUk3B7wqdg8ydchKt19o6WQvg1MfMqaFWEvdFnCLdTOqlCtdrpeVxLVgvtNaK9HcYHDZA32VVROQORPaq9B0SYewQBztH5fm+FvM13gi/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792324336; c=relaxed/simple;
	bh=haX/1txio89SUB+J/9FhO/mNc5IHZDejbx6mLinm0hc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dBmpbiW2ItEV4oN63ysKpFFvSBy6iH76GzpA/L6w0ReqpVS/0VfHhdw+obYM94fJbvXs+G/e/naDWK8PsoAGUrlG+6yrcE19qADV3Kh6g/5HVKcx+CTqhn1+XF0DFbVwpSgazxOmbraADYSw76ufAh6D5HzCwn72Zl/DhTKcZPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=jWEt5OXx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="jWEt5OXx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A8D61F000C4;
	Sun, 18 Oct 2026 11:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1792324335;
	bh=mlLV3egCv9fgtgkED/DAArLwHaCzk8fOHkMuS7abFcw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jWEt5OXxtdOCo0IPvJk6EAijRLD8eBi1cH3BMUNY6DP/fpPCQncf5omVwnyZI4cQY
	 fvhtKvkrEVPpr2DqudrniWU7A86HDLGXLQmECLTmvsLNX9ckRlkx7QCnmYWaNyHUvq
	 9xHgOCyDxQXo9jF/dp8scYXVttL3qjFd4Uj0gCek=
Date: Sun, 18 Oct 2026 13:52:09 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Melih Emik <melihemik@noirlang.tr>
Cc: parthiban.veerasooran@microchip.com, christian.gromm@microchip.com,
	error27@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: most: dim2: remove redundant dev_err() calls
Message-ID: <2026101833-envision-landless-4b41@gregkh>
References: <20261018110058.296436-1-melihemik@noirlang.tr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261018110058.296436-1-melihemik@noirlang.tr>

On Sun, Oct 18, 2026 at 02:00:58PM +0300, Melih Emik wrote:
> Since commit 55b48e23f5c4 ("genirq/devres: Add error handling in
> devm_request_*_irq()"), devm_request_threaded_irq() and
> devm_request_irq() automatically log detailed failure diagnostics
> including device name, IRQ number, handlers, and the error code via
> dev_err_probe().
> 
> Consequently, driver-specific dev_err() calls immediately following
> these requests produce duplicate error messages on failure and are
> redundant. Remove the redundant dev_err() calls in dim2_probe().

LLM-generated patches are not allowed in drivers/staging as per the
previous statements:

	https://lore.kernel.org/r/2026080354-skater-urgent-31b2@gregkh

sorry,

greg k-h
