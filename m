Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794662690;
	b=4l90LkwiVOLZ31Yiy6wG9Ufv4jSQbODvrwVAHUxlZdZFqK3MduS/KNk1Yr4LnmeukC6V
	 ActLLGPgkmwAWaZ7WQlHgHcGVsn2K3X8qLV47xOdZWzz7/Jpj6m8o3UTK+yedp103gCyF
	 bye6oKgXpiL1u29xWdpfqrmEE/+Mhg0DymOv/UL3Co9kPDESNGUkzWOFMvkrfmGheQLZf
	 0dWn8kewYAnP00J377hqMkjat7TZI68L/mdi9Z5M2xnX5MjsRw5bH020QHIZvx7VFyxcT
	 LogLw108Hu5A0GkEd2fPPF237WUCZ3dEF7vm3OITI7fSRERz0rkwMwlFPLRZpoxhhyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794662690;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=z+m9K+LmnCAbVYsFIIcGwp/A7IxEWTYNbeU+Gj9SixE=;
	b=FKpqW5iBlryexf6HyaDxDLrdZZBP47yjxv0PBu1V3worU287gfbRRXeOCyWdZfYH9kDI
	 Dckx7RYiie7lOPbl2dPnPjO5nubt5HwS8DFdM7rfvFXhqLB9C1FObpsKB70Jt1h9vZV3z
	 hzKTF5ajGq8vjZ0m8azgr0RKv1KXXUp9tDWVQc69TxMAHTlpNmR571GwrCpGFBXHZRcqZ
	 8i4EFBwInNfNoIbZg9xfaAn9PoJrHTlVLGLM9NhazwaSr7qB413X8PU3tGz+3f2A58tMc
	 uQn4F7WN2nYskBVwOjd39mWmZmg8uAWnZZnvKkap0a78LhHuMZx78UI4midzXUxnIAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aj9G630q;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88153606A330
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 13:24:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88153606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aj9G630q
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1a2af4c8d00so4048865c88.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 05:24:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794662690; x=1795267490; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z+m9K+LmnCAbVYsFIIcGwp/A7IxEWTYNbeU+Gj9SixE=;
        b=aj9G630qkJTfdrV87nhfsX+A5icpTrRm6U228AgbfQKxx9Y9dWaSG0gcoqg/mq6rs8
         lmr+r7aiQCymb/GAtPQbAQulrM+V8bJMEHVtrZx95itvPovVlWB+LCdgJ8PScDLmy0NR
         put6VH4ZSNYnhm0VCg5uIS3nw/hL2+lGFD3R0WQWDzqgQYnc3GDZJSwqIOVwj1s+K/Sy
         CohvgcB2BiBMhWiyyJ7T85Qljdy5xjhjJuUvlZRkyIj/zDSgsGll7YBlByCcGLZvNYC2
         BZpJBxUnfWv/lEe9RysxqYVKEhMVeNHDBkbGAj54dmqfoHAgwjeNxkwdD2UeUH/z2+dE
         +iFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794662690; x=1795267490;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=z+m9K+LmnCAbVYsFIIcGwp/A7IxEWTYNbeU+Gj9SixE=;
        b=u7dMeWigWP+jDoomLVxnFumHx5jOqa5+aYiyQtkP5Uot9G3jFGb2aEXGMUQPzbzswz
         zz8cAgen+4K4cVakj2IeTIvkL5namVNW6CzaJfvKfZzahKGY959khSe3iOiY2r3Wz+6t
         obDnNyE9ZZ3MNkGiSk7gvdITVRNpkjcNWblgBPGPG4Jrn0DKJT63vzsUax/9oiIlQxYr
         lQuV/rzz5s2rWhGcd+Ta5hlYaFeuvy68GiM8EhqXCgQUKWJyblN7MhZBDlSgkgIrN4K6
         ktitSfnnc/Dsv2H0A7iJHRXaPtCCMSs9Af3s5jF6oidgjBgfCjIGNgmCiaeBe9aVaybt
         NRrA==
X-Forwarded-Encrypted: i=1; AL+hErH0TXYzlAXMn2qFH3z2u2krY5y1aUWhJLMqoevuAZwOwG7fn/AqqsLzpPgYSwOrEnU8w6klcmWWsMGYVsg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8kuL1HoUTR1ss9UP1+nL77kOuZsjNa6hqtQC+yTZVsbJqoCEDD
	uesytIYRStyRr53IYd5U4LJjQP82NRTe9PIX2GLho1zwhXxc6vT6j+gk
X-Gm-Gg: AYBFou21VKxFolaYETt1V+hsM4tZSbm1RBqF3eOm0rLcxFPCt1A8FzUThuCexyrfMNt
	exsHm9vG5anIyinQxlOepTtbmJyMSPYfQ4QPPLX2RV6ZTZiMos1HnRXUwiVmOk7dn4ueWPC6KD3
	fJfabWytB8XjprwyKlR0KYiKWH2oCGp5d1RO1Z3h0wKU0JNou1wRjgvda5/QYkiOSabauSND3Rs
	WHO4h/YYEN4dzFtAWy2R1DA4H3jO6ErFWn2/avR1Yz5SMxNPZUlRKQDjUXzo7CKhM9FRhokM4hC
	0g8GCEOkBihM4Sze33V19tkgjo5Y0aw4ESI9sKlpwZkjxJOeCHfL7/oP+s5GyqzVidPZJnMPwlW
	m6y1mpn+3KGx6bsg3NWBZFiRtW7m8qRH1zEtXsg0tvQDN/KKd22wcqfqGLG1k+AvJJ9lGBRGO41
	QoYMeQxm4fIKJPC87Zvz0Z/8zWhCVbT/JAICgzVw5awEGaGWaDYiqCarNNUglwdxQ+Uw0k9Oeqz
	r7IP9fccFWYSoPpVFI++rOfbzD21INPHnQCNroV/VMzwe+R0f2PGNUNtEPKi9dytEFHLukrmV5g
	7xnbTJORWl8Ft6/C2+XjpnFGImiQm8ENQ6VayFXzc1QI1JqkpjQlFA==
X-Received: by 2002:a05:701b:2706:b0:1b5:126c:eb88 with SMTP id a92af1059eb24-1b5126cec12mr2504907c88.45.1794662689598;
        Sat, 14 Nov 2026 05:24:49 -0800 (PST)
Received: from umang-Inspiron-3501 ([2401:4900:1c60:38c8:74f6:e2c1:4674:3e44])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955f01d68sm16312312eec.17.2026.11.14.05.24.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 05:24:49 -0800 (PST)
From: Umang Pokhriyal <umangpokhriyall@gmail.com>
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org,
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	Jason Wang <jasowangio@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] tun: delete the flow entries of the moved queue on detach
Date: Sat, 14 Nov 2026 18:51:50 +0530
Message-ID: <20261114132237.70664-1-umangpokhriyall@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <179415734502.994134.10139593761656069984@kernel.org>
References: <20261104174240.138491-1-umangpokhriyall@gmail.com> <179415734502.994134.10139593761656069984@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun, 08 Nov 2026 17:02:25 +0000, netdev-bot+sashiko@kernel.org wrote:
> Can a concurrent write() still put back an entry that points at the old
> index after this delete has run?

Yes. On the write() path tun_flow_update() reads tfile->queue_index
outside any RCU section, and synchronize_net() does not wait for it.
The race predates this patch. Before the patch the entries survived
every detach. With it, only a write() that stalls across the
synchronize_net() can store the old index again.

> There are two possible fixes. One is to read tfile->queue_index and update
> e->queue_index under tun->lock. The other is to have
> tun_automq_select_queue() fall back to reciprocal_scale() when
> e->queue_index >= numqueues. Would either of these work here?

The second one covers both sequences and keeps the write() path
lockless for a known flow. It would be a separate patch for net-next,
since the race is old and has not been seen in practice.
