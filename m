Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.136
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792725333;
	b=YUbL+fP0GUBqA4SylKjbzLbWWa7o4oN26sr/xIhpaSEk0Z66qpB5f6ppSrpVEKhT5UiQ
	 vVHg0aSrEO+Zf0aDdVQQlfp2kWIheZKUw2rLLNnLAjdqHpksaxndEhY4SbaLApJSN21xU
	 ohRgW0gXBHxGXiiYJ+y8qfU4Snt+ExYYvNr9dP5BS1HgeWnrjd2c2Sc6D4yB40a9QYT49
	 BRUvQSe1QMa+W98b9xLZSfC0c4XZxDNJDHZ698kNfXsaSsKc9nt16UsvPiDzasDJ4cP2e
	 ZRks6K+U00CX2iBuo/grlZmNPmIgICX/r7gcCkn8El2rggEsNv+tvaT8LEqjtgxqREQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792725333;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=zVAKIg7XqiPBVNuocH1Hoh+zfouG9OOWB6QRApYQMW8=;
	b=DvzFufjPRD2aikfPhebgv5jpLX2wdvye8IFO5o1EG7wcJuutR3QTCbrzkAdWvbDzMLAa
	 q/rjkprvqd2RIGZwHHulXu1hixjOJWrmEFoYK8nbl7wahtv1mWmAfMVrmM5E10QV2+XYn
	 ltm1iynjfqFSfIjhHzPpLAdbm1uwifbNJpdIECGcuKJ7/s+BCSbyvvZbarAQ/v1dGPIm7
	 ibTOg6DC0ssx8TsFNl36J+G0d5ElYJxeGk+XPZ34QdfYraTc6ZDkM/2YcDCUpqmBD5xlq
	 h1WM37f6m96aKpZiV0LJaVL5CJwk2mB7Y62dFVuGFqo/A9E5UkE7wNe9NWqfHI9Sz8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=R2NEnJGS;
	arc=none smtp.remote-ip=91.218.175.136
Received: from mta0.migadu.com (out-136.mta0.migadu.com [91.218.175.136])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE99D606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 03:15:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE99D606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=R2NEnJGS
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=/Zq1baKOLuThcBsVDU3+UzpzigXWioU0C5AmZNp+Tio=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792725331; v=1; x=1793330131;
 b=R2NEnJGShOdOls3InG6FOO0Dcu2OlU3tWm1gORf70l/vvdNfiOpR5So+V/QCQof31KmGXHH9
 BYL9aDOjnGE7mwQM+mh1r45jwmtu1YjbznMnHJiJKan5YJrt/PnKFMovQy827lC3koLFhbg9S7H
 M5ZEzOr6OHhdZNg5q0LOBwGo=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 2050942c7c50d671;
	Fri, 23 Oct 2026 03:15:26 +0000
X-Mizu-Trace-ID: 2050942c7c50d671
X-Migadu-Flow: FLOW_OUT
Date: Fri, 23 Oct 2026 11:15:15 +0800
From: Hangbin Liu <hangbin.liu@linux.dev>
To: Xia Yan <yana06070@163.com>
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@kernel.org, horms@kernel.org, kuba@kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	pabeni@redhat.com, shuah@kernel.org
Subject: Re: [PATCH net v3 2/2] selftests: net: check veth carrier after
 changing channel counts
Message-ID: <atrRQzn2prYbF1vF@fedora>
References: <20261022085842.2527-1-yana06070@163.com>
 <20261022085842.2527-2-yana06070@163.com>
 <atq8yKbnqtLBVucH@fedora>
 <20261023023350.7225-1-yana06070@163.com>
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
In-Reply-To: <20261023023350.7225-1-yana06070@163.com>

On Fri, Oct 23, 2026 at 10:33:50AM +0800, Xia Yan wrote:
> Hi Hangbin,
> 
> Thanks for reproducing the issue and reviewing the driver fix.
> 
> > Why do you do gro setting in rx/tx set ups?
> 
> I included GRO off/on to cover both queue reconfiguration paths.
> No XDP program is attached in these cases. With GRO on,
> veth_enable_range_safe() and veth_disable_range_safe() set up or tear
> down per-RX-queue NAPI instances as the RX queue count changes. With
> GRO off, those helpers do not need to reconfigure NAPI.
> 
> The carrier bug reproduces in both configurations, so the test checks
> the same carrier state with and without the NAPI resource changes.

I mean this doesn't seem related to the carrier on/off (LOWER_UP) issue.
Or did I miss something?

Thanks
Hangbin
