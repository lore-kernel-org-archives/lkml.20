Received: from mail-yx1-f97.google.com (mail-yx1-f97.google.com [74.125.224.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7582502D53
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 18:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791570987; cv=none; b=OKbtDieg3fjxMh7DimBCL1JfhVF3YZzk4cWPvXaT8INZpTn0LYusHwJNCTYBKmBG0MmUL9BUd4D+Kannk8Wu7P3P0WZ7b0QgvKi3lDEKmV8RTYFkdTrMaJ292854sgXC8sPI8O7VvIOBcw8OwyP2YDHYAbnEKN3ZmGovGjA5cnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791570987; c=relaxed/simple;
	bh=gffTSitD+ngEJ9p3QPBtK6JYSHa8kp6UkeCpTo27d3U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aSWy9ND2AWagAaZo/YgXtFbpXWcTstQJRxYziAHfetK7FJl7KLRjW+PBDoRXLhYQTV914AwaEikFMLRSlbweuaJaxC1DHw72l3R99C3h/yt4MqlhP2NKxIPe/pG/Aio3mXXhD0GLsaBrLD8cMcdPgQM2LPrF0pDr0kb/pkiSHMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=XEwVbhOK; arc=none smtp.client-ip=74.125.224.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="XEwVbhOK"
Received: by mail-yx1-f97.google.com with SMTP id 956f58d0204a3-6756a01fa01so4752226d50.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 11:36:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791570978; x=1792175778;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ib7mPYYGhon+XIy+PaInZeTMy4DED8QwKQU6HZL6lNs=;
        b=FOpnWM3S5xuGwNPD5T+GOYwY3XA+y76BO8VzvueXijvpVOjZlqTmIi4rrXqmm0Iu3X
         gyPqeBe2gLC660weihWxmR6gcn8jJEiNBGiRMAYnjq9IgU7N9vofRSquLmVxv8rDHKdK
         bx6OS9DTYOljsUXt/Xyasj+ZRmwP6ztWY7C2m6IXqONti6koJd5d9rY1C69on3LtR9wN
         T/OTDJ4qizI3lcNSxd7dvPBc7EERIR9z0xCqHz07vm7bBVAo6xqOmmJsE9ZWr7ZQe0vt
         24O5mBXa7FfgG5hCUIPxhiBGXOdL9wNUOol5mcmKeFxTdKqNnRNHKrfmxoz+hX+ZttbX
         a/VQ==
X-Forwarded-Encrypted: i=1; AKwUvBytK/ezFa/xuSA3AKY58MYkTzR2axDQth55hvZsk2gYMuslLgseOBXMG2nI1B7yQy7wy81Qw5yJMU/WAg0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIV37DYrc72w6sKN3YEArWzUeXwV4QY4x0QgEhMfz5qTNqLuaXn
	0PjyqRqa8ImbhQv4E5EfLZzFXJv5tXrgowHdbm4hOmHeFBFmXudVIjWwvJkMxHtfMAuwbGxj1D3
	kNzMjseYlbUz2wl+EIXmHaz4BL+TW/GwpSb0/EXHn88MQqnAztLqTHzXTTgUb0gjLJe5lafuA0T
	fKAhCG1dW4WLqPLW//geBS4cIJQNOUG84ZPqBjBszNVWUCllfufDnz2IfqZNkIpk0Buat9/Zuwq
	xzLUimLf0+O/YVJtA==
X-Gm-Gg: AYBFou2DyvBEdeL6ZHOmOWLY3UnRt25E+g+bS63J0vxbDqMZ+Zl3ptOk7vXfYGIe6l5
	h5zofkevRNMbmkmfj1uCrahwNLzarewHQGhfrAKfEmNZUfmZR1JyJz+tC/YNy3YCu9g8L7SQ1Da
	29Q0l0HMoyHhyTezLyYCIySa69qNKSDuVW4aGJR2kg2VauYGPgPZv4dHcVdt+ayJ/KwKM/9yc21
	MbsZTXOS7qZzykOIlGirYqNcDrTmX4inKYEPk4XbiD5mhg/psqeqrN5YyCRZ+4E45m6/J8hgy/x
	RzEx8jWRReVgfF89KpLRDriWn8QxlFaF/Bt0RlgfbR3yMSCCB7Mlq+dnU2HGPWDG0H37zeCiZG2
	HS09R1yHrvNx0L/M9XBr0ML6NGg8bn/9ZT+bSRO1GZfzn+0z4Kyi4S5DgsHHhpxlD6t2yNMmcRg
	sYX6hz+O3Kk9LGELWWVUrju885sphPAo4mreyd
X-Received: by 2002:a05:690e:bc7:b0:677:bc90:6ed with SMTP id 956f58d0204a3-6793698bf46mr938992d50.39.1791570977472;
        Fri, 09 Oct 2026 11:36:17 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
        by smtp-relay.gmail.com with ESMTPS id 956f58d0204a3-6793567ef17sm128179d50.25.2026.10.09.11.36.17
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 09 Oct 2026 11:36:17 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-88732460a55so5136b3a.2
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 11:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1791570976; x=1792175776; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ib7mPYYGhon+XIy+PaInZeTMy4DED8QwKQU6HZL6lNs=;
        b=XEwVbhOKSdXOGnZHxH38VhdaN5IyzpuBRKMJy5bErkEqsNM2VNpQs7MeUsbEQ09zqA
         7xoYlJSOW56agcCfLmbwX+f/BwGW21haqFA+cx/9w0d6qkDDNvG54PwV0WS2Ryfx1DT/
         7pmEFDE9D0qH5WniR6qmteMxT2e7M1ADx2FEQ=
X-Forwarded-Encrypted: i=1; AKwUvBzUbztFz+zzxM68qd/dF3mbXEhckhoCkcqIZNrC1DVEWD10js+xk9ycM3uuEdnWd1XcAb7itX8xeUT4KOI=@vger.kernel.org
X-Received: by 2002:a05:6a00:3399:b0:887:3fca:8330 with SMTP id d2e1a72fcca58-897c72f7b92mr2229445b3a.46.1791570976247;
        Fri, 09 Oct 2026 11:36:16 -0700 (PDT)
X-Received: by 2002:a05:6a00:3399:b0:887:3fca:8330 with SMTP id d2e1a72fcca58-897c72f7b92mr2229426b3a.46.1791570975813;
        Fri, 09 Oct 2026 11:36:15 -0700 (PDT)
Received: from [10.14.5.199] ([192.19.161.248])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-896c310738dsm1570613b3a.16.2026.10.09.11.36.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2026 11:36:15 -0700 (PDT)
Message-ID: <5e5da857-c83a-4b33-b671-069b84b5b33b@broadcom.com>
Date: Fri, 9 Oct 2026 11:36:13 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2 2/6] net: bcmasp: unmap previous DMA mappings on TX
 map failure
To: Florian Fainelli <florian.fainelli@broadcom.com>, netdev@vger.kernel.org
Cc: Nicolai Buchwitz <nb@tipi-net.de>, Doug Berger <opendmb@gmail.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Zak Kemble <zakkemble@gmail.com>,
 Simon Horman <horms@kernel.org>, Ryo Takakura <ryotkkr98@gmail.com>,
 open list <linux-kernel@vger.kernel.org>
References: <20261008210621.1374785-1-florian.fainelli@broadcom.com>
 <20261008210621.1374785-3-florian.fainelli@broadcom.com>
Content-Language: en-US
From: Justin Chen <justin.chen@broadcom.com>
In-Reply-To: <20261008210621.1374785-3-florian.fainelli@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e



On 10/8/26 2:06 PM, Florian Fainelli wrote:
> When mapping an skb with fragments for transmission in bcmasp_xmit(),
> if mapping fails on fragment i > 0, the error handler calls
> bcmasp_clean_txcb() for previous iterations j < i. However,
> bcmasp_clean_txcb() only zeroes the control block fields without
> unmapping the DMA buffers, leaking the DMA mappings allocated for the
> head and earlier fragments.
> 
> Call dma_unmap_single() before calling bcmasp_clean_txcb() in the error
> cleanup loop.
> 
> Fixes: 490cb412007d ("net: bcmasp: Add support for ASP2.0 Ethernet controller")
> Assisted-by: LLM
> Reviewed-by: Nicolai Buchwitz <nb@tipi-net.de>
> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
Reviewed-by: Justin Chen <justin.chen@broadcom.com>
