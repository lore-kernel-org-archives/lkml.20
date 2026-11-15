Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794754857;
	b=p3nYAbl2BsTh9I+gm1rDxCeozScmFfZELwnH2SaOPsGn+FQPxlEma89YO0+uo//wdnTo
	 wqGAa20Ji4KCgagCY2Y854V61Y3oKD5QdcM0CLb1UW/oYqu/C7dqVdcCLTo6pHPV5X+9H
	 /BxNQjC7obZ8rvplt6+yk2j2tcRgZMK27DjjCZgnS5MDLmIVF6eqVuWJg4hf0ARDyiPVH
	 FTAN2lWhI1lHp90MwIJ9p7wOmdLFkmHlIB97WzSl0J64bhqW1lgvBbsZdmL6YDQ5TWxGF
	 5DnOx8nPcANJ+8vHl0CxXJGBT7aWykheGG7iqqMjx9zlwnDEGmiEB27GyQXlUU3hUYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794754857;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=odpD+r7EovH1ewOQbjdPJxU1qEIPI4Ul3ZtdrxnDcUI=;
	b=LCiZGRCTM69SOAtV+3vk2nhmQXoEHwF+K8tE9JpVzcwtXf6kmk/8f0dLmEIG/WDXxMvJ
	 jBWL0c5DbsqOBubrPbrth/wPAHCBcwD3CY8AScZCUrh/WMB2DM7oTDJwsp8kPfwGL508a
	 yUnkwlBsuKPWETEz/hxXXxxpt3u8ir9Vy3x2LjBO4OEArKt1CZESJ6K+pr4YYsjjpqz7q
	 NK+vJQE2kzUCZemmykUxNYbO9TnRjN6FFCbzv0Q7ORKH/6/ZwNx9XrS8ykLxgDpDtiCBS
	 /FsOjiYHJuhFKCgayVQEpMEPkm/B2Fjmm2ragm1gckt+VK5mgQ4ZsTidP63h5HJJ4Qg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OV8HvwcZ;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B2A9606A31F
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 15:00:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B2A9606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OV8HvwcZ
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so33986515e9.2
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 07:00:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794754856; x=1795359656; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=odpD+r7EovH1ewOQbjdPJxU1qEIPI4Ul3ZtdrxnDcUI=;
        b=OV8HvwcZ/+261B21Rudn9qdplnEpIZfntfO6nmOQr6q9WybR1hg+jupHRVxHt5R8D0
         2y5Dkq9KsvSJNzUSJb2JWny6ESlqM3ELxIh0d1fV6/ivbRYcbHGcj5HOgvbJqvuKUnTz
         UibP5E3hgPzIFk/c9gISuqeFMoQLUMWPPWmZ9tFeZIGXndUya3HNOe124gXFolXcgtZ9
         S0rIKo4bnx6j+iKlcLVCtAiL4CNbauEc2RePerKYdpYGCF0sKHRIAY2d2avsz/OEy05S
         xphx10ISGGOCQc/vNcpAZv7R5GkZx/xFZwUBNXSCQQYjvhPeF5L/Ip7MwR2zgcbKp2SS
         3uAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794754856; x=1795359656;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=odpD+r7EovH1ewOQbjdPJxU1qEIPI4Ul3ZtdrxnDcUI=;
        b=wmyhRLbguTZbWyX6IH6QxMqkuvqd6iBEy+Vf26YzyP86LBkLY19jq7MJQD9O9KBE0r
         J5KkFdQnCel5sZqYMx7oNe20WFDLhhhp1a7WjvlcaOo6nqNrleItUQfxI+mceWkVY4pH
         deoAXf+oUZQI2zp3x0MxOKhQDBdBIZRbIwqltAiM2K9YOH8pvGQcFwp4Ae74LwAGn3mX
         IV5HqyIUiWJ3kdXcL9zCh6SxxeuzPDlwvEdBVhfA43JNmkUK5xrzXf1pANQHSPUTJGkF
         OgEdBbliaUGwaIzLbiyhnpXCMESnS4vAXbR/oX50UARaDI+aRFLr674fEaviMPhJz/Tr
         YAig==
X-Forwarded-Encrypted: i=1; AL+hErEKuttoz1FCd9x+kaS+AOrpNXr7mzyn6gvsB6i1QcPETxpdkZIplEtJZNnLWAAk5VHfAi0c50FylS0APB0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9jW3hfKnGwBrlBvPFV2eJLmLF7UkPm7HK4jj06VGRRhjkmTrkt
	T28z4qq4M78aj3fj7LXtdoyFEBaLrqpOLRHtNK/LV0Ul6bR1myRR8J0PIMO87NXa
X-Gm-Gg: AYBFou0r5s9CaZD58g50k8xL0cLKsjJeJl3x7TiHXEu0sJrxh9m3bqGPWlfzFRaQJFV
	aO1FBl3m4SRXTqiUBuKVkqw3J6XzLnmYl3c8/tMUmLmVmyIEe8Bn8rgZFQbWGwiHJLVfNCgTaHc
	cXGfPprFX0NIJxjEOjrafIjrz4iSxIJFqU1HdrbkTK+2nbZOBSAgBQFMx8TdCXfop7rahlhfhaJ
	2Gk8NdJRgjfiJs9e9BWqcHKXom9hWuoNvnpAhKua9WktZM8B8mQSnMWU753v4SOI1KhMsEH389g
	lgzF/w5EEecE99Npb0Se6PWhJxm53PQpuYd5r25SV4moh7n8u7zlZzrhxRiVXYy005MRGzsEKKd
	RIWsoug38oSD5r4fH5sghHuXsa5Skw+FH53YKJuaOVkbTCHwyp8cqy41g/mtZ+2qAvWXrhjYQbM
	fTyeUTE6AxKrHjdt4x8IjKm0OKqYotTFxA8yKOIJc2sb3rrQMYMM0fPwXR8mhpr41fAVbuMW3zZ
	+LKid1Gc2PwGjw35Gjzb36+MjNNl0yEXdCSQ4K8ffQnOhG5fDc2Hp+1Aw3DnTABLzY6OfDcUztI
	4yyVfjsEpQc1VO/be6WsRUOwVNi/ParvYz8g1f7257ia8O/NCKPElLFze8mKEHa+ow==
X-Received: by 2002:a05:600c:470d:b0:4bb:6b59:aac3 with SMTP id 5b1f17b1804b1-4bb6b59adeamr41580205e9.29.1794754855685;
        Sun, 15 Nov 2026 07:00:55 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb5faf05f8sm116842815e9.10.2026.11.15.07.00.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 07:00:53 -0800 (PST)
Date: Sun, 15 Nov 2026 15:00:52 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Thorsten Blum <blum@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, "Masami Hiramatsu (Google)"
 <mhiramat@kernel.org>, Breno Leitao <leitao@debian.org>, Christian Brauner
 <brauner@kernel.org>, Sang-Heon Jeon <ekffu200098@gmail.com>, Wilson Felipe
 Pereira <wfelipe@google.com>, Ryan Roberts <ryan.roberts@arm.com>, "Mike
 Rapoport (Microsoft)" <rppt@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] init: Use strscpy() in do_initcalls()
Message-ID: <20261115150052.6189a1a1@pumpkin>
In-Reply-To: <20261114115230.30345-3-blum@kernel.org>
References: <20261114115230.30345-3-blum@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 14 Nov 2026 12:52:29 +0100
Thorsten Blum <blum@kernel.org> wrote:

> Replace the deprecated strcpy() [1] with strscpy() to bound the copy to
> the allocated buffer size.
> 
> Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#strcpy [1]
> Signed-off-by: Thorsten Blum <blum@kernel.org>
> ---
>  init/main.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/init/main.c b/init/main.c
> index db8fb6ebe830..93a2b12976f0 100644
> --- a/init/main.c
> +++ b/init/main.c
> @@ -1481,7 +1481,7 @@ static void __init do_initcalls(void)
>  
>  	for (level = 0; level < ARRAY_SIZE(initcall_levels) - 1; level++) {
>  		/* Parser modifies command_line, restore it each time */
> -		strcpy(command_line, saved_command_line);
> +		strscpy(command_line, saved_command_line, len);

That could be a memcpy().

David

>  		do_initcall_level(level, command_line);
>  	}
>  
> 

