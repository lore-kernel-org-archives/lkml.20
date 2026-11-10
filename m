Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794334374;
	b=Fb56jXPfGRgVA3A9L4k+v3XwcQyLKGY/+WSSdIzfefsZWppRbLg8Foxe3Itbc4nFcXat
	 dXBBE77f7PUbRD0PTShFprxu6G5qe4cnFKg6PhKXsAP3R+ad3+WrkyL1XOm/Fs4re4/WJ
	 xVkyqqOEdYQZ1w489hiNIwNk6bkw+gixLzZjb6i/UsIjJ966EjelqWQR5v95TuulL0NgK
	 v3E9TNqP8lBKWfIWJ7yQMN/ejG4VZod5DjZ7bT7r5+gNRwnYMcfMmEb831+BAFd4r+y/+
	 0JvguNQhdm+be7D0vdZWN5PkZ02vPwvC/tRddME78iVxdVB+12pGlmVKPiJIPQ+NwIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794334374;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=68pKDA1p2LdEONMliWN80HdZe29k8kOJYDnRCJeXxak=;
	b=IJRsCKgbPQ4Q+5gj3UyM1Cx4uyDmCMrzSv7F4BCs5y4S9XArXRt3VsHs5+7YaLSyY7mT
	 7k862cqcvnkFWaTCWHvvI4bAj8zzqxLDSXIY/g2DanOsugszbCLQlhad8EHJdXN9PTV25
	 xQ49nEj3Deaya9rPxSjhTrhJuj4sx5iT1L71gFuvVCnh7JdcR0ZITeryERnnMg72JrE2R
	 d3gCFwclW+b5eI11FGByMzHTRaXp3hVk3XreWmPXfEA0ZX4Q894QSZvgVyD3BonmoY7Y+
	 7nCz0c6BIceQwWmmACE0vgaSp1T2XafdEmL3EBiO4CGfMLlWZu69PAZ5nLsEbLTY1oQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tS5pn8Yi;
	arc=none smtp.remote-ip=209.85.219.53
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0F19606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 18:12:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0F19606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tS5pn8Yi
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-91ebec7d5dcso17988806d6.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 10:12:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794334373; x=1794939173; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=68pKDA1p2LdEONMliWN80HdZe29k8kOJYDnRCJeXxak=;
        b=tS5pn8YiT64Zd9lexBBZTQYgUn0ddUenE2ATM8vMaZ1MPspNzyROAIXQHAXOUwIrac
         5FpzRX+iTDtkR0zhccjnG59AFXZKzj5UpgnP1iJEC7nuuC0xu4MQ+0Bd9LfClbfc7uzf
         IMovpPts3lyTygm2Ue1nDT7LhW2xyvsJBoT9t1XlD7OD9gf8XGs245NMk6TLlfaA5Cmu
         xwKxenpVK3Xr4KOyt6vXpwBuiKn6psxaZ0Y+AZf8RVc611D6x4COmbVGw6l62uSOxQp/
         i9Vg/iUhtOmE+rJlBiF/9c4q7ZO9RzeqsPBF0emRYoDIN83Wcx0wOJAbsg56/bI0AvQ0
         j5LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794334373; x=1794939173;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=68pKDA1p2LdEONMliWN80HdZe29k8kOJYDnRCJeXxak=;
        b=VQ0DT8Ui440rXy23Bi7wgAz1jI9fQtHlexzx/T0ZyFU/vTWwVUhYQAGfqc9GKUnVlo
         uWxcR+ynQyhFD31311v4Qbhb+6SAupvI3oUCg9Yla/qmxwyEwtYw94cqaOGrwZvr/zlI
         scaA2Tb4bIV9+yNWPzqkY2S1G3NJCPqDlSBKxibc65yoBRf7lZD3arKGKr/aHU1StxAA
         5wJ80XI+CnvjjJsQGXOesGK8oT08ytzwFBMDJ/+PKvHicR5tx+C1mZT2dbCWz5frUdoq
         coowD+pWuny/X8lkHPp9iXcOOeURT95j1lJtsCqwTurChPtESYGkge9+IKhpKVJ1Yh9A
         TozQ==
X-Forwarded-Encrypted: i=1; AL+hErG445IACJQRqvKJQN2jfgVQN0DYBztdPo0whbdaFFyNwb9CzGngWcFuVfjSZz4yBwK9ht7NVaeKZXvsALI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+FTF89XKdZNZWUoqMk4t96GSTcjmJDWnXJMEo++D1t1F0pH96S
	NGvbOUAdY1U5oHcgGqxGBiEuSrvN4dtCUJRyTQ/9+jmRsuVOenMQOQsI
X-Gm-Gg: AYBFou2CvlEc2bTKg2ReCYXItLG16V2DeZHSP1bDxe8ehNFeheTp1q6HaUHNCAB6E2A
	MJN8qgQbpqmffLhOTJRTTgN0HlvlDlR5gRYEtMmCwx4OYdaTNALLxvxWFJW2B5+QwkvSzFMLDKx
	tt72hwsJfuGrvsQMLwd3VundqlUIaQK+OKMU2TTs8bIifdlZ3LAXrJTsJk/vluQiyY3fOtz2c5s
	UMU3BsXsOfCUFaP1+ScYCCRHCWsRjYmqUZRupwv1+nNhT4SzIcXglYGnBVBxlmh1F0zQl6AXz0J
	3+ZFPs5N+6z6vhx3cz450pzEeCvnGpQuXy18oKrRUc0ZtbaOO46wgllJ9CMW7PQReG4/JP+DapZ
	qhlhD2F8stF/Wk7n+5+5oWo44Upb6/D+ByFYoWzuK5l+m2kswPEqnKUZYj7dXsfD2ohUPAnQ82J
	zdiBS9sV57e0TcEaqvJwcqAjeMruwZW6nGLs4IHZX40QCysvggiveL0koghnHYc4SMHkuCS35dM
	hJPk7yWXLjhq1Kr1okmcPgTJz55dAgXS+qC4oh0/Xp860cmVFU+BwWdX3BkdmYDBUW7p9qeWzUU
	Y16h5wzsjSDQagWe9E+f7aPM74nfN+l5oHzD9vSns9dkUGihsUt5aezTCoUMJW1Ewn2X6SZ3Lvc
	CC58aUxiwgngv92oiaF3NZrPz9P5EB3y/YN7za7Z8J97VozHXYnLoXB8jbnnl4tPRQQR5FbutMy
	eyfN4tNqb4KP+4ziMp4aUVNIkocNMwPdOFRj7XNwEQt+ZGSoq7WQkZXyI4MiNXen4Q4Jj0K+TNS
	PW8HgPYYTJNWzng90+IW4yHg8LuIdKfdk5vZUd5ws4bLw==
X-Received: by 2002:a05:6214:238e:b0:91e:9db6:c324 with SMTP id 6a1803df08f44-91f041351bfmr1113006d6.40.1794334372476;
        Tue, 10 Nov 2026 10:12:52 -0800 (PST)
Received: from LRMS.tailf8556c.ts.net ([2600:4041:5024:4b00:940a:c6ea:f292:3644])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f017737a3sm4800156d6.8.2026.11.10.10.12.51
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 10 Nov 2026 10:12:51 -0800 (PST)
From: Jesse Casco <jesse.casco@gmail.com>
To: Rahul Samana <rahul.samana@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
	Rocky Liao <quic_rjliao@quicinc.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-arm-msm@vger.kernel.org,
	linux-bluetooth@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-pm@vger.kernel.org,
	quic_mohamull@quicinc.com,
	quic_hbandi@quicinc.com,
	quic_anubhavg@quicinc.com,
	Vivek Sahu <vivek.sahu@oss.qualcomm.com>,
	Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/6] Bluetooth: qca: add QCC2072 support
Date: Tue, 10 Nov 2026 13:12:50 -0500
Message-ID: <20261110181250.47751-1-jesse.casco@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20260727-rb3-industrial-bt-uart-v2-2-2d100f30e202@oss.qualcomm.com>
References: <20260727-rb3-industrial-bt-uart-v2-2-2d100f30e202@oss.qualcomm.com>
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

Tested patches 1-3 on an ASUS Zenbook A16 (UX3607OA, X2 Elite), 7.4-rc1
based. The controller (product 0x20, ROM 0x0101, board ID 0x17) now
loads ornbtfw11.tlv, ornnv11.bin and ornbcscal11.bin instead of falling
back to ROM firmware, and a phone pairs and plays A2DP audio.

With the mainline A16 DT (M.2 E connector, no Bluetooth node), patch 3
creates the BT node, but the card only powers on with Manivannan's
"Bluetooth: hci_qca: Add M.2 Bluetooth device support using pwrseq" [1]
applied too. Without it, hci_qca asks for a "bluetooth" pwrseq target
the connector doesn't provide, W_DISABLE2# stays asserted and reading
the version times out (-110).

One of five boots failed: the rampatch download timed out
("command 0xfc00 tx timeout", "Failed to send TLV segment (-110)") and
the "Retry BT power ON" never completed, leaving BT down until
userspace powered it on. ath12k was bringing up WLAN on the same chip
during the download in every boot, so I suspect contention there.

[1] https://lore.kernel.org/r/20261005-monza-wireless-v7-1-5a6de7662dcb@oss.qualcomm.com

Tested-by: Jesse Casco <jesse.casco@gmail.com> # ASUS Zenbook A16 (UX3607OA)
