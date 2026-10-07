Received: from mta1.migadu.com (out-125.mta1.migadu.com [95.215.58.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBACF3FFAB0
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 06:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.125
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791355778; cv=none; b=EgIB3P/gk57hzCM1hnh6aIaTdqlawbEtECRa2xch+ImbxX+ycNU7CJm57tnaYqFDEvBzmdZF1VIMWhqL6WrfjmebFeY1infHMAkVZe1KPR7V6p6OaEozNzrwv3elFqjWbezgjAtjlWXvTfB/JuQGEZnH2I4CNwwjLylq94exhxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791355778; c=relaxed/simple;
	bh=X2Kii5dEPpIGSKl4rtxnre0C8366Gz5L+2PnSejSm7w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Te1DVQ9BdQ89YjhLso1JarMafotUFA/O9ZPbLgAzVBGyhkO8foSBy8SKATKxFwankos7KXR+ezOcFCP8T+c9XbSRJXYDYzipLLFoAvmHqeIkQ64YJWycDfxHCyqa0nsObiqNl23379WUc/SFWNaA4OPDMTTl2ZVSERpuJEc5TwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=aQsFok0i; arc=none smtp.client-ip=95.215.58.125
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="aQsFok0i"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=X2Kii5dEPpIGSKl4rtxnre0C8366Gz5L+2PnSejSm7w=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791355774; v=1; x=1791960574;
 b=aQsFok0ixLgKEUIxtueWJ8DePIb3Aob7vcSoTIldtFoCyruDzNTlWka+1L02Kl1epP5gr1Ud
 1aEYFiLVCqFZpGhDbPoLH8SO+s4Hd4viV62n/qqIK+hHxyg210y+HxkGn1zGYTMECa/GzxVINLN
 fsgYwMkSAEh+QuPV60qHEaxg=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 12565de92abcb202;
	Wed, 07 Oct 2026 03:56:07 +0000
X-Mizu-Trace-ID: 12565de92abcb202
X-Migadu-Flow: FLOW_OUT
Message-ID: <8a8241c4-0e41-4ddd-aeef-b9ecb4f55d3a@linux.dev>
Date: Wed, 7 Oct 2026 11:55:48 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 3/3] tcp_cubic: fix divide by zero and endless
 loop on bad module params
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, Eric Dumazet <edumazet@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Neal Cardwell <ncardwell@google.com>,
 Kuniyuki Iwashima <kuniyu@google.com>, "David S. Miller"
 <davem@davemloft.net>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>,
 Stephen Hemminger <stephen@networkplumber.org>, linux-kernel@vger.kernel.org
References: <20261001112948.322463-1-jiayuan.chen@linux.dev>
 <20261001112948.322463-4-jiayuan.chen@linux.dev>
 <20261005171227.2014f26e@kernel.org>
From: Jiayuan Chen <jiayuan.chen@linux.dev>
In-Reply-To: <20261005171227.2014f26e@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/6/26 8:12 AM, Jakub Kicinski wrote:
> On Thu,  1 Oct 2026 19:29:43 +0800 Jiayuan Chen wrote:
>> Subject: [PATCH net-next v2 3/3] tcp_cubic: fix divide by zero and endless loop on bad module params
> if the LLM Medium severity complaint is true maybe also update
> the subject? I thought there's an actual div by zero somewhere
> but the commit msg seems to describe the inf loop



Hi Kuba, sorry for the delay.

The LLM is talking about (cwnd * beta_scale) wrapping, which needs
cwnd >= 33M packets, way past the 1M limit this code documents. So
the loop fix is fine.

The div by zero is real: beta == 1024 in "/ (BICTCP_BETA_SCALE - beta)"
and bic_scale == 0 in do_div(), both at init. The new range check in
this patch rejects both, I just did not say "divide by zero" in the
commit message.

Want me to spell this out in the commit message? I can also add the
READ_ONCE() Eric mentioned in the same respin.

