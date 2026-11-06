Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793976924;
	b=U6+udi0+eQgJnPKRRnbaMebrKaD/kVTiwV/natzItgyxjKXMHkmg2uoi71gv1JcHB/KC
	 kBo3/m+8Hj8ITaxP5ourFWdn6Oh4ouh66x5Wjpu6Us3AZypeBcUzNQ6HNo3HVhY4cLC0S
	 XVY2DgXVaORjFyoGQ3VIYMVf8VGDASBoNFzXoCjTnq7el9VrP1sgWQfJZ121WAj0VwAzQ
	 y6BUGuMXjvaEr+SQB8ZH6pWUQWCmizFTb73meaO6kYb+8K69Ft924CgQ9Samhjn/7XLVC
	 UAmfHrUiOI7/GvKs09vjpBG0calyd74lBRYvQTeEzRh2vqWisWeQgJFS7Mp4OXwnWAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793976924;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=CEvqs1X/nNyjFGF57/UwB1GPydCvgLvUiPVC3sYODKY=;
	b=hZ4PmgwzAJOwOntGzmIUwxF11t7hiVTGorre+HLHiW8Rm5FTO2lJNxlyaOJESMIUDNbF
	 PVr4Qm6u0k2e2u1IqtMcxFm4TUF+VrPrYnZLCohCcjOCX7wdnuXMgFmoGHewwLB3c3+3C
	 htq8XtCrK5dEMNxEZPW4DQGKp6tXObByCsJe9XsSgQM3CxVaHwDyqvuY/pgB4pwaMyVhD
	 jzS3/h0C3pmtHqvV70Z97bMjgbPIp9TqCqhHcEM9DqH3l+uFaaiQmDy+SG5qC4DxNF8pE
	 ltObKOXrpAGaPc5i+z9bTxA1kqB/h+U9Aav1RZpg5C3JFCqdO/lD1DdKGRPC3Vf5G7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pvEcq5EW;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F0B8606A331
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 14:55:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F0B8606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pvEcq5EW
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3b0d0b80fb9so444822a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 06:55:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793976923; x=1794581723; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CEvqs1X/nNyjFGF57/UwB1GPydCvgLvUiPVC3sYODKY=;
        b=pvEcq5EW5p5RyHhNApIpanjG+XM0py0wkLCpq1Xoa3Rz+fpzGcOAiH/VQsXsemgM2S
         9/PT4v1X1PrWv/6wko+hr5538Uzoi1ZxC/AFsLOhd+bY+DRPLkKcZleqOOGtCDQoD8M1
         mM+eeXRYItk6md6ykyYNeDjO7DnyXRssj+9poenaAlETqHqgC2ei9cd5PQGhXJvEHMpk
         kpIkYRIWkVJQf+Vzm9fgwIXNAbdVd8ZfceNtJOW4YQRZKD/LlADYQsXXuNKPzzq4wbV4
         10BaI/kiV81y1PXRDYlGI2+oI5LvaqZsbIOBT6KGXLMGbic1FIcM+oW6WCpBUL7XCdmP
         vB+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793976923; x=1794581723;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CEvqs1X/nNyjFGF57/UwB1GPydCvgLvUiPVC3sYODKY=;
        b=i9C2TQJGF/6oAIXdotJBajKofQcw/3dQdwTXAOms83q3eDqrBXpJdHmS2e8B6WZtoN
         J+ZbaxmSBXEH9lmHlmYTkY3eaGlcVvNPQt/16PGHbMbnFmuCeSpm0XV/reBu7hq5ntaV
         3+W6GSTi7OgWBMUwl5LDphVSviPgI005EyeEfz/BxHTSt8JnqxZl/nDoFNb8qbvMslYW
         HD2mw6Bn+36PQmpNC4LnqNC7iBJvxYgl0FrbhqdEAoIjrpiBd3ltmpN/2AUAOykWIucW
         X95ho82MwOf8lGN9+XrdJm/Rj24sTBAEIzXwmgpWFTryA2WXpxm0rtx63DQDS9N4tmHn
         3lFQ==
X-Forwarded-Encrypted: i=1; AL+hErHPJRjEaJuDwbICy3f8xWBVI/4py4kxUu6kWfI6wnfHx5nYICmJXQ17mr6+VO9EQ6Jska465cZu8/pz1NQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/q/OIP5q6TkVoMOgnOClGkC8c9G2rlZPk+BtZ/XvvNdzsjO6y+
	AVYBGAp8NxU5i5EZc/CGu6ZOJ85TaSemlh1uQdaEY96DXCfp7Mzzi85D
X-Gm-Gg: AYBFou2czOKp90Ogfy1xFwxbDsvwFQ1FiqAhbvzLPd/4cWQ2dBfb9IHB56Znt4pwUwR
	vLXQf9tvzwnffWRdutPyoLkXfqw1Rmi/DLMlvUrk2ORA/ZeI347ZEPuxMtxtWG0CPJXttJjWpRH
	EWGiOfrTrvMoBo5nPtX0jKGl5xcUcyrSILTYX/YmbD9G5AIm37Va+bVIf+b5mPEHOr9UB9/EVp8
	6qL1T2LhInSiO6V3WGrOPTR8bXoVd6eFf0y8EkwSUJpGlyEiuIMU59ygx7Sa+FWAzBUm1LiUtGJ
	eZIVOjUXzpMyCXtj/cu3jdwz7Kbm5bXBXPn+FUa29telcln+VVSd2I3N4IJ/F5OnaWX9q7p8Y8A
	tslbiX6ojd/UUfZrmABGNhBaDJgNxLaduNl/JSRNgK/qWY1fOSzzdil5wcYz/fyUPgsEYh9nY+k
	WsifIH6sI15uneCMDvsyXnyUTyKymj8+dMXj1BFMCuQgHI9o4dDB1E6qr0dMn5ti9O4a3dFOhsO
	jYOw3/8w+0ETYqtxZi2r5Csq2sq8r1shOjCPa9XxMBuiRDWy/LP2VaY01Ch+GN387JCsgFVv1B6
	0rrE7IefIgMG8L7+vC/sQ+LXluFQhC9QGGBu6w3eGke65ULsr574sDU=
X-Received: by 2002:a17:90b:2d85:b0:3ac:83c1:2c0 with SMTP id 98e67ed59e1d1-3b0db700c35mr2482629a91.64.1793976923367;
        Fri, 06 Nov 2026 06:55:23 -0800 (PST)
Received: from [192.168.255.10] ([111.55.212.67])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0d7c42a72sm3783225a91.3.2026.11.06.06.55.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 06:55:22 -0800 (PST)
Message-ID: <4c5e04a6-afba-4f7e-b790-c109ddad0318@gmail.com>
Date: Fri, 6 Nov 2026 22:55:10 +0800
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
Subject: Re: [PATCH net] net: reuseport: avoid duplicate closed socket
 insertion
To: netdev-bot+sinfo@kernel.org
Cc: Eric Dumazet <edumazet@kernel.org>, Kuniyuki Iwashima
 <kuniyu@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Willem de Bruijn <willemb@google.com>, "David S. Miller"
 <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Simon Horman <horms@kernel.org>, Martin KaFai Lau <kafai@fb.com>,
 Daniel Borkmann <daniel@iogearbox.net>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, TencentOS Corvus AI <corvus@tencent.com>,
 stable@vger.kernel.org, Lin Jiapeng <jiapenglin@tencent.com>
References: <20261106135841.418-1-ljp1205831794@gmail.com>
 <179397371960.488859.17332481477084448537@kernel.org>
From: Lin Jiapeng <ljp1205831794@gmail.com>
In-Reply-To: <179397371960.488859.17332481477084448537@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2026-11-06 10:01 p.m., netdev-bot+sinfo@kernel.org wrote:
> Hi!
> 
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
> 
>   - Whether the issue was actually triggered, or is only theoretical
>     (e.g. found by code inspection). If it was triggered please include
>     the symptoms, like the stack trace or error messages.
> 
> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account. If the series needs another revision for
> other reasons, please include the information in the commit messages
> then.
> 
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.


The issue was actually triggered, not found by code inspection.

Reproducer outline (unprivileged, uid 65534, inside a fresh user + network
namespace with net.ipv4.tcp_migrate_req = 1):

   1. Create two TCP listeners in the same SO_REUSEPORT group (one is kept
      hashed as an anchor).
   2. setsockopt(SO_REUSEPORT, 0) on one listener: sk_reuseport is cleared
      but sk_reuseport_cb stays attached.
   3. Repeat connect(AF_UNSPEC) + listen() 129 times on that socket. Each
      disconnect goes through inet_unhash() -> reuseport_stop_listen_sock(),
      which re-inserts the same socket into the closed section until
      num_closed_socks exceeds max_socks.
   4. The 129th insertion writes socks[-1], which overlaps reuse->prog on
      x86_64. Attaching a classic BPF filter with SO_ATTACH_REUSEPORT_CBPF
      on the other socket then consumes the struct sock pointer stored in
      reuse->prog as a struct bpf_prog *.

Kernel: v7.4-rc1 based tree (d68ce4e71248), x86_64, CONFIG_KASAN=y,
CONFIG_UBSAN_BOUNDS=y, QEMU.

Symptoms, first the out-of-bounds write itself:

   UBSAN: array-index-out-of-bounds in net/core/sock_reuseport.c:152:9
   index -1 is out of range for type 'struct sock *[] 
__counted_by(max_socks)'
   CPU: 0 UID: 65534 PID: 22 Comm: poc
   Call Trace:
    __ubsan_handle_out_of_bounds+0x91/0xa0
    reuseport_stop_listen_sock+0x290/0x310
    inet_unhash+0xd5/0x400
    tcp_set_state+0x125/0x260
    tcp_disconnect+0x47/0x1950
    __inet_stream_connect+0x2d0/0xab0
    __x64_sys_connect+0x71/0x80

then, after SO_ATTACH_REUSEPORT_CBPF is issued on the second listener, the
corrupted prog pointer reaches the RCU free path as a struct sock *:

   Oops: general protection fault, probably for non-canonical address
   0xdffffc000000008e: 0000 [#1] KASAN
   KASAN: null-ptr-deref in range [0x0000000000000470-0x0000000000000477]
   RIP: 0010:call_rcu+0x10d/0x260
   Call Trace:
    ? reuseport_attach_prog+0x6c/0x140
    reuseport_attach_prog+0xdd/0x140
    sk_reuseport_attach_filter+0x97/0xf0
    sk_setsockopt+0x973/0x1cc0
    __x64_sys_setsockopt+0xac/0xc0

   followed by "Kernel panic - not syncing: Fatal exception".

With the proposed fix applied, the same reproducer completes cleanly: no
UBSAN report, no oops, the SO_ATTACH_REUSEPORT_CBPF call and socket
teardown all succeed, PoC exits 0.

I can share the reproducer program if that is useful.
