Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793334912;
	b=yOeb4v3Sg+ayhaD7gEVaLJf4nFIyWGW/5LGRoziMFMWz89654dma2L0ZdLJR3pJH3KBs
	 0momGhQnNOJV02e5QXKtzWWN/YfFJqfOGQkw5zMM92MB0b43KNxH7RFnfCAyH4/hoIQS3
	 PsWszKMNnbd+mXNNxAEes+ShiTQpWZB8huV1WIoNTmBiP4ymeg1RbnFY4BvQaPdxujnsK
	 c0Jv5m0jvkj3WEY8KO528zavEXY8hyiv8fJ4psAlTgMRwInQk3kThxgyVeHtMQw1fMWMM
	 /pm82mCl242DCxVVc/4Xc7JNuhFhro5jjFN3aehaWl3pZMqU2Ub8bhIpIoNDzeTgy1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793334912;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=0PkYgmZJJfNK/8KcuDT5iJGwkOjlJWHzg/w8kW8NVzI=;
	b=KoGQBG61vGJJDrteaihEse8r4inou3NRgHuOLI9D6KeB5uPw8rKWvmhK3bo9zT4RUI/N
	 1mCYDf78HSyNjtdl4oRouyT9hQcJnn3TRrrbZ291rn3+skbjQBhAXBZF9yfIfTzpUKyg7
	 ktUEtrhkIR9QGbwqrmb9Xd10GZ2rdXxSBsOw+d8V+4UDEdhp30956rWbRRzl54aQQZLoj
	 WxO+++aa4Zk+3dfRdSj1oeUiCZrFB3x2GjXYVN6Xex+5e0c0Kd0DqxHj/22e5vCyN4mOU
	 uEOWp85cArqOvWLZYbZa/xu5PYo4JySmwcWQUsfWp6U0tnX2bY/MDKYD71xys6luGgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U8OcdVlu;
	arc=none smtp.remote-ip=74.125.227.131
Received: from mail-pj2-f3.google.com (mail-pj2-f3.google.com [74.125.227.131])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03069606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 04:35:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03069606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U8OcdVlu
Received: by mail-pj2-f3.google.com with SMTP id 98e67ed59e1d1-3ada6c66964so63993a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 21:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793334911; x=1793939711; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0PkYgmZJJfNK/8KcuDT5iJGwkOjlJWHzg/w8kW8NVzI=;
        b=U8OcdVlu9IRAgvFWuj2XLyEYqE2nZ6ehV3B3SIPC7N3rd0tyCl1W/M1tnVTOjEXr81
         pKeTCB73BvObX1R1hSnzGfCRfhrvUIEmht4+t/PMKBZ9Wz+uLTgStuODZBa5WfAQN7RW
         qAYMsvqCf9N+qX/eAbT0uS8O+ibX1NY2cB7ffyBEccJJPgo1lMSB5JNiUurjnMcvSr65
         n4f+ThFcv3p3jieHsB0JWnlGIoqLNuhkn26y+tavZDD7Xx7PGy0DP+X9fjNwGjtGY0ZO
         WOZ0VpAAg8IT1zMCazcTOZsqbp5wSFZcyk6kcKPBFctBbgq1371fBlR5oLcwbCjewghK
         b+IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793334911; x=1793939711;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0PkYgmZJJfNK/8KcuDT5iJGwkOjlJWHzg/w8kW8NVzI=;
        b=Q2vmHUv6xblxzAdEyXeYma25SSSo3AyOQXnV4XOoxX+KvWYpNhM3feY8PUcY1VdDI+
         AhbAKPjoOB85O5uWLuQFVLHOjiVvSwk/gmU7PcM6Mat3GZG7sQKhKTwmG9VSa1peX5Kg
         iTvIzG3MS4UtPOhMEJ+2pOx86zDrHGV+jeWX4xkz9AD1HGg0kT0Gxglu99r8LsM1pz0T
         0ZuWN+Td2bqM3DZN9Lvl9CS1LsiCwQxPPupjQVre/15m/BAziFVlinmjo96pE0NlhpjZ
         VvxJtZmU0XkmZiXJLFFTV2Q3uolRtCH8IBguZMW0f5NRZTtMLrvAY4eyGJrgS5ek+Ilt
         llCA==
X-Forwarded-Encrypted: i=1; AKwUvBxRdUTFT7PKAJRm5gMtM4QF4r6ECVG8wa0d/d3ePaavnoJauGn1aLA6RhjPP5ZwsGD4aPUTVO5giEiXN4Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYIY0Utz9d7tA6bEp2u5fOkF/tfXlm+zH4mO4nZG+QWk2eRaDR0C
	g8eS3o8sqhs27mxt/unaUy0t5UMuntV5CLflYC2X6zotTUL+7nVVspGi
X-Gm-Gg: AYBFou1e1/HXVky4hqcutsCmKnRwDHIYNbN7XljSrVWrRkdd2BvMw6SiyFTRiFt9doo
	O4b1Z5BZGNpcgxb3CEkc8p/psSHou6Bj/wrRPPzEhEaELAUp42OCF9pXzyN/25+RtyRGX/RB2RS
	pobCVpCF5NB0kTrwPKhHxYqWSLOxEA6+qzAk8VgG0YpOwAs5m37l5/bVq0DAY14d6SNFAsNN4fD
	2N8UcNIe+Zwj1XJGstMum6pJ2TD+bTsQl21pPcpUqbw8plIe7TK5szhDi9iiUL6jklM5js8ko9X
	hQCInx5aDC6KjY1CiYGoIO9FqiE3TgC1TlmrV932D5LKtj1U+pkCmVx47SbnsqaQTVMPRgtMkGq
	AJEJYx0dP8bYRPYbAGgTKDgt6R4qoYjiVGdgmiOklLFm+Jvhrqdee+4iDJqYWZJz38dUBHUeAQI
	UdpOFMUYtbnWSrDXVgWefP/0f1PkloyNSm222VaUJSNaWXUZ5KYRS8tFg3J6h53osPjInI/2x6S
	w2vB3+1UzuynALuirGdJFzjYlllV6TX8A2KzN5/YrODnu8crJT9f45X0sIHfW978S5mSmdF4m8U
	sdDKEwzTI0mMVBlyjx3jH4IoZfCMcPhh5b3zBQ==
X-Received: by 2002:a17:90a:e7cf:b0:3ac:9a54:e3ce with SMTP id 98e67ed59e1d1-3ae8986e718mr931783a91.63.1793334911260;
        Thu, 29 Oct 2026 21:35:11 -0700 (PDT)
Received: from amax.cluster.local ([115.233.223.43])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae85f37e7esm934372a91.1.2026.10.29.21.35.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 21:35:10 -0700 (PDT)
From: l1za0.sec@gmail.com
To: kuba@kernel.org
Cc: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	pabeni@redhat.com,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Haocheng Yu <l1za0.sec@gmail.com>
Subject: [BUG] WARNING in nsim_vlan_rx_add_vid
Date: Fri, 30 Oct 2026 12:34:47 +0800
Message-Id: <20261030043447.3557387-1-l1za0.sec@gmail.com>
X-Mailer: git-send-email 2.30.2
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

From: Haocheng Yu <l1za0.sec@gmail.com>

Hi,

We found a kernel warning in nsim_vlan_rx_add_vid() while fuzzing Linux
with a modified version of syzkaller. We couldn't find a report of the 
same issue on syzbot. We are investigating the root cause and trying to 
develop a fix. Could you let us know whether this issue warrants a fix?
 

The warning occurs on Linux 7.3.0-02415-g7be4bc52fd9e (#4,
PREEMPT(full)) at drivers/net/netdevsim/netdev.c:569. The kernel then
panics because panic_on_warn is set. The report also shows an existing
SOFTLOCKUP taint; the relationship to this warning is not yet established.

Relevant report excerpt:

  WARNING: drivers/net/netdevsim/netdev.c:569 at
  nsim_vlan_rx_add_vid+0xb5/0x120

Relevant stack trace (inline frames included):

  nsim_vlan_rx_add_vid (drivers/net/netdevsim/netdev.c:569)
  vlan_add_rx_filter_info (net/8021q/vlan_core.c:211)
  vlan_filter_push_vids (net/8021q/vlan_core.c:262)
  vlan_device_event (net/8021q/vlan.c:483)
  notifier_call_chain (kernel/notifier.c:85)
  call_netdevice_notifiers_info (net/core/dev.c:2260)
  __netdev_update_features (net/core/dev.c:11179)
  ethtool_set_features (net/ethtool/ioctl.c:155)
  dev_ethtool_locked (net/ethtool/ioctl.c:3488)
  dev_ethtool (net/ethtool/ioctl.c:3669)
  dev_ioctl (net/core/dev_ioctl.c:745)
  sock_do_ioctl (net/socket.c:1339)
  sock_ioctl (net/socket.c:1446)
  __x64_sys_ioctl (fs/ioctl.c:583)

The syzkaller reproducer opens CAN J1939 sockets and issues two
SIOCETHTOOL ioctls with ETHTOOL_SFEATURES requests for netdevsim0.
The warning is reached through the VLAN receive-filter update path
when network device features are updated. The root cause has not yet
been confirmed.

Full syzkaller reproducer:

# {Threaded:false Repeat:true RepeatTimes:0 Procs:1 Slowdown:1 Sandbox:none SandboxArg:0 Leak:false NetInjection:false NetDevices:true NetReset:false Cgroups:false BinfmtMisc:false CloseFDs:true KCSAN:false DevlinkPCI:false NicVF:false USB:false VhciInjection:false Wifi:false IEEE802154:false Sysctl:false Swap:false UseTmpDir:false HandleSegv:false Trace:false CallComments:true LegacyOptions:{Collide:false Fault:false FaultCall:0 FaultNth:0}}
r0 = socket$can_j1939(0x1d, 0x2, 0x7)
ioctl$sock_SIOCETHTOOL(r0, 0x8946, &(0x7f0000000080)={'netdevsim0\x00', &(0x7f0000000040)=@ethtool_sfeatures={0x3b, 0x2, [{0x25a, 0xfffffffd}, {0xffff8000, 0x2}]}})
socket$can_j1939(0x1d, 0x2, 0x7)
r1 = socket$can_j1939(0x1d, 0x2, 0x7)
ioctl$sock_SIOCETHTOOL(r1, 0x8946, &(0x7f0000000080)={'netdevsim0\x00', &(0x7f0000000040)=@ethtool_sfeatures={0x3b, 0x2, [{0x25a, 0x1}, {0xffff8000, 0xffffffff}]}})

Best regards,
Haocheng Yu
