Received: from mail-oo2-f37.google.com (mail-oo2-f37.google.com [74.125.231.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 819F1363090
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 15:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.165
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790437766; cv=none; b=dLDlQbHCeCd2WtJ6GMLA9l7D7AbCwfFbDCNQuV6CNUWubOUn/VMERv3/RykGT80zRDLwB+HhS4sot6YWWP+alOfosgPA9AozIvnUh+bBT/raAjziJUG0jZotiI1uzbEZmRW8lIVVbkz9ID7Lc6uCyE2FHETxT0RI0T0Tr9y857A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790437766; c=relaxed/simple;
	bh=KS/8rL8UeoBvoNAjD7fEnF4xbmiricnrL+uNpL65yjc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FSuBUo5Uzbx1TcNEOw9s8x3ST6BVkhAfARfMO/92NVgxLlQsncbS3H8H6eXcRzb3T0/yLrGVIiipQ0enmwDt9dsfyXVJYErQB9BmDlsiJw6CtccLFYK2ujB/sYE+lNr2Z/AEe3ImIzb0U3yQ1QFeF4o4pTPGyklHh07KtGeRnxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZYQj66vV; arc=none smtp.client-ip=74.125.231.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZYQj66vV"
Received: by mail-oo2-f37.google.com with SMTP id 46e09a7af769-7fcb425fc2bso1178315a34.3
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 08:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790437761; x=1791042561; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ux2E3gKwjBl0LaPoZnc38g0A76GDt8ClA7XYMblBPIo=;
        b=ZYQj66vVNAQ2yWSuR657ndMiocyvCVppkJ8SN8xr50O2vMUbx6YcXkYGykxb2qTNhk
         PWfwfp0VXMqN9s5iPOe4sbHlNBftKWszL9A9sfPlzBDIjm1fL/+ViSwIZKj+tLMgr0WA
         7kBszEVWIazl8H38sKrQ2qLgnNmn2sVe8fvODgHr9ETwcrYd01ZRI8r+ddiXYhNBpBhj
         cPfsYtMfEF5ckF0hOzG+GcmBiieOVoYggrVt9WXL3zbC0XM8Kz6cwyoXJ26BeZjkbPQp
         0YI1lgtJsRQGsDtU/xK/2bho1P+pL3weWYuSWRGEAHk4aQQqApJfJI2Zm+yCbH1NMsZ0
         wrkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790437761; x=1791042561;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ux2E3gKwjBl0LaPoZnc38g0A76GDt8ClA7XYMblBPIo=;
        b=2xMeolqEKHzDnGsOuID4qr0ULCYLo3dEcbbO7xMW2yAUYRUYRP9grQt4Wlqdy/eW6y
         AkeERW+yUwRrdWbRdn45woorxAx7bjjJesKMVSGc6lkqJAOfcFoP9eYLBAnh41SCB0us
         lk+NtiIyNczjoa+D6WT5C/bc7d/ZvZtfmZwUEKJqcjtNLRWWAmXw+jx1elcZduaPSvnK
         27bZ4MbwPG4sVfwzAP3J7rPOWBdl2KomcmQQpdHIa65uaZhAwxk/JBU925+E76muRCz+
         FxgUJyuK7pYzH2xG3NSfNOW+xrJ/2Hw+Ulf65Nm8RFIwOKgfBhLLFNITpktqFJdPhLQo
         7WFA==
X-Forwarded-Encrypted: i=1; AKwUvBx+Jk/gof+9zxage13m9gtZZ1Vi5q3wgqNezyPqc5dyaH17Mn9e6xE45Owzb+1C2kDXHvX2cR/v+W3d1dQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lYRJWpP69TnkblOL6vL3g1Oyr+/viKyrDiUKFlIAJtqtoen8n3
	hH63vWviqNit1UCZxZhk4FNIg1qo0oFHeTxf4aTOYybd2teg8Fn2fPS5
X-Gm-Gg: AYBFou0outK5HvQs+3vNwpLJR51E3POcRFce6MCUFPBhazsW9g4mIsBYbQ3uk9oSA2A
	9ZXngvdMt/3Y4YGMYUdFo46DCc54yeGP4ENLxXegRuYfE7MkfugFdvE+62dsGnbtJ7Q91F8Sfi1
	KROPB75cjfhcY7L+/fk0CNPqL0tignXNd11x91udqwoIad5dkPA/E0yNcE+4RCyOpCZFJ/Rgb+m
	hUlfnDpzUJt2m3mRPISESn/809ir/MjRQWq4Fg5TzUgL+tLpsRCO484O0uEI8FT4vpgDlLYu04b
	6o6RXchozCCrcM+9n2+Bmce3iOqlkQUu5LWLwx7PzcvzsrVe7FPDFVjbj3RDu5AwQb0i8PLhR3L
	r/ZB2oPSeQOosg9B8fI5XO6oKYGOtC2U6VbyEKbieLZMlvtVDQJbBCkEcuwi1jBH/TxpPuElu8L
	HBIt8K8ikEJ1Oe0Vxuq7SFIm4F42B6sZATZX33GNUMDaA9lYzyVO34oREtzHVP4GxRRnTANPkg9
	VeEKB2wAa2hlKsTLF9aFdDELs8ZoOKpO0equSMhUCsQrUFPqn+dnCoI7xlonVpfRgW8Mb2WVY8x
	EIzCD4+ZgoG1+CFym3mNwVCMufY6yabZrMVwkSfcs1V5gTeFQqq1LRjSc1/u37Kq/KC8qAeTOJm
	sDawftvW6jgyYWEosHqud
X-Received: by 2002:a05:6830:43ac:b0:7e9:ea28:4c1f with SMTP id 46e09a7af769-81781790b5emr8931706a34.8.1790437760721;
        Sat, 26 Sep 2026 08:49:20 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-818e98b16d4sm5442366a34.26.2026.09.26.08.49.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 08:49:20 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 26 Sep 2026 09:48:56 -0600
Subject: [PATCH net v4 01/15] net: stmmac: unwind the WoL IRQ after a
 safety IRQ request failure
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260926-submit-stmmac-reset-fixes-v1-v4-1-ec1c0250b3c9@gmail.com>
References: <20260926-submit-stmmac-reset-fixes-v1-v4-0-ec1c0250b3c9@gmail.com>
In-Reply-To: <20260926-submit-stmmac-reset-fixes-v1-v4-0-ec1c0250b3c9@gmail.com>
To: Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Joakim Zhang <qiangqing.zhang@nxp.com>, 
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Christian Marangi <ansuelsmth@gmail.com>, 
 Tiezhu Yang <yangtiezhu@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Jesper Dangaard Brouer <hawk@kernel.org>, 
 John Fastabend <john.fastabend@gmail.com>, 
 Stanislav Fomichev <sdf@fomichev.me>, Serge Semin <fancer.lancer@gmail.com>, 
 Suraj Jaiswal <quic_jsuraj@quicinc.com>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Joao Pinto <Joao.Pinto@synopsys.com>, 
 Vladimir Oltean <vladimir.oltean@nxp.com>, 
 Ong Boon Leong <boon.leong.ong@intel.com>, 
 Voon Weifeng <weifeng.voon@intel.com>, 
 "Song, Yoong Siang" <yoong.siang.song@intel.com>, 
 Linus Walleij <linusw@kernel.org>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Magnus Karlsson <magnus.karlsson@intel.com>, 
 Maciej Fijalkowski <maciej.fijalkowski@intel.com>, 
 Simon Horman <horms@kernel.org>, 
 =?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@kernel.org>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Eric Dumazet <edumazet@kernel.org>
Cc: Richard Genoud <richard.genoud@bootlin.com>, 
 Alastair D'Silva <alastair@d-silva.org>, Maxime Ripard <mripard@kernel.org>, 
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org, 
 ZhaoJinming <zhaojinming@uniontech.com>, 
 Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>, 
 Ding Hui <dinghui1111@163.com>, James Hilliard <james.hilliard1@gmail.com>, 
 linux-tegra@vger.kernel.org, linux-sunxi@lists.linux.dev
X-Mailer: b4 0.15.2

The IRQ setup paths request the MAC IRQ, then the optional WoL IRQ, then
the common safety IRQ. If requesting the safety IRQ fails, cleanup must
release the WoL and MAC IRQs, but not the failed safety IRQ.

The REQ_IRQ_ERR_SFTY case instead frees the safety IRQ and skips the WoL
IRQ. Allocation fault injection during live XDP reopening reproduces a
"Trying to free already-free IRQ" warning and leaves the WoL handler
registered after the datapath resources have been released. A subsequent
open can then fail to request that still-owned IRQ.

Move safety IRQ cleanup before REQ_IRQ_ERR_SFTY and WoL IRQ cleanup
after it. This restores reverse acquisition order for both shared and
MSI IRQ setup, including unwind after failures in later per-queue IRQ
requests.

Fixes: 5c2215167d12 ("net: stmmac: Add driver support for common safety IRQ")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 3f34d491c959..4f3d452c3503 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -3797,13 +3797,13 @@ static void stmmac_free_irq(struct net_device *dev,
 			free_irq(msi->sfty_ce_irq, dev);
 		fallthrough;
 	case REQ_IRQ_ERR_SFTY_CE:
-		if (priv->wol_irq > 0 && priv->wol_irq != dev->irq)
-			free_irq(priv->wol_irq, dev);
-		fallthrough;
-	case REQ_IRQ_ERR_SFTY:
 		if (priv->sfty_irq > 0 && priv->sfty_irq != dev->irq)
 			free_irq(priv->sfty_irq, dev);
 		fallthrough;
+	case REQ_IRQ_ERR_SFTY:
+		if (priv->wol_irq > 0 && priv->wol_irq != dev->irq)
+			free_irq(priv->wol_irq, dev);
+		fallthrough;
 	case REQ_IRQ_ERR_WOL:
 		free_irq(dev->irq, dev);
 		fallthrough;

-- 
2.53.0

