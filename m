Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42FAA3E763E;
	Thu, 17 Sep 2026 06:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789626689; cv=none; b=jUZygO5sNf5iqZjJgnViv4Czie+jweaVKPG8XAHG6fw5LOZnpdyueM33frq+xyPWSc+hQtWcJ8FAwZX5/awhfkghp0N2RSUCAfB3QcSwj2NJuSxXyM5acIlW7f+ohaSoi+yGtmzV1s1USWG6A7wNpH+hoB7PFVEhJmloc6ojo9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789626689; c=relaxed/simple;
	bh=Sk/57kb7RmANQmy2O+QwacqKPo7ny2IZ0B+uQcPlEgI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K2ERsWySs7XJlOZUCV1YdivHMGt4Qln+WeNEafh0NiyPEZss0uviuKpDCXQbPuNDo0/K7EM16RW4VBw0nnZv7N/iOdxQ2pqWT47QKgZLHG9ZsRLGIyq9bdJfK3XtjpLiYWuLz/pA+0XM1SNuJwGAju7IPCibTRPf3crtezNHeBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=SrcqrxaU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="SrcqrxaU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32C391F000FF;
	Thu, 17 Sep 2026 06:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1789626687;
	bh=LRZFpBmKzdvQFotG14/xqZFJJfu+lgfxfJ5Gp1u/q4o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SrcqrxaUSLXSwHNFSg+FFq5tYcTinU3DBBNJRp2B0sb3KSuUOMbt+HwdqwcS8K4dT
	 Dd/N9krJx3NvppgIMPAJ4M8xqrjElOHD4HNLjXxD2N8V4bT6ET9jsTIdJO5TCigxYd
	 Qd+dnk8/SIArTSpuFBtk6YtLvFXq5GC6VhA6cMQg=
Date: Thu, 17 Sep 2026 07:29:32 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Daniel Matyas <matyasdaniel005@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] dt-bindings: axis-fifo: Added missing binding
Message-ID: <2026091716-clash-hyperlink-297a@gregkh>
References: <20260916201253.483877-1-matyasdaniel005@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260916201253.483877-1-matyasdaniel005@gmail.com>

On Wed, Sep 16, 2026 at 11:11:50PM +0300, Daniel Matyas wrote:
> drivers/staging/axis-fifo/axis-fifo.txt file described how the
> devicetree of the driver should look like. Convert it to .yaml file.
> Issue found by checkpatch.
> 
> Signed-off-by: Daniel Matyas <matyasdaniel005@gmail.com>
> ---
>  .../axis-fifo/xlnx,axi-fifo-mm-s.yaml         | 257 ++++++++++++++++++
>  1 file changed, 257 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/axis-fifo/xlnx,axi-fifo-mm-s.yaml

This doesn't delete a file, so is it really a "conversion"?

thanks,

greg k-h
