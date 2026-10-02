Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D76FE455615
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 10:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790936261; cv=pass; b=Zy3PTYkHL8vaKuXAsiyDVKviJQgr8D5yMuN++3sxAnnELxPLXVWjDapeTR/wSLo2MBznKWD09WWriR2aVGJ0nJEoj3qUdZ1vfx63Bdw7jqW3zafh1TeZv8Vhr6Z5nbOJk1KgPhyINrmAP4J4BQzxA1niKewevS/xE2P+AHfIzyQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790936261; c=relaxed/simple;
	bh=38U1s8GZuYMNUAkuLxbkuCyOG+w/gVbAI7eJbWfyuKE=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=qxe87CnxMv2vZw4NunuyAG8TVFnguHqeynurh84UWd7IVkqXHmI1/vcEJWQV37n1LPZShdiXoVJH7vL/rYm5Qsk2HlCn2dbYKlB2oM/PXyulpAZ3Qnh3EZLmBPTojtSe7D8BelgrNAOX0jeljgva/CCEeLX4Hgdzb979xQgnQEA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O5X6GJkf; arc=pass smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O5X6GJkf"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5ba4257f97fso870337e87.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 03:17:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790936257; cv=none;
        d=google.com; s=arc-20260327;
        b=YI8f+WykNN0h/iPos8f+L+cCJL19rXC/SfsEg7ONs/qn/S7H9REqLSRvNZeb7btQhR
         nietl9DVGRFsxi92ofu+La7kM0WVy5tg1CDkbrLwsRxE9Sq2nTXPgi3DaGYepAyCjMPB
         XBEktQCSTPn0XbOaVy6SUYYwlRUWgxOzLjRDXbzufLhruWXIidcFs2xr0N+PfDKCI075
         xHSlCtK/oyTAh5g60YLWavJJ+eC0i2QSRAwga/U1X0ZbGueq+NdDh5EX7aNiZhSSqpHt
         OC6rGWrMiJy9vJBNn+VBl3SOzDXken+kSdIZL7z4LQVibH4o/iZVPHJ2OiQAvvBQXoRB
         piRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:sender:mime-version
         :dkim-signature;
        bh=JJn4UyQhX96Z2Uxh80LSoGTD5a8DL5VMxaJOGjyTlhs=;
        fh=bQgo8Gs6uQmhCaTLnSCZaej5DUSLp6lyM0ah+OcQwnY=;
        b=AA7ezwvYgYTYSm5REEr8GI/EaimoBHOhYhfM/ITRsVU4YO080wC8aN8EhepKbO5uGH
         o1XqaET8jYesXqn9j24116islNml64z/JcrOZmvgiux8SFe2BzBtN02WzrRs+pHjhpOc
         Qc7i7h6egctGeT4zPbf0iM5DLv9qxoCJh7fnav5+ZuMpx3ZdwtwjzK469ZUcga4W12+3
         sJUtT9xs4vP4awZYloT4Jv5DwuNCxBpey9Gni5BuAA8k39OuMgOJAM98HGPilJCXIiX/
         4t+Dh9SRU2C837DtBoPrWxM2whRParczfvKv+j9mPphkYSmzyY59/2p/r8fJxb0W4Uba
         Rg9A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790936257; x=1791541057; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:sender:mime-version
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JJn4UyQhX96Z2Uxh80LSoGTD5a8DL5VMxaJOGjyTlhs=;
        b=O5X6GJkfnjvoI67iKpPBNYEreSkFCq16+Lt9X4aEO3SyY81sKKQRReFUxuYl2u2sI6
         3wtVKL3EQ0qMLRq0CKaN09erMesX9GSIwfxmBgy8Xwkrl7L+fQZPMzMgd2FslHYFQaz+
         rvXomdTlGWzb3lV+u7cO6QSJhAgO6Fqaufd+nJPxhN8Ma382rln2GbA2fOwVVQSNFst7
         gyL8ZSJB+nKVu2GS5k02jw3qHNeSYGEYiaF9rumlHZJU9QvlGpuao74txs869qfTnjG+
         h4mEGiet4dxFYzC8yqVwynecT1cRoXM/+w1STFCOLmBLy3HiWuvQUDXL8veS5VHHNaws
         ZFWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790936257; x=1791541057;
        h=content-type:cc:to:subject:message-id:date:from:sender:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JJn4UyQhX96Z2Uxh80LSoGTD5a8DL5VMxaJOGjyTlhs=;
        b=RNunUK58jPuuW68YWipPHsXHFiUaBG8Vvg2UH8kMJmMAaR1Kkv3rURwh0YFrTbg9yu
         TKPTtKqIpP22cWGvWweWf8xaaRVKOXXfRHqgxS9ARFpFrwtwp1Z4cJcPYyKrpWYVoRRD
         4uJwidJ5dtP5moi1hpeZqPEw3DCCUFzTRlXSDOfjBcsXI+5yefzorR7IDpWaArmJnAnp
         tcIc2mqBq8H6HHwt05SiXLw+ASQRzLJXdHq0+RQxshIs9Fwq5ZLATMRdB0+cmPHh5Mqo
         9G23Exzv4PlFAmh9FORWECz73lekGMqoyv5g7a4GyIwN12azD8U5316aqPwiF8y3TqXw
         fS9g==
X-Forwarded-Encrypted: i=1; AKwUvBxbFbf02fDz/hGyh3ownoiaUF1WjU3dGwv0RkEue0xxNzYlf9CX3S8ACc6R72U4Jo0GeRo69yFJUnxGHdE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKBMlBMovnNrXDRf+iPI/+RuI5F1zdGnK5N/UEBeTGL9GjSUSXm
	QChXiz6xmWsO9QtZ0Z+diF+ZXPsjSVQztkiIEZ9G7M0z05T3nH6WNa/euHWJo+7HEnPV8f2otLN
	sWdMU1CA0kHqdMM8PWpVuiLsa04TnYwc=
X-Gm-Gg: AYBFou3thLpoef2Xvs8Evpe1IErXptnbR0a3MO0mZ3uyaCR0VF9sI/JwRYZg/bM+DWj
	n7WZ27E+yj0Js+XrGCXaZmdzo+mHgWyBAPG5on0G8XtvJu1TmoDocGhcn4Qq7rsg4UYdhNKd/rO
	j8pTtXWI8zKAWtnVx+06y7mszPAihygHLNbtFNoOklWI+CSu57EShAH6oFjbV3wGIGSFEcuptu+
	YIf6MlpgJmMxmj+m6XtDoG1qpuQESAchXxqJ+e0E72doY04uxPmspA3WGCQ7d2bS47MQ/8NwvW6
	ENzr+2Z33hZJIfBUQYbxgvwxPeRgm6rZV5YppWW/GYCGF74nKb5PYvrhMXppsPJ9iZUDPGWh8my
	ZmGORMacTdsyd
X-Received: by 2002:a05:6512:245:b0:5b8:f955:29e9 with SMTP id
 2adb3069b0e04-5bb9bb0ea6amr466276e87.7.1790936256817; Fri, 02 Oct 2026
 03:17:36 -0700 (PDT)
Received: from 254448290189 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 2 Oct 2026 05:17:36 -0500
Received: from 254448290189 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 2 Oct 2026 05:17:36 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Sender: Vamsi Krishna Kattamuri <kattamurivamsikrishna17@gmail.com>
From: Vamsi Krishna Kattamuri <kattamurivamsikrishna17@gmail.com>
Date: Fri, 2 Oct 2026 05:17:36 -0500
X-Google-Sender-Auth: DS4RTw9_jQ-6m93tLNwVXeu3MWs
X-Gm-Features: AclHuK-GcpZNWEeqcuxePuhVqhwPm3ZOGC9uLM51U8kxbwgtnWHQkIW0rClOl3s
Message-ID: <CAANnmVBJ7NCV-SJrFtT9FO3VnaCK3xG5UzNud4xxoicxpY5qCw@mail.gmail.com>
Subject: [PATCH] net: ncsi: clamp filter table counts in GP response handling
To: netdev@vger.kernel.org, sam@mendozajonas.com
Cc: fercerpav@gmail.com, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	gwshan@linux.vnet.ibm.com, joel@jms.id.au, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

ncsi_rsp_handler_gp() iterates over the MAC address and VLAN filter
tables using the counts from the Get Parameters response itself,
rsp->mac_cnt and rsp->vlan_cnt.  The arrays it writes into, however,
were allocated by the Get Controller Capabilities handler from the
independent rsp->uc_cnt, rsp->mc_cnt, rsp->mixed_cnt and rsp->vlan_cnt
fields.

A malicious or buggy NCSI device can therefore report contradictory
counts in the two responses - for example a GC response advertising
a single unicast address filter followed by a GP response with
mac_cnt = 255.  The GP handler then memcpy()s 255 MAC addresses into
the 6-byte kzalloc()ed buffer, a heap out-of-bounds write of roughly
1.5KB of device-controlled data, and the same applies to vlan_cnt
versus the vids[] array.

The loop indices are additionally used as bit numbers for
set_bit()/clear_bit() on the u64 filter bitmaps, so any count larger
than 64 writes out-of-bounds bits into struct ncsi_channel.

Clamp both loops to the number of entries actually allocated for the
channel and to the capacity of the bitmap word, mirroring the
validation the SVF and SMA handlers already apply to their indices.

Fixes: 138635cc27c9 ("net/ncsi: NCSI response packet handler")
Cc: stable@vger.kernel.org
Signed-off-by: Vamsi Krishna Kattamuri <kattamurivamsikrishna17@gmail.com>
---
 net/ncsi/ncsi-rsp.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/net/ncsi/ncsi-rsp.c b/net/ncsi/ncsi-rsp.c
index fbd84bc8026a..fa1ed405dfbb 100644
--- a/net/ncsi/ncsi-rsp.c
+++ b/net/ncsi/ncsi-rsp.c
@@ -883,7 +883,9 @@ static int ncsi_rsp_handler_gp(struct ncsi_request *nr)
 	ncmf = &nc->mac_filter;
 	spin_lock_irqsave(&nc->lock, flags);
 	bitmap = &ncmf->bitmap;
-	for (i = 0; i < rsp->mac_cnt; i++, pdata += 6) {
+	for (i = 0; i < rsp->mac_cnt &&
+	     i < ncmf->n_uc + ncmf->n_mc + ncmf->n_mixed &&
+	     i < sizeof(ncmf->bitmap) * 8; i++, pdata += 6) {
 		if (!(enable & (0x1 << i)))
 			clear_bit(i, bitmap);
 		else
@@ -898,7 +900,8 @@ static int ncsi_rsp_handler_gp(struct ncsi_request *nr)
 	ncvf = &nc->vlan_filter;
 	bitmap = &ncvf->bitmap;
 	spin_lock_irqsave(&nc->lock, flags);
-	for (i = 0; i < rsp->vlan_cnt; i++, pdata += 2) {
+	for (i = 0; i < rsp->vlan_cnt && i < ncvf->n_vids &&
+	     i < sizeof(ncvf->bitmap) * 8; i++, pdata += 2) {
 		if (!(enable & (0x1 << i)))
 			clear_bit(i, bitmap);
 		else
-- 
2.47.3
