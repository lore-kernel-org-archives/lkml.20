Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793290249;
	b=Yi5BydLcJhjk1+rqtEOrHHMTIpSpLNfMskc3bSqWEw7MJsD3BaG6HopYH6URPJPfYxVK
	 WvSDSwSEgIkoI/UlZ9AWI6sJfT9toKWU3GtQ0x+nUAqBMgI7uq1vukMwvTm2J0J0/Up9z
	 G57i4QzTojnbGPYe5W/E1NctkN0N2tKiMm8tkXfSebigeqzpJ43G+bJFgup8bGgNyOCau
	 Z0KypvyWStH3iLNPruHoE+0Lku17mNulYlyS9Y62s/B8z11IJSJiNaDHcpSsyiI8Uzjbx
	 AsalOfC08vpdyu/2yMPlr+t3RUJIllc/GiVtDjk9XTZ8mCU4w+uTQSICBPxPkLFsOMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793290249;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=wGitExb5ASqG1hEb2tSa+iqDI3pMKELGUtvIGcSLDEQ=;
	b=qWoMm5pw5PrwiKUUQVSIBlt7vhh1mDJgy43bblZkysXjAhveXnMpfoXm9N4cnGpWvmYj
	 U2LQdjkFhduvMLzRl0I2DnWy8XzRFP3zkFviDFl4MwJ6UUBP6Qm5YjpxzHCXjomme712F
	 ZijhSO+n66LRHmKhDdxfBXhfxURD3/k2iczbty65sPkoEkO0mKCCt6rWozxDbC26Yxvh1
	 V4/ANHPvRrDQ68IxL1bS3rqorCG9nweCZGK3r9vVerTE06BRmUj+H9mbTo39U18YBgRcv
	 dqIyM1abQfoDN5Ch3k1qbNrIEB1afVSFs+ptrppdZuur1xEtFQrJBj6qenBSMvqzTKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BQ1HgAJB;
	arc=none smtp.remote-ip=209.85.222.46
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45C0B606E016
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 16:10:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45C0B606E016
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BQ1HgAJB
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-990fbae94f5so2151133241.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 09:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793290248; x=1793895048; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wGitExb5ASqG1hEb2tSa+iqDI3pMKELGUtvIGcSLDEQ=;
        b=BQ1HgAJBM52AsbQ7tfdFq3gPd99w/14A03ldC+9zCPotdgmBElhQocOdv+zPBbopv3
         /sSlGYpgzZKxyUuURLiPcADtZ+/2b/+asX33xRM9nkV7swnjQ1JGfho3PNwvXQaAwdJm
         OMUAq+L64oXGkKt9nBn83mEEBOjFSMoK8EVw+KnQS0okrCLOFV+xdBozRew+RlguxgDc
         PBvEba/FY/XCihapa3YmOuVXiCd+JkdghOGo6l5oGUnyWfiPXd8kKr3RimsBeLA5EWSj
         M1/wrs8KDYq46uodupnIcnbtKpg/EVX9S0WuBAizCBQnHosJN4Go+QXM7K21B12ID/yr
         o+tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793290248; x=1793895048;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wGitExb5ASqG1hEb2tSa+iqDI3pMKELGUtvIGcSLDEQ=;
        b=aEd3p/MIkaevaj1T83lpqUiB07R1FOXCdDwe/8rPFlPHpp8L4pdLN55qtseNBczc1P
         fe44ZWbUl8nEb3BqDLCd5jlinqWTM7fL8ACe6/WiTxEBlEKXpZQfi9YvsP4bCrh8mvU+
         YQjJKB7Y+/Vr9nmK+2VZYQtNMzlmL/k665XqrPILwFghbH0SdMv4SvLL2bRCuWzXK1Tr
         XSVhqQJUxrDPGKsrO1vigAzUBXVlmJ4Sg7z1IJJnxSmEV6xwbJrAI1QexfgC47l+gzzM
         rFGnrR2pQIUyOxCi/Lzrfwu/zYDo2LApQSuxl5QD3G9bEkAq+mMuX992LQVsE0U0cBKX
         o9mg==
X-Forwarded-Encrypted: i=1; AKwUvBy/FLj/JX9ljCzueWUpKN8v0HhznKWKLFLxfYAJLYFn0vLyMl/tQbJOkSy7U6Xdof93NzYffw6iVoZswZ8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIzQ4F/YGOdYDkZFA8VXsDdapD+zz9I0bPFygVA9gwSZIEDdZfg
	dQ9fm79Yan7uK8Pt2m7c9ly6LJ7w9flVn+v7kfKLjO+yDQDmyJ0o7c29
X-Gm-Gg: AYBFou1SzxcgNDHRk821E9qnxSsqhzxPhQh28+M78vtOMcIoFgmlKyM1emOYQRP7LUK
	FLFLuhrfkscXRfyGyjamEpFuysNtqHa9WQQXTwaeux+JKbVcZbN1aZUarzku0in3JnB825e7wy7
	RW9CVpSwGlopptGRspkumio6m6j+NH/VdoPoriyohPaDOQFrrEF0OFNm9L/s73Y3W6LV6TYRngm
	3b+w9Q+1gJQrzFm9ax9I5m/y6M2yVopzPHUxTAKjBAtdzGU3HTPSU5dxuE1NRX5HOhfubHSQbly
	oSiV40q6ETwzYtF4HtgbWRTKA/jJRJ3y7wb3+VcNP7B0EdgvPEjX/ww8KcZLV9XaQAXXJPlta2j
	hVS1ozNfqq4+quFYQc2ynjsINyGpASJXpF5ZVglsCdlmlN0TYU2i9IQMi2gmeoGGyCl/X2lPlBH
	mI69d7pT875RafaRO95N2DnF5ye1jkMtONHNTb5hTWevKLGCd6hkYWjZmCzXKom461rddlbyfsQ
	0P0DPVuIqelCbSLF5NF1HYTUvSYPvMzlN142Va/LGty+yJPTBnWnfR4VgDxS+CS0ZvyexU/EJa/
	QfNWgkUPw8Wo5G7rBRFqcLRc0tQAtVRhnnskfh0ue/ZaVXfRkpIoFKvtw8h2icr7vyxp04399xk
	9Uq24nWuJidsNIAuRB+jrye4fgyHGCUX1+IcZuJ7VoUq6jTL4iJzYDxuIiPYp0JWEEEZp
X-Received: by 2002:a05:6102:6a92:b0:7cb:bda3:27ab with SMTP id ada2fe7eead31-7d03a504ad3mr3020376137.13.1793290248125;
        Thu, 29 Oct 2026 09:10:48 -0700 (PDT)
Received: from gmail.com (111.46.245.35.bc.googleusercontent.com. [35.245.46.111])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ec4f8dfbddsm5953842e0c.6.2026.10.29.09.10.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 09:10:41 -0700 (PDT)
Date: Thu, 29 Oct 2026 12:10:28 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Ahmad AG <ahmadag1001@gmail.com>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Cc: kuba@kernel.org, 
 davem@davemloft.net, 
 edumazet@kernel.org, 
 pabeni@redhat.com, 
 horms@kernel.org, 
 netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org
Message-ID: <willemdebruijn.kernel.26e1d6a9b487@gmail.com>
In-Reply-To: <CAASqGyZ-9hqZGWNJShxnrSiXDO==51SVsQW_x_mk993y1pNO8A@mail.gmail.com>
References: <CAASqGyZ-9hqZGWNJShxnrSiXDO==51SVsQW_x_mk993y1pNO8A@mail.gmail.com>
Subject: Re: [PATCH net] net/packet: charge fanout groups to the memory cgroup
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Ahmad AG wrote:
> fanout_add() allocates a new group with room for max_num_members
> socket pointers. Since commit 9c661b0b8544 ("net/packet: make
> packet_fanout.arr size configurable up to 64K") that is up to 64K
> pointers, 512 KB per group, from a single PACKET_FANOUT setsockopt().
> The allocation uses GFP_KERNEL, so it is not charged to the caller's
> memory cgroup.
>
> Each packet socket can create its own group, so a process with
> CAP_NET_RAW in its own user and network namespace holds about 512 KB
> of kernel memory per open socket that its memory cgroup never sees.
> In a cgroup with memory.max set to 16M, 256 sockets each creating a
> group with max_num_members = 65536 took 264 MB of system memory while
> memory.current grew by 380 KB.
> 
> Allocate the group with GFP_KERNEL_ACCOUNT, as other allocations a

This is not the only such allocation in packet sockets that does not
account. If addressing that, probably scan all such allocations and
update them in one go.

> user can make on demand in the networking stack already do. With the
> change the same test in the 16M cgroup is stopped by the cgroup's OOM
> killer, and with memory.max at 512M the 256 groups charge 262656 KB
> for 264640 KB of system memory used.
> 
> The missing charge was found by code inspection of net/packet/ with
> the help of an LLM and then triggered with a small test program that
> creates the sockets and groups and reads memory.current; the numbers
> above are from that run. Tested in a QEMU/KVM guest on this tree
> (x86_64_defconfig plus kvm_guest.config, KASAN, MEMCG, PACKET),
> running the test as uid 1000 in a cgroup v2 memory cgroup.
> tools/testing/selftests/net/psock_fanout passes before and after.
> 
> Fixes: 9c661b0b8544 ("net/packet: make packet_fanout.arr size
> configurable up to 64K")

Your email client corrupted the patch.

> Cc: stable@vger.kernel.org
> Assisted-by: Claude Code
> Signed-off-by: Ahmad AG <ahmadag1001@gmail.com>
> ---
>  net/packet/af_packet.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/net/packet/af_packet.c b/net/packet/af_packet.c
> index 823e0911c91..406397acc5c 100644
> --- a/net/packet/af_packet.c
> +++ b/net/packet/af_packet.c
> @@ -1778,7 +1778,8 @@ static int fanout_add(struct sock *sk, struct
> fanout_args *args)
>   /* legacy PACKET_FANOUT_MAX */
>   args->max_num_members = 256;
>   err = -ENOMEM;
> - match = kvzalloc_flex(*match, arr, args->max_num_members);
> + match = kvzalloc_flex(*match, arr, args->max_num_members,
> +      GFP_KERNEL_ACCOUNT);
>   if (!match)
>   goto out;
>   write_pnet(&match->net, sock_net(sk));
> 
> base-commit: c339f4010dea8b0d754f84ace70cd1b089878ef8
> -- 
> 2.43.0


