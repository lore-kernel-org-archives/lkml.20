Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794366405;
	b=s98kvlLdUiUdAbFT1/7bT7KmPfgywLO0VMRWPrttxO4zm+Z3lmAP68a6bcLPSIn/wZf6
	 TDT4c16lyvgulGRHDpmP8g09vrIUsCCSPNeTxz/IUByqfgRyLhLGByJwrlD4JBV6+PMKT
	 EYDEXaAlQsarVfKTPbkyjs3l8NsgsgsgjDKPwUQvzp9H3Q4/0GtzN+nCMOWDuQGyzPs8A
	 WEumWT6sh1WcvohleE8JEHLOS6SPm+bHysrOcG/5A1wpJCGBWu0/8+Riv/WF1yziPvN7J
	 4ngQ1P2mjreglX+huyzbWRUJBtbUc5hwqm60lLWv+vs2/a0YDWVec8aHGNizwlacGRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794366405;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=mLhyYGCVTORdd4WihP4IIQfVXI++QSCchObfVqbadWA=;
	b=BoODLXs3ZEYmCYs3QVJcQlB1DsjPKTQZflkcST3HtdXP2J0vz5OEypjDPVX9Nv3K2jXI
	 3itL31abKW/wQsP8osxI6PoSF2lLFYbtTGgxs2Z+S6tryd1HPx6x44fbGndRIWpIb2CDm
	 lK0n41ldkRGAr4M15TTrtkJFSCI6MY5rrp48IQjhC9cduCe4QY7fPvO8T9P+QW3VnhseY
	 HzOPpDQ2oDiJqZjIUslk6noGJjwp8MGJuHsOqbo9HF4l2ZzWjCZIq+gGuUDgurcEYhFCb
	 1HBuFevpjGmT136QyEfMaS18od4ZRtKdlkVBAB7YVMTC/lIUpPPaunf86UZxS3A9wCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W7W0MsWh;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 735AD606A320
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 03:06:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 735AD606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W7W0MsWh
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3b179528d56so437264a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 19:06:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794366404; x=1794971204; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mLhyYGCVTORdd4WihP4IIQfVXI++QSCchObfVqbadWA=;
        b=W7W0MsWhl2pdpNVYjWLOyyPFheedfMFbCq2aybaSoFL5RextMQgVc6pOy/1WqmlFDC
         K0TPARUDnzD3ilY7LHrBTMS+oRCi0LKl1GOYON41ft9nx3sGcLgCr2hfXJLs15eAaBJq
         SWv5ExgvJDJZQJwicIW/PRABJsVsET3o6my4ONLHK3o2KbKrHUkmwIOeYIxp78YSNXqN
         XPjkS5kjqi7LOivq2fbzhJNsBq3wT0SIumqqiIqk3qVDaOCMiji/Zm8lnydN2S+CK4bR
         bF5jRkco1p8NJgeeqW8Ahy6T5OlbhmIJ7n9rMUqvdKqHKozwmPyY7Zgs9QJigdXuRhoP
         4yZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794366404; x=1794971204;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mLhyYGCVTORdd4WihP4IIQfVXI++QSCchObfVqbadWA=;
        b=icLNVxd3K5usCjCKxRJUjuTik4dNB4iV20tkGY0378b9Uav08tyLdmNIVLonagfixP
         JZrw1ESE87wuQhs60nrPAVE/mL0zr4kaZPiL9xtnxAQxLgFuEfHJhh4yy4NPBGC4DKed
         WyGZ/TXEtUX7R4miL67ZjbOd+E0jG7+WjCwj2Msq8ireKAYgcKmF2za4L9Utwv6nPK8y
         cRdaN+ILRStdHA/0bkIe7ukpvCAvvvySUlwGFkjKfd83DHkk1Kbcwmg42A+rNGkUzuBq
         a5hxTfFIOYsufUyI0BeUDsqZcFqblORE0nS1ebNuSvzDoAhhC1E+f6zL7knBoxs1xAGk
         7Lqw==
X-Forwarded-Encrypted: i=1; AL+hErHkXLoEkt+f98SsYlohe1xNtjJ4+ItZaUSd+eucm6PWH0yVaFK4pn9lYXZuHmtCSdLGuS4oxKwq2hREklg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9c2us90ws3JTtRDE+GHt9J23d7ZcpMiEWYqf12ogTcY3w8H4OI
	LQZdjr1ci4TJRDvjG2FP9FVEeGZkekUCgtDNbBv/J4WvjPOKQpSydext
X-Gm-Gg: AYBFou30DlT8i8cxpyDvUX5MQVtol1LUErxs8UTdwaeYj6QZEVwdKGIu3NRnHR8XlrU
	idkaSF0ePnuq97hsNHrDzlTDVqHjK7Z8uUb33SOzugSLpgs6+tTSZ8t5ztJDsd+kQdg+MaHYq7v
	2U3oIetIpVRo5vPDfjI9e/9I4VzwBvZScjn2hUE6oCm/1UZk2nUKxjFlGeuQc8vhz/OYP8sfW33
	r9wLpA4ZgPu/zXluCqHG//QYAtolwpQQLTWgdzLUaHT5Gv6XJRN7uX7KZqe+q8Pc5Ggye2WPPtd
	8P/EobaLIlShLlKoYlyqyQYsyQJGZ0ALPf/O5EoWB842C10ahv+dYP3DBda1pHu+dp6vnP4T6o/
	O904rRPChajLOEVkJUDcEIWGaiHNVHH+R9jjXGN4ncg5LpSAfqjArpN3E4xOEh0A8jJqzIqMFps
	xfrg8lykppOl83eFcHHEj9pbS/Qxx9zZw0XltJY1suf9vcB10A0jU2xLl5eOvMgcnhgTXAN0lt0
	0mXnGLZ1Mhp3MWhwtdK4gpNBmBvxqogZhd1E7aY49IQYnfgvaTEj9Bysf8zrn3allBwt7NFgE7A
	ghonMsqQMUjfEYBzC2YQgI90kHT2W3wfzb2MyeOXWw==
X-Received: by 2002:a17:90b:2584:b0:3ac:ffb8:1809 with SMTP id 98e67ed59e1d1-3b182f3eec3mr934352a91.39.1794366403744;
        Tue, 10 Nov 2026 19:06:43 -0800 (PST)
Received: from localhost.localdomain ([183.62.176.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b181f9873csm667757a91.1.2026.11.10.19.06.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 19:06:43 -0800 (PST)
From: yong liu <pkfxxxing@gmail.com>
To: "Martin K. Petersen" <mkp@kernel.org>
Cc: linux-scsi@vger.kernel.org,
	target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	security@kernel.org
Subject: [PATCH v2] scsi: target: Disable protection processing for zero-block commands
Date: Wed, 11 Nov 2026 11:05:43 +0800
Message-ID: <20261111030544.1216434-1-pkfxxxing@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261109092744.822646-2-pkfxxxing@gmail.com>
References: <20261109092744.822646-1-pkfxxxing@gmail.com> <20261109092744.822646-2-pkfxxxing@gmail.com>
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

A READ(10) with its TRANSFER LENGTH field set to zero on a PI-enabled
LUN can select TARGET_PROT_DIN_STRIP while leaving cmd->prot_length at
zero. transport_generic_new_cmd() then allocates an empty protection
scatterlist, causing a target-side Oops, which can also lead to
use-after-free during subsequent iSCSI connection cleanup. A logged-in
iSCSI initiator can trigger this on a FILEIO LUN with protection
information enabled.

After validating PROTECT, reset the protection operation, type and
checks for zero-block commands in sbc_check_prot(). This avoids the
empty allocation and prevents backends and fabrics from selecting PI
processing without a protection payload. Preserve the existing
data-length adjustment for commands carrying PI over the wire.

The issue was discovered and fixed by Qihoo 360's Tulongfeng multi-agent
system.

Fixes: 5835812f13e5 ("target: ensure se_cmd->t_prot_sg is allocated when required")
Cc: stable@vger.kernel.org
Signed-off-by: yong liu <pkfxxxing@gmail.com>
---
Changes in v2 (addressing sashiko-bot's protection-state review):
- Replace the allocation-only guard with a zero-block protection state fix
  in sbc_check_prot(), so backends and fabrics do not select PI processing
  without a protection payload.
- Preserve PROTECT validation and the existing data-length adjustment.

Developed against f66469d9905b39d2c260a15d7d6db450f4db67c1 (7.4-rc1).

 drivers/target/target_core_sbc.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/target/target_core_sbc.c b/drivers/target/target_core_sbc.c
index 21f5cb86d7..560e62cef7 100644
--- a/drivers/target/target_core_sbc.c
+++ b/drivers/target/target_core_sbc.c
@@ -721,6 +721,12 @@ sbc_check_prot(struct se_device *dev, struct se_cmd *cmd, unsigned char protect,
 	if (sbc_set_prot_op_checks(protect, fabric_prot, pi_prot_type, is_write, cmd))
 		return TCM_INVALID_CDB_FIELD;
 
+	if (!sectors) {
+		cmd->prot_op = TARGET_PROT_NORMAL;
+		cmd->prot_checks = 0;
+		pi_prot_type = TARGET_DIF_TYPE0_PROT;
+	}
+
 	cmd->prot_type = pi_prot_type;
 	cmd->prot_length = dev->prot_length * sectors;
 
-- 
2.43.0

