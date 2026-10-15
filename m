Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86E6F305667
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 13:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792071126; cv=none; b=CWLx74HbWwAy1aVyZKhYlL/SIGsQAUaOfuGgtEJPi/aLr1eEuIm2jTyF2cDIybH7MC4QOIXwpfJEgfVkfLAGP2JMb3wsmhaVH1hgCVeJvSbp98x4r18X0bmkGanNf0jLVy3gxXQWn49GlYoeRKCQ94knrhFGOjsIr0RoOT7cO14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792071126; c=relaxed/simple;
	bh=yh7CxzzcgveUPvADfwlYHhL5S/vf5+PDVOFhtED17X8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=adnt0fx/YV8ByIe31DPyPkdDzeZqf97U/YnLJwvMd3Kme7UD5kKyWPzZuSlP8q7Ji4awyo4r/0BjTc0Koo67j929UaXwvJNYzqIyZ/+O505h5AIA07r42NJJZSaDkQTJ3i9iSW31x9GerxnFXxGgTGroZb5B7++jvrZzLxD5rEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i12Mmki1; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i12Mmki1"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48afbd35952so560923f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 06:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792071123; x=1792675923; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cyNEyKLQ/jrd+Lrq1caBuwPPaSfg+nPmt7eph+HDO7s=;
        b=i12Mmki119TiBMzzWABKcgv/bF16wdpD+BjGKFiR17jyuhq9js6IvVvP8d1u34z0qg
         e+Tyi5jaAiw0OLSGx5Onz+E20IE82EU2oyHOHCScyZQ/zTmnopCmPS24JMcR9+N+SbEO
         YUAymzgjFWlVM2GCnOtU1C//hf25Euc298QsU1yv4sHepmfyivjY0ejJSNN8ig/dENvY
         s8GcBz9wITmQKlteuzsaX7PXAQSK1k314h5dVifGJxVp6h99awA5I+ZKyROIxXFWbwow
         iJPPfq5N//UpN8XlV/ALFkjUWG3jrhzq0MjQFvPMX7Zy6CpMvfHDCwI6MQrrL7eA9yUF
         Xjtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792071123; x=1792675923;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cyNEyKLQ/jrd+Lrq1caBuwPPaSfg+nPmt7eph+HDO7s=;
        b=SPYsX3pyarTMLM7BqsSss90EVgdnHJprnj43fPE9D6KXhkKJ0MyTXsCYYSpJJaqq4u
         B4psuwGTob4FvSLZlQvtBl6lfFRl3Jq0lBRrf+F9B3bfWZfxT3O0djdgu8QpeZ35inCC
         FpAGTpuzKdej080qbdPEaw866QneCfSYBFH1w9kLA99cp8X1bDJpWt1RbQR4C6JjlUz6
         TsNMZReFhIlDxXa03+WvjLL/7Cyf823jvwjWO1ZQQgmIc6iRmdgMftKvGTVs+XT9Auf4
         gkIlO5X/1FV4PKLsg6eqpMcnfKXHW3EyI1YtJ1F4tfnspYizIZGO0qAT3sgzTih/xGAm
         SsWA==
X-Forwarded-Encrypted: i=1; AKwUvBzW+xIx0/tTP4S0oTloP1uvtGCmPPUydAJ4Zg/iNZBKGbaq4M+XEjLC0u68U4BhiEZiWnsUTt6yLW1/gec=@vger.kernel.org
X-Gm-Message-State: AFq9FYL+j1tDcEqZdyXS2ZGxkVgnI0aTWXfmc9CzrBSx0bYETRK5RqCq
	5pcxSNkrZE9yd9GO8SpTGyM2ePBelYLvVeAi+M2la5h1xIQJPVGPgSe2
X-Gm-Gg: AYBFou0PfYqpz133PU7JLdSK4nTeGN1IXm5cNCeBzByclDYQ0L8y+KtvEPbVIFDsTnW
	zIYcinbxK8qwwa5Zqqz6d9n+ef30pWBeI2wwTzamBffGKwp6s6Io/M1QOUaZOlpNFLNq6kocSEM
	i13M3GTBZMaP/llFYdyEfu4DaS2WzQRjFtBLWa3+Fp7VGxm1HRvnARmgAdLH2b0Xdyq6jxKpTDT
	Eaa4I/a7atRGplLYprwfl4dCw6KeKmcTvydkFqB3wByC9tAxdmtR+TCEjt5ocmu1XUU23hrdAad
	bCR0UTKzHHCZOYaVUcN7m6SbHqk1105m2hDvqx6BmNYYg65Bzcs/DTVCEQEC/2oAITgITZWLfbr
	cNJdZYhEQOSgNrYc7ui8sZ+UtITOJ5lPU3UUPSUXu4EfPuRg4G2yZn0U1DSDXgcyGjE0eGYmYVm
	hnNkliww/bf4QKut0qUIokeWu3BuulFpRHXng5ZscaWUH+aHpaZCstCzoR35fzWO8/rdV8PGzF+
	q5nSO/xGUH7za0oYyKOM6Wt3VY0dEJO/AcPVUt/KYnh56HJN1Tb10+Y4uPIkNGKI4HjSXFSsCon
	DflKFIaAv5+P/PumPnaaHS6f9sbGIaycnzQ2HqAw5rW2yZHOvs3z+R2C6n6HDyswV6kJwthIg6M
	Wl1qNnQI=
X-Received: by 2002:a05:6000:4106:b0:48d:f14a:9186 with SMTP id ffacd0b85a97d-48df14a92e3mr7001420f8f.6.1792071122317;
        Thu, 15 Oct 2026 06:32:02 -0700 (PDT)
Received: from ast-epyc5.inf.ethz.ch (ast-epyc4.inf.ethz.ch. [129.132.161.179])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48df5c3b89csm3301942f8f.23.2026.10.15.06.32.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 06:32:01 -0700 (PDT)
From: Zijing Yin <yzjaurora@gmail.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Zijing Yin <yzjaurora@gmail.com>,
	Haim Dreyfuss <haim.dreyfuss@intel.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH wireless] wifi: cfg80211: fix out-of-bounds read in valid_rule()
Date: Thu, 15 Oct 2026 06:31:57 -0700
Message-ID: <20261015133159.1499728-1-yzjaurora@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

valid_rule() validates a struct fwdb_rule from the regulatory database
firmware file, but bounds checks only the first byte of the structure,
the length field itself.

It then uses that length, which comes straight out of the file, to
decide whether the optional fields are present, and reads rule->wmm_ptr
at offset 18 of the 20-byte structure once the length claims 20 bytes or
more.

A rule placed in the last bytes of the file therefore makes the parser
read up to 19 bytes past the end of the firmware image. The image comes
from vmalloc() in kernel_read_file(), so with the rule at the end of a
page the read falls into the guard page and oopses, with no memory
debugging enabled.

A length of at least offsetofend(max_bw) but below offsetofend(wmm_ptr)
takes the other branch, so valid_rule() returns true having read nothing
out of bounds, and the database is accepted. regdb_query_country() does
not re-check the rule, and reads rule->start, rule->end, rule->max_bw
and rule->cac_timeout off the end of the kmemdup()ed copy.

A malformed regulatory.db is parsed by cfg80211's own
request_firmware_nowait() at init time, and on demand from user space
through NL80211_CMD_RELOAD_REGDB, which needs CAP_NET_ADMIN but no
wireless hardware. Both paths require write access to the firmware
search path and CONFIG_CFG80211_REQUIRE_SIGNED_REGDB=n.

Bound the whole declared rule, not just its length field. The existing
check on sizeof(rule->len) is still needed, since rule->len has to be
shown to be inside the file before it can be read, so the new test goes
after it. A rule reaching past the end of the file is now rejected,
which fails the database rather than reading out of bounds. That also
gives regdb_query_country() the bound it already assumes.

Fixes: 230ebaa189af ("cfg80211: read wmm rules from regulatory database")
Cc: stable@vger.kernel.org
Signed-off-by: Zijing Yin <yzjaurora@gmail.com>
---
 net/wireless/reg.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/net/wireless/reg.c b/net/wireless/reg.c
index 11665e0a7efc..44226687349e 100644
--- a/net/wireless/reg.c
+++ b/net/wireless/reg.c
@@ -679,6 +679,9 @@ static bool valid_rule(const u8 *data, unsigned int size, u16 rule_ptr)
 	/* mandatory fields */
 	if (rule->len < offsetofend(struct fwdb_rule, max_bw))
 		return false;
+	/* the rule must lie entirely within the database */
+	if ((u8 *)rule + rule->len > data + size)
+		return false;
 	if (rule->len >= offsetofend(struct fwdb_rule, wmm_ptr)) {
 		u32 wmm_ptr = be16_to_cpu(rule->wmm_ptr) << 2;
 		struct fwdb_wmm_rule *wmm;
-- 
2.43.0

