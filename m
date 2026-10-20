Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792525829;
	b=AReNybXriOOlbXqKCxLycKZgsKDMr+4/oLNVasZKNFOwEo4yB8XHEtnPWh6sfiXX01Ns
	 a2O3VReNBAI/PjOfRwZh6FUs28P1hJey2uPwCAxMEcwJho5QSqn3DUvDgFn+l3PoLo/p4
	 37R0kFyBZosFXtR8fNX4IJL6z1VCupo4EHlrre1s3av9IzkbonHWowBM9HOEkHKtCdP0K
	 3lEEGlRFwZN7IActEHjjAKu21O3xprRrcfYRYsQ8JlewvB4qI9A7xSHpQBYkp5BnLqoEY
	 zXjO2moxjyDuPcYgPo6YhFuv58hCBGrDDIfTZk9nxKLbZPtRnkCUJ3OZlOhoFEf0qNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792525829;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=hPa4PG254yePdehpmJWqML5hqKXw+sws5WB7y+lwM98=;
	b=muCUPoyMwZnq0VLPtyOwzEz5u5uxrp0Cqn6mrk9qbzJVCZkn7pKOWENdMrCIu/9NQQDe
	 bOM8KvQer2rJo1fs/ASoCSqus33tC7FDGyCOUZl9J9P+ZefkzuNcsLggXsBX9K1JWdyTG
	 CZgYwhWzNo0wBcbLKw2u8ZH7gVuRRFJUtWhwKcNfLA/k0/E49bDMNhmBjHLuoJj44t9se
	 I7w37+hEVE6f2tZNTeZsHTx0xPEXZVW14FB8vBsYDXMkT9hgMqSmPTIA2hgKFaogNWbbL
	 lLkqeetqMXv43iTYwqvhcPMC9PQgJzjHev8+trMUHAqlB02sU9RuphCO4GTY/fCgonA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=NuIBbCyO;
	arc=none smtp.remote-ip=209.85.167.45
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAD21606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 19:50:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BAD21606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=NuIBbCyO
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5be47159f2bso2962335e87.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792525827; x=1793130627; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hPa4PG254yePdehpmJWqML5hqKXw+sws5WB7y+lwM98=;
        b=NuIBbCyOHLjMgBRgN0U2pccaR1TZLAsQhr1eI7b9dpYjk5TlNnN94DdOAXN19YkR7D
         FAf8nTaWqBcQbkylIxVI5KyXHkXknkDYt7DbtIn1A08do1AD1oVysJRCpy81PHz37BEm
         x014kEN3iJ04lFyi8hElEoVGeEPXX/8cBi5LcFdm5PQXylCE54Y2pr0yKGA4R6VQAHdi
         /HLYIHUAF/4tIGEKKW05bLQEnDiGo1snPRRas0w4qeATPZuUYn9RTZssEOckbbc6bnQ0
         pDMMs1XJUDvJJslhQxV2fG2OAscyUOSOnaNVGwJjLjWHyWx9fVUSKYloowuqwMfn+P9z
         ydRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792525827; x=1793130627;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hPa4PG254yePdehpmJWqML5hqKXw+sws5WB7y+lwM98=;
        b=S38YbD4SQnN85h96Fb8Z8hHMY/Y3MzZy0S2tvbC3U1YOrBKViZk1+jKR9Dr0UixUcG
         /g9T5utmhgkZpCxsHWkP9/v1SkzLjORzTCcb//rM9OG3YCY+e6xGiVElFVMLNVQXtA80
         x1h6RFF5c4xqO6QDSYPQszhAsNVbLj/3w4WVs8PsFuTyWtVAEpI/BFq75BquZQTt5CFu
         CZjfToWkcqs8irM8cbpB8/oV3NRAiEZ1xicnbmyOcGbQDXvyGRmi/ZVXXR5yQHvoRjsK
         VuutHHg2KDVZtyGNlDA9uJGHShCUJRBkS6dq4ORblgC/glLvN65o7HpikpekIuntsALA
         snmQ==
X-Forwarded-Encrypted: i=1; AKwUvByKh2olTzyiUHjTbjLaUT1FsDccR/J7T94rLyggcdQWoTS60AR1f16b3wtAnAlvnh+f/ZhcVIcfLnqlJNs=@vger.kernel.org
X-Gm-Message-State: AFq9FYKE7f4Wd5ojNLQD/TKKliVNVtO3Gu/fwpaBDp1zbLIyoUwYKw0S
	W5NeFkJjecZerDYz/Vh0QQDD3VhqYFoS0+1cCIbXM0caG+2XDWdmF3F0
X-Gm-Gg: AYBFou0z6x+1AaDRIPj0WC7OYVW40fAAu2ttkHv7W1BMdJqD7xjBIsnvc1XMbDQC26G
	kjPDCiuKbae2+mu+vXoA2o3vVNWkJHEnhrD6+JNouSY5dMu/+S7r5jEbpicSZRxeAtZAiQg6Vsr
	QE53txCLF+eR5B8Lgo+c+KSzVgJIkJ0T7qoAMJpV0qqCHpCKGOlFj6UxxeR+4v69gddiFyNlFfk
	CSMQmtOrCUGQBarK6cNKMVEoTc8oZFMD/znYcP3ewFnoK+vXxL9bvwh9TbHbi+Gin3ecLGxkGbH
	MxIEcY8dQrQ8imXYFOJhhLsIpxn/DHSMEJyozenIUckfYpL1QEFN+71R7HVnrlQOYkgGVxMiIvY
	njGlJfxVI75bWkt8ePvFZMc0vVRc0/W9lQqx4OVEcIGMtuYr5283JikniN0OuvITfu9/oZW4biJ
	qqF0OWAjEDzNN7pIr3o0w/lHVwNrD5J2gAVY1dbwB3YTjo2WuKbFujkP2gFQuUb0Ghgb1ZD7NCA
	/dLyvOgfmiY+txlzZ+n3h7wRCgmzKJ8xvgN1sxzyMaDU1YgPiXsqjHxtBNHrWygLDCWncfNfnkx
	5r4vzg9xGejrq/2zSNmfz4ha0DGk/EJblnngtqPdu0mc24ay1la50knjgSUXrbDHWxypjYOG1ll
	BWQ==
X-Received: by 2002:a05:6512:3a8a:b0:5b8:bc5e:b57f with SMTP id 2adb3069b0e04-5bfa1c1fb76mr4379e87.55.1792525826617;
        Tue, 20 Oct 2026 12:50:26 -0700 (PDT)
Received: from kompukter-Systems ([83.142.235.16])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfa11a8caesm75345e87.5.2026.10.20.12.50.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 12:50:26 -0700 (PDT)
From: Andrey Derkach <gabin278@gmail.com>
To: David Heidelberg <david@ixit.cz>
Cc: Jeff Johnson <jjohnson@kernel.org>,
	Johannes Berg <johannes.berg@intel.com>,
	Kalle Valo <kvalo@qca.qualcomm.com>,
	Michal Kazior <michal.kazior@tieto.com>,
	Richard Acayan <mailingradian@gmail.com>,
	linux-wireless@vger.kernel.org,
	ath10k@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	phone-devel@vger.kernel.org
Subject: Re: [PATCH v4] wifi: ath10k: make in-order rx amsdu buffers persistent
Date: Tue, 20 Oct 2026 22:50:20 +0300
Message-ID: <20261020195021.1133728-1-gabin278@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261020-ath10k-a-msdu-v4-1-670b69d39059@ixit.cz>
References: <20261020-ath10k-a-msdu-v4-1-670b69d39059@ixit.cz>
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

On Tue, 20 Oct 2026 20:52:07 +0200, David Heidelberg wrote:
> The WCN3990 firmware may split an A-MSDU across multiple HTT "in-order"
> indications. Mainline drops these ("failed to extract amsdu: -11",
> rx_confused, recovery), collapsing throughput under load on affected
> devices. Stash the MSDUs of an incomplete MPDU in the driver state so
> it can be completed by the next indication instead of being dropped.

Tested on a Lenovo S5 Pro (SDM636) with a 7.2.3-based tree, on top of
"wifi: ath10k: trigger hardware recovery upon rx failures", replacing
the older out-of-tree version of this patch we carried before.

During TCP downloads the firmware split an A-MSDU across two in-order
indications (once in about 39,000 indications so far, counted with
kprobes on the stash and resume paths). The patch stashed the MSDUs and
the next indication completed the MPDU, with no warning and no
recovery. Throughput is the same as with the old version, about
60 Mbit/s here.

Tested-on: WCN3990 hw1.0 SNOC WLAN.HL.1.0.1.c2-00455-QCAHLSWMTPLZ-1

Tested-by: Andrey Derkach <gabin278@gmail.com>
