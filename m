Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A8CC3D2FF7
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 12:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790856883; cv=none; b=NOjUuE2XIf1PhBH/U1EBDPiKz9blGMCd9peLr7YKS7zKvUOfw1ZzPmW2H7HLkOvIjCeXBh7ZBVVIX7oYObHpR9khIAu8zOBAa1Y6xCQbMt3rfKrjnobLNg6ECdVsTfZZS7/z/W7SgVZccthkE+vOkVLORZCEwOcP392jUnnrvyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790856883; c=relaxed/simple;
	bh=wVtUWgaOEKeMG3QBbTDE3Q2m74NMlKQFKVvtmP3UtEo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N24QeBgjmQZk0OTVCHBm660jXFeF8SliWZiXE3Y7dllUFGBPs34VXb3bzU+L6wPzqA+dsAplHg9xtiQf5esJ2EcmcDtAN/IcBRxACcGqjvhjQeP1OkFgHlbXe5hufgmO650BFuNYKdbZsCZcBTdpWTkiFI27th5boyT2ZpmGrOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=NSo/qk3F; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="NSo/qk3F"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 050FF497;
	Thu,  1 Oct 2026 05:14:36 -0700 (PDT)
Received: from [10.0.153.43] (e121487-lin.cambridge.arm.com [10.0.153.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1734A3F85F;
	Thu,  1 Oct 2026 05:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790856879; bh=wVtUWgaOEKeMG3QBbTDE3Q2m74NMlKQFKVvtmP3UtEo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NSo/qk3FMwNv9RrDMGnKIJ0NxM8mzH7RcdqvkX6yfEz2PraIu0tDl7C5bgAlNtbOX
	 6y/1alX+hNoWfYJ3BqMpkp/c3ILapUduZlyvI+5xPwtmzfNsXtVNqXLHNbc8y+cdtI
	 J3//LjOce1qGPXKAnC0/sGpWfNOGwSdDdLbeLlq8=
Message-ID: <450d39ab-de8e-4a3f-aaa1-78c66c8509d1@arm.com>
Date: Thu, 1 Oct 2026 13:14:36 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/2] arm64: errata: Share broken AMU constant-counter
 handling
To: Will Deacon <will@kernel.org>, Beata Michalska <beata.michalska@arm.com>
Cc: suzuki.poulose@arm.com, James.Morse@arm.com, xuewen.yan94@gmail.com,
 seanwang1@lenovo.com, linux-kernel@vger.kernel.org
References: <20261001090050.3849551-1-beata.michalska@arm.com>
 <ar5HOl4JL0G2yZfE@willie-the-truck>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <ar5HOl4JL0G2yZfE@willie-the-truck>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/1/26 12:42, Will Deacon wrote:
> On Thu, Oct 01, 2026 at 11:00:30AM +0200, Beata Michalska wrote:
>> This series factors out the existing Cortex-A510 erratum 2457168 AMU constant
>> counter workaround into a generic broken AMU constant-counter capability,
>> then wires Cortex-A725 erratum 3821522 into the same handling.
> Thanks, Beata. These look good to me now and I'd like to include them
> in the next batch of arm64 fixes, but I'll give Vladimir a chance to
> have another look first...
> 

LGTM as well :) Thanks Beata!

> Will
> 

