Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792660596;
	b=SX0+qc3zhbzcQzxlMp3zeSit1LMDEOSRN48bkHADvZfOFREE0b72R3zFF699b31fY/gD
	 zO3JJE1zHwRHlW9o+mZiC32dhXPgQU96eKV2Paijjet7XX4IdX/1w839tYod6WkUrnZL8
	 4w0/VcksRHbf1ZnjhuHBQSHemWR/jO7wxHfvHq9d8G2Uo9WwCTnU7PvF8HrOpjceKWZse
	 Jpggd/e17Va24mJ6hj+DU2MEWKhNuDK/0rgib0ng3fE6bAzv6OWbwtjBUeHO/NNo74sal
	 XcJeeGw4SucDRW/KmSljlbGqZzg3MV4w1Xo6/tD+oIetH6sDTiL+HVyULkis8gxrfFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792660596;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=+AMxaezLFZtkF1EvuUK/tXZzKytmFsqIBjzoA/zZ63o=;
	b=UF5IWFwVqPaPcP+0nugSed53/pGVzAkkFj6lr6FYhrN62E2mzuJvuZTJoZ++f9/3iwYM
	 AWyHYdYUB50fiGEU6qmowFZTGtBcKR6qLoEWKD3DrM5xeTGmuN39wKm2QlUnVeI4zqDdj
	 R5MZzD7xNtNMqFYDkFfWrajeoF6nuYKs9GSN28rgXUL1WC/bmfc8gk4+FnMqTBZbOrDZc
	 W7A+8cAIMO0AbYdoQpe8qzYQkYgQtNGr5pKK6EfsHH+9cl7DAk2mu2ezEnKNrvBg0UeLi
	 DVUywrWMuCHrB8nW6mWdhQZTw4aBnWoBc18fZN2vBzlhutvB9ufTRg+dEdxLUr0Qk6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZU1HCeFp;
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25CBA606A31F
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:16:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25CBA606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZU1HCeFp
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-18cdcfc05ffso1771329c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 02:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792660595; x=1793265395; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+AMxaezLFZtkF1EvuUK/tXZzKytmFsqIBjzoA/zZ63o=;
        b=ZU1HCeFph/wJgGTzVZkhlg9w7trEg+OTizmdm4p17VwRxNxVeJcfgv3xxyI1dov+d0
         nGR/V5KoP+dm+xbTkZMoZqOM7eI7JGMva5TYXNTZVtrn+WiD9tm5hduEFAd46JI0kW36
         kmoH6LkXRygjWw3CyqeXznsmRaM57CpaTdt7UICJ6h0Zj1QMuardelo7LYXi5IUtiyk7
         nHEFw9HV09H5APytB7OdSPf4L2TGV3EFWcEY1UpjBhV2YBQxaSutYAuZhKuYipKQS/Jh
         GJ2qM1cVALmfMGH2I9KuVHUprZRv7v+tIFcfoAAQmxg64UNXjlAYl+5MxaEDfBmK94sW
         RnFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792660595; x=1793265395;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+AMxaezLFZtkF1EvuUK/tXZzKytmFsqIBjzoA/zZ63o=;
        b=PWvaeJevi4zCUOpVIge5rIKXEPPlw5QUAo8rAR49Tz6tt+6VzxHoEnGi+IEP1jkSSB
         NQSkUfLbaa9GQf3LAW3hIummxolnG0Wrl1R1h/pNoRJbCry5S1urxQrgWFfjp3PEaUMZ
         m3/AgXiLpKAQ7/vrkjBk/ES9EHRYfGfGp4k+8esOGhB/lcUKK/+4wVsM3lRGCH1KHYwj
         iDoMI51jPFsflMi8nyigh4j7A1DJqehojA1mfSOg7z23Q3hglmLd0rCA/H2lsqQUjX9W
         obnYVBb7NgC915MzCvDMvlSIQmZU+SME48K+JERwTo6HA7P0DdXjT+XIVil4IjzaoUO4
         XsOw==
X-Forwarded-Encrypted: i=1; AKwUvBypyQLLDSxT7ATYhYPtFHarJsaT6iY/hbQ6ASeIT3LfLE+W9XBXEsftoxDrZiT7s9C6Gss3CG+lkPhtbTk=@vger.kernel.org
X-Gm-Message-State: AFq9FYIFse3ndnFBZ0O3xG8HkCmgY0k4zrgJVb/KFKXPxm1zRcn6oUZ4
	1uiRzECPBiXMgg3SthZiUAbH5wPk3zO2Nnq4Dp5cTgtccFgvCIQ4GP/bNIOtTsi4
X-Gm-Gg: AYBFou23lW3khNd+f9Lq8+De487uNoikHWPTxzwMMTc3bekrsn5SV+R+MxnE94y0TkV
	R8tBwlawTXnldZXyeuUvacGd7e9W/I63dcrFvUH+Vuth7PPSTEEetrkWLsn/bfLI04htRGuxk9w
	RvJzm172F3jOuTkPGkV+DMlhphUHRUsM/YsQC7Z0bD7GC437CvM6m1xtLLvevX0pTNHEog6LoyT
	iGd0uj25h9jAIIuT1WPwXdez+fjOYTrfTp1eOp5H/sBE6UsXaeMyC3sgJzV/ob1p6lmB29ToICu
	LLVM6/7MVkw6i1d/tl1wsor821VUo8qOy6kdISRBiKsU1q+37JX+nq2YeAHHv7bljtYBWG6neM6
	3pAR+qbJhMuACOoKUiBG7N/ZytsXmOGE0oavtNp1sdzf5Ktz/0v2jne68DvTKX0rG8Oz+tK/O1f
	DOo+FCS3Rxlk93umpuam1/+aIhyWw+ouL9VBKdn/B9iRYls3ke9oZggi/EPn7bWzS3VpQLvx8FZ
	h/4Jo4urOye7C9YXovTWMZ7g6U0zQUT9yILYO3AuJ5hHAfpOSLgsHuWElGM0sT/Yf2qiH9OjAkY
	IkHrqeRvnmkkGy899Rqy2R4vJErSjdjMC/gZhnx+
X-Received: by 2002:a05:7022:407:b0:14d:c7ae:85dd with SMTP id a92af1059eb24-190a52e2836mr8053196c88.7.1792660595263;
        Thu, 22 Oct 2026 02:16:35 -0700 (PDT)
Received: from youngkk-vm.localdomain (67.216.200.102.16clouds.com. [67.216.200.102])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903b3d0530sm13702627c88.11.2026.10.22.02.16.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 02:16:34 -0700 (PDT)
From: Cheng Yongkang <teel4res@gmail.com>
To: Nikolay Aleksandrov <razor@blackwall.org>,
	Ido Schimmel <idosch@nvidia.com>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	bridge@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [BUG] net: bridge: VLAN range notification merges unequal state
Date: Thu, 22 Oct 2026 02:16:29 -0700
Message-Id: <20261022091629.3652038-1-teel4res@gmail.com>
X-Mailer: git-send-email 2.34.1
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

Hi all,

br_vlan_fill_vids() encodes per-VLAN state, tunnel ID, neighbour flags
and multicast context from one v_opts, so every option must be equal
across a range.  The dump/options paths enforce that through
br_vlan_can_enter_range(), but the old-style br_process_vlan_info()
range loop only checks whether the request changed PVID/UNTAGGED on
each VID.

The old path can therefore merge adjacent VIDs whose state or tunnel
id differs and emit one range carrying the start VID's options.  The
notification then describes a VLAN map that the kernel does not have.

Observed on Linux v7.3, commit
08ab31164c55f20c7a2653de3186ae333470e2c1.  VID 10 was FORWARDING and
VID 11 was BLOCKING.  An old-style RTM_SETLINK range request changed
UNTAGGED on both VIDs:

  one RTM_NEWVLAN: vid=10 range=11 state=FORWARDING
  dump:            vid=10 state=FORWARDING
  dump:            vid=11 state=BLOCKING

The notification tells listeners that VID 11 is FORWARDING even though
the kernel database keeps it BLOCKING.

The old range path must run the same option-equality check per VID or
emit separate notifications.  The February 2026 expansion of
br_vlan_opts_eq_range() for neighbour/multicast fields did not add this
missing call; I found no matching fix or CVE.

The PoC and program/console logs are available on request.

This was found with a multi-agent workflow; the
notification/dump divergence was reproduced in QEMU/KVM.

Thanks,
Cheng Yongkang
