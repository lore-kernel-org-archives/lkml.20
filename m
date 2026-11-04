Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793772362;
	b=XlJumX6Pfu3J7mj9nYoPp2ENBaNQ/TsEN9r6r7yk/XukKuroLWUYPTAzvX9xjSEV/2ud
	 QErmMBgL/eq3tXW82rOzN4xdYy9r+ovvuzl2Wf9AYlyQyO65OlmQWjO7aX2ul4Rx7B35F
	 eA12sq2ZCKY7C/W/rTUDawjfbe7PzQtBtHDt8uY+QrZspEAfjEGN68sEEiKXFvBcXBd84
	 jdqDL7/cu/CPtk+Iqi3fl/3eOmV2oHCVPnZePXJUQbXWumeIUufPlYLbsDTD98Nah8F1+
	 bMJO0vBp7ERfBbuCI5NGiUtKRtnz5R0Svrq2ZYyzqRLYF04zVHccaKnLESUkQySzYkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793772362;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=AYliQvvoP9t2xBU+MfGX2zhe1ZgquUqopej93F/CQ4Q=;
	b=qzufhqbnL0WUJRIDWaQfj1QueHv2xb9RwYFicoENuJYPs3g5rnljCL0hrDjchgPf2/GG
	 Xe7MgRbfeUFTXxxMnakD9+DvmX6H0ajfkcFQxXu9a1NhfGp1vRw3Y9W0xosn5Lpt6qatl
	 U9lGkiYwlMwM4bk6zwnebVkMt6rpwLASrPa60COM8WGEBQhoHriKXoaJWku70xctEaaah
	 LtDZ1cG9p+2FYyNbxPUMY/8rNvFtBNuRnl07gN2p0u8n6v6N/Odz0T95NX7FsSXmz0ypj
	 lvHJrSg6ifMO+O9PEe9izw7sArWIhJUMVpbcmC1oGS5ln8e5xIpOeB7HbOWXXgpQJpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	arc=none smtp.remote-ip=91.218.175.55
Received: from mta0.migadu.com (out-55.mta0.migadu.com [91.218.175.55])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9A34606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 06:05:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9A34606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=AYliQvvoP9t2xBU+MfGX2zhe1ZgquUqopej93F/CQ4Q=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793772354; v=1; x=1794377154;
 b=tG0OTtk0f8ZcYcb+ozibhuTIE8MGWeWV43lqRPVcurrDR1RPMyw+7dPAjB2cpk+w+/sPh3WS
 H+cFhr11CppQ5DHLndMniEipQaOax5wvG23fFvUUerj5ERLXqGc+CrFbyriCPuNDOwogw40Z5mT
 Yx1TxtPR9oycfNTCLEH74xAA=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id ba0b2edfcf9ab841;
	Wed, 04 Nov 2026 06:05:54 +0000
X-Mizu-Trace-ID: ba0b2edfcf9ab841
X-Migadu-Flow: FLOW_OUT
Message-ID: <b0e5f200-1860-4222-afc3-8d67161ea1c1@linux.dev>
Date: Wed, 4 Nov 2026 14:05:38 +0800
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
Subject: Re: [PATCH net-next v4 5/7] ipv4: convert do_ip_getsockopt() to
 sockopt_t
To: Breno Leitao <leitao@debian.org>, David Ahern <dsahern@kernel.org>,
 Ido Schimmel <idosch@nvidia.com>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Eduard Zingerman <eddyz87@gmail.com>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>,
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>,
 Emil Tsalapatis <emil@etsalapatis.com>,
 Ihor Solodrai <ihor.solodrai@linux.dev>,
 John Fastabend <john.fastabend@gmail.com>,
 Stanislav Fomichev <sdf@fomichev.me>, Shuah Khan <shuah@kernel.org>,
 Eric Dumazet <edumazet@kernel.org>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
 david.laight.linux@gmail.com, kernel-team@meta.com
References: <20261103-sockopt_expand_out_v2-v4-0-2d36da923578@debian.org>
 <20261103-sockopt_expand_out_v2-v4-5-2d36da923578@debian.org>
From: Jiayuan Chen <jiayuan.chen@linux.dev>
In-Reply-To: <20261103-sockopt_expand_out_v2-v4-5-2d36da923578@debian.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 11/3/26 7:01 PM, Breno Leitao wrote:
> Convert the SOL_IP switch and ip_mroute_getsockopt() to sockopt_t, its
> last leaf on a sockptr_t pair. The IP_MSFILTER and MCAST_MSFILTER
> bridges go away.
>
> ip_getsockopt() builds the sockopt_t with sockopt_init_user() and
> writes optlen back unconditionally, because IP_OPTIONS and others
> report a length and can then fail. ip_mc_msfget() therefore stores its
> length only after its last copy, so a copy failure can't report a
> changed one.
>
> The write-back also happens before the netfilter fallback, so an
> unwritable optlen turns any error into -EFAULT and skips the fallback.
> Likewise optlen is now read before the level check and the MRT_*
> dispatch, so an unreadable or negative one wins over -EOPNOTSUPP.
>
> IP_OPTIONS with no options set and IP_PKTOPTIONS used to return the
> result of copy_to_sockptr(), the number of bytes not copied, so an
> unwritable optlen made getsockopt() return 4. They now return -EFAULT.
>
> sol_ip_sockopt() builds the sockopt_t with sockptr_to_sockopt() and
> stores optlen back as well. This extra code will go away when we
> convert sol_ip_sockopt() to talk sockopt as well, but for now we are
> converting the leaves.
>
> Acked-by: Stanislav Fomichev <sdf@fomichev.me>
> Acked-by: Ido Schimmel <idosch@nvidia.com>
> Signed-off-by: Breno Leitao <leitao@debian.org>


Reviewed-by: Jiayuan Chen <jiayuan.chen@linux.dev>

