Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793132566;
	b=yoIw9VyZ2BQGP5SEhqjUY7BScnV4gcaKBeYcpH3aOs9FIk6x86KX3MULecFh0BZoZtbv
	 tbwhIn93NtY3VCNq13Vao48g38aI1dN6wGLUSgP7voXlPZ5W9NcDx3fwDMJ+L+kmQqZqy
	 2tjOjXDF9bU3PKk/OhziZ9zjFTSCaDa6cw7hp2UdLgk/VoDxuqU6QMS/4zh5QSEBWOl35
	 VoKyuN1mvir9gDhE3sHTGU/cw61EYVdpY9RtQCpzO5A2HdfgAqeB9gbOJKFBF5hwObSKa
	 s230t6HUjkQghXnXnXdSdgXeagbMVu088ST9zmIfd8BxdqXCa0KaLlTYPwd164rnSsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793132566;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=GTTXDMrHUSZcZgYEx1pM/ktFnMhLa8f1HcQffbd11P0=;
	b=iMdrZz4Q1yYz60DDFEP7WMe031zIkHeB9yXFQJ8bOtP4NBxxVmZjqrYMyd5yqPLIoxd+
	 aMQA4vN+MSK0xFc/zC1AX4c0pOvTi9+PyBQE9pmxRyNO8TM185Ybeicm9kXP27qSM0alP
	 //aswRfpPqOryln9aIuxE+hfPWBsILgup9WEvDcjajIZ7xZ7hn7wyQkVJ96GUr8R0JBbc
	 pRkZqjfA9sNLgKwyOpfI+BdETg2bVxMd7Rmvzc2Xu6yudx3nJ6RLBK8PrKebQ1DeOENYq
	 Fo/23GBRCqKsrIlkHE5gN0ndcFJvNYjvo7h/GqI70MRer+he4gc+RWJ4+vxbO2QeJ4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=RBxPxkrP;
	arc=none smtp.remote-ip=209.85.216.99
Received: from mail-pj1-f99.google.com (mail-pj1-f99.google.com [209.85.216.99])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EAAC606C93F
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 20:22:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1EAAC606C93F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=RBxPxkrP
Received: by mail-pj1-f99.google.com with SMTP id 98e67ed59e1d1-3ac78f4c10bso163558a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 13:22:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793132565; x=1793737365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GTTXDMrHUSZcZgYEx1pM/ktFnMhLa8f1HcQffbd11P0=;
        b=p6XO1TCO02w0jaQV/aNNiEBb4Q0VmFcsDgMZv5khv5mtu4t8w9THAoPE0nQaHVtyz6
         TEGOZskAy60a4HLhYzkPOqturAxVzJ8e9Vjr6iJOwHNFvMyYN9cPlUBFNEUpFee8w473
         Nb2Gg9s68TEs0OyQMl4lJ79L233QxNHe9ljrCpDKdzYgVjdM0Cwf8QHzkEnyZhilt707
         I5r/fT2+KCO02eS/ZhCj37D5Jixmb1xbQMeQemsOwg8OvHNbRzbKeF8sZFHIpiLYM+g/
         nVFA6yCKxmB3EKnGnYwofNE1ZRgQ95JhJkbfGWH7p/94sRLpeHwp3VT+WSQu8bQenddz
         u93g==
X-Forwarded-Encrypted: i=1; AKwUvBxacl2he3e9omoVfjsMARBYlkMQA2ITnKhZe82ETz7a7GF3p2gmxp9XUpL643whOWrGLoAsuRJVgKMvnXI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJU2CJJHaEjdyAr7XvwxeGBwn5Lne+jInMvKyRaEYmOh6x8LIBX
	6oJK21epOYGSUWbSklH5jM3IeRRIfp9hJ8QtKT8Da0ZmlQT2BiilyQbLx+4TQm5Cyig8kpwPav4
	xt1H7bQI25OZuqo0UFKhFih/pOWrwcFEmQjEZ9V7Op8cE26NRwgs4LAmcTowOezRtBo39JMkOMV
	6FuKzgYrREQRBoU92AM9uymL3cSC6eRzks0tjUcQ6Gu914SouwzaNOig3S29S9bPDFY+yd9dK/4
	LTlclF76tExMWD6jlfKtVD7fKk=
X-Gm-Gg: AYBFou1c3JZq9GDhdZi9p5iPntBhiy4601AM9IxgRe1sc7idjU/gQOiHnvZRNl3BgDX
	f0eIWeiqPig4L7O0HHUCymKYbrZLQ7q3ZNjxcWR4cmY+i7QakQGIHXVNei6Jz3qjpQ5yJJybigs
	piK1OegXMNPJfXPzUaI1yjb8+9yGgCyV8DtQER/9WURzGskggSMtZXmeXuoo9/5VneDkQ5gRsDe
	gEzfsGlji8624mu8cxc54wt0xV5U1fCiEby8BHFaP+5RBrlbGXD4N5cneI9D9ztwW4gIfcOFRYS
	Pb6TbtufdxxihXILqRQgoZ/BeKPSSoyLNquGBe/MdBkHsGipAEM6TnboFYZ+2TC/w3IoMO85wbP
	DwBILm9D/Re4oP3PczDx2rf8PNcW7cuM3iXer3AWKt1J3B15ixzM1tKYV3JIPEsL9aLpvC77etd
	D9z9EyZcCAvEymgvqMlEWonlF8AR97TnN0rvJUIjOBmQM=
X-Received: by 2002:a17:90b:1845:b0:3ad:50ef:f5ff with SMTP id 98e67ed59e1d1-3ae580a0810mr138986a91.37.1793132565424;
        Tue, 27 Oct 2026 13:22:45 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ae574bc2f5sm213467a91.2.2026.10.27.13.22.44
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Oct 2026 13:22:45 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ac8f449d1bso195834a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 13:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793132563; x=1793737363; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GTTXDMrHUSZcZgYEx1pM/ktFnMhLa8f1HcQffbd11P0=;
        b=RBxPxkrPCdfC6y1Sd6C1f40VPq3RQcQsoFhzKJ4cuC9EKIICqK+iK8Um6xoQfcRHbw
         QuBWwjQ5bwNTD21go+Z7pQuGoH/iHAe6Bc9TYVz/9unFle1jMJy1+Cal8DdckGq0fF9p
         lBm8jTzUKvVBc8Rme1g18TrbGZOwr+c7vbkNk=
X-Forwarded-Encrypted: i=1; AKwUvByo7SI/qtOHEwyBVbrDUT68eQSsTlI6Ikr80R79v06/OhO7R4zGzRbCiHzQ572aL5OscwHmRX3ETvSlLsw=@vger.kernel.org
X-Received: by 2002:a17:90b:2891:b0:3ac:450a:fa22 with SMTP id 98e67ed59e1d1-3ae57e088b5mr159678a91.2.1793132563246;
        Tue, 27 Oct 2026 13:22:43 -0700 (PDT)
X-Received: by 2002:a17:90b:2891:b0:3ac:450a:fa22 with SMTP id 98e67ed59e1d1-3ae57e088b5mr159654a91.2.1793132562808;
        Tue, 27 Oct 2026 13:22:42 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae55d1650csm275486a91.1.2026.10.27.13.22.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 13:22:41 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Jonas Gorski <jonas.gorski@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net 3/5] net: dsa: b53: clear stale state when creating an ARL entry
Date: Tue, 27 Oct 2026 13:22:28 -0700
Message-ID: <20261027202230.3539646-4-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261027202230.3539646-1-florian.fainelli@broadcom.com>
References: <20261027202230.3539646-1-florian.fainelli@broadcom.com>
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

When an ARL lookup does not find the requested MAC and VID, b53_arl_read()
returns the first free bin index but leaves the entry populated with the
last bin examined. The multicast add path then ORs the requested port into
that unrelated entry's forwarding bitmap, potentially forwarding packets
to ports which are not members of the multicast group.

Clear the entry before creating a new one. Also return without writing
anything when deleting an entry which is not present, instead of making
a new entry from stale bin contents.

Fixes: 5d65b64a3d97 ("net: dsa: b53: Add support for MDB")
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 drivers/net/dsa/b53/b53_common.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/dsa/b53/b53_common.c b/drivers/net/dsa/b53/b53_common.c
index 559d4b360c82..0871a10d8cbc 100644
--- a/drivers/net/dsa/b53/b53_common.c
+++ b/drivers/net/dsa/b53/b53_common.c
@@ -1992,6 +1992,10 @@ static int b53_arl_op(struct b53_device *dev, int op, int port,
 			addr, vid);
 		return is_valid ? ret : 0;
 	case -ENOENT:
+		if (!is_valid)
+			return 0;
+
+		memset(&ent, 0, sizeof(ent));
 		/* We could not find a matching MAC, so reset to a new entry */
 		dev_dbg(dev->dev, "{%pM,%.4d} not found, using idx: %d\n",
 			addr, vid, idx);
-- 
2.53.0

