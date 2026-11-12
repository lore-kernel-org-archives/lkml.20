Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.79.88.28
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794494207;
	b=eSSQoYB+OZJQqDTTxpspLrl12g/sq9+zRe/PsUK9tOmikhx7kFPttOOTn09GdHJUaIPa
	 ePR8xq/hZfa9yOS59wlHzEodd5MMbOdW7HNAB7WSSSO118CT3uDQA8NfXNF7b5OhdVlOd
	 QDKxdzcgv1wlvUnVgc7Zghl7Jr8Gl8dsG6egJreAo8X/hHD3tHaNj4MEGKIAnd8daq0YR
	 5J/w4+u45Qy6U68yv9+y1kcN2fkTv0l9yoksy5XV11aMi5Yc7WhChQOar3+vmt6ztty85
	 +BBSaHf24Lc7WGqiKSyazajVRvpxEGpg01PYl29kAIwi0wh1oO4IcTDrSyzoq4YTUGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794494207;
	h=DMARC-Filter:DKIM-Filter:DKIM-Signature:Received:From:To:Cc:Subject:
	 In-Reply-To:References:Date:Message-ID:MIME-Version:Content-Type;
	bh=qURwc0r5NDQy2lLQayYqs3VpyJ0zWpWXT5E/+vERTKk=;
	b=CRCIzoRMPNFX6nu74A6YYIW25giMSUQIUOA8r95zu0/mnQD6IrMcINv6C7r/FTu0rVNs
	 UALbfw0H2UTfC6oBHOLuKGh9SBQdm/1ECz4dK8u7KRyE6e6kQJA33MHW0JA98xz+1iU60
	 dpqiXVhQJU+T494gx59s0juqrfJiQe6gkRlX28aLwF55LLVfk8RdrV4Ub6PWVv7wZTud6
	 dyuiVsno7NBI7qPni2ED4coybVJ4bCa6/mVO4RqiI3GJ/gQLgcFEPLPv2jZASrJyIfDbA
	 8LvakLX/jg5++L/l5URAJot6uZh/angqSwMOoTYz/oE8eKwcNxWzK4/3PwZ/ltKp7rA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lwn.net;
	spf=pass smtp.mailfrom=lwn.net;
	dkim=pass header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=Z9UdqpgW;
	arc=none smtp.remote-ip=45.79.88.28
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AB44606B2C4;
	Thu, 12 Nov 2026 14:36:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2AB44606B2C4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=Z9UdqpgW
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 96A3840B2D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1794494206; bh=qURwc0r5NDQy2lLQayYqs3VpyJ0zWpWXT5E/+vERTKk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Z9UdqpgWeasiVqxwiL/COQngMLbEZSpE4AYSA6I+ApIp3l9jiNkTVjAbjqwg8JVtZ
	 IBeT4m1lmC4XqpmoDDCR8rdofoOeuvpraHPoSLO+rc9Hc0MuX6iRi22APJqUslPBlR
	 hUvKIeSNKSsoE9maKH2Pf3bqtaJqBEWVZqtOCJVBGPLz1b/XI+f0mjwukPHyuyTRy8
	 B3A/SL8DSECIzLDWRwrq+d4m8SZ1lDlqBseeDt5wkRdfwkWiE8YALbppG0O50sF5LQ
	 QqzWIkUWjmMurzl5FX7jg04pFyeZsHGxXErAiuRWdanNadapnQKso9eO59+CEbfXpj
	 M6nK/QXkSH90A==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 96A3840B2D;
	Thu, 12 Nov 2026 14:36:45 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Antonio Borneo <antonio.borneo@foss.st.com>, Shuah Khan
 <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>
Cc: Antonio Borneo <antonio.borneo@foss.st.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Vegard Nossum <vegard.nossum@oracle.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH] Documentation: .gitignore: exclude .renames.txt
In-Reply-To: <20261105104132.566314-1-antonio.borneo@foss.st.com>
References: <20261105104132.566314-1-antonio.borneo@foss.st.com>
Date: Thu, 12 Nov 2026 07:36:42 -0700
Message-ID: <87h5hm6rr9.fsf@trenco.lwn.net>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

Antonio Borneo <antonio.borneo@foss.st.com> writes:

> W=1 builds reported warnings regarding files being ignored:
> 	Documentation/.renames.txt: warning: ignored by one of the .gitignore files
>
> Exclude the file in .gitignore
>
> Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
> ---
>  Documentation/.gitignore | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/.gitignore b/Documentation/.gitignore
> index d6dc7c9b8e250..9c7247f9449b4 100644
> --- a/Documentation/.gitignore
> +++ b/Documentation/.gitignore
> @@ -1,3 +1,4 @@
>  # SPDX-License-Identifier: GPL-2.0-only
> +!.renames.txt
>  output
>  *.pyc

Applied, thanks.

jon
