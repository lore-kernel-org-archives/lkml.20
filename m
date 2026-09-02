Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97E2C377A90;
	Wed,  2 Sep 2026 19:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788376676; cv=none; b=bo3TlpO5tGjBp5n3gtWlQ8uQJkIO+eYJkYYDb+kxCljzr7dGcNzCNoLiuOzUoN1Ok8TSz4uDwQ6blr0cH53o+xvZtpWavZKTbWpYS/giDu3ssz2jjykx4jxVHJKAEYAj7WbB+VrWz1sfFFi2oBiy4ImRUf4TApJ13Ark7jT3cZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788376676; c=relaxed/simple;
	bh=STI5DMs8yKGnyw2LbT6QgTYHq/2uSTnv2m6LE1E+4JM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F8Ery7M04EZINnpmW+Iez+StSf+4PDoGi0xXFDG6n+q+HdyNwe5ceWtM2UwBsda5bSfFS+hanKMwdOQ6TjmXubCf2o/aIbAKnDgazcvY4E5t9RlsVMulSHHTkSjPFvjF3DQu/WCtyBJXXmgevR1SUTUKglyChaghDn++0bTltUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=CAbBCr9Q; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="CAbBCr9Q"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=oEUafkQKvU1XKQMgGBfcN4kFq1gMxW+UrvINY8fy5TY=; b=CAbBCr9QIrDSgUH2QXNrNPjSEp
	Lw04WAqXSJ+QrXkLIwTm5M9JDsDffT0EJy4R/ZPSpeeXwqogKmnkcqddHX455G7o58QsaS7eprJHj
	/C0Ynzcx54sEGA/16r+s2dgF3MEzewLiOct3SPbaO/Y5V7DocIw8ERAnbG42jgB5ErAq31Y8P4CwA
	wwKlvZXIYNvWoiNsWXWEeDWMjvV0XtGjztaDmCGlKsEnNHpwOrthSHsAiqYesTGB7Q4bkg17Jskod
	QE5Ix32a6B+exwm9jhHo7L9W6j6+DvCgp72B+KiLVPnk099nZ12ILpwm+Jnj1hrbUHWB5xq3RoQyG
	BSFC8xwg==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1qT0-0000000Fg4A-15zX;
	Wed, 02 Sep 2026 19:17:50 +0000
Message-ID: <08a4a9b3-0271-4e92-9794-4579989e2426@infradead.org>
Date: Wed, 2 Sep 2026 12:17:49 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] Documentation: process: Clean up grammar, tone,
To: Nguyen Duc Thinh <ducthinh100812@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>
Cc: Weijie Yuan <wy@wyuan.org>, Shuah Khan <skhan@linuxfoundation.org>,
 workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260902084324.16498-1-ducthinh100812@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260902084324.16498-1-ducthinh100812@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/2/26 1:43 AM, Nguyen Duc Thinh wrote:
>   Also I want to know the current progress of the patch titled 
>   "Capitalize Git, Quilt, and Mercurial consistently".

"Applied, thanks."
https://lore.kernel.org/linux-doc/871pbege59.fsf@trenco.lwn.net/

It should be in the docs-next tree (although I haven't checked).

-- 
~Randy

