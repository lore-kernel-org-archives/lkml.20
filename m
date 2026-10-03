Received: from mail-dy2-f19.google.com (mail-dy2-f19.google.com [74.125.229.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F5862E11D2
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 01:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790990840; cv=none; b=GOu5Xwv7+vue3f9Pzp9N76lKFHJRvO8bwp/+iznh/CCIi4LP38DKV2c3AI3Ob3SDx+dG6lw1zp7V2WvkeXiVmjS/P6v7XNTtVnZE4r1VpYaw40kJsD5NDuDl8wYoYlcJ0az7z7XkrTs7b+lQpTnaoqu/DDNkaICRX/0oLo8rGYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790990840; c=relaxed/simple;
	bh=xzGuW9gBVTdyd8yJ5Di7BkVfGMr1p8p6MG98+qrsbh4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ADcDr8KKYEwWmyJiHZ+zLJMy5Rf8SxjgIVuCHtMn9Z8NBR/HipIRnbPzsFDA2IknLhqyJuuEisKdJ5lSEogabyqg+1D71BrnXGWoa1+Q4c6PwSxjU0gf9E5JzAP5LFrpFEdoyy4+62thZgwL46vD77ioMWRXkURH1AauW2+VUu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=ossystems.com.br; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.229.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=ossystems.com.br
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy2-f19.google.com with SMTP id 5a478bee46e88-34d2d25127aso82140eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 18:27:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790990836; x=1791595636;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z/BU06CtUrguuFA4ph2pK8mOWJDR8MrG8VSMsF7a8eg=;
        b=LxpqB0RzUokoehv1XDKmUcveWWnAhlRbX/r1DC/9ZtstqSV796N9MGX4irL4q+7Y05
         eP8EJdZNu8xru3Q8wrw1EGo0KAgqByZKGFoIn9XPJnYh/57huUw2sWaDDhUwZAgMEM7i
         3jnivjsBsAu8HSh+FhAsjOiqdrUfCzBijEnOwDlz1gPbIlVx8+5xnlK3TvJCC+nzzqQm
         9A1AneYiZi0aMY/eBLO0IIEAe7q4VhF9KctxkQN11S5tmJWxoZ3w9SwXfguBwLplY1I3
         mZuQVd1e6V3rHor6bGW2KC2vEaTUkOFhK2Z7F2CnsEyfP40XGxTFv1z1KitJSQ3jMoSs
         5umQ==
X-Forwarded-Encrypted: i=1; AKwUvBz8VgTtqBrHtMoIsatbR6KHFH7z4V1/ulSgOTYAEFSZpVDGiGxAg12vyefK/x7DxIUBYrMj2tTjXgc/h5A=@vger.kernel.org
X-Gm-Message-State: AFq9FYJbmzuW1Mo8DBpABKpxSRrcgmjqiffM+nM48mz+G9M6Rs8BlKzb
	5tIUIP5mK8c5tgvOMkgm6Zo9JMR9eDB4KrXbJP5FE9+/+jgyrNsF+ueh
X-Gm-Gg: AYBFou2hHzvjTTuInGEeEPjx9G5VyD6EJ0rf5iJwgsdOBmPKTzBlJVky+bdbbylMlV+
	w2yWXslmTraCxC5FEQwSwcfjtgSDaVTx3tnm6R64Ur5fE5GzfsUaETwnbiRUSbfO6WXpmHCiJz9
	UgRgbQGjFKzMttQnyDZ88Bh1GhGsn+u0kbXBK6tYKyPcwoI4a7xE+IXX87kp6CqezlfdrqGUOWh
	QBKBg65Z8WQLlJOAImkYYuqFQdFjOcA6D+UoHsww7ipovbqfF6mgg6+CRISMBgNGuvtVpOyWVbD
	8QeyWWmem5NJNRMO5vWgl6BDWKq7oiQ8VDHiZRbSog56sPZZ2N9806P9keraItXHmxq1gOvF+ci
	n7olC9TTUUs0pmx2HCSOZRLBldLhw3NUoAtiy5dAbChYiZWvh3TchhdHjYOYsjhrCXiHY47YXgk
	RzP4GCTc+isWig2uHcAoHKRvne/xdPThFX5oKO9FDHx8IBaaaqI/QBLds2iY06B1yfsySILFIrE
	63u04EtIrzhGixP1P+js1qCtuI2xZ5b1065YTI0VDdEJoy29fhKM1YNWDPSXvUuUJWkCamI7FAB
	Kg3fMP48WvkQKIKbRFCajDZ2Rkkn13JYBQIUMNeTRWdZs06Cj9GPb4E=
X-Received: by 2002:a05:7301:77c4:b0:33b:b0c8:73d2 with SMTP id 5a478bee46e88-34f14f18d51mr4593744eec.3.1790990836120;
        Fri, 02 Oct 2026 18:27:16 -0700 (PDT)
Received: from localhost ([201.89.183.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34f067301b5sm10442242eec.1.2026.10.02.18.27.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 18:27:15 -0700 (PDT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 0/2] Add SID and THS calibration for Allwinner R40
Date: Fri,  2 Oct 2026 22:25:34 -0300
Message-ID: <20261003012534.418820-3-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The R40 thermal sensor node has no calibration data. The THS driver
then keeps the calibration registers at their reset value (0x800), and
the reported temperatures have a chip-dependent offset.

This series adds the R40 SID (eFuse) controller and connects the THS
node to its factory calibration at eFuse offset 0x40.

Patch 1 adds the R40 compatible to the SID binding, with the A64
compatible as fallback. The SID driver needs no change.

Patch 2 adds the SID node to sun8i-r40.dtsi and the nvmem cell for the
THS calibration.

Checked with dt_binding_check, and with dtbs_check on all R40, V40 and
T3 board DTBs. No warnings. Tested on two Boardcon EMA40i (A40i) boards.

Otavio Salvador (2):
  dt-bindings: nvmem: SID: Add binding for R40 SID controller
  ARM: dts: sun8i-r40: Add SID node and THS calibration

 .../bindings/nvmem/allwinner,sun4i-a10-sid.yaml   |  1 +
 arch/arm/boot/dts/allwinner/sun8i-r40.dtsi        | 15 ++++++++++++++-
 2 files changed, 15 insertions(+), 1 deletion(-)


base-commit: ff47652a4b66c067c765a7ad464d930b5a9367cc
-- 
2.55.0

