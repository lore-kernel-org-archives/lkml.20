Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794821090;
	b=bXCkukOKtXXLf/uKx+kSpeDzkzmpgN6MPIH+ycsxaVOPmISuCoXP5KkPgioH7wbDXcnH
	 w3cYJ4LHlxbMHyPgyQ0PgEqx+pl8HUJbh4rKOmla06SCaQEPxItgJxv7Zx7Nm6pXuFZOT
	 8F9bDwspW898e8oWMTt1fSUGr6dG8CPJ81B8lm18zNW4pWqojnmkfcSk6G0FqltHpsgGt
	 UHbTojr3Hy6n5dvWHcT0zBwYyL/Gnry22QdW5tpZHiMQ2Fa/amtx1BVsYwerjTBYap2Gt
	 5JO1WYb+JmSO+AYEgkPcy+q9ONyGsGbYcYdGTfcTikryN78pqi89U1/awqdSVNqA4kw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794821090;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=2e8OfKa72MuG5l//Gx+5Pa5JLpMbf0mtMmXDlvYAirg=;
	b=FUD2c9Ml13Lg3n+ewSa/HyjhsGR4Teyei/Z7DXq86pedG3HXj8L+H3zyK5uWU9hyq8/o
	 uKNs9SV5HPqVhBVW675WkUHDqso6dZ3J/37U0KElJ/3EPm6Tch1VH9hNooSfMxUnwJkL+
	 6i+FpOThGevMrqoNVzzJzGIrhwskenzByUDm3nlF5Lj7kKZUTI+kCsrL9+v/CIi5TD0Wt
	 g9JqF+r19zT6oOV8//kPVF3Ui8t2JWVdAOGsdYDKtsdKR5Qt2aNn2DCZHADdEuFGXAohT
	 dQPmclZiJqQWs12fUroqj7oS8W1AeVBhLNicPwD3vhXfPEWtJz042wMDd+LIRI9v8WQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=is.s.u-tokyo.ac.jp;
	spf=pass smtp.mailfrom=g.ecc.u-tokyo.ac.jp;
	dkim=pass header.d=is.s.u-tokyo.ac.jp header.i=@is.s.u-tokyo.ac.jp header.a=rsa-sha256 header.s=google header.b=0xt7YivH;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BBD4606A330
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 09:24:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2BBD4606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=is.s.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=g.ecc.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=is.s.u-tokyo.ac.jp header.i=@is.s.u-tokyo.ac.jp header.a=rsa-sha256 header.s=google header.b=0xt7YivH
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-36f8cdd30beso4818704eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 01:24:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=is.s.u-tokyo.ac.jp; s=google; t=1794821089; x=1795425889; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2e8OfKa72MuG5l//Gx+5Pa5JLpMbf0mtMmXDlvYAirg=;
        b=0xt7YivHXf5ENmQKLYKekr7VO54fUwZYzdQVUIwvYBNoHUIVdu/lhKbe1puoUnTfxB
         eGJBIBt3bUyBBfHzPXxv3hdVwkfggnawZQ8YNTFVWs6coD/4gqTGqTtuLOJHSlDWzKpo
         nAd8d5ctNbqcAkDmVVc1udbjU4SSDhjtjX9eNGgiPm7I/L7ucfX84DsGncVg90E8km5T
         67qeSdwZL547ixEDZNmCX2NsLL0KmoHiC1KNECeOaIE39d4vhHAsttsjKqQOAjFH91Ko
         XtxfmA2D7wik3ql+hRAilriV3zg44ChJpd/XjR7NixPg+7ct2sUzBQAlRcqO6FmgsNB4
         pw+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794821089; x=1795425889;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2e8OfKa72MuG5l//Gx+5Pa5JLpMbf0mtMmXDlvYAirg=;
        b=UuinFOcR7RGCJp36r6pVMNTheRK78Pp1rWaf7YCt8EgtIEJgVTyk8sooGHzvxWB7K4
         2XtaWYnmYBxEfpiiKYjXYWS5zgDXloTMOO6S9uG+edjwvMw9njjkexdAhzHb1ATzt0RF
         dyCcWKJc9+1nZvY9tx0FRBNe+AQSO3rQLxexG0/YgNJ4DOi+C+VWhteNeS0qRMYNdFki
         QxgN+fFmOOGGUKnvNTg3c7Bqr+Q1kX6UPEpVO1Ft09MvLbYxlCA/qY5N0hNpz6eE9/GV
         OtpqpCiHzzrcQ3scdB7cb0quFbU+3nP8ktfhlvuwRT2oE2x3qeyIC2g41JLZ6xvIJ/UJ
         wVuA==
X-Forwarded-Encrypted: i=1; AL+hErHaNs/Idf9gsrVRbWkFePVqvLikOGs/iarq4ykGT80+fIWz+BlmUooRL2rdp2A0tH92scw4PBzFkeWqTU8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9d+shcs49H9zhXL8U1dpZ6oIINxhs7OWmkaqu2LVZfi1WALgD/
	PQs4rPZCWYg7/Ij1RmFOBmrmf76t8qyGIxgJac1/C8dsgDAOCyOA5NHv4kmU1OaoVA==
X-Gm-Gg: AYBFou210jS3GthNLJ63rM+MvS9RSOsJL9tgldgn+jjUwZkiLni+CcPJCCs9aHchVQA
	0yZzfb4kNgb8EmtfuI+XjQQO3HLysqR5AUltjRaNMD0tzMJp2Lk3vdYxD9j8LeQM1ZTGLLJ29he
	L5mXC/QAazPYPHwYs1cikGDur+rTChwUNfJlnox+DO77uY790q92HqQcF4i6IwH16QtG6xKdc4Y
	JjickcTeReyw1MnvXCfvNtV78Sdkx8EzFjN0x4GSjFLD7X50zeNwdTDgzbtwU9VciD/OtxWc30i
	z8vWjoXir7utDE6iqg1EOk1G4WzJvbU9NCVCFXKcwvhlUTHE7rQZKk9PSgu8ffNgJzBj4zmITjC
	GKi8eZYAW8AHH9OBxqGJfMq1Xqrr1MjsH0l+hY7TYI1U8CDBPNWZsnOcp4zBhg2V0r+1NSevBBj
	QQwyv7RluzYi7MnvOzO7Vw7eJKd5z4Kn28C9pC9yaE7kPuu9HVFcodSYkkcVEACgY5h/QrlJWCm
	RQO7BYLl105JOVBqhfOV5d6LUUIU8cpCd2FsEDtEYkIW0WYW1yRv3BIotH268XJl4/OmaClALz5
	Glx6Z58QofaHeQwoWUyn0n2Ya8Tp6Wq/Hv6EDw==
X-Received: by 2002:a05:7300:dd03:b0:351:2958:1740 with SMTP id 5a478bee46e88-379681c67bfmr9514769eec.37.1794821089011;
        Mon, 16 Nov 2026 01:24:49 -0800 (PST)
Received: from wang0.localdomain ([133.11.33.33])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37956bad6casm32056314eec.26.2026.11.16.01.24.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 01:24:48 -0800 (PST)
From: Lianjie Wang <lian@is.s.u-tokyo.ac.jp>
To: "Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowangio@gmail.com>,
	=?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Lianjie Wang <lian@is.s.u-tokyo.ac.jp>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	netdev@vger.kernel.org,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Bommarito <michael.bommarito@gmail.com>,
	Takahiro Shinagawa <shina@is.s.u-tokyo.ac.jp>
Subject: [PATCH net v3 0/4] virtio_net: fix out-of-bounds accesses and a heap info leak via the device stats reply
Date: Mon, 16 Nov 2026 18:24:41 +0900
Message-ID: <20261116092445.3391334-1-lian@is.s.u-tokyo.ac.jp>
X-Mailer: git-send-email 2.56.1
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

With the statistics reply, a device can make the driver write past the
ethtool -S output array (patch 1), leak stale heap or loop forever
(patch 2), and read past the reply buffer (patch 3). Patch 4 returns an
error when the statistics command fails.

Claude Opus 5.5 was used to audit the driver and draft the patches.

v3:
- Rebase onto v7.4-rc3.
- Add patches 2 to 4 for the issues raised in the review [1].

[1] https://lore.kernel.org/all/20261110001659.1654289-2-kuba@kernel.org/
v2: https://lore.kernel.org/all/20261102205550.4148064-1-lian@is.s.u-tokyo.ac.jp/
v1: https://lore.kernel.org/all/20261022182710.2055771-1-karin0.zst@gmail.com/

Lianjie Wang (4):
  virtio_net: reject stats replies for queues outside the request
  virtio_net: zero the stats reply buffer
  virtio_net: keep reads of stats records within the reply buffer
  virtio_net: report a failed stats command as an error

 drivers/net/virtio_net.c | 33 ++++++++++++++++++++++++---------
 1 file changed, 24 insertions(+), 9 deletions(-)


base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
-- 
2.56.1

