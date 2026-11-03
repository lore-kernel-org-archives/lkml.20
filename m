Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793678690;
	b=eJ2jjhTcvNWTmWDZ7efB9u2y0JdsUeYrFIM4gsGUryU83te+gVXaK16pFvEwJ7E7hIZX
	 xXF5MkBok6IIlTbla3KPLb+bb33/08AVbgNYuQse4VCE9qHdHIAQXkif7FeZPhiTgw+B1
	 cDi+lSlYml9R121Je5P+FDP3ZTuIWJD+Y/EkDJ4zKERlbF3vUibt5AkWXezeaOe810Wka
	 VCzxtnq3cWiTueCZa1lrxzjXsxOre8ELr+bUFtmO19EwV9ShhR7/q4jdlrHy4hlaZ8de+
	 4nEMShwibGq6qPa5M/ZbhI1bn7WeGMjwUh2UyqgvezcJFtfcbYeyYq96jNi/wPhnldA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793678690;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=cl7XuderxVyatIgZNuprudUTpms6qFioS0bOx3h11W0=;
	b=UbTLGkzoeFN+RL+e8t7ji375dBaDmsQixVPdwpW7ggzK7CQteXNnmsYX75cbeRiDnEOi
	 qTmn+5WV2+OGF6PRULT+o3HiB9mFyVE9MH94s4/a+rjbbOyJeKZR3vEjc3BZ5Jby+PRuW
	 w3Tj3zEaWGktNB0QZzKl/TF+uDP5VvmsYiFy8BjAgfxAu5L6JPj7knwbJszh9Yn/XtKta
	 le993jOZBzzAzacZaH/03mXdzqPHK3VDqYWBt8PK7Wp9Ae/kkuBVM/1jMBiAW5gm/+Q4I
	 BRFUdHERh3V2fTGDHxWnfYPzd0ynI8WApzNNtoOkvaGMV/14d7wtlvFXDrxfUsriYKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R2gIKhW6;
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BF21606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 04:04:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BF21606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R2gIKhW6
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3adac5c10e3so2298320a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 20:04:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793678690; x=1794283490; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cl7XuderxVyatIgZNuprudUTpms6qFioS0bOx3h11W0=;
        b=R2gIKhW6pfblgk9jrw7yZXDmd173ksyQUrOkB27n2rVrm/JMdpjAHeAyYy7ZysBU8Q
         RDHdJtBApkO5eWkEzBM9VobNhpvR54hAh5FFZUKircnF/TsrZdQFSVoWzbrm0fYfpqoS
         xo3RXktiKbnnlmt6fvxqvtuagTkSTraI6bAUWzAGvuw8AZuZF85QJf0ui1rD4IuJ+Wgn
         kDNq4dH4sDy294dxIHFDJCh10fsB/xN2rZZZm3Ee46zD2QvtT4ZNVILPYbP7Tr3bENdn
         tT0xH//OOGvc/+gFaHt237BtGpW0jUZmmBY28WmKzmx0yuEpfQlEgbp/Sdw4A76RBVgS
         ZkJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793678690; x=1794283490;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cl7XuderxVyatIgZNuprudUTpms6qFioS0bOx3h11W0=;
        b=CGjsRMEjqZ9OaURxjmfAo1u9ncFnh1EbQoJxGrqRdSRUQCdp6Y4roF8wrC5U6QWq3u
         f4++WbVqS+WTpoz6IYPX2k7Kev+icPZ5OKCQl8JMalNJJZSyufhVJ5BV2es4ezBhP43k
         rIU8/LLkL9Fgpjhme+QhPPTMzE6hJ2l3GSeZJ0jr0JzQn3SOwrBw1a47rtRW1ZH7v5S1
         4i122vf1KdvKeVxcAbM8LgeupEp3kr/UMSkCCu6QWjRjMdISrgyvGnddRf+tb7eiO3MW
         yudmH4jdK4vsFjWbZ4IMhVf+ehg349c/ih1yq93t3F4+B4GrduDhfGiRejj8DYsOCr8V
         n1gw==
X-Forwarded-Encrypted: i=1; AKwUvBzubIn2QBp7NFscPMafuzL28FdT2kGbDmR4hfb5QjvB1xbPWGercS2hYeW7MmspNdXqBB3067aiQ+LebHo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8vqyNeM1VU3K8wA7icnI/5QKI9OexSzFzHbbPPw8LM8ORVqjfg
	i3XdKNvk4F2B37Gw+eEccNSyaTpAx2OXgBa24jqNTRek5sJJoBkuO+k=
X-Gm-Gg: AYBFou1NdhH+TfN6HMMR9DE3qVVHtqcu9O+qKtc03KC2BLDRsRRLAx8/+YSKnYKFTmM
	/Xk/oG9ZJrqOFqAnILicEC/M0fUsg/mJ/FbSACvjlQ6hQwrmIqL0k9N/3osMCp1o77BaYXB0Q8+
	LM/WhfJcDzSuuWT/9lvK3TUtkTbtLPKchKJgLgPcaSV+di3XGnduj8BhPBbOhDD5u9+Psw4RlGV
	lTIVOsIqphaW3/16Jgq34lIMWwjdmmrbj0NMZpwmElBOb0UFEHYVfSmDbN4/RrmLz/0V2me0u0C
	QyVgh2SH3bWebl2xwZW6jdAceXrZKhozL3SFWH1Gw+qlqjIdXA+bL/tdb/0d3R7j68KMJiVbTjw
	eLq67YWBr2I856ApQUKez11qViTCgsC8RmDZ08HvHc/4RpW+BXaJqm7TMdf4ii+r4JBDF9pMbPE
	fE4NuE/Al5LCU9I7armjbdSWukbxdkXqzJBCNc4G0kJyDdn1ajCnW5xhJOl2bNSBbp4WzpsysV8
	gw7IICGyexBkCS5h0ikU4PGJQIM7YSNwwvhvtVYbmz3C434BdQOb+JCG1egYRRNuEcNRO31OSie
	z3yYHmErt0CglDC+bjS9UCfzjn88uhGPE6K+z4dBQ6LdsVYEnXkNLXXt3bcGiz2evTZ7
X-Received: by 2002:a17:90b:2e4f:b0:3ac:9a5e:9ce9 with SMTP id 98e67ed59e1d1-3ae897f3440mr10056187a91.29.1793678689562;
        Mon, 02 Nov 2026 20:04:49 -0800 (PST)
Received: from freddie-kane.lan ([71.212.222.246])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c896cc6sm1887277a91.9.2026.11.02.20.04.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 20:04:48 -0800 (PST)
From: Burke Cates <burke.cates@gmail.com>
To: baochen.qiang@oss.qualcomm.com
Cc: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>,
	jjohnson@kernel.org,
	ath12k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH ath-next] wifi: ath12k: fix MLO 4-way handshake timeout on QCC2072
Date: Mon,  2 Nov 2026 20:04:34 -0800
Message-ID: <20261103040434.3387789-1-burke.cates@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <492ece60-a670-48f4-a808-f09394b3db95@oss.qualcomm.com>
References: <20260815014329.3748059-1-miaoqing.pan@oss.qualcomm.com> <20261030041902.2740757-1-burke.cates@gmail.com> <492ece60-a670-48f4-a808-f09394b3db95@oss.qualcomm.com>
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

On Mon, Nov 02, 2026 at 04:02:56PM +0800, Baochen Qiang wrote:
> Hi Burke, can you please try if below series can fix your issue as well?
>
> https://lore.kernel.org/all/20261102-ath12k-logical-link-id-v4-0-f4c7807c299b@oss.qualcomm.com/

Yes, it fixes it here too. I took Miaoqing's patch out and applied
v4 1-11 instead, on v7.4-rc1 plus three ath12k commits from ath.git
(c752394249f8 and 02121aa4a012 from ath-next, 1e678e37ff13 from
ath-current) and out-of-tree Glymur platform/board patches; the tree
also carries Miaoqing's dp_peer reconnect fix (8b6b871332b5). All 11
applied as posted.

On the tri-band MLO SSID that failed with reason 15 (SAE, PMF
required, 2.4+5+6 GHz):

- 12 of 12 connect/disconnect cycles completed the 4-way handshake and
  came up as MLO with three links (2.4 and 6 GHz active), ping OK each
  time; no reason 15 in 23 handshakes over the session
- 5 of 5 rejoins after s2idle resume
- non-MLO WPA2 on 5 GHz still fine

This firmware sends the PEER_EXTENDED event (two per association), so
the host allocation path in 8/11 was not exercised. I'll send a
Tested-by on the cover letter.

Tested-on: QCC2072 hw1.0 PCI WLAN.COL.1.0.c2-00277-QCACOLSWPL_V1_TO_SILICONZ-1

AI coding assistants helped run these tests and draft this reply; the
results are from the hardware runs.

Thanks,
Burke
