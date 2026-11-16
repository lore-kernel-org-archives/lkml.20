Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794804534;
	b=nMho4znkJrEfzdPD0oPkee0L8P5OVoHK68NzBQ/avpSdbqPm9rHLZXTUo1lT/LosdQz0
	 kyN/D5swN+A+XZIBXfWJkaK+UDsXBjmr8E1fua3IxMNhis1AVogpx3w3tMYA/0rqwZj+g
	 Eiqdf8uPKY1JI4yytHzXywExoCjeBeFs7Rd/gqLSIC0Qr9BCiBP0KGp+hYALjk3rFoZwv
	 F6r+uIOg75vNJrwq/4ct6y+Z83PxHI/PU5WfMBGZLvJ0UKYctB+0L8Gw75jqO39+MF6jS
	 mzNHK6IG5kzFIV8a5MVBAKmo258Bbn60GIM2umxhJPzM8YFzHN7CxDCcr0bntSeffEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794804534;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=wmDJGpNor/i2EbBeChp/TshHxfvcgbfLGRN8N25C3l0=;
	b=B8/fliUZhK1Q9pnK5y6oMVvdDvEC/ThWk+U8bmjYvHiCyq4XESPYW07HwwCOqtw+2BEW
	 G9gpRbsh2/RHLohXjBxQPacaqhEhBM6E2ONeBTNiLHye6LhewmuZDycffKT9EaDTmnrS8
	 RL6kS5T8nHXKwdqG9TRCAr+gq+V1ZM0uH3273fbvSK3QDWXLuzgOFHwmsA/RiUjLtaYKn
	 bBoDVHO3L/DLGpMXZIFdhOQdthOtJMOEvGquQM2HLixUNGVfYkuUs2CUAImmTnlXvtH2v
	 ZiFt7j/wZXWPDrAg5Pryaonz2KznGGlVXMNHAbjQM05NXy23YUSH73n1vLEhqhkxc8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iQyiWSLl;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93052606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 04:48:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93052606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iQyiWSLl
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-36e99cf7bb3so3938786eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 20:48:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794804534; x=1795409334; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wmDJGpNor/i2EbBeChp/TshHxfvcgbfLGRN8N25C3l0=;
        b=iQyiWSLlKrHQPszF8YJwxf/l9hKbsn3bYs1NXdONMMU7xRwBtwBxfBt1UkM/rjlL0u
         a78zLsm14w7QycC8qDL2ruOTUYsjORz6q8qXaYOR8ksbOyXQQtMZabP0HkOIYqV1pXMC
         0RllMSl4PC0SHn+u8EBFnxn6aXLR4C3ddPCwPlGlsxYp8uqqFdJtKPT4hc3BWbwFyzaG
         EIBXL79mT/1z9kzC5NFVKPsHvf2TrhF+3ZgkjsfNJBS9JEP/LFTZj/EFMk6YvLtbuleX
         uF3m2nfx3sP4QZKOsGkYIbmlZtbWwcriDoolK9jbNB7xzw9n5XwpF3z6TNB8kVOvsgoR
         BD1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794804534; x=1795409334;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wmDJGpNor/i2EbBeChp/TshHxfvcgbfLGRN8N25C3l0=;
        b=L8JiHEnSmamha0IwdfaAJad6bUiGuV3+KgsakYivNW/+YQuk0+XRLSdQ84+PXArJFu
         l5n4pQnKwfuqDHiXWHNUb/mIs4fRXEaL+Y1RLZVyZjth4cERwG+mNq9go1MS2v4DxVy1
         016OHLS5v7wBKoOjQQWFW4UdUgKKZkJS26V+pdZMU/9E3q6JRveVXx4otsJcFQAAy7qg
         LLWea8cO6EZYXW7PLmu1WO+gBBQJ8fVdGNpY3uOBDfclbNL1H88xH8eC6R+oZ4v7Q9Mf
         m3YqEKn20V2mMVHi5cvoGAgZ6pzQ/s0mI/pdQFafIfjTHcS02LGOalO2DKJu7H0hbWw0
         V4gw==
X-Forwarded-Encrypted: i=1; AL+hErEsDqokzvWVjavAydMyPoCvFKV7o+lVtypo8YBMzyB6YFUMbMufx71zWlHDsoM/wju2O7od4Vp4WAkfLd4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8KO/g+qZ1xNRV5EkHUQhiMeE/80Zs04jLTvaXM94ETN6ZpaKMJ
	GQhlb/3nWakgDgi05V6lavdckhojrxdGq7FvurP2Wo/vVheXDCE+Gl6U
X-Gm-Gg: AYBFou2x77ND0aCCBIAxXDE6HKbV2XqWMUx0vXxdRUSUERjPhQobKUrMWdv6U1gKqRl
	0UOPI44elSTQSGII+dk2UffJMX3GQCmzogucFMfzJaQAnv40MGViUy3IqSvLIyzLkWH4WVhTlDD
	GtYdoGhDSK7wZPiX2CUBLEY8DWTuZLhxh5h6asPGU6TxM/wtFH+oWqiIiYbldUEwiBEWayfalXV
	G5CHYdTwOUOF+XfRiWdX+s25Pizs5namQrotXIRiodYOQvuxXp9WqQrUjpgzPZfJoExjPbBpi+c
	13lJ2MXXJraBbQZZN3BGlofq+RfPpFsnbbkBV8jwyHYQjSqsJaUVDG6cg983k7TW3vOoO+fOfBB
	V0+2M/+pEDVp5S/v9wKdAwZipv3WQXrtPh3qOle8u9HwlwuwKSy5YjoTn+8heakE30SKqEWT+ot
	ygA5Y1wWtZJRrJ8LDiiAvf92IpNjJP9sBzPBlsECdkvMODBXwKbROoJN12etZs6q5vrGUGDAEID
	FfgllAdEDyt+abziRp6JugIYhGGVUjgApf59BxlI7juZ5esTZAk1k7FAAf+/9mZ9H4xyQpaqjVe
	lX2ehduxV/li8KjXhyNYdj/XKpurscfKOdW9YDY1hQwLZIwmFYM0C/FLWni2qGnjGqtP
X-Received: by 2002:a05:7301:4d07:b0:375:87f5:ccee with SMTP id 5a478bee46e88-379684b56e7mr10407948eec.29.1794804533447;
        Sun, 15 Nov 2026 20:48:53 -0800 (PST)
Received: from youngkk-vm.localdomain (67.216.200.102.16clouds.com. [67.216.200.102])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37956bad6casm29442346eec.26.2026.11.15.20.48.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 20:48:52 -0800 (PST)
From: Cheng Yongkang <teel4res@gmail.com>
To: David Sterba <dsterba@suse.com>
Cc: Chris Mason <mason@kernel.org>,
	Qu Wenruo <wqu@suse.com>,
	linux-btrfs@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] btrfs: tree-checker: reject file extents with oversized disk_num_bytes
Date: Sun, 15 Nov 2026 20:48:47 -0800
Message-Id: <20261116044847.285669-1-teel4res@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261116044543.282187-1-teel4res@gmail.com>
References: <20261116044543.282187-1-teel4res@gmail.com>
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

Please drop this patch, it has a problem. Sorry for the noise.

Thanks,
Cheng Yongkang
