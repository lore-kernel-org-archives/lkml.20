Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97964381AE3;
	Fri, 25 Sep 2026 15:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790348455; cv=none; b=uDbxQG069oKSZubiadBjDNeSt8B1zWX8rxKBDsx1T3uHE8iAaRuBNq/aJMO3EClt8y77WZqgdlMqKFWqUa7gEFE28vdi3ShT5xAdBzmzFuQPnqqvT+XTJxvxHJlmuVLcA88ruREHefhvOADwVIZVY3lSeOUrUeH4nrqH0vTbozI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790348455; c=relaxed/simple;
	bh=AGB4iC+vYvUQlj1ZUAcSF2g9tKfalHSRJPNMYE1V9yQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S042Ar6aosg4ZIaigqt7jrn1PmSIgWCT8oy7vO+feacD1i4xpMJmImh2hbQayG0Y5sLYBfZd4HyBPyYCia91yCI3CyVgbzZTMkuQl3ZnixhELaEG2jEtA8yxliGXoJdL7PwLAZAm6s5LD27cHr5chl0JuAvl/UZnk0GPPGyDgj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hy1KjIKA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hy1KjIKA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7B0F1F000FF;
	Fri, 25 Sep 2026 15:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790348435;
	bh=bQFaopmWknUu0oDihALqAE8UGeVoflNjvw1IIfWUq6c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=hy1KjIKAZ5Nv4rEyoH82u3oPWOQJp6+68aJFs8OWwuSP22g2nm31ZRE0Tkb+3PbGY
	 WR3SxqvxIYtU7JUCdqiR5ZjbI2spzc5FJMFNOUB6KKU37RcMm9aQ47JwQWI1ARZcxm
	 U7RUMIQGAOY5V7utURonyArL4mKIlV+4gecYVa3A40ixSY24gRVb93QnFpsbRskNy6
	 oiQ3FT9S0AGp719EWDCyxDwMvYEdij1tKjEqz4afw4b/BpWucA/dlVIEVXi70KRMNS
	 NeumvR/jZtXqsFe79x95uavZKxKx+R4km1YQIj7fUDnKNKGqBC0qYlUEdi+BblFjBr
	 d6vXUoUJrX9kg==
Message-ID: <48621819-9a03-4577-ac73-5cb186f8a9a7@kernel.org>
Date: Fri, 25 Sep 2026 10:00:33 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv5 0/4] EDAC/altera: Address sashiko reviews part 1(v5)
Content-Language: en-US
To: Borislav Petkov <bp@alien8.de>
Cc: tony.luck@intel.com, linux-edac@vger.kernel.org, rounakdas2025@gmail.com,
 linux-kernel@vger.kernel.org
References: <20260911120627.2634225-1-dinguyen@kernel.org>
 <20260925043821.GBarX6vdJ1WucqPuvN@fat_crate.local>
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <20260925043821.GBarX6vdJ1WucqPuvN@fat_crate.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/24/26 23:38, Borislav Petkov wrote:
> On Fri, Sep 11, 2026 at 07:06:23AM -0500, Dinh Nguyen wrote:
>> Dinh Nguyen (4):
>>    EDAC/altera: Do not allow driver unbinding
>>    EDAC/altera: Drop __init from ECC setup paths for re-probe safety
>>    EDAC/altera: Fix code leak on dci allocation failure
>>    EDAC/altera: Fix use-after-free in error paths
> 
> All those are marked for stable backports but the last three are fixing error
> handling paths. Are they really that serious that you want to backport them
> everywhere? If so, which ones?
> 
All patches should be applied to v6.18+. Would you like me to follow up 
with a v6 that has the proper tag for v6.18+?

Dinh
