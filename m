Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792660632;
	b=sNLNi/ZGESBfqSbSxFkQeQW+n7vfthmFbBRtaPEWn9Vb9UvxkexugRzp1ywzCnu9y1xv
	 zFm0ylyaNMP6qfxylBBvKoqOLlJkZKB5xK8yPtld5AttJTBjDVeT3cWAFu3k+OZobdlzf
	 128E7lAJhAUbEoSf7yyuL1swUw6HrAwUXFSNsS6wuA8gAqdhteT2HTzpfNt3qdQ79nrN9
	 2pyljcsRqBkVfcwiw2WhaaCvK829DLibw97AT3yBUIN7fPaw+PrQirmoiAS/ncis5G/5H
	 1wbuFvZeSylad70QE8aFVW/uZL8a6ytVxMWUiKoUuBKtFDkwyRLC2pLA2HLGTxq1mOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792660632;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=sI+0nhto7gjQ/pA9pTOXfHoPEuc8oDO28HfBE2X7SBY=;
	b=eLbA7lRvu7o7SigZf9984sjUmY6HXQ90KAU64901x7hYmeLeRNjQYmXo4tMZXJgrCKsS
	 bDONgl+KAYBD+onYqsrvivOiKytR888x7hX17EoQ6EE1ej9V0trFsjzb2cJNc3sgZLhtc
	 2hg4tAc+L1CyqFvooNWH3VnJH6P/FHZNRo7i6VHPRZM7aZd13vHBI8JEvpQl4XOr0Unmh
	 y4RxFTGiuRzAUomL1lVrCkBgmBiElKebIos3oX7/b5Vc+sORj653IIgnVOfBi97hosEdA
	 819PhfJJg05lWFlV2fwR3p6Fse9Z2FuxmYVJcTu5MkFbMu/FIf6H+lmW4g/rcGpAasA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=GGeP4B3q;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C7BB606A33A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:17:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C7BB606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=GGeP4B3q
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-181516de561so326808c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 02:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792660631; x=1793265431; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sI+0nhto7gjQ/pA9pTOXfHoPEuc8oDO28HfBE2X7SBY=;
        b=GGeP4B3qkwTiZhwWcvqnzJSVW0R2IzkWw3Bf7cB64xWCiQndWBRC1DlZ6Ox5881tIm
         1s1waCMODbbT0DlQzy3RvnPxVXvo46TPSiI6opLRtgMv2PvWzBJ44kOtBr6vRsjLvCKI
         62PL3k6Mz+he2q4IW5cEcaZpXwyS3lVg0pML8eruurCZxMxZHkbbRr8Z8ZoxDuw62sR0
         zHNlh9ejWmOC/lTPqmD7fJOwVOZtN7mCSkqJdjrC900qrw73DgNu7W1VNHpET3fZpWJz
         Dtr/ZQPI4hLspTxGSLHAx8weG+fghbOdRNQLeO0aVoitAWz1xKCgxT4JP25FjQzKna83
         athg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792660631; x=1793265431;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sI+0nhto7gjQ/pA9pTOXfHoPEuc8oDO28HfBE2X7SBY=;
        b=Ng15IzfqOVe0nXhAlGISA10KEG0IybX1NBm+XvR3Hx+LjDlRRsOP9bcytZq3K0g0Us
         Pl0O/OeKQQ003+eK+sp640X5s2vbOaXT09vm9wfNFvCjuL7KjmxMS0Q59JMyDM8blz77
         LEQuclTUGL7hwqv3Kqj4ZIjwIFZ+otBUdCpDxVAIIDy9ihoq7mZ7typM0CKV5VkXVP4g
         VtZUdgWhWkf0AR0RtmmZ56o7gEjWFMhulAnSfDjrAljqT9vwdPvu3zU0Oj4Ijzk3wHE0
         IjLBzMAKds/Lt1wVXOmzFG+gKepfhmo1UINWakhlzx5KvneHjWCsMV4RNdVJJz/wf5dL
         V3bA==
X-Forwarded-Encrypted: i=1; AKwUvBzCkzEnzkCcM9OquL+hRI0QQ3Qewldn2d9zZv4UyRMyAXTEFosBkwI+ZotNN4RQ7/kN3QoJqtdCNlEaRvE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIezuooPI6uQmo/1QeFaDTuQMH/zS83hBU6hBXB78TVd6W4fHJG
	EQfNEfCgLh+qB08uQ3U+C3ATgeMN3CHfbPYaQbPXpiqOJAwKR3cSjUaw
X-Gm-Gg: AYBFou36A1K948aJ3b0mrT2RfwllhYnADxrWqo9G8aeZPRmr2sv8aecjy0uyT3KgNkM
	0541SGUhjDfIngGILLoPjnzCrGMTU3SAXrcVVGC6myJmczJES3ay2NixO0GHfF4+ZoGCFBvLsVs
	RfKN+76xnVIbEXhtczuMwPBCGn2P1g8prKXYbzWj7V5lW8srYgV7F2Nh5zxG9vKQhrBkESH+DxJ
	u2xyzFX5vzBATAGZ+Z0E0OhpygGB169PVhMtl1KwwxSv5Z09yMR3dcUpRvzEsgpWWWTfDSE/Zpb
	VCgi2i2fmw9W6V8C59/FKDi2W/0Hun2UFysJz8Var9Unj7tlIZTv21nGp2o9/MAEsedBQqTcLPU
	RVy5fwWW3oEcWBfcYfThaXsI9JB0w33i/Ugl5YjNDl12+OTUz7QUqSJk8rC8H4tHVQ0hogCsTOf
	QiinsZ4nS1Fe4YsqiQveZFan/taZq2xrjb/RvVGa6E7d0eh8uVtRb81GTomj2+MXvMhA+jKIooM
	MqqsuhM4dlJFXr7iFCKWrnhnB3Z/2gox1QRmGf1D2hrSaq0G+m0Zn5gpQ9LzSeUdf9sNmu+Ay3f
	wxxBMbxik38FwYPMMBU=
X-Received: by 2002:a05:7022:ed0d:b0:182:d0a8:d1a9 with SMTP id a92af1059eb24-192e88a169dmr2506797c88.0.1792660631101;
        Thu, 22 Oct 2026 02:17:11 -0700 (PDT)
Received: from youngkk-vm.localdomain (67.216.200.102.16clouds.com. [67.216.200.102])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3673e15353csm25692692eec.2.2026.10.22.02.17.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 02:17:10 -0700 (PDT)
From: Cheng Yongkang <teel4res@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [BUG] net: ipvlan: failed newlink leaves shared port state changed
Date: Thu, 22 Oct 2026 02:17:04 -0700
Message-Id: <20261022091704.3652547-1-teel4res@gmail.com>
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

Two failure paths in creation of a new ipvlan slave mutate shared
ipvl_port state even though the requested device is not created.

1. ipvlan_link_new() publishes the new mode/flags and existing slaves'
   IFF_NOARP/L3S state.  A later do_set_master() failure deletes only
   the new device.  The existing slave keeps the port alive, so none of
   the shared changes are rolled back.

2. If L3S hook registration fails inside ipvlan_set_port_mode(), the
   per-slave IFF_NOARP change is reverted, but the newly written shared
   port->flags value is not.

Observed on Linux v7.3, commit
08ab31164c55f20c7a2653de3186ae333470e2c1.

For the first path, an RTM_NEWLINK requesting L3S+VEPA with a nonexistent
IFLA_MASTER returned -EINVAL and no second link was created.  The
pre-existing slave nevertheless changed from:

  mode=L2 flags=0 noarp=0

to:

  mode=L3S flags=VEPA noarp=1

For the second path, fault injection in nf_hook_entries_grow() made hook
registration return -ENOMEM.  The failed request left the existing
slave's shared port at mode=L2 flags=VEPA while correctly restoring
IFF_NOARP.

The newlink operation should be transactional: defer shared-port
publication until all generic netlink steps can no longer fail, or
restore the full previous mode, flags, NOARP, hook, and l3mdev state if
the outer path deletes the new device.

The 2026-10-01 ipvlan review thread notices the narrower flags-ordering
problem, but does not cover the later do_set_master() failure or the
complete L3S/mode rollback.

Candidate BR-011 and BR-012 reproduce the two distinct failure sizes;
they are presented as one transactional-state bug here.

The PoCs, failslab runner, and logs are available on request.

This was found with a multi-agent workflow; both state
transitions were reproduced under QEMU.

Thanks,
Cheng Yongkang
