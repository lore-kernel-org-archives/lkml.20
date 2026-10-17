Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B770B3115B8
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 07:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792221145; cv=none; b=L1ciUuxuUsgyISzj20lhHQzNz2V6CtF3S0i+Cd+wtCZTMj7ktyVZhboZid3V77/XlsDhw+es/ZLcjtSv+BKxOLMOvcJ495zgMvwki8wcj6lJ/Howdst5Gezjd9TVWUpWYyXaJ4eMlTfifC0A4pscGaVSPEAXL2D31BlcB+tt/ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792221145; c=relaxed/simple;
	bh=BZwSK7ZeySOOyvlWP0oplhGZMIZVWipoOzRgi2fP0c8=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=SComYYUxwzHsR8/lmqIDWXgHvR0+Hl7tSu5N2GRS9yyTpe1loZVMysTIc/WH2prPJVXHXhuJG9CLp+GDM5B2fOqICtiMEcg2f+WtezbvuZhfPuMggXpbcTc0TFfTBIZ3U2jDfsqdpArEvCLZ4C6BRw7VYo1vnPFVGKGU0maa480=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X01Rnn/U; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X01Rnn/U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FAD21F000C4;
	Sat, 17 Oct 2026 07:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792221144;
	bh=pawdgz1PFW+s1/dBQACbZ1G5t/EZzaKaoBS1ynYJbZA=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=X01Rnn/UjdCmUIIvN1zKJ1nPfQV5THE6+AbDItJM3Wzr/GwsRuvK5y158kSRSb/31
	 gPBwaSw5VhObaZfQySP3Pi9L5uMLi3oosy1GUs0SMWHFr2WXrJTfZdoNuBLHREWzSP
	 RFgJ4EtNNrgdV459DBFKtADe21cgAy5mywmcBJZq5Oh9+o/GWogS1cSlvpfVJ/xeE2
	 Snmh2B4wrM9RIPBNyc0XnGUc+SqWQTV9FHTIfD3bQVqS1cFbJUL5l3TgODn5mKR406
	 LAzYcQe759EFzgglfpo+LENEZK2y2efRxxX92eOr5KWxKXcxUYQJXDp9JHS3gHAIpT
	 X8PiKVH+diuaw==
Message-ID: <b0399575-ba61-4778-a8b3-aec32090ac5d@kernel.org>
Date: Sat, 17 Oct 2026 15:12:21 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 RESEND] erofs: enable iomap for file-backed mounts on
 unencoded inodes
To: Gao Xiang <xiang@kernel.org>, linux-erofs@lists.ozlabs.org
References: <20261017002758.52193-1-xiang@kernel.org>
 <20261017023352.67568-1-xiang@kernel.org>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20261017023352.67568-1-xiang@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/17/26 10:33, Gao Xiang wrote:
> Iomap supports non-bdev I/O through fs-provided callbacks since
> commit b2f35ac4146d ("iomap: add caller-provided callbacks for read
> and readahead"), making it suitable for file-backed mounts on unencoded
> inodes.
> 
> Enable iomap for this case to support sub-folio buffered I/Os on
> file-backed mounts and simplify the codebase.
> 
> Signed-off-by: Gao Xiang (Docker) <xiang@kernel.org>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,
