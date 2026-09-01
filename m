Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B47A3DCDAC
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 02:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788230009; cv=none; b=nmFLX8AAhZPccbzis3+3mB4vczOjEBruc+gcQeXYSqppAAJ3OqNSAxGjrzBg6eb0JoFWM60BczM+YZTt1YPeYaz30Awd6El+MYzzYl7u2O607VL+9dthdHVcUJP73rhXe43jiQ8kuuKB/LKgtO867YqEN8+Zuhe3/O7goqnwBvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788230009; c=relaxed/simple;
	bh=xzNUE0g2RNOAbTc+miqaYUEcLeyNwtRt9Y4owm+vRG8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Ow3nS+uZ+CCV1m0nJfiNyrtzQGbnuNFppxCWtK2inKFh8lTJba9HhDP7Jbl3hOqVbe0PXbLXbn41WNOqHLoYABDmYQOMNRwgx6iw0InuyA6ctV1RSh5EbBzpyCJC2HunwnheJziR5j+6bk8Z//yGlu3J1aEbejb4ajSfK8pJ970=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=synaptics.corp-partner.google.com; spf=pass smtp.mailfrom=synaptics.corp-partner.google.com; dkim=pass (2048-bit key) header.d=synaptics-corp-partner-google-com.20251104.gappssmtp.com header.i=@synaptics-corp-partner-google-com.20251104.gappssmtp.com header.b=Lla81i4+; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=synaptics.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synaptics.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synaptics-corp-partner-google-com.20251104.gappssmtp.com header.i=@synaptics-corp-partner-google-com.20251104.gappssmtp.com header.b="Lla81i4+"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-851cbd64814so2075312b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 19:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=synaptics-corp-partner-google-com.20251104.gappssmtp.com; s=20251104; t=1788230007; x=1788834807; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gChFCRqPTxG6qAlhVmq1u3HWUgs8rr2muPIizuvzUM0=;
        b=Lla81i4+g5yHvkaxNNtSY6n8Bx6uvQCOH9AS7HTiZcuMtc8ZWw8H0OcP+QSbZ/ra4E
         pBO92t2J85goHbrPXmpN8JKeIbIdzlRDFpniX0KRCEgMNGGt6pEyukO7SQpTSlhtxbky
         UCOvEIOkfRVLytnMrNMveAWtNQhRy30/Z4qEE7r1Rf7JZwh5kD9GpozI4ccp1gDelwdh
         KonEg45GUN9IrLd3nsgiMkJ/t0f/98POiMdVDuDAWIQQ33EehKmcW0lIQGlTHEENO0uL
         CAffW90wj7sk7NFxmE0smC34ExHPe1hk7Lq//SlgfkX/EvwQQkBn4/Tahkfu4oOlgC5A
         tW3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788230007; x=1788834807;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gChFCRqPTxG6qAlhVmq1u3HWUgs8rr2muPIizuvzUM0=;
        b=BKDSfC4bEKcZH/qa4Q4BZGE6EtlvSG23wou/GAwcYGuyEAfvzxtraci4C8TfrMerL+
         qBTCAlo/7+byUdA0Ujwp7H3IT+BBIHWJiLapVeXG9jDP5awvuM4+Iw5uRba8r25h0ptL
         tMrP3v2Xy+I366R1T/W1Q9Pn6oEd2Nf2S8DYdzkRsiqyyPFemL8KUFMlKUQ8Zo3yPdfg
         tFfd6Z+a2QMF6/QFY0x2Oa/eAdF2C5mo8Bx57Ih+mAXkEFFwiqbMpfcpCgBYuRogUGxs
         ZHrqmqCp0lEVPHvXRWhlHlqVz3SJcXhN6ghjzbtQO+9UF7MNMVEmt/EHlW+FmthMitFK
         k+ww==
X-Forwarded-Encrypted: i=1; AHgh+Rq6Amb545qIU4PrsE8N7sl9kl2C6shRmSaU8c3dzjJmsBqGDx90/H5pXRD3SKD5BMjCMgL5pw6g7rpzcMs=@vger.kernel.org
X-Gm-Message-State: AFuF++kq1JTArKO08dAwUmORi2PtQMVwAEg8NYX3jjD1aFZyU/DTiXyi
	Q0837iPUGnGDpnFYNSJYH2wiytnmhLYyDR3J7phmnxQN+2BRX2/UHOnx6M99DyOPxfk=
X-Gm-Gg: AR+sD13X8tiTGPR7kJL3Wt8zNrsk8O/DMavjw0z5k4SaDPS5bRBNGi5LhXXxmz/3crq
	6ayUTDsYAI/m1IfImmY5FKddBTCujCznvolZAeerQ6ZpNuL++qhFqdPaiJqs4nmjKe+ABF3jZ0V
	0dyHNJSSm0pTXpo7BOIJyyJo9h5zC7fJxH+4YMSX0DwlUBb5r61eXpFlht/WFHPRgLc6pXANMaM
	359Tmi2qcpOVDpxrDoBllA4Ic4HzXHFs5HTui+T+tIMN/fcIab5AHek0tnDmWvK8AnqfE6ihgkp
	vz8f/nvy/wghs4qBmvI35GegYsu9NmCuzxwjQa3lsLr0BF+XDlVdEFJERiXmaJZfg2nz3fEheyn
	I4kwqZ+Scz6bGi3aiZ68R972UBsK5oWwK375hPTSiOvBlt4UlNP+9LawsiBg+vNrjKKqBMyuqoR
	MzEidOl+ZUK1FHJ9d6yPBEfqpyMm3vIdQAaEsaHIEMIL7i6x91o3ZULfwJByCGnPo6QyWwDB3w1
	EmWjl7lu4OZXNIP4D0Q9fTgW/xuz7OAuiI+GMl/LMswhjvC6qtJLKuKcA/IjU0pNl8vm1HdttlN
	PjpzRg==
X-Received: by 2002:a05:6a21:4d8e:b0:3d3:ad3c:49a9 with SMTP id adf61e73a8af0-3d3ad3c6441mr37600042637.23.1788230007459;
        Mon, 31 Aug 2026 19:33:27 -0700 (PDT)
Received: from bt-tpe-server.synaptics-inc.local (59-124-75-166.hinet-ip.hinet.net. [59.124.75.166])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc1f3312270sm5005565a12.11.2026.08.31.19.33.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 19:33:26 -0700 (PDT)
From: Andy Chang <andy.chang@synaptics.corp-partner.google.com>
To: linux-bluetooth@vger.kernel.org,
	Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>,
	linux-kernel@vger.kernel.org,
	Andy Chang <andy.chang@synaptics.corp-partner.google.com>
Subject: [PATCH v2 0/2] Add support for the Synaptics BCM4384 Bluetooth controller
Date: Tue,  1 Sep 2026 10:32:58 +0800
Message-Id: <20260901023300.1382808-1-andy.chang@synaptics.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260827110242.1203546-2-andy.chang@synaptics.corp-partner.google.com>
References: <20260827110242.1203546-2-andy.chang@synaptics.corp-partner.google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The first patch adds the BCM4384 Device Tree compatible string.

The second patch adds the controller support to the Broadcom
Bluetooth driver

Changes in v2:
 - Patch 1: Added an explanation for why a fallback compatible is not
   suitable.

Andy Chang (2):
  Bluetooth: dt-bindings: net: bluetooth: add BCM4384
  Bluetooth: btbcm: Add Synaptics 4384 chip support

 .../devicetree/bindings/net/bluetooth/brcm,bluetooth.yaml   | 1 +
 drivers/bluetooth/btbcm.c                                   | 6 +++++-
 drivers/bluetooth/hci_bcm.c                                 | 1 +
 3 files changed, 7 insertions(+), 1 deletion(-)

-- 
2.25.1

