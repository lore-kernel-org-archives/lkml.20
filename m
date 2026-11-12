Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.232
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794471126;
	b=vmnvcZOKFFpUMTh7zF7yMbfS6a97JAXgpM36n0xK6Mk18BSjf3gf2M9mMc69nF6PnfeU
	 LzLDWyT0eCHkZCnm1u/Q+gZeReF6FN5M4htdNMqtONaWWsxyzwU0sWzDt0fp3TgdSk27n
	 TRLd31JqwkeLROedmQf9ErYzfsNbJA2LByiPnCYhJWX+my/2/lI6cbX/0ZqPC2nEd31Kl
	 PBffylXQWJbWycjExVZNvoBoxcrUIjQ10FyhC9icgVla/jvqruM8X1+A0dcLtHtIlGK96
	 FPh8xf3gHfzTdpKf03pVN/kvfP5tYlWl3YPl/aMgYFYPP9JFA2XSRbba4yT9pol6ENg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794471126;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=2DXTib91gsZWMci31s2/papzXI1yMDy+vLlbyatZAOw=;
	b=k48pcIDA3WzBGGU6eJMpegcbzos4Dmv1z4i+UbhqSJsadYNjPq6sio1IFeyYOQcihHdq
	 5YPlxsVEzG9lEpENRVfZzlHHxEaXQakvTOwa7pIlvznt+sXa5BibQegkKT2EZx8cZZ2FV
	 dHU51YjEgsdbXuarginJB8nzFfeFm2VO+aj5YWfDum3lPQ+Xw3cE0kKsp0gEf/eWMj978
	 e2zMkc0Tqv0i3BKCAwnLDEir4RYYY4IbOJHFYsgpEXkGQFbGY4rvTdf8T+z4R690WxbDw
	 UGQD0MxBJvNJpMT6y/WtfJor4UzACOzGnNMw2CpKOkDph+ChrTsCHBeXkbI8fkuvBBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=udR7Cso1;
	arc=none smtp.remote-ip=95.215.58.232
Received: from mta1.migadu.com (out-232.mta1.migadu.com [95.215.58.232])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67F94606A88E
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:12:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67F94606A88E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=udR7Cso1
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=MIlpUilfjWQas5s88dMSxGno34OUkuXNtMLcPDdvmUQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794471123; v=1; x=1795075923;
 b=udR7Cso1dP2xa5ZXjuUfh29RO7vqSWXuK0DNQMgrXkZs6yUoEewphYhHdpy6/FI2Zy5AZN84
 4dLNHTWjQWhEtYo9b9rph5h3unp+ikhi1UAroRusLdFmPh6OoJnmIcLe+6NNq+AB3husbbupG9q
 GzJ3Jbl+6XjA7M5p8Dw9KlY4=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 882782719120a8a8;
	Thu, 12 Nov 2026 08:12:03 +0000
X-Mizu-Trace-ID: 882782719120a8a8
X-Migadu-Flow: FLOW_OUT
Message-ID: <530744dd-da1c-4c60-b344-67e8f895b28f@linux.dev>
Date: Thu, 12 Nov 2026 09:10:50 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] soundwire: mipi_disco: Put fwnode on property array
 read errors
To: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>, vkoul@kernel.org,
 yung-chuan.liao@linux.intel.com
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261112060943.1916-1-laixiangwu@cmss.chinamobile.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20261112060943.1916-1-laixiangwu@cmss.chinamobile.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/12/26 07:09, Xiangwu Lai wrote:
> sdw_master_read_prop() and sdw_slave_read_dpn() take a fwnode
> reference with device_get_named_child_node() and already release it
> on the -ENOMEM and success paths.  However, the error paths added
> for the property array reads jump straight out without dropping the
> reference, leaking it on every failed read.  The lane-list support
> in sdw_slave_read_dpn() is even missing the put on its -ENOMEM path,
> unlike the other array allocations in the same function.
> 
> Release the reference on those error paths as well, matching the
> existing -ENOMEM handling in the same functions.
> 
> Fixes: a489afc105ed ("soundwire: mipi-disco: add error handling for property array read")
> Fixes: 71b405b18444 ("soundwire: mipi-disco: add support for DP0/DPn 'lane-list' property")
> Signed-off-by: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
> ---
> Changes in v2:
> 
> - Fix the subject of the first Fixes tag to match the commit title
>   ("mipi-disco" instead of "mipi_disco") and add a second Fixes tag
>   for the lane-list error paths, which were introduced by a different
>   commit and also cover the missing put on the lane-list -ENOMEM
>   path (suggested by Sashiko AI review).
> - Note: an earlier attempt to fix these leaks using __free() was
>   posted in 2024 but never merged:
>   https://lore.kernel.org/all/20241019-mipi_disco-of_node_put-v1-1-1de27e6852c4@gmail.com/

Thanks for the patch, the existing code is indeed inconsistent. LGTM.

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>


