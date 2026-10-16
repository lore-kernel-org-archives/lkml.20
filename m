Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA5FD471263
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 09:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792143213; cv=none; b=iNytBF8cjt2Zqa3vwsVs9M4IguXeZY6efTSuM4xIlPVeXLqKVREZvGB5y9SbUKIOvmLJ1P5D3IvIYcZJ6inMPzdLCj+ZNs8Io4IAAkoG+Vo6usau7Gw9PLv9piNSkaN6B18XMMcItOQ7jBGielyKoqLEGPphYzy2U9ZtW9THVeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792143213; c=relaxed/simple;
	bh=diKVivvG+qd8wFFl1I74SYW8JCNICtK4clPAuT9dBLo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PQVFkaGkb6n32l8XuAaE1lQC/6YFXrnQrhSOP9iLwcymuiygasSOJ/aqbO/Mc2hmuJklXR9x8L51d78GRQCTbz7RwpBb0OKIdHJiHlSTH30WzDlA8eXGBENfSqvbvk5GGokhublqAl5aKtVX9up2EMF8xsPsEaZWAtESMsdQPJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mkoIY8Dx; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mkoIY8Dx"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-35d7fa491deso818178eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 02:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792143210; x=1792748010; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X/GQXN80gmDiH2wSRWyxE0rjeZMAPw7yjAOGz6QmUEc=;
        b=mkoIY8DxbzzpROLENPREqJAARWhsLx2Ahzg441vvKD7j/AuD17mVU/h+nF53L2hMdd
         aRzRn44fIXd1OV+bf9CNEZLl7lINPnbV6OIm2z6cWNxTexDaQLquiWUXtRZfCjSzi3oK
         gA4jdg+yJ+iOSxUkuoGIQUM6e59YQI5e6iYjCkLawTPifZDXqFdwBceKVqyrLyCRBJcL
         EbdyVC8gWOHdnLWCgDLD+edaJJiRWXOxqzq0+GypQNod4QqxMwAOcJw2cRmjYXg2p5AP
         9tI6S4JBiDviZgKlFhVT1z1PeRjNCzNVIdEO5yizltYFqMbWv6HT80yvGxsDYUc8577u
         yu0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792143210; x=1792748010;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=X/GQXN80gmDiH2wSRWyxE0rjeZMAPw7yjAOGz6QmUEc=;
        b=iMCGxBlTr31Btfgm1xoJtwwnHinQ5g0KyAnzYlR9jEWBOZYd1Efk9nTKxaD12O7USk
         twCaKPrr71n9tXbObpO9JTbLyd/P8Rz55ZZ8e9FhasPiTinBoyz7gfVz9wfEMYjOr4D+
         tXMBNvbQGFMHt6FAF+MWMc/GcHzdlZhx8SHaS0omHa2tVpimjHiTxWA3eF/pQeHwYe6r
         DmrWciRkKrJ6luqhZ8ftGCSywNegddsSYhXR2lY0qpK2wgC1P5D9HdzjDa4jKbjV1upP
         Flz6IEplHnYB4bGm5pJwZ20vJvB/Ntzl+QRHD33frKc1kM7g0dcCGVAQjtMGkl7GUZga
         wi2g==
X-Forwarded-Encrypted: i=1; AKwUvByxU6FRIt4SIFY5bqJQ3UJXfrIYsZrm4oHcM4rR59kpszeVIPXEEoMssnOdDNoYvs6inLTMHn1WHa4GZec=@vger.kernel.org
X-Gm-Message-State: AFq9FYLgP9O15l4Uj6UlyWU9+YkbR9hKzZ/V7iqXFJcDVy8wmOyYTJCx
	LJ3ps6hTAhYXWTvizaQofZAfr6pXiW8iYTSpxZ9gO57204GOB+vodB1k
X-Gm-Gg: AYBFou1wtGw5BA77u6h0KErNRBNoqAQGuLcLEcStm4JCQZhzh4esvyGD5a/KJEK2D3J
	wLXXXaIlWeXBsO3Ncc51Ni1vrYaijs0gRpdUExJAo89uOAK3+U/6mx78E4VXgHiL8YQMcNYxojK
	PpeX4f4yPK+sAEZjozc+u2qV+ntfPCr6skXyp+qjpKA3btcqEgvY5wOWNU3mytzVQ5uDEubro0k
	ZooY8Tgr0tiiuAAAWQ2doThadDapVpuk00d2JfUwIGaMlG2MprZxQnmYbFPUMcYCgGRayq/NzZm
	5cd1lbaEKHJMFFL0b53/KfuOkmALepIpA+jC7m/Vb2DdIU0sQhb9QzDv01gitFuxqD3W3o6f++Z
	G8nffLLsV50E58nvH8OzG8NgioGn8y8LX6y68NzOm2tIKzr2Y8OL0DZLyn/U18W4HcJovjR/NE0
	k6ceAjCSz/aBiZrnpAr+/XjmrV3r4PyeyHlKO6r1uWB0k/wS+r8OhG968gwGdazXzswz31v/pf3
	3jA8xKdowC1qbE1oGjwmppfu8E=
X-Received: by 2002:a05:7300:3aa9:b0:360:aeee:9b8a with SMTP id 5a478bee46e88-360aeee9f90mr1700989eec.8.1792143209602;
        Fri, 16 Oct 2026 02:33:29 -0700 (PDT)
Received: from chitransh.. ([2401:4900:9390:ec4c:7580:f3c1:62f7:b0b6])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3608308a87csm8697922eec.28.2026.10.16.02.33.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 02:33:28 -0700 (PDT)
From: chitranshmandhaniya@gmail.com
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chitransh_Mandhaniya@dell.com
Subject: [PATCH v3 0/2] platform/x86: dell-uart-backlight: stray byte recovery and cleanup
Date: Fri, 16 Oct 2026 15:03:00 +0530
Message-ID: <20261016093302.55528-1-chitranshmandhaniya@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261004110333.5790-1-chitranshmandhaniya@gmail.com>
References: <20261004110333.5790-1-chitranshmandhaniya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chitransh Mandhaniya <Chitransh_Mandhaniya@dell.com>

On some Dell AIO machines the EC occasionally inserts a spurious byte
after the cmd-echo in UART backlight response frames, causing checksum
mismatches and -EIO.

Patch 1 extracts the response parsing into a dell_uart_bl_receive_data()
helper that always returns bytes consumed. The caller checks
dell_bl->status to determine the outcome (-EBUSY = incomplete, 0 =
success, -EIO = error).

Patch 2 adds the stray byte recovery: on checksum mismatch for a fully
received frame, drop the byte at the first payload position, shift data
down, and call the helper again to re-fetch the checksum byte. Total
consumed bytes are tracked and returned to serdev exactly.  Also
switches mutex_init() to devm_mutex_init() to fix a missing
mutex_destroy() on the teardown path (noted by Ilpo during v2 review).

v2 -> v3:
  - Helper always returns bytes consumed, caller checks
    dell_bl->status instead (Ilpo)
  - Track total consumed bytes with a separate variable instead of
    returning len, so serdev gets the exact byte count (Ilpo)
  - Guard resync with resp_idx == resp_len to prevent memmove on
    truncated/out-of-range length field (sashiko.dev via Ilpo)
  - Switch mutex_init() to devm_mutex_init() in patch 2 (Ilpo)

v1 -> v2:
  - Extract dell_uart_bl_receive_data() helper instead of using a
    for-loop with pass counter, call it again after resync (Ilpo)
  - Split into two patches: refactor + feature (Ilpo)

Chitransh Mandhaniya (2):
  platform/x86: dell-uart-backlight: extract dell_uart_bl_receive_data()
    helper
  platform/x86: dell-uart-backlight: recover from stray EC response byte

 .../platform/x86/dell/dell-uart-backlight.c   | 71 ++++++++++++++-----
 1 file changed, 55 insertions(+), 16 deletions(-)

-- 
2.43.0

