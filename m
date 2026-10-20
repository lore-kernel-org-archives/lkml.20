Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792456534;
	b=KHQ76rRKVr1iveGA2HBDeLayqu2RAJoan6smBn6xwvGnrNFcbRlFui7QPYayYBHE+8hW
	 kEdORDBnI5nJt9xkXekz6Xn2UF7/dHlgFH7xwy2TWsvgNquecAmV4R/GRUEhg4JDhtMn1
	 biuoQ0ksx9keUT+z37dt95Pn6xpO28E2XVud9kLAI4eEfBScy0pjDSGPrpv6amjhr/1nV
	 zy5deIDP6m3cgnpuJYHGx/lH1TFjbiXrWYDQX/4Mi4fSpbga5vQSy5gbVHoqCpKZpk/OU
	 Hr4pgAg3wsW6MmZ7mM8v0uoJOK2K0Y9TaRTP/3ApDfeDf/soiVdDb8ONw4E/LouHWdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792456534;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=yipExmIrTD12/1N9UAm4uOC0Smz6xuSmoLIiL1iv6ME=;
	b=iFVxIIjr4VWRkQYzTtQKVN6Av8vjbLAjSOClZ9VRMjkliLAs1/5x3x3dY6dQSbM1+Ehv
	 R8gsISs4SduziVOdk7OWp6a0amw94zK1mqP0gN9t1dgykccCzPvuqHwXYR79IZ3/3Tizb
	 4TJzWfWY8dzN2M8q9Fmy2HKmMSuAvgdzjrX0+RHyPHTGICDIa37qysh0NbzveNQknJEd5
	 5wr+zzjwHkkCbXKORo8Uzh7TuTEYi06E/8CJqC6CNj5ZNvWKbvo95/Pz5iDKhst6SmWs5
	 qFjQ2eF5h2jTH/3cEYBNhD2CM8XRt7VPFGSjueLYhpUeW0PndDDInffFMGeKmjtt/7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=jclark.com;
	spf=pass smtp.mailfrom=jclark.com;
	dkim=pass header.d=jclark-com.20251104.gappssmtp.com header.i=@jclark-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=AzHXSm+Q;
	arc=none smtp.remote-ip=209.85.214.179
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A02F606A323
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 00:35:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A02F606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jclark.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jclark.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=jclark-com.20251104.gappssmtp.com header.i=@jclark-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=AzHXSm+Q
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2e987a2ba0cso22104605ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 17:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jclark-com.20251104.gappssmtp.com; s=20251104; t=1792456533; x=1793061333; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yipExmIrTD12/1N9UAm4uOC0Smz6xuSmoLIiL1iv6ME=;
        b=AzHXSm+Q8Fe894xwcN/n2nwtglUvPzzk12UXp5P6sOG2XezLYcUXtlP8iA8ljA+frg
         YTMa65772oOUDpIBljZ8n48K/WGe27YyCQZSU8rKT56T4C+uT2XJDwIgtKCuk9hiaMB9
         xIRFPyBms5dVRg6O+ojjCke3ra1wWNDHvoKRMsgCwPo3UMNHvKpa/3leT6kZSXAwpghS
         3/MMb/0eUMFi32M8UOOGfPpoJBosc74XePAsoxzjLBbsTNrahLtJW7lRPMM/LZYwALau
         1jZzA4rLrpHXgrt4Ht9HQOdni98Pjo4EXa63PjnVK2USa6n3XuMwBhg4Vm0dLGrrUsbX
         c2jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792456533; x=1793061333;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yipExmIrTD12/1N9UAm4uOC0Smz6xuSmoLIiL1iv6ME=;
        b=sCuiKVT9Pw0DffuQNBdg1VeaWbJ+eZp0A6w5eTKQougjvvOtEqbH+lYkMyxaR4oOy+
         SWAfdWJeRqMZxpdYuYkip7A6oBTiUyJ230J+jaiwrBGkLSBY04iUAZmO9MBoJ2I1+tv1
         0gTqtECvWX75T+wAwyF6gfk3YO+Ec3rXQVEFvHqsnDLqfcrQfyavgkGzVpZHa39TcPuY
         OFCFRwHEe7Bi9/ktsf7NVKg7M46nR29r82fQU0HdbhI1mCMuyjHJ8EUxPVTfkc+ilpg2
         c31WwC2jiOMPf6mSKcqNtrnQyAWSlCpSFwA7ra27RvvjuQ+t0T+rQyDcGf2sXanIYI9f
         KjZw==
X-Forwarded-Encrypted: i=1; AKwUvBz6PgdqYRpAwewz82+40Z6KM9JfdgJDCCw0An+cKPJ6DwBUw4WHeuLU6qqWABnTiDjFGq/Xhjv1svHvzHQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJz8YWXjWoGkg7zF1NI/NoTQ/RWsC7ZOx5pGvNxAMRbBXejQdBa
	85NRQ3D/OD9Zsx0RDc7vHxdEFCnQfL4HnEmSEzo3Z41T6gS9FTlnR4Rvs3Ie7l8PbA==
X-Gm-Gg: AYBFou019L6p5M+lbHMfXJVlpzWeX/wfwORNgepwphzmyEKWeC2EhkUa3QOPmEgqSrh
	qb5o3S0Lihwc1CaNcORQcd7+kSsmqWFUIftXOkVNmC5/dVwhxfSLbB5mU5JTljIyLD9LcBLO4RG
	EoyR9YkhE4AyEaH+8MEuGHVLvDRpDMTT28CsCadsk5DTGe6pqEebzVaYnu4bxA7lcM42Oppc6wP
	qroQwwnpJa9A4/ax/OYfTp4b8439pgAo6ocpVBlsxKOB48nmhsDLkky7vQ6fe+dsD/170RykN7C
	0/kZlHGIEdjhuBx2u/zftAKPn5fuzQphqyDfrA7Gxzh7/vfbLQ3IkdGHYQwXaEuGarrlGxtMdae
	e7IoUy2I49DzrCVAP8rrAVaaUcE3qC0/y3uwGFPajlnbds8im4TTPi5FMPD9z2k2TXqfEFJf3aE
	qqoJ+O4H+YIp3KRDt2ky7jNFIxPbQG5TegiTdzWqCYV24NyP3HuOJ6komcconVDsBysIoAamHbk
	EtvsiZqnSRuFmrZFMF/VPLsc036RY8rfQi5DYLAhvn6G0H+46JXhS1FO6WXB9c=
X-Received: by 2002:a17:902:ceca:b0:2e4:4eed:5cc5 with SMTP id d9443c01a7336-2e9a6c1df91mr80141435ad.38.1792456531600;
        Mon, 19 Oct 2026 17:35:31 -0700 (PDT)
Received: from cantal.lan ([58.136.73.153])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea14caa857sm6836175ad.12.2026.10.19.17.35.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 17:35:31 -0700 (PDT)
From: James Clark <jjc@jclark.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Richard Cochran <richardcochran@gmail.com>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Kory Maincent <kory.maincent@bootlin.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Chintan Vankar <c-vankar@ti.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net] net: ethernet: ti: am65-cpts: fix support for PTP_EXTTS_REQUEST2 ioctl
Date: Tue, 20 Oct 2026 07:35:25 +0700
Message-ID: <20261020003525.1237742-1-jjc@jclark.com>
X-Mailer: git-send-email 2.56.0
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

Commit 7c571ac57d9d ("net: ptp: introduce .supported_extts_flags to
ptp_clock_info") modified the PTP core to validate the supported flags
of external timestamp requests, rather than relying on each driver to
check them.

am65_cpts_extts_enable() ignores the flags, and am65-cpts was not given
any .supported_extts_flags. Since PTP_EXTTS_REQUEST2 always implies
PTP_STRICT_FLAGS, the core now rejects every PTP_EXTTS_REQUEST2 for this
driver with -EOPNOTSUPP, where before that commit the same requests
succeeded. Only the PTP_EXTTS_REQUEST ioctl still works.

Tests on a BeagleY-AI (J722S) show that the CPTS hardware timestamp push
inputs timestamp just the rising edge. Encode this in
.supported_extts_flags. A PTP_EXTTS_REQUEST2 for the rising edge then
succeeds, and one for the falling edge or for both edges fails with
-EOPNOTSUPP.

Fixes: 7c571ac57d9d ("net: ptp: introduce .supported_extts_flags to ptp_clock_info")
Signed-off-by: James Clark <jjc@jclark.com>
---
 drivers/net/ethernet/ti/am65-cpts.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/ti/am65-cpts.c b/drivers/net/ethernet/ti/am65-cpts.c
index efbf2ef976a..df5659ead72 100644
--- a/drivers/net/ethernet/ti/am65-cpts.c
+++ b/drivers/net/ethernet/ti/am65-cpts.c
@@ -779,6 +779,7 @@ static long am65_cpts_ts_work(struct ptp_clock_info *ptp);
 static struct ptp_clock_info am65_ptp_info = {
 	.owner		= THIS_MODULE,
 	.name		= "CTPS timer",
+	.supported_extts_flags = PTP_RISING_EDGE | PTP_STRICT_FLAGS,
 	.adjfine	= am65_cpts_ptp_adjfine,
 	.adjtime	= am65_cpts_ptp_adjtime,
 	.gettimex64	= am65_cpts_ptp_gettimex,
-- 
2.56.0

