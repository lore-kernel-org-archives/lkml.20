Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794934826;
	b=4ONyB+Q1aZl3JzurH3xEBgOAWP4cZz+OJx/uXv8LNS5sEOtkRY+xc4AoKWR4QLXl0Ouj
	 Sh1fkKJhGSTxq8ylYbOk9P1Pvyyops8RbkVc+wUUGF7tQVYcG3OUinhmEJpMV8GvsL9WR
	 mdpfQDArRsrA0VuXyOBit5DMrjafvgNuGyAPgdVidEc+Gy5rI96UiRn0eOEVWh5+y/h90
	 J+oGiIdc7+D2uKNie+3gZgSZGTNEJ4LunnY5XyO0AfUkQkEsgWjbJOqEdYUG3UZa+sB3A
	 BwOB6VDIBOcp+4abcaH/U9MFFixuVxiDsMFau1XaQzSq3tY0nILmXrA9oasA9e3mptw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794934826;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=kW55Dk+yseJmN9okamfVtjuiC2NhjKfzRVvzdrDCbhA=;
	b=rqXSYKXPieKArD85tWB66pvWnJEFx0aUItQuyZm/CuFAbF5Yn7YzhkEpd6Pb17QrEvWs
	 KraCMV0q12a2ah11YYimki1Nb3GE6mcKrcLBMW7JCn+uA0/uOuj6M9Xrnp3gEJdOzzDpe
	 QHlAz0H5/StHzGekLazQ2vDwoecSR82HLC0a1CddW4pxZ816IShsfalrtXVd8xj2HR0H6
	 HS56dnh3e0J3xv689LIZuXlk6A1moRVHEuUB/Fty5HFEyKg86DtKW6AFauImOtOAarMhh
	 dvqm8mHj49hL5K14Z/Hlp+9e7oI305FOAfd8TinU2XejvWmaw0wBDu4SVic1FM66AYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Pu3P8pSQ;
	arc=none smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 457D3606A32F
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 17:00:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 457D3606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Pu3P8pSQ
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3b09cc7ed1aso589719a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:00:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794934825; x=1795539625; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kW55Dk+yseJmN9okamfVtjuiC2NhjKfzRVvzdrDCbhA=;
        b=Pu3P8pSQkYeHwsSeZfCsabpPPtErJFAq193jMc/KSoEkEM7kiVtNPyFLjth8wRfXMz
         38gz70BFUCcvw4jHP8TwecK4uwYG0H6wB/FYsz0bE6kWUx8ExX5e9m5rc2n7/I3QR7rC
         ghyjJWTyjKnDK+laNZRuqkL7ugFCEUDAORbll3wn5ypoh43eKeHNQE+8LgEo03AQnirj
         ODeS7C4iWhD0X7naASkHB9jWCxYw/l9V2jg+ReXg0OSUkgovngM/0E2LnhUxI1Pfr7Vn
         nTO03cTCNV2zbMMoU6BfNLgC/fAR+hPQ2fJzcXLQc0MPX+3okVwBfojyOZ/bRCOpf8yC
         1yVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794934825; x=1795539625;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kW55Dk+yseJmN9okamfVtjuiC2NhjKfzRVvzdrDCbhA=;
        b=NlnUBohZVTAxs2iD/tddMPTZw76NMooBYECC49/cC2z4vjwLjVJ38/7vfc13WOx2s+
         tCdVq8Xlg3esp9UjwozfOHPIBd0A6Md0nXybP9+9gqhy0ALU6ZL6Chd8Z17J85lNh0w/
         UWcqBMOxgAuCJivdSrElDoMi52xLzFNP52l+UNU2kMTei+4ozmYrsjL/FACL5Mvp/Fxi
         spy/ldEx4OM9MbpED+yMQLe1VfSKnk0TgPXj//iSY8sIjKH3o7tOvqHsRxVp/eeaVW5H
         Az/DUThXgkJgyLW+snh3W3O7Iv+XiAffFFexETffvsOWr8P4M6Fqd+960h0N2JAbpHLP
         NVzQ==
X-Gm-Message-State: APuU4Z8+3phwQXxQhk0RN8VMsEc6GqDOkzfHFF18bSHCjl6qZsWK0DsA
	af/VAbLAfhgAxOXFlpcRHwoUyIc2Ur3INSOYz/gQ8vQXRqTpVrfWdrhmEJn42Zu3
X-Gm-Gg: AZFdTZelwlF2o+rAnkgVNqI4dMN0V757wo+azg/aVultytaPP0R3eVlaVLpCkuyFPlL
	KvWq/uzYPjbhN7iBA6zw+pf0fP3FrqjWLsdHXUt/blwe3gGejSyQepRuBKWVVIA50Bci/i8VLj0
	xwBzNrEa0uGbIRM+LLdAXgBC0dAWzFRfTfXozg6GL6LhuTYkQQqRJgoy6WqHQHqg5Ad0Cj0djMf
	UX//Jz9UwWis/boH702CsV7A0Y+ezRJ8uiKGmfvSkKj7xfxexKu7snOMLPxv6mJKZXjOBSFGd04
	AorwqBpwxIdRbyvCxr9qXXzOwYeTaySGBeDPJT8QOxIXjpXHah+N2M3WKIJzpWbuXw3V7R84VkW
	w5fGsKYgriGO+19Th88C3+Q0RvsFfBC0TYrtdyjU1uvE63tTVvNOVMp/3onFSYyCsdD8ZJrv+JA
	1jq3dq9KUrgLVUkjgLalcWrnJOstSNLlpYvUbZZTGYRd8OYe9jZTKYs0HOhmRjMTGEDpz16cyHd
	oYgAyvJsk4B0oasQSbH9qtjnVRw2W7shqTFS941FYHrGlcN7Y+iTyQR00FU6ZH5ArbJBLxc1h0C
	MWC9uDKAfVTYt7q6NUSQxB6hTjAwO6aJ7VxDnEh3ssHElhPabgggzKLGY07W8qAl+iDP9w==
X-Received: by 2002:a17:90b:1d47:b0:3b0:975b:2256 with SMTP id 98e67ed59e1d1-3b3d07a8e0fmr40970a91.4.1794934825267;
        Tue, 17 Nov 2026 09:00:25 -0800 (PST)
Received: from lima-buntos-dev.. ([218.239.109.48])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3abe8b263sm5183964a91.13.2026.11.17.09.00.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 09:00:24 -0800 (PST)
From: =?UTF-8?q?GIBEOM=20LEE=20=28=EC=9D=B4=EA=B8=B0=EB=B2=94=29?= <rtx4060@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Subject: [PATCH] soc: mediatek: mtk-dvfsrc: Add missing calc_dram_bw callback for MT6893
Date: Wed, 18 Nov 2026 01:57:17 +0900
Message-ID: <20261117165717.1348-1-rtx4060@gmail.com>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Commit ddb5862a43b1 ("soc: mediatek: mtk-dvfsrc: Add a new callback for
calc_dram_bw") made __dvfsrc_set_dram_bw_v1() call the calc_dram_bw
callback of the SoC data without checking it, and set that callback for
MT8183 and MT8195. The MT6893 data use the same bandwidth setters, but
were left without the callback.

Any bandwidth request for MT6893 (MTK_DVFSRC_CMD_BW, MTK_DVFSRC_CMD_PEAK_BW
or MTK_DVFSRC_CMD_HRT_BW) therefore calls a NULL function pointer.

Nothing in the tree sends such a request for MT6893 today: they come from
the EMI interconnect driver, which has no data for this SoC, and there is
no MT6893 device tree yet.

Set the callback to dvfsrc_calc_dram_bw_v1(), as for MT8195, which has
the same registers and bandwidth limits.

Claude, an AI coding assistant, found this while reading the driver to
add another SoC.

Fixes: ddb5862a43b1 ("soc: mediatek: mtk-dvfsrc: Add a new callback for calc_dram_bw")
Signed-off-by: GIBEOM LEE (이기범) <rtx4060@gmail.com>
---
The MediaTek for-next branch and linux-next (next-20261116) have the
same lines.

Testing: this has not run on hardware, as I have no MT6893 board. It
builds with W=1 at the base commit below. mtk-dvfsrc.c also ran
unchanged in user space, with the registers as a plain array and with
ASan and UBSan: mtk_dvfsrc_send_request() was called with each of the
three bandwidth commands for every SoC in the match table. Before the
patch the three MT6893 calls jump to address 0 from
dvfsrc_set_dram_bw_v1() and its two siblings; after it they write the
same values as on MT8195 (20 for 2 Gbit/s) to 0x26c, 0x278 and 0x290.
The other SoCs give the same results before and after.

That model only shows the call path; it says nothing about the hardware.

How this was made: Claude (claude-fable-5-2, an AI coding assistant)
found this during a longer session of porting mainline Linux to a Lenovo
TB375FC tablet (MT6897), while reading this driver. It wrote the patch
and this message, and it ran the checks above. I reviewed the result
before signing off.

 drivers/soc/mediatek/mtk-dvfsrc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/mediatek/mtk-dvfsrc.c b/drivers/soc/mediatek/mtk-dvfsrc.c
index c691a895c92c..8ae924bb81c3 100644
--- a/drivers/soc/mediatek/mtk-dvfsrc.c
+++ b/drivers/soc/mediatek/mtk-dvfsrc.c
@@ -736,6 +736,7 @@ static const struct dvfsrc_opp_desc dvfsrc_opp_mt6893_desc[] = {
 static const struct dvfsrc_soc_data mt6893_data = {
 	.opps_desc = dvfsrc_opp_mt6893_desc,
 	.regs = dvfsrc_mt8195_regs,
+	.calc_dram_bw = dvfsrc_calc_dram_bw_v1,
 	.get_target_level = dvfsrc_get_target_level_v2,
 	.get_current_level = dvfsrc_get_current_level_v2,
 	.get_vcore_level = dvfsrc_get_vcore_level_v2,

base-commit: 666539eecdf4db623f5e3c3e55cf9f2dfad24aa4
