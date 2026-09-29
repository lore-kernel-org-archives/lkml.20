Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7594731ED8B
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 09:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790672933; cv=none; b=W4wASybW6JBLRVWXqq5LZWRImdXwfVmpf80u/3NJz7yNnI/vH4x1o/F0SzvjPps7HKMU5TxUaMIj92/yxFld485fYTq7XEl3KWWP7QYZ4iJLOBVOEsazhrDPfySZvBplbmX4EZFO+3//SnsScnBnRhCa+IAGI/rLy8PbymP4Q5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790672933; c=relaxed/simple;
	bh=ruJ+OC8TeuBbcfhTBYGa0RnK/itzn1qKU2Z9PqQpXyE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mCIRzNG5A7YyERIo1QTG8hG2I6yFiH8IW0+pGwW65p0BzJZmKRHGcc1+DtnfVyNlpiyoNpTDP2n70n3bvBv4PrmN2VtzJil5UG5Fg5fGKrLiz8GCMvyxh12rEMRGtTjUw5c8Wg3nLQP3tiumNm5CilgUOQ/A1vkxgiKEQMhl0mU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=deC5XP0+; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=ORvyZlhK; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="deC5XP0+";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="ORvyZlhK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790672917;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K/tDQmq8LLYXlBRzwGWyXEcI6FT4qeqUihRf6IwcU/I=;
	b=deC5XP0+flxFisnNxniV6209R+cZPkgraqQH/0ss5kRzdrcj1QYm+WT5x5BLe84Ba9bi3k
	H65V5MPfqPl5iajPlqIXcAuFG/hyN/CVjr+mt4oxVVzSq/tNoLBo03Wcscl0EDnGbIJvgE
	r886jxjNuEBeYsHVjNJuOtKbUI/Sd0k=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-378-vui831stNfa9nvQ6-jdc6Q-1; Tue, 29 Sep 2026 05:08:36 -0400
X-MC-Unique: vui831stNfa9nvQ6-jdc6Q-1
X-Mimecast-MFC-AGG-ID: vui831stNfa9nvQ6-jdc6Q_1790672915
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-49e65f2f1baso35176675e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 02:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790672915; x=1791277715; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K/tDQmq8LLYXlBRzwGWyXEcI6FT4qeqUihRf6IwcU/I=;
        b=ORvyZlhKMqUmKvNXzg1BWoc2QBC/FMkf18vXY5+nZxI7iI5ECzEIRSzaT19fsi/3IK
         D0hRv07+lQU0c9jIuUb9Pv21hMIQIehnIR6yMmHZfI3DmXDhpl5Pb/lMjRDi3Nm5A4MM
         2X0g0bvi7vvuCWDxneWJpHiG0qRmYwaS60bqYwCBuI3ZbHtRadRJ8qy1x3U9shJbzKWz
         hQb761DbNohgOLkLow6S1J4wwY16SGXGy0ZHFrh078rpcy96G/Fb6NskxSdQedgzvdD5
         yjWbIeopYKpi0fkNnjFwwjTGMoL4S8MfITqLebCP2md/gOFygSgdYhz4jLhHJ0E2dB0H
         vHCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790672915; x=1791277715;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K/tDQmq8LLYXlBRzwGWyXEcI6FT4qeqUihRf6IwcU/I=;
        b=JJj1CGxFykJ9lQUgoTrNUf9Hv/UO6XLBBy8EH2lFOBSKsjwtcPe+DIa8Ka0W2O5+rg
         m3Ocwo1kpelgQfgwrZpx1AeP726rMZUsxz0+DjnuAh4i8dmwMaf+Kcdevz2zLhxDNZHh
         109wcT4dDsn0HnTisrNU+PDBJG82PT/7jdYda/BZV7W74ZkzQNlyqYX+H2pmyUncFPqo
         y6vFKAVgAEkqRUcLBlAFBZHc8IR3fgfvWdthT2AEBbphg+1GgLYEXzqyPa3smpRB7m+w
         ae/VHzeL+fvRAod84703FFsH6cTImly0H3h2UWVwCTR3Jq0JAH+xSPXEzG+Xe0fstTbm
         HAPw==
X-Forwarded-Encrypted: i=1; AKwUvBxkX305B0bjwtnCfU6pU7mysRTa2cDjKrzr1kv9oQS3ppR5J5fyYRXH+Jr/QFp4AArJ74WRyEO903B4iWE=@vger.kernel.org
X-Gm-Message-State: AFuF++lfbRDZIFZDKegdvhqZiTo0INEJpnUGDufnI8dSNhdPxUT4GCOW
	c3CW5B2AGzxO5y2X4Sas38UwAzHlPiESKZSCOs/atfgsH+SOdv0KXdie8RpC7EMkbAn04bX2Xg8
	UO1KFtY+BhKCtthK6mrC6dSwnvh15LeafVDYQjtpiUhS9b57wkN4Jx1F3N7EbYckdsA==
X-Gm-Gg: AYBFou1PnG9AW8EWJ9+Bz7Kv3+9ON8FAzz3w3cFt3z86R6uihpIzn4koFWHRrQpRTzQ
	c5jlLGrXyGQWUblsHxmsfZIoTE5GNbFEXgKS0rBeNo9BA8lEccAZV2qkuzVD022w4qaTxwcJicM
	WHzkcTkRVJZMR9qCy8F2o+9epkDTCBHWvBGivh3JCcNx2D29zun4/TuDs/9N3uVhd04lJF8dDTf
	6Q5ksFCRjLri9jOemkhFhO+gnULBCHlC6JAXSvqfxvz4Wyl+fmJawskRUBz6FOYlu7aWF9eye4+
	KeSWs4ds68KP1nw5R3s3tPNSlbWmjMj+6E5NaEoWOXgbBjbVAR318dwpYknSk/pgPBuaHAw2Lh7
	n3bvyWShARIVq/upSeT5WFQF8JuEBCYbCU1xQx2P2IWvkynjfsYcn1utMxeZdFAiJZV9sL/r/sw
	==
X-Received: by 2002:a05:600c:3150:b0:49f:fd2d:23d1 with SMTP id 5b1f17b1804b1-49ffd2d2627mr138475415e9.27.1790672914985;
        Tue, 29 Sep 2026 02:08:34 -0700 (PDT)
X-Received: by 2002:a05:600c:3150:b0:49f:fd2d:23d1 with SMTP id 5b1f17b1804b1-49ffd2d2627mr138475085e9.27.1790672914566;
        Tue, 29 Sep 2026 02:08:34 -0700 (PDT)
Received: from [192.168.188.234] (ip232-47-231-195.pool-bba.aruba.it. [195.231.47.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48af5080925sm2483598f8f.25.2026.09.29.02.08.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 02:08:34 -0700 (PDT)
Message-ID: <10d0c5a6-98d0-45d5-a196-aa839b452172@redhat.com>
Date: Tue, 29 Sep 2026 11:08:32 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2 0/2] net: dsa: mt7530: fix trapped frame forwarding
 and egress tagging
To: Tao Gong <gongtao0607@gmail.com>, netdev@vger.kernel.org
Cc: "Chester A . Unal" <chester.a.unal@arinc9.com>,
 Daniel Golle <daniel@makrotopia.org>, Andrew Lunn <andrew@lunn.ch>,
 Vladimir Oltean <olteanv@gmail.com>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>, =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?=
 <arinc.unal@arinc9.com>, Florian Fainelli <florian.fainelli@broadcom.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20260923055103.949540-1-gongtao0607@gmail.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260923055103.949540-1-gongtao0607@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/23/26 07:51, Tao Gong wrote:
> This series resolves two issues in the MT7530 DSA switch driver preventing
> trapped link-local control frames (such as STP BPDUs) from reaching the CPU
> host when bridge VLAN filtering is enabled:
> 
> 1. Commit 3ac85bcfd404 ("net: dsa: mt7530: preserve VLAN tags on trapped
>     link-local frames") set MT7530_VLAN_EG_DISABLED to preserve VLAN tags,
>     but in hardware this disables the per-packet override and causes
>     trapped frames to follow the CPU port's active VLAN table (VAWD2) rule.
>     When bridge VLAN filtering is active, the CPU port is in stack mode,
>     causing incoming untagged BPDUs (01:80:C2:00:00:00) to be egressed with
>     a VLAN tag, which userspace STP daemons (such as ustpd) and the kernel
>     bridge drop. MT7530_VLAN_EG_CONSISTENT correctly preserves wire state
>     (untagged frames stay untagged, tagged frames stay tagged).
> 
> 2. On Airoha EN7581 and AN7583 switch IP, setting MT7531_CFC (0x04)
>     CPU_PMAP alone is insufficient; the switch MAC forwarding control
>     (MT753X_MFC, 0x10) must also have CPU_EN and CPU_PORT configured for
>     trapped frames to exit to the CPU conduit.
It's unclear to me if you are observing the issue with real H/W or if the
patches comes from LLMs or static analysis. Please clarify such info
in the next iteration.

Also clashiko feedback looks relevant, please have a look. You should
address LLM's feedback proactively.

/P

