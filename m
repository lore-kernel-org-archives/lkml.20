Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794306051;
	b=QB4NGqIJI7JEXhHLDjrW6km7/DSLx7c8uTo6CLXgLz4Xecmyxcd2+JNHCFtPT/ZLNLXO
	 ZUKVF6mNM1UTvJB32rxd3Iv8C4CpbwOLUewvT/LAx9VmNu41duPpPRtH1PxveuHEpnNhD
	 UASvHKTA8dUMXwxWANsgCLB4oIW9EHuTkb2vufTK/viaWJuaSjNYXsN7Jtly8zca4tkwD
	 Lb1fI+TlaXNWTjN8q460bhp3UbTXVIUclVIhDII1+xbzQDcCNkVgIFBgi1VnaRU3KhD5R
	 WeXuizUZAFl0ElNMjjSd5oaA19tWZZcb6/qct/tZGYnbOFDGQ/RXAUfhTPlQRwlfF4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794306051;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=+4IARZkpVYLkyFh4VU5qTYN8gJUqWWMYrKK9AnH4iz0=;
	b=Q98karSyZkg25BqOd5MaMR9DTT7CmMUeLIXHCJcF9hbUoS5tdHycIaEk671DkrKCf+pS
	 /+qqDNjkGgjVqYirHWWGRfpOp9xUfYiv/0XgqYoi66lIRxHUGqkYkZvhdmLqsNz0M6x5h
	 O/UlCeU4hMphgChGlkdisOX7Smnz9LFT3pa87L9u56WNSbezYui/u0tNs3i8YTYYZnIW1
	 3rnoVQ2NBXJ7369rOsdNIXmDJba2Lv5DtkWG7/oy8QnzR41ycPGcRJgObNCzYbGZLfzrY
	 RgVR5oKYRN51l6SIBmuaMnznnerlnQ9AFyQbV1WwMV+Sv07E4fnDYxAXBSGD2nDKRDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Vo03sytC;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C91C606A321
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 10:20:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C91C606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Vo03sytC
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-492f563d1c6so649061f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 02:20:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794306049; x=1794910849; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+4IARZkpVYLkyFh4VU5qTYN8gJUqWWMYrKK9AnH4iz0=;
        b=Vo03sytCYk1xdOQvL3TTScXwoXaVe4vQnONe1CRdr37HKBUcEVgGFE3PYtax6H3mQO
         XojuUioMrDTXUAuozPgYnLDUOxOKE8nitgFr122rzHcznxFX1Ye2/IaFM12fMKkof225
         wKKYSxc+E7ejNxteYD2TcqqjDWmmZvhJ8+o9VH88sLFjVjpH1fD4JonlKhcC4PiNFxm7
         /W6qxmSvL++aBie4pORZ+TfdLZ7F6foAqAKqdxgfg93nn19uSSqr+VNNL/uK5iDCDeMz
         nye0EExQtd5fl0tKY3uT7g61vEQxX114Lgp5PGbykEgpR/f+Rd2Q2fdXJlkIsbSS2lOW
         H6Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794306049; x=1794910849;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+4IARZkpVYLkyFh4VU5qTYN8gJUqWWMYrKK9AnH4iz0=;
        b=KjuBWs0BJx5fVeKGj1PsvQcDQ5M50xnh6NGWgQhgv7+iAv27QJg+IQE+6zNnOzW/V6
         SwPBSQzN2EvwMKQQ5Fvhwrl7X2KWCWUJTKRZdjdhn4YG8vrV7d4Ve9GqKcXmbH6ZjUHz
         ylZ4r90H+0/ZlQVlpTUUK9g3liagcdV9chsV+RSgHqpyXUAw02Z5PAeplQVvhkDd9mbV
         /IVULzmNq35r8XScq+mWpKj0STJ4HGmicWao0nFP3MUnSvIUw/KQyAEaibPCUGZQH8KA
         gVC9yNl5+VUkVfNybZHpHnVZotLkRWTCgbMgpEf4A60RY4cfXKgwWWn1JBEad72ANgad
         rxhQ==
X-Forwarded-Encrypted: i=1; AL+hErHWmGyybhL9qTasv6Nga7fYasbD5zcORui9nCEV8KLLnf6LQKytZSQzwwJyyLs4EBzG1O6tK+gfb6+haFY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8FLQwyrzkPhUcI7KAs921B75rXDIBKGSRF0DyKArWUTOH9xoMp
	a0X1aTqGxDAry2BlENefLCcpwH3Ldh1ReQk5XEVbs+pk7FQ7UDbVpaF/d9TEinoO5Q==
X-Gm-Gg: AYBFou1BtD9aF9qZlR4sO3g3FtuiPvqjlIasFNFdgyGAML9xIrX2eSOsxOpDB3O0gML
	n4L9LYmHLkx+kszptZylkaM6K4Es97/v6/f9+WEqIIyVm9qLLLZ72CsbWdWxLQQgBse1BYU9u+u
	gsFsJKaEsrRq7kKXrDJVy4QfCBQxy9pHe/IixUgyuw7RA0WsbeOIyhyFBxUbSX52KATCtogTAHi
	YkXN6IWlczhI3Kwu8FBH9jDmg8qSeIe09fGDD1/P+NXVIdu1dMw2BWWEaI3Rlj8wVW8KhcoCqHA
	HoKVPm8+7RC5fYkDh0ZKbCEbHTIfaFzNztPl5y05aFKa9te3uKmOWcAlmOOpxFkBUbTsL65gGyV
	3AOrIfoqeUNXdx1p0q/9xGpHOaDyZ0Dw9DXJXF1zpz1sxPJGdXDzFWXA9GO0wPL76Bl0fpmkOHm
	TD/jg+M5FyC53dBuY1HN96CsX4EnphzD+3NvGebps+zPRbgDP5Mii10SOnMactcVZOQSHTztG+Q
	HJAdoHIHV1xm63wtdT48iC6bsSzXPBQ3cnhDnsFBX3l/TXyF6DjgQd0dcFBDLAFCXa6jGXGUDqX
	pXk/TE6njTfjHk/1Frg95YujfGSPo8L7lFFSb0PDAJK0sA6D2rbhpZaKCG7EItHjLRln8paJFSb
	J7IAqXUOqrdcy2pFIy1i6ccYsVx3Vb81wxxfn/g==
X-Received: by 2002:a05:6000:2212:b0:48e:8882:6d91 with SMTP id ffacd0b85a97d-4982ba32847mr4400061f8f.1.1794306048833;
        Tue, 10 Nov 2026 02:20:48 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de. [37.24.206.209])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498362eb158sm4184391f8f.36.2026.11.10.02.20.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 02:20:48 -0800 (PST)
Message-ID: <924d8b0d-5dde-4616-bdca-3115e3adc3bd@suse.com>
Date: Tue, 10 Nov 2026 11:20:47 +0100
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
Subject: Re: [PATCH v2 0/2] Xen/gnttab: improve error handling in
 gnttab_dma_{alloc,free}_pages()
To: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
References: <20261110095605.369848-1-jgross@suse.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <20261110095605.369848-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.11.2026 10:56, Juergen Gross wrote:
> This small series is V2 of a patch Jan sent out early this year.
> I just added patch 1 due to some remarks Jan made when sending out
> his patch, and then removed some now stale parts of his patch.
> 
> Jan Beulich (1):
>   Xen/gnttab: improve error handling in gnttab_dma_{alloc,free}_pages()
> 
> Juergen Gross (1):
>   xen: don't allow gnttab_dma_[alloc|free]_pages() in PV guest
> 
>  drivers/xen/grant-table.c | 36 ++++++++++++++++++++++++++++++------
>  1 file changed, 30 insertions(+), 6 deletions(-)

Reviewed-by: Jan Beulich <jbeulich@suse.com>

(Whether that's meaningful in the Linux world on patch 1 I don't know.)

Jan
