Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792660035;
	b=gjadjV1mOygKauJAhdxUa9x+F6oqC/p/EUnOGEu+AAK2Q5bNBV6gcd+GcNIHEWlG2jHD
	 Dq4p0aeeaq6wB2kibN6FUfutDINHadmUOYzK2CbhgLzm9X8ri9P3c0Wwuv6WwU4HwshZi
	 GM9XeSCLqszwjkFFIQf9V+74att1YSGFvy0Folg9k2UvEanSPX4g2U1RgMXnMRRJ7hEbA
	 apuOEBWM23No0GEaurkD0Q5o3lUwoRV6cIdCVWWEZPnYUzQ6AjAiUaQvztDSoz0ODisdi
	 cPOFDHGAlpYBaMggIpoYe2G/ZNKNSKejchvxqqQ2SL08gKL2ukejhPXI/h5EBT1UAGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792660035;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=/tMNXcr5k0x0ZqGSCg5kBGjjTxYYU7yHe7YyZnPL11k=;
	b=RY+KAVNCg0eKqulW3lXnxRR0ZgFhuxtOTm8smguy2LWRYB7LU1oTyYG0CIBI7E0xiuy7
	 1vtxoE8lFKLLWMbbPmMFt6G7K5Diw5hJFINGKqyCAtd3kgeKPkXAuCaVJglLd4BYhNJI/
	 YPSGAO3AlmgHBFpCDHhPVbMjDFUarWsjg5lLo8xAsgqq4QAP2V+EfJJGXZBLPKqCWeXML
	 t8JXrG8/PZAQW0YcvICYD+Cd5q5Xv4qGU/h/hDRhp6N2oqWHwMlprztN8KByM3Racswtx
	 BkvxZOSEmLiRL3/JAnEtErhGLUWFcHcXC7cLrqYmhGrPeL2yoN4vh7G8e8v4hyurT0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ivk88Te7;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD6CB606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:07:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD6CB606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ivk88Te7
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-3535a54bed9so2339262eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 02:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792660034; x=1793264834; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/tMNXcr5k0x0ZqGSCg5kBGjjTxYYU7yHe7YyZnPL11k=;
        b=ivk88Te7zDWhYHKP0dgOHMk3iS3TvXvGrKeg36/zHgisPZz8quTZr9nMXy5EKi4+77
         jXMxsnVxtLCxdAm2DHDlyI2UrPIgDZQBpCiNS+DE5WMKO8LlrA7dvAG1Nec1PF1euyzJ
         M4vzcHa79BincZAHG0Xi7zZzEyWmFB4KXUkN9fwahXLTemFr54mnBODAwV0hxRpCFwmi
         dMJi/IWqyShmqZFt8Nna74vMlLKCOpQwpUzaTMurIRopqIPWHEHcdikWmN/WD4+Pgws/
         bH5Jmo0bLDFj1NMpUCAPIpdVTZah4KYW9TfyLWx+DTEh/n9Q/6THjNUZYar2ncfMCgw8
         TFEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792660034; x=1793264834;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/tMNXcr5k0x0ZqGSCg5kBGjjTxYYU7yHe7YyZnPL11k=;
        b=u5QMJj15p+pIF8pMBqxJ0m2AsPRrjDErgmGp5XcpGbsHiZ6KWvW9q96KQxG3SEbUUp
         9XyThfCigmYrGtsrldaoo+hR9ZQHvAa8iBYYI4caYPwYqWZDDo7DVYLbvi1ISjTB6i4F
         FoLF8+zJwBCaEeCqOLFdnvd1D9+u7nrVHo6qDcP1YRJdIBCkubnWiYNG9YvG8FAlgQO3
         ZvQamlVE0XGpwLGRIVZrTHs+9oPM5wPIE6zB+cIRm6OyLQDbZxY3aZ0yeNDV+Ocaiicx
         SYJH/F0y2AOqb/jiLpVk4uKTgzxByEkolGy+2hiJ/nIe/jXDIIzjPo8BzzlOOiHINGY3
         D9Dg==
X-Forwarded-Encrypted: i=1; AKwUvBy/9P2Cj3wSPZY3PtoE/J1AWLeX5aAcOyObXelVaMbt4NnccTS+OJSEcCfga7zA69cN8DguyDNDM4xEhn4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIJrw2l1Z2dcByvnylrjMGReCW6b0CAx41ME7HlinxxA+t/u4mY
	R5+UBrdHMyhmg0ykgLBePeLmo+uK5M+7y4Uk7Ad0Ugm+bkiJibpzpOVI
X-Gm-Gg: AYBFou0IRNoS6+guaz1+aUzhd8x0tVddFYfDhL0kNmXWAtftIpfFrFphbnvpWnvdZVw
	5my55rlcM+azC7RBH+zOGchnTF0VilhY+mNwPVcXs6tsrhYsTagEcFDaOSgvucaKknAyoykhdA1
	wnXPfPJRgCic6O8jpjgB4ci6rAOqcH8rWzFyXKX3e+wlvZ3L4uNByXu85OHtra5hJJwHTRh49fh
	JtruLEx4KUem9lgPhrTn/xyrVhPD+/he30rk1hXfts1xdQ0fw9tOi9J38zYIun0G3GHmXaEYL5Z
	Xz6IVxosWGVHc1/XRy9lU2QYl66Lv/gErsrFqOgmXmfJj7AfIaEtihCYODneFBMVQJv5zgiNNvh
	QPWkhn/YjNoXSKgWnMAfVlzDg64y10GagWORpfD3bCgG6iV6IA+BY51H0Ofmk71Iq/R3jqJfPTC
	Z/Ys33L8n0j10VUU47Ou7KMfEDd/pBcA2miWOsHRXpG8YpmwpT3xq306L7lGclUQuRXx/+5Uukj
	5niEa4eSl8R3u7Ighdu3CVzUhOt2FCL5gYnA7YrULPbLxWn/+RFCvfeFExJldPB5cRpTTUdd2xG
	+c+OIiHqXuDJmHB6w7Y=
X-Received: by 2002:a05:7300:8a18:b0:35b:c1d2:eab9 with SMTP id 5a478bee46e88-3674df4ef40mr6319732eec.39.1792660033972;
        Thu, 22 Oct 2026 02:07:13 -0700 (PDT)
Received: from youngkk-vm.localdomain (67.216.200.102.16clouds.com. [67.216.200.102])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36741e71eaesm30337818eec.26.2026.10.22.02.07.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 02:07:13 -0700 (PDT)
From: Cheng Yongkang <teel4res@gmail.com>
To: Nikolay Aleksandrov <razor@blackwall.org>,
	Ido Schimmel <idosch@nvidia.com>
Cc: Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	bridge@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [BUG] net: bridge: DSA LAG self-match leaves hwdom zero
Date: Thu, 22 Oct 2026 02:07:06 -0700
Message-Id: <20261022090706.3643840-1-teel4res@gmail.com>
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

When a DSA LAG member joins a bond that is already present in
br->port_list, nbp_switchdev_hwdom_set() can iterate over the joining
port itself.  The self-match leaves hwdom at the unassigned sentinel 0
while the port is marked offloaded and tx_fwd_offload is enabled.
No busy_hwdoms bit is reserved.

DSA frames may still carry offload_fwd_mark.  If another port also has
hwdom 0, nbp_switchdev_allowed_egress() treats the two ports as the
same hardware domain, so an otherwise valid forwarded frame is
suppressed at bridge egress.

Observed on Linux v7.3, commit
08ab31164c55f20c7a2653de3186ae333470e2c1.  The exact DSA LAG route ran:

  dsa_port_lag_join
  dsa_port_bridge_join
  switchdev_bridge_port_offload

After the join:

  offload_count=1 hwdom=0 busy_hwdoms=0 tx_fwd_offload=1

With a second port using a different switch parent ID and also left at
hwdom 0:

  unmarked control frame:                 delivered 8/8
  identical frame with offload_fwd_mark=1: delivered 0/8

The result repeated with two independent netdevsim switch IDs.  There
was no KASAN report, oops, or panic; the defect is packet suppression.

The target bridge and DSA core code were unchanged.  The test VM has no
physical DSA driver, so an in-tree dsa_loop build was exposed as an
external module with only port_lag_join/port_lag_leave and
tx_fwd_offload behavior.  A diagnostic hook set the same
offload_fwd_mark bit a hardware switch would set.

hwdom allocation must exclude the joining port, or publication must
occur only after a nonzero domain is reserved.  Candidate BR-031 is a
different error-path leak in the same bridge switchdev code, not a
duplicate of this packet path.

I found no matching self-match allocation fix.  A 2024 generic
offload_fwd_mark/hwdom-0 comparison patch is also absent from the target
source, but that patch does not fix the unassigned-domain state created
here.

The module sources, PoC, and full logs are available on request.

This was found with AI-assisted source analysis and fuzzing; the
packet-drop differential was reproduced in QEMU.

Thanks,
Cheng Yongkang
