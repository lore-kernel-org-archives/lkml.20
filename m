Received: from mail-dy2-f41.google.com (mail-dy2-f41.google.com [74.125.229.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2286F4F4CE1
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 09:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790675010; cv=none; b=GllWlnZC+GvHItOoGVhmMJq4JDC/2EQojOjPHL8wyw6uSIAvvoDD264vFofuOdVgzJuPq+cmNb9v6LHtAX7Io5S5qcHjovhJF9DfIeQUCGoHqTwmn9hyhLy1V3STf93W9rcPqxUz0eD3D6xMtHLTViw8nF8p7gGo4tjzKFX470A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790675010; c=relaxed/simple;
	bh=OdQgp1gL3QtlQrsCyzRykVIHp+LSRj6Wvz9fNOlGfq0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NoEa50X6BlP0JdiFMlLAE+6SWaj1qdYhWTsmzJmf67Ge48S9VHyPO1GiA43LddELJthMHh4cPfppAn8gqE2wzfvGqekttqbZLesqIAwtOiKFIFnEvJFuHuMjcIpwoG3d2j+0CXAdZ2a8t6oDPkqyLSa1ilq83SpPyNOUcoY70EU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nwiugqug; arc=none smtp.client-ip=74.125.229.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nwiugqug"
Received: by mail-dy2-f41.google.com with SMTP id 5a478bee46e88-347866278b6so941925eec.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 02:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790675008; x=1791279808; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MMNDGpCcXlVn+K/qHQzmlZIK4VMU5usMdqSK6Jfjkss=;
        b=nwiugqugEBxWXwJ1f6Cn10SKxcinGVJ9OPvnea2HzFntgMPpgfvr33JXiDSezYcdBL
         MjNgwzuVOkt2VDMRsT7QLVM+6j4zmdIVgvb5/dLd9ObzWU6iEnC5vaMpPCR8gEp/11Gi
         9yWy9dPgH/AWA7Mt239c3HbpRV+d+pTz2ip+i4CpqQBTl2GvCd7d9tgO6qupRsrJ/Bzd
         unbba4Hctgj18nwCA5cqAazUKh/r44tpbiqS50BW4LijFanSu4bWQoOM0gR3cVEylvas
         boiI8dUxcKKFY37xZhVNIvHjBR3q9hlnMy2dBfdtPiW58hV9WJ76BW596sFKSo7D8iMH
         iTeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790675008; x=1791279808;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MMNDGpCcXlVn+K/qHQzmlZIK4VMU5usMdqSK6Jfjkss=;
        b=ErC6dUeSPUZLIN5VCa9/Umrfe4nWPASUEiqQ+qRi6nqVV02ztSCdEq2dAGYDB0EyOc
         q/qkgu5BSZLcnpJGgI7IO+DB8jl8LeZibT+yf5ZGA6giRynim9M8G00Ts1L8Jn2BDEUA
         ZmMyvGB1Pziwhf7CXcarSYHOkjNT6xSUFeB+uXUU+oSxGHdZrZCX8bfQZ/YXRyiR9cZu
         9K6iYCdjCvBYYe0pUUzp80doSCoMu0/ZZ4ra7JiBYqDgIrUIGcujPjo+Ik/tiHQvYBuO
         P3cL4/bab4dal++B3ORVfeH1n3QOVz7J9wI11ETApQ5Vxb03cuqFxn4TIH2OkgKhvkkF
         XJIA==
X-Forwarded-Encrypted: i=1; AKwUvBxN632hThr7auZ106VC4OSzk+GRe1wF77TJ2lyJYQiRareYjd/5d6zFzg2byASOjr7XhbacVB3wtS9xPbU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIm4VLGFqjXP3NayjDJwZPP8BeL4epe4l0ZlaTGRlfe+cmbyuzK
	NuBUpY7xeEUCN/Qq16MnjftKGR+/mp18NmkW2/kayFBHiQB/cqWxQZm8
X-Gm-Gg: AYBFou163dAlvGf1AguADGFXLK9XTUbRfDyBbRttf1ribTw9YkKuvulZJhYpDE39TO1
	25wZRYemMbvKT8WICnGHfyGKjbKz7tIrjPPgba6Vga5Z9lnh2oEKN/R3Ol1k0qawg8HRG5xI1AO
	6Kx1OMMVRYTvdcs69XfLnmnFtHwxK4a6Fk5CX5VPAm+JeOwdqwTBIsinUC5/MtzLn65xiIZB+Rk
	NuFW5YeVNnQD54zRuoj7fLV/xszEsm3ePgfk+2eIQF3RU4b90CWyr2NWkLOcV7RCATiMs9dRXn5
	EBgUHyzSEFRMu5lq6XPrZTYdnQxcKoVW6obe315foctOlO+ysDeYqTI7cjQvFwbTQLxwsG92fon
	YbzvDgLHVmT5PZnbRQMWLENSx49I3Qtj2OYkn9SVTEvadkmEm6Gbd4DZArC8luWwhXEjN/ikE4F
	4onC0AA3nafMP+x0ytx+L6XWh8Ca17nvgaXnYxY16wIonnjxX/7bXXQMq/RA==
X-Received: by 2002:a05:7300:3e95:b0:33b:c29a:7c3b with SMTP id 5a478bee46e88-3426cddfb00mr11220105eec.0.1790675008092;
        Tue, 29 Sep 2026 02:43:28 -0700 (PDT)
Received: from evangelion-g ([2a09:bac5:40e4:11cd::1c6:2])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34141a4a5ecsm36247742eec.3.2026.09.29.02.43.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 02:43:27 -0700 (PDT)
From: Ayush Yaduvanshi <ayush37735@gmail.com>
To: Edward Cree <ecree.xilinx@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>
Cc: netdev@vger.kernel.org,
	linux-net-drivers@amd.com,
	linux-kernel@vger.kernel.org,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Jori Koolstra <jkoolstra@xs4all.nl>,
	Brigham Campbell <me@brighamcampbell.com>,
	linux-kernel-mentees@lists.linux.dev,
	Ayush Yaduvanshi <ayush37735@gmail.com>
Subject: [PATCH net-next] sfc: fix kernel-doc description for efx_ptp_timeset
Date: Tue, 29 Sep 2026 15:12:11 +0530
Message-ID: <20260929094211.48125-1-ayush37735@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove excess @valid struct member description from

efx_ptp_timeset.

Signed-off-by: Ayush Yaduvanshi <ayush37735@gmail.com>
---
 drivers/net/ethernet/sfc/ptp.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/ethernet/sfc/ptp.c b/drivers/net/ethernet/sfc/ptp.c
index 6ca9a75af01d..00cfd8d5b46e 100644
--- a/drivers/net/ethernet/sfc/ptp.c
+++ b/drivers/net/ethernet/sfc/ptp.c
@@ -193,7 +193,6 @@ struct efx_ptp_event_rx {
  * @wait: Number of NIC clock ticks between hardware timestamp being read and
  *          host end time being seen
  * @window: Difference of host_end and host_start
- * @valid: Whether this timeset is valid
  */
 struct efx_ptp_timeset {
 	u32 host_start;
-- 
2.53.0

