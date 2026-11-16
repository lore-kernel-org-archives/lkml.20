Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794848665;
	b=0/5EXsmS+j4L7W24x4TQ/djrSlvCPWK/g5V8dj4MeDC42f3kUqVUGxl6OJxNT2XFLuMH
	 9zQOQs3z3XoCg0CXSPrvTBmoPNYxgiYOzslsh079A798iwmGhh3a7ZcVjkQVOCoLF9Rs+
	 TxL/dBZge8H/vY++++M3WTRGxjY2V8R/o/RVbSFYzzpBv65vla5h7HD69tGEan4kNPRre
	 gVVjs2ehTdPpNkKNLM8MkUj7fyO0pKQmQ7Q+oZ8u8WwAgIAlrPUPl0ecj1ROYqa86My1r
	 3/m+n/ioZImOFcCU8wvtsnHuktxwyE9R9COyokOTKyvLtOjGj3jaEiUWANrDzy30HgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794848665;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=L1hT+97K/K9N6aADAlPB66PeMF4gDFwltjwUCDDeJPw=;
	b=NZlp3vJT+1ldy0uHMa+YPxBJRerc10pH0hTOEwGOJuLWIMPN4I2i3afprMDGW+Jv5hNA
	 JOsR2scvXsbk3lYOFwlduJo+x4yF3Gp4ymqoOS1DHlM8exKR4nLROOrb9Cs8wTD0IC9KX
	 KybLtEzIKr+LYpbHZD6kA/9shlbkegp8fKUnTy4XfEeWNd0dpEc1gP2O5W9gff0WH+AE2
	 xzalYiMoAzfKQm0AMzVFmCxbcnDI7qXTd4CQUeF6Ny9uVvAQvCrpu2TNssCYLTN1sNBqU
	 G7I3FqCWKy1eddAGQ+pB8kMNX1s6FQ7XqMfzrHS8wE8JQ7FeJuXlZ+WQtMb6Wbgwf3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=Xh8yP6lX;
	arc=none smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EDED606A33E
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 17:04:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3EDED606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=Xh8yP6lX
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b56bbf8330so4839593a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 09:04:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1794848664; x=1795453464; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=L1hT+97K/K9N6aADAlPB66PeMF4gDFwltjwUCDDeJPw=;
        b=Xh8yP6lX+BPj20RAK/eBul9EDB6/2oy1PyKatTxPRBo9kRtGfKIX2qjIxa5c8xSAZy
         8cEXNuSoibZZB/pbA31WLxk6XqNRGu5xm+gvWnDlKkmyZz0+6OvHbG6LXkZZqrMuxvh2
         usERjfPixx2vu8U3q8mY9/qGZD7NeBfUNaOqJAFlaM3dpO4QQQYia/XuN0ACeLlmlwAU
         1tKTqFwdb4kjXTsnEn9GqPMz04guC/uUXwdSPbhUZSRcVcajS5e6Q3Y4qNlB3nTF0rPq
         Fuz1O34kiQQp9maVl1+HigJ5WTz05GQ1FL5rUN/Bjj7acV6rH+/NERK/gxzf/J+DSxlG
         +2LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794848664; x=1795453464;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L1hT+97K/K9N6aADAlPB66PeMF4gDFwltjwUCDDeJPw=;
        b=Sh//9kWNGOJHBFzZkEQMvS+OpaoFN2KMlDHQDJ6pcq4Sc5ki5UecGTU3IXJtrzSbhK
         nYyCbUuDbuYYbMLDqtRqir+u++1VGhiQ8q9NXbfIXdTI3A+mvY+J/i2LIkjRtJ3U+ljf
         r8W+f2qWv31eVjNh5QHJ2hedzmk4ZAQItezVo5eS4F+H2z3Bxx8NVjKwV3CrEPXUDLbB
         hIe0/44BbSHyICF41vDsd5HJISDrHDSfH7GvnFBhGd0ZckpP+qlJD+QDO6sMX72/oJM9
         QUGLb2pNWH7ZZKJGvVfIvOIrgOhKckgr6exr9P/ASHEwmhKTDdC5qZynF2uGNqsoxXXB
         xdWQ==
X-Forwarded-Encrypted: i=1; AL+hErFcGaAJFA2DFxVkj4nwrCJRKqumpexQWeiccFERV3iN0Efv01JvG7OJf6gk3Lbdi0ZWCA31HfuvAWVAc/o=@vger.kernel.org
X-Gm-Message-State: APuU4Z8V0jY9RFas4JX8JwForAH2JUu6AxZCCQ6J9KrV8cI+8HSjL8oK
	wqRdbP2FKGfGECNutKtwsd2u/7lhe4MfKHCyIX90tBL5m2ud/aI/Dhhe6Q3/iJuOyNoH3Znv6uQ
	AIQMfE0uPPQ==
X-Gm-Gg: AYBFou3Ia/OxDwjuIGJmHbxXGA4cagqFxF4R6PYhH0Uz8QLiMHKyz49vKvUBQHf+5Qh
	m47eNXOoE9w6Zy3OLZi4cTsuvIhmK/jo8nigzjDO3ChgnB6Q2C2aQJpUZC3pT5vwrna6Lt+rjS8
	ZqdzoEK7/97twrpR6Qn9oLD3bjPk25yGzC2iAu7slhN2YXTrEtJ7iPRiK1kP1ts3popEwekq8UG
	UJCw2NbrjUd6iXn+L9P9eXUZB8pV24KlyaauuiKrw9H6hOkcRJt3hWM1MNk4+DwjH0XErkF7XxA
	Anre2abwqwV7jmYMQRh75uHXPNGRZIAgjDAKtVSCv/RIBpmmSH+XY+m3YasVBQF8Rgq2SxZIoIU
	OlMpmqA4/FKYk8zR2Dpa9DHLTPlNFmAx4uio66IIRK/E5YhIFi6KnE9takzn0UcNOMAszV+dDV4
	3QH01Iu1u7Uq80c73onZWKVYPg42quCxjfaZTD9hdjHZvPn/RJynQ5udPhGzMLWFYn57Yjzjp/Y
	6am/Sh7mgzVyTIWyGhW08thbxBgHDXrt4Kz1HVX3a9C6pj1TOW83NUXzuZwhTaQFzqPVICRrfJq
	APgjCBaN+ov3W/QiwJrPPsGKZN20c28+ktd2fvLofJre2ss=
X-Received: by 2002:a17:907:6d11:b0:c26:2a2:b91d with SMTP id a640c23a62f3a-c509612a23fmr1038875566b.6.1794848663649;
        Mon, 16 Nov 2026 09:04:23 -0800 (PST)
Received: from L9JK9NPFH9 ([2a09:bac6:37ad:1e5a::306:a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b44739sm439299566b.40.2026.11.16.09.04.22
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 16 Nov 2026 09:04:22 -0800 (PST)
From: Tianyi Gao <tianyi@cloudflare.com>
To: netdev-bot+sinfo@kernel.org
Cc: netdev@vger.kernel.org,
	magnus.karlsson@intel.com,
	maciej.fijalkowski@intel.com,
	sdf@fomichev.me,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	ast@kernel.org,
	daniel@iogearbox.net,
	hawk@kernel.org,
	john.fastabend@gmail.com,
	yoong.siang.song@intel.com,
	kerneljasonxing@gmail.com,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-team@cloudflare.com,
	tianyi.gao@linux.dev,
	Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH net] xsk: reject TX checksum requests that overflow skb->csum_start
Date: Mon, 16 Nov 2026 17:03:41 +0000
Message-ID: <20261116170341.53580-1-tianyi@cloudflare.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <179484673444.3291.12899618485319674206@kernel.org>
References: <20261116162834.30087-1-tianyi@cloudflare.com> <179484673444.3291.12899618485319674206@kernel.org>
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
Content-Transfer-Encoding: 8bit

Hi,

On Mon, Nov 16, 2026 at 04:32:14PM +0000, netdev-bot+sinfo@kernel.org wrote:
>  - Whether the issue was actually triggered, or is only theoretical
>    (e.g. found by LLM and not proven at runtime). If it was triggered
>    please include the symptoms, like the stack trace or kernel messages.

Sashiko reported this several times, and I reproduced it on a 64K-page
arm64 kernel built from net at aa40afa831eb, under QEMU.

The test sends one TX descriptor from an AF_XDP socket in copy mode on a
veth device, with XDP_UMEM_TX_SW_CSUM, a 64K chunk, a length of 65520,
csum_start 65500 and csum_offset 6. The headroom is 64, so
skb->csum_start wraps to 28:

  skb len=65520 data_len=0 headroom=64 headlen=65520 tailroom=65168
  csum(0x6001c start=28 offset=6 ip_summed=3 complete_sw=0 valid=0 level=0)
  ...
  offset (-36) >= skb_headlen() (65520)
  WARNING: net/core/dev.c:3696 at skb_checksum_help+0x1d0/0x238, CPU#0: xsk_csum_overfl/200
  ...
  Call trace:
   skb_checksum_help+0x1d0/0x238 (P)
   __xsk_generic_xmit+0xb90/0xdf0
   xsk_sendmsg+0xcc/0x188
   __sys_sendto+0x128/0x1c0
   __arm64_sys_sendto+0x2c/0x48
   invoke_syscall.constprop.0+0x60/0x108
   do_el0_svc+0x48/0xd8
   el0_svc+0x40/0x238
   el0t_64_sync_handler+0xa0/0xe8
   el0t_64_sync+0x198/0x1a0

With this patch, sendmsg() returns -EINVAL and there is no warning.

Cheers,
Tianyi
