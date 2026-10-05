Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F75A492515
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 16:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791216811; cv=none; b=mk2QCLRjUbLFLf14yQbhOFhaZ0ZCiHsqk5lNy8TV7xecItRXEScAj7s9dALVzLxZuLRuBRtRBgmECB4BbWd1VBs0VyZ4YncxV9F5cxGzGxeXk8uThpzvHZirvi4lV+qmKr1otp9JPiqIeJep5C5b64saFspzi+G8ehlzNTz10yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791216811; c=relaxed/simple;
	bh=nKY+WWCzwVmYqbxzpFPxheXzpwRB6qTP5rdmJRjxtjs=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=gJDlCxO+1Evn6IoD3KjZ8X/TPkSly5uryOcNhkEqP1s8n/ABXlk58Xz19jjzRETJKezEyFfBu+0h7vxkFpz+xuiyfDxMoz9CKdS0WBU36TiRMaKVIXv41u15akZgR3POoNBzrfyB+22BbKhfLIwC3ylE4llTUpNwNt+AgSEqTzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D8IZgQ29; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D8IZgQ29"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F3471F00893;
	Mon,  5 Oct 2026 16:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791216805;
	bh=Nv+ef2r09uyNGgjPBw3+ln0SNEMUn3NLx9YQl8rZbeY=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=D8IZgQ29qHQvPFh2duAnFSrWYMGTlwpgEFSJuhHB93e2t6AO0A+avgP4dDikN8Mb7
	 ayyjzUPR/gdi3cY/wyyGtSQlYUHlMw+rp2mUWPLRqRcpBYhtkmdThO3InPpgQ7osZS
	 dOfeMh8Cq5dSChUhnMylL8YnygsZL73jtPUdrDhBCM2Jxk6ZmapgAR2LXeRcnR9UVU
	 5EuhzQQXr/B00l4mevrZ4wa0LhMr5aU5l+BikoBNzjHOKa5dygN+D7rtnosmyNSYH/
	 ClhypS5pvquRmjDOsuzOjWMpTbB0e+Y7COKjcrsI6LZpYdSgPJff1gkVOazYjDrJUC
	 A9ZcpkGO3P99Q==
Message-ID: <a10dc0ef-213a-4c46-865a-02d0b720f5a1@kernel.org>
Date: Mon, 5 Oct 2026 11:13:24 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] firmware: stratix10-svc: Reduce polling interval for
 command status
Content-Language: en-US
To: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>,
 linux-kernel@vger.kernel.org
References: <397bca17aad39df1b48dc971ab09c8955d778252.1790005475.git.adrian.ho.yin.ng@altera.com>
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <397bca17aad39df1b48dc971ab09c8955d778252.1790005475.git.adrian.ho.yin.ng@altera.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 9/21/26 11:00, Adrian Ng Ho Yin wrote:
> The service controller currently polls FPGA configuration status at a
> fixed 1 second interval until the 30 second timeout expires. This leads
> to slow response time for fast-returning commands and unnecessary delay
> before reporting completion.
> 
> Introduce two polling modes:
>   - Fast polling: 20 ms interval for up to 50 iterations (≈1 s total)
>   - Slow polling: 500 ms interval for up to 29 seconds
> 
> A new helper, svc_cmd_poll_status(), abstracts the polling logic and
> replaces the existing loop in svc_thread_cmd_config_status(). This allows
> the driver to respond quickly to short operations while still handling
> long-running configuration commands within the same overall timeout
> window.
> 
> Signed-off-by: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
> ---
>   drivers/firmware/stratix10-svc.c | 104 ++++++++++++++++++++++---------
>   1 file changed, 76 insertions(+), 28 deletions(-)
>
Applied!

Thanks,
Dinh
