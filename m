Received: from mta0.migadu.com (out-199.mta0.migadu.com [91.218.175.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CB99351C1E
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 20:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789330056; cv=none; b=jTb/EVP+HeWDr8ArDrPnlsM9WVdzE5kyFJfcNCT15+eHhJI1cK6WStkk/haR1ihkuEJxFj4Wp9QdW1AHvq8YYTqG9FdNEFFLregFtIGnMr62aaUbJSh7IjVwnp9S8XRo5baeTe0/Qs5ANL+G5ZHqSdU595Gf/lSWuAmwltMKP44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789330056; c=relaxed/simple;
	bh=4S6jf4y11Xts4VLEa/AMDEWCBPKttU+2Lopt3wtv6Zw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P+wFDbQalCsfCxO32LqauVGjaGt1jNhm7jQN+ObH5jT/1NFrVunyBW0UV0bt0qeHlMhcnCf6IcNeG+6pTHklYyGIrWPZDjkCZSTJo4ZD+gK4C1K5LvQT6V+yftm3szwjzT9ZSYaiCzy0FTjd125V7TmGL/Xz99TX/4GxUR/SAmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=klpGv4JM; arc=none smtp.client-ip=91.218.175.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="klpGv4JM"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=4S6jf4y11Xts4VLEa/AMDEWCBPKttU+2Lopt3wtv6Zw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789330051; v=1; x=1789934851;
 b=klpGv4JMiXQv1QVVW1+nPYISQQmDWsPc3ZX+FuCVG6BvxAvk8CWilc1aOZyo4JEQaJWEY5PK
 V3IhekA69vERSJToMg7GmYLzj2jDpeI5qO4e0EE/wqx5rn2gXlcrgIypsyOg6Y2u4kgqwHdm9Sp
 Y6jkJtZTbA+lJ2g+kMpN2gPo=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id c6cf965cb18a49c6;
	Sun, 13 Sep 2026 20:07:31 +0000
X-Mizu-Trace-ID: c6cf965cb18a49c6
X-Migadu-Flow: FLOW_OUT
Message-ID: <5c651fd3-c177-4d9e-b13f-3dc62f0b2c97@linux.dev>
Date: Sun, 13 Sep 2026 21:59:14 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/8] soundwire: amd: cache ping slave status to avoid
 spurious disconnect on timeout
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, vkoul@kernel.org
Cc: yung-chuan.liao@linux.intel.com, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, venkataprasad.potturu@amd.com,
 Syed.SabaKareem@amd.com, Mario.Limonciello@amd.com, Richard.Gong@amd.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260910190240.1604447-1-Vijendar.Mukunda@amd.com>
 <20260910190240.1604447-3-Vijendar.Mukunda@amd.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20260910190240.1604447-3-Vijendar.Mukunda@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/10/26 21:00, Vijendar Mukunda wrote:
> + * @ping_slave_stat: cached slave status from the last successful ping response;

It'd be good to clarify the definition of a 'successful ping response',
since this concept doesn't exist in the SoundWire spec.
The only valid combined responses are Command_Aborted or Command_Ignored...

