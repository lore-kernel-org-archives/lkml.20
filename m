Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1387F476043
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 08:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788253046; cv=none; b=OENENousfRt6XuLrbywm6J0Qp51yDtOmqChZl/yBaByx21a5wL3lBFvyJ/8vRJEy4jXI5jgTIOTTqiFZtPd2BfWlFaGYW9OcspC8xjqmMagskwAvyWwWu2B3oQ0PzfO7qE03Y04tkSamlGTOfhocQ24zhymnSNb/HrCM6s5Y6HU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788253046; c=relaxed/simple;
	bh=5EN9gj1NuJxJzKBR19pdp2IOB3VptHKZV61+tHNfah0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DD3mckUz2ckYFW9MBpuyXsNw/Gwz2VmL3vP4aCvTXDCt23udgfP4ykU/jKfdHH9Q9VIraUPh5VVFY9TCF3AfCfvDznZve/5W+/aPvv3QL/RvQwpIcouMgX4/019dgVHRhxHk8Ppm3VfuJD3pJHVr2QqayuFlHLDYzJF1PIwVM5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=synaptics.corp-partner.google.com; spf=pass smtp.mailfrom=synaptics.corp-partner.google.com; dkim=pass (2048-bit key) header.d=synaptics-corp-partner-google-com.20251104.gappssmtp.com header.i=@synaptics-corp-partner-google-com.20251104.gappssmtp.com header.b=G14ku1Yf; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=synaptics.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synaptics.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synaptics-corp-partner-google-com.20251104.gappssmtp.com header.i=@synaptics-corp-partner-google-com.20251104.gappssmtp.com header.b="G14ku1Yf"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cbe827e3cb4so4898488a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 01:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=synaptics-corp-partner-google-com.20251104.gappssmtp.com; s=20251104; t=1788253044; x=1788857844; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5xzW0n7QNW4SkJResUk2G1u5HyRDJbdbqCtfNYhy8Ys=;
        b=G14ku1Yf3V9slbi7Vn7zwcbtsjmNoXVWhuSJaR8eJeWqciMo/BCjZZSgGGVSQkFPqk
         zKlnmWsdFmti6YN630HHzMgMYpdQaAcZvWN+fW6ABcLv/qoamp5dQf+Vro+53GBZQkj+
         z/KhEtV+UVwFt4UrOprFJbtjmmLY9Vc2pCl5hCWI7mLGTo7bZoMSbfu4rlA83CH5rcKw
         rFVZKQMdqoxtsVXRTePYXmiaPvyI2A41fGyfGqd8V5NWaqv560td1N9jPhc95cIJQCRE
         2mlAR+AYoFOxRglEzpeRFGZkmjO2PBlQUSgufl6gOqiSegfNzKn//pn+4b9aJwLvJqiB
         TEMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788253044; x=1788857844;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5xzW0n7QNW4SkJResUk2G1u5HyRDJbdbqCtfNYhy8Ys=;
        b=AHK4Lhd+flWeME8BC1nGxoDJd72LQP1vGFCz/AGgQynth+uT9FQP5ebkyG0T8x8bJG
         s+YC7aDMHlhBF5x+b0YqDuO1ZMKXkXD6WNKYFTJG3x0n6CDbOs5ifVD3x/VaWy5lrJYX
         gXkxwNQVdTj50y3UBVbZ0yNfuIgclCGF9yj9bo/sNo21/Gc8q0XltujWjyzQyWedulRI
         U2Bcy0fIQdIjjTsrsXS+3+xYIkWi5iWLo5phJKV9fjHUo++fxqb94tu0iTyluWSadihn
         pDygw5Q/bqOYIrvCs4363VVTAKaBhsDxOjDUx7UCxyM4ZSSJvGJd7gPCU65ZoC54jOra
         IpWw==
X-Forwarded-Encrypted: i=1; AKwUvBw7VXeO5t5+KPzudCU9IEM0z2eHwFtc57OhtDrLp1NyTM48JsVbIN5MBAYJgaBTdyAaGlYv5iLym7kE5ww=@vger.kernel.org
X-Gm-Message-State: AFuF++m3lx+5PcoHfi2aUnUWflaR6/YfAHgTNiNn/D+7JNrxxom83dYU
	TUR/tL4HzIiopadisQwUI1ytpH2E96Q/TVP7eBbAC3sNZ9S2Gzvm/apzJGBAffCPndZ5bFhqdqZ
	8uI9Q
X-Gm-Gg: AYBFou21Xz0sJkYB4KVN60wgjUafMyCeykv6+Ngh4fmfm3E1dweJsRRzMybfaCt/fjE
	saRALmJU/aDqklm7RkTPnuAqlBuj9QFC4FWzXW0+m7m4kJYJc2tav1Ttd0Nezapxr5t1gRoRvnJ
	jzb4eW0jU4bAo17Z558gdTc+PKll5SW1tigzgKtSl963911paIzpPF9gUrjayUBYqnFBcbsi3yu
	LC4kA/hdlKb4e3AldIEx9CZi+XRBy2X6q/o/rA3vvWCYBU6qJrw5ffUcm2zYpUiuUUdYqfCbpNg
	EzqGpD4MurHqZd+zswJDSh9Sfuq/7pKTHPrQusqxzCYY46DfTv8QiBZoaoxJ04FtS/1Bx01psZM
	bmFH+gmtgIpDnn587Uy6rraNnLwXbxSqtXWjTwyxMYAbzQExeHWbZR3+shJ1HHEyj5Ak3k1XoBg
	wSEYR2B7S1NNY3HZ2J6Vl2T/oAcOy8xmBVGbD+3WW5Z8KEdDAGPYtNhgGbkG1CWBlxk9l3yvCkk
	4/GF7er9hEh8e0XfLYUP+FWOFjH1sKskAfA2BRpDnMi6QLBBhNIIRvAIodL1WbkMOZdnIPddJYb
	Ke9ZDg==
X-Received: by 2002:a17:90a:d887:b0:398:b71e:60c1 with SMTP id 98e67ed59e1d1-39907df015amr9550349a91.12.1788253044304;
        Tue, 01 Sep 2026 01:57:24 -0700 (PDT)
Received: from bt-tpe-server.synaptics-inc.local (59-124-75-166.hinet-ip.hinet.net. [59.124.75.166])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990bcf6800sm5934432a91.3.2026.09.01.01.57.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 01:57:23 -0700 (PDT)
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
Subject: [PATCH v3 1/2] Bluetooth: dt-bindings: net: bluetooth: add BCM4384
Date: Tue,  1 Sep 2026 16:57:01 +0800
Message-Id: <20260901085702.1515378-2-andy.chang@synaptics.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260901085702.1515378-1-andy.chang@synaptics.corp-partner.google.com>
References: <20260901023300.1382808-2-andy.chang@synaptics.corp-partner.google.com>
 <20260901085702.1515378-1-andy.chang@synaptics.corp-partner.google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the brcm,bcm4384-bt compatible string to support the
Synaptics BCM4384 Bluetooth controller.

A fallback compatible is not suitable here because the BCM4384
controller requires a dedicated firmware patch file (.hcd) matching
its specific hardware ID and revision.

Falling back to an existing compatible would cause the driver to
request the wrong firmware binary and fail the controller
initialization.

Signed-off-by: Andy Chang <andy.chang@synaptics.corp-partner.google.com>
---
Changes in v3:
 - Fix typo and GitLint failure.

 .../devicetree/bindings/net/bluetooth/brcm,bluetooth.yaml        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/net/bluetooth/brcm,bluetooth.yaml b/Documentation/devicetree/bindings/net/bluetooth/brcm,bluetooth.yaml
index 95501e858e6f..612d21123aaa 100644
--- a/Documentation/devicetree/bindings/net/bluetooth/brcm,bluetooth.yaml
+++ b/Documentation/devicetree/bindings/net/bluetooth/brcm,bluetooth.yaml
@@ -31,6 +31,7 @@ properties:
           - brcm,bcm43540-bt
           - brcm,bcm4335a0
           - brcm,bcm4349-bt
+          - brcm,bcm4384-bt
           - cypress,cyw4373a0-bt
           - infineon,cyw55572-bt
 
-- 
2.25.1

