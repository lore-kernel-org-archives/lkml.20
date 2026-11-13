Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794567130;
	b=0VSO7/4BU5d9xehAJtZrxYRdvJA7krfJw3pQpcQTMO/+57rhq2aQnbA2VQW9BiGCHRnM
	 QgK9wqaM/eCDXY8LYGKEnK0Rk/cp16rNQIecWETmyR/LtBwVgfm9X83k33v5SsywMjYLG
	 iwfx7MQx8uWqeOqfSaqhqJ5MQoeXVPd4p44CSxDOW/rnBRQV8SsZX3WBjXr31wPeqLoKl
	 IPMWTWC2UZ7XpEtWhn3KBiKdPOqYQgkSNtTfPgZwhNEYfLE0wGZgIsvpGidG5aVL8rBp5
	 gGVcgZl0x9y4huWnRPrwNIFp4Cs8L1BK3I1gLZiZ6FS0kKDS2A4Dt9ddKnZRqUdpdog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794567130;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=6LE1z7gowkT2QwQ9Xe8s2BLaMMnQ4E5AzDFlKjo4x+8=;
	b=in4JPK5bebF7Gz0FV+E+v1Ta5DuWNLLWjUWRNu77KISszYrjYii0VkAd0tdH97pqW0zf
	 AK0zbaJphBPhR7OiLKE8Egx0eHZ0FNYELCbflAX0dLJYuIsLKCHTn3fEIe/XIVFQYrw+v
	 vJ40f0tD7ilRzIWV37ezk86CSNL/3rNNvJ9c+PjRtIeKQV1JUwO8bVvDTOh/f7ZayaGXG
	 XXET9ELDQNYdOE0gh4yXZZwCfchRmMOxri8j4s6/Qhan+yBZvCeCzalBjCIEKGPru+rhp
	 Fd72NGTTYkMcTeTIoDvvd//o2S02EgF27DHZsgGf8jlwmiciTMWx96rPkLqebUGGaxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	dkim=pass header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=RbILq5eE;
	arc=none smtp.remote-ip=209.85.208.172
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43F46606A33E
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:52:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43F46606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=RbILq5eE
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3ae1fd4252fso10392461fa.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 02:52:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1794567127; x=1795171927; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6LE1z7gowkT2QwQ9Xe8s2BLaMMnQ4E5AzDFlKjo4x+8=;
        b=RbILq5eEFtD/i6u6LFi3wa8pqHNSFCNRiqRrPQbfTCOivDKqSRvDUGLIdYkM9rdRO0
         mDO1zRNspwgsxmI6FZXpFxhTl3zTCKLQBmQ4CPPb382vkwjbQO7t7Ep/Kb7ZloNg+iv6
         U9UEV1E6nBJYKrtqR7mTZ0c6+6FBOM2kpuLg+Z+2bQ10exP27yVHmHwEz5VkPW+8uUi2
         nU0R+1RtAqhIugbWe6kE7Q4sHFy7GwnO5lIbxWMY1oeQdpFDBYoiVmv7rdmrbElp9u+i
         WM4njKNGbudwGtmsF6IxAGilqTqMpKCd7tdpfCC0vXWq1RRnnJPlviAWHTmFAx2AxzH7
         FLwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794567127; x=1795171927;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6LE1z7gowkT2QwQ9Xe8s2BLaMMnQ4E5AzDFlKjo4x+8=;
        b=GZ4SObV7SsAd7arzMiJffARSgkcOEzzHFR3S9E31y2c5LzfJy1R/JjRhZLl+j/2yIH
         Ug4NmjEjL3WIJuCDmA+32x2YhA/uEnT8DFMPby7qnS2ZK7lajV55VfqW/b6P1d8Z/83u
         DcuSxi0H0ki1Zz3ZnVwULmKwzlepr65iFI4g8+JCVF8ehZMHNAB0I0Ip/EXv3I74KIcx
         EE1qCRBZYUbTU0H+is7vvsPfFeUU+KaTgh3uW8BB/sH+M5l3OIAjr1OIE8HvmAmolIz3
         TEtquPNoqMzGhOEQ1am1Lp8q/sGHuKTu4dO7fzMxoFpGch80JeUp/bWmYuVaYPZZpFJI
         18cw==
X-Forwarded-Encrypted: i=1; AL+hErFA/2ENJLb3I9MR8N+oFARwLAWlufLlDG71bsaXHGREHe+TUs+LSqhLOjiAJfNiqHiEXRuEG4aX4gtti+A=@vger.kernel.org
X-Gm-Message-State: APuU4Z/4ky/Jx9UW3iGIJUm4C1SQdGxQwXjU5g7hZ9tpvbvg779DXCd7
	DURXXuwICkxUi1Jh1nMzW+/gQwgkMjfXE13BME1n0KJxEvg8zFOixAVCl3Fpxlocc2A=
X-Gm-Gg: AYBFou15b9SmWjWzDujxhzAFNljjNSeKU/bKB7R3B0okHFYTGhcawsX/F3Ktq16qiX6
	jwS7qANu3RhVsHXajTU/FYjmciPaAYjJXYkzzrhvmSz+NmZsDBQ602fOHvjEm1PsdgDz1SaUXHE
	L68y8DMb7+fqX60rbLLcVp6MatzWVixAPmP/aGAnxfa5B7nlgSGZk+LOX4kN+wYvjoHOGdTNesn
	tg64TQCOpR5LULPk2MPcY1ByNsHY00T2UynusggDWrhfsUKTbieSQzk2F82/yfDKpr326odivkl
	oh8kgDKHYqmx3tqlyje2J8AQZUZhbfkfyl4npIQr1Ps1/CPAGrqnvY9K3TmtAAACOT3wUWqi6FQ
	R+J4tqtZh2FpKhfi4w8hVN5s2IOr1kJtPyRm83v0BSPNpwkbES5kYpE66Rfy+WI9Pr6vISIXNHj
	WBQ4m69REDFr8wvfh8sxakh6RGQIXTlOkp32Da5eYC+NGZqq0boEDj4836vj1AhBDDvRLsLvlnt
	8VYwm6ooiEoT+jOUC70TWLylxFyynamqCBIJitIU9bAITCc5O5v3Djk7dH8kCpujQW7dDReHLu/
	Jjco313aesDOENhg9cTyMscfbi9UJXto9OgBgg==
X-Received: by 2002:a05:651c:211b:b0:3ab:1639:9a75 with SMTP id 38308e7fff4ca-3ae2b4efaebmr6838051fa.11.1794567127086;
        Fri, 13 Nov 2026 02:52:07 -0800 (PST)
Received: from localhost ([208.127.45.21])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae2b7ae914sm7498931fa.26.2026.11.13.02.52.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 02:52:06 -0800 (PST)
Date: Fri, 13 Nov 2026 11:52:03 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Wenbo Sun <sunwenbo@cmss.chinamobile.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Hangbin Liu <hangbin.liu@linux.dev>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	1342116488@qq.com
Subject: Re: [PATCH net v3] team: validate the length of U32 and S32 option
 data
Message-ID: <avbrzVvksHvTF89W@FV6GYCPJ69>
References: <20261113090108.175889-1-sunwenbo@cmss.chinamobile.com>
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
In-Reply-To: <20261113090108.175889-1-sunwenbo@cmss.chinamobile.com>

Fri, Nov 13, 2026 at 10:01:08AM +0100, sunwenbo@cmss.chinamobile.com wrote:
>In team_nl_options_set_doit(), the policy for TEAM_ATTR_OPTION_DATA in
>team_attr_option_nl_policy is NLA_BINARY because the payload layout
>varies with the option type.
>
>For TEAM_OPTION_TYPE_U32 and TEAM_OPTION_TYPE_S32, the payload is
>read directly with nla_get_u32(attr_data) and nla_get_s32(attr_data)
>without checking its attribute length. When userspace supplies a
>truncated attribute (0 to 3 bytes), nla_get_u32() or nla_get_s32()
>performs an out-of-bounds read past the attribute buffer. Conversely,
>oversized payloads (> 4 bytes) would also have trailing bytes
>silently ignored instead of being rejected as invalid input.
>
>Validate that nla_len(attr_data) equals sizeof(u32) or sizeof(s32)
>for TEAM_OPTION_TYPE_U32 and TEAM_OPTION_TYPE_S32 respectively, and
>return -EINVAL otherwise, consistent with how NLA_U32/NLA_S32
>attributes are validated and similar to commit 5bef3ac184b5 ("team:
>better TEAM_OPTION_TYPE_STRING validation").
>
>This issue was identified with the assistance of an LLM-based code
>review of Netlink option handlers in the team driver, confirmed by
>sending malformed U32 (notify_peers_count) and S32 (priority) option
>attributes on a UML kernel, and verified after the patch that
>invalid lengths (0..3, 5, and 8 bytes) are rejected with -EINVAL while
>valid 4-byte options still work as expected.
>
>Built with W=1 on UML, x86_64 allmodconfig, and x86_64 allyesconfig with
>zero new warnings or errors.
>
>Fixes: 3d249d4ca7d0 ("net: introduce ethernet teaming device")
>Fixes: 69821638b274 ("team: add signed 32-bit team option type")
>Signed-off-by: Wenbo Sun <sunwenbo@cmss.chinamobile.com>

Reviewed-by: Jiri Pirko <jiri@nvidia.com>
