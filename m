Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA94751D52E
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 17:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791911316; cv=none; b=t/eWJ/T0qlLWJoVeasx8g3pPJz4tX0o7wP6f7Ss0VXWriHJxx5XRpvMIMPzWsHKfX7C2Vmhyy7Wywljsp+k0CGaMbTb4lVLdt2yURsHf4JDg93ptgiNb5Tk1kj1P1yo+Me2L4CDOcZcxbLvJzpmdIL0hbQjwBIGItcBH7Z1Fvg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791911316; c=relaxed/simple;
	bh=/odOX9ez2pvaTTVtpbIWFEknWi4FKEK77cCiqSD0LvQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HTiLuZHmFUk05cebVC+9ih8AtoL62cED2idjlu6BUOY+xLqsrX5Wlm6cjTkAe0PQT/yrlBPFsbXi2iHrJVAHKWJpSD6vpR3Q/ic4PYTgSq2cOlJPCkhxpP3NTP8wFable5Hvt94ELGptSZESQvfebHa/ZWzCxSLlqKOJ6aYntOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=ukYEgKCo; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="ukYEgKCo"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A296F169E;
	Tue, 13 Oct 2026 10:08:29 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8BB1F3F673;
	Tue, 13 Oct 2026 10:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791911312; bh=/odOX9ez2pvaTTVtpbIWFEknWi4FKEK77cCiqSD0LvQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ukYEgKCoi/qiX6vq/VIlYxed2jQElr4YBUOZLD0+R6DQaMdve6ZgKSPH3LQLwrW0h
	 BJ/Xki3HHH6qTl1eA7h6W8WnamUsW0x7UvBV52z7ivuSvdCzVSXWnwPSHnGVfQ2e6e
	 gR+js2RlJZxFiT8oYH7Ok+Rfms80WWgkZwKMKOXU=
Date: Tue, 13 Oct 2026 18:08:28 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Kohei Enju <enju.kohei@fujitsu.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Sami Mujawar <sami.mujawar@arm.com>,
	Steven Price <steven.price@arm.com>,
	"Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Subject: Re: [PATCH] arm64: rsi: Correct type of realm_config::hash_algo
Message-ID: <as5ljILkGNxH0TTd@arm.com>
References: <20260929-cca-b4-rsi-fix-hash_algo-type-rebase-v1-1-6932cf0aa605@fujitsu.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929-cca-b4-rsi-fix-hash_algo-type-rebase-v1-1-6932cf0aa605@fujitsu.com>

On Tue, Sep 29, 2026 at 08:36:00PM +0900, Kohei Enju wrote:
> The RMM specification defines RsiHashAlgorithm as an 8-bit type, but
> realm_config::hash_algo is currently declared as unsigned long.
> 
> There are currently no upstream users of this field, so the mismatch
> does not cause an observable issue today. However, a proposed series
> adding support for Realm measurement registers uses this field and
> exposes a bug caused by the incorrect type.
> 
> Change hash_algo to u8 to match the RMM specification while preserving
> the size and layout of struct realm_config.

Doesn't the RMM spec say that the unused bits must be zero? B5.5.19.
That said, I'm ok with the explicit u8 here.

> Link: https://lore.kernel.org/all/20260413084957.327661-4-sami.mujawar@arm.com/
> Signed-off-by: Kohei Enju <enju.kohei@fujitsu.com>
> ---
>  include/linux/arm-smccc-rsi.h | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/include/linux/arm-smccc-rsi.h b/include/linux/arm-smccc-rsi.h
> index fddb77986f70..2fb6ec5e0298 100644
> --- a/include/linux/arm-smccc-rsi.h
> +++ b/include/linux/arm-smccc-rsi.h
> @@ -128,7 +128,10 @@ struct realm_config {
>  	union {
>  		struct {
>  			unsigned long ipa_bits; /* Width of IPA in bits */
> -			unsigned long hash_algo; /* Hash algorithm */
> +			union {
> +				u8 hash_algo; /* Hash algorithm */
> +				u8 pad_hash_algo[8];
> +			};

I would skip the padding for now, we have one already. If we later add
the next fields, I have a slight preference for a u8 reserved[7] field
than another union.

>  		};
>  		u8 pad[0x200];
>  	};

-- 
Catalin
