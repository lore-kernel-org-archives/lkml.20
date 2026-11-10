Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794287831;
	b=nRltuWLugEMMsh3wmafVkojZAuo2jT+ptjiqnEsLzfu0sfajn840iEwoqbr21ImJxm5O
	 li3/0qEL8OPS+8RhhoBoe2dUL77ZuzIAIxUUGK+DCBFaHuC/N5Z8KRVZEuL1w5OtY4Gg/
	 pHtt9fdjRJdKXOBpBQpvHg+cJEjjBA7Yz+Z162Wf7NwT7zNTjWNceXRDysQLzypm7om2A
	 Uk2BfNEZ3qpfTog3T+4ldvXElGIrJCDOXY9iIxazDYlYZtuKu1AvdWxc//84iswDuSnqk
	 maQLU59ggingMIlGyDE+9eypLB66N6KipL6NNE6SZWTkroP10fL49Q7XRZex0nFUv2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794287831;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-Id:
	 In-Reply-To:References:X-Mailer:Mime-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=hJUKVOXw+rsYg0Fl10Dji6GuiYtz/4hFo7JB2GRgOYo=;
	b=vAFpL/q61cPiWr7rDWdFFZDf+q9KJ3i52M75JmBAiSP1U2G6rDgQKCt3t/gksB9gT66f
	 BLDW89bF8buGdS4CyX8qiBhBz96IH/zaLrQzR0rKwcqpuG0/lYwDIgwa+znNTCY2/BU/F
	 m9SRW8oP9QkiKX3BxFilaaQ9L/5N9ZBW/nAxKrt8YfJ/x/b1/G8J2H5f1vtGykCOWbfm9
	 BvfCWv82wxIlAWFF4/aWKnjNaTjiH7uH/+kC7g/pURgLaK8nGR2xoPwGO/QoqKo7fOsJA
	 JUEb3A6JlWzVku4j5PJH4b3VNdsBYvZ996+5D1GTSckVMWhLjl8tGBGW8+pwMfQerFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b="OHmvt/Dt";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07275606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 05:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=OHmvt/Dt
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 019051F0089F;
	Tue, 10 Nov 2026 05:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1794287830;
	bh=hJUKVOXw+rsYg0Fl10Dji6GuiYtz/4hFo7JB2GRgOYo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=OHmvt/DtePgbTU+VOoheC8pijLTPtihzRe2VU2S7xY68oADyVHeSJ0+6zjB5vuhRk
	 gNZrALJn6f8nyM+4RwDQMibH4qvZC+jQE3kTRXpnJp/0QbRtOA1peLP4M+RTC+Fa6U
	 RYRAVYwpzMaR/9fTcpx2vv43kiBRNr+TOvtpCh6A=
Date: Mon, 9 Nov 2026 21:17:09 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Weilin Tong <tongweilin@linux.alibaba.com>
Cc: catalin.marinas@arm.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] mm: kmemleak: avoid long RCU read-side sections in
 reports
Message-Id: <20261109211709.133122f9f10091f06c4acbc1@linux-foundation.org>
In-Reply-To: <cover.1793871596.git.tongweilin@linux.alibaba.com>
References: <cover.1793871596.git.tongweilin@linux.alibaba.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu,  5 Nov 2026 17:52:48 +0800 Weilin Tong <tongweilin@linux.alibaba.com> wrote:

> Reading a kmemleak report can traverse all tracked objects in one
> RCU read-side section and cause a stall.
> 
> Serialize disable-time cleanup with clear operations and report readers,
> then use kmemleak_cond_resched() in both report traversal loops to let RCU
> progress safely during long reads.

Thanks.  Has this been demonstrated?  Are there real-world reports?  Or
is this a theoretical thing from (LLM assisted) code inspection? 
Please do share such details, they matter.

In [2/2], *pos does not advance while kmemleak_seq_next() skips objects
whose get_object() fails.  If *pos isn't aligned to the 256 boundary
and preemption clears need_resched(), a long deleted chain gets no
periodic RCU break.  Seems the code could tighten and simplify the "once
per 256 operations" logic?

