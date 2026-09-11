Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EE0D47D956
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 12:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789131444; cv=none; b=a78dFcRfvO+9L3DMOxNhfGDXLaZFWqmQPhb/gYU3HMrd7jd4R6DLs1ZcJpm90FlvaGkmgOl/1z/w5cyIo1vRwKrATMaYqYfXyBg4DVNUofqDxLiJOurYCxSjXD8yvpBtVmLx18JuDzkMvABXNDCwvo9TRDHyi5BUi3AQ3wiL2/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789131444; c=relaxed/simple;
	bh=2cs+LmB415+j4xvRTGyqVgMwGKSUnPgtfC3V3a89qHE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BC3pn5ofHDPn6l6ac5NzjQybtsS6OKZtPr+qFWGPQiu8ju2jPdE/vMF5Sif3K6cwtx47cDvFBH0MQuHBfrY007BtGoVH+l/lRnxZHxnQoqApo0/aORxNMYqFNAQztBW3kcW7LYIS/++lMotgZzgczIqd7fofBNRo5q6Cra77It4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BU9pqrFp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BU9pqrFp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5B4F1F00893;
	Fri, 11 Sep 2026 12:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789131433;
	bh=snWpfyIoxF+5iUdUC2Q149RGC6bzU24eMSopGKtayLQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BU9pqrFp8KoLcgy05K75awi7EZw7+b/41XeUUzDTC5ALRfmsFSm+M76AHU9iN/69A
	 5KRaHg2TAK0CZxIIYkZtCdUWGnPoFZh5caxpz1RD7Y/fttLdZWGchZRrkId7PMDiW9
	 dnvEotSJ4EUs2B5IhGaOc9HlH946XiwAeb6k/k0P6iR0vODSoOoL11uxR6Zw+e45xQ
	 XX1S+iLr90veXwzL6MyB86B/c5FcIbp7alxka7L9HpchRP4+lWTS4g53wrtOelxFL/
	 GR0QDpK0wpj5Ny5jebskPJWitMMKdq6s911U7bGr1EmnRip82vgePK2XdzfpQgQJcn
	 yG4/kvRNiDgMw==
Date: Fri, 11 Sep 2026 13:57:08 +0100
From: Will Deacon <will@kernel.org>
To: Vladimir Murzin <vladimir.murzin@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>, Ard Biesheuvel <ardb@kernel.org>,
	Ada Couprie Diaz <ada.coupriediaz@arm.com>,
	David Hildenbrand <david@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Mostafa Saleh <smostafa@google.com>,
	Lorenzo Stoakes <ljs@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Linus Walleij <linusw@kernel.org>, Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH 00/21] arm64: Move overflow sp into SP_EL1 and kernel sp
 into SP_EL0
Message-ID: <aqP6pKFicKO3j-Tw@willie-the-truck>
References: <20260907164247.17223-1-will@kernel.org>
 <40954731-a235-4877-b615-7a3f66f1b039@arm.com>
 <aqFDFYECDl15R_39@willie-the-truck>
 <5ecf87dc-30ec-454f-bee3-0c05f2f11168@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5ecf87dc-30ec-454f-bee3-0c05f2f11168@arm.com>

On Thu, Sep 10, 2026 at 02:49:37PM +0100, Vladimir Murzin wrote:
> On 9/9/26 12:29, Will Deacon wrote:
> > On Wed, Sep 09, 2026 at 11:39:24AM +0100, Vladimir Murzin wrote:
> > [...]
> > 
> >> I gave it a try and I observe splat:
>
> > I've hacked up an untested diff below, please can you take it for a spin?
> > 
> 
> With fixup applied I do not see splat anymore :) 

Excellent, thanks for testing it!

Will
