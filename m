Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.105
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793756954;
	b=MhP7JEd1+yCorWBQsTCzD0USlhHIWNpxFhiwRlWmMA5Z+5bmi/gR7gS4JYG5pWQXLoYO
	 j/LWAzlA+Ss4TuEqh7N5kRrrgRqeyqVIVXPiqL0StaPBKOYgOmSk/IJ3huXY3QUw2lGbP
	 xW/6UBV9Vlna2aucesBtvZAnVviY7iwbaqDK3UFDrNQ+JKOQOvNzpTeRf3Q/e9FFHv9lu
	 I5qeWtqK1DG5LDYqV92m5vubFLz8C2zmr70mTbBpumqa0Sc/N2p8iaYd0smfDJdwiKpLe
	 kGvR8fBw8yvcbo6YcrcXLfYvSSpVHQUeo4UkYFV9koyepicRHD4gCoMIDZiSuJQxWjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793756954;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=B9+nhlrF2Dcltc/b/gA0HI4sU+fSxvFt8AwHcya3lHg=;
	b=hzMJ3dI9QMPcC2weW3MEvWEMQ0F6fxkpEA7pCxykZwFQwgCWzbl/OfP0Sl9CY662haXW
	 jJGgQsryzKONHwzAtksiPldRTmEvJGdjbQO2BfveM/XciyUFQZImryimgRNSmCVoWRt3G
	 gboW3oIdrv4LgzscUWnxgP8zjlRpm3Erkz5fxTCPzcZD0LuanFImB7RDl8h2AjyMz+zpE
	 fQi4vzjOuKJjmHVivjK0h1vE3Fnxn85/dXRCa8z2rB6fgDylWdCDCRyEXqDFIniLFIOgS
	 D2WK6690cIgqr/yED70ZM6V42JIDDU5hBCOzsiSDX8OVaObXHZG5GeEFenG4UW3XPUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=HqMO2M+b;
	arc=none smtp.remote-ip=91.218.175.105
Received: from mta0.migadu.com (out-105.mta0.migadu.com [91.218.175.105])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0779606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 01:49:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0779606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=HqMO2M+b
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=ly87kVwc8IX3qQC1upPNiV4ixKwflXWdxxSQPtJr530=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793756951; v=1; x=1794361751;
 b=HqMO2M+bRcA7d5R9RDSl1FBdrLqgrYDcwMZAKym1rjmisJgBs7rAmFMp6SRNNCdG8J6TC0+s
 LSSSD7eWz5trXaj39FV4OSwUNz8JxwrM97UqDhBGlxvyy7t+w3jP714WXWxCaD1eGHtyoUemErJ
 tqP1hUt7AWbSTkKxi1unSuBo=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id bf8193c6aca9eaae;
	Wed, 04 Nov 2026 01:49:10 +0000
X-Mizu-Trace-ID: bf8193c6aca9eaae
X-Migadu-Flow: FLOW_OUT
Date: Wed, 4 Nov 2026 09:49:00 +0800
From: Hangbin Liu <hangbin.liu@linux.dev>
To: Sasha Levin <sashal@kernel.org>
Cc: Pablo Neira Ayuso <pablo@netfilter.org>,
	Florian Westphal <fw@strlen.de>, Phil Sutter <phil@nwl.cc>,
	Fernando Fernandez Mancera <fmancera@suse.de>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	netfilter-devel@vger.kernel.org, coreteam@netfilter.org,
	netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
	llvm@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH nf-next] selftests: netfilter: nf_queue: drop the no-op
 loop initializer
Message-ID: <auqPDIM0z0MbuBhS@fedora>
References: <20261103165419.687806-1-sashal@kernel.org>
 <20261103165419.687806-5-sashal@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261103165419.687806-5-sashal@kernel.org>

On Tue, Nov 03, 2026 at 11:54:18AM -0500, Sasha Levin wrote:
> The out-of-order verdict loop starts with "for (ooo_count; ...", and
> clang warns about the unused expression:
> 
>   nf_queue.c:354:10: warning: expression result unused [-Wunused-value]
> 
> Leave the initializer empty.
> 
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
> KernelCI's clang builds show this warning.
> 
>  tools/testing/selftests/net/netfilter/nf_queue.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/net/netfilter/nf_queue.c b/tools/testing/selftests/net/netfilter/nf_queue.c
> index cca6c3cfa9e46..bc0b2f601a0a4 100644
> --- a/tools/testing/selftests/net/netfilter/nf_queue.c
> +++ b/tools/testing/selftests/net/netfilter/nf_queue.c
> @@ -351,7 +351,7 @@ static int mainloop(void)
>  		if (opts.out_of_order) {
>  			ooo_ids[ooo_count] = id;
>  			if (ooo_count >= 15) {
> -				for (ooo_count; ooo_count >= 0; ooo_count--) {
> +				for (; ooo_count >= 0; ooo_count--) {
>  					nlh = nfq_build_verdict(buf, ooo_ids[ooo_count],
>  								opts.queue_num, opts.verdict);
>  					if (mnl_socket_sendto(nl, nlh, nlh->nlmsg_len) < 0) {
> -- 
> 2.53.0
> 

Reviewed-by: Hangbin Liu <liuhangbin@kylinos.cn>
