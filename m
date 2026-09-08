Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4F2239A7FE
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 07:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788853160; cv=none; b=ks8tsmkPFbcRQs7a32qlHgerZQM0udkS7xYZ3yxI0/qAzeB0YuuJ6IUkYfoNphifBpGW9EZf7FkiQ0OjiTY0LLgfar2GjtF8smthtL9/4Jx0af6WsnoneRAiULqO2CX9T9YCoH9b4wSzeO95N0Wx7p5tAYu3qN+iNQOkonuOxac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788853160; c=relaxed/simple;
	bh=D2RzBP/R2/Cwa/v8IXDhGj1L5RBiAsemHSKv+FgrT8Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Eb+kZ/Lbi3AOth5E8UDPY2syoJVfvD3p/1BQOd421tWzciDqCiVtyAGv+0LPWoZohLAEm7zsYNxQQp+pj6kIp8Q1kt1bVIzTw70TjuKp8FFoz1UbtLZm0Ib4789dcUZzDhayh+AvmNvE64dx9S0Wb5HxGmT2+XqJhPtyxwptBiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YLVXDUeb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YLVXDUeb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4E401F00A3A;
	Tue,  8 Sep 2026 07:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788853157;
	bh=AEH8AxXp8/DINU64YKh2WZQ7W3iV+JcF7rd/P0GvM9M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=YLVXDUeb1/ASgMYIY7WSS+AhHmhSkqqo8U7jaHUQGlvGHgBTRIcMWODC9ff7vEopV
	 xcpPz8DTRzDc9NRsgHdHhKLBlzpCNbGMuUbQJDOcd2dL4OuJE/ai4MSh7KiJLA6SU/
	 SjXlsr2KzmJeDkUUCYguw+3ZLzyD4/VfKKvtA48BMgfC/E6BX8DWnKnAoxtgBtsEbF
	 MJrUJwVauk74uq58UL1eYe6gUbcwQvacJtbu3GDZVj5qBT/VZQYvqjP4F03Dj/pYmX
	 XbkEXIOII4uyVeuVFseKm7RFSXQKEMIsuBInUNQ5IUlLab4n5kgQtE/A8hM31PDjen
	 l3KZYjBIUslCA==
Message-ID: <bbbf056a-a86e-4ad4-97a4-4a32a36eafa2@kernel.org>
Date: Tue, 8 Sep 2026 09:39:14 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools/power/x86/intel-speed-select: Clean up more build
 artifacts in 'clean' target
To: zhangjiao2 <zhangjiao2@cmss.chinamobile.com>,
 srinivas.pandruvada@linux.intel.com
Cc: raj.khem@gmail.com, linux-kernel@vger.kernel.org, trivial@kernel.org
References: <20260901093657.1884-1-zhangjiao2@cmss.chinamobile.com>
Content-Language: en-US
From: Jiri Slaby <jirislaby@kernel.org>
Autocrypt: addr=jirislaby@kernel.org; keydata=
 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
In-Reply-To: <20260901093657.1884-1-zhangjiao2@cmss.chinamobile.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01. 09. 26, 11:36, zhangjiao2 wrote:
> From: zhang jiao <zhangjiao2@cmss.chinamobile.com>
> 
> The 'clean' target currently leaves behind .* .o.cmd and .* .o.d files,
> as well as the generated 'include' directory. Extend the target to
> remove these so 'make clean' fully resets the build tree.
> 
> Signed-off-by: zhang jiao <zhangjiao2@cmss.chinamobile.com>
> ---
>   tools/power/x86/intel-speed-select/Makefile | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/tools/power/x86/intel-speed-select/Makefile b/tools/power/x86/intel-speed-select/Makefile
> index 6b299aae2ded..46874e4cee51 100644
> --- a/tools/power/x86/intel-speed-select/Makefile
> +++ b/tools/power/x86/intel-speed-select/Makefile
> @@ -54,6 +54,8 @@ clean:
>   	rm -f $(ALL_PROGRAMS)
>   	rm -rf $(OUTPUT)include/linux/isst_if.h
>   	find $(or $(OUTPUT),.) -name '*.o' -delete -o -name '\.*.d' -delete
> +	find $(or $(OUTPUT),.) -name '.*.o.cmd' -delete -o -name '.*.o.d' -delete

There are no *.d at this point (removed by the previous find). You can 
do it on one line (as many of the other tools/):
find $(or $(OUTPUT),.) -name '*.o' -delete -o -name '.*.o.d' -delete -o 
-name '.*.o.cmd' -delete

> +	find $(or $(OUTPUT),.) -type d -name 'include' -exec rm -rf {} +

So you can remove "rm -rf $(OUTPUT)include/linux/isst_if.h" above, right?

thanks,
-- 
js
suse labs

