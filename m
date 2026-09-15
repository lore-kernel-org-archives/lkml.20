Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C92043C870E
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 13:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789479495; cv=none; b=atogJmShytXREXnscG0u/OP5AuWIs26DB+KbPCQbyCKD/+EMz78qay1JHfqMOWrJY8NU5rLrwar79g25NSoWXRHSV2QXYAJ4UNfZt7xptQj6RntLCbhY1/o2z6Pkfx1fGwweTeVFYXk5riaxZToutEnG+yy2UWdt0RVhIGpCk70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789479495; c=relaxed/simple;
	bh=AtaDzf3UImxWy0A6KTITx5FzTXa7Y5TeCqtDnbYgS3c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=t05bWZc/wCYKKpCZ95bp3vDszH6TG4R+kqTCGwsUTA4/IKOenMG1qBpbJKb/vMZQEPxuDj48bllassTpqUoEAOyKHmcZ1fnYOE7rE9Rt3d0tzRBiu/6c8vLLe9Ab3KUURivgZ04tjm4hcRw8yYrDFHSEcM00sw8wnWZZBpeLj9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=LQsSMwsC; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="LQsSMwsC"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b965f447cso26378385e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 06:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1789479492; x=1790084292; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Os5r6Ci6BDN5PRIg9YmrRBQTuU5253UEvxdJayQcudc=;
        b=LQsSMwsC13eMjlLlvYHMbBw0i5aoRktHLmnkjcHa9LIOWNZcQ916L+Qe0zTFpTum7t
         rKzuX7c8fpWSLD3tPvKo9opDVnoNfxWCwxI6KkCbI+EDfk6UR5P0fXzymYD6Xwx5yew+
         Od6Bjiet7Oc7ATgzY/bgYWPFE00bwJp/bXMwg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789479492; x=1790084292;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Os5r6Ci6BDN5PRIg9YmrRBQTuU5253UEvxdJayQcudc=;
        b=CidQzqGED0nU8iiQMgjCOcI/KXUad35w02H8xLpnhOniB4nRDL/d22YvxEVV3ete1f
         qcfjGHpy75XdHrZIpY4N9nK47YqHyhSj4YczMxDoTODHClk+efIqByzZwHYPKdR3M7CR
         6vrmcksc8TxWwO23QDLTZ87+uistDXqhO+t66Mr6qZaNpbSXa1K3+ZRJeQ7/QSkEshO5
         ASmcHL451x6+V2qgPKxnBGZrQ0efY/CtPG+660Ra4Eueh36y8vAHDaVV116+JFni0DaY
         JBRWbfRKQPBn4ni/62pmj83Bg5iuoYV260S6kBXnBYYyxPX6UnrKvd+hmL4SOGPXD3Pi
         pdPA==
X-Gm-Message-State: AFuF++l6RWqFVzP9K/k/7cburyJXFc9ImCyAy95ww86t37ObcoKukm6k
	1dmJGNaTAPNE93OzpEZo8SQ82rYoga3EAMIsGfCBwlph2fnQEIX324OTw9Ko8ZbTvV29TxJJh8L
	lkMoI
X-Gm-Gg: AYBFou3FUbgd2kcSj4W4+DfUxG7RQCJzkGaxEXZg0LO1p+KvjoOcFpejtEGy3ywxDF9
	CWTcH4P9Z+y0PmELgeJXuwLhUOWgyQzIEWF6nmRdZEZbf3BfvDQQNqvBGbYenwimP+v4Jve7cVU
	quljUgvYeBmXDEL0MdIJeLumMntmhzG3w3DxweuQYGV5oWN4g5aSZVNuLwaCCTJZ2PO5aP8ouRy
	E97cQdIVAIY85vzJLiA/6VWxHK2DPzZnp/ji3NFE6/y31aYk0kyr/G1KzO0JUS8bOxJit5SVS/y
	COXzkV+tZIPukAFkA5OXZDprhoT5iANSkRoJYNDiLSizuKkGePeBD9fZq6VuyModwk4hbYQggIO
	fUZPzfyvIgYXJgiZSXRO5/iE2IB/7wyYI9kY+7ePLUAZJ/I1d9DxF9ePUJ74+xxhLUvzFq/AMes
	njXaoPsSFUYRuROaFrbzO7FrDN0eDzc7rsh1eU3zOYOR7CbQezHb1nKP14fNbnWG7nVpzmh4azB
	cNPlNhbnKk3T/PF
X-Received: by 2002:a05:600d:3:b0:49c:cee2:a508 with SMTP id 5b1f17b1804b1-49e7a66b64bmr74231585e9.16.1789479491796;
        Tue, 15 Sep 2026 06:38:11 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7d6bf4desm88186235e9.15.2026.09.15.06.38.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 06:38:11 -0700 (PDT)
From: Petko Manolov <petko.manolov@konsulko.com>
To: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dinguyen@kernel.org,
	Petko Manolov <petko.manolov@konsulko.com>
Subject: [PATCH v5 0/3] arm: dts: altera: add Draeger M48 CPU Module
Date: Tue, 15 Sep 2026 16:38:01 +0300
Message-ID: <20260915133805.3249587-1-petko.manolov@konsulko.com>
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

