Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794680895;
	b=MtMbfswM2sYJG5l1UoeDeSoDegC8UCHik2xIj9QnNmekFQgUZRvv2L3ubNq0Z0ybaNYq
	 Vze+TrBnb4HzTtuFIOL4EAVw2zAfzG2YPszwEXpVuEX1i0HHbGIo0p3Rgqb7/MmOf79EQ
	 SE2W8GHpZk27xVS5BshvPB+ShMB1jzzN8/0mAndV18PdbfX7evgl9/gvN+fEvDoZvp/Hn
	 zDOBl8OonOQksNn0zZRoqSVgdD6PhH+vtyeLaGVniwayt25O60LGChfUGPyTph+kFO8Fr
	 iFlXgBOu3SrxNmQzQaQ8DmjOehKuNFvd46OmUwCtfRZFDczwj09G4TugbOJyTqFVBOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794680895;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:Content-Language:To:Cc:References:From:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=ZPM7LSuUdUsPRlAIgR7H8n7d58mkP++poo3voahNsfM=;
	b=l2SDnFYASeKr5E5v8VtApR0OliVEJHYB9qJuNBS6Bl3S8cZ2jDcScbTXekTGXLn9dluy
	 DpiigvZJH9zaIjwa/wuqNSB+0UiEEsumokmVNH411Tnhg9E7qwKCZTZAiVafKNFtrjGYe
	 ILvYSPDKt/PBnlthAhi//lG0hEooEQtC76/PDtAPe9cnz5u7IptXjkxDVcslNUikhl8Lm
	 O4w6a0pwOTNAO0C58VyxNkSRZQL+Svd75uNZYIM7il5ho6AizRjHaddchvJKTqYN3vKlk
	 DqmUdTUjkkxkC7Z0RgSEmLzW5aRhALk5EszcHe+Bo3jvFWR44QpsXE4t6EjyEDs7v5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KUbW9nR7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0046A606A332;
	Sat, 14 Nov 2026 18:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KUbW9nR7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3F141F000C4;
	Sat, 14 Nov 2026 18:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794680894;
	bh=ZPM7LSuUdUsPRlAIgR7H8n7d58mkP++poo3voahNsfM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=KUbW9nR7l7zAnFZbIS2C4V9NO4ZovCi4lBv8JDK0p7II1MoocNhkjA/Pkr+y/fr3U
	 OYFLC0bwE7Z9u1aPJvHlkWXUdSWQ/+a1C7wnt0XCBLzAWyJ4JiSjtBG962fZKHwvG2
	 YG0gro6/4bFz8NP4nl6rxN/naBWPX98P+Oib5ukEnStibGrp6KoLc4Sj+VcdzyEevZ
	 Zj1Lht+CatA2VC0W/RtetdnjWQ/N2MpZyXy1zmkznq3LPz+h/kaYTuzsZnVJhpsZAY
	 pff42ai6bx6jZPWbN8Utu2akxY8np9saWQoeSQsFifobRgzniZDEkYIf4m6x12ZddA
	 E7kXxa9hU9IUg==
Message-ID: <37d65eb3-f4b1-4e45-87c5-5378d5355541@kernel.org>
Date: Sat, 14 Nov 2026 19:28:10 +0100
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
Subject: Re: [PATCH] kernel-docs: Update book info
Content-Language: en-US
To: Manuel Ebner <manuelebnerli@mailbox.org>,
 Carlos Bilbao <carlos.bilbao@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Lorenzo Stoakes <ljs@kernel.org>
References: <20261114124813.1056807-3-manuelebnerli@mailbox.org>
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Autocrypt: addr=vbabka@kernel.org; keydata=
 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
In-Reply-To: <20261114124813.1056807-3-manuelebnerli@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

replace Lorenzo's address with a working one...

On 11/14/26 13:48, Manuel Ebner wrote:
> Update info about Lorenzo's 'The Linux Memory Manager'. The source is:
> https://nostarch.com/linux-memory-manager
> 
> CC: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>
> ---
>  Documentation/process/kernel-docs.rst | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/process/kernel-docs.rst b/Documentation/process/kernel-docs.rst
> index c67ac12cf7..dd5bef154d 100644
> --- a/Documentation/process/kernel-docs.rst
> +++ b/Documentation/process/kernel-docs.rst
> @@ -79,11 +79,11 @@ Published books
>  
>        :Author: Lorenzo Stoakes
>        :Publisher: No Starch Press
> -      :Date: February 2025
> -      :Pages: 1300
> +      :Date: Spring 2027
> +      :Pages: 1350
>        :ISBN: 978-1718504462
>        :Notes: Memory management. Full draft available as early access for
> -              pre-order, full release scheduled for Fall 2025. See
> +              pre-order, full release scheduled for Spring 2027. See
>                https://nostarch.com/linux-memory-manager for further info.
>  
>      * Title: **Practical Linux System Administration: A Guide to Installation, Configuration, and Management, 1st Edition**

