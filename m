Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792660528;
	b=p1R+HjBAVLq7nzWVJESNDqdlqxFbs6pD14rv6dqreLiQ27n9NpUyw0a1IighPRgLANZ3
	 gsyClAyfpCHZRmTNyytY4+3C/GCDH0/k2jT8PGDAEW9lPT9xHiq9A2HGM+oWW7Rr+rtI7
	 DBQW9m4nHRjDnrLBntasTN4OoO7SBuVb/dCjEXOQEfwgsM8QV/VENAagFYdTfrrDeoPzm
	 jbpGwkzf5B30l6hraanvvS7rIAjLfCGavFUOBgCt37joifVx609mkqMHS3I96pQVH8wmt
	 537Smz1CvQgqd6tJKHlLaMcn4KoceXzH4j5MYYrH2JmdRl67YemItdZK/l1+TcMkW5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792660528;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=gJVw9ABNp21KP8Dhio2Mev+A1bfhiVXJze+OMhpKRQE=;
	b=sCMuXTQ4FlFoUa2RKa/Gj+HEIScJBHDDWCzGGYCkurNSBhurYLBX97GWzpopXV/sApYV
	 mVOSeUJ9WYf508ZkrE240eiM7LD8qmCi+Tp5RuODrwH++OgWHm6wOlLA7QjvrZYytPgs+
	 l9Vb/xTygA4bs56wrF4ppKSjZX8pQSwtAqmtrBqqd/8t6gEjQ7J6/zaFpMjVRRrzuAzq6
	 pIaJwxLM/pKdhunT0yI5sLUxjvwSDQVBMPhIUTguYF4xTinVnKn6onaLffsTmdCDgNJ1n
	 igXqupC6ADPzkPb3VoyzXFKLrPD8grv8V71ZpC8JPhVJwhzL/VIcjd1kzQFexW7Afmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=GAthkhYz;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2971B606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:15:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2971B606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=GAthkhYz
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-35ef6b49813so2161964eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 02:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792660527; x=1793265327; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gJVw9ABNp21KP8Dhio2Mev+A1bfhiVXJze+OMhpKRQE=;
        b=GAthkhYzoQxc9tbyqj1+tAJY3lAEuewGDkaLDUG2rnLdTns7vFJiW5l7PU5D/pzi/Q
         FQCZBW71GckViC6xxI5XdGjEbKSozKi69B+iNjcoe5z5CL8QhCi69F/yiT3gfLR08jvJ
         01qzGjUadduJnMhmEHR1+NkRougwF7J2Vo3PMbqL89/2DEuhFwYP7XO7l0zPwtFgtFIE
         i2PU0PfuY/eg7OJqpGyeGXnbPN1yKo+Cjb6eykXxjXQiWxlm/4IkZkQDqxo9Cs2lsLZR
         wMW35dAVHHSF1bUFqqC7FTzA+hKcSirb+QB1diUfbCz/bojlwzbtHZKOmcKwmJcKoiXs
         41Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792660527; x=1793265327;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gJVw9ABNp21KP8Dhio2Mev+A1bfhiVXJze+OMhpKRQE=;
        b=KaIOcw/6esFDwngedzSPuEQwhv2bYGbdjAdWqHHXUpkXDNKwPGBRzoCDWTivLcEgLJ
         XeYAQ3Q6RV0EOexaEnbXsxKB5lBKU8fh0qEDhw0RYSoQK31LON+LKkrDEiE5zNyd9EMm
         2bsvFsWSrhN5tSUZFi6+m7ij04UZDOJjOoPN7QxHVKQDFXgC4LHQv7JzVDL5BamAcJFh
         P7MkJ21xdq0o/wjgoJ1o8wCRXytgZ3h2uF46NzDdOZvWmQm6MRS6ni6fgY77MNoTlHo3
         bgv5XKUOg5y4cTEppmpVzdnY84rqmR0GnczZoIVJeDhxgx0X2lhn8cffWzBS3RsiyKEq
         aqxg==
X-Forwarded-Encrypted: i=1; AKwUvBxNocBjZKlLCG85INTF/lDGopXmpj/YywojIwmSgdAh4vZqh4b8/72MkxL7njLtXiJv/AEJ7Spul9EJYaQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLap76uEKbdXrYGR5m6up0EHf2cdwVx4QCY0OAvtSHgJXI6haZw
	sKPiV9xSTrObGigP8c2PrrKfz7xEHT4kxbeU3kREAieY3lFxGCbKtRLI
X-Gm-Gg: AYBFou0HUsvICt6W7HPc4YXqZKS+sj4fXtomu/tU1qvRGK7Gi8FuBRfYq2sTYPKRH8W
	zL2Flw39/f8Y2WOwyPa1W+VAi0sVtf17zVFCbsyoozEQIqGsF6Ydkw2NamrYf89oqhC1zZhjry/
	mCfBBIgud8CyLfeeNi1atDL0Hmp9Uk2JpyAuWstEBKsItPrlVryGQP2+jM1nldGku9O95srejZp
	6FZAhFgU+8Xi0HAh386p039GBvSEMz4QcMr25kMVHV6s6SJNpUbRqvNWFkmWk4qb8dq+5MUKtzy
	S5qcHaDAyku4ytf6VHlHShklQyyoMFuWu1PRj3JpDfexDLagQVc74CNDx+aOpWr0JJZCDLrVpDQ
	a8lKflZy6shEwro6rb++kp4Xiz+xyLjEdAyNlHTQ4ieyPW/N2z9oXsiQVdW4Ql075TAzO9QP3eY
	LCim/IPyZ0xxa2TqA4LnAcY72ma37AvUuaQo+blIf0lkFY5fjI2eUVsn/rLflz7gyaN4ApHdt+A
	9+MvMrfgpHvc9S8VBqSRgNLKhh8P+eF87PzNvDuDRYsYUoknOxtmVpou/xYOMjv1zsi/QluFjtw
	ijr3ou4/2qx4P2Lv+lo=
X-Received: by 2002:a05:701b:4189:20b0:144:fa58:95d8 with SMTP id a92af1059eb24-190a599a3b9mr6064440c88.27.1792660527292;
        Thu, 22 Oct 2026 02:15:27 -0700 (PDT)
Received: from youngkk-vm.localdomain (67.216.200.102.16clouds.com. [67.216.200.102])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903a275026sm19853944c88.5.2026.10.22.02.15.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 02:15:26 -0700 (PDT)
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
Subject: [BUG] net: bridge: MRP state is not propagated to MSTI zero
Date: Thu, 22 Oct 2026 02:15:20 -0700
Message-Id: <20261022091520.3651032-1-teel4res@gmail.com>
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

With MST enabled, the bridge data path uses MSTI-0 per-VLAN state.
br_set_state() normally synchronizes MSTI 0 through br_mst_set_state(),
but br_mrp_set_port_state() changes only p->state and sends a switchdev
notification.

The MRP-aware guard prevents other STP transitions from synchronizing
MSTI 0.  Direct bridge MST commands cannot address MSTI 0, and direct
VLAN-state changes are rejected while MST is enabled.  A ring port
marked BLOCKING by MRP therefore keeps its PVID/MSTI-0 state at
FORWARDING and continues to pass data.

Observed on Linux v7.3, commit
08ab31164c55f20c7a2653de3186ae333470e2c1:

  net_bridge_port.state: BLOCKING
  port VLAN state:       forwarding

  MST disabled control:  egress=0 ingress=0
  MST enabled candidate: egress=1 ingress=1

The MRP instance add and PORT_STATE BLOCKED requests both returned
success.  The port was observably blocked in sysfs but still forwarded
real broadcast Ethernet frames.

The MRP port-state path needs to synchronize MSTI 0, for example by
calling br_mst_set_state(p, 0, port_state, NULL), in addition to
updating p->state.

This is distinct from candidate BR-039 (MST with VLAN filtering disabled)
and from BR-005 (deletion-time MRP forwarding).  I found no matching
upstream fix or CVE.

The test used a diagnostic switchdev endpoint only to acknowledge the
MRP object.  It did not change bridge port state, VLAN state or packet
forwarding.

The PoC, module source and full logs are available on request.

This was found with a multi-agent workflow; the
state/forwarding differential was reproduced in QEMU.

Thanks,
Cheng Yongkang
