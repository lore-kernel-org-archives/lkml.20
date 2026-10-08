Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 118E2219E8;
	Thu,  8 Oct 2026 02:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791426016; cv=none; b=DV8n3mrScqrFoprHaa7vl4wWb2wz3bO+0YNEnkRT9hqvk9Pgda9GQBP/J7FKbso6tthgeT2U7bwME41xf/7ZO/AQypCdnhsa3MvjWr9Vm0eHNn68B028DTeDfNc/6qTSFB+nx7k6kRBpk+de6g6MitSwEje7E2W4XnflElifViY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791426016; c=relaxed/simple;
	bh=4wbCaZsGb28xqC4GoMgzUQ6fAanEtD9Bv4eV3Ryh/9Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MsAo7c6Qjhxm50njTKbTdESfbGzakNZRaOhH+WaHxT7F+IHP4ivgC/OHv6iZ+aymj2el7l3O3yCeP1Wo/RIYvTEiOpUFK5NsDBoesSa+XNO3o8YlNBNTFH7U/vfhEbndGij2U2ggcM+acXkRODuB+CrtM0oDXAtiL9O/Z0MhfYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XTdJSQkW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XTdJSQkW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 228F71F000FF;
	Thu,  8 Oct 2026 02:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791426015;
	bh=jCNZ2wtWjRuPtpLtIIqowENXj9sU4ARXuPtiZD9WzKE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XTdJSQkWmkhyQWX2uy2hQOzxUwiQp92Xt6aIhxsm1mpwrn+Zs1cU0YWuSmUyWKJt0
	 6hvAWZNUegFaNeIND6qOJgSC061yrE4ACMmEfB7nfcZSwADc1RD+fIq9oGz4WzHb67
	 1kF0IQGSX4WBOtBcKOFKi2snMzs/Zn/t/NBkWauIGuFvNpyYGuwVHu6fWTDNgeCLQz
	 uYEXQRlWLftEGvU0y3O+5c/gyI2CvqAKn31rMdHAVS00+X5CmcG/fzguUZFcPQmItL
	 FNGJgoewKxKrN0/rIx2GhFOoexgG4lL2APnBSVUj0GqwUUJv810CtmNnQ1Sbr1U7rK
	 AQQywGedsfmoQ==
Date: Thu, 8 Oct 2026 02:20:12 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Marek Maslanka <mmaslanka@google.com>
Cc: Benson Leung <bleung@chromium.org>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Andrei Kuchynski <akuchynski@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Radu Vele <raduvele@google.com>, chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] platform/chrome: cros_ec_typec: Poll for role swap
 completion
Message-ID: <asb93F_Xvl5Sco3J@google.com>
References: <20261007033837.708119-1-mmaslanka@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261007033837.708119-1-mmaslanka@google.com>

On Wed, Oct 07, 2026 at 05:38:37AM +0200, Marek Maslanka wrote:
> Depending on the EC USB-C stack (TCPMv2 vs PDC), EC_CMD_USB_PD_CONTROL
> with a role swap request may either block until the swap completes or
> queue the request asynchronously for the EC PD task and return the
> current (pre-swap) role in the immediate response. On platforms where
> the EC handles the swap asynchronously, checking resp.role right after
> issuing the swap command sees the old role and fails with -EIO before
> the USB PD handshake completes.
> 
> [...]

Applied to

    https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git for-next

[1/1] platform/chrome: cros_ec_typec: Poll for role swap completion
      commit: 2d3ee0bdb321ad84d9cf18d4bfd2b839293a695d

Thanks!
