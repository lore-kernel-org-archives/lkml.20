Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63CA415C14F
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 09:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788342847; cv=none; b=CCMgcigdmilDnbwNqoFlMykHaSJ/J6irGwJOoJezanZ/YqNqeCUBZxdxiyGqx7QVjkZv3T1e/dFrCTkPnbR/NZ2nCtbCofz2uwyKfex/4TGz7n1QoX5Ma4Xli4sKZwY3g+jUUkCrN9D2wrcgC7gmUz055xTyaJyzYMS9i6R74ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788342847; c=relaxed/simple;
	bh=s95WriRXMx2x1DnKA8sfpjVr5XBSeA6Sh6dDuoMWMzE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J0pvyUnEuGKq2TQoTTtEYGvRNvA86lCLUwpHcZbBstQDu9KKkVM/4P3Tw6c88cdoikXozcufNzIh2WbhU65DlC6qxxju3S3jdeZ4NRmj5FGlDa8xeDSfjdkKO+q81rn1dBslimPPChoS1Ll7Och8pywxpnhF3cjOkwu+tBJ4trc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L9rNqOGk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L9rNqOGk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 973771F000E9;
	Wed,  2 Sep 2026 09:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788342844;
	bh=Jubpga/fencT/+SgH0cd8HjsnDrVVnZHdEzIUYQT4x8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=L9rNqOGkmmIBtd3/EzZQIczYOSqgYxoNv3ceP6bv+Uq44gu8d7akxUbGLpi1SGyqW
	 jIXP7aTgR83fF7FQWXJRwQpl0TD1GjsHtRCIDQ02hKeeKuyFIu3JU2Irna8Li8WVP4
	 usU0sCltDiFvBxRA12cYE0fNfuv/ZHneuqLgKiiCGx7FutgDsSd2ltcpmSbz0QpVOe
	 7mEEZwzBFFqzTDEyJQn7FtpMbNTHZIVX3dlG8LBMW1e+C8pvFlSXxcJUGDwXP1nTqA
	 88g2ELN+YUsaoMIJbq17bBwbDJY3ObHSEnnUSfe/d1Y9eR88EVnJRa6WP0d0Zas5N1
	 7jL+jGIEmA5tA==
Date: Wed, 2 Sep 2026 11:53:59 +0200
From: Thorsten Blum <blum@kernel.org>
To: Borislav Petkov <bp@alien8.de>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] x86/coco: Replace cc_attr_flags with a bool
Message-ID: <apfyN_VpuREcX5A1@kernel.org>
References: <20260902000634.118808-2-blum@kernel.org>
 <20260902005703.GDapd0X8PevmcPPxBm@fat_crate.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260902005703.GDapd0X8PevmcPPxBm@fat_crate.local>

On Tue, Sep 01, 2026 at 05:57:03PM -0700, Borislav Petkov wrote:
> On Wed, Sep 02, 2026 at 02:06:33AM +0200, Thorsten Blum wrote:
> > The cc_attr_flags structure contains only the host_sev_snp bit. Replace
> > the structure with a bool.
> 
> Nope, do some git archeology before you send patches.

I did check before sending. My motivation for the cleanup was that in
the ~2.5 years since bc6f707fc0fe ("x86/cc: Add cc_platform_set/_clear()
helpers"), host_sev_snp has remained the only member of cc_flags.
