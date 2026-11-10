Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794282633;
	b=Dx7hVo+ba6yD8gaYe1CJf+ZhvETbC8fBaXCg8Tw4+skNapr/Pc/hMRzGlChaMo5yiJpw
	 Obe0bK/SGYzdNWSU+BKvL+4/vd3cyEJck9d/gyDqUcAKQlgDc9aUCI75Yo70hW6prgoxq
	 3qIFQar+gRJGZ1MhivxjfOz1c0L6aZpuE06fzJNQjsICLGLrG0C0TpY+AJqpJ23jT02jD
	 QYMsKVu5SDaoGp6A3YMcZeI2HCeEd8XpvQOFk+pl7/JDqqR/jeeBmMG7vwpA7Q94nGz+C
	 MY22aoHpHobEb4uNL4cLpz5m7dpK9kMnkLR7OPyEwIKW+qW8+mJT7g1GAd6zD+iestA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794282633;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=wh0SeQdNWzsZyoJ4vl/0g4hHaNPzl6qxcqRd7BCWar8=;
	b=bmuaD7dnug91gjO2UsV69vrED89Z/gQghDQrabJgBCS522pRb9tEr1wX1i5eWS9zP1vF
	 FR6iRGn688n0tmT4xrdi40C04qdqBy2fDBnQ53k1ym7XPUl218WBvhSVnyfk8FxbnMOOJ
	 U8lyrmdEkEmg27KwCEx1G/nj6PZSCtE4zNJ7ergEbc+C0HL/01BpTMTgJhZ6FLkmcplH8
	 YcGuSeqT+FajpoQ1haMKadXuOUClO1kgnc+rCyJ3Fmzfp1trTTuDjrR4fKdO4OcQrBzos
	 CAA156B00m45vvtr/EoROiGEiJnoaWvuR4fI11LTgb6NQI1/bq4UW+oDwtVrsUF2gVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=de+wxAW+;
	arc=none smtp.remote-ip=209.85.214.228
Received: from mail-pl1-f228.google.com (mail-pl1-f228.google.com [209.85.214.228])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3291F60A262B
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 03:50:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3291F60A262B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=de+wxAW+
Received: by mail-pl1-f228.google.com with SMTP id d9443c01a7336-2ed2b4348fcso6151635ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 19:50:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794282632; x=1794887432;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wh0SeQdNWzsZyoJ4vl/0g4hHaNPzl6qxcqRd7BCWar8=;
        b=jyz+DI0N/Sm6+b++v1ZudZoAR8xCszlf1JHQcslCEaVyrpZhc6m3MJGUm/nR+NsfKi
         LkJfkazTgt0X7g0kh3XIjQU6B5ZgdMHWLMLwFSOd2ScwyrNz3+BRTmFavtOrPKjFxQJV
         X3W3bQlk0KKniV2nGVO3FmhLMR0YUvM5BniExwdsQowEuztgkFUdQlblUkadD8d/giLe
         EGnsqOPo+Bwkl1w/JSfq1Xxmdv7ARKy0Ah9yVDtrgHwhDZfKooMwJ8N6gPBTyMdL5Nl4
         BHozbeb12DHmUb3CBmV40rTS5Vw89XebX+zw4hT/CiKuHXDmyftkphYxfjzNGiiACWRO
         SMEA==
X-Forwarded-Encrypted: i=1; AL+hErGh7/N+GqqMEs2DhTbQW6a995ZDXc9STjBr9IQZDg6NnOJCWa/cYR/iCkWC3u0P3+FnHk9yULwEBClmCAM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ieLN8MHbB9hYOHzmPtLk8Q2nvcC3f9AGKrDlifgLDKOy02ich
	qZT4He7MHoDkiepymOaq6actvZQ/ymEsDSH5sHzU0rquLVUHEr1n5vcQUpOc4wPagM/IhOItiRv
	m/AHd4siU9XbYsasVgd3/VKfDSrxpOIqN9jOCl8JE5fgAj/z6DlRDzD3gvJpZdops6KSyRs1eZJ
	IRbecakSnpA8VoqQlQUrEaLQKqAbo5KYLiFWLJE+936DTc/xiZ3IAokVAr85gdDDiQ15dkTUUQw
	EPTvavDagrGevVtQKB7OkW+
X-Gm-Gg: AYBFou22LyUFcJy8w94IGXg72aKTUtzVdB4Q4du35bDz5oUbMBvybQgJLe3zB4RKPCh
	4LQ15hth4uz1E5zg9+B4kboLED+V52YIhGvpwzvx1T9KZdwMKZh+2czBKcdAn9opmgd7WiS69DP
	35CkglXhwPC+vtVsvjFU+I/w4qDUZpSWGKGjesSjAJTJiRRrr3207/drMnNKALY98C2l6Dat8Ja
	p6TeCjbjdGtp4kfbCPXIF2g5vhwxBRAtanGjbWZI2Ns8qxr32rWDd8AFu/00N275KzVvYq048VS
	TC3wh5NoHKkLHnmVyOMMeuH0U4o4TeP5TaVnpURqgdgkZ/F2fdiQ8ulobf7BsaPzvdPMWqByw9O
	tFx89NIdOdklBeNUxPoXd790lGlwa5Z7KLdAVBp94egp7wmoGcOXXaOXQZWhjySrHterhytmW+4
	WgLObQsikgqKgje9VgAVETi5Xtf6JBnJJt847D5S8p
X-Received: by 2002:a17:902:c942:b0:2ed:205e:eac3 with SMTP id d9443c01a7336-2edb916763amr11893555ad.12.1794282632404;
        Mon, 09 Nov 2026 19:50:32 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-22.dlp.protect.broadcom.com. [144.49.247.22])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-2edb65ad9fdsm325985ad.48.2026.11.09.19.50.30
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 09 Nov 2026 19:50:32 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5363763b556so30821971cf.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 19:50:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794282630; x=1794887430; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wh0SeQdNWzsZyoJ4vl/0g4hHaNPzl6qxcqRd7BCWar8=;
        b=de+wxAW+0NsgGktxhi2Rk4z5LF5he5gjBfGi+amH145fIx+RgOZIoo4uUMsQP7Sbou
         TsG9SG506utQBuC9dX30iJX+rUzGTF/31vOHcJOo2Id79tCHgT9FdCiUKLPEVMzn7Jf5
         qEScJ+QMQ2tliPBsCFjr+FKC8ja0zkmygXVOg=
X-Forwarded-Encrypted: i=1; AL+hErE+mpdWrXISYCKGiRAxLz1k3cYEFnD2Ztz9c8jXWYgioYZNiG/MpuJ2Y1dSwN20fMd6O4DoJky6XsdWkkE=@vger.kernel.org
X-Received: by 2002:a05:622a:1a8e:b0:535:a5f9:7529 with SMTP id d75a77b69052e-555291c1fccmr20766091cf.72.1794282630017;
        Mon, 09 Nov 2026 19:50:30 -0800 (PST)
X-Received: by 2002:a05:622a:1a8e:b0:535:a5f9:7529 with SMTP id d75a77b69052e-555291c1fccmr20765921cf.72.1794282629595;
        Mon, 09 Nov 2026 19:50:29 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5550af612dfsm13740951cf.8.2026.11.09.19.50.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 19:50:29 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: netdev@vger.kernel.org
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
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net v4 2/8] net: dsa: b53: fix the SRAB grant timeout check
Date: Mon,  9 Nov 2026 19:50:12 -0800
Message-ID: <20261110035018.2169370-3-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261110035018.2169370-1-florian.fainelli@broadcom.com>
References: <20261110035018.2169370-1-florian.fainelli@broadcom.com>
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

