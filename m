Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42633522F14
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 08:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790064107; cv=none; b=ameb5hlss6JfHfomhV6CFr0QGSTzTBEi+BFprtCBjLu0sh7Hwp6a0IlVULv3XTgp01yoNwDKTrWyX6meiDyXYgJ77N3H6Cu+c3I9UqG6lge5yhAPKjG3jR7uW5r6KK8iMV2vETIM9roN1X3L7WPOuVLz9vesvD2Z6KHuFKXyWMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790064107; c=relaxed/simple;
	bh=0xrVY0R026KpNfsviBE2/QZKTNvfEgT3VjQqd30Zu1k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kFLWroU5L35nV11vhgtX59rXn34YUliJhBLimW33G136w/aRmqxA+7Cd1JsEWer+Ps9CVyOuuN0/AogYvOvLM2ncyifg6CLNpKXi44yPb0FNC+R5m2qHNT0tq7aVC1yCzmIbvGlXJFHNZBN1QYGGRLqcKNf7GTakRC3C5PRAdjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y6htxH0A; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y6htxH0A"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49fbca514f8so2712655e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 01:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790064092; x=1790668892; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hGF28/ongkg1pjDH+01IcEm6dgrPiae6qX55Ok4Xvzs=;
        b=Y6htxH0AHk6grdEK/nrW0GflTyjDSZnNsOLpl4zypHP8VM1mli2uXXKZTpp0nKEVah
         XjaTVcfSQ/xnGmk5RFdmvzxFmYbmJS1p/qZ9RO0lh0zRqVys5NuUbyKu15fAvC5+HkhL
         fpDCe2YUkyU5bG7/6JQVBXBA02iIiXEnahe3YUZzw3pq1paBE2xVmSbsgNwrikBNX17+
         KvnOPd81nREC+264jRNDZw1LuWfMQgi8WII/1N37FIQ4WAZF0uofWDl970uNZyaqLcBI
         f2GmCuzyB6OdpM8ryAgX/uI77qEOIupCarLXmxvTKgTwOhFSj6pD7JZZv6IXQtA3Q73k
         crVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790064092; x=1790668892;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hGF28/ongkg1pjDH+01IcEm6dgrPiae6qX55Ok4Xvzs=;
        b=1J9LgqF5pFsxEJEUASiJ6J8H9Il+vP1QKGCeTs0PVsq9aA+U7RQKrRtIACDlFL/0XE
         KnQAjN67fFhGds4g7G22nsPsz1PBuN1bmqwf2FUBn4DUNkau5JLfrxuMWeNiL5gyOQ4Q
         DMYTfSUepvfiEN/47uE7idhIdZnRR4cDqk0VmFVbc2Pd9dYF+21rdf+FJ+3Mw6w5ucwX
         Qti90cq9MHUcLwwLM9GdydvzV87tK/6a/AemNceBnqyE0QgpU34lNM8dHRXdQybILaxf
         kah5JNDjiUtRFlqWuFl1t5LWtqPGHH6WIrdm57OdYVEL/Is9cmiqGMg7YvqQh6nKLSMC
         l1/A==
X-Forwarded-Encrypted: i=1; AKwUvBxz/6ERDfeP/5dVPFIjztZ+lQ6BuGFDu9Bc5t54WaHPDtqwwwoXoOwfW4Tjq952lCZ75ubAfoqm+K22NSo=@vger.kernel.org
X-Gm-Message-State: AFuF++nz7oVcj7qgVuYuDt6LbD1Brspk7M2OVO7pHmHwcAnsOsmrDpBZ
	ptOchXZKzeYiiEpc8wwz/4hliVKtg6QllAnokFTB142iaycUzi8jvS3LHJ6eCwvS
X-Gm-Gg: AYBFou0p6mt9YxXi5oY4Of4wBCzsKEGNuIm+vHPavuGhyzZt3VxFkBuPSIdyVdwvhXu
	o99i3wapTP39+uYLlUU7YlqyCw27C+/wKtPnn7CeUqMSuI4XVODk1hthSZwI7NzQxZhbjjXdf/G
	2x+IECxDoYnm2a0DrhtxMW83UaWKGozD0n3KTguJVOSLJMv46otvOGPRyzz5k9ctnTCvTTImdWc
	V1kT8dm/pq4ZavGB8uJeQBZo/Nxuv5TzX6gagKouW1j9Zsm48IkGwfzxJ5SPT/D4RK+Oqus/Qyq
	R6BnUyx6OimCPdQgmICim9v+YERayBZSesGBIKjG4spjeDaLu3YzSnOR/7ZRPsGTDnsM1FkkQ99
	PPXLhySpYnKJzStfBpNgyz09QrGqjEgisLz1WlWX6rclmmMkW7DU8RsoR0tRg+zJWlziByE26rA
	059qthneKo9Dqqcb67rxn5W9HUxaA/XehCx6T3s4wHgsDCbD4AamMme3YOCrbcgg7YLflVmRsil
	dgDkgHghIITkOhNBr5wbKzk32dx4MhS/uEWDm7ls6evQd2tpaY8W0q7r3CSA4JYgjwD+//dRyCg
	w0Y=
X-Received: by 2002:a05:600c:3b99:b0:49e:6683:d227 with SMTP id 5b1f17b1804b1-49fc7bbfe4bmr199176535e9.0.1790064092385;
        Tue, 22 Sep 2026 01:01:32 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B80530056971C6280202175.dsl.pool.telekom.hu. [2001:4c4e:1b80:5300:5697:1c62:8020:2175])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fdaaf97e2sm18248625e9.2.2026.09.22.01.01.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 01:01:31 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>,
	Oded Gabbay <ogabbay@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
	Robert Foss <rfoss@kernel.org>,
	Sidong Yang <sidong.yang@furiosa.ai>,
	Diederik de Haas <diederik@cknow-tech.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Jiaxing Hu <gahing@gahingwoo.com>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	Jonas Karlman <jonas@kwiboo.se>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	=?UTF-8?q?H=C3=BCseyin=20BIYIK?= <boogiepop@gmx.com>,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Igor Paunovic <royalnet026@gmail.com>
Subject: [PATCH v2 05/11] accel/rocket: request the core clocks by name
Date: Tue, 22 Sep 2026 10:01:08 +0200
Message-ID: <20260922080114.44662-6-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260922080114.44662-1-royalnet026@gmail.com>
References: <20260922080114.44662-1-royalnet026@gmail.com>
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
Assisted-by: LLM sparse checkpatch
Signed-off-by: Igor Paunovic <royalnet026@gmail.com>
Tested-by: Sidong Yang <sidong.yang@furiosa.ai>
Tested-by: Diederik de Haas <diederik@cknow-tech.com>  # NanoPC-T6 LTS, NanoPC-T6 Plus
Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Reviewed-by: Jiaxing Hu <gahing@gahingwoo.com>
---
Same diff and the same message text (his copy re-wraps the lines) as
01/14 of Jiaxing Hu's RK3576 series, which carries this patch as well;
whichever lands first, the other drops it. The trailers differ: Jiaxing
asked me to drop his Signed-off-by from my own posting of it, as he did
not pass this copy along, and Assisted-by is added because an LLM helped
with the checks on this v2.

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

