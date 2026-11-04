Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793794353;
	b=EWRAcRfQWXu3J8M89iWOH6Vx9OuJIweDFFikTGjAWxGXrzeE1jeefotbBg6Nx0ScFePh
	 pZl7T0VW1ZU9WC9D6e+arlr6PiwG2rmd+qgmvWet7GsoLyNwLd4OXnOaD714N7ibe/RQA
	 7KaDz99ebKcw9UkRhaBYb2X+eg+laehyuk56ZatG41Jm8d9wzzd/BHTnaLHextog+nsC5
	 abJ9Uv5cD59khrPPDC2ecKHvxzezdE2sk3jA4Ji5t9GPUg2VIzKq1wN9t2+ob6+uQLP6L
	 ZvnEMU0kjTG6zsBIJaueCvU1Zm5nJdfE/K8DUyISTWvnYMSBjPyAMET4s7A321r6TkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793794353;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=3hdjxJDa2z71+/Z+9H1w4CH4cajXV37L3T9XXobZoCA=;
	b=XAj+HdVSQ4HV3xWxqPs0BM3I0GCKQf9QSAaABbFMGdcjpXeXHIf/stuCzyDyfRxpchMd
	 NUP4dzyYNqoJ92fyU7aXWUkFcQnFg6h3j/AFqjLZNoed+cqPwD5fs8Wo9T3WTpGFFcP0W
	 ySkLmqw0mCCf3g5r55lsmoWkXfaLjHiFGe1gFrNsFwy+guViQd8fawCDY3aP0TFT4yEp4
	 hZqsfBUKOhDgQmlp2rWOnB6YtY4VGNZ1jHYarfJZ90oeERdLxNKLp0vt65jT7rPgg7B+K
	 oWpltaHHC8+3ZJVxiT6KEmdrs/IOJsMSiuLpgZDqrLKo8z7ZXkLCoKW5o/QHkpVi8Ow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LbYAv4p+;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14ED8606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 12:12:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14ED8606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LbYAv4p+
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48b127f1cc8so37639f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 04:12:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793794351; x=1794399151; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3hdjxJDa2z71+/Z+9H1w4CH4cajXV37L3T9XXobZoCA=;
        b=LbYAv4p+IC3snsp4kyiDeq7JnlTxI8zeQoSRa0t2mpXN/FGnEHu1VCTe3tgYCN3zzQ
         M7QikGo5VP+jY2Eyj+bCaWUC/mDXfSlcSaLRK9oTlDAXMPg3cDhVbawlu/fwTg1I8/LI
         BmhiSghDeUn8DhwqW/GNdddqO1qNgtCxeIxksmf0azGKBHqAWOwM5d9khwEO9x8kEn6r
         K3eAQUFfJ4QWRAVYDNY2IJFcra10k3WPOgay/xz7htrS/Hpmi4pQNIVuy1M/3T6j4lYH
         DaClonnOHHocLlJhTrdIfaU86F9PCyoXmy7+TPFQTKJCytyWC/rJFs0XZtHSWwBDRqm3
         8tCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793794351; x=1794399151;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3hdjxJDa2z71+/Z+9H1w4CH4cajXV37L3T9XXobZoCA=;
        b=eXShhlkbokec/+bM9/Yqiebad3vye2DGNCEvum50pZa7hsMTf7Lb/YcVLga+9AjlvS
         lRLVWuOB8qnbqua0WBsEHl4oHbTRY366XT6dLAwbwOIJeYfdKhPk/Us5yqWYHak1IP1t
         DqzQM8koH8RkQDNSt9D3xLTDraAnztr7bYxOeYc2nk1AKQDo/44Cn7mT1fWCyi22iDRz
         bKYjAWLhYjGog/ZdiBkoXd7Ah2gILEy2rKHJMO34G4yG0T7TRt1MfxxSJPwSXqWYZTCl
         v9VDYzOEaaLrDdGPG0ku8YmPCuozf+CFmNeL3h7fsUuGCH+QVVbaqk/1C8qkpVC81lNc
         Ao9g==
X-Forwarded-Encrypted: i=1; AKwUvBzd2n9lGgdCNAxj5X+DQrGKTL/d9n/TA5DCX3czc4oSUPgrwjsn5ZwBwEGCNtW1YQJwe0wZ7PxPj2JxbuY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Uhu0DwO3ISO26DIWHpZXun7Uq58+nWfA6Vf7lPDCu25Mg5umM
	uiGSUNj+WIiJW+c0WBZOQkDqCUUi16tRUrlxwpSkSCXrBmdN2O8PHmkW
X-Gm-Gg: AYBFou2l9MM4FdovHIWdQFepv3RR29aWfYvH/VnFrfZOI3u1RK6yt7E/kzYdSE9QFTW
	FI/AQfo2AXhAqHpbTAyaTN/CaZyV8z5Da2z5UWTQUuKum+UcjpUjatxkfyM+AAFEjjyVrBExNq1
	hKPf1QhaB9XtghE68F+sgbkU1gMIIBiL0jaKXSa98Mtq3+gkjC/kPOWrDsT9l8lMhRnVk4iFQQT
	YeiXDZWQbqCXaFIg0CcOb/ZGVVwfvCdzlpgXEGezU5WFD5bHrUE1n7kkpAFzyKgRIA7vNE9x+tZ
	5tF/58oBq/LKcTFUNOw4lx74/vuS/7JrXXoz3pMc+AyBW3LI/KjdQWUiKfReN8AZ47EziC68vdA
	dwQuuHg/0zteSMehN6Tr0H7YU3/qw/64JdgWgcJ3jE55yAG6evOaWwKs2h73zFXPS9GomTYu+s/
	O1qrPizWCPiB7c3k+q+IR+qXLHFTNNMJRSC4NcMsVxkZZyjMMgEus+CwGCw/HBVRLwvbIm15Sk9
	L+BVGQHyDw20sQ5pxu4KEEOzy2f4u2hI2/ma6IHbwH5BxUw2YT/aKixV9Uucym1a5WZvTbwNTX4
	0U4qJClJH66HcUdLXlvbBuJLp+9vwuV96MJxqV3Beg7f5CanDF0N18Fm2RvGlv2mVuCSjOGa5tK
	5KHYwlTP9THK1a5w04AVkhhqnGXhAAN5b8CY8GUd9
X-Received: by 2002:a05:6000:310c:b0:48e:eb:56a5 with SMTP id ffacd0b85a97d-48e6e2fb8a8mr35066356f8f.4.1793794351171;
        Wed, 04 Nov 2026 04:12:31 -0800 (PST)
Received: from thomas-precision3591.paris.inria.fr (wifi-pro-83-006.paris.inria.fr. [128.93.83.6])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48fee968763sm3641943f8f.56.2026.11.04.04.12.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 04:12:30 -0800 (PST)
From: Thomas Fourier <fourier.thomas@gmail.com>
To: 
Cc: Thomas Fourier <fourier.thomas@gmail.com>,
	Marcin Wojtas <marcin.s.wojtas@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	netdev@vger.kernel.org (open list:MARVELL MVPP2 ETHERNET DRIVER),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net] net: mvpp2: fix double free of the replaced rule in  mvpp2_ethtool_cls_rule_ins()
Date: Wed,  4 Nov 2026 13:02:23 +0100
Message-ID: <20261104120225.28377-2-fourier.thomas@gmail.com>
X-Mailer: git-send-email 2.53.0
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

When a rule already exists at the requested location,
mvpp2_ethtool_cls_rule_ins() removes it from the hardware and frees it,
but leaves port->rfs_rules[loc] pointing at the freed structure. If
inserting the new rule then fails, the next rule insertion will free the
rule once again.

Clear the slot as soon as the old rule has been freed.

This bug was statically found and theoretical. Compile tested only.

Signed-off-by: Thomas Fourier <fourier.thomas@gmail.com>
Fixes: 90b509b39ac9 ("net: mvpp2: cls: Add Classification offload support")
---
 drivers/net/ethernet/marvell/mvpp2/mvpp2_cls.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/marvell/mvpp2/mvpp2_cls.c b/drivers/net/ethernet/marvell/mvpp2/mvpp2_cls.c
index 80d15d7a5ec3..8ec94387cb57 100644
--- a/drivers/net/ethernet/marvell/mvpp2/mvpp2_cls.c
+++ b/drivers/net/ethernet/marvell/mvpp2/mvpp2_cls.c
@@ -1405,6 +1405,7 @@ int mvpp2_ethtool_cls_rule_ins(struct mvpp2_port *port,
 		if (ret)
 			goto clean_eth_rule;
 		kfree(old_efs);
+		port->rfs_rules[efs->rule.loc] = NULL;
 		port->n_rfs_rules--;
 	}
 
-- 
2.53.0

