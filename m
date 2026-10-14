Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 482D54CA27E
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 09:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791971612; cv=none; b=BYS9ygTgDG3cSDQJF0DrksWixMplxvPKhzi95LQsR9J4gMxV8gnAYS/Vt+xrg+iB6NwsDaGYE6DK4pUYYORyqJcLmVaOXdp1ftKJthfrGTJFLf+LBOOG5ZBk9QEZZggVEpOwYdBP29YfXleZNYHPD71yqb8nj2y+QqqaJ2jlm7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791971612; c=relaxed/simple;
	bh=RNPKAsUjOfj9waWmGaXsR1tvNn15HrXYOhu2qrwpM9U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S8GqS/7MieulM7fCkt1xOFshHhEnCFnU0+kJjEkIt807tc/8kqwfF8fsNWA9KnI7Eyz3sd1VLtd2bT7A9wKBH+sGSEbiBO5q+4i6y9IHrhV4wX7lMui0+kYnwLzJ3Dl/2lpAoD/CtBVMADOiCNnrU1EuZUSqe/KFegeRnWe6GQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=AjmPpVZj; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="AjmPpVZj"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5A4A4152B;
	Wed, 14 Oct 2026 02:53:27 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 406193F7B4;
	Wed, 14 Oct 2026 02:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791971610; bh=RNPKAsUjOfj9waWmGaXsR1tvNn15HrXYOhu2qrwpM9U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AjmPpVZjy9QZXDyk5TEbdFHENvBh/mwN6N5qV55U36gu8IXTCvKBIDPRbn7X36mX5
	 zLyAdLPGiFmD2PLQ9JBfj1n9ZJsm0MGlj4YUSkCVEWwNpG7Wwcdkr6OHIfPUQkX6rD
	 jlJEEqYnw64dYjfeQhdpyI2fmpjy6BLeGQHa7jbg=
Date: Wed, 14 Oct 2026 10:53:25 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Kohei Enju <enju.kohei@fujitsu.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Sami Mujawar <sami.mujawar@arm.com>,
	Steven Price <steven.price@arm.com>,
	"Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Subject: Re: [PATCH v2] arm64: rsi: Correct type of realm_config::hash_algo
Message-ID: <as9RFRuhlGL1mZbz@arm.com>
References: <20261014-cca-b4-rsi-fix-hash_algo-type-rebase-v2-1-6cb0ae13c8c1@fujitsu.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014-cca-b4-rsi-fix-hash_algo-type-rebase-v2-1-6cb0ae13c8c1@fujitsu.com>

Thanks for respinning.

On Wed, Oct 14, 2026 at 11:43:23AM +0900, Kohei Enju wrote:
> The RMM specification defines RsiHashAlgorithm as an 8-bit type, but
> realm_config::hash_algo is currently declared as unsigned long.
> 
> There are currently no upstream users of this field, so the mismatch
> does not cause an observable issue today. However, a proposed series
> adding support for Realm measurement registers uses this field and
> exposes a bug caused by the incorrect type.

It should be clear the bug is in the RMM implementation. The patch here
is more like defensive programming when the RMM doesn't honour the
interface and zero the unused bits. I can fix the text when applying.

> Change hash_algo to u8 to match the RMM specification while preserving
> the size and layout of struct realm_config.
> 
> Link: https://lore.kernel.org/all/20260413084957.327661-4-sami.mujawar@arm.com/
> Signed-off-by: Kohei Enju <enju.kohei@fujitsu.com>
> ---
> Changes in v2:
> - Drop the inner union and padding around hash_algo (Catalin)
> - Link to v1: https://patch.msgid.link/20260929-cca-b4-rsi-fix-hash_algo-type-rebase-v1-1-6932cf0aa605@fujitsu.com

In theory we could add a fixes tag for reference but not worth cc
stable.

Fixes: b880a80011f5 ("arm64: rsi: Add RSI definitions")

> ---
>  include/linux/arm-smccc-rsi.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/linux/arm-smccc-rsi.h b/include/linux/arm-smccc-rsi.h
> index fddb77986f70..cca881ddfdba 100644
> --- a/include/linux/arm-smccc-rsi.h
> +++ b/include/linux/arm-smccc-rsi.h
> @@ -128,7 +128,7 @@ struct realm_config {
>  	union {
>  		struct {
>  			unsigned long ipa_bits; /* Width of IPA in bits */
> -			unsigned long hash_algo; /* Hash algorithm */
> +			u8 hash_algo; /* Hash algorithm */
>  		};
>  		u8 pad[0x200];
>  	};

Suzuki, are you ok with this patch?

As a separate patch, we need to add some static_assert() for the offsets
and the size of the realm_config structure. We do this in
arm-smccc-rmi.h already.

There's a similar realm_params structure in arm-smccc-rmi.h but,
IIUC, the hash_algo there is written by the kernel, so unsigned long is
fine.

-- 
Catalin
