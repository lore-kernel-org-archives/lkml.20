Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793551639;
	b=s1bBgNInbFgaTTMbkxK6yfQ7T+rroHE/bukobNy9MwSR8HF7CvoHvz1rOTtHSnoA6ign
	 vuY5w/TU487Ln+B6JZ2yb+kHC9ZZO93Zm4YjqNhEzvtRmC2Z9UeoveJPNTD85yGfEziS7
	 SF8nsVI6X1u9SGbvnDrSE7MSqVA/kTOq2xEe/crZRoFC6XMU8gGozrwDVXxQq+ryDyR4E
	 T3bPiZlufJDpacu+AIknvOPf61QHcn6bj8nVm99SACwjD3Q+9RXvJQieJhO2NhNznssEn
	 So8otsu1+zALrN4eD+f5IlI9TZwxtyZVs4GZnnjV0aah5/4p52y6H8bISZYSCLlcpsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793551639;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=VG7KpqUth9C7vUEstwvVTw+ImzZPQG2lv8IyeNq6Cjk=;
	b=gVtWAzFVXiBm2/sIELt6RTrJSOsjRG2ZRxHimrWQB9LsFfl8gnDHphsh2EdRaCMaOB5f
	 JwUecY+/H7nsGEgT9B/fcGQnIde+EYOfN20+Ks0vQHwTqKZfVZSb0Uvb3gkTVDxTbw2Tj
	 yFMOBMuclD746pF8T9/4q+VYnTp0KWuJKpFz2rjEckKESHmKTVxz4XMGPKnQYbEojC1TB
	 GEmtaaK1tFjB31KjiXaqPAQ5qoXwDkyyf/R5J94xeYzQyZKayBILMPtmKb7r027qseZH5
	 dRGhVUMht5g2wem74PneNoV3Tvmuh6X24yeSRB210RAvEFEMpdy1XpAOkMFpF6N6XRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=qHbb8Dnd;
	arc=none smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 745C8606A33E
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 16:47:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 745C8606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=qHbb8Dnd
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c247f6687dcso391875566b.2
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 08:47:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1793551626; x=1794156426; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VG7KpqUth9C7vUEstwvVTw+ImzZPQG2lv8IyeNq6Cjk=;
        b=qHbb8DndBNkVx2QJ7r39etzM4CIhvAGCMvh6rxVzQoGgdVYQY6lF1iYcaB4IbUo4l+
         umlbmHPZyVDMH8VXL2wTcsHoEWbh972ZdwHdcsSuU0v7RMxPsJ5XyUY/UGRXLJI9f7BQ
         h7FEc481LzN9aZDCnU5zqghTIVP5jE36Pobc5+G0vSFmq/F/s9p58f6PQxxpzbgd5D4b
         oqxIpXhbwOJY4wEyvyNvg2Nrjhsqtw14938jbp4hDdVEC9WKGvm3A3lKWzUxFbZkV3YN
         PnDJ2upx4J5bIsazOt/bZlN2uhCcl5hXZS/vFtAZWGqZ4FZJf8Irabf6GN+oJcnbBsql
         dRpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793551626; x=1794156426;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VG7KpqUth9C7vUEstwvVTw+ImzZPQG2lv8IyeNq6Cjk=;
        b=VvcYa5sEnvPMS1bnvEHSls2CO6Jdhi5uWkplSVjkssBntdWgYSyomK5y5KhFu5c5H5
         2TFt7ZYWmI3zXWwr9QHPVrjs49VnWQfJPFkXSDXQLyZA80U1OtbgVHpd6q+7VoevAW6U
         7cGkSpg7/AX7L5GQHV4JQkvJMKOiIDa4exbk8nqMTA6F4uZ8Egj46eU8iyJ3Iji0ENji
         1U51w8q6ZdlU8dxORx5QJuiofGLNTgLJnfOlc6aKjFgimQEsqqXeGBgJAT5vZao6fbYh
         Js0rjEMoDUFPtltJK8vnjWrdVPZyUb7q6ZnA74Ny2x1VM1adgp4uFRuB6qIZOS52Cqld
         5K6A==
X-Forwarded-Encrypted: i=1; AKwUvBwr8og7QjlL2xAOjmx085vx8TLIq7Hmu+QUIMq19MpnHoMOWFeF75gUxIzNyJyuL/jQOMYTiTDqTe40cwE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLxR3AP4MUjyr68WetLL1Jqtl+rgLatvtJTHZHB9raAz8Bgut/q
	KBKqRv9R3AMkrh73Vk18i+bsgnVcOIiQBf7B+W3SN+Lauc0N3KuHFJyfEKrfVOITtA==
X-Gm-Gg: AYBFou0vE8tI0Cgy0pibiZd0AbxN0hXJZStE6afzY7yoTN7nvY4ft/As4AVJgfkBAUm
	RTshmenJDVrjTU8927YOuGdS0uJJapMvPyJEwPXrqHIFcoPGQHJJnCWefDtP7QTM2Rgf51AC2wb
	RshmSrWMFZ/FL20Q8NcDYCZMxhZ4AUk1yEV0/ujMVP+e6OIcIke1hFoy5f7K4tQtDoGcogWayU+
	tbDIrWTvgYWJHk4P9aSUUqDit0ketons0zlxIQpFjl1hIgLSjt86OVX2lk3E1yL3SobppdCSuW2
	cXk5wTNostvmxWynUxrWXPNhXQ0WCDvl0FWD1rdThpXR48OkcymOp1ca81B2/fcGTKBv5GHjdgm
	VYtBxToRLs4t/Mm8fQBLKdI1PcBGvBTwF33Dc3N1uaq18raHHQgD0DgFOJdNKE+lbtBBsCPKaZ9
	CFVoe1cAqxKz9/On2UcvOlz8jUl5R5UMyR2lbdjvUI4ZdMnZxPJYTn9a1gP53UWT9j2Z7vvfqTg
	B+UUcYF821k/w4Uo+PEpPQXYd4992QcIWJjLGRk2PEOPGRErPTzzbHzvqcoIPhzP2ND1Du0W2FZ
	KAD3TVppb1HXAgoOeWDJdvksy0UP/Ab/fNMOMulE0oFV3nYcaSY9/a6O3WgjzzSTo2mkRurohwG
	fZeTEWr3iBtR9Nrq0PIXYH/DfbgZnKu7HETN5OESdEPcaGnxZcQ+DRLhH3q6XMkA3FWEy2+yxgi
	ecHNWd8ZPeqlbUtSSVOcqRAy3UAAxtmmpIl2POPbC1RwnuNoxGG0olMFeQWR665EvQ1FM5kIe+X
	ztnwBMxD/bbBvv68rD0OiZkE9ULO+gUANe0U22UkTY2IS9L6ORajVeUx5LaigjdpET1O4FVuN7N
	lQ4DCzwKVhr9ad/uB2Q=
X-Received: by 2002:a17:907:9341:b0:c43:eae5:ee80 with SMTP id a640c23a62f3a-c4ca7a09978mr643941066b.17.1793551625975;
        Sun, 01 Nov 2026 08:47:05 -0800 (PST)
Received: from Desktop (p54aff790.dip0.t-ipconnect.de. [84.175.247.144])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabe1002asm296061966b.45.2026.11.01.08.47.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 08:47:05 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org,
	dsahern@kernel.org,
	idosch@nvidia.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	steffen.klassert@secunet.com,
	willemb@google.com,
	jiayuan.chen@linux.dev,
	mfleming@cloudflare.com,
	almasrymina@google.com,
	bigeasy@linutronix.de,
	richardbgobert@gmail.com,
	ecree.xilinx@gmail.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v3 4/4] ipmr: do not drop GSO packets that fit the MTU after segmentation
Date: Sun,  1 Nov 2026 17:47:04 +0100
Message-ID: <20261101164704.302087-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <179241583068.3135.17027966387414517090@kernel.org>
References: <179241583068.3135.17027966387414517090@kernel.org>
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

> Should the inner UDP header length be accounted for in the
> skb->encapsulation branch of skb_gso_transport_seglen()?

Agreed. v4 adds patch 2, which counts the inner UDP header for
SKB_GSO_UDP_L4 in that branch. With UDP_SEGMENT over VXLAN with DF and
1404-byte outer segments, a route with MTU 1400 forwarded all 1000
segments at 1404 bytes, both through ip_forward() and through an MFC
entry; with patch 2 none leave and FragFails counts them.

pw-bot: cr
