Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 904654F85D4
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792418946; cv=none; b=tQ04VJdLJ1SdJvnfuXIAQ9byHeiQZ0ComI9eVza2oV760v/mpJp+iQtzQXZwxnaVVPa6cfJKzzgYX/QAhVGc2g8EFKCG8Wsg1yA6i5QGP4FQO+HyAWAuwzdeBhqardq8OxQrjedSbLy2XqIbZ+lliSwC4E4sSVFMgtNov5Bx6Q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792418946; c=relaxed/simple;
	bh=Bb1oQJJb8bBWJ50lmw1B7ERzmHGFObf98zGv2XjADM4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LUqPbUyYRtuIWF2WTMhkYEXCMLCJTodwPN5tvqGBPmMlYXDqFNDFVmHfzMVD9iT2L7J2QDEF43liRu8+CGmTYGURuzXu/fyVEsn+WI5bsRjy1NqCc5ym/+QJHq0h5M8ZIE6K6c2Ap85/c8CH0Wi058y+TU1r2DTuqq7xyrPjBN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IhFi+PUL; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=U880YE9c; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IhFi+PUL";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="U880YE9c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792418943;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZRK1BzG8yA6E0e6lr2UnuvkDmeyhqnlz73tj/pxCJpU=;
	b=IhFi+PULJEdTn/o2Wq4aTY+1VsaO+f8pPU+7Bg0FerKtsK+Fyff+YAQwCq0vLWaRuYmhLc
	90OO15G8wS8Yel7J6pEOUNcpDuOokXWLvu6+4tgX6x0odqsHiP6LmrDWgSnXUjfKhNttzL
	NXmXLu2FGwErePOtgjzeuuXaCJJ1klg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-595-raBokWLsNo2lnmg0N0n1Mg-1; Mon, 19 Oct 2026 14:09:02 +0000
X-MC-Unique: raBokWLsNo2lnmg0N0n1Mg-1
X-Mimecast-MFC-AGG-ID: raBokWLsNo2lnmg0N0n1Mg_1792418941
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4a1de9dac94so13079265e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 07:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792418941; x=1793023741; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZRK1BzG8yA6E0e6lr2UnuvkDmeyhqnlz73tj/pxCJpU=;
        b=U880YE9cNEgLsv1io2MgYfbdDp01nkckTeHKw7tYZ+fQOGodlAnJFYEY4xu82k2+BT
         mqEn5wyvMnS2jK77hMsZFKy7dI0jQbj7hJECK3rSV3oI5srXkxBUOENAPSmh60bF2J5X
         2/JuHoJk8pKH0HLWRAc5cSBmT8O0TQZK0OzqA5yxHrJMOB7VqZYQysXiLm6Ivplr3Iae
         0b7UUfKwadTwyErOaSvP2u3+eddIEg63Jv3Xql3+gsceK/iux0Hpntey1DXqhn70rTeD
         DACKcMyG/YuBI5UeFIskD/nTVzqiE3M06hUIsnEjm4YX5lnyrVpVZAtrJn5GDcDwrl4F
         kqdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792418941; x=1793023741;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZRK1BzG8yA6E0e6lr2UnuvkDmeyhqnlz73tj/pxCJpU=;
        b=pjKcuXUoTWC9q4/07xhJ3VLruR+lpuRCsINB8VoMVTHLJoklDQi8ZlmWQttmAbZUb4
         uCyiSyqgUKVDIQOV7L4If/MFJbSIS0910bw4yMnzTsslkIUaSoR+ykP0GzitYYFUcP63
         UWL34FAFJbOt48fzs+c1AW8rTehd4s8he9WZLUc8eApptIs38woYAACiSvv/VSXJdaUP
         cEROoozAn4XSegJShqWC1fQOaqLEnE3ewyt2bedJJDkGUeMkMTQDatNNOwhSDP+BL6jQ
         BFsmfXa48gReReij23p3fh1/ZOYLXauXo7lsBM7nsGPbnTSONZAyrUwRdOK1eYlFxL3S
         cU5A==
X-Forwarded-Encrypted: i=1; AKwUvByJbIw392MYWJf9POxPHdHmpvhswOM5RqSSjIeFy/HYjAduSmX+l6QC88Gv2mARSAUrorOn5EWHRMHv1bA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIq+M+3JtqpU5vEMwC4RvmO107tZOwx+l4mtmM2JtmChAP7TkMR
	BWcmn5u4krbO2vDiKoErNy/q87mW9ozGYzoOgQrLOuy8CPdhL8J4b8PLgBVf8Pk2+VF6JDZGPpK
	IbZWeueTuVSsOVgmDPujR+fMFV2WQkZzE6p0ID0hYMrcEDmhsbAnnwr7I35kU1ls0Gg==
X-Gm-Gg: AYBFou3KKO/AOBF+2mx4aWwVd4HxNeHdqh4+d66VxS9mphzzQ9V2jv58Bzh+IRk72UM
	Z0bM4jcQ3OcNzFPrg4SM+tvSMX9e0upj0zI++xmY2Yt53+U3clWegUhWKhoPTGwvIDhn5W4AL/X
	hlFGEFoDNXo2aT21CPX6y52O0s20PEAudNJcWlLL7ylA+IdyIJczQzOFR2DTd0Dc4ojPMM7FhAe
	9tNEXjBmk/bzOzJtTwFMlsVftTOPDAmkZ7no3imKnE4PsnGJmUO43s91bJ/gvIhWTZ6cULtCn6B
	dC6N752XxDpx0kRQ+vcOHkWEyqiRxtrQPy0Lhu+vZmUYEpct3v3xP/SdjEfKYBFnPmjEMgzHYnv
	rNHHzoClP4TOptWzfmxXF2JAUs29XlxYkyFvTtY8H0znJVzhVuLQ4fTPMEtqpkQee//zQA5Sd7Q
	==
X-Received: by 2002:a05:600c:314f:b0:4a1:e6c5:e44c with SMTP id 5b1f17b1804b1-4a1e6c5e47amr69109485e9.10.1792418940812;
        Mon, 19 Oct 2026 07:09:00 -0700 (PDT)
X-Received: by 2002:a05:600c:314f:b0:4a1:e6c5:e44c with SMTP id 5b1f17b1804b1-4a1e6c5e47amr69108755e9.10.1792418940267;
        Mon, 19 Oct 2026 07:09:00 -0700 (PDT)
Received: from [192.168.188.234] (ip232-47-231-195.pool-bba.aruba.it. [195.231.47.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1df164777sm193091345e9.5.2026.10.19.07.08.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 07:08:59 -0700 (PDT)
Message-ID: <8696d555-0428-49f3-ab03-e052a7d51213@redhat.com>
Date: Mon, 19 Oct 2026 16:08:57 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] ip_tunnel: reserve headroom for the encap header
 before pushing it
To: Theodor Arsenij Larionov Trichkine <theodorlarionov@gmail.com>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>
Cc: Simon Horman <horms@kernel.org>, David Ahern <dsahern@kernel.org>,
 Ido Schimmel <idosch@nvidia.com>, Christian Ehrig <cehrig@cloudflare.com>,
 Alexei Starovoitov <ast@kernel.org>, Tom Herbert <tom@herbertland.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261010223601.1193655-1-theodorlarionov@gmail.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261010223601.1193655-1-theodorlarionov@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/11/26 00:36, Theodor Arsenij Larionov Trichkine wrote:
> ip_tunnel_xmit() and ip_md_tunnel_xmit() push the FOU/GUE header in
> ip_tunnel_encap() before skb_cow_head() reserves headroom and unshares
> the header. A packet redirected into the tunnel by tc mirred or an nft
> netdev fwd only has the headroom of the device it came from, and
> fou_build_udp() hits skb_under_panic(). With a mirred mirror, the push
> overwrites the Ethernet header of the original packet instead.
> 
> Reproducer, run in an unprivileged user and network namespace:
> 
>    ip link add dummy0 type dummy
>    ip addr add 10.2.2.1/24 dev dummy0
>    ip link set dummy0 up
>    ip link add ipip0 type ipip local 10.1.1.1 remote 10.1.1.2 \
>            encap gue encap-sport auto encap-dport 5555 encap-remcsum
>    ip link set ipip0 up
>    tc qdisc add dev dummy0 clsact
>    tc filter add dev dummy0 egress matchall \
>            action mirred egress redirect dev ipip0
>    # send a UDP packet to 10.2.2.2
> 
> skbuff: skb_under_panic: text:ffffffffad28b5cf len:49 put:8 head:ffff888010217740 data:ffff88801021773c tail:0x2d end:0x180 dev:ipip0
> kernel BUG at net/core/skbuff.c:214!
> Call Trace:
>   <TASK>
>   skb_push+0xcc/0xf0
>   fou_build_udp+0x2f/0x380
>   gue_build_header+0xfa/0x150
>   ip_tunnel_xmit+0x87f/0x21c0
>   ipip_tunnel_xmit+0x472/0x4f0
>   dev_hard_start_xmit+0x139/0x680
>   __dev_queue_xmit+0x11e4/0x3520
>   sch_frag_xmit_hook+0x10a/0x190
>   tcf_dev_queue_xmit+0x44/0x60
>   tcf_mirred_to_dev+0xbf8/0x1060
>   tcf_mirred_act+0x612/0x11b0
>   tcf_action_exec+0x1d9/0x8b0
>   mall_classify+0x16d/0x1e0
>   __tcf_classify.constprop.0+0x121/0x710
>   tcf_classify+0x8d/0xc0
>   tc_run+0x342/0x590
>   __dev_queue_xmit+0x9a7/0x3520
>   neigh_resolve_output+0x44c/0x780
>   ip_finish_output2+0x6e8/0x16f0
>   __ip_finish_output.part.0+0x1bb/0x350
>   ip_output+0x2ad/0x4a0
>   ip_send_skb+0x195/0x1f0
>   udp_send_skb+0x758/0xcc0
>   udp_sendmsg+0x1634/0x2050
>   </TASK>
> 
> Call skb_cow_head() for the encap length at the start of both
> functions. ip_tunnel_xmit() reads tunnel->encap once, so a concurrent
> changelink cannot change the length between the reservation and the
> push. The GRE callers and ip6_tunnel already reserve this headroom.
> 
> Fixes: 56328486539d ("net: Changes to ip_tunnel to support foo-over-udp encapsulation")
> Fixes: ac931d4cdec3 ("ipip,ip_tunnel,sit: Add FOU support for externally controlled ipip devices")
> Signed-off-by: Theodor Arsenij Larionov Trichkine <theodorlarionov@gmail.com>
> ---
> Found with a syzkaller-based fuzzer.
> 
> syzbot has an older report with the same title, fixed by c88f8d5cd95f
> ("sit: update dev->needed_headroom in ipip6_tunnel_bind_dev()"). This
> is a different path: redirected packets do not get needed_headroom.
> 
> Tested on net af32da41b032: the reproducer above and an nft netdev
> egress fwd variant no longer crash, and a GUE ipip tunnel between two
> namespaces still passes traffic.
> 
>   net/ipv4/ip_tunnel.c | 23 +++++++++++++++++++++--
>   1 file changed, 21 insertions(+), 2 deletions(-)
> 
> diff --git a/net/ipv4/ip_tunnel.c b/net/ipv4/ip_tunnel.c
> index e6bcf01411d0..38ab3c3bf5c9 100644
> --- a/net/ipv4/ip_tunnel.c
> +++ b/net/ipv4/ip_tunnel.c
> @@ -579,6 +579,7 @@ void ip_md_tunnel_xmit(struct sk_buff *skb, struct net_device *dev,
>   	struct rtable *rt = NULL;
>   	struct flowi4 fl4;
>   	__be16 df = 0;
> +	int encap_hlen;
>   	u8 tos, ttl;
>   	bool use_cache;
>   
> @@ -587,6 +588,11 @@ void ip_md_tunnel_xmit(struct sk_buff *skb, struct net_device *dev,
>   		     ip_tunnel_info_af(tun_info) != AF_INET))
>   		goto tx_error;
>   	key = &tun_info->key;
> +	encap_hlen = ip_encap_hlen(&tun_info->encap);
> +	if (encap_hlen < 0)
> +		goto tx_error;
> +	if (skb_cow_head(skb, encap_hlen))
> +		goto tx_dropped;

This looks like the wrong solution?!? I suggest instead adding the needed
skb_cow_head() in {fou,gue}_build_header().

/P

