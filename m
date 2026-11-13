Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794582681;
	b=D96ry7lfwN6/n5VsMJlrawZ2h1JdqbzhKAoikNnAiMEBE1EEnCDWE4Mg1MRNUqcLxR2S
	 JzD0vgQ/j2vezBxbGoBjuMOJR0g58PDCB3BDDp5jLHP+UTw5bOX3avvyypV2TzsPBpLxl
	 sS5h9JhZbJNexuK2wY6EFJgyZ4HYuPXdFyEZq0t0n5bXTw+koJtAUiaiw0urnblIzMqSg
	 J9YvRmhsayVrpfuZ3cdLRTAowRVKcDfIPWHR+Z/jeDxDuX/UeA/XJZCD7aHi8QyLKh3xS
	 8pFvjWdU6As6K70Csm0PV7nOiVj2OT5Bwln0L23zLFHvPY+1Zv4y50r9oM6nBtN2GZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794582681;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=anu/2F6mroicCWt3l+8C2jxZSamPe+b0q+OPEpgFtcQ=;
	b=QW3QJ12eU/Bq2HvpWZU5lABjLlMUAQjw++UdXd9/UDyc0YsxJ+6nNLt0GAuaFSDREwVO
	 MsjF8uP0qo5B2QODqeO2nUPh73oOl4MGLhYwz/DINfT3bOGZ6Caz1NBEEi6IqbNMQUp5P
	 C750/HX+de691ctgbAnKE/8pr1VR9rpgjA9EwY06tb9EXKO+GUo1aLPdANoo/6LxwlxOO
	 4a7ZDz/rhp/+YutIINwrScgtohPlFRMNl+jWoFyTSVtn5NUhkfRvbIsYgwrjAdvCTMhRf
	 YBxYv8OQidRRTanmhZKhJt4zt3xsU6m1Sjg0KLzZWnMUSBcnkvi4ElKPNAxof8ZgJVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u1BE18LQ;
	arc=none smtp.remote-ip=209.85.221.179
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56B29606A333
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 15:11:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56B29606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u1BE18LQ
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5eac01ff101so393204e0c.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 07:11:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794582680; x=1795187480; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=anu/2F6mroicCWt3l+8C2jxZSamPe+b0q+OPEpgFtcQ=;
        b=u1BE18LQ5cUCwlaJfHj8b/uAgIGAk423ZAbmEWwKAu3EGxGmmyFxlc9jRLwzuc/TFe
         bxUCAmF004E0WxA9Yj5yqfdlupxGmr+wsD36wQO+QPoEa/E55jjxGQqpiE9VfqEo6B5T
         d9bzKOO25H4LY7GPIZ0uNRdqFMXUVr04oMfAWizbicvVmWXxRMLLTTgIEjYhceJIJgv6
         SECq82jRNEunGe8utF/T0uCeRmKESmWjuN16PdmF6RjrAQ24wWdz+mguRSHmLxHMOjIo
         z9ULhYDXsz8dASsujCSzK55o06RJ8temYBXI7Bk9s3R3ZNCVJdoKXaDfQx+4SU49O2XP
         yBTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794582680; x=1795187480;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=anu/2F6mroicCWt3l+8C2jxZSamPe+b0q+OPEpgFtcQ=;
        b=H2jSel/EX2zf115HlJkVNv541+KutAUIgT4+qL6O7tQISfaPjNHbtpDQKCqdwbtWVT
         zixyhrr3TcdwuCj97bSdVf76GKIJGLwd5OjOEY9R0JuIiXQZd7Y80HfiG+VoRCK02Lth
         8oDuvWEVgme9LtwuHLInYGo7lWKtzwemcBGv6jcB/rOSemRFx3MPAbgPEmDcoWNC4lEF
         96beToAqRXquPJX3b+nbw/6WCfRTMgoyYt4X/2sE4d3crAjweOBaKkESI6pihsiVILjg
         a5hx3aRwCNeRdjOFBgHJbxdJgCJm3mxU74Xzyd0B5NA5bT/WDozMswUKmo0R2q3GaDdN
         Ai9g==
X-Forwarded-Encrypted: i=1; AL+hErFLrm0YqOT34iQCBj8LALTVzZFLbWx5N/+5/iRReP3MGFeF6KzPEeAjG74nXPIxRkg4A2JuQZiokqrrbYk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+zsuvZFbb6rSOws8q6o99ZcAOZl1uynOuLUcdhy8keGyCibGXq
	39ws/UDnwqZRJ956hQgNLtXG5+bXp9dzGjEIo0Jozm8THNKVsN/c1FU6
X-Gm-Gg: AYBFou0G90eVrTnXhj5CFA7DybO6BM55ikPibiwRxpZw3IQgV3W1G74V3w70mRwlR2e
	pxXlm5EUhQSH3kTy8ZviuRwVdkI8vHGyZ/Z58JllWjcWINcfVEPLgJwruHjeRmEIr3eHpcgl5LN
	DtwX6zh5H4jH2q67nxmVKZiUWBxA4b2aRBCT0LQsI04R1AXCeHVlnk2zPv9k2K3RZf+ZpFYpfyz
	uScc2W966kyyjyK83fw5Y6XpnKVYItounDoiOvveqodBSgkyt9ofcVH78pmTejFIh1pKzpHu7uK
	SFqqDDpmCkic0Q3S99KNr1O061AvTo5o3SLOSUUEJCO+j8x2xF5Q6i23V0Wxg6VLFFPQbIu+N41
	I70e6l/oWkovG8DlLitlXCRhL+2g7MPTmkw2/lXHoNFuvttoJxo8uFJZFnMXgZl8eaOok5TfzgR
	q9v0XDRtzSuCb6Yopu43+NKFOiR/QfnY6fYOGNhFXoVbba5eZDnM3wOkPVsRqmqcMU1ce6p5fWx
	TpNlTxF6m6XfRLtpuTvf6YLhp2oSIGwUfoG3lEnh3+R8UOraC5a9ZB/oBfg8cbrvIcGiLq7/9Dp
	jG1qTgZlyhRoEKA/kWXmJpGVkwpxkvGg+LxLuy+UsQK60WnYc9NoPjO2Ek5kRpnUnXZXn13Lb7q
	nlBOkd6JKNw3323TN9NUn08eCiQo+2gNgDXDez7k1/cgVoyhdQ8MVUbS1YqC65ikLgqHBC56GpS
	ACAV2AN2fg
X-Received: by 2002:a05:6122:1816:b0:5c9:a60b:e5c0 with SMTP id 71dfb90a1353d-5ee34aaf4ffmr865841e0c.16.1794582679986;
        Fri, 13 Nov 2026 07:11:19 -0800 (PST)
Received: from gmail.com (15.60.86.34.bc.googleusercontent.com. [34.86.60.15])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ee34e32f83sm1472842e0c.6.2026.11.13.07.11.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 07:11:19 -0800 (PST)
Date: Fri, 13 Nov 2026 10:11:18 -0500
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
Message-ID: <willemdebruijn.kernel.3a16e755c0d38@gmail.com>
In-Reply-To: <20261113023809.24730-1-jingxuanxie@deeproute.ai>
References: <20261113023809.24730-1-jingxuanxie@deeproute.ai>
Subject: Re: [PATCH net v5] af_packet: avoid waiting for TPACKET_V3 copies at
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
