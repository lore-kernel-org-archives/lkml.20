Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18CE04EC65D;
	Thu,  3 Sep 2026 16:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788454771; cv=none; b=QvGgZx8r3Oj7fHNw82XO2h1pQ16eWSQvCsyYThJZOrlYbdZzgQzDTcLKVxtWVk5njEGTyp+Ucdhx3VQ+mxClFxRi0rdNeqvl+ePoU8GRjtxmccAovvj6hOLCE+bfqOvVtv7VeDicq3aIi9L0Tfe05IW08//elKHnB/aNwQZHreg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788454771; c=relaxed/simple;
	bh=O50mrSVf5iAIB8Z8eJcUxdSrf0SK2gJLESjccT7cMI0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NkSylVIzJbeT3AvCc/t9Dc3C46yho2O8fYWCLuQw5U30LDvt1/S5UKEYPZlAHSv9/cja/KTT/qXqvcn6yXOlrg5V7vP8dweEGFQhwBCK5ojXN+o2YqfzORa8fwXD7KzqZCyvfcbpg5UFDsPUpPd2dzeO4/zlcpJ/iR0ZRjxSPrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=dV4/9xpH; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="dV4/9xpH"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=FHumsZe/TLfM6E9mCneacEvgx4uAjq4Ry0vzjCbb4CM=; b=dV4/9xpHdvNgcJ5uFxqcGrjAvp
	Ozut5sWcgQQNNdQSsGRM05u46vfMwDFJx0drfPymhlYgWEpuHCIDQpQjSGOYauhv49c8G4GWkqZ17
	Vvqxa3BIpOrOh2jminfikf6uAqQseJjO/Ac6QTjk1VHkMuKt6Alxwn9Eplit9G/Cj/lwy0yxbKwtT
	Pgnw2Kl4dZC9YNLJz2MQnhKX6y1zuEVMvQInY8KzR55HuHUN5zd+02q2gcSMf3OCYAKM5Oj2T7qxJ
	asTl79kgxm1KMksZKri4jL/2/IbzadL25/qj9XwMfJjTHHNq1/6xAo2XQ54uLH9vF7kJ7uMIJ5gJy
	W/KCQK7w==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Amd-00000000ELt-31bz;
	Thu, 03 Sep 2026 16:59:27 +0000
Message-ID: <4c379bf7-e518-4a06-8b12-134f39a45785@infradead.org>
Date: Thu, 3 Sep 2026 09:59:21 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] docs: verify/bisect: fix typos, formating and
 punctuation
To: Manuel Ebner <manuelebnerli@mailbox.org>,
 Thorsten Leemhuis <linux@leemhuis.info>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260903154336.732305-3-manuelebnerli@mailbox.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260903154336.732305-3-manuelebnerli@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Manual,

On 9/3/26 8:43 AM, Manuel Ebner wrote:
> Improve readability.
> 
> Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>
> Reviewed-by: Randy Dunlap <rdunlap@infradead.org>

It looks like you might be misusing the Reviewed-by: tag here.
My only reply (to v1 of this patch) was:
  https://lore.kernel.org/linux-doc/0475c09c-e165-41a5-b654-5c6aefeaab0b@infradead.org/

and in that email I did not write "Reviewed-by: /me".
Just because I commented on it does not mean that it merits
a Reviewed-by: tag.
I.e., a Reviewed-by: tag must be explicitly written by the reviewer
for it to be included in a patch.

Please see Documentation/process/submitting-patches.rst for more info,
or ask if you still have questions.

> ---
> 
> [v3]
>  + incorporate Thorsten's suggestions
> 
> [v2]
>  https://lore.kernel.org/all/20260902115121.687986-2-manuelebnerli@mailbox.org/
>  + one more 'your' -> 'you'
>  + 'it'
>  + incorporate Randy's suggestions
>     https://lore.kernel.org/all/0475c09c-e165-41a5-b654-5c6aefeaab0b@infradead.org/
>  + Reviewed-by: Randy Dunlap
> 
> [v1]
>  https://lore.kernel.org/all/20260829055501.581856-2-manuelebnerli@mailbox.org/
> 
> ---
>  .../verify-bugs-and-bisect-regressions.rst    | 26 +++++++++----------
>  1 file changed, 13 insertions(+), 13 deletions(-)

thanks.
-- 
~Randy

