Received: from mail-ej2-f43.google.com (mail-ej2-f43.google.com [74.125.228.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27D2C51D501
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 21:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790803456; cv=none; b=hrfHyQ3Q7uDCraDY3fknwA7CEPTW2TtIePLfYW1fxeLHEa2Qammm4PXwvPP76bh1I5SOErsAeZGQMuSK26od1lyBuEIrRAc3fthNqWzTAOBiNsU2DVE34QMh57uxfYSPrmkJaB8lJqG2XJbxiZ/KRx/vVVH0g7pFJ6bco6/DBIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790803456; c=relaxed/simple;
	bh=FCDsqIWcNqTyMuNCNabIBEjWOtY4xkDIkSbvt5+KcfI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P7N/UShIvykpZkdOE9l5yD7XgBr8uHDwg+nGCITY4CJChn16SOUo4lNFt0K5UR4FOR68Tg2uJ44jrfzXkmZqysW6t1wcqtiguU0tXJZ7pGaONzJhL8N58LPlkwQzrE076/WtiiwPKTKBP1V3C5FR+XoTUuU9KzkdhMQBVX0Nv58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oRQG7kHM; arc=none smtp.client-ip=74.125.228.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oRQG7kHM"
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c2e23be09baso136459266b.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 14:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790803452; x=1791408252; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FCDsqIWcNqTyMuNCNabIBEjWOtY4xkDIkSbvt5+KcfI=;
        b=oRQG7kHMERRzCWj/5BQpAKmK4aF19tlWiOkDK2oVrrlXnBUieElSZ5p8gA5BughWIT
         iykaJS33+ECgP/6NPtkmoRknFvcv7uMBdZxVhmG/a9BDkkXvfJJ6sYZGsmPcxxCTL8yj
         EYtlC5JDYpZJCCZFCaTwfiHsa0PaSSFV8qHXgVukTWE2hrYmjJQhHjC/B5QAA61pZ3P/
         veCEf/wwMWzUxAhn5oQcCus7uhXGL1vq53msDzxGXmbdnYyphV2bFkWDd3HcCwXRuiNW
         JRwbzvqIH2NPapk9ji0o8ZB4MuKuT5kNaVOXMuFvM5TazsR9uqmFAr6BUtv/ntq4W1TE
         5j0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790803452; x=1791408252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FCDsqIWcNqTyMuNCNabIBEjWOtY4xkDIkSbvt5+KcfI=;
        b=YIIDDEP/mRpVq9AdJObaVdlIZCDd4Z/d19pv7TVSNyJl9mNnct886fSX7wG+rIBsWV
         aPN7dOYSeFBiB82P5jmCIAmN/oPIuiigAyir1Gy/tvRR/Un70K2GwjU7nIqeYbaG0v+0
         RoCo6lcyNhLCdytSnD8+yX36szU//s1HzDiHQFH3j2tfHCEFcr3NlYIqKvqvOB09g3kI
         gKSuYAli3hOJ5SusjFh86AncCQ01DDYfwTHn5LekdCXOMZkR81U8QmaCwfbiuBwGEGei
         uBffoUEMO4ISdorrbb2s/rrY+FgltL9lC7kgMUDiR2IMVrJvQYNNv0otteKpR7Q7YC/9
         qpLg==
X-Forwarded-Encrypted: i=1; AKwUvBxr6FlSSuGHr0EsnImEwABjTxKAsBLDZBIpRmsUXbTGFDQqF+4joIRFmYYoF9ViggqXkjADKcML/84ZmOQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kzLUzmqq1Yybe7CIT3RO0S/Y0UdeoShUKBdSpzZ9Qvz1zm9ZLT
	Bynz3ZMrsoHRB0kbO7tpk/f/a/SfJxFmALIg/118J0ZfPG/zBBb8gwbw
X-Gm-Gg: AYBFou3o0Yb6Ot6ZYrSV+k2oecSty4nya4nhz2T0NMbBWmVbove/9/Fu3z3WBKXzr2h
	SC36zOXBJJaUgxSvAPfGsFaRY+UVasz92IxF4OhOamfF6xgBRs5QYjR7t5fwAWC/A2gVjCZes6s
	IyoviRcipNt2R2BnbShee/S5yTzYHCCxhJ3JIOz1TJnaGDNmThPMHw6mqAUzbJV92k56DTYGE3v
	n5qCVEJ7mxXkIUJW68Vn9Zz6GMw31WyhbYAE3nd7QZNcewgfjy3d1tm4W3npjsqW/H9OC7mZGQL
	OoHclwaVhbjcpvVH5oZcOyEw2C87p+m66OK6ZCWCcYm9X4F18XEjZRNSlmUYFA8v7A8XvXVwWh4
	7ECqhYV83grqJJta3Ri4oh0By/4Cl8oIKUqliQbZRBKYXsVl1bx8cz5AEtosrmlp/mbd7qOk6AD
	8HT8IpZcuJAFI6tSnoeDvMYGsyuhILecAdMW3CgW5sJ1+2HU75uiXgkXrq7W3APSeLY7bsJxkD7
	fyLzM53987grfBA6PG88bJZZi/HGDersH47IulM2SeRYpTwSs5n0DsGoi3LWigMRte1esk0TyCf
	u4U2llYD7wQ3kKSVXNI6
X-Received: by 2002:a17:907:72d2:b0:c26:19de:9adb with SMTP id a640c23a62f3a-c2e23d0119dmr211129366b.26.1790803452303;
        Wed, 30 Sep 2026 14:24:12 -0700 (PDT)
Received: from localhost.localdomain (83-233-221-82.cust.bredband2.com. [83.233.221.82])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e31d867ffsm57086166b.59.2026.09.30.14.24.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 14:24:12 -0700 (PDT)
From: Yongzhao Chen <yongzhao.derek@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: netdev@vger.kernel.org,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-kernel@vger.kernel.org,
	Ziyang Huang <hzyitc@outlook.com>
Subject: Re: [PATCH net-next v4 2/3] net: dsa: qca8k: serialize CPU MAC pause during MTU changes
Date: Wed, 30 Sep 2026 23:24:00 +0200
Message-ID: <20260930212400.576-1-yongzhao.derek@gmail.com>
X-Mailer: git-send-email 2.45.2.windows.1
In-Reply-To: <6abb535c.8fb0a6ce.10321.5538@mx.google.com>
References: <20260928220811.1880-1-yongzhao.derek@gmail.com> <20260928220811.1880-3-yongzhao.derek@gmail.com> <6abb535c.8fb0a6ce.10321.5538@mx.google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Christian,=0D
=0D
Thanks for the detailed review.=0D
=0D
> I'm not entirely sure we need to use the reg mutex here since each port=0D
> have their own register and is independent... a dedicated mutex should be=
=0D
> considered for the task...=0D
=0D
As you suggested, the next revision adds a dedicated per-switch=0D
port_status_lock instead of reusing reg_mutex, which stays with the=0D
FDB/VLAN operations. It is held across the whole MTU sequence and by all=0D
PORT_STATUS writers.=0D
=0D
The lock is needed because the MTU sequence can interleave with=0D
phylink's MAC link-up/down callbacks, which run from the phylink resolve=0D
work without RTNL. Per-access register locking cannot protect the whole=0D
read/pause/change/restore sequence.=0D
=0D
> I would use __qca8k_port_set.. and add tag to enforce that the mutex shou=
ld be=0D
> locked here.=0D
=0D
Done: the helper is now __qca8k_port_set_status() with=0D
lockdep_assert_held().=0D
=0D
> Can port be enabled concurrently and corrupt the port enable map? Can you=
=0D
> check with AI if this case is possible? If yes then this might be a good=
=0D
> idea to make a separate prereq patch introducing a dedicated mutex for=0D
> port status and protect it accordingly. (might also be worth for net)=0D
=0D
The DSA core calls port_enable() and port_disable() under RTNL, so the=0D
updates to port_enabled_map are already serialized. I did not find a=0D
path where two updates can race, so I don't think a separate net fix is=0D
needed.=0D
=0D
> In the context of internal PHY CPU port port 0 and port 6 won't be=0D
> connected... Should we check that and create a mask of the cpu port right=
=0D
> from the start?=0D
=0D
The mask is now (BIT(0) | BIT(6) | dsa_cpu_ports(ds)), intersected with=0D
port_enabled_map. I kept pausing ports 0 and 6 whenever they are=0D
enabled, as the current code does. With an internal CPU port they can=0D
still be in use (in my port 5 CPU test, port 6 was a fixed-link user=0D
port), and I have no evidence that changing the frame size is safe with=0D
their MACs running. Is there hardware guidance confirming that enabled=0D
non-CPU ports 0/6 can remain running during the MTU update?=0D
=0D
I have also fixed the reverse xmas tree ordering, and the loops now use=0D
for_each_set_bit() on an unsigned long mask.=0D
=0D
Deterministic tests built from the extracted kernel functions cover the=0D
MTU/MAC-callback interleavings and fail when the relevant locking is=0D
removed. On a Redmi AX5400 running an OpenWrt Linux 6.18.52 backport=0D
(wired only, lockdep enabled), MTU changes during repeated renegotiation=0D
passed the functional checks but never hit=0D
a stably down link. In a separate test with the port 5 PHY powered down,=0D
the MTU changes succeeded and the port 5 MAC stayed off in every stable=0D
link-down sample.=0D
=0D
Thanks,=0D
Yongzhao Chen=0D
