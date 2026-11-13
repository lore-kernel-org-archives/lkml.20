Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794582669;
	b=Dsa23lg2+4V2W6LbRvqQFr06tRcI922KnECur1WV4/vckzir/1TjA+2f7jRIe08NpQ1s
	 dR8LovXfc9tT9it+mHYEb5tJ/BPRjpasRTKwHguvIuqpnNgWSImhhKSg03T4jIT83N4np
	 mxgu0A80scH8CkNwOKzLblOEkq/ekB6nuodoTb/7uPS91O9y4Y4Pl6exUDp8k+QhMikc5
	 tuQJRNS1htN72rmsuxfI0STIWzEmgVllAPzVSVjw4TGgOQUWUwkK5w0O1r6A0wGtPeydF
	 c7f8D+YU9plv+6u6hzCnmsMO/L5cgF09rlWhN2/s0g9lGZhYeWjeQCiKxKmn0El3ZVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794582669;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Reply-To:Subject:To:Cc:
	 References:From:Content-Language:Organization:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=5EK390bX4i2o2IL2ohT6EbD1TseMnU2HMT4DgAdMKdU=;
	b=qCUiSKfR7B398hWVljcH5c2vw0kIe0DeVVibly53stujmhj0V79FUFKcWbmNb77VFOVQ
	 tvJM0rZ+RzWuiaVUb02mc+9CTxiMrdnPe+kqay9MIExUN9etULopPHsjm65315fj8auQ7
	 K/CeMg/Y5Hku2EgqHFacf8/w/O8Rf6LCiVAIeMouisF+e7B/fpqladur3ZYMCVRIfgmtd
	 5tHuzp0n7Tc884ZiowXWaGVfTxpKeNtihnAluEH36ESrjT/wyIkQFC2aYVzSEzwjWyNQr
	 YVVJ6YUp70UrQmp+rqfqZaXPeg59tLk9mSuL1lNZvUIK6alVTC13Hib8pFNuzpBHOyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=6wind.com;
	spf=pass smtp.mailfrom=6wind.com;
	dkim=pass header.d=6wind.com header.i=@6wind.com header.a=rsa-sha256 header.s=google header.b="Oz4jv/Aj";
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63AA7606A32D
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 15:11:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63AA7606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=6wind.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=6wind.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=6wind.com header.i=@6wind.com header.a=rsa-sha256 header.s=google header.b=Oz4jv/Aj
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4af52002471so2161155e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 07:11:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=6wind.com; s=google; t=1794582668; x=1795187468; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5EK390bX4i2o2IL2ohT6EbD1TseMnU2HMT4DgAdMKdU=;
        b=Oz4jv/Ajueh5dt7S8MNTbmUbzizV81pAVlsmlQLBQWFGNJP/avGaIhwIKkkLlL28fM
         u0v4FnMZYPjrWKkwdbA/xfWapJ4ARkAc99qHoCVB2vxtAFP8Kh2UMV5gohyv/YQXyCyQ
         mQCBBx5xN+i8iMTrbTIqUfmrQDUE9WtbVu5Tnd23SC6oIHb8b9iIlZC0oFHloklF4FTm
         oFLX1iOQWrtUf1GAhepJC12tPDNFrAyTf/fPsytLKkT3sEKqrcA9zCY49FVcByRJJe5q
         nwBXvslQjCgbijhxJ35l1MgXXMNPXB5ZiG24XVAL8uXzreoEmYeFdNV99YJd+2NjQp9I
         DLbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794582668; x=1795187468;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5EK390bX4i2o2IL2ohT6EbD1TseMnU2HMT4DgAdMKdU=;
        b=Uc1NQb9Z0Gjy5R5Oky1x9Z2ZwCh8u4GzgMgN/zxaaRD6P69Gzi+6KU/f6Rp38CopgS
         fVPx9rEwOO+esPzn/8rW8IkQk1MpsB6xUPjpjPAFlhtcty3iFtL9VCqL4IXR/E6HainB
         6EXenzR/Ewy8PB/6cVpWEka9EeXd34Ozki0uEOR3C9HLUKJ0OqUCgQQDCtE9+bPTedAx
         gBfWsEB6R5s7dxMz6wf0a0lIQCtymJmHYdfzB7ZSU85amyJ5kcUwxOD8cVPhLTQzC/0x
         Yy6xf+p+kSF3VhA1TokcMV+gJyOlNXJIspY8jksw8nCiwRV1UYSbLcWvi0oj5IW7vbin
         owuw==
X-Forwarded-Encrypted: i=1; AL+hErEnyOQthFN7xuMJYf8/iKpsqxZV0q0XHon72bpTCnRQ675pz8pGQ8ew5q7UzYatJ7T1KvXIroIwty+Zo2o=@vger.kernel.org
X-Gm-Message-State: APuU4Z8WHKWpi6X0EpV/+3bU0Jw5YYvqAEygMWbPFdlB9Ky7x57a+as7
	5Lb54y9l+iJVfSTHFG5AzNzSK0Vt3ovHh2Unt6GNyBe0zf98+GRQ8KufKC0U3DWq+98=
X-Gm-Gg: AYBFou2W59+4sUu0P0oq810zhLac3sTZPuukfne8TF4bkYfKPtylaxEIyu+CLHHT8IW
	389THmW1epLgvtZUqRB2uVCew7eOG6Po+1Kf5F+I6+SUlMGrBkhVaRE0LzcuTiRY3ENnKBHPA+y
	xTKJHfnoje1bLMswBJynPf7D0Y3maWo34nPu9Ecynn3WIBfJpsk4jsd9tGn5x5FVNMOa/CVM5Lv
	pkRJL9zbBVUPxfP6Ul5ZJGHvR0ZzUeNovRIxFcmFLNqnE4Whe2clLHD+S+gUh1TBvg0AegixVoi
	Y5S7yLGB6lXbbTt+iRlZBwigUXEaPaEZChpp7aVztz9m+kjby/hZtFFJwevtJdWJl7enzbXuW4b
	WjWz5MTM9Yio5cZ6eaG0vCp2MqRJiWYQPs5BKVuihXznNOywYW+WTRem1TGN/Si73Ir2iV88bbD
	e/ky42fpgcEj5tf+a5/NxZiDG88ivMnRahU957w6NiLz0eabF8dz6lDnso4EWnj+JMK88tggQ7v
	iqhM8TFr3LOS3aoVgx5JshLrapiBLhSFnT67Ho3sdT6657efWoF1AAS6mDRxHlZ80YDgMCtJweH
	pIppiii+fxd3vKEWn6RSMG3nNwx1CwYHzuWd+Lap6wCtJY2hB3WFJjYWjZ91pXFmCeYRZasKrSH
	E8G3VpCMV0S3dveqLimxPWVoM3wc=
X-Received: by 2002:a05:600d:644d:20b0:4a1:b027:99ef with SMTP id 5b1f17b1804b1-4bb55a3f05cmr48662755e9.2.1794582667636;
        Fri, 13 Nov 2026 07:11:07 -0800 (PST)
Received: from ?IPV6:2a01:e0a:ab7:2110:6a1d:efff:fe52:1959? ([2a01:e0a:ab7:2110:6a1d:efff:fe52:1959])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb5f350d51sm3215855e9.4.2026.11.13.07.11.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 07:11:06 -0800 (PST)
Message-ID: <2a362c31-2659-4a5d-a7b5-a50f646020b9@6wind.com>
Date: Fri, 13 Nov 2026 16:11:05 +0100
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
Reply-To: nicolas.dichtel@6wind.com
Subject: Re: [PATCH net v6] genetlink: Reject joining multicast groups no
 family owns
To: Anil Kaushik <anilkaushikwireless@gmail.com>, netdev@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Ido Schimmel <idosch@nvidia.com>, Jacob Keller <jacob.e.keller@intel.com>,
 Jiri Pirko <jiri@resnulli.us>, Florian Westphal <fw@strlen.de>,
 Mat Martineau <martineau@kernel.org>,
 XingWang Xiang <v3rdant.xiang@gmail.com>, Alice Ryhl <aliceryhl@google.com>,
 linux-kernel@vger.kernel.org
References: <20261112094205.1120090-1-anilkaushikwireless@gmail.com>
From: Nicolas Dichtel <nicolas.dichtel@6wind.com>
Content-Language: en-US
Organization: 6WIND
In-Reply-To: <20261112094205.1120090-1-anilkaushikwireless@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Le 12/11/2026 à 10:42, Anil Kaushik a écrit :
> genl_bind() checks the GENL_MCAST_CAP_* flags of a group only when a
> family owns it. For a group ID that no family owns, it returns 0, so any
> user can join it.
> 
> A family registered later can get that ID, and the socket stays a member:
> nothing checks it again. An unprivileged user can join the free IDs, load
> a family module with CTRL_CMD_GETFAMILY, which calls request_module(),
> and then receive the notifications of a group with
> GENL_MCAST_CAP_NET_ADMIN or GENL_MCAST_CAP_SYS_ADMIN. For example the
> drop_monitor "events" group always gets ID 1, and is free until the
> drop_monitor module is loaded.
> 
> Fix by returning -ENOENT from genl_bind() when no family owns the group.
> There are no group flags to check before the family registers, so this
> applies to privileged callers too: a program that joins a fixed ID such
> as NET_DM_GRP_ALERT before the family is loaded no longer gets its
> messages. I don't know of a program that does this. One that resolves
> the family first still joins.
> 
> bind() takes a mask of groups, and most IDs in it can have no owner. Such
> a mask used to work, so keep it working: netlink_bind() skips an ID when
> the bind callback returns -ENOENT, and joins the others. Only genl_bind()
> returns -ENOENT. A skipped ID is not joined, so it is no longer in the
> groups that getsockname() and NETLINK_LIST_MEMBERSHIPS report.
> setsockopt() returns the error, as it asks for one group.
> 
> This does not cover a family that is unregistered between the check and
> the point where the membership bit is set.
> 
> Found by the Sashiko review of the gtp multicast group fix. Tested as an
> unprivileged user who joins all free IDs, then loads gtp and
> drop_monitor:
> 
> Before:
>   joins: ok=62 EPERM=2
>   gtp/gtp (ID 15): member
>   NET_DM/events (ID 1): member
> 
> After:
>   joins: ok=19 ENOENT=43 EPERM=2
>   gtp/gtp (ID 15): not member
>   NET_DM/events (ID 1): not member
>   bind(), an owned group and free IDs: ok, member of the owned group only
> 
> genl_bind() was added, with its first capability check, in the commit
> in the Fixes tag.
> 
> Link: https://lore.kernel.org/netdev/179324692107.3134.14443689892607921337@kernel.org/
> Fixes: 4d54cc32112d ("mptcp: avoid lock_fast usage in accept path")
> Signed-off-by: Anil Kaushik <anilkaushikwireless@gmail.com>
> ---
> v6:
> - Drop patch 2 of v5, as Jakub found it too ugly. A family unregistered
>   between the check and setting the membership bit is not covered.
> - Say that early joins to fixed IDs stop working, also for privileged
>   callers, and that NETLINK_LIST_MEMBERSHIPS changes.
> - Document the -ENOENT meaning on the bind member.
> - Rebase on net/main.
> 
> v5: https://lore.kernel.org/netdev/20261104092125.211537-1-anilkaushikwireless@gmail.com/
> 
> I used an LLM to help write and review the code, the tests and the
> commit message of this patch. I checked and tested every change myself.
Could these tests be added in selftests?
