Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793394843;
	b=5e2eaEGFrRJxSPi1WAXKy9WqDOZUbjiC92da3uepN9350j5pFYlRGd5kwYMVZb+utfeV
	 mNZCu5iQtkEdG4/YKL8/oO/wGEFCL/SpiitrpGglR8gM4wts/OGqOcXV6YMfrcYP2dV1K
	 bq/6AZCHBG9LNtcTBREcNe8oKhKeFeZ7TYeCb1iCgTx0tjzc4w/7fG3dspcgNbyFHTmiB
	 HaXiHEpbykOoSIvNuY4pfuCejNaol4DeC0zGaZuFFCFH25R2mvp2ykXZT0xcO/rHomuRY
	 pWqARC/ti7nyjYk+pxX78euWtXPuZpEMXLrnD5embfmB2COVk1v8Depe2DwEnxkiGnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793394843;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=wh0SeQdNWzsZyoJ4vl/0g4hHaNPzl6qxcqRd7BCWar8=;
	b=rHE4gN+E2lZ/KA0Pk7KTWZWlGZkAtSYnnYadFDJ5WouWYoC0tmb4aF/RqSY+Nupowa0j
	 ctkDPFJRjbVK7yu3Oie6jAKbINvUu7rTWafpqzQ2a3v4uzXmS8Gl47s5jAzzhwQLuipr0
	 rMJuGFGOdfT4fDvFI4vwTvImLf/FyJcop8Vla1Q5cPZPysDr8j4gRbriEAZ6W/8neCbtJ
	 T/p3OYkkUnuTJjiRd+fafPBpAHQx+obLRs54Po389fj49o3Ztwzc1ED6DigXhtfjP/2kw
	 BS5ht+xG3z+zQumnAN7WwxJDOxhHOsRIS4OFwaqHi0EEHcZ7pfGH3Lvi8OlPVKBrRYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=dqSSuh7v;
	arc=none smtp.remote-ip=209.85.222.97
Received: from mail-ua1-f97.google.com (mail-ua1-f97.google.com [209.85.222.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EB1960A2614
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:14:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4EB1960A2614
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=dqSSuh7v
Received: by mail-ua1-f97.google.com with SMTP id a1e0cc1a2514c-9906870a9baso615220241.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:14:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793394842; x=1793999642;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wh0SeQdNWzsZyoJ4vl/0g4hHaNPzl6qxcqRd7BCWar8=;
        b=LdVADFD5qUKuBSplqscTd7rLXf5gplTG79pUE7eNYds2cJ6VlbpILgkYnWhDK22K7h
         rg6cVD2Y8SPRn+GDESrhGTz/RD6cR6hz5KrhH2GYiLXaz3ceBt8JybcPrkUMOcK6J8Dq
         9wZ0SDtFk6HFEeZDqHU/cdxH2MOzG2o8RdBR3k3lC+c6vk2LoO9vh4fEehTkhCEr8kPA
         67JbDeiYOTfvl3+aJ1zRr3i5et6/W4BbcQR/3sJWMW0K7NvTPICj13ScXNoDDJbmaSiO
         YbwLIv/4EGMev+KAytR9/ICAOvXksbidhucyYeIaSmcVzfwmoaafcvmjGeFqXHvhGsPq
         LrOQ==
X-Forwarded-Encrypted: i=1; AKwUvByfgqhBkOj21cpIuBQ7Twy9vFdUbRpPUEAb/kYiuNSzskCPNK/MiTel0UkkLfoHxwGuwc4jkx3QFaTECOI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKttQzkFsL4uv5Jp2/9YkT563cJa4bBjnzvSq+2YPB21jcWHSDz
	q9EwehDhkMbhZknIjWzHn4XTegY3HHaJSpUGsUAQ0Q1xEbb3r9GnXXKA0pRH1in1Fmq72/KhP0O
	bE8LPva/KivVgXj49T1FvFLecXeRqZ0ZLBSWVddt023qCYU6INhk4zA1XFTExYoFQUU33uzEKjX
	oV+qqS8WH1OBDXXoZW6+4ivEFaNgzu7ix4xPQDWXWTqKCuoTeNDorkBVzGHG5HGVLIYSquYf9tf
	6XoD6qmSBcDWc/7r0M/IeQXWqU=
X-Gm-Gg: AYBFou0yAxmfUCVgcpaQaumTPy54dnV93k1DO5WD3DTS7GhhKaRvVayFLn6VghvPj4E
	ctjBlTu9jUDpR9dJHlb6YHt5oOyqdXMaynOiKTh1SSu5hnd+xNwbEEVl08o64r3TFbWr95DftxZ
	YTNB0vrZv1/sUKPCNvuFAronc74Bfuz7oV3eMQ2lbEqQPhNJZFboq9mJUNf+2X7mLAkuGk2bd1D
	6dKQITBQN0MNESB0TSjwr7b0oy0kZPFCvyTJt/gFD7DSI34NIMxVhLNmYFNuGm573hTMcDX7j13
	28oa03lk6WY7JScdUZVtTcQ3+39JKw/bkEgswNDgJeuw9wjBFMx03TODgGSFOiSSGo2OSWQngun
	qm4oplkemrd0Siix7EwU3b2HfRFIo6FDnwj7P9L7gTd0cTm1U8y2YKVAWF0qrqnM6f9MZfHbcVa
	73UcIcctYt+mqaUvcLjfX7hP5FsEvzxSiuFZ1s+PAS
X-Received: by 2002:a05:6102:a4f:b0:7cc:94e0:ad23 with SMTP id ada2fe7eead31-7d072d4a990mr1974142137.31.1793394842181;
        Fri, 30 Oct 2026 14:14:02 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id a1e0cc1a2514c-992ee3472b0sm130610241.3.2026.10.30.14.14.01
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 30 Oct 2026 14:14:02 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36a3451ea93so1786491eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793394840; x=1793999640; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wh0SeQdNWzsZyoJ4vl/0g4hHaNPzl6qxcqRd7BCWar8=;
        b=dqSSuh7vsFy0wxN80SDEscy1x7RWRc2g0oDZZPDTuuOazj8Ijrb446UHdRn/T+z6re
         IBEbsY5kPARkanDJHugLrGIwxiuape7i17iKmET9xi/1deQfBmXWN4RP1VQCYicywZp5
         dOAgYLXrt388RaukTiK4gq2sYnLYZgBDRLHak=
X-Forwarded-Encrypted: i=1; AKwUvBzJBECGmCPSOBU10RZ3REfGMhhRO1wpYbMZV93vC3lTQiNtD3H1qCVsafTDlDkzKNCbzLEAluVoSiuQqsE=@vger.kernel.org
X-Received: by 2002:a05:7301:fa4:b0:36a:713:a76b with SMTP id 5a478bee46e88-36a4236a5c5mr4971847eec.6.1793394840137;
        Fri, 30 Oct 2026 14:14:00 -0700 (PDT)
X-Received: by 2002:a05:7301:fa4:b0:36a:713:a76b with SMTP id 5a478bee46e88-36a4236a5c5mr4971801eec.6.1793394839469;
        Fri, 30 Oct 2026 14:13:59 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42669128sm10574595eec.3.2026.10.30.14.13.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 14:13:58 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: netde@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Jonas Gorski <jonas.gorski@gmail.com>,
	Daniel Machon <daniel.machon@microchip.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Vivien Didelot <vivien.didelot@gmail.com>,
	netdev@vger.kernel.org (open list:BROADCOM B53/SF2 ETHERNET SWITCH DRIVER),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net v3 2/8] net: dsa: b53: fix the SRAB grant timeout check
Date: Fri, 30 Oct 2026 14:13:44 -0700
Message-ID: <20261030211350.287566-3-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261030211350.287566-1-florian.fainelli@broadcom.com>
References: <20261030211350.287566-1-florian.fainelli@broadcom.com>
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

b53_srab_request_grant() polls for a grant up to 20 times, but checks for
an iteration count of five to detect a timeout. This rejects a grant
received on the sixth poll and reports success when all 20 polls finish
without a grant. The latter allows a register access to proceed without
ownership of the switch resources.

Check for exhaustion of all 20 iterations instead.

Fixes: 967dd82ffc52 ("net: dsa: b53: Add support for Broadcom RoboSwitch")
Reviewed-by: Jonas Gorski <jonas.gorski@gmail.com>
Reviewed-by: Daniel Machon <daniel.machon@microchip.com>
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 drivers/net/dsa/b53/b53_srab.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/dsa/b53/b53_srab.c b/drivers/net/dsa/b53/b53_srab.c
index 83a03fca142a..f4689078ccd5 100644
--- a/drivers/net/dsa/b53/b53_srab.c
+++ b/drivers/net/dsa/b53/b53_srab.c
@@ -105,7 +105,7 @@ static int b53_srab_request_grant(struct b53_device *dev)
 			break;
 		usleep_range(10, 100);
 	}
-	if (WARN_ON(i == 5))
+	if (WARN_ON(i == 20))
 		return -EIO;
 
 	return 0;
-- 
2.53.0

