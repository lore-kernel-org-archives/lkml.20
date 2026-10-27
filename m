Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793136312;
	b=2qn7XLouw2S/pAuq4f8kHxrQa5Q/+MOrrSefcr5Ytc/uH0T4DIudBH9eXlXuUnj0g5IQ
	 GlMXvR+R64Sv5h7lOxoe0VoWzI5azV2YQ2GtLHDwEpgD7OJ3RiM7Uj6LZgLxgxSHq+WY+
	 4yBS9V4emyzVqwT0ceFBdchJErCCZ1N56Ajfw7GQpZ3ifowXR5jh0k8lVpd3Dsb7UaXrz
	 xT74h4dQtu0gL7PCvPDR/EcAv6pP5vNXbqctu9iTrvqdXB7SFCMl77ejWU1zhKTvpLJQW
	 prpzS8qzGLRVEkQJw7fkL21AVIya6ZL1F7nEhldi3baxJXuwv1cU+axuNQCpCyZMtpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793136312;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=FF5WnnOMO3EPNW7Tu8nfwZQBRS3X57+RVAxmjEP9KT4=;
	b=CDZr2OPdNrfvK733gowfXXTXOSo+PDrnu2ErVzQvddvXI0kDsS0mYy7dtblVoJM/gcBw
	 E+j+tyrByqYJQcjZRuYesZOWoIgMDM3nEzfdqBtdZ2/N3NzaPxutKgmxdLN3JLv/nSuSW
	 FW4A6oxyY60GKHcPGSL99BBoyXVNXSTuBz5wmdyikaL/95DUeNNnlnez2W5yHIcIM7jqV
	 MS+gXO91O9VC6W1j7TJ8cwjtnZKd12woIMtyqQFJEoiphfl9AyGAJa6pLNEXXRLUhmJPB
	 1za9lYUGi/+rLzB/IgPa8poyJhxervnMzOevZ0l/n7G6SQAu+lc/GmRjWCd0iwbL4Gg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jDgMYkdC;
	arc=none smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16B4E606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 21:25:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16B4E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jDgMYkdC
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6b408f2d936so575949a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 14:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793136310; x=1793741110; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FF5WnnOMO3EPNW7Tu8nfwZQBRS3X57+RVAxmjEP9KT4=;
        b=jDgMYkdCZ0/aX/InBd/FYxPslr+3Q4rInRUJRjGR8BMFCa4dmOhpdLhhxJr1bohyat
         NlnazmJYNdbc0RPHgqjdNeUhUiGrRHZPk44EqqzfHcc/M6uMaON8CnemrF8M+ZiTDewZ
         xNvG9+1kYjA99CINrHh3/3NyTxENQ9nYmaZBZF9BiKdll/h2eIQJiceeGtSl+ogjQNZ5
         /M08jVEfHN72r1mWPRx9ZpJNv2zwPpCho/ui4MAu4/of/UtWmKYndjWH68F9jtsPmZSY
         3OCj2YPRvV0BPYYtnTDTZnYDL8DEWw9K+SJBhjSWrXP7dkdp7anmqST6R8lHi8f5KXWX
         2UGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793136310; x=1793741110;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FF5WnnOMO3EPNW7Tu8nfwZQBRS3X57+RVAxmjEP9KT4=;
        b=i0QgCuFN3ocmzOWjGj0FiwRcdrq5/lVIEI1e2DFL9huKxdg44zi4pO6NLFNAVvnm4G
         hDbQ8t67I1u5Y5SwEqTaHB/iIJActx8hhrkvxmxeQcaNb6yuAndful5Har2mamW8to/h
         +ApAuHGFbL2hwHfGFju0ayDUH8jrkLWQd+i98j+gxZB3nDCu5zE644sGdIU+sJi0X8B6
         pjUXCx6sJF91gKv1hUiqJgevza5jVvXRLtOzBw9u7nP2CLiPMFkm7r2JdvJ+SFUYiNpH
         vxuScvHo6dwKBmq7/XO5q4T3FjhM7UHt86u3YMQ2TSjiP4KymTeArR1tnFLnd4ujiT8C
         MfYA==
X-Forwarded-Encrypted: i=1; AKwUvBwb3Z4QYxOdINr2+gJzRkONjkAcYJ+YeY8D9txp/d4gCvlsj+F9A8ftQmXC24ISqO3CXHsH8E0kY8QgnYw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKKDDUHnLtuXq33654/1tjpsdwQCjN4BiGb3dTRDvOQQpA2uq/H
	/iEqLlzf2Onebu3KLpsmpHx45L0v2yu20BlpAqfx5dEDchZ6HL9n6r1a
X-Gm-Gg: AYBFou0ut/P7pqJVd4Cf+vkKorIHCtN7gbLHUxPc72i+nxTQkqun5IrbYJ9An5khGT1
	EKmLFRNJvUwtsPqGAwptcUYSVnN0VmJVNwYRmM73a+IVZAGhRnQpqfmaI/RKs881ko6bSt2MTYL
	nbmhZE8DvbHM0Vqc5dDy65jmu8zOX2mscVD/Mq0cLAWcg20N9kL3YiABycxz0oQQZW46t18iy8I
	un1ZL/+11xr7fpJo9wop2Yfi/6pEHGWFZC3KMEKktjfsu+jiryk12YfB5uMyRnX2lAqU+HWS7me
	Y/yijaMFDPB0kY86G2ltdXKS3pLlAsT/wbL6MsJqPVNrkBlqFtRHGfG6WTdVSkuI7u/V7t0PyI3
	JjsIUzQWE5fHsHPZinWbXv9AeO2wC0gIJuJUyidPy/Z1KO+jzd3yEIGQ8SZgRsMHmNrhvUgBxVx
	5l8SQHZG/O/viV7L2z/464y4eOCTIvBUC50d1WVZENKFBAftgcX0700GvGQFwir8vZmld0s9DPU
	YqSfR4LghBTiK7XH3pHovZbO0B/T6ElHIhN/ytmyyr3l99pLG4n8tYF/k+Lzk46D1Fj5BvwexNW
	twbC9cYn3wywV8QmzD0KWZg3P1Mbqbmuz7TpY1KgTMJ68Uy/hwt/fsL5f6iM
X-Received: by 2002:a17:907:94c2:b0:c40:eb1a:4c8b with SMTP id a640c23a62f3a-c49bdf77980mr40681866b.29.1793136310349;
        Tue, 27 Oct 2026 14:25:10 -0700 (PDT)
Received: from CCM-PC (83-233-221-133.cust.bredband2.com. [83.233.221.133])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd350b52sm513224766b.7.2026.10.27.14.25.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 14:25:09 -0700 (PDT)
From: Yongzhao Chen <yongzhao.derek@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: netdev-bot+sinfo@kernel.org,
	netdev@vger.kernel.org,
	Christian Marangi <ansuelsmth@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-kernel@vger.kernel.org,
	Ziyang Huang <hzyitc@outlook.com>,
	Stanislaw Pal <kuncy7@gmail.com>
Subject: Re: [PATCH net v7] net: dsa: qca8k: preserve port state across MTU changes
Date: Tue, 27 Oct 2026 22:25:05 +0100
Message-ID: <20261027212505.1848-1-yongzhao.derek@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <47e9713f-815e-4caf-8928-a7ec12d0087b@lunn.ch>
References: <20261022155837.760-1-yongzhao.derek@gmail.com> <179268501671.3290.6623232109527554630@kernel.org> <20261027092718.266370-1-yongzhao.derek@gmail.com> <47e9713f-815e-4caf-8928-a7ec12d0087b@lunn.ch>
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

Hi Andrew,

On Tue, Oct 27, 2026 at 01:54:16PM +0100, Andrew Lunn wrote:
> Is this a real problem which bothers somebody? If it has not been seen
> in production, it sounds like it does not bother anybody. So net-next.

It has not been seen in production. Following your suggestion, I will
move it to net-next.

v7 needs another revision anyway. Sashiko's review [1] is right: a
concurrent PORT_STATUS reader such as the PCS poll can corrupt the MTU
snapshot, because the qca8k regmap is created with disable_locking and
shares its work_buf. Clearing the MAC bits unconditionally would not be
enough, since the restore uses the same snapshot and the MAX_FRAME_SIZE
write also goes through work_buf. Stanislaw's patch [2] enables the
regmap lock. With it, the v7 code passes a local KUnit test that forces
this interleaving against the real regmap core.

I will send v8 for net-next once it reopens and [2] is in net-next, and
say in the commit message how the problem was found, as sinfo asked.

[1] https://lore.kernel.org/netdev/179303171241.3134.15019965307136674652@kernel.org/
[2] https://lore.kernel.org/netdev/20261022192933.384898-2-kuncy7@gmail.com/

pw-bot: cr
