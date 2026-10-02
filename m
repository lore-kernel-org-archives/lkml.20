Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CF2B4D487C
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 15:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790955027; cv=none; b=WrLTjTP0sl+5OgU2z4RzUN/8wieDhXf37WvXabnsxZQdvAgJVMj/AnRoSQjWQbv7HnyKWQmCSs/TIiMo+/h6q2KmfrVGCQKsSO9L6GqXcx0iYxiwBxTO9BSilXCHkcuzuYUuVPlLfsBGdHHMEbuDI9AfRon4zVKfbDjdLwO0jt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790955027; c=relaxed/simple;
	bh=Z2LspGkQ5z5Seubq49ws0rOaPx79NGD0/r2VYPepM9A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QkKnCgbCOfjq6IXUcj3m7ssEYiL/ooIwDJ2/WbMVJRmQr9IZKtfCDwviC1743hKb8xAiI4Aab4geUmylogziFri3HWQzdVuFw3RlpQx44Wl7mywINLdsmkjn+AMcd54OPbPr9xclGNo2FIwoSgIoK0xL/2pW3VCGtbhhQAT0XXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=YOBqbhh5; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="YOBqbhh5"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1DB41143D;
	Fri,  2 Oct 2026 08:30:22 -0700 (PDT)
Received: from [10.2.212.14] (eglon.cambridge.arm.com [10.2.212.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7875D3F85F;
	Fri,  2 Oct 2026 08:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790955025; bh=Z2LspGkQ5z5Seubq49ws0rOaPx79NGD0/r2VYPepM9A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YOBqbhh55rD5PUXRNb3Ao6y0RLQ96QltvKZhxCchZq1Z/lO0gHRPTiAA+LGjUehv7
	 yC7EzJ9USIf9GqOP62vpmL+ofQ/VqCApwg4D9ueDOgRBSdYv6uM+gHHeVMGDx/tv5r
	 /n0vLT5V7kayeSsY5Sk8Uhn6wnKbWzRP4+Mtyc8o=
Message-ID: <7657b40e-ae69-4218-b5fa-dd00417dfc97@arm.com>
Date: Fri, 2 Oct 2026 16:30:22 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: Use linux-arm-kernel list for the MPAM
 driver
To: Ben Horgan <ben.horgan@arm.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com, will@kernel.org, reinette.chatre@intel.com,
 fenghuay@nvidia.com, Gavin Shan <gshan@redhat.com>,
 Yin Li <yin.li@oss.qualcomm.com>
References: <20260915103101.1659477-1-ben.horgan@arm.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <20260915103101.1659477-1-ben.horgan@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Ben,

On 15/09/2026 11:31, Ben Horgan wrote:
> As MPAM is an arm64 feature and patches mostly go via the arm64 maintainers
> it may be reasonably expected that the MPAM driver uses the list-arm-kernel
> list.
> 
> Make this official by adding the L: in MAINTAINERS.

Makes sense - I've picked this up to send on to Catalin.


Thanks,

James

> diff --git a/MAINTAINERS b/MAINTAINERS
> index 6215fcb07770..2113a0051b52 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -18436,6 +18436,7 @@ M:	James Morse <james.morse@arm.com>
>  M:	Ben Horgan <ben.horgan@arm.com>
>  R:	Reinette Chatre <reinette.chatre@intel.com>
>  R:	Fenghua Yu <fenghuay@nvidia.com>
> +L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>  S:	Maintained
>  F:	drivers/resctrl/mpam_*
>  F:	drivers/resctrl/test_mpam_*

