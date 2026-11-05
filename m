Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793845283;
	b=eenTbWJW0tE4yENks/5KNbFCdvfWcNt0nYAalZ5qO9sn2+oJz1ZZx7wFlgOtsKMAFy9a
	 K+kTkUz5CUSycZvH2MMJ4F1O8wnj8hNB+pdKRSMcnpAoymArMiQr49ZinV+cOurslQZdP
	 u6foJ8YGCVIciS/quRCQAaRUWsv332Zl+CUQc2TzrZB5ucCUU5pg6wGtoHtOdu4v0Rgqy
	 AbTfLMmaO2gD8gdxytaESHl8ToXwWfHEoIIGP+cQ9eDMqVcsNLfRoLbS8unpI079VGG0H
	 k04F43yAlX+BUoCaEE0uhyNLuequkDRUapM6Reb4T2srdyQz1up45EkVCKlVzVl8MKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793845283;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=CPWvCpHCYoWPM5p3/a4KEe4RRG4SBGN/TGqMoA1qGPw=;
	b=2alV8IBY2SLl43LhLlojFJc8fDSHITiDpDfqfgYFk6tLqFHp7wC6FfTitoaEMuWy1gnZ
	 N/9UGjbnrlftOkfwAYmRj6bQtOfuKwznStgDE1kAQkhGL3JmVQXbSFCagz04k/aAI14+N
	 oWGBrmQzogsNafSFmOKoRoIIxc9gZ65ZCl7B1bh02KEHU0kE+ztFSVYChkNAYVBI7zW4B
	 YDEpmzOyW86aXEGNl3ylH82PdWmGDJzQ3rqcA3tgKfD4LuCvBRKYhUcL6OQM6An6sXydB
	 NU+6NhJgA08fpwvi7FO8aVX6VWeRJINQElTZk+LTSVrNsM/Qjdlj/Q4J3liLbWeOACg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=upYHlsIT;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7BFD606A32C
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 02:21:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7BFD606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=upYHlsIT
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-19305bcb72cso1283162c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 18:21:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793845282; x=1794450082; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CPWvCpHCYoWPM5p3/a4KEe4RRG4SBGN/TGqMoA1qGPw=;
        b=upYHlsITZy9Egx9YYgwt7G5l8ujPMJ2sprITqpQJ8YYIF0KpweIe0Y2XL8zE9ilu1i
         xs6ZGv/606sHvwgPSm0UCFDE6d2pAwyyxqzFkBRIITXNTMfbgZlbro5Kacp0ggGLCnDS
         77GIfh8EkEwq6VzYFJleOyqMPviwuHP8aHndDfCs2NtRl6xWHqJst+FFAZJR+bTFkUt4
         MNWK5iYz6b7T/q7rwNg0zLbbh8xRucO3mrtYT7bJv40h1kyRmQ3R8H3qg3s7Wxjeik3w
         4nvrJHb1DQdzPLxeqCDKUNIr6B2PETw3tQZku/Tzw1AuqnKQpvSPVkUHb8zIZWNaZX7o
         Pe8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793845282; x=1794450082;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CPWvCpHCYoWPM5p3/a4KEe4RRG4SBGN/TGqMoA1qGPw=;
        b=W1OqsXEAN3KcuAvhrOE8cp2IERLZn1ub/fHvjaIQFcWtFlV9qXpAwRGXWKq/ckolrT
         oHzN7+xY+g5BavgcBLvfYbvpr0k7BulRng2CvImlR+gxPq5wqp/LQCPd245oeCTXTm6M
         20LERHVSS/bPIsnnchAD/Xy2hgCy+g4ObnqItq3NYngGejn1WfZQxx4Iku8ZMfqO+mWi
         wAOujiWPmtCkUkvY4i6UNDyRyQhKhHV8jsZLWcAXFXiFW+Fh6uueYaS8HQ8X8whtBI9f
         eqKyTDi1Kw+tbaL03tzWS5CqmHBFYcp+TC+KJNNRBCdfMYD5ZXNRnNRulTD/O8V7ZhDc
         40ww==
X-Forwarded-Encrypted: i=1; AKwUvBwyDhKPL7JrAZIJJqu+hx2/Rj9LaUyfTeOA8qEKGvhkFFEvIdA9llH0JoZQlopc61ek9oWjsgZiOZD1jfw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9gK+ZOnFjW0DcJqw3cf/0gzePHKx+GFdkjH/3C76dXYWVa1q58
	a/qjq6hW0YvGVPY3or+gN1dq3jRNz9vxzrKVCzaXr8nphyeL96FR/CpK
X-Gm-Gg: AYBFou2YpQkI7nVe6rkQoPEdLuHapl8j4uPzjyzCOvrk+8Rh35+3m3dtiyXBEEhhZuv
	WBzXZ+4/Y6tl2xE+5vO5AR3P+i6vfnxB9xn3nsc/uaCSby0AOG1HFgHtHKDGy0bcYjxUlWG+UXh
	2FnMqB9QtBkT4+5lF8CoHDfuyPzw/LAm1Hl2ob206h80GqhrNRLPajz8MsLctfq7MGtlXXeiWUe
	0U6BUDoG8n3FwbKy8OHHHfdHhiwxygCBsMCbUXMnSwHnJycAURJ6fFhbdT3WsGxEEoXAriCFxy4
	Or0NnVwCK36E0p4MUczkra/gLalyp5kCEQIpO6BqEJdwqvMaPJmZBytSt4iyAsUToMhRj5SidEo
	Pzm3eV48ehkJopDfXCzNSyKv745zWMUdMOfy4qF9GTSpJPCMOKx6YuYEVVmBIEfJROpiUHaBAwj
	PQC9Ui2aeY3IhejL3LSz9R+0oOc5eDaEKRWEdnYDekt0HYe5uGP+8i+PKL8MxUXY6Bl5dKhhIN8
	OqywyAKYo0McGL5NpmI9Y7W4kGq2XVKQy//9EjwnWKAZ+pdFzrqt4LRO6DRqsl2V2WW5gt7K0qm
	ANqyA80ZK4AFIy3EDfQR+oH2YieP
X-Received: by 2002:a05:701b:4186:10b0:137:5b9d:cf87 with SMTP id a92af1059eb24-1ac4f91ee96mr27294468c88.0.1793845281828;
        Wed, 04 Nov 2026 18:21:21 -0800 (PST)
Received: from gmail.com ([2a03:2880:9ff:71::])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c1c272sm11719698c88.8.2026.11.04.18.21.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 18:21:21 -0800 (PST)
Date: Wed, 4 Nov 2026 18:20:49 -0800
From: Narcisa Vasile <narcisav.kernel@gmail.com>
To: Peter Morrow <pdmorrow@gmail.com>
Cc: Tariq Toukan <tariqt@nvidia.com>, Simon Horman <horms@kernel.org>,
	Leon Romanovsky <leon@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next] net/mlx4: drop the unused is_supported callback
Message-ID: <auvoAYT/rwFrzoSH@gmail.com>
References: <20261103122109.1798144-1-pdmorrow@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261103122109.1798144-1-pdmorrow@gmail.com>

On Tue, Nov 03, 2026 at 12:21:08PM +0000, Peter Morrow wrote:
> Since commit 557d80138618 ("net/mlx4: always create the eth and ib
> auxiliary devices"), both is_supported callbacks return true, so the
> checks in add_drivers() and delete_drivers() no longer decide
> anything. Drop the callbacks and keep the aux device table as an array
> of suffixes.
> 
> Tested with this change applied to 6.12.113 on an Azure VM with two
> ConnectX-3 VFs: both auxiliary devices are created at boot, and
> removing mlx4_ib, mlx4_en and mlx4_core deletes them cleanly.
> 
> Suggested-by: Simon Horman <horms@kernel.org>
> Signed-off-by: Peter Morrow <pdmorrow@gmail.com>
> ---
>  drivers/net/ethernet/mellanox/mlx4/intf.c | 44 ++++-------------------
>  1 file changed, 6 insertions(+), 38 deletions(-)
> 

Reviewed-by: Narcisa Vasile <narcisav.kernel@gmail.com>
