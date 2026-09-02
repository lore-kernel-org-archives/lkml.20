Received: from 013.lax.mailroute.net (013.lax.mailroute.net [199.89.1.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99F2143F8DF
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 22:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788388855; cv=none; b=VdU2iVM3VD6QupCprIy43Y59NY9X4YitQN9X8BBQ4XkOC+AAvZNxEHxX2EHPognyql546nudelkvYpLOOi4JlmMNIwtYQ3+h/2UnMNiwZxYLSqkTAwgzl16y8wXo0+Jy8PhwhK3Csr2mmU3mESp9hWUDBxHSLN61HMaYDY6lgGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788388855; c=relaxed/simple;
	bh=6/ApdvEo054oJD9zxvKZxfV67502RTI/kpp+dFUfCyM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RcwJauaCdojf0VzELSykAM3VN0nd7XaJPApYC1NPehl5t1xmHHtEQT4Do0OKmmR3KQ1TTZW3j4AZFpcx//wff54YPSA28k2Hcivl1Brxna6i/3jzmK3UkCKo5Ra46KDjZ86BcT/mf4TO/raUAyArD+iqCLpjWeelaHOm3nnG0j0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=KbSdRQQp; arc=none smtp.client-ip=199.89.1.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="KbSdRQQp"
Received: from localhost (localhost [127.0.0.1])
	by 013.lax.mailroute.net (Postfix) with ESMTP id 4hZyNv6NkLzlfvqJ;
	Wed,  2 Sep 2026 22:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1788388828; x=1790980829; bh=6/ApdvEo054oJD9zxvKZxfV6
	7502RTI/kpp+dFUfCyM=; b=KbSdRQQpwUpt9M978gjHJ1Px1c23kF/N7/110ClU
	W+Ptx2YC0mx8qIn3ZTDtnz/Oszdkm6zABO9IXdrCepv0axZ3dhg5QLrQ/EEEEkmH
	VT42pIv+1VtvLh3e2wa73vWVtM+11+xmGIDJppKH7owVbLeuXhNFV/3qX7SOYRY3
	P7wXXpglrGumlUirSnyub7fxjvGwoKttJ6+NCDy5z12Li/m0W5n+u+u0wFg0NfwK
	7mwKGYFg4Cp1WIcBUx1KWBsvMhE+PSp8W9xIQ9rbUiFYN7p0UM900cYSUZCheyn3
	mJa+xZ++UQdUW006uobCJW3VWKogP1eKweO2cN4z1DntXQ==
X-Virus-Scanned: by MailRoute
Received: from 013.lax.mailroute.net ([127.0.0.1])
 by localhost (013.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id L53rch36e4NT; Wed,  2 Sep 2026 22:40:28 +0000 (UTC)
Received: from [192.168.50.14] (c-73-231-117-72.hsd1.ca.comcast.net [73.231.117.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 013.lax.mailroute.net (Postfix) with ESMTPSA id 4hZyNn3CMLzlfvpK;
	Wed,  2 Sep 2026 22:40:25 +0000 (UTC)
Message-ID: <cac520d3-6d3e-4695-9d10-ebd14dc4e398@acm.org>
Date: Wed, 2 Sep 2026 15:40:24 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] tracing: Make is_signed_type() compatible with sparse
To: David Laight <david.laight.linux@gmail.com>,
 Steven Rostedt <rostedt@goodmis.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
 Chris Li <sparse@chrisli.org>
References: <bde573c1a758505339239f08be28788a34dfcb73.1786121949.git.bvanassche@acm.org>
 <20260831214437.15d6ad34@pumpkin>
 <a771af57-40ee-433a-be84-9b7c3e6965c5@acm.org>
 <20260901092043.7feaf5d7@pumpkin>
 <dca931ff-5995-444c-9f89-6d6cca4e71f3@acm.org>
 <20260901222909.05d6239f@pumpkin>
 <1b86ccbf-4e41-4a26-9d22-8bd93bacb043@acm.org>
 <CAHk-=wi_3xdtBrDgUxw5xtq8a=CdyRJnceo7YJg59wqqdXwiMQ@mail.gmail.com>
 <20260901192523.0e989b10@robin> <20260902092437.00dfaa25@pumpkin>
 <20260902093644.5b0e8a64@gandalf.local.home>
 <a5aea1c4-3e29-4bba-8cd2-d4ccbeda008c@acm.org>
 <20260902123933.5c3c8fa3@gandalf.local.home>
 <e75964e2-6b46-4594-8bfb-ce0c0ed620a7@acm.org>
 <20260902190632.16e9c66d@pumpkin>
 <20260902142107.511e71f3@gandalf.local.home>
 <20260902215019.5d0c930a@pumpkin>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20260902215019.5d0c930a@pumpkin>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/2/26 1:50 PM, David Laight wrote:
> It seems to be an attempt to generate strongly typed integers, but it doesn't
> stop you mixing up the values between the fields - there is only one kind
> of __bitwise.

That's wrong. Every __bitwise type is treated as a different type by
sparse. Otherwise e.g. __le32 and __be32 would be treated as the same
type by sparse.

$ git grep 'typedef.*__bitwise.*__[lb]e.*;' include
include/uapi/linux/types.h:typedef __u16 __bitwise __le16;
include/uapi/linux/types.h:typedef __u16 __bitwise __be16;
include/uapi/linux/types.h:typedef __u32 __bitwise __le32;
include/uapi/linux/types.h:typedef __u32 __bitwise __be32;
include/uapi/linux/types.h:typedef __u64 __bitwise __le64;
include/uapi/linux/types.h:typedef __u64 __bitwise __be64;

Bart.
