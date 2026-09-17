Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B688A48CD55;
	Thu, 17 Sep 2026 12:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789649661; cv=none; b=slbncspsTBAJGdvkvwRcZJaAhoC87vsmiwYS/dD9YKnVz8fgAIUcOKiG8dmxcQouPEpBYHg0h7hl/h+HQsxweU+5bi5DnCZKWrnrRewL6ysmO1TZYzEl6d6M6S0q2wVvlWfK/yUmw9yDQ4q5GxkgKt6x06J0FO66Tg3q8igZCM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789649661; c=relaxed/simple;
	bh=0YSLZg9ZR1uo5wZPmDElNCotjkNw18yRyeIozh0X4Rc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U8LaJSE9m+lMFvwfGjNYRfOBTLebMAXwvBPlbe9nY996hTFZ/5q4sAbV2jkWwuHaQyw9S1TUx4cR62uQ33BuxAfPMwm/Sd8Q/ken9W0aellib2aN2SKIpTpeM9m1nQIuP4xzx3FI5rRzCoR1U+6il0Y9LIYpegIet5wSNenvEE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=oYezSXQJ; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="oYezSXQJ"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A19A2143D;
	Thu, 17 Sep 2026 05:54:01 -0700 (PDT)
Received: from [10.2.200.62] (unknown [10.2.200.62])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 303863F882;
	Thu, 17 Sep 2026 05:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789649645; bh=0YSLZg9ZR1uo5wZPmDElNCotjkNw18yRyeIozh0X4Rc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=oYezSXQJwU62L51jPzZzBf23WzwJ5FLTnA6/IlLI7GBSFSW0ko91Z+SNUhE6j4oxa
	 q8VKpDdLZe773ZDWtCVnPUoFTSnqCpbjoopodjSlPtO9A+tV5lAJJ4j+LW/W0BdV5D
	 6tyXKXFBm25EOjWhPYHe5MMu+sIYJA6Q6lyqHvt4=
Message-ID: <b7718435-5b48-4598-9462-cb0d9e013881@arm.com>
Date: Thu, 17 Sep 2026 13:54:02 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: mali-c55: add padding to mali_c55_params_ccm
 structure
To: Arnd Bergmann <arnd@arndb.de>, Arnd Bergmann <arnd@kernel.org>,
 Daniel Scally <dan.scally@ideasonboard.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Hans Verkuil <hverkuil+cisco@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260915202458.3673504-1-arnd@kernel.org>
 <335cf0a8-4c0e-4c07-8d81-c076ac73d329@arm.com>
 <3052a817-3188-47b2-a95d-ec26aaa0d24d@app.fastmail.com>
Content-Language: en-US
From: Vincenzo Frascino <vincenzo.frascino@arm.com>
In-Reply-To: <3052a817-3188-47b2-a95d-ec26aaa0d24d@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 16/09/2026 19:55, Arnd Bergmann wrote:
> It depends on how the structure is initialized. Depending on the compiler
> version and optimization level, a local variable declared as
> 
>    struct mali_c55_params_ccm v = {};
> 
> may end up with uninitialized stack data in unnamed padding, but if you
> do a memset(), that should always be safe. If the fields are set individually,
> then you also have to set the __pad field, but that's not how you do it here.

Fine by me. With this:

Reviewed-by: Vincenzo Frascino <vincenzo.frascino@arm.com>

-- 
Regards,
Vincenzo

