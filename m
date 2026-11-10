Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794302716;
	b=n/6U5nAl8F5wwLdMlJgqJYLDvan2Rvd7RDM9dxIu9iNs+FMLZFtH45mh5J93ZBe2v84E
	 8/fiYtiESWcJiVeYtZRFlAqTQXxIOnN1FuE4L4PG68OS5/I6BiTgKfJzdODC5d9kOQTK5
	 ZYW2aCyfeIuBTAVYJ796M9lJy16hB+Xqo1ShhycFpBuOfAxtufAjokf7163/HaI6CgpRQ
	 cZ0ktihcPYlfgaqCkx3r/UK9N3tDro48MVkmOaq7xzIyqUzlJRxe2UHangnB2Q3SGo+o3
	 Tn3yo+p3poD4GAeMjK6ku/kUCo5wrUOG4RlyCvrnHnrpuS7IHWxEdiRA2aUpt+wRV0Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794302716;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=YhvIJXuyquHMGSngmZ4O4PsxJ4Wvcj08h08CfdMbZgg=;
	b=Kem22eL5G1fQsyDlQ+aPt+wMZ2HEP7Buqmm7/ueN7d96b9ikm51qIwNhSbaIYeK6TR+Z
	 nj9RKAHgAChUwe+bQMPJCmX2iLx2YNlFBFtNbomQyHdjVKmaiVMIs2vRk800LFaXOiioa
	 3fhiGfKM5/vhaXxsEUIKlj2KkA5Q2z13NTLI21JVZ4jDKBGMn4dkzJc4wREwGy029Kvvv
	 zOFkx2W9cWdOxGKLmBeVq9G4+8DXefgMSYpV6pO/pUHwKh1wRjEy8DD31Kjljz+TMn6ZJ
	 5yqdBXi9VHBpUOWQYMTAbbWD/W6o6gBgaXg8zG4Ou3hwS2dJDapcY+8IE5e6U8uXxJw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=thegoodpenguin.co.uk;
	spf=pass smtp.mailfrom=thegoodpenguin.co.uk;
	dkim=pass header.d=thegoodpenguin-co-uk.20260707.gappssmtp.com header.i=@thegoodpenguin-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=n7slP0Ke;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.47
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F4206070FE5
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:25:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F4206070FE5
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=thegoodpenguin-co-uk.20260707.gappssmtp.com header.i=@thegoodpenguin-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=n7slP0Ke
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-91ea5600c9cso23186646d6.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 01:25:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794302715; cv=none;
        d=google.com; s=arc-20260327;
        b=srOoCRP8RrJl8hD4H6CHjbcjhDSxJbGe0oqqYLYRd6XHxeSW65IDt6h7DG8y3S0+yF
         kSog6dzMx5WAfWc052L9Ak4mIRgLgEQGqRI5+jdXtz6UN4PODyYwDFEDYu4R6R5UOMPQ
         SrlEXUVHfVBMZmvYBziJ0aRfoUVpfd+Zc7cfYL6g4KJq8U9HKhp8pXCNLIbA7CKBsfRm
         Ccd5vbL3hr0eN9mrfbiM3pH5W3xDjuQG6C680HfQdXXpZpta54h8HQV6aIOXIBjDzVbG
         b/eyeafcXT+yyVx1Rbv7yUOoSEEjdGQHkKQgLOMkVw94BdUGMu6G3Ml/QciEJzcTbxR+
         IY8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=YhvIJXuyquHMGSngmZ4O4PsxJ4Wvcj08h08CfdMbZgg=;
        fh=B8nng9SlSecuybeX+ALDDuKJobpztYzdk0noFF4NIdU=;
        b=fiBhKd3qOViSrf4FCGVnlqP91jqMUPSpFK1nNRY435phMOOdfiBkZ85Bo7qflZTHbc
         Ze5iR6Yc/iAFgTlhf8Th6S9AHan98PkpC3YO6ORRoGQlkqVcCpcPyHc5DHpNLe1GP0u2
         2bHDP8VI5MUP8DX7HYiaBszN8SnbS2YLnMKQaeXhQMQ4DF5BOjjFKdZGq2xNXojDqWT2
         2W/6DP/c+F8Id93COgIGS4rrn/04W7NF2gdSxDUczctf298YJK5UhJ0b1xvVusDiuiHK
         VX9XrvdVIu/VpyOzrbRcHJQ8xmtEicn2f97BTuFbnJysD+WgzAIBB/eM5t7wjlxfGlsL
         8H6w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20260707.gappssmtp.com; s=20260707; t=1794302715; x=1794907515; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YhvIJXuyquHMGSngmZ4O4PsxJ4Wvcj08h08CfdMbZgg=;
        b=n7slP0KenygAoCjVBvNuZsNg0b05HgsqPIttZGI+TGQZh2jwunKhFZgD1PTL4T9GpU
         DMlD+KGamGZIOrNvSvKQa8pguHk+4rAoEcTOEGUlvibglchaR8BpCVTlod3OK6eAhcVW
         TbvH3KxeqNjcckSp9lc1PyYn3/4Vvw16xFdv7YYtjtZz2bBpOqai6apx41ZchTcjJ6t8
         KrRSmhTb3GBQNdr8qMq0Psu3+oQqeC6n40apriiDxTibwQ3P1UQNp0XAXjHdjulwiseT
         5LaKKs2BhVCavBESP9OX9I46JxAD+eKBvozPYNZoo3Y2BjtR10zm5/UoX4CUVBJwaBqP
         miCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794302715; x=1794907515;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YhvIJXuyquHMGSngmZ4O4PsxJ4Wvcj08h08CfdMbZgg=;
        b=QGbtPtlsGCi3UkSFxnpYryZ6DA5wJY4mtAyAnHTJpqcNTosC8GMceQ8saX0KmP//nm
         mJjcUTv0Rp5uceFy7M/P3EOCo+aEGyN5QyK/DbSlJtYgewFC/0LeZE8FU2wVL+7+JFT9
         M9UDgxQ2MDICr4Jc3v6V/GZw57qqIdQZ5fSYc8eHQXzw4PJyyyveZfbMs+znG6WIEvUM
         dVot65KBhnL4mJ32iMPzPnO0E+P9qNFJ9hpVMSeSFL0TVEy1aocxU74fl4CZQHJd9Wkg
         ahQI1twWqn5SID8xapwTv17LslTgW6bd9jd3JWqO3qz7uZaocwOE0jCW5O1Uwdskn1H+
         2GRA==
X-Forwarded-Encrypted: i=1; AL+hErEVgn8HWc8kxCHYLejLSLYpGyeJRbcithO3hYfa4uPScLLzONYg0HZQei78ckVN7CBGLBiEywabVlubeoo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9MebHitk+lUP0tCIdDBXLwLww0ZCYbiHqSS6VSyDrp04zUY8vj
	/AZpWiUQIy7BBWRoPj/rPXiv5Q+Sn5z48ol5gyqnMT+dDn+ghRBgrz1KInXP8fxUBgxbr9EUEtJ
	HmWY65fHh/TjZ/JmqObtO87t7nF0G0gC73DAtO0cKYA==
X-Gm-Gg: AYBFou3gt3LUUBpGBvDMxU9Qz5K6M+zNMu+F/EeergGtfFKpcI1xVQq9NAGBwnwtLm9
	df7NZPYA4haev/wjCAD4M2xoKq387LHdEMTmbgzw32QColns/3GiKS5oEJxVARzqV3BXS6kK4Bh
	zots7fQay1wycbQEZ3q3KJgXlL4zWBoqPR68zc6fgXFoER+Fw3f1Xs1c00AZU9AAiHE0K80ssI1
	61M6GXs1+ZQ/HLEShhfft6iSyIRcxSA6k2XCFkVkAiozdil4I2t53lkc+1FooqL3IIoZu0xBRQ0
	U5azbN5Ti7JAaaPuaXlARY+L51TlolZQfxX2eROXe6Jsf6VlmUUHusMOY8sLpwtLIb6uNFWjDZ+
	01T4W3hlT3DSPcUK1KI/V7Tv1J+NwzvNtKFhcSFJ8P9KVf9L3MpTXDmdZS0qayXuGkvBT9I2k
X-Received: by 2002:ad4:5aed:0:b0:91e:7939:dda5 with SMTP id
 6a1803df08f44-91ef04aae41mr26184836d6.23.1794302714950; Tue, 10 Nov 2026
 01:25:14 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106-acpi-mmc-v1-1-00934babd69e@thegoodpenguin.co.uk> <2ba59618-e537-4593-a840-744b2f26eb4b@intel.com>
In-Reply-To: <2ba59618-e537-4593-a840-744b2f26eb4b@intel.com>
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Tue, 10 Nov 2026 09:25:04 +0000
X-Gm-Features: AclHuK_6-XdyXM_BOekPeBuf7gmeMV5bzRDqK9Cg_lReAyOew94cN51o5FgzEf0
Message-ID: <CAA6zWZL1bSYNkOsRpANDwHSAK+Cp8GvbXnNHiP9fecA3ZP+Ctg@mail.gmail.com>
Subject: Re: [PATCH] mmc: sdhci: Use named initializers for acpi_device_id
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Hu Ziji <huziji@marvell.com>, 
	linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

> Why is there a different explanation above the "---" than below "---" ?
 b4 will put the cover letter in the dropped section of a single patch
series, for more information please see [1]. There is no requirement
for them to be equal. The answer to your question is in the cover
letter itself: first series is a refactor pass to allow for the future
intended change in the acpi_device_id struct to go ahead without
triggering build errors. Describing future events in a git message
makes no sense to me.

> > Unify the list terminator to have a single space between the brackets and
> > no trailing comma.
>
> Why?
This seems to be explained in the paragraph above in the commit
message? I can repeat myself if it's not obvious.

[1] https://b4.docs.kernel.org/en/latest/contributor/prep.html#what-if-the-series-only-has-a-single-patch
