Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794331042;
	b=xwCLhH1GGLd9aFT+500m4sXvnvkfspkJV+O9Rdw+HOd8+MIH1pcocqc6hHS+87OIs40Z
	 jySEHlH/hdZ5M7Ip6eGOIu5izxx59FA5cRhX8YCuUQRatWC78dp7vfWyVPPoibTS2pr51
	 4tcmHxb4SHLb0IrBXXaGX8EFsMQmObFgfnWS+358vAY3SP6g+Ez6rwFn+O68qNvnPgbTe
	 YC+BEgRSpMkOEhKaEhyBPm4rLn1HzbXlTSz9ueZy4TMbXbZ3yjzqE33cKo7Csz5sTuJHv
	 6eBDfUeEAsHa6QciQZcF236eSoDwrcZ3+EDrR/YnNJ/ackFg0MX5Rphs59XtwpoFzOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794331042;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=anu/2F6mroicCWt3l+8C2jxZSamPe+b0q+OPEpgFtcQ=;
	b=JZzQ4jHP3NNsaIeb3yO/8yQTl/sUGjnqihgiZ16Rpaxx1yZUzTX1uHobXOm1DBIyGC6C
	 pRP0OsKPhZ01F+iMW9Ox5g4cQJqStCmG2fQo13ehuOz+E5C1cyyzeyFdMCukw9aUqSq9D
	 Ff+YpdGGayQ1Cvk4IRCA5it+5+C330AwdYjymF5hWXdNdDVoFKaT8rfTNhnxL4HmtcH4b
	 2luQkWFlePqcJt4ninEO4tuY+2jqnZvmndPnewZ0fVG7usWbcESXhMueonVvZliG8ALhj
	 /sDQnW4NE6kIk5xw3Wng/s+E5LXMCsWF2bEBctzR58VrLikrd5Un19MxWJRVYyO7c7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NKKCrJA9;
	arc=none smtp.remote-ip=209.85.221.172
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECFD3606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 17:17:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ECFD3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NKKCrJA9
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-5ec6f271883so1384979e0c.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:17:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794331041; x=1794935841; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=anu/2F6mroicCWt3l+8C2jxZSamPe+b0q+OPEpgFtcQ=;
        b=NKKCrJA9g8WcA1Ou1yzg2Qhs61lb8dcLj5MZUxusyhRetSjLQ36Zg04UidHm6J9a2J
         ZVt6Sgq+0eCGLFC3Y7PwAt2B+DLaYU3sLlrlveXZp8FtmrHS6UUmfRgujvJ6b8Ch6QDr
         85GUlFDvlsOibkvJsJvKQF4d5qTHlVT3s14fPoFbRd/CdmjDO7i7xGUD7JcMpZeGMGea
         QPyWeoKJXsSlgySEFMDNjA3xLGFRuLjZa2I+f3uwbTasnpqZjxiN/ErJxiXE7hhUR/vs
         mNpMtW3q2HCePxE8ZMaRIddfrjsD4mR+rip5SVcDsSJ9Yybgu7C/pFbER85AWofvgUdZ
         XcRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794331041; x=1794935841;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=anu/2F6mroicCWt3l+8C2jxZSamPe+b0q+OPEpgFtcQ=;
        b=RhGrJseDGd5irMn4+qL6leWV9ia/RuK62K7q52eA0ZJgTdSlhE1y6APclxOLGOp0yh
         N86W3HjnDNF69HuCmcIMpKVjI/yLUNUVtWWv5MmKBUZG0hlnMBs7A4mPkCNkRzvhqfv6
         6L21XJmpmIxLF0Z9ESNVmyv1dRqZRTG3RlBsVyc+M3hGbn31J2zOYH137qQ/xexrn305
         PsFAjuJIC4SNhLXU9mseiuVdd+frZekCA+7nbR6lDoIIr8rG8EZSAzvRSo+BkzmgWZly
         JbodZv4zxibtC92sGtdLR+K76RvPl+C+XKbj853a9BEru2r8m1NhbtSHs+WufNzi4+AY
         vZ5A==
X-Forwarded-Encrypted: i=1; AL+hErHpf6bzd2ocZtV9tbIIegG1rbloy8qhPJ3+5GMvw4NFTBgN2OYcHIQd7TLipu7FOla1N20Q5Xv7FWOxcLw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+npjPNKVCCYk6bJIFr3lckohpL8xCMnTlWeEw0REVHuH6hr2E+
	EObcEP50Aakjl34LV01mZo3Ly3Q8+yTVe2IMXHXiHsUfmMXHPcSxNvo/
X-Gm-Gg: AYBFou2fg5aLqdEZGKNQ5YH9IGj011sYjLb6rFRLRCP9KrQc2J3uCyOWJIaWtnk5rPw
	jPvr6dLVmGgibJByrMHSgh553uPJjHAg8lCAfE8yXVKcdh4EyV+kroUWhDEVeDr1qJaM+3ocfkz
	EdCABnAj/1YPuRaQPrYoiNp3uf6TO3tsOcmh9g2WiFdbxzzkSk+k35hcBPCGP5nIVYKzG+MNx5I
	0pxOs6VmGMKg+3z/Z76rNtQmBBjmCcBZOyK2G4acy6hakWFJhqHQ0WvY/ekbWzXjjrd3rc+k01u
	e88jhub/LUTIidv7BRIna3bp9XFaCG8jkprdwBmWYlaQBprXUpeNejWycibEGH4lDriVg/66cbQ
	4zWTm6O1MEwVhCIP8/SWS1QJ/ZL6w4Au4w9ALEFMs5cKKSVsbNrvSlWKSqba1IKK7zHo47ESHNs
	RYxBl+STEu3yjwUcA9GpGkZGkTv5TiNiMUfZemO2nPySE6l4KHeQuakTNWni0vePvb5hgRza6PR
	savrjmfl8RnKwd32wIdoxDE+i9GTL+6i2feUCNBV00c2j3MAnQ/f555Q7gz/mxFxtQAllQAiejc
	aC4aA/1byGbukywoFCvS4lVj8VdZv2YTLbHoul6IbPl3tjpeLQqj/bDxu7qXXlX6AyEXeyC8i9d
	d5yyITFBKm86CWzVEOvcU8eKA0NtOFbrwYMH92J9IB8NET+vdVW6Jcwyynwr1lbWqqWm85/A=
X-Received: by 2002:a05:6122:210a:b0:5ea:c722:b3a with SMTP id 71dfb90a1353d-5ee0d0d51d8mr1334938e0c.7.1794331040981;
        Tue, 10 Nov 2026 09:17:20 -0800 (PST)
Received: from gmail.com (223.230.150.34.bc.googleusercontent.com. [34.150.230.223])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ee0c5dace7sm2095563e0c.12.2026.11.10.09.17.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 09:17:20 -0800 (PST)
Date: Tue, 10 Nov 2026 12:17:19 -0500
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Jingxuan Xie <jingxuanxie@deeproute.ai>, 
 netdev@vger.kernel.org
Cc: Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
 =?UTF-8?B?6Z+p5bCR6Ziz?= <shaoyanghan@deeproute.ai>, 
 "David S . Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, 
 Steven Rostedt <rostedt@goodmis.org>, 
 John Ogness <john.ogness@linutronix.de>, 
 linux-kernel@vger.kernel.org, 
 linux-rt-devel@lists.linux.dev
Message-ID: <willemdebruijn.kernel.33a00c75cd53e@gmail.com>
In-Reply-To: <20261110072221.24701-1-jingxuanxie@deeproute.ai>
References: <20261110072221.24701-1-jingxuanxie@deeproute.ai>
Subject: Re: [PATCH net v4] af_packet: avoid waiting for TPACKET_V3 copies at
 retirement
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

Jingxuan Xie wrote:
> TPACKET_V3 retires a full or expired block while holding
> sk_receive_queue.lock. prb_retire_current_block() takes
> blk_fill_in_prog_lock for write to wait for in-flight skb_copy_bits()
> before publishing the block.
> 
> On PREEMPT_RT a read lock can be held by a task that has been
> preempted or is running on another CPU. The packet path or the
> retirement timer then blocks on the write lock while holding
> sk_receive_queue.lock, and the receive path resumes only after the
> copy completes. This was observed as a receive stall of hundreds of
> milliseconds in a PREEMPT_RT deployment; manual inspection found the
> same unconditional write_lock() in both the full-block and the timer
> retirement paths.
> 
> Try to take the write lock without blocking on PREEMPT_RT. If a copy
> is still in progress, leave the current block and its metadata
> untouched:
> 
> - the retirement timer re-arms itself and retries after the configured
>   interval;
> 
> - packet allocation returns NULL, so tpacket_rcv() drops this capture
>   record and accounts it in tp_drops, while the original packet remains
>   in the network stack;
> 
> - a later packet can retire the block once the copier has finished.
> 
> Do not dispatch the next block while the current block is still open.
> The existing lock order and completion ordering are preserved, and no
> new state or worker is introduced. The trade-off is a higher capture
> drop rate while a copy is in progress; original traffic is unaffected.
> 
> Non-PREEMPT_RT kernels keep the unconditional write_lock(): there
> read_lock() disables preemption, so the writer only waits for the copy
> to finish, not for a scheduled-out task to run again.
> 
> The stall was reproduced on QEMU arm64 SMP PREEMPT_RT by delaying a
> copier after frame reservation: without this change the next sender
> blocks until the copier is released, with this change only that
> capture record is dropped.
> 
> Fixes: 632ca50f2cbd ("af_packet: TPACKET_V3: replace busy-wait loop")
> Signed-off-by: Jingxuan Xie <jingxuanxie@deeproute.ai>

Reviewed-by: Willem de Bruijn <willemb@google.com>
