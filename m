Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793716277;
	b=zPOrHxtHoTnqgK6z4DL1JHQz66fjFwjmishhtupzhApQBfCtKkHje/6q5/3Wk+qeHv18
	 yl9E/mVayuUC4kFoFHRrAkP7+7DjmA1dV8tUnrXyC6V1mLTIDNtzdgUmIXhu5nWpvuh2i
	 S3cXG4y92IDt8A2LI+j4PGvdY7YxU1ZPlhMBEZJfiAlS0u5HK+qtkJsWO4BeAr3MFAOpH
	 Jprft2nI/uIBJFDbNxddrqhb+nXuVrfBcWU1h4Lvx5ZNuuSDXntyjiR8xWfqyEKoVWxqw
	 fINo9hWAFYyjK958KNcVMmW7D4Iq817IIRY+jhs0itsfpy2qscCh+rTeTr5MilPBsbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793716277;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=gJM0tAyN19ozTNsT7Q0jTKA95QkMzgeT7FdAvzFKoO8=;
	b=c2pj/dA2UcrfUIyeDJkRXWmRtBwkbtHEq/IbM3OUwTZWDqsdvT/JMTCMVjUnGgMaik5m
	 1Mre3t3KQ6XuCHvJ1PsJcfcFmLzXfdk9isk+1s//et15fb/gqRcIgIMK4bZV5qlwxqSUX
	 Zm60bvt7gvjVIv4eGH3c7XKyeSr3jo7MZ0HkAtYnXef8eaH8qVMaYfhvVzgZ7XHt1vNde
	 nWDNsx7QhfZ8AwUZSCikaXkf9iYdjQYVinS+OF7N/49jkcll+ve8tXTsiNvxSb4osDkcv
	 MRKtMpluDH+5h/kr6wvwe9fO9FGYnwZRgc52BLVxovK4f1PXsEeY/51EoOKw6M02hbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=HYVg+187;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DA55606D83B
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 14:31:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DA55606D83B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=HYVg+187
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1a2af4c8d00so6270553c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 06:31:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1793716271; x=1794321071; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gJM0tAyN19ozTNsT7Q0jTKA95QkMzgeT7FdAvzFKoO8=;
        b=HYVg+187klIeAraNWiyVZReGzRaGY/e6YwDtTbyB2Tck2TpyCThRjKLq+Uo8Wo0IKQ
         DIKD+nujRFX3AcHca4WQ7S7CBhjH3/xV/ysHisRDVa0LcFOSZSxEt6XjP3rdS+P7zrzd
         Xo0o6GJar/C+7JX2twQXpKRAKR6YXLSumaT8dQB0mvtHcEp2mVlUDxVZfDWrXaTTcI4+
         BFZLcI17ZW76aGen483FikYu94knodxK4McQg43lw7tAB6PqAsXH4R+Xzlb00vLTJHp2
         JDZHibl1VEdL5gGeBqC/UIwmDyUk392BWBPB5VBbuGvBL0A/oniU0VLUQ3fk4qZ7xjuY
         mI+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793716271; x=1794321071;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gJM0tAyN19ozTNsT7Q0jTKA95QkMzgeT7FdAvzFKoO8=;
        b=HjxdNzz66Cx7LjKrk+uDrj0JAoPjjlrdY8pT6E293jK11vLQztleyfVsPBlmRtd9l+
         aLX/uIK0fY1kAMe4KWnWe9jmQ6oDMdl7LmK2bS9Tdx2OILuQXew/sw1yiAMICN7jttxS
         A/EwTHjt4jM2jHY9ZRy2yyItVtdkhaPMuUzHCGLYy9bv+W/wpc8UCCsZn97SCvOF7l7S
         hnpMvX+V+BeoG8A/oAojUd9IKi6vFL3B8JmN9hNogoNIBxXoz0vT4HXnevJCKo3UXu4K
         ZKLZAfR25j9Tt4J8uQKOgwgGqjwXePaywTiAFwnIBVAEND42V2hSt3lk9lW1eiXH02x5
         Ttzw==
X-Forwarded-Encrypted: i=1; AKwUvBwLxXBm7y7LZUieyl0OjFu3T/Dv5A4/yxO90e70y7+rXOp1NiWyo9DElwmjQwPn9zV8+Gwnthnhu0pGFLI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/V/lGJj0PRntFv9+U+OlrXEkLB+Z7s5tPXBSLF+JBc/5oQCmUO
	MH0hw8OyKJ79J1X5NjyPnqDa6YukDuCyXQ8QjA9P8DfbFKMI+V5frty1/yMDJxvXB7otRVJE/Ot
	QosaYnNU=
X-Gm-Gg: AYBFou1g9axuuV/f3je+EhgSpZbyHqNiCjocoBgOqnbEMZA1XYiUh3/cLktJ7jkTZ2Y
	svMIowWRhXnOkB11IqyHafmFo/gjqgFOawkDlYHp4XsDHFanytT1MxQywOf33Txj+jxMHMppIT0
	zunPjbsW1ScbyQXSxHiashlXh91ZV8sOTPA2yWMcPpf+wOubjow6AsPp9M29lH2A60bxOTaSBfQ
	h8EGLGWU4JCIDSa5/yORaEChotqiTlbgtI7b5OT9dh+f4vNi3aE9tMpitT7cYHzTrqQfon/xHha
	ubI2GElsvJnFBVGS9k6Uettba4G92l43Zy1IeHqalzFxD3EIEVBoXTFC+G56WAqd8EW4vwbT7j1
	h1BbRmpYyd3LvM3v+8gwJx75QhBpgrHxUljUnWnzH0gCU6g6iSfE4E3Tg172ervfRVAOOxDJp2d
	p76haOa9ybDxSbfu9qTxO7YajlRnMXnfyxuObDqvyxCb7v9vWp0NgSj6c9SxwJa9fb5wq+b9Ijc
	U4CzmY6yNhW87hdP32oKTriNtL3jPTNVPpMW2du3xQEOj+PW0waWBoiHP1mrUJqOSppjlOaTL3y
	3vQnBNG7WNi54mY0qwhEqS/g3E38ONE+1ZlVjFTAp8CfG49yVbRRKLYPUyYLMxuPmqE3mhSNITu
	0xqYYC76nOuin
X-Received: by 2002:a05:7022:258a:b0:18c:e014:6f1d with SMTP id a92af1059eb24-1ac55f2d3cemr24516668c88.1.1793716270505;
        Tue, 03 Nov 2026 06:31:10 -0800 (PST)
Received: from [192.168.1.106] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b23b847348sm9534779c88.4.2026.11.03.06.31.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 06:31:09 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: mst@redhat.com, jasowangio@gmail.com, virtualization@lists.linux.dev, 
 shao.mingyin@zte.com.cn
Cc: pbonzini@redhat.com, stefanha@redhat.com, eperezma@redhat.com, 
 hch@lst.de, dlemoal@kernel.org, linux-block@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <202610261955196384aSLGuy3_0MiTvlYXVdiC@zte.com.cn>
References: <202610261955196384aSLGuy3_0MiTvlYXVdiC@zte.com.cn>
Subject: Re: [PATCH] virtio-blk: Fix zone append sector reporting in
 batched completion
Message-Id: <179371626856.3691261.9118119964005322830.b4-ty@b4>
Date: Tue, 03 Nov 2026 07:31:08 -0700
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Mon, 26 Oct 2026 19:55:19 +0800, shao.mingyin@zte.com.cn wrote:
> For zone append, the block layer copies req->__sector back into the
> bio in blk_zone_append_update_request_bio(), so the driver must update
> req->__sector with the sector reported by the device.
> virtblk_request_done() does that, but the batched completion path used
> by virtblk_poll() only unmaps and cleans up the requests before calling
> blk_mq_end_request_batch().
> 
> [...]

Applied, thanks!

[1/1] virtio-blk: Fix zone append sector reporting in batched completion
      commit: 08a6572441a4e646c96c2b8d8ead9eea0e458332

Best regards,
-- 
Jens Axboe



