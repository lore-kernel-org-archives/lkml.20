Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794072440;
	b=0fSIT2XShRX9lxzDGn+WdAZjgNz2AztAE/5Dw1lcxqwlIvzy3oEN+OcZ4XuyJ+xK4+Zn
	 c83Grdbl4uTJB6BoQs04u3Exd+zsVaexRnuw42/wI/ZsdbSQfpEVX/lyzDOisBeWxuW9t
	 TAWZgz9IMUABA7uZxQu3gqU/03yWuOeCEKSmMYrpPDhvGHn2ulMpqpi4/pDfQ/RB37sfl
	 NtHvIfmr1wgtJ6F6vhBu2Ny1oqobAL8/GokAkHPmL3jM0mVxnp+TO/37oPd231WedvIED
	 6c0m3h8q1VSh6DgRqMr17wv2SibVHR3JY2AIXvat1p4TO0pISFbNzacaC6D+9WgbXEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794072440;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ZZwMrztt3of5COKCtSyFNtiXLTIolPtZxVxm9oGuspE=;
	b=GY3OXh12cGbi+sgsVOiTVDnIBMsY3AMb5cEwqJvlmzKzwK28HC4cnhBhgZpVqDMrm2+N
	 AOOgu8wMnxyiRV5Zk5flsdvqhIKLla8lYW6jnPi1pV18AV22uudn7QqMMpVLyaKzJKL0F
	 fwoWpI3nqdpypeWYuzrPcGPcmTtn9JEgylcT+cEHhy8Gkf1umTSz4RCyDWYz1LZmM/ZgU
	 PCdeQxPGM33iXxoJGo97O+milz01gdTbc+EdT6BBnUOPNhae+juL9e/6jCUbDrXIthhBF
	 PutrsZB87hhlQhSRMX+NCr9mYpXJYYwqtSycHGK4ZMumnPn3c1mnDe8YkIRE2ew9srg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="kBRtH//X";
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED3DA606A32D
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 17:27:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED3DA606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kBRtH//X
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-36fc0a3fe93so2734287eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 09:27:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794072439; x=1794677239; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZZwMrztt3of5COKCtSyFNtiXLTIolPtZxVxm9oGuspE=;
        b=kBRtH//XVichkRikoXz0f3WTHIlITZ1SryQ/0NJaXxcgxJFnQ/kWxd2qN0cvEbrSgL
         vCc28+x19SetD/5AU+3gDnvpS5OHzdWqfuGF9UY7PUv1jH8TI7eChX3qnXl5d9fW16gI
         /0XbrUdOwcKCKgx74Oe+0MSoMHyiNB/WfghnbVXVBNsji+jK4eN85o+MoW6g4r6tNZ9v
         xExwIOsgc7Iw/yN8G4BEZQg3JbyGk5jhCEDiIxkXZgw//mp1v9zKzx/fWSj3iwDNn8jh
         2CKFV3WKhWqCZnbwJINRBuR+TOsiUzP/UeebdcHL1QLw8bAuVb+djeaNLs04FILbPfJ5
         mzGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794072439; x=1794677239;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZZwMrztt3of5COKCtSyFNtiXLTIolPtZxVxm9oGuspE=;
        b=SZfHdafhFEvZBXhbfQ2LSRnzz3oLn3v7MWvBss7gLSMFnx2EQV6a3DDb7ATF+p/KDO
         f+CCeICCsI+QgSDiThLCqkGJzB2u+FOOV+P6czYz3wjtD5G0DMEhNvtesoB+zxohK+5u
         CJ0ZUCQp+AJY75JpPgxOfGElbkEBGIGqM0h/hVe+mPAC/9SZ6eYRVPWuHEv6a/unr4C9
         dSQBuedOzbLy+60OTvOSMNPbSWSzUddHTqrF0Ok+MFmqMYBZ60jlq78WlFjX+zpOtNfy
         NLzUtMz8z+j5RmPYjwqpesMAsqv6duET0j3EqtW5fOVV82+RVaMmUXYBM+xDILi4grtH
         IwoQ==
X-Forwarded-Encrypted: i=1; AKwUvBwPFSt5tcvl04z84YBHZIDcx16ASAl9fdxrfPSwduDddB0v7mgCRxQup7uqhiHe/i+3HjS+SyCfYK0H4y8=@vger.kernel.org
X-Gm-Message-State: APuU4Z97k2E1tMffOoXbs92MKw8eGNpkBATs7sTd/hjRp6XGP4elojRU
	MK1dVtsPxKwmfXtIWE6Ega0mk4C2vucK4Ni8ursx9iYA99WTAcmthuyZ
X-Gm-Gg: AYBFou2BNfb/3KUJF3NAzNd/dzZnKxmtWTaC2ZIbqKcm8ZB+j6+0795/HfvhunIMent
	ySo6LcuRRPEGBnBoF6pIWwi9Im0kFP7snxEQOCyinejl777Dca3SGY7l44vpe3H1x81SZgzoGvW
	0QQ6A3W0gJD4l+nTECHIx7a8BZH4OudcKaPTON1XeQMTA7mP49Z3lZmwx2oYuiVMB0glrR9H/s4
	6G9DnmvB1LQjW75RTSCnLaoUibD4HRtHa3P4iSBGe+Z+6mopRGjzBi3nBjRtAdh1UdtQ+xAEyVb
	31Pn+cgi0M2JaR6m0vtMpe1ETXfaNqUE4kudOo/LcILk6Xs/uXIxTluI6uRSYvYRi438Id5/N+x
	FmOpaIP3C9DpKK6bquWrnR4dDeIKOHsP0JGGTjBurU2Jc2BhKgkhnqCHKtEZsGXj7pSmjBon9Dl
	pV6yHbNFCtYkLbqqYtv8q/UlbywNRqFXS2kuQKME9Pi0ev1L8MwPD2xqcnRUdnbkGj1kHiAcwDD
	WsJpUY5CLFT28iLaZm4WQn/ZLD3YqbGzrZyK40Tw7YUwfHs9VAygIFptxYWeCyJPhxRUenQl9aR
	UlBZ5OV8U2R8FswPSR1dU7wUNHSydQ2hUJPYEg==
X-Received: by 2002:a05:693c:2a07:b0:36d:4135:cd7 with SMTP id 5a478bee46e88-36f75a27e38mr8089948eec.18.1794072438631;
        Sat, 07 Nov 2026 09:27:18 -0800 (PST)
Received: from xploitoverload ([2409:40c1:6412:e5b:5516:cd42:6c8f:c918])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36faa999654sm16328165eec.27.2026.11.07.09.27.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 09:27:18 -0800 (PST)
From: Kalpesh Solanki <skalpesh942@gmail.com>
To: willemb@google.com
Cc: Kalpesh Solanki <skalpesh942@gmail.com>,
	willemdebruijn.kernel@gmail.com,
	jasowangio@gmail.com,
	alex.aring@gmail.com,
	stefan@datenfreihafen.org,
	miquel.raynal@bootlin.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	linux-wpan@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+9ea34da5ca6100593c90@syzkaller.appspotmail.com
Subject: Re: [PATCH net v3] tun: disallow setting IEEE 802.15.4 and 6LoWPAN link types via TUNSETLINK
Date: Sat,  7 Nov 2026 22:56:54 +0530
Message-ID: <20261107172654.302210-1-skalpesh942@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261107162649.282982-1-skalpesh942@gmail.com>
References: 
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

> Should this be
>
> Fixes: ff4cc3ac93e1 ("[TUNTAP]: Allow setting the linktype of the tap device from userspace")

Yes, will update the Fixes tag.

> Cast to unsigned short in these comparisons?

Yes, makes sense. Will cast to unsigned short in v4.

Thanks,
Kalpesh
