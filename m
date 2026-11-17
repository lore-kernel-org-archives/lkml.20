Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794883610;
	b=vIGhIbhZ8x54hMdODvSg8N86MENtjW7JO/F4KdPaVyxlp+2QrQ5AABX3Ie/dPazsw4yA
	 XyC7rsiFzHDhiMcH0mA30y207y771Q1Ysr4nXHXmZpB1sGath93JrOD9yfnX8qdwVFI8x
	 oRD2a9CD19dwiUB4waMkmFRFPUZMbTZzouITxvyQPd1vq70RY7gkVapIYts6WDwsYaOKJ
	 3CS4syFki3cLDk0vyKm7n5UG20NS/MpFwWuNt7rKw004V2sflP0fRRBUEEbGm9MNyHrJb
	 sUnXt9A4f8t5PjDGJ6MvS01KPcUwZ3sSsRGKeyS0ZZ7oitSQafABGFM+nZzRAERX1lA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794883610;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=QRvR9Vcznhv/w1wRd/LL8U5gAXQ3HudvDWpKY1ruICk=;
	b=D9ul5548x85rB7qU67BE5F/TMKeMVqeuvcJABgne7P+FavORof5edmZjE/mN1219VR6p
	 URHlf5cNg+irS3MDcXc6Rt1D/JloQRYGDhwRXnkIi81nGyHxQaANamOOzdDePHidZJU5b
	 W0/AU4Rp+vPfP0SH2MfVlOnohdnhw988TPHBh7u2w7j3rBw9YezaXCtvt6te36ET+3uH9
	 mRWO0ufItjz8ZeGyZd5aqc5HGL4P7ExhE/Md4UAGOLLegw/0YOoXcj4qJkyXxqLJc0azV
	 QahQuw4MLUdFhwPT2msyBxgLjWfLAw1uTIZ/Cm+Zxm6+IARLaABUhFtI2EyUAM3X2cQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Tg7KasK9;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4424A606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 02:46:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4424A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Tg7KasK9
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-38133db970bso735953eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 18:46:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794883609; x=1795488409; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QRvR9Vcznhv/w1wRd/LL8U5gAXQ3HudvDWpKY1ruICk=;
        b=Tg7KasK9GenHBhrAXrzo34P4RoCHPlENdUm0dbB57dGDrdQtm5RXNp0Dz9/Pcspwg6
         r3uzL8tWzxJ2WsBQudX33ajhMtlgFFWBxLZfKAWuUtBcXKSwb80qfFCRCHQzLg1Ad4Mf
         ZGihtitnqKdt9X1/NjPRTRt462GUJY1t+VYytGMFAPw96NyMqlwee0Q1rT6cQz3p7fvb
         +h+C41+J3kgW4AFqxp1OIadcdfo1MyJZk4KGFIXIepRtmPjILl8zW5zhXJR5MEoop5Y5
         V81GA6v4kQ+fL0P2g2EI/jVGeOjimhD/s1xaUAnKoXkTnfkdIK+qo4oqTaXGn6YuuECj
         3YBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794883609; x=1795488409;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QRvR9Vcznhv/w1wRd/LL8U5gAXQ3HudvDWpKY1ruICk=;
        b=G9M/4xpuPKMqLTuiHZDLlhPTh2MXGnCzhz6DlW20SB82F9sigCGjTvpJTEv2YkGa92
         gFJ3GBfXhSuyp6vC7XPBk3+Z3N3fJPYyuD/v6GCJkDURuyPYu8nZhwsA06uLecdMFX0E
         E1DYJA8z2xLZpYi8s8T8S/jEHGzNqIpceDuCVLcYzxSme1BZvYK7kC+nz/AyqT5zrlYY
         lmDqGn9NbGEgbE7FCwHpcSJNRNSd9rkeTJKVQVWW/qt53VZOh8ih3yw8owW0iTvHyQ2p
         RQdaxZyQRwYtHreJ22B7Nt3791y7eA1iiNuOcueGiYInWx8JoiaNK2q/lbd3l/EbhMZZ
         jvJA==
X-Forwarded-Encrypted: i=1; AL+hErGk3XTHKu8ORiVReMaSpNv0y4vzmr7siS9/742PhmPEagJNtWsYxqsfiEXK87wGySydyC5w+WzzMbnSy0w=@vger.kernel.org
X-Gm-Message-State: APuU4Z9mteAo+2C0UpvZ4Jqy4H11B+O9bSHrJqDc2o91pl3wtQlxnl38
	iFOPqKUg0DZhSrjG6nMRO7wSKK5u6oVmIWItVqgPzGU++z+O29QVsuaC
X-Gm-Gg: AZFdTZdTZUUQzylPXxSUYgdMQczJxiDzuGdEVtocEJw3GAgra7uskWCVjgW6Sglp1Zk
	Oz7xD9dwkCBhLPjynyd9M/4D9jiA3VSrlESSTkt1eQqVgNBxk0dtKnvykDFULcMfFWrqN7DFMG5
	mR1x1J2Y21wobQW+EjPyiqA+CvhjvYIRZF9CZiGkS7jWQqKQytI7J8XIX2S1uKxOmdTxDLJtnxu
	79C30y7gdsjhDKwDSuxHWTLluF2Fpkf3iYwBpR2TLYwcgO55e2Q52bv1kEcnh8QCPJI5hGkDMCK
	coBqX9fFtHydlMhRH4iy0gyEVxXD+LRsI5Khb6CBy1rai37yYLIP6JU39vyFw0yaSx2+I5iUGeb
	abcIvOHL88jf/xAixgtQ14VUv6JyoZKN12uyTb/qZRxDR5TnhAcFo+zDqrJda1wSISSLEWsKSy4
	SDdQgKyKzsjF4J1MVf08RV2jRyunfkVlnIUCsd3M0csx3f4QkYwRlwqXTM+R3wA/D3DRuAKC7vg
	5qd+XYRMUx/3r6iK43N6cVUIfxxwYuwJWlAp4qCcGlsPmuCgL9qzjstBPDrGmOruTgoQW1GsBWv
	UU7gH0dDqyuP0oiWvXwR1OZ4ISgTWthQ8TqgnTrkQkx8wfa27Or7I/MZXFyUrHQdKJiz
X-Received: by 2002:a05:693c:894c:20b0:381:a037:b060 with SMTP id 5a478bee46e88-381a037c019mr74628eec.9.1794883609155;
        Mon, 16 Nov 2026 18:46:49 -0800 (PST)
Received: from youngkk-vm.localdomain (67.216.200.102.16clouds.com. [67.216.200.102])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955a1c5c2sm39063508eec.14.2026.11.16.18.46.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 18:46:48 -0800 (PST)
From: Cheng Yongkang <teel4res@gmail.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: David Wei <davidhwei@meta.com>,
	io-uring@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] io_uring/timeout: don't rearm a multishot timeout on cancel
Date: Mon, 16 Nov 2026 18:46:43 -0800
Message-Id: <20261117024643.478059-1-teel4res@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <71233dfb-bcac-42df-afd4-45b65dabbc09@kernel.dk>
References: <20261116044519.281756-1-teel4res@gmail.com> <71233dfb-bcac-42df-afd4-45b65dabbc09@kernel.dk>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/16/26 7:41 PM, Jens Axboe wrote:
> But why would the app do that, to shoot itself in the foot?
>
> I think the fix is fine, but the premise of it is very odd.

Agreed, no sane app would do that. The only thing that made it look
worth fixing to me is where the cost lands. The drain runs from
io_ring_exit_work() after the task has closed the ring, so the time is
spent in a kworker holding uring_lock, and the app can no longer stop
it by being killed.

Without the bogus CQ head the timeout is still rearmed during cancel,
it just stops once the CQ is full, so the change mostly makes the
timeout handler skip the rearm like the other cancel paths do.

I can reword the commit message to lead with that instead, if you
prefer.

Thanks,
Cheng Yongkang
