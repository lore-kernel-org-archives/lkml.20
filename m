Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE50D4AA401
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 16:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788366669; cv=none; b=ohj0rj+ZmpHpryQNDUqOorgGV6ntgnz5SOjRG2pKIsxZlbgAEmHb12ywhhjb8ehYTSEDcrOhCEWW/c1WNdpwgcwzr7g/Vi9J2BUHm0FtZ1ddO854opHoEp5IMONMOjH7zIo337JwRpYqU/1G38OHfVXgAIlzsU05mXa7VhwKm/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788366669; c=relaxed/simple;
	bh=fbmtpU9efpASwtyuYlqk/ytKEW7KWNwMcly42NNl4UU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=ntwtT6fFOimgvSuPOFApMkB3yLN9ZA7UgvXb4YXgImQg9Bt8gJhrnTIDXrRvpV+NCXaZNmbANJeL8f0KdA8FNbzdTD3w8KoOhuJdZ0M394XScqtWuumawlgrWp+PYN76jWzq5qxqai6NpFaHlFhZLhHEXAuX/Q4gm+6FPmuFImg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BDoqWYKv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BDoqWYKv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 376C31F000E9;
	Wed,  2 Sep 2026 16:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788366668;
	bh=ivmAGu6KDbxR5SQnssIb2xoPeX1yE5C+n0PO2F69Di4=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=BDoqWYKvI7vFQCoFyCrF46JeuGinjpstz33ttPAPuXUY9JFIe9aFNv9O4uUqRqr59
	 QfT4suoSs7X4PPZj52RyDyRmwQgZFuiN0SZ7nfBVKChQKBmRke8sJX5iMGm2Fxcd/1
	 ax0vvy763EMF/LyC7AwpfukA+dW+GKIqqn6QzXZypnfZNXDNE2lK6Q24d7+FOmiqkY
	 SzXaJz44LJzj/Wr6aFyxYj9FjxK/b6B9VYY8+8Ienr3Sqj81IphbUQKOb6btHN1KkI
	 j9ij1VSH5SGe8OtjP68yUeKlm5SuRACCrQwQ5RC+Dz3JprTaVnBaTjOBA50c1KgmYf
	 yihpS5EqeAKvw==
Message-ID: <ee89861d-b0f6-46bf-a7cc-310da1f1acda@kernel.org>
Date: Wed, 2 Sep 2026 11:31:07 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] firmware: stratix10-svc: fix kaddr dangling pointers
 and populate kaddr1
Content-Language: en-US
To: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>,
 linux-kernel@vger.kernel.org
References: <cover.1779780223.git.adrian.ho.yin.ng@altera.com>
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <cover.1779780223.git.adrian.ho.yin.ng@altera.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 5/26/26 15:35, Adrian Ng Ho Yin wrote:
> kaddr1/2/3 in the stratix10 service layer are set to addresses of local
> arm_smccc_res fields that go out of scope when the setting function returns,
> leaving dangling pointers in the callback data.
> 
> Patch 1 fixes this by adding a1/a2/a3 scratch fields to struct
> stratix10_svc_cb_data, which lives for the SVC thread lifetime, and
> pointing kaddrN to those fields instead of the stack.
> 
> Patch 2 uses the same mechanism to populate the previously unset kaddr1 in
> svc_thread_cmd_config_status(), exposing firmware status details to callers.
> 
> Adrian Ng Ho Yin (2):
>    firmware: stratix10-svc: fix dangling kaddr pointers in callback data
>    firmware: stratix10-svc: populate kaddr1 from config status response
> 
>   drivers/firmware/stratix10-svc.c              | 45 ++++++++++++-------
>   .../firmware/intel/stratix10-svc-client.h     | 17 +++++++
>   2 files changed, 47 insertions(+), 15 deletions(-)
> 

Do these patches need to get backport into a stable release? If so, 
please add the appropriated Fixes tag.

Thanks,
Dinh
