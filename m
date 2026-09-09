Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F9413CA491
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 19:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788983665; cv=none; b=VCt4o/eCzCCyjpxqSY9yR28Av01Ad2DD1T5j5kh+xZXWNWBNUqmg+b01zdOfIkbXcMjl9JwhV6Sbl7rC0iUlDU4PYpfcUdrKWVazvn+mGbhvuak2dm81BkZmj0js+THJt7xz9K1sBbQGODbhIYyUyJxxYq0l/SAaGTXcjAwuoPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788983665; c=relaxed/simple;
	bh=DmP9k88nHDbbEKxSUwAEPVESr/VeuCRYcMP7DI/pGrA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YsQGlb1ZOZvi2fGtSMKYAmxNjtXpgv1UKQZJA8RnJn8T+7JYllu2qYVR+3mCujs27Y8MZ6dxc8e0h+p1Ns0Z5ICvZ3KTswhXEtG7qdLSPvwYxOvV3UCMbKt9UJBF0D6dr6o/hFwZcNbAoo2+7wqyEBnGhFgDzo7ufY4nh34QHD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=ZW+AD6pC; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="ZW+AD6pC"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 7B80C40E020D;
	Wed,  9 Sep 2026 19:54:20 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id tOZjEoCN9gv1; Wed,  9 Sep 2026 19:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1788983650; bh=H781Eci5CnOTdf5iHK/Yy0v/MuBeJ+xyuXMHO9afQNk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZW+AD6pCB69vYkuiylMtk6FX6FGrYL3KvopeuBxxwwiCOVefOqniE5buvqDvSKHA3
	 kXHARnrO5IjxhdYVs+aYP0/fv6aKiHW4GRaZoZrx2GkS8d9KTpeDiaPq7xLcCw7O4O
	 8oQrnJVxGx/eo+TiAXQPY2NSQ4Dri0JpHe+j4gohGZIr+LpZ66S5JiHVmveEXz+dpS
	 UcTeGzD4nNzk2UhUoT8GTj0H862bbrJsmojUvg2tgyZ/TG6cokiz0xNBvNpojMKvK3
	 OCdabf6Cy46sjVg161tOaJ/RkTcxUAcDS68OVvvRaxLwpY/XveCryfe6tapQ8I6D4z
	 wh+MMgFHmL2QJ2cDaPktFojn5Q5WsDQPJy3MBuUHLEjAMr9A3czNBmFQY+O/jeNqR6
	 crCRUWxhPzZkXa/wWUhS8OG1woCV6VOpD8GOfGtB/H5fDHHQ17b217shKxoblWA0Vs
	 RqbWPSbmLV+YwO+cpKXKlo2N+xeYBIFlYtsv84PK13zAr3fFgqeWRS/br4RFTAXPQr
	 mCX0InwP4x8xysc6OkA7seyK0r9vELNKx8tBi0FcoE06o3nmld0ALweOeURqJz4OFu
	 +GZmGdDOSLShsKsjPjWtHBLmFWsAmu6ExzkZfSclSKSLZeJny3koaZskRM8RA24rwy
	 c1enPRy7sq8sbise8I6u7PwM=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id F1FAB40E01E1;
	Wed,  9 Sep 2026 19:54:05 +0000 (UTC)
Date: Wed, 9 Sep 2026 12:54:03 -0700
From: Borislav Petkov <bp@alien8.de>
To: Melody Wang <huibo.wang@amd.com>
Cc: x86@kernel.org, LKML <linux-kernel@vger.kernel.org>,
	Tom Lendacky <thomas.lendacky@amd.com>
Subject: Re: [PATCH v1 5/8] x86/sev: Add a function to contain all
 SEV-specific setup operations
Message-ID: <20260909195403.GAaqG5W9gR-p3fMFYc@fat_crate.local>
References: <cover.1787973545.git.huibo.wang@amd.com>
 <9f24b2d1cd0bfd0c658219a38840415515593f1c.1787973545.git.huibo.wang@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <9f24b2d1cd0bfd0c658219a38840415515593f1c.1787973545.git.huibo.wang@amd.com>

On Sat, Aug 29, 2026 at 03:39:43AM +0000, Melody Wang wrote:
> +bool sev_prepare(void)
> +{
> +	u64 unsupported = snp_get_unsupported_features(sev_get_status());
> +	if (unsupported) {
> +		error("Unsupported SEV-SNP features detected\n");
> +		return true;

Sashiko says here:

| Does calling error() here inadvertently cause a silent system hang?
| Since error() is a __noreturn function that halts the system via an infinite
| asm("hlt") loop, the return statement directly below it becomes unreachable
| dead code.

Yes dear Sashiko, it used to do that before too with

	efi_exit(handle, EFI_UNSUPPORTED);

| Additionally, the early diagnostic output from error() might fail because the
| console lines and cols are not yet initialized in the EFI stub context before
| extract_kernel() runs, resulting in dropped diagnostic information.

Not a big surprise there.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
