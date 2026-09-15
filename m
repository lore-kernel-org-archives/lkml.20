Received: from mta0.migadu.com (out-129.mta0.migadu.com [91.218.175.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 354EE318EC7
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 01:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789435678; cv=none; b=g4xnx2IYFeUBw+hxjde4XhiFfZ+5hf7z8uBxhGBSHb4Qg9nx3EmICNtVWRzz1DXmXXROGDscUuVr7RKpdemRzhwoYPfQ3eJcWUSMRy+GurgvfPsEWuwgZvCFGV9AmPkD0VaNKddlKCIYSylT+j7rNTmVjZlqH4EAE1WUCJDvLNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789435678; c=relaxed/simple;
	bh=/UoPunvCEXG8tnFMxO/BnhHtSexaaG/QWzRat8cX3QI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pxhaF/7b4sJQKa5o2kYoXG+quzt12/WfFFR3pO/2rZpMbUKHAz9/1mJVhv7nPCPGPxjOM3jeGswO589C4K+6U7IPdkE2mv9y4bqwtrq/6CCQhWchiAijAy5FJ5DkHlUKyy2nC4gwRiDlmrJy3k4ByO0NFY69gb/v8I8TEA00KlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=bwUXhoMl; arc=none smtp.client-ip=91.218.175.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="bwUXhoMl"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=/UoPunvCEXG8tnFMxO/BnhHtSexaaG/QWzRat8cX3QI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789435672; v=1; x=1790040472;
 b=bwUXhoMld7aFmIGH3LZIxizzWgF4NyhwuhCwS2QH+GHU7PsrxOVRjIJiDFXFP+lWIe02kGY5
 nN2WiWUQ2z47BryPH1YGVdukhMgoWzheXuk7eTsHVuQ5edbDcl+tla/JbmnG07WxNlXcC5+z2d8
 +kCWT5gKVcVHkRYICQLGX/bo=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 6f87dcdf948d143b;
	Tue, 15 Sep 2026 01:27:42 +0000
X-Mizu-Trace-ID: 6f87dcdf948d143b
X-Migadu-Flow: FLOW_OUT
Message-ID: <eb2c9089-3633-40f6-b836-b81bb6c10d64@linux.dev>
Date: Tue, 15 Sep 2026 09:27:35 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] ppp: ppp_synctty: Use common error handling code
 in ppp_sync_txmunge()
To: Markus Elfring <Markus.Elfring@web.de>
Cc: LKML <linux-kernel@vger.kernel.org>, Kees Cook <kees@kernel.org>,
 linux-ppp@vger.kernel.org, netdev@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Jiri Slaby <jirislaby@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Tom Parkin <tparkin@katalix.com>
References: <1d943bf2-d027-41aa-82db-b2f0807a5e7c@web.de>
 <09743e95-cb1b-4750-89bf-6a4a4d96ede0@web.de>
From: Qingfang Deng <qingfang.deng@linux.dev>
In-Reply-To: <09743e95-cb1b-4750-89bf-6a4a4d96ede0@web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 2026/9/8 15:48, Markus Elfring wrote:
>> Use an additional label so that a bit of exception handling can be better
>> reused at the end of this function implementation.
> How do you think about to repeat the proposed source code transformation pattern
> after an other contribution would be integrated?
> [PATCH net] ppp_synctty: ensure a writeable skb header
> https://lore.kernel.org/linux-ppp/20260908072135.877364-1-qingfang.deng@linux.dev/
>
> Regards,
> Markus

This change is merged. You can now rebase and repost your patch.

Best regards,
Qingfang
