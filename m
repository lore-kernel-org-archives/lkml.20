Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACA5530E821
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 13:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788527367; cv=none; b=UaFimDoz9PDs3O6tjPmzIBOrt02vS5T5ZKETZSjRI39ILY1qPA+FGYedPtMccM/Z7OCW1FdSm7h7ydUbU8ZlPIL0YfYKb0vTTmey2pyNPeHMgZkLo6XcaHbL6eh4qqebwiY15MaOF66wMJSm4lyf3t0DZ9LdZ1xm7pMUvGRRdOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788527367; c=relaxed/simple;
	bh=DXP7b9aeuGMlpb6EbUoiOrTeOWhkU0hKUHsr29rOjmk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HZ9R9JAnD2Pz/swit+YZUn33O9KhH5JA444GKZzBkHJtJg+e0lsf/AOuRPcd5flygTHOrUqAtIeDqd5BsfLTFdHOOljytu0i0MeAteubWTVCyNa6MRKRKXpeFlxQKL/cL0igGeNDbNbBIu0vzKT4QMk9LSWh7ggLssnvYQHA3ZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hqXlPFuS; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hqXlPFuS"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4994d41ceb9so766175e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 06:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788527364; x=1789132164; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t7o7pGTYJ1j9htjyKompyXPu5oGlEszk3L/eQl+FLhg=;
        b=hqXlPFuS6+NM7baHIqPdcb0pkKcP+P2FnxBeR0g0W6w+WA/iLZLKzDj+azJxR9j8Gs
         /W/eAjmGoAqL8loW5TAdoaEX2r0cOUHJhqSTAd6Adc1bQY9ymlFUOSg6uQGBJ7UDkWYp
         Y9B3R82NM9mG+M9OIuYUEmOjrZKcbf5TyvNEcCBm844eiOor0zw7r3SFfXIdSudANmrW
         j5h0LOrL/YHtWXhUom/MxRPAavMv2DENc295FOXn1aU06C6vkSIY08/jOPDBUZI/iS+p
         PrhXuoumdmp5aZw2ZC9WF/4wCDXXAO/UPtO7VW9/7rWFxuEa96jkGlr8EzXfqupet/kM
         YPvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788527364; x=1789132164;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=t7o7pGTYJ1j9htjyKompyXPu5oGlEszk3L/eQl+FLhg=;
        b=QVLYL3aeSpq56wOJZmz9P1+giwcPLeWEDGI7cUGoCAhUV7HW5PFg+y1Ig1v483OCGB
         V38I/JZ1DfZwxMgQxc0/39mcNWvyAsJAA/HWk4KhfQUap5Pq2z0eFTbEAVeHz6OF12DR
         bRviVJMrhmzVn+tPXlgN4yVEl5yeOt/mxvaAm6lUJ0BsglCUMRmiX+i7wgCSskpCDHQO
         zYhTAlIJyueMUJI/LZOz0Lpz1AYI3AfNfCBDZrtGODa6X5bJVEab+/Oj/HyL7bzOz9+x
         2IYuFA83nGoAyeqNC6GBsoEn+g05nrdnKIAJadONR7RWEWEI/x2m87AY4KcA9NDa0NrG
         VNug==
X-Forwarded-Encrypted: i=1; AKwUvBxpRxo4l/XoDkUBU/71kk8XbDH4mIjMW+SXmrW/MDUbXEdJb/SkdRHOGTk+u0sLlw+xfKij+FVDzs5ExnM=@vger.kernel.org
X-Gm-Message-State: AFuF++kMY0U8eDX9mQPTYHCLdBIKf+peSXg9/oCL9lJQHmB3aQYJ8iwC
	KB7HAsorCMto4q0ZSVeDGMvAWTRGHuAWwfDqJTis4/eQ7iRGoFbI9tLq
X-Gm-Gg: AYBFou0qgxgjaqLVEsZN/qU2g+w1OCOUXArhNRjsYuOaj837dnDH0XhbLeVygC0JlJ3
	5yCIXWULGEVu6ussPNfuj3K8G4+397gwBegOGqSI6y9ouO9RDSaJ7Wu4XtfpxR7RCSg6bjBRtDb
	e+B59IAISicP8PPu18A05V3uP7Q953uOx9llDvIG0kHCqza3VPCOX9XQ0ni8Zs5tkjS5Vz8VbA9
	7I3u+jelSAiedSh224b04rPf0SKnEtYY3R0wDrmGh52Wn0v7Bb7abccfE9Ah7iAx+rG1ATTGIiD
	CTykAWI/pyJQpmF68/bx3oJHivXxygcPyk1FtlI/nxjpPfYP5dFe/brGjQI968Rz/TfwCV/2PZz
	b6BzjRNYPMOtjupB8xm8VqdWDliphuYZNqosfAr3Jr5TsQh5Rcc1jkDOwzHh98Ru3lckbBdWZDP
	F1Rpx+gjN2fQ+6IM+5YJyBENSu+LPwkRdoGmQkGCu6bArlmkEI8gmknhgjIBvoskPeYaOu0WfwZ
	1zbSboOOYuHuwpdlzkKO17iAAOdgOlxZMp3ilhEZBtTK2zHPCKgDYvA5fr6GuJCxFxJP9rQDP6U
	91s=
X-Received: by 2002:a05:600c:8b6d:b0:49c:e363:c66e with SMTP id 5b1f17b1804b1-49cf82420afmr41030795e9.1.1788527363631;
        Fri, 04 Sep 2026 06:09:23 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B871500CB6EF488A18F9C42.dsl.pool.telekom.hu. [2001:4c4e:1b87:1500:cb6e:f488:a18f:9c42])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce554d52esm135575435e9.3.2026.09.04.06.09.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 06:09:23 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>,
	Oded Gabbay <ogabbay@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sidong Yang <sidong.yang@furiosa.ai>,
	Diederik de Haas <diederik@cknow-tech.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Jiaxing Hu <gahing@gahingwoo.com>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	Jonas Karlman <jonas@kwiboo.se>,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Igor Paunovic <royalnet026@gmail.com>
Subject: [PATCH 1/7] accel/rocket: request the core clocks by name
Date: Fri,  4 Sep 2026 15:08:52 +0200
Message-ID: <20260904130858.27803-2-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260904130858.27803-1-royalnet026@gmail.com>
References: <20260904130858.27803-1-royalnet026@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rocket_core_init() hands core->clks to devm_clk_bulk_get() without ever
setting the .id members. The rocket_core array is allocated with
devm_kcalloc() in rocket_device_init(), and rocket_probe() only fills in
.rdev, .dev and .index, so all four clk_bulk_data entries are requested
with a NULL con_id (unlike core->resets, whose ids are set a few lines
above).

clk_get(dev, NULL) ends up in of_clk_get_hw(np, 0, NULL), and
of_parse_clkspec() only consults "clock-names" when a name was passed,
so the index stays 0 for all four entries. Every entry therefore ends up
holding a handle to the *first* clock of the DT "clocks" property, i.e.
ACLK_NPUn. Nothing fails: probe succeeds and the driver believes it owns
four different clocks.

The consequence is that rocket_device_runtime_resume() prepares and
enables the AXI clock four times, while hclk, pclk and - most
importantly - the NPU compute clock ("npu", SCMI_CLK_NPU on RK3588) are
never prepared or enabled by this driver at all. The NPU still works
only because the Rockchip power-domain driver sets GENPD_FLAG_PM_CLK and
its attach_dev() callback walks the device node with of_clk_get() and
adds every clock to the pm_clk list, so genpd happens to keep the
remaining clocks running. The bug is therefore latent today, but it
means the driver holds no reference to the clock that actually feeds the
NPU, which stands in the way of any future frequency scaling
(OPP/devfreq) work.

Found on an Orange Pi 5 Plus (RK3588) by reading the live clock tree:
/sys/kernel/debug/clk/clk_summary shows four "fdab0000.npu" consumer
handles on aclk_npu0 (and likewise on aclk_npu1/aclk_npu2 for the other
two cores), while hclk_npu0, pclk_npu_root and scmi_clk_npu have no
"fdab0000.npu" consumer at all - their only consumers are the
"npu@fdab0000" handles created by the power-domain driver via
of_clk_get().

Set the ids explicitly, in the order mandated by the binding
(Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-core.yaml):
aclk, hclk, npu, pclk. After the change the driver holds one handle per
distinct clock and clk_bulk_prepare_enable() covers all four.

Note that this is a user-visible tightening for out-of-tree DTs: the
old NULL-id requests resolved by index and succeeded no matter what
"clock-names" contained, while the named requests fail probe with
-ENOENT when one of the four names is missing. That is the right
outcome for in-tree users - the binding requires exactly these four
clock-names and rk3588-base.dtsi carries them on all three cores - but
a DT that relied on the permissive lookup goes from silently running on
the wrong clock handles to not probing at all, so record the change
here where git log will find it.

Fixes: ed98261b4168 ("accel/rocket: Add a new driver for Rockchip's NPU")
Signed-off-by: Igor Paunovic <royalnet026@gmail.com>
Tested-by: Sidong Yang <sidong.yang@furiosa.ai>
Tested-by: Diederik de Haas <diederik@cknow-tech.com>  # NanoPC-T6 LTS, NanoPC-T6 Plus
Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Reviewed-by: Jiaxing Hu <gahing@gahingwoo.com>
Signed-off-by: Jiaxing Hu <gahing@gahingwoo.com>
---
 drivers/accel/rocket/rocket_core.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/accel/rocket/rocket_core.c b/drivers/accel/rocket/rocket_core.c
index b3b2fa9ba645a..5dd260bacbff6 100644
--- a/drivers/accel/rocket/rocket_core.c
+++ b/drivers/accel/rocket/rocket_core.c
@@ -28,6 +28,10 @@ int rocket_core_init(struct rocket_core *core)
 	if (err)
 		return dev_err_probe(dev, err, "failed to get resets for core %d\n", core->index);
 
+	core->clks[0].id = "aclk";
+	core->clks[1].id = "hclk";
+	core->clks[2].id = "npu";
+	core->clks[3].id = "pclk";
 	err = devm_clk_bulk_get(dev, ARRAY_SIZE(core->clks), core->clks);
 	if (err)
 		return dev_err_probe(dev, err, "failed to get clocks for core %d\n", core->index);
-- 
2.43.0

