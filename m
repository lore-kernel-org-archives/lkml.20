Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22DB2312837
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 03:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789789744; cv=none; b=LKEv1u0uohWKjwh2G06KfTsQW310+SvPM+SzqAGnIqgK/1jI+s6QEtnPn4K8aQEmdsw4rzYrY+GLgWSLpBgWHmJn+s7Sz6ey0jXf5QBrBEvAvP9m2htpq/qzNeUmU2JwXBXFnDs72tEKUsYwhid5v1Z+/em9EEiiMwHOqLLraqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789789744; c=relaxed/simple;
	bh=6dqE8fqyhH00SZerAyTZ9y7PeNvn3AJoLcDr/g+eAEE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lxDcsK+M/k9+NqK8v3v/5l6JqVHLB8pxNoIg26OGAsuAQ0SazPX5s1K/tsV3bkoTgyR5P1cFUT3XPEUjbGk8Jd2fxxw7hvlE4SdfiB29sQTf5TOfM/B2QBqqbr9oDMtNG2se2yo/lTKK9oW/512+xz/5vou/JhVOU1wJ0kYFxmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kXv/8Qmz; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kXv/8Qmz"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccd5cf03so1458390a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 20:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789789742; x=1790394542; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ewk+C2Dr+NeNykXYcfbBUgSsghNQhbXTW4j8zHUNmfs=;
        b=kXv/8Qmz4JebvTzdLuSwLi/CjjMfCwkuN83FKT4R0TwhcEskjNw94un487sBeik2js
         x00Ox4Sz2r/v6CYHcVtksRofs3O5D4T/jnkKCNhSZU8Z5YKI5aqL3jk5PdoTUalNLGvU
         FIO4Fs8F/VlOLtpmmw4mOngv3vAg/Gkz2zUjzMvENgenWa57FJW04wKPT/23xSrvOIal
         +Xykqt5aA97/BWOylCtvry76d7fLolFhQ8yHy4hvfnlVeIWVEtMjH9DrxovdAlAJok/R
         dV8QndCXVKYLIQFl8PxWG9h4kL/gpCYotzlaFi7vqHCPhdIF9vIgvTjOaMb1BHQ8Xpoy
         GlFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789789742; x=1790394542;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ewk+C2Dr+NeNykXYcfbBUgSsghNQhbXTW4j8zHUNmfs=;
        b=kz2wxrSgLSVJVCAAhCoJlJ2H9lDV3cW4AX7Ls6ypkXC5R4bgLKD2GEKYn2aWVQi65A
         ACsG94C41sJ7OMqO83wrM6DazI59YJhRxH88pru4gOGzwUJuTBe827+WdrjwXUUXRu8l
         RkTuK4JB74lUpnvrgjAsQX5gdIkF85ulhiLogFwk78BRJft6KXPV3bZwMviKpdINVrLu
         dIyGX0NQv7N0vQI4IT1SuFBg5llD+M9AJ7XCZsyas6ptOIeS78M7PuQXz5OJmQ5beAOn
         hgAdM09XRSI7TXzLTkN+e6xDHeE9+5yV/Oi8rntmy63YtxxKRH4q6lCfVIIOloXtS0SQ
         YYJw==
X-Forwarded-Encrypted: i=1; AKwUvBzj2ZbYUVsex4qC1642UR+TJbBOOf7Em58QJ6G3om9ogaa0RSw8OwaiOzfaFJwnuSsDB6pfTX3Q/xZHNS4=@vger.kernel.org
X-Gm-Message-State: AFuF++nO/HnjbUxTc8fstK5wT4ongucg6H/4NmO5UcUUN+mcGU1Pqi56
	MPBUXadtN8IJGPSyWkZQVQHWDzNAjhMhNK/NqoYf5oPt/y3KZtPMfNY=
X-Gm-Gg: AYBFou2KCeP7qEXlKCbnSwAzSgbhRoqvSdbKUu5fNME4b0iQbwiUU+EZj5IPKGPVA4c
	Ue704hWv3t4GLPnvduaT4CeklWYW7oAt0pA1bjEosOCQM+rREdfeswIyWfQgnIylMfvaAZ/up9d
	wusDtrLmle2SvXoL0KNs+jvZ33PpCkAdiFHmklGJT0y4U/9L/Q2IXB/hzAJ/DcKci3hcTdFHgs+
	ifXzNZtslLQrju2icya74a2fMP3mrf69uq6hGLGgN0psUjG8O0eHI9mSvKbUYtDZdRVeTZjw0bm
	1yOTfDNfZ2C/nLH3HZgrqlKFbMYStnH8PJKS72fBez5Y/U7nH7dAYMv7A1F92e5ildUvJHRgCVN
	7jI8IAwF26inAL/p6jQ45R7ULRwtrgOOz6JMsDxWEVBBQVWOdYnMXsWCKg8JqPcTXqukqvH6abP
	5rymVnhPgMZ5PH52cBZLBBgZuIIsBabmxfgnZFVET3Z89PykYAaYDMt+GdFwtX8dB25Lm+ltFva
	FrodGxWAOxPlpb4s0BSUuCKlHwnmXMHJK5vJ/VN/UKSmjA8+KPMLbNq47AWhzwAK94gQ8vs2u3o
	vUmyvrMPNpWtHA==
X-Received: by 2002:a17:90b:48c6:b0:39e:131d:4510 with SMTP id 98e67ed59e1d1-39e54ce5062mr9390976a91.13.1789789742457;
        Fri, 18 Sep 2026 20:49:02 -0700 (PDT)
Received: from codespaces-2db70c.ktkhmpmw22vebpok31ngjx2qsb.ix.internal.cloudapp.net ([23.97.62.118])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6c4ba12csm2305479a91.11.2026.09.18.20.48.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 20:49:02 -0700 (PDT)
From: Triet Hoang <triet.hoang.dev@gmail.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Stefan Wahren <wahrenst@gmx.net>,
	Triet Hoang <triet.hoang.dev@gmail.com>
Subject: [PATCH 2/2] firmware: raspberrypi: Clean up local formatting
Date: Sat, 19 Sep 2026 03:48:40 +0000
Message-ID: <20260919034840.28593-3-triet.hoang.dev@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260919034840.28593-1-triet.hoang.dev@gmail.com>
References: <20260919034840.28593-1-triet.hoang.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a blank line after the local variable declaration in
response_callback() and fix the indentation of the UINT_MAX return in
rpi_firmware_clk_get_max_rate().

No functional change intended.

Signed-off-by: Triet Hoang <triet.hoang.dev@gmail.com>
---
 drivers/firmware/raspberrypi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/raspberrypi.c b/drivers/firmware/raspberrypi.c
index 88c3de9ce67a..1e98fc1457d1 100644
--- a/drivers/firmware/raspberrypi.c
+++ b/drivers/firmware/raspberrypi.c
@@ -39,6 +39,7 @@ static DEFINE_MUTEX(transaction_lock);
 static void response_callback(struct mbox_client *cl, void *msg)
 {
 	struct rpi_firmware *fw = container_of(cl, struct rpi_firmware, cl);
+
 	complete(&fw->c);
 }
 
@@ -260,7 +261,7 @@ unsigned int rpi_firmware_clk_get_max_rate(struct rpi_firmware *fw, unsigned int
 		 * assume the maximum clock rate is absolute maximum we can
 		 * store over our type.
 		 */
-		 return UINT_MAX;
+		return UINT_MAX;
 
 	return le32_to_cpu(msg.rate);
 }
-- 
2.53.0

