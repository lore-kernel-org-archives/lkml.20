Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793654938;
	b=M26uvXufne4VVkum+0z8sGMh/4x4kUJTDySKscYhBMWDB2LuiiGn/yUPIFHhyGK4jfL3
	 4s8lq525h9kZGaLYx/gihSGn85dEGZflK3Fn4fCQ8aMMTQAC3q/ZQTSUQ3b6FSTGkn5Vv
	 7zVAzzMdQYwFxXJ2+QK4Imbiqzg43nkEXk94xmfYAYhV4yieCObb7/9t4+dCw2EcGlC2D
	 skjPc2Fz4iE/KWncwAK1BWXDOV+JDF462p00oS8za+OfkEbGQfkcmcqFJf4JKwkS4EMoZ
	 1LH0mIP8XwOt/q34BGm0hC0i5kEcb6EZOT7BkYT9Yg5bhvr+F74pdxNYgDEMnkcIBMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793654938;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=zcVggVYajR4k5NgQe9pbGY6+WDVxyFxQve/L9p1a8zk=;
	b=iYI0eJpN1jZb5khhwqpptdhnkq85RTMBJBPqdGVeD8/Pdz+uDTyxrfpAMQLnuKfeuK5t
	 PFn2dwr2kSAjqvFzrH6AF5WKosRd6arC390LLUIF20BENKeSiQ4cZkcBNBNh3Ur86U8bw
	 ClKZ5IkQ3xioceQfFxwXtcNFvccyHlaWBMSOIgcs2aRrurhcj5hP8Clclbuq1SdiBFI9p
	 aqpf1FizpZA/+8fKFbeFBAnqwG/2vevOVpt6fpfMYSKJZGk86Qm/zIAYqrbNAN4Zd+GXd
	 p0hWEYjN/vnGffU9BN7aSVpfot5GcCdHeEr7lwU2R0lUotola/znkqfavyOGQHrIzlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=jQna+337;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3C22606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 21:28:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3C22606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=jQna+337
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so2804294f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 13:28:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1793654936; x=1794259736; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zcVggVYajR4k5NgQe9pbGY6+WDVxyFxQve/L9p1a8zk=;
        b=jQna+337bMMe9RWdhK+bBk9SHtnebcSA6MIr4g/+IWqcnZ26xsfr5zjSNXZRRbGnUG
         b7cvrqeGeH1RIp+DEsiKYT2UMrntanyTsn2v4QlYTXhrS1m73j27RLv3sWC/gbT0F1hQ
         QLvsYQn/IIW9XrJyEVTcSk3JGgum9c92Gc/0UnhJznRy7F+opoqHH3KnWoiMGUudoQ9W
         thDCOpL1rwFkcxh8J0VEbXTXmk3GdVsdIYYOyda8XpJd6lGdUPaisc2pQh2ul5KKbeqJ
         XjDof7GNXmNF4MyP99Gb5JPBykKwLay/iUZcC93lBePHTr+jEAF3dMtrmVmxPw046eil
         Gzyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793654936; x=1794259736;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zcVggVYajR4k5NgQe9pbGY6+WDVxyFxQve/L9p1a8zk=;
        b=hH3qvNYbfPlmrKprZHNai9zSzEtO5fIyeVqfp3J7kD3Onp9mGJIIsoBhDQt2gPs7zI
         mfpYwfsPhmQLiErsfWbvtZ7mgFCbgJ9AnP+QgsrqVMpSnqt8YJW0EOrMS7qPVMbGh+K2
         LgY1rQNNc/qtohq37riVNWmqMbeXXFUyv8+YzDBwyY1kwaZgdz/K56/+YfpCMTLtvjVX
         3aQae+u2q3b06bKGk269WfFMfs6wV4vMTWVRSOJSp21fknW8EMTjla/AGMlPw98SxYH5
         3gSHHfxXAyvHaKzRphIqZu4RB8SvqAKxi+GhQIjv1jLSMwYmnEHEa03YeCRLewZP5bd0
         ZZrQ==
X-Forwarded-Encrypted: i=1; AKwUvBxmKbbNKT73FJCqrxYjV3TPGbdFNXD4DB2pUag6QuMueVtOd2NxfrrRUWMJB31VxIkucrRloP9gle8Mcas=@vger.kernel.org
X-Gm-Message-State: APuU4Z/maVva0FnDZydZzG6eHFDRpunyWX4J1mhss3tv0zQTH7kb2KVR
	iNFbvcKl7nfa5n+xgqb3sIJK9MTXpaKfLGR4m7fZrvejWjzJAv3AUIel
X-Gm-Gg: AYBFou3pTpUyESuWWwtKOFYCkNa5a4t2Y8PN4yb2LJ1p/hGU1GHzp1iAIX6roeluxRt
	+Qi9xih5i0dy2DZfju7/jWNmqydSQb0bHL3RmscZZx1oUsMbIbybKp8UpVWSMNbKhN+93fs9AJB
	PTYtnu36lUI5EX/d6kviuoSd9/Z+4PPvUHE5Z5zJdO619nc0mmX7uK73VVGfwsm5x2lx/oW3k6E
	1b4UuFz0gv1AspPDtDdw9timaPAw05nBmxPI2t3ftpQA/7UKjCRT5UOwH/W0FXeLjodrfiWDVYb
	XkaczYdwgl47zZf3YoC0GlCTk8HdTmkoTv1lBK2+3kq/IYXoWfOlbE2Tp4dVYaMS8VPCrZ12X0h
	iTX99qNm1gDo0U6aK9d9n5wVZvdVeE+UVACA5S2XxOfJd7L1Li6ibwzRZhnLGV+pJlf+awLswvv
	BbZrZ+VtmDQT7rqkjns9gvk9/zAnH92mgHHVJZds5mQE9Q3TRDa3BCQkUNwWEetPmzsOIRNh2m9
	x5vIQSeCJjjupSkrepRqg0p3pXVFatYD4fRsmFgDI2VcdnN1Ur5kys2flHgq0JF09Hd1IUSYmLH
	NKDIU53aw6cUg5Rwd2FO5uL+7FP3mGga8pf4YxBacOPRBEnOUVdV7p6M/F4wQjrcaomeP78FCE9
	knttKxOmNZpY0IgRLIaUH+PPPHB7LBxAuD3AOt5djr+EHsiBdnkJ/CKBQ
X-Received: by 2002:a05:6000:2dc5:b0:48d:ef0e:b791 with SMTP id ffacd0b85a97d-48e6e52c720mr25066663f8f.54.1793654936073;
        Mon, 02 Nov 2026 13:28:56 -0800 (PST)
Received: from blackbox (dynamic-2a02-3100-b1d0-8200-f22f-74ff-fe21-0725.310.pool.telefonica.de. [2a02:3100:b1d0:8200:f22f:74ff:fe21:725])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48e71b725a2sm20540521f8f.13.2026.11.02.13.28.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 13:28:55 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	neil.armstrong@linaro.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH re-send] drm/meson: add support for higher bandwidth HDMI DTDs
Date: Mon,  2 Nov 2026 22:28:43 +0100
Message-ID: <20261102212843.1213021-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.56.0
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

There's a report from a user with a DELL U3415W monitor and a Khadas
VIM3 stating that 3440x1440@50Hz works but 3440x1440@60Hz doesn't.
edid-decode Detailed Timing Descriptor (DTD) extract of that mode:
  DTD 1:  3440x1440   59.972616 Hz  43:18    88.819 kHz    319.750000 MHz
               Hfront   80 Hsync  32 Hback   48 Hpol P
               Vfront   28 Vsync  10 Vback    3 Vpol N

Those high clock rates are currently not supported by the meson_vclk
code as it limits the PLL OD (output divider) to a minimum of 2. The
formula to calculate the clock internally is (ignoring fractional
dividers):
  319.750MHz * 10 * od = 24MHz * m

With od = 2 this results in m = 266, which is outside the supported
range of the PLL on G12A SoCs (the driver limits m to 106..247).
Using od = 2 results in m = 133, which is supported.

Allow the driver to pick OD = 1 to gain support for modes such as
3440x1440@60Hz.

Link: https://forum.khadas.com/t/can-not-set-display-resolution-to-3440x1440-for-dell-monitor/26271/12
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
Re-send of [0] which seems to have slipped through.


[0] https://lore.kernel.org/linux-amlogic/20260109204836.790096-1-martin.blumenstingl@googlemail.com/


 drivers/gpu/drm/meson/meson_vclk.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_vclk.c b/drivers/gpu/drm/meson/meson_vclk.c
index dfe0c28a0f05..c0be0b7655bf 100644
--- a/drivers/gpu/drm/meson/meson_vclk.c
+++ b/drivers/gpu/drm/meson/meson_vclk.c
@@ -700,8 +700,8 @@ static bool meson_hdmi_pll_find_params(struct meson_drm *priv,
 				       unsigned int *frac,
 				       unsigned int *od)
 {
-	/* Cycle from /16 to /2 */
-	for (*od = 16 ; *od > 1 ; *od >>= 1) {
+	/* Cycle from /16 to /1 */
+	for (*od = 16 ; *od > 0 ; *od >>= 1) {
 		*m = meson_hdmi_pll_get_m(priv, freq * *od);
 		if (!*m)
 			continue;
@@ -750,7 +750,7 @@ static void meson_hdmi_pll_generic_set(struct meson_drm *priv,
 		/* OD2 goes to the PHY, and needs to be *10, so keep OD3=1 */
 		od3 = 1;
 		if (od < 4) {
-			od1 = 2;
+			od1 = od;
 			od2 = 1;
 		} else {
 			od2 = od / 4;
-- 
2.56.0

