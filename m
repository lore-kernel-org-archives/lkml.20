Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=199.89.1.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794422497;
	b=KunCeMVkSY/j1BH2qAgtgPK+G8VNPBhP31KiV66VxLfk8SMUJ8k9hLV9DEGxGreV1jlN
	 H8oC0HWVRT3mM/TNOFVSaYGnEx/nYTPz55OpGMb/QS5y/JXF+Y6A7vAelm5ZkGD/LIWA0
	 5Cn4y/GnjNf+W0QGFXIFUmJvZ1JQ78uaqKiNk6EASWED5wVm7YWSJk5IrYCMBQVaImgCB
	 Fyqqvf+3wtMd1KLep7ewmidEUzy85xzaNOD3zrIcZwROMMrkazfpcdG444F39piH+jA90
	 HNEw12QZXYVXCRcPEXTTb6jmwvGDCZr1ClHHHM276WBgtXu9w+r7Xr3tEaeeiCPf0pw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794422497;
	h=DMARC-Filter:Received:DKIM-Signature:X-Virus-Scanned:Received:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=4vQQUxcjZs0smKgd3OB8eKFLrFg+xNCF+wFBGmZ10r4=;
	b=jcJVLdao3ofCh89j9J1roKvINWAaFE8AspRxuLJo4dKxRZczCtCGz2CuGOlFzesiNVQA
	 FvSv+buY6B0hm4GB9HgQFHLZhJOwvBYbA9HrCx/8AF7R+3V8uXJzNJDwvPFTvo0BdpuEk
	 3/9bAtFHHDXqbRRqV/CQvBSc8hNYvsnfLNz7fs00rRvPeIhixUl6PdA4i1pEa/mvNPWCf
	 Kgnuw3e6ND4geG64mB+Qs47Q5jIxM9wmZLQ1Aw5UZb5e6aHCEUeKyDYPBofGJgDXB9sy7
	 6Jw2ys89HPPpmgLHm8eEpaKYV41inbLrfTN0+1lDXOLPHZV40TFWn6BLtFBp1V2FzSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=acm.org;
	spf=pass smtp.mailfrom=acm.org;
	dkim=pass header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=3H1Hf07D;
	arc=none smtp.remote-ip=199.89.1.16
Received: from 013.lax.mailroute.net (013.lax.mailroute.net [199.89.1.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CDE2606A327
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 18:41:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2CDE2606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=3H1Hf07D
Received: from localhost (localhost [127.0.0.1])
	by 013.lax.mailroute.net (Postfix) with ESMTP id 4jPsmw4GC6zlkvPx;
	Wed, 11 Nov 2026 18:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1794422494; x=1797014495; bh=4vQQUxcjZs0smKgd3OB8eKFL
	rFg+xNCF+wFBGmZ10r4=; b=3H1Hf07DSIsFxGsrsn9NCznjRXHwzp1x8DcWF45v
	aj2i258ijRwLXms1seeDaZ7K+sDdIpYisdlHVkEPcbOJuhIcOudy0cptFzRZJI3S
	eu2fEKarjywNRSdtFm2nGjHO32kyvE5ejhhjJF3G1+Ag/2zgDwYIDxoz7yOxtHFI
	jbdKumye2rlUrvhRxdjm+paJUjXlnfGQxqgHjW5wbZru/iGOKKpH49D2/7l76MR9
	KCmgL//f18Hork6x9s63YD1aVW9UXS8E2a3Z0G76Gy6AtoLs47MvTO+BaX7vnqiy
	tl1rp2WPd4muyA/gXBlZX06cEyBU/trM9kRbJwyaq4/Uqw==
X-Virus-Scanned: by MailRoute
Received: from 013.lax.mailroute.net ([127.0.0.1])
 by localhost (013.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id bZBraRvhRedy; Wed, 11 Nov 2026 18:41:34 +0000 (UTC)
Received: from [100.80.231.125] (unknown [104.135.182.41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 013.lax.mailroute.net (Postfix) with ESMTPSA id 4jPsmt1n8szllB6M;
	Wed, 11 Nov 2026 18:41:34 +0000 (UTC)
Message-ID: <40be79da-af73-480e-b3e0-155173f3ad28@acm.org>
Date: Wed, 11 Nov 2026 10:41:33 -0800
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
Subject: Re: [PATCH 00/14] Stop lockdep_assert_held*() from assuming lock
 ownership
To: Marco Elver <elver@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Will Deacon <will@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Waiman Long <longman@redhat.com>, linux-kernel@vger.kernel.org,
 "Paul E . McKenney" <paulmck@kernel.org>
References: <cover.1793654853.git.bvanassche@acm.org>
 <avROwpyToVNLOolq@elver.google.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <avROwpyToVNLOolq@elver.google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/11/26 3:17 AM, Marco Elver wrote:
> I'm still not convinced by 8-14 esp. in light of my below Coccinelle
> experiment.

Hi Marco,

Thank you for having shared your Coccinelle script. I think the script
shows that the current implementation of lockdep_assert_held()
suppresses warnings about missing __must_hold() annotations. So I think
that your script confirms what I explained in the cover letter, namely
that lockdep_assert_held() should be split into two macros: one macro
that includes __assume_ctx_lock() and another macro that doesn't.

> The end state is still inconsistent: rwsem_assert_held*() and
> lockdep_assert_rq_held() still carry __assumes_ctx_lock(). Either
> "assert does not assume" is the rule or it is not.

That's the result of an oversight. I will add variants of
rwsem_assert_held*() that do not carry __assume_ctx_lock().

Thanks,

Bart.
