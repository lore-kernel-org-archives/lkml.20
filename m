Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 153EE49E12F
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 16:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791216048; cv=none; b=IfECb2FH63F+3f3xvr3GXkLrjFAFSRZ45bSbPDv0sa7pnqrmoKLFsAahbwLFs85A1WJhfAV+dIMooWbTKUaUgEjRTt960g3zreUXeM93lXT0gv47VtIuFq1piS64oqQQN+n/5LDz/lJ+wXkNA5i6BbYUXfae+e5cZrX8+wYJTXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791216048; c=relaxed/simple;
	bh=vDhcoDs+++6jTpDcE7yfejhS5W0hL1Wy+TM5R2LXN90=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EzA5vUI4BWfkj2wAgOCosoratG3ud2y6HxWAbKvCsYwpOHPmDmk71dUkLtnVsQBuP1bDxbaQJfnueCcsL3Wj1vKP0Oh5qF6SWGKBcyUwrk162blBXArcgUUBkO9RwnyH0iQ0ZBTsq+0aIkYoXK1QnCWTpdutghZzwjgCeSgOrts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=eEfYpAvr; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="eEfYpAvr"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-351224e684dso2435800eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 09:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1791216045; x=1791820845; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=blKtgKABl6ZvuHILCmQEnw5uMNFlpnL4aOfuP1Zm1FA=;
        b=eEfYpAvrFe5q7W4/WjtPBP5qpKqNCdG7EOoiYpWfudbTXKNk7TG+6Mehs9K6CGL9b7
         weg9ObWIbWRSTfSdrBBe59zVKdDII8qCZhm12HigXbR6sBF3nWMPOphFP0b52dXMejN/
         f1xzv61undV3xeIbq0xeWKFbqxlZDxC2iYZA3wIVuL/vjCD/ntJTkoBD1qLC6cR+5/ia
         BBfBjjqMbNXErnARyAGjcTRvzoy5UNt8X956QQU0s1vg3nTeu61XJneAE4EI7xjHR1Eq
         8x78gT+rlhGB6aqgB2LnnKbD2jzEbfH1S7rGcZzlVhrZiFBiXN2P7R73mvsB2Cs5CozK
         0YSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791216045; x=1791820845;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=blKtgKABl6ZvuHILCmQEnw5uMNFlpnL4aOfuP1Zm1FA=;
        b=EHF+M4htclW+me0T6/GHHy/l8lSxhp6W4iXfqJUdxqdczA5u5Ub0TxQeeFQF4Y6omg
         vfnXb1Dh3pcUQWdsNf3selanlGy6j1ZRJiXw8b0XogkCRQZNGvNsMT5gGPJInr79zVvG
         DdADARe+4iEfuIL4xuZqXQUQEpQbr8J43yRs4vYFki0R+kFi0Ey72nnOvTIscnv/qz9D
         mrJog9yrkPmzDOry8VLpTG3QupFTRxUv9Uim70ON1Q+WXmjDZRw2otHDRed+ZYMaoFm/
         Ejzk6gHMDs3CWcv63GUn8hq+jTgCRpg4zihsUaRnNGyzdHdLX92vb0Cg4nOA/aGDGYuE
         SPbw==
X-Forwarded-Encrypted: i=1; AKwUvBxrtwcbZfk6TDkONTA6dK5dTQefRX1Qiw1jR44Y8DQIncbyj/85TWQFGqeiemDTJ6IU5w8qqFiN/sSZXJU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJjA5HfERLlWNIjwX+YvjL5jlCxlSmBv1/tuVuNmwVKp+lPHfl2
	gW+QqUYrgETb3EmMg82YIUVoQ6r6pGiDejmRK4jsQ9zTsXocSxxSqMp1Std7n4ZDOHhOeaPaqYJ
	DKKhYH+E=
X-Gm-Gg: AYBFou1zMiVQFiRsYZR8UmxVuU/rSpt8TffPm2ifjiTvqHgMEPcZM/kBc+KBAc4wKYJ
	nDdgRVX1vU5yl+2vCvyR7TyhrvbQwkKp7bgCkzAeu26xll1ro9YmpnL6Udg63CbP4E9Wu0kDEhl
	cCPSX/T7QRpcwtgLMmHNjbZBP54wkGQ5s7GMIF+VkDg+AtNI9lpBT5teSwyVLwdqPvNDWr+ynsf
	jjFDLHo9/CgiPSoMnI9qpApIVlEOWc3RFgP35yyS1VJOzgDnK1nrp79qGKPrdjsvZG6cD1dHnub
	+egneHqb4rIX4jG3aXApmW4ssZ4LLXHfX/CJbl1EPgMj7ub2++eof6Zyb2WbhkbvzdEoz79Vetf
	ZqKz39Iu/711TjTRnEc90SHxRPQeHTWL7e/7zImJn4cYeOwb1zSGCJ8fOG4sUoh951gP4cn7pOa
	lKwMDj4EkCZP4wsc/MLOWnZFJ6o5RyWgVdcNmlS2hQ7fvyrmMNEfGoKcGdSw8fiF17wbNlgI96b
	lAHrGqqqp/poauMnc6aRHk0KuvpcqxG7/cYem4oXbYibzVfQvggaQ72rQ==
X-Received: by 2002:a05:693c:41ca:b0:351:2cd6:5857 with SMTP id 5a478bee46e88-3512cd6593cmr4959516eec.27.1791216044630;
        Mon, 05 Oct 2026 09:00:44 -0700 (PDT)
Received: from [192.168.1.106] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3513aacb39esm6290694eec.14.2026.10.05.09.00.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2026 09:00:43 -0700 (PDT)
Message-ID: <c2f6dc35-2f75-4c54-9265-8a18baec9f4b@kernel.dk>
Date: Mon, 5 Oct 2026 10:00:43 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL] Floppy fixes for 7.4
To: efremov@linux.com
Cc: Karl Mehltretter <kmehltretter@gmail.com>, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <348194a3-e542-45df-8be9-eaed588c07a7@linux.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <348194a3-e542-45df-8be9-eaed588c07a7@linux.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/5/26 9:21 AM, Denis Efremov (Oracle) wrote:
> Hi Jens,
> 
> Floppy fixes for the 7.4 merge window, based on your for-7.4/block
> branch.
> 
> Please pull

Pulled, thanks.

-- 
Jens Axboe

