Received: from mta0.migadu.com (out-72.mta0.migadu.com [91.218.175.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A898D2264A3
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 05:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788500417; cv=none; b=ccABVsROaO2a4W2zfPlYSkYZW06QpxEQqPt1H6kyPiqVjZxcxzCxnTLCFekupt9Ud13uFPTzJOnEWBWFNTJ1Wslc+17QYKdboFSIH5f5LpzmeLGpbcGz0aCpV5MWhn1nqRdiMqTT06/KNWh1vjOcexQYUp7ZCuqT5Y2xTJoHArQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788500417; c=relaxed/simple;
	bh=dyCnfFFpOhpjHLIFrc4rg8k7LxmQFyOG4miia4vweIw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:Cc:
	 In-Reply-To:Content-Type; b=GNBdCJt0GA5FwaYMISCs0ZAUvq0zVyuWt9pafEa8IqZh8STMHyl8NYcKC4++Pb2r+rh55MriMbwXZ+9ZmD94Jg2vfb7aEeK5GzxQhazyZt24F5RYV5ihepQU+MFUbxjsylCFBIoVKL5b02ikA0jsSyO2S1l9InR0aaupy9+L6ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=EvhxCWgB; arc=none smtp.client-ip=91.218.175.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="EvhxCWgB"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=dyCnfFFpOhpjHLIFrc4rg8k7LxmQFyOG4miia4vweIw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788500413; v=1; x=1789105213;
 b=EvhxCWgBm7e8DgKzTHCrD+atLKWq+f3md5F4j5pVgwCqvGdc91gpBvCKF1IeqkpKKBHVthmi
 jqBLwBrzgmNPxNEzfaiBHXmBEDwWh+rhW53wxkv/bgyPRYXMXlD48GVNFjR18cTdGRVKCdzpBQK
 EF0/I7zaYSlCO0P1h9ctD9uo=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 4d3ea4f23143e1ca;
	Fri, 04 Sep 2026 05:40:03 +0000
X-Mizu-Trace-ID: 4d3ea4f23143e1ca
X-Migadu-Flow: FLOW_OUT
Message-ID: <a8497c0e-94be-4cf9-ab64-0402c48c3a88@linux.dev>
Date: Fri, 4 Sep 2026 13:39:49 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] ppp: pass private data to channel callbacks
To: Jiri Slaby <jirislaby@kernel.org>, linux-ppp@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260904031153.30304-1-qingfang.deng@linux.dev>
 <927e0f8f-a656-45e4-a937-9de88b783073@kernel.org>
From: Qingfang Deng <qingfang.deng@linux.dev>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Mitchell Blank Jr <mitch@sfgoth.com>, Chas Williams <3chas3@gmail.com>,
 James Chapman <jchapman@katalix.com>, Simon Horman <horms@kernel.org>,
 Kees Cook <kees@kernel.org>, Breno Leitao <leitao@debian.org>,
 Felix Fietkau <nbd@nbd.name>, Asim Viladi Oglu Manizada <manizada@pm.me>,
 Eric Woudstra <ericwouds@gmail.com>, linux-atm-general@lists.sourceforge.net
In-Reply-To: <927e0f8f-a656-45e4-a937-9de88b783073@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2026/9/4 11:57, Jiri Slaby wrote:
> Hi,
>
> On 04. 09. 26, 5:11, Qingfang Deng wrote:
>> PPP channel callbacks receive struct ppp_channel only to retrieve the
>> driver's private pointer. Pass that pointer directly instead.
>
> We had type checking at least. What's the purpose of this patch, actually?

The goal is to unify the two channel structs and make it owned by the 
generic PPP layer.

You can view previous discussions here:
https://lore.kernel.org/netdev/20260430090532.244758-2-qingfang.deng@linux.dev/

Kind regards,

