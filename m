Received: from mail-ej2-f43.google.com (mail-ej2-f43.google.com [74.125.228.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D62CD378D74
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 02:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790301823; cv=pass; b=gVLnmDKygNz0cLVDg926ccTdq6hfoY5QwjKG3ntrNoXEcZqWEA4jyHr4dzqrXUsX/NQkCEQepAo8yk2F4R+199Wh/EgaeHRZRG0AGbCdSJJmsF7Z45Xvtg6i/kmKXyCYFaRwBwsRimkqwFGny9GJINBwoeD2SZlsQuVcvaKVdVI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790301823; c=relaxed/simple;
	bh=I74p1TPOpyMN5eN8javYXxz6OzoRysS3odlBNtVBa6U=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=Sh0xkFryzKwxfRzoNwwadIsTl1iMbNkA6tercth0ajntJQD/npOyCwe9u62aNo0gbzZs2YUT4/A8uSFxYCWY7I4+1ONmNFISirD15CiUm+ab/Nloxl2wLbGSwGXGrZwshgWN3TKg2DgLkDxRGrw4xIiLMZhVANqlatWDJNDdkY0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oPgegzDz; arc=pass smtp.client-ip=74.125.228.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oPgegzDz"
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c254f56039dso51655666b.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 19:03:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790301820; cv=none;
        d=google.com; s=arc-20260327;
        b=gqrPkWtjlAt8H4rNRkAkaZzwp2OtdorugAinIVq2GSXJomEaiIE0weS7AshgeToHuE
         cSarVc1LXsxeveXtJ4GCUz2m9iPDZx/MwcClGq3v2I3swVLlerZShvJvH4SdfSMARLJG
         zvSTcXtL4+1U+6Ey1AmT2nLpBOq26NFWkFAP0pVpW9kqAbec7tY3STilw2GsGJtZSP+G
         JcMVbF6EwBgLeSMXuIUq/J+XO89hDsS7mN+yFqjXTMHrYc1+MGI/QOeBZBTDua+swleB
         5UCmLqtbtYyo2EmH/5UTxhIZssKHEaCng07tiG62K+z86PRfwHFpgxdW69zMqrTMEx8i
         PoPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=JXqpBsOJVxozVwjvJVgqPsuZqPEgDFWhK/I0MbzqS08=;
        fh=qGiqzH7KgB7elOSZ+TwcK4au8NdRls6/sVJ+7W2Q6BE=;
        b=X838iGQECKhWl+4JaDiBJRBdny+Bz4+4z9b30TV93InwdrNtpdYbSUpEJMBPLUPyOP
         hHp2Rdy1Fob/AGhWfWfrZLHWPJaxJNrBruo5oGAPPo1d5V+3AX/fNvdUbW4Cd083d5XA
         zW6EAF8y7bXeFESe8EhozmIS9naG2PjoBciT9p6p2zdfLjfaFH5avLcZRooljB/fiL/f
         /7B+UYAPV1iv2u264HVEHzGF0RPX4a1ZrHjxitEy2SmWYiXdydVdvCa4aAWKGgxoPcbn
         uH6nLNfCJXCGEz1x3UE7XN6TO8n+adVBXTwkCTs8f97NdTAOGN2dd3cPVb0eSnroAXB9
         jmaA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790301820; x=1790906620; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JXqpBsOJVxozVwjvJVgqPsuZqPEgDFWhK/I0MbzqS08=;
        b=oPgegzDzSUCZSzj6Nfgv03BNdvjmDVDcpmKMhczT6jJZXwpL+bLPMOjxW1rHGe/I4e
         GF7k4gFHk5TOzi9WIliW5y+PhssT+e18XW/7DDZOpZvniaGTi3Cpliw2ua2rSUUuJfnc
         Hl3+DB2hpsg9/xRBdCQLBZEO7Btvhktdvd1s9z+W490A3eX9vvJenJH/CXx4Q5mHgURh
         puv4Hg1XI3U6yak+aIZL10Q3ijwZbnvMQ5F9bPjGgE9rTEvF6KitvgtD4J+u/rKHxNZr
         QQJuVz3Xk1k5tWVGkxT8aTwBvbs4u6iGUIlcppxnkVUW6ZWB2+m1zNO3WGRNt5vpE2Tz
         trug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790301820; x=1790906620;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JXqpBsOJVxozVwjvJVgqPsuZqPEgDFWhK/I0MbzqS08=;
        b=XCJseh7TifcFz4zC4gK1AQwxWuNZIAfPDXUNbYKTZCEZm/I8EQ/00SUgERPsiDWHBO
         3vBHAVH7rRTuvUMG3oqaQT1fIb8K7+4DULAQCeO9kyXjQne90Zlhrje8y0EKlEqwEeTa
         hsZwfgypC+I3g1ZzVL2qJlMtRQoXvnUiHnLK4rw/sBrmgPsvZRcXQ4boMV9kPu3/aVmE
         ioFaCVk7iBE6cgigqWg4fDgHkCDgmx5je+1SHzjmQ2/qlUftEWHSAwqLudw09PFc2TbO
         RfpGAhoGJdDF79vwY0WUWi/exo2w1qf0CBqdDZsJVM79li+UI9WOlTxgwn2F4CsS+3/K
         K90A==
X-Forwarded-Encrypted: i=1; AKwUvBxsypMLWI1+F2z26PbEyUBsy52ekOn1gKjnhwbb6lm3gtg0KXvpe5oY5NkQ9a4SR2B426rEl85J6P75B9g=@vger.kernel.org
X-Gm-Message-State: AFuF++lN9eB+5Prymn+lFMopdrm/yvdXFKXzHI952miiM3RyYqFxlxQm
	LLEZyxMUuIXNE/26mLb2RSI6N8SWxRzWHO2eyWyp6piZqS7qvvnNB9AInydWO7qtpcW4QFAVAeb
	VHYrH39AL58MP9StU8SzBiyxTjLEySg==
X-Gm-Gg: AYBFou2XODMuhiPTNJqDF/ayLJvnEwJ4O3j3PLykDB71lQhc76tLsGTbPmqGdAtFbiO
	f2ombSmSxJM5ZrXzRRYKtTtnhcca1dcY+PLXsEHWxdvlLXNJaHqxa/NbX3HIQGDHpnKdkHHk7Kw
	5ugEiZuMfDwyvFhlQChqRRANm7eciLSIAbSsIMUVbOc9Md24b1G/Lnc79E3ooDD0IoSMTYtdCv3
	zSfReqplXo5z59MG2jiJCJIvjOBof8rJqauZAgGJ+UaaFCb0uAVDl9t/IX5Wco6TaSyt7I6k16F
	zzvBcQzzckAmi89jBfYlqVioIf1E5bgQizZvdVUygtEat4W2lK0ymqyRlLlPbHbh77XcL1wNA7s
	s9EUrSvwXk6ybc3QteoxIwzIZhVto6LJ+CtfYJiRQbCBPhCI+sIGysAhSSvC1vcv43A==
X-Received: by 2002:a17:907:e918:b0:c26:19de:913a with SMTP id
 a640c23a62f3a-c2ac2674c23mr365071766b.45.1790301819967; Thu, 24 Sep 2026
 19:03:39 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 24 Sep 2026 21:03:39 -0500
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 24 Sep 2026 21:03:39 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: mhun512@gmail.com
Date: Thu, 24 Sep 2026 21:03:39 -0500
X-Gm-Features: AclHuK-CLL4CN-iwpmzU09ZJTyaHPdgpyfiVO316kD74pCcGmQ449hidnQgH-fE
Message-ID: <CAGEsz8EYe=gBFr_hEYFLUeiJMRtau=eV3cDUUmHJOQkC0qvfqw@mail.gmail.com>
Subject: [PATCH net] net: fec: drain PEROUT requests before canceling the timer
To: Wei Fang <wei.fang@nxp.com>, netdev@vger.kernel.org
Cc: Frank Li <frank.li@nxp.com>, Shenwei Wang <shenwei.wang@nxp.com>, 
	Richard Cochran <richardcochran@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, imx@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

fec_ptp_stop() cancels perout_timer before unregistering the PTP clock.
A PEROUT ioctl can set perout_enable, release the driver's locks and
then be preempted before hrtimer_start(). The unregister path waits for
that ioctl, which can rearm the timer after it was canceled. Removal
then frees the netdev containing the still-armed timer.

Unregister the PTP clock first so all in-flight ioctls have returned
before canceling the timer. Clear the PEROUT state and compare channel
afterward, then disable PPS. Serialize the channel write with PTP clock
shutdown and skip it when that clock is off.

This issue was identified during our ongoing static-analysis research
while reviewing kernel code.

Fixes: 350749b909bf ("net: fec: Add support for periodic output signal of PPS")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/net/ethernet/freescale/fec_ptp.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/freescale/fec_ptp.c
b/drivers/net/ethernet/freescale/fec_ptp.c
index 56801c2009d5..67901e036ac3 100644
--- a/drivers/net/ethernet/freescale/fec_ptp.c
+++ b/drivers/net/ethernet/freescale/fec_ptp.c
@@ -506,10 +506,13 @@ static int fec_ptp_pps_disable(struct
fec_enet_private *fep, uint channel)

 	hrtimer_cancel(&fep->perout_timer);

+	mutex_lock(&fep->ptp_clk_mutex);
 	spin_lock_irqsave(&fep->tmreg_lock, flags);
 	fep->perout_enable = false;
-	writel(0, fep->hwp + FEC_TCSR(channel));
+	if (fep->ptp_clk_on)
+		writel(0, fep->hwp + FEC_TCSR(channel));
 	spin_unlock_irqrestore(&fep->tmreg_lock, flags);
+	mutex_unlock(&fep->ptp_clk_mutex);

 	return 0;
 }
@@ -856,11 +859,12 @@ void fec_ptp_stop(struct platform_device *pdev)
 	struct net_device *ndev = platform_get_drvdata(pdev);
 	struct fec_enet_private *fep = netdev_priv(ndev);

-	if (fep->pps_enable)
-		fec_ptp_enable_pps(fep, 0);
-
 	cancel_delayed_work_sync(&fep->time_keep);
-	hrtimer_cancel(&fep->perout_timer);
 	if (fep->ptp_clock)
 		ptp_clock_unregister(fep->ptp_clock);
+
+	/* An in-flight PEROUT ioctl can arm the timer until unregister returns. */
+	fec_ptp_pps_disable(fep, fep->pps_channel);
+	if (fep->pps_enable)
+		fec_ptp_enable_pps(fep, 0);
 }
-- 
2.53.0
