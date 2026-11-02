Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793641740;
	b=LN159N6YDtcbL464FDJ2bGdATrRig080szGStO1kc3CzBXEZ/kQEiqstyQ0gFG3kdG6N
	 sRQ1dk8qoWZyNUbxBIDRSKplE0E8zswIbeyDPXcdgf/DNY9FVwMoZ7y/hfyiclfZVz1Ns
	 Dg8DJHzbK2vlxEpk4Ju4SWF/FRjpjyMOo320az5hW9yy7gNxIhFSH3Hlzipc52L0WkG/3
	 UcVaommjzW/abuz58i0Evyaw5vPc3nyhSmVf9bgyD2AJLOeetQx5AU6ezCpLmBXGJAKvk
	 0cwKTvDV4nsZpbnUegLiIhlzHZLQ5GPECzFzyRS573OCypVV+18KgUudG8v2e9QNxRg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793641740;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=eP0Y6oo6faclP+TA9E7YeDBqEgJ7r8KP1TNkcNSer+M=;
	b=2axmY4n51F/wWB6w/OaJFbEs9SX1NLf9tN17M922KEPdSUXuEJiw0ArNUgjh8c7u6D0I
	 jrbrHq8KFHs4G4UEhtj494G4yEYXGRlxxZUpfY/JnceWIsDeP4mCeZFDKVN5zzAgEkcj0
	 /NTlbimUEyuFqgpK3P5E4m6Q/Wx0qUNj9MpbFnRpF9Zcgc3IwTsEJI/frvBejPUJXdEBz
	 ya1C7VHgzzSZ6Z3JhJnUsTmCzppscyHI5PU18NlsMiOmeutkHUd41oKeuXBGdoPczQJfw
	 SHL7WoteB/6IAv+SvdRoysuE9ecX5j79FfIu8TW0lqxRIi3FZyFu2Aj0YkA687uLFNg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fBEPXcMJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCE23606A92B;
	Mon,  2 Nov 2026 17:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fBEPXcMJ
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793641739;
	b=bzYIm5iMChyJCwGOPSYri2vPvWFoC7Sy7XO7e+AYE3R0zf6Kvc6fVj/J3OS/ycxvMdrT
	 /0PbRwLF+cQP2Kcwc4rALAnv5xd+hu+quhb5+dlRL2zWo/GoNW3LmcLIpmLmoBLBJ4kcd
	 Wk0kgv/oofbyv8al65d+liK6h2aB4LvjYXbWSkV4HBHPNBXsc2121BdLkZeD3Ae5ySkiu
	 7sZwEAuvuuY4FSb9C2bfaEMJkwWv7NOpGRIBP6w+hEcfb+Fq1Rlj+6MzEyLorGRNuzkZH
	 DY6RRn53nMJ5Oyh4ELdXgJD8b99zrKKtYmo4BvAnkIzRrhtSLpp79jDtvzSpVVujw0w==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793641739;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-Endpoint-Received:X-Original-From:Reply-To:
	 Content-Transfer-Encoding;
	bh=eP0Y6oo6faclP+TA9E7YeDBqEgJ7r8KP1TNkcNSer+M=;
	b=AUugk16JhTuqTarcAJ50qabVuDEU5pcYPjCrUhUi/9x2qKcG4ibcILokaae1ajmvDpaL
	 38URAsstCynrVQCG16D1YKsZNK9KVvj2pdB8Z5sdTUQAEz6c8WJvAx9hrC3fhyTo0xMnD
	 seqSTjyeHHkfL8nJNRkaxNA8vvAL0t49pXXIAHVrRt6OMnTDirPntEMnjm6yjkpvdTNGl
	 Txsv/VH5m+/aKYK0HOQml2m4Z/vzmCbpkhmEfOTuqYEjtVgGuh6bYcX4VEOSOdvcpJJ/P
	 +KEFbWvbQf0XyR6y68jHjC1LH13WpBBeRyobwrAJRLOntE36UKyzuxm0w7e3bmcaVeQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 215071F00A1A;
	Mon,  2 Nov 2026 17:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793641739;
	bh=eP0Y6oo6faclP+TA9E7YeDBqEgJ7r8KP1TNkcNSer+M=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=fBEPXcMJshrIU9NPc4PKaWd8Nxn7Pi5bJEwMOvFvBr5J8Tb5tuNbb1hsqOdj302EK
	 sStRNqQhK1daUO8i1zgNOhBN03QZRXKh8W1loh+URg/uG3qRJt/RCns9VEuPD6w8NX
	 5kLpdUfCvvuAjsFeQXJcGmDHHx1y7OpQLsULZF47CzKBmPIJyEyIwd/VFY3xsA3nlQ
	 NEh7QuS/JlsV2Gz4ZZHzwj2df5CqGqK4Gk/S5vnQnrxZD3r/lRZwK3Cph7TpgXElpl
	 i5YYtJkf+gGLRQp6N7xxYBMLT7Cqo8YL/rTBoqh67z3jTKTkkMbEfx4gBuXU7gdY04
	 LNfZEeDiJkbYQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id A40D0465C7;
	Mon,  2 Nov 2026 17:48:58 +0000 (UTC)
From: Igor Velkov via B4 Relay <devnull+iav.iav.lv@kernel.org>
Date: Mon, 02 Nov 2026 17:48:57 +0000
Subject: [PATCH] media: rockchip: rga: Keep the clocks enabled without
 CONFIG_PM
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261102-rga-runtime-pm-clocks-v1-1-1bad7807f037@iav.lv>
X-B4-Tracking: v=1; b=H4sIAAjN6GoC/x3MMQqAMAxA0atIZgNtEUGvIg6hjRrUKqmKIN7d4
 viG/x9IrMIJ2uIB5UuSbDHDlgX4ieLIKCEbnHG1tcahjoR6xkNWxn1Fv2x+TthQxfVA7AMZyO2
 uPMj9f7v+fT9WzOPOZwAAAA==
To: Jacob Chen <jacob-chen@iotwrt.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Hans Verkuil <hverkuil@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Igor Velkov <iav@iav.lv>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1515; i=iav@iav.lv;
 h=from:subject:message-id;
 bh=2aAiFLoBlld6RgGQ0EoX3zPXerU1gatyiz1du1lqQ/o=;
 b=owGbwMvMwCVmNH1q96v4SmbG02pJDFkvznJuXqItWfLsVZbVh6suzL/lV89km7ZRp2PH05sit
 1eWKkY/6ihlYRDjYpAVU2SZcEjjVsaSq3/9PcwfwMxhZQIZwsDFKQAT4W9jZJjTcy61VDnn5Bze
 xbPXt1cpLQl8znXX89rSD3lnBVTbA9wYfjEt5ojpX778SvpCg1zuTaftVnWsusl/dsJcuQtnvsb
 K2jICAA==
X-Developer-Key: i=iav@iav.lv; a=openpgp;
 fpr=90C228DA68A4D5FD4F4837E03297958BEA5F7903
X-Endpoint-Received: by B4 Relay for iav@iav.lv/default with auth_id=1060
X-Original-From: Igor Velkov <iav@iav.lv>
Reply-To: iav@iav.lv
Content-Transfer-Encoding: 7bit

From: Igor Velkov <iav@iav.lv>

Only rga_runtime_resume() enables the clocks. Without CONFIG_PM the
runtime PM callbacks are not registered, so rga_probe() reads the
version register with the clocks disabled.

Enable the clocks from probe in that case, as etnaviv and v3d do.

Signed-off-by: Igor Velkov <iav@iav.lv>
---
Split out of the rkvdec CONFIG_PM discussion, as Nicolas asked [1].
Build-tested only (arm64, COMPILE_TEST, W=1, CONFIG_PM=n and =y):
ARCH_ROCKCHIP selects PM, so no board runs this path.

[1] https://lore.kernel.org/r/8aafdbbf04a0d939c6b4d7d5577d97bb58d1c439.camel@collabora.com
---
 drivers/media/platform/rockchip/rga/rga.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
index 543a0da75572..c50141bb5654 100644
--- a/drivers/media/platform/rockchip/rga/rga.c
+++ b/drivers/media/platform/rockchip/rga/rga.c
@@ -701,7 +701,10 @@ static int rga_parse_dt(struct rockchip_rga *rga)
 	udelay(1);
 	reset_control_deassert(ahb_rst);
 
-	ret = devm_clk_bulk_get_all(rga->dev, &rga->clks);
+	if (IS_ENABLED(CONFIG_PM))
+		ret = devm_clk_bulk_get_all(rga->dev, &rga->clks);
+	else
+		ret = devm_clk_bulk_get_all_enabled(rga->dev, &rga->clks);
 	if (ret < 0) {
 		dev_err(rga->dev, "failed to get clocks\n");
 		return ret;

---
base-commit: 27285b099fbc5cb2ae3aef20f3bbd7b3c88b3005
change-id: 20261102-rga-runtime-pm-clocks-9a4e6faecda0

Best regards,
-- 
Igor Velkov <iav@iav.lv>


