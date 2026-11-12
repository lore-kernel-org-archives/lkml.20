Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=57.103.66.221
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794498293;
	b=Ps1dZwZVEpqi6iXNL1DZ0T3zcCgopvc7kq0ecGaldJM43JWNJTEC0AgYnQW6Bnkp6a89
	 YHAVob3wNHyxCi8wTjgCQ3JCm4lCCxWn65GVbhYBcL0LnQsWiQ+5gqknICe7V5lqddflt
	 m8/QAF0lWf02+F37NIDL6l7dUl933zSPgbCq0Yy6dHKY/x6+zEPvjWGe7L6o168SETKsI
	 vb77/UM7WZKIYBEDJqoM2yV8WuK9eFBAMbFR+Se+wKqu8TaAXFhdpIPSqYwgeu0NrpJBv
	 rMEH+T/dtGOMMk09cBDNP2zCjaDuZFk3oh3fYM9OYEW+P2xDruvsA/DsStDFJZl8R/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794498293;
	h=DMARC-Filter:Received:X-ICL-RepId:Dkim-Signature:
	 mail-alias-created-date:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Info-Out:
	 X-Proofpoint-ORIG-GUID:X-JNJ;
	bh=hD9EHOp1sqfWQCZ39a9QuXn0Z2yLfe+6MbzfqSYgeyE=;
	b=z6ZLDXPIZGlZ0ufFgHc+SYM+QqxPlkKCn3HZiC30LaGLBdYIR501GZlcqasrofyPNXCT
	 Q3bBUg5doy+g0i1QnY6+LqaqpzaEURTRaeLXFWnA1rBtKtUv00usOroJ/8unWUux7MoRy
	 9pIcEpJFfozfjMk/L3BdVBGgkSoe8K2hB1x1vlz0g+7eCT5xRBfTPrpkqDEmw+vPF1epZ
	 YMBPP8D1gSe/6053SYDTYGsogzGIVJAxYteIoq3RB0hkNm42EL0LkgJ0KX+uh1hXIV/H3
	 zzEvhVsndWwy9z/GJgM3t4eUjutZuJuod3q1ST2K6drh3xN1WnxG18BjTkJj5LvWepQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=tawheed.cc;
	spf=pass smtp.mailfrom=tawheed.cc;
	dkim=pass header.d=tawheed.cc header.i=@tawheed.cc header.a=rsa-sha256 header.s=sig1 header.b=U0RRA0lU;
	arc=none smtp.remote-ip=57.103.66.221
Received: from outbound.pv.icloud.com (pv-2005k-snip4-11.eps.apple.com [57.103.66.221])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 024AD606A323
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 15:44:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 024AD606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=tawheed.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tawheed.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=tawheed.cc header.i=@tawheed.cc header.a=rsa-sha256 header.s=sig1 header.b=U0RRA0lU
Received: from outbound.pv.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-1a-60-percent-2 (Postfix) with ESMTPS id 768A5180023D;
	Thu, 12 Nov 2026 15:44:51 +0000 (UTC)
X-ICL-RepId: 01a1d06e-e6e7-7d0f-a699-1dc6edd59094
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tawheed.cc; s=sig1; t=1794498292; x=1826034292; bh=hD9EHOp1sqfWQCZ39a9QuXn0Z2yLfe+6MbzfqSYgeyE=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=U0RRA0lUgFOyB41rNpiZZkRwodU3wb0FT71dBwqqysCK5mtaxFQY9XfQNZzBj82hogoEjCPqTvO7bZW36GHI2HUKU5Eq4BfsDJLi0feTORWolWwNazXVlGAu0jKu6BzVusopclrfqlYikEvRUFwqrJ33dR66EqfhMaUGKrwqK9UQgTNqpuCXLa5LoypbeGBDDPBIc/REz5lboatdwq75ZwlLMH3rXgRKdW8k3/CIJM03ul2TxMbYy8380BLCpWm2olOyHQFpJS8QS2gb3dmwNS7VzddFBfQGr2Ao80NaaI6qQjlRytjbajG+KSz2cqpjBJUjk4PhaJPlxJIR+4Jtqg==
mail-alias-created-date: 1711150425226
Received: from DESKTOP-HUABEFD.localdomain (unknown [17.156.192.29])
	by p00-icloudmta-asmtp-us-west-1a-60-percent-2 (Postfix) with ESMTPSA id 1E3E818001D6;
	Thu, 12 Nov 2026 15:44:50 +0000 (UTC)
From: Tawheed Makhdoomi <_@tawheed.cc>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Douglas Anderson <dianders@chromium.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/panel-edp: Add LGD LP129WT112684 panel
Date: Thu, 12 Nov 2026 10:44:44 -0500
Message-ID: <20261112154444.417-1-_@tawheed.cc>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA2MiBTYWx0ZWRfXxU6LO3ZEY1JI
 0jqgvJJC95obiYJYKmdUAN8Q0t5TZ9UtHxrmIzplPBsoNrVkBl7AnomRwI+O8QV63v7gL3lyg2L
 yx1fLr31FTkmXnrSU7CffWilmQo1C0S9MUi7OIma7mm3foqhP7bhTYjwV8M5TvPIxgG/j96LdLV
 8LHZ9DDOKl+aEUMhj6JVMjk1FbkAxkoTlk+LnOQDUWYUcNKhOz8ZFJYyqVIb4sT9j32Hy4581GO
 i+Knrt3ajweAZk+MvKHDxNZ4iOTJWYz4Ngzal7dynopzT0pbKfKRj/X8Hvhfibzxz3pCfCy9P8S
 mMm2CrID2ndmdhHT3vi95Rih1s+JRrgUbHwyDygsroM7D3UXM6kcoWNulZenbw=
X-Proofpoint-GUID: Fo9oz_V7p-lADEa_ELg97zHVp1OsVTt3
X-Authority-Info-Out: v=2.4 cv=BY7VE7t2 c=1 sm=1 tr=0 ts=6af5def3
 cx=c_apl:c_pps:t_out a=aW9mcIavGNWWFvFFKOxBSA==:117
 a=aW9mcIavGNWWFvFFKOxBSA==:17 a=MKtGQD3n3ToA:10 a=1oJP67jkp3AA:10
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=ZXJPI2V5j2xcGEkMas8A:9
X-Proofpoint-ORIG-GUID: Fo9oz_V7p-lADEa_ELg97zHVp1OsVTt3
X-JNJ: AAAAAAABe8jkH0cKRXDJQLKW8TDcwG8DSnePrNj1QOFZqDaJ8H3m3gcDu4Gtmk+GCou4nz
 htim1rMOr0xBSM1DYTZ2C3qMXqdvNiu63kDttaGu6iBvI8/poOfCJ+yBmNqljQyNF/TKHy
 WL/y6shbUkCRK3VsYhN4Haqb6w+seHOwTvi6/kEMFQwmqmfkRKHc8UppwvC75jKxil0vy5
 MSmDlwH6WI/kGPa5l5/CH/HK/dpNcPb3YDAeJFrGn1K8C/VeBnfmVE4QmgWBwZNgEV0dPf
 SZgckG7LYqYPxW65V+x9NkUklUl4MlkyXzyNmM+v5jh5P0eqiBD0+u5zb+cR+wzAzV5e1z
 mARSVLzVldHl00JtT2uY2ylbqge0q1qy8AeWgoxUQoUA9UkUuwZa5AGJ9hxWp0TidYJOKK
 cJ0scOKBCqXuGCIh5+8wbqDBuwmfsIQyUO+HAMJuzMntMw9alj5JhECuBDCJzz1BoWyJvY
 EErv02IuWy/Fw4zi5tEryTN7rdyOraQTu4Mhy4AfN4Po6aasn36kUqv1osz9sOaqXnpr+Q
 QSKsMwnd+AoZQtTucC2AuuzitFFBJguzapB+N6NS4DGOadM9tTAdbTMmDBzBcvsFHxVyAi
 lueX2G8OiMAuRb7LVVVZ27jpG2ZKIPVLKQLkt5ztQiHCfHU8KsSvGa+rusWeaiv2zxZkmD
 GsA59iXesL4GMA9j5AZGq4X7Au23+xCqxxkOJ7EoXsjcacwwkcJ5crbaiDvTxmScvmkTAb
 +Xouid+HhLqJ5Wwb6dy9LJqRbhrTnP/g673WNkVspULRKizR9im2sXzC8cVV3hOm3WM0Vj
 qkb7JRX93EO/4P7yl7DUE0EV+Di2CJAv3Xl/jhULoeGZTlFr4Ur7G1Sw+VaWgOz67ncbnl
 le2vj48ZoxByh0Jss99YNcgmuA8zbzUGuaFJi/f/PC44fZHDFEHfMAemyR1JzcHaamf6zT
 jyvZSYHVVr57FZFChfsxU2QmAr5ISHkHth5QKGgwuObdifpTk6BBNXuVdBqdOjQTmGNBqr
 eQMkDwD+f44sFPNs+l5oCTpCt19lvR2xnVjw15FNMkxJeQVl3QvTsjgkjjssAwgUgrTlw+
 t4xiIZ4ex8S4/5I84D10nVY6rnstKlDIgCEbuu0TjOi4af4MduyPEo9zDQ5bY6YM+49jDD
 6TCPQNOFBmlz6jNlxGT/AdkQ+v6y/q9GiSNRrx9vJwUBb6zVgnGKgBtD+uvpZ396zwWJWA
 PEaMrlZ3uLLG5WZBCag/hSRIWtV8SfKHrowe+ON5qIrUg+DoRUqw0Cp+7Q+djylgs72iOf
 Exc2l/ComzdOCouKlmTZMHxvq1CVqvo2yvzabNgWMRTc07pSyg7SZF3VyBBKnchOgE3vmp
 Ef2A5lLUySM252NsiX7OLQ7ROWY=

Add the LG Display LP129WT112684 12.9" 2880x1920 eDP panel, used in the
Microsoft Surface Pro X (SQ1). It uses the same timings as the other
LGD LP129WT* panel already in the table (0x06b2).

Without this entry the panel is driven with conservative timings and
probe hits the "Unknown panel" WARN.

Panel ID: LGD 0x0555, EDID descriptors "LGD_DV1.0_" / "LP129WT112684".

Signed-off-by: Tawheed Makhdoomi <_@tawheed.cc>
---
 drivers/gpu/drm/panel/panel-edp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index f7add22cc..8f7d7a3b2 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -2190,6 +2190,7 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('L', 'G', 'D', 0x052c, &delay_200_500_e200_d200, "LP133WF2-SPL7"),
 	EDP_PANEL_ENTRY('L', 'G', 'D', 0x0537, &delay_200_500_e200_d200, "Unknown"),
 	EDP_PANEL_ENTRY('L', 'G', 'D', 0x054a, &delay_200_500_e200_d200, "LP116WH8-SPC1"),
+	EDP_PANEL_ENTRY('L', 'G', 'D', 0x0555, &delay_200_500_e200_d200, "LP129WT112684"),
 	EDP_PANEL_ENTRY('L', 'G', 'D', 0x0567, &delay_200_500_e200_d200, "Unknown"),
 	EDP_PANEL_ENTRY('L', 'G', 'D', 0x05af, &delay_200_500_e200_d200, "Unknown"),
 	EDP_PANEL_ENTRY('L', 'G', 'D', 0x05f1, &delay_200_500_e200_d200, "Unknown"),
-- 
2.43.0

