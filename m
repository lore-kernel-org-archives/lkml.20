Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.137.202.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793146076;
	b=150d24PotV6uUfWfIggWv5qHjuyw0TP8eKJG2yz3eCeK2ndb/0v6Wv7yTvRtYr+tQIEN
	 BC7A90Y/svPmu6Imqtda/7tQH0bVuG4kSDG9wRUIWg423p/uT7EET9FbzffVCK0hCnl6c
	 eIm3GdVk3MI5Rn1pnbF4us5gAtXzhoOTGU/4g4qFzpqN0hxwq7gBAJU7LqceXlkeiuyYW
	 XaHi670+Y+PGotXNcRgEHY2gXb/zJX5R9kvKNNoLsftOM7aCmrk/Sz1+lzRzmKbCYHFN0
	 h1U9XuG03N3H+xi/DLsyRrR3GD1PWtxnZYaPI9No01z5KxFtgDXnlK7kk2idd9VKAJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793146076;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=PLk05kPR2PRmYn3xeKT3xkxZQfsjpN0whWCs3j4fxuc=;
	b=O9H5LECcgjFjBbDI9iQ2cmfRWHM4/dcNnaWCnHOe88DJxrgYE2XrQs3lRGBUM/r+CaSP
	 FRXcE/L035uKSc/xmGhawQ3m1nqMwdAmkbF6tjUqYEWbTk7GxSnGRN6lDy7RHUyQWN/Fe
	 ioDGdCd1jnF7j1VNyl65y4/CxxaTzZE6oGYkyjk+BFLYFwi+KNwXUX48KeeUfbcVtCSkj
	 WO7o+i5WIWegDXIOH7iuJeanZIp7c9TQNWRwWc8ovYYL0o6CLZHKThVRDW+IKBis+Xrog
	 gYKpY2U7tDJoP9UG66t9r4Zh5TTRR22rVfHRU31YGi295UlRaAleeIzQOHTYf6Aww1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CZL+nF8V;
	arc=none smtp.remote-ip=198.137.202.133
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48D73606A31A;
	Wed, 28 Oct 2026 00:07:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48D73606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CZL+nF8V
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=PLk05kPR2PRmYn3xeKT3xkxZQfsjpN0whWCs3j4fxuc=; b=CZL+nF8V9ncFcHq2J1J1T2qXW5
	GYl1EAzCKDaxxHZ9bsz7wT6L8vcQxHecvwsqEr74XC0iq9z243k7P8pW43sFDCPvsT+yeJY12vs9+
	cpu992ZZhdb40PFA64Pv7f37yu+B8yB7W/Pz49w3oUqqBRAhF5oDfFkkJzkSCUcDnHJrXlMJrkONA
	vYoagTe7mHu7SXsLSoEP5s9DHlTonOMWwHwjxr2tjNCCV+fQhfE/bkXZcM1eorBN4EkADNQbJ9jVT
	vd3Bnh6OH41q6xh5KhquWe4FLWu3V+R6ykFdJLmA/g5Ah3Ix9LamIrOC9qG6ZvDeOReJ8W0XbDT6N
	B5hd3rUw==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLrCr-00000005yZX-42Be;
	Wed, 28 Oct 2026 00:07:54 +0000
Message-ID: <5a257e68-f1b9-4c50-919a-a85d0df8686c@infradead.org>
Date: Tue, 27 Oct 2026 17:07:53 -0700
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
Subject: Re: [PATCH 2/2] docs: Improve wording in Sphinx dependency checker
To: Dongliang Mu <dzm91@hust.edu.cn>, Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <cover.1793119566.git.dzm91@hust.edu.cn>
 <13b42c47a375e2ccc9f84412c10e7868f7ea7c4a.1793119566.git.dzm91@hust.edu.cn>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <13b42c47a375e2ccc9f84412c10e7868f7ea7c4a.1793119566.git.dzm91@hust.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 10/27/26 10:07 AM, Dongliang Mu wrote:
> @@ -784,10 +782,10 @@ class SphinxDependencyChecker(MissingCheckers):
>              if not self.distro_msg:
>                  self.distro_msg = \
>                      "Note: RHEL-based distros typically require extra repositories.\n" \
> -                    "For most, enabling epel and crb are enough:\n" \
> +                    "For most, enabling EPEL and CRB is enough:\n" \

I think that "are" is correct here since the subject is plural.

Otherwise this is a nice improvement. Thanks.

Acked-by: Randy Dunlap <rdunlap@infradead.org>

-- 
~Randy
