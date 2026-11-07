Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794032957;
	b=4F2cDctGaFqCx9bBp4Qm8y08mJysz6kBMhoBmHQCsLJttqOKcPF0hIT5OldG93ovQ5w+
	 dEHhAImPiQIuZ8mrRngD0ZyboAJd1s/8/rkG1ELaOCQgzF2C8ZYMtTbwF7vfgkc7tCoW8
	 U72FCpghHg9p5PwBxfncMgiHB3Oc0/7999ju6SURSbuiPL6thjpyTYSnqfH8rrDMQueKk
	 jxc/3nDEIIVpPnHiVvYDsI2K2hal63bdKOTv9V42kIzK123grYEVHuBwO5daLYp01HUwS
	 9VtCxoUqZhzwCXLH/KlksKmZkKixXXJQ9GRmSuan2tlZqxxSFNAcmdXn1zjRftq6rJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794032957;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=fMtnBu3iCFV4jSkaCb7AX9yL/4T5RVnlRz0UlmFCWdU=;
	b=Rdmt5q70s/FeJxDELjbWSxFgRGhZCHCmVi7IwRPDX6JK03Dbt9BbeHs2cADKClC6vNbM
	 O51BkpbpwZ2DoBBTatZPCGBh64tRe6LunMvt5AmDdTawpHZqU5D7Cw2LZbwo6qWmqFTGh
	 fPuSzD9rYUtxaQE8rDlQkEV028XZfRAEWhAu/KxA/LyZYYfdOxp4PPV/Lx1Mpw6U2W2l7
	 nCzyEhqnrb6FwmacdZWTwR/3DrwBllSZrPs+MfXzQCLjdTaRy++HuvBoFygAr1WWBVjRJ
	 lgvFsVkYVEQfEdiWVbV32EEEZARKeDjIlSrkM7uRxnveCpO8EiVfkrPl5PUGFMRrPdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DSVoa1cX;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C36A5606A32C
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 06:29:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C36A5606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DSVoa1cX
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-170135e43c7so2346849c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 22:29:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794032956; x=1794637756; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fMtnBu3iCFV4jSkaCb7AX9yL/4T5RVnlRz0UlmFCWdU=;
        b=DSVoa1cXqvrAH83f4WObwyl4J3m3E83GNS1XzmhGgssIOExNh+4oFbdYhMuhCnuZ3l
         9oiwxEN5AYYTmTqCtjaZEQdLB8MHAl6y0yNsFkGrXp8ukRsJ+xiTQcJKmJSKVeex/aGG
         IDwxDtebUJOYUdPJ3anGg6XzgYLTTXRZh6iXO4NKEye+Vj40vi9nvgt7Yx+UKTCn2XAg
         NEgnOyWPCvdZHBHPdAUSZAm+YG1UmIDa3f1TpFOY2srRBX8+bRJDh+MoFQyKQkLsiX5w
         pHFFuE78TGveuOY//0RVuJEziYtuuljbaJU50M0rkBHBdJYptHvEh9KwaLR3i46bugU/
         oYnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794032956; x=1794637756;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fMtnBu3iCFV4jSkaCb7AX9yL/4T5RVnlRz0UlmFCWdU=;
        b=FgoTAzKT890Yhnq2NGQbVhYe8aQwBJ3Ut4ilTfRKGz18cULpUGDvuQwm8/YPToOiI3
         EsYinfuDl7H+QdQRKrm77TMSLV5OhXn+/rYV8Fu6q+iJSvpPHMN/toXA5GDqm57c6MMD
         a5/AQDbD+WUquvyGpJxqd5AdfZ/ljSxy21rX6s4PSBFBiQWOEuIGo4iCRrWWkMGfWA7G
         Cj8IYXmchEpswYkGCe5scTLmSgfhxv1ykdQD84dfxVYu6ELHJuj6VoJbN0sK1pDL6uvo
         otV8rEjbzE3VvlItcCRibgrhxpMGWXhN1CseirpSwRbBafdejdveVqwWs3IxlPswj4ri
         17ZQ==
X-Forwarded-Encrypted: i=1; AKwUvBx7WiyP6DuM4O0om9zmjxZwaJls36O63RZKx9oJAubLTmNM2kVXQT9Vg/+WtTLw2u2/cr7dY9O5UZR7sYE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/c362o8yt/NomDxw9CscTElna6M7fmicBZVWQjdPQ4yCDFXyGU
	CXcVPb+Xed+K2uW2TO4sbDgJ0n3jF7lcmSGD5ZWW503Pp0xXWuROvjs9
X-Gm-Gg: AYBFou3Tit+sJwwMO2nA10EZc6Nom5bsBl1f11jkhPMoS2y9U+wwSQLr5n/MAvFFunO
	Q3K3D959xrb577LXbv1RgoftegIUL6DGpl97XNNDJNfD4KdYOhJzsaYczauT7llQyDjJLzC3jTO
	RT0QXndnkd9d0ShOj2NkJ+/Xo+JnYpa9FonNfDyh7gQYHIHP4tVEQyG6DAsEceU5QAxClAKFTnR
	y4JCtAbEoAGAw+/I/1hNEbaITYZedDdC0JxBls4G5TPLlO+PY9Jt7NqhuCg5hXP16/BoZiCIiuM
	qSRtP9BxSgxNpQsx8Iaywn7/A3soxsjqsvNvEwJH1SIStGq3thYZzMOLNCJWJB7/V1RKpu1C8Vc
	Sdbgt59XWoIDT3DF2ljnNtrHQ8NHyBY0gkH09svSd09qb6uynigH63Z4laoGvThbEQ5J6/pv64P
	OQV0TKVpfaWEvN8qjRPOXCCL5gRks7nGhdPPAJyqCXVWCidopuT/T6DIWIeQwWDsjiCq27Sib6d
	Rfpoe/ygInLpqMN+1iOAU651hBdWiVloFdsvz53CMMrI1gpoP6RRCrqFffGbcMS/3/WQGoYB7ym
	U3KssNYpGKI1/CkmjQH7EFThVRsFXug8cWoqyWC88TqXuwIj15wRdCgKRNA=
X-Received: by 2002:a05:7022:7e07:b0:18d:96e8:b913 with SMTP id a92af1059eb24-1b25d38ef3emr7391109c88.47.1794032955809;
        Fri, 06 Nov 2026 22:29:15 -0800 (PST)
Received: from xploitoverload ([2409:40c1:6412:e5b:5516:cd42:6c8f:c918])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b269316725sm4004414c88.16.2026.11.06.22.29.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 22:29:15 -0800 (PST)
From: Kalpesh Solanki <skalpesh942@gmail.com>
To: willemb@google.com
Cc: Kalpesh Solanki <skalpesh942@gmail.com>,
	willemdebruijn.kernel@gmail.com,
	jasowang@redhat.com,
	alex.aring@gmail.com,
	stefan@datenfreihafen.org,
	miquel.raynal@bootlin.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	linux-wpan@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+9ea34da5ca6100593c90@syzkaller.appspotmail.com
Subject: Re: [PATCH net v2] tun: disallow setting IEEE 802.15.4 link types via TUNSETLINK
Date: Sat,  7 Nov 2026 11:57:55 +0530
Message-ID: <20261107062755.23145-1-skalpesh942@gmail.com>
X-Mailer: git-send-email 2.53.0
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

On Sat, Nov 07, 2026 at 01:51, Willem de Bruijn wrote:
> One exception is if this has never worked. If this was a NULL ptr
> exception from the start, then clearly no userspace can depend on it.

Right, this has never worked.

TUN devices only have tun_netdev_ops and never allocate dev->ieee802154_ptr
or register with wpan_phy. Setting ARPHRD_IEEE802154 via TUNSETLINK was only
handled in tun_get_addr_len() to set addr_len, but any actual use (like
dumping interfaces, llsec keys, or opening an IEEE 802.15.4 socket) immediately
triggers a NULL pointer dereference. Real virtual wpan devices are created
with mac802154_hwsim. So blocking it won't break any working userspace setup.

> Apparently a similar issue affects ARPHRD_6LOWPAN.

Yes, good catch. Setting ARPHRD_6LOWPAN has the same issue: lowpan_dev(dev)
assumes netdev_priv(dev) is struct lowpan_dev, but on TUN it's struct
tun_struct. On events like NETDEV_DOWN, lowpan_device_event() writes to
lowpan_dev(dev)->ctx.table flags, which corrupts tun's private memory.

Should I block ARPHRD_6LOWPAN in the same patch, or would you prefer that
in a separate fix?

> If blocking this proves safe, prefer as little unrelated code churn as
> possible.

Understood. I'll drop the USHRT_MAX check and avoid touching tun_get_addr_len
or the include header in v3, keeping the patch strictly to checking the
rejected types in TUNSETLINK.

Thanks,
Kalpesh
