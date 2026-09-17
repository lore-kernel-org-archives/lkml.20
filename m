Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84CF44F7CCD
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 16:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789662726; cv=none; b=Xq27U9GUOXr8CnJVjkt0fh4713XEMgiLg1Q1GLSbCoporwD+agIfbhnYsf4F7m9naSkQphWfrh8ge9KFOuV1m6z1Z99qMZHINDwtP8o4k1DI/PUh88t5MAEs3cirBWFZPwHigvUcET+y2pzEHGpRrlQtjRkPBsQJqRJKLkM3KtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789662726; c=relaxed/simple;
	bh=AtaDzf3UImxWy0A6KTITx5FzTXa7Y5TeCqtDnbYgS3c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=kFIgghnjcob48xo+aEcIOl2an4jaEnBwfvDSHWBIzG9KCYuex1NHAYXo/YBggkA51AWSa1FP3tUUbbtElArXUivetrLrvFIQJK1tv9b13MxsDgL9AfiupRfPoBnTpOCCvo4uYrqwT3Y1CYDdoKAWU7AlcKVIzM2OH2iBBsSOh/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=a9RkWFsS; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="a9RkWFsS"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49d1ca5b0d6so7822355e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 09:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1789662723; x=1790267523; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Os5r6Ci6BDN5PRIg9YmrRBQTuU5253UEvxdJayQcudc=;
        b=a9RkWFsSPGKnf+96DhVS+6CtSoe/ZL4kU7zdOYGwTh7d8jM5/wlAA9r74EJA7isMEB
         qNaT9NAHFuLBcTT+wsFAQMjo2shXd194dxxUyyR+c4Dqx6ELunN9eKGlFCdmpLw4S7tT
         vK69ST6lGZ0wzlo6KO6ESFJMKyKubl0ZZzU14=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789662723; x=1790267523;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Os5r6Ci6BDN5PRIg9YmrRBQTuU5253UEvxdJayQcudc=;
        b=b32O1c/UX3gISevcHTgDOtKqn4gYjnNO5vqCcdX+XqazlY0b+XBDtMfD/cAmd8f9e0
         0fHDi3fj3kCxXLphLP8MWB2rPtpApv8a4CswNINaBR+Gk1/mdgeIepfQUQ/jvFuO0cmK
         OzHCL4WsGFhi7yYUHKaV1RYFK+2QSkbYljv27UxHmuCUe++DSXED1PDPUhtaJV+Lhu+6
         Rx42qw4xlDgSf8vEkUb3sbvvfXJSx4G2vwYYzHAELzRrRWqQd53n5jQE+q0hq53tuKlO
         t9yyS8utlQICdGhgN9fBPUU1t5ue/fnSOfmtBK5zU5Nsf7c0FUXHMtrZFF/DuFGy19Gx
         rCsw==
X-Gm-Message-State: AFuF++kmb0RrOk4mVIwXoSzSLHdnW2sBNgz1HlDflVVjsmaCU2sgRHfL
	iBb7qv3pycVlgKR9T8+S9ty76TOGVIKuFqW7/KylZGHJYIJ1hjxXtV2K35jp0s0jT5jbFb6T1Rm
	712t+
X-Gm-Gg: AYBFou2TbkaehNlKUlxy3sYiY6kAOC4PPVZSynVQ1lOfmBX06UhwEY8+sb77t+dlHO7
	jLbFMdyfzX/cOPLqhIMFvOot6nTvViNLsYCsqqEKZ8FmZKRmhQt34VjIJLaJ2/BEeOZNAr6w4Bw
	ut2f4PZBqGb6+r+ZwqIB6bla/gWq8G0+rkR1Ovo5zQYarS6PKkbPkuqcpJzsLSuPwyWeN3nsy/1
	SMOhN9PUHGJABIGwI/o0KE9yZulfMfbPk7muqNXwoMpMJw5qjUOCLYvJ6nv5JT1tgPo7wx55KJ2
	TaGf0bTSGChtDzbgTPm9OD0dVJfhutIRfNGIEynQLJUB+b0HMaYDmxTnCWaNKT1/ZGoJT2NPSu2
	J6YXyIuRbElUhaVftYrujMhPnXIY+WoZnnomOmBm+mbyc6+Z41a2aFWm4agjkWji4MzF6T1RrgA
	ekbPmqhpiTpMqApLgL7a5JEGtUagZtirxGQ7GA+X89O0uQjnzq+LO+jjRuCi6Wk6JHaEvl/W+s+
	6d9GArBEwe1SqN1iK8IdxKSoE0=
X-Received: by 2002:a05:600d:4452:10b0:49f:c432:2e50 with SMTP id 5b1f17b1804b1-49fc4322e6emr3263095e9.25.1789662722658;
        Thu, 17 Sep 2026 09:32:02 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf418dcsm16842652f8f.35.2026.09.17.09.32.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 09:32:02 -0700 (PDT)
From: Petko Manolov <petko.manolov@konsulko.com>
To: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dinguyen@kernel.org,
	arnemaximilian.richter@draeger.com,
	martynas.grybauskas@draeger.com,
	Petko Manolov <petko.manolov@konsulko.com>
Subject: [PATCH v6 0/3] arm: dts: altera: add Draeger M48 CPU Module
Date: Thu, 17 Sep 2026 19:31:53 +0300
Message-ID: <20260917163157.1380860-1-petko.manolov@konsulko.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Adding the device trees for “Dräger M48 on NXP i.MX6 (Q) and Intel/Altera
SoCFPGA Cyclone V” board variant.  It has both (the SoC and FPGA) on the same
carrier and they are cross-monitoring each other.

This is the SoCFPGA devicetree part.

Petko Manolov (3):
  dt-bindings: vendor-prefixes: add Draeger AG
  dt-bindings: arm: altera: add Draeger M48 Module
  arm: dts: altera: add Draeger M48 CPU Module

 .../devicetree/bindings/arm/altera.yaml       |   1 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm/boot/dts/intel/socfpga/Makefile      |   1 +
 .../socfpga/socfpga_cyclone5_draeger_m48.dts  | 123 ++++++++++++++++++
 4 files changed, 127 insertions(+)
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_draeger_m48.dts

-- 
2.47.3

