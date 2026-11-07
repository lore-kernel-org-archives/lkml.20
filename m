Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794038893;
	b=zC3FRBgccvt3odGcP1R2DcSOm1qijoRjxxaJE0MERXLhhRK5SSoVYLYbXScIt/GX6FtP
	 11DhcQxNar+ZvpXfCyhLEUuYsp7U1j7zfjYOaxMT4OAp8unPkyh9bEPPXwa3cltNEG1O8
	 zHfyJ9tahyBYWIsIqse7U2Y8MI3+HwULPCY/7AHjMekYmsfV9vlFgP8yAkTj5j86wjaTg
	 tXrVqMtphdNvfEXxsL9P7/93S702SDSJTcUm3Nr1ycjgQ3QI7cl2t5cjuqYvkINEg9Uri
	 owQTbRY0WdIaNWRLa/yWsv8SmDiLd+TaOwvRQyyTXijUc4OjTrKJ6xfh3+DsgoLF1sQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794038893;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=Fu3COQCAPmOwpJB4SS2FVTvXTR/NXj3quXMf5G+9+Gc=;
	b=n4j62veBOCkEZw3eAZ4F9b6BEv8itrvKLw7m6O9fbNcEio/JxP0QgnfsOzAm3tuVyEjZ
	 bk3332GrV4fpBx6FXsHApsdjqCvQqx7mzPGAGgG356n5AXoUzdwBLHZ0wp5L8nHVJ8sZB
	 /am9xi6RUfnp5u0qPHKj5GgLcP/6FuAZ43KAAbxgXUP5Emvqt5XrHWeFSsReXbvtEbftP
	 yPGJpj1mZ5jwAcs4VJpbKGbm8JtJ7Y7COpLOXg8cJuvVbgtcPuXtOALhSku43npFsHqOY
	 aTrwLto/4PsHF6CvNSvyRSIb6mhuHX/N0li3fgiUCjS1DQeN1TCCB6Z9PLSHTYnq7Rw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gjR3O+Ln;
	arc=none smtp.remote-ip=209.85.214.178
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CBFE606A32C
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 08:08:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CBFE606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gjR3O+Ln
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2ea7987517aso8167035ad.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 00:08:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794038892; x=1794643692; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Fu3COQCAPmOwpJB4SS2FVTvXTR/NXj3quXMf5G+9+Gc=;
        b=gjR3O+LnbqWxSywMeqbqw+2tekOwfmC3a5BDhu60zh3iUcZ0Y3Mzu7GPeI9zhL+aHG
         eZWl1skwP1Q/ll1e+lKt8scG8ma7mqFE2WWCEWpcHSYAqqqLl3NSj92XPwBjFcUwPDIS
         l2MVQZyp8nPW6H4lH7sAHbUnWKOctaRelZL2/8faw9SdV7hAOI1FIueSB6ylCXggbLe7
         JfxANvcupt3AxNkyuaiwncgHCpq1yxBDSLkCP49P6ePE8BAobSbK4noUzkekAp73VY9e
         SDcZvO8bll/JwGA4InjCk6mETFBPB52IlyvUXmM1kkKc2+Y7KooJs5ZauCtp6HNd8+p3
         IxyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794038892; x=1794643692;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fu3COQCAPmOwpJB4SS2FVTvXTR/NXj3quXMf5G+9+Gc=;
        b=IukLJt/ZEI4Djnku5CS9pF+xk0LJ6zd8HU3GSlvQArawFLl9hWXk1H2Q46TWZmUlHi
         g14YLLzVy7B7UFZvSW/+ZASZteAtK9tP25fqnNcsqdxbUqnJHKqTVJHewwW9/ITGixhK
         e1pMkVjW7H0dUjDhkoZqvofF3tGV9wxThnE5BPzVuDEJUYZAhqfV7iNgavqMT4jxrP4K
         qGbgQhCa5PGXnrSWn4CGJ619HnzcNqEPHKOhnaNSJfkCI7HL9ygkmqxUPSzn4wAvn450
         54l+G3u4hXUdP3AFGZL7zpGT7N6AXmXdQO/hqrkBseHuVl8VqidXnwYIW7Q0uW2Mr3V5
         fVwQ==
X-Forwarded-Encrypted: i=1; AL+hErGPB5ZUPRssFB6LPrsuYvOYpsoyG+pBR08WmgQBsPWmOPKZlLZno3WtdQ3es0GGww7NxaX2hDDEWWX5kiI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+nZeC7WasLV6MuE5ss7ByvK75tQazI+TE7Xcpy3chjPtnzAt8K
	DRQObl4uHuZ1y5scz2jJzHN9ohTp5zniJ/p5/yXqTXctg18LpyRwUccz7R6yZt1KDXM=
X-Gm-Gg: AYBFou1O7XfTlV7D0goBjbCdREs1hM2uOLE+LfAmry+3+pKgTV28uPi8MuDhi3xK2rM
	OJnZJbfG9I7g3cleiAiKtBizigSEukixa1e3ekd5t6kJYCguEhEAWvObH0v2b2S/4qHPq+PX/EM
	jIWBZ020aNt8qBn+IY4gBrcHgQLwFlfH/Upp27sQLsUqCHoHbrdWxAS4mBPHsnja2AK9PnpbIaW
	HDc/HixO/FdNRYFXQ2nj/JjJ95G2xBd7YryHVKRJho/cXta4m3wKwAeLvihVpgbnOe9mzvDZkVE
	oD3Hq6SBR9Glz/CSAkZ3ClopuAqB+IoCIkhQEKXdYIAM/1IEkpcDS7YRwPX89/6yMnNybVLERiU
	UMW7hxDuzRy47A57a1r3H6MAyGTYJff5TPdimAFka5dDFLNerVjwLwtWvTZ2n/77nhOUj3q3IeS
	QSyAjpylUdSy6A7H6Nq20oOeRzDj8nsgjCYfYNpWgh/i1ZbVVpHKOvEVdLEfpnt82Cu6RlIfCxw
	06T+2Ehz/KIDdpTskwX6wqiLGgS92f0FLXDGYg91QNQkwODVroFmbWcAILQuYQnKS3bJTiiIRff
	vnF1ak8TIN08nZEiqMgF2S1zHRY7u31LR4t2adUtScNJsyXODBhNwGex
X-Received: by 2002:a17:90b:568e:b0:3ad:870b:b6d4 with SMTP id 98e67ed59e1d1-3b0db609836mr4788668a91.1.1794038891748;
        Sat, 07 Nov 2026 00:08:11 -0800 (PST)
Received: from [192.168.255.10] ([223.104.68.152])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0fc27e829sm1764509a91.0.2026.11.07.00.08.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Nov 2026 00:08:10 -0800 (PST)
Message-ID: <05e77224-7d3a-42d5-9e08-82c7257cba34@gmail.com>
Date: Sat, 7 Nov 2026 16:08:03 +0800
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
To: Jiayuan Chen <jiayuan.chen@linux.dev>, Eric Dumazet
 <edumazet@kernel.org>, Kuniyuki Iwashima <kuniyu@google.com>,
 Paolo Abeni <pabeni@redhat.com>, Willem de Bruijn <willemb@google.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Simon Horman <horms@kernel.org>, Martin KaFai Lau <kafai@fb.com>,
 Daniel Borkmann <daniel@iogearbox.net>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: TencentOS Corvus AI <corvus@tencent.com>, stable@vger.kernel.org,
 Lin Jiapeng <jiapenglin@tencent.com>
References: <20261106135841.418-1-ljp1205831794@gmail.com>
 <6cb5fe89-c6f0-4e84-b753-4425b1aebe1e@linux.dev>
From: Lin Jiapeng <ljp1205831794@gmail.com>
In-Reply-To: <6cb5fe89-c6f0-4e84-b753-4425b1aebe1e@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2026-11-07 1:02 p.m., Jiayuan Chen wrote:
> 
> On 11/6/26 9:58 PM, Lin Jiapeng wrote:
>> Clearing SO_REUSEPORT on a TCP listener clears sk_reuseport but leaves
>> sk_reuseport_cb attached to its reuseport group. 
>> ...
>> Repeated connect(AF_UNSPEC)/listen() cycles therefore insert the same
>> socket until num_closed_socks exceeds max_socks. The next insertion
>> writes before socks[], overlapping prog on x86-64 and leading to type
>> confusion when a reuseport program is attached or detached.
> 
> 
> Is the issue same as Eric's patch ?
> 
> https://lore.kernel.org/netdev/20261106084300.2029567-1-edumazet@kernel.org/

These reports may be related, but analysis suggests that they seem
to have different root causes.

Eric's patch seems to prevent attaching a program to the same unhashed,
shutdown listener from resurrecting it into the listening section. My
patch addresses duplicate closed-section insertion after SO_REUSEPORT
is cleared, which may eventually make socks[-1] overwrite reuse->prog.

Eric's patch does not change reuseport_stop_listen_sock(). Also, my PoC
attaches the program on a separate, still-hashed anchor socket, so his
new check may not apply to this path.

I tested Eric's v2 patch with my unmodified PoC. His positive control
returned EINVAL, so the patch seems to be active. However, my PoC still
triggered the same UBSAN/KASAN failure. Since his patch did not stop my
reproducer, and the root causes appear to be different, I think these
may not be the same issue. The two fixes may therefore be complementary.

The following is the UBSAN/KASAN output with Eric's v2 patch applied:

[trigger] cycle 129/129 (vulnerable: socks[-1] overwrites prog)
[trigger] attaching CBPF after closed-region pump
------------[ cut here ]------------
UBSAN: array-index-out-of-bounds in 
/Users/m00nb1rd/WorkSpace/vul-findings/reuseport-closed-region-negative-index-bpfprog-as-sock/repro-upstream/linux-eric-v2/net/core/sock_reuseport.c:153:9
index -1 is out of range for type 'struct sock *[] 
__counted_by(max_socks)' (aka 'struct sock *[]')
CPU: 0 UID: 65534 PID: 22 Comm: poc Not tainted 7.4.0-rc1+ #1 PREEMPTLAZY
Call Trace:
  <TASK>
  dump_stack_lvl+0x23/0x30
  ubsan_epilogue+0x5/0x30
  __ubsan_handle_out_of_bounds+0x91/0xa0
  reuseport_stop_listen_sock+0x290/0x310
  ? reuseport_stop_listen_sock+0x43/0x310
  inet_unhash+0xd5/0x400
  tcp_set_state+0x125/0x260
  tcp_disconnect+0x47/0x1950
  __inet_stream_connect+0x2d0/0xab0
  ? do_iter_readv_writev+0x25b/0x350
  ? vfs_writev+0x2e0/0x3c0
  inet_stream_connect+0x57/0x90
  __sys_connect+0x14b/0x1a0
  __x64_sys_connect+0x71/0x80
  do_syscall_64+0x6c/0x1d0
  entry_SYSCALL_64_after_hwframe+0x4b/0x53
RIP: 0033:0x205560
...
...
  </TASK>
---[ end trace ]---
Oops: general protection fault, probably for non-canonical address 
0xdffffc000000008e: 0000 [#1] KASAN
KASAN: null-ptr-deref in range [0x0000000000000470-0x0000000000000477]
CPU: 0 UID: 65534 PID: 22 Comm: poc Not tainted 7.4.0-rc1+ #1 PREEMPTLAZY
RIP: 0010:call_rcu+0x10d/0x260
...
Call Trace:
  <TASK>
  ? reuseport_attach_prog+0x6c/0x250
  reuseport_attach_prog+0xdd/0x250
  sk_reuseport_attach_filter+0x97/0xf0
  sk_setsockopt+0x973/0x1cc0
  do_sock_setsockopt+0xa9/0x120
  __sys_setsockopt+0xaa/0xe0
  __x64_sys_setsockopt+0xac/0xc0
  do_syscall_64+0x6c/0x1d0
  entry_SYSCALL_64_after_hwframe+0x4b/0x53
RIP: 0033:0x202f22
...
  </TASK>
---[ end trace 0000000000000000 ]---

