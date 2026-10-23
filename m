Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792724736;
	b=dlbm4xpfW49+Gmg9OcFCY+1LO1ju7OgpcjB47uOvl6mBCU6BG4jSB5PrZPJLLk2oOpvv
	 n1GsIsqzZAYLVRpUiBd04SotAcCn/xwooI9LXeci2j2JNTERIHR7aMnSBKKo/Ac7gWTet
	 4JgT5Kgqg9xqaRp8qc0Q6avQQyYJA3DMQ6cwvDEuDfK6nyTIC5jtoXaSnlqDYJokVyHoP
	 2+tG8MwDwhWPFwq/kJ0r4T4QEqiKvjyYyK6DzhnbHRPIdvu/WNjwKdBX1VnxyR3Y4hmrE
	 dmdgr+pab3yt8ZzpIot9rO5B6LDoAzp+n3cmy1LUppcsTWb4Ud1k2o8ygjECbtu6F6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792724736;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Subject:Date:Message-Id:X-Mailer:
	 Reply-To:MIME-Version:Content-Transfer-Encoding;
	bh=pR6JdMczIcQeiJ74SnQg1wuYi/2QUh8zcrrU9uckavE=;
	b=BHgD0e3Za2mfR97/4Q+fa5uv2uvfILO9p/973LBRh7SB4rz5IfTTbmmq4dpJSKGFHPyf
	 4UcNsuDsQ3WFi1gpWvT5Cd/lMKPXJMgiuApHNmNIjyYORKTVbEzglOhuG8gPzbl9lE1S2
	 qC8ZW2vAflu+KYD4XYk2pBrZxEx4+/H9/yEZhz7h7VE/4+53bagIXL5CmG1SN9kGSA3px
	 Q8Jb4QWmvfaZJZXTgfpnOL8wCMYI6TmXlwJCKNuzSGD6FZ2j07Ab603sU4x7U49048jLu
	 Tv3aA1EGqYGRXwEx5Aiu1k/Awem8p7i8Rv7v3nssPI9FojfmjGIrJyBkUIu3ye7GY6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DvXiqZD6;
	arc=none smtp.remote-ip=209.85.210.172
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F708606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 03:05:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F708606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DvXiqZD6
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8a064fac8cbso248786b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 20:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792724735; x=1793329535; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pR6JdMczIcQeiJ74SnQg1wuYi/2QUh8zcrrU9uckavE=;
        b=DvXiqZD6rI5baXmmtvAKcFD9FRamTQZj8xR8gKdDi6TgjciM8fj9LDl0IX/zUNSvZQ
         cRHDaTD1WALckJLUoGSnNxbtAy5WoLNsmhuSH/HhqrY1wAkJkH8plpoc2rwidN8JSBym
         mBAaME+fDitKULSbG/Pk5/JGnaOX/kWtd6J0ZFE4jn6lmKjGJaF4JHOvUtJ8m1sfBHAy
         8sQqeQBtsimO0wliuMMlxFLfth1RpxcvgY9l4i7G9l/QqPQt+maGbe6+kmy4qcTRCkEl
         3MxYfvv6/5cpgzSp+yJjRLUIakuPN5HuKEVmFEapX4P+pc5gkEnguFiqc/4cR0+EQiSt
         WVmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792724735; x=1793329535;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pR6JdMczIcQeiJ74SnQg1wuYi/2QUh8zcrrU9uckavE=;
        b=YA4Hn6D+5Xf4UonCkiGA0DoOgWH84E8GcwOmmb7gJ3j7wT2+zJ3eVFSI8Hh0ACUSU3
         0XGYSRoEnTScQl5mXvaciu7VDzxpXjTAnk3F/Hw4dpPsE9FxF9J1P+IrZPa0fJsvzPbX
         hjMVaq8hnf0YIh5FzoJhyHakuu8+atV/EvorFZFjdq0VV0GdcfzU+z8Musb0tvvdlvfg
         V1qh16abC80HOrFirSk4iXh+aDngjT18UaY97WYc+1Cb7MvbqsDehHhZOn+/+QdenDHp
         JwBeQYxkClRafvPsRzC/kA9HGrvQGxNLD4aXz3LKe/P3R0cbiOlUSuHqjbSMBeh1JWVf
         uQlg==
X-Forwarded-Encrypted: i=1; AKwUvBz2zhmVhjKGc+SYQQnaXUbqdsc8JuL6v/k/SyKOsXEzx4VdCHvMs+YD4ACM2hwIuz5GUIXljab9dmxVczw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJFopiXGXYyX8wmUMeRRravJmLrCjaS3BxfCJoWOTFoktRkt3vA
	h/v90WWEcFkeg1EUJ2JF/dhZZUUWt5sCyiy9CR6+2hszUyz1ax/wOBOp
X-Gm-Gg: AYBFou0P7Ed0ykdvrTbmGXK3mvwPJbwdMK5Svf2xhl428GqEVdo8EjEf2VJ+84m4ie1
	A0b1mjoZEIbW+zC915fxcLG1w7rcH9OAJ4fsTQbkXSa3dnr1RwdgL3BeBmNbaEm/Hlm2S8EAMZr
	8CasXNF5maIPXVhUG6pYoCNbEWA2wsz6vuJWp/GRjIZ2ObfUtK+EHb6aaYjMe/srGO0dXCYA76c
	HxSpiUKgtI54GU7Hmc/jJg/p3hvDq6EfDTkobhlpyrO3/L/IQc9EalYghrRSkERhzaiQdkiiR0n
	AVJW24w2vwwMAXd7imqmgFZfrJ5C1gHLzMoEIQo3B+mNNI2XuP+UOCBl5H9N+CVnjdsvr8kz6rv
	691FekDtUbt8tMpHPJnUNkDpXjt8F0tsJYVRYdmjifrN9ixDhMqbtFLMkvMwBDf/f5Hbgdfw7uS
	cqfZI9x3tlil5/vNM2FJFwQFVeo7Yoa7Kiu3u2q7ekWEDuc7diGbD9qWciJX8O0Vmyeo1fd782D
	8VbW+YZEPbu7JeIfowazRv8TmGtgNd2fWKHafTvu0FUf7bv9drPLRLCR25kr2jGxoWrkGywrw2I
	Bkug+AJdHjHYtNtGMLpb0fMg8KJyqNAsd63J36GBVRX/Pnvaq2eHjcvpMO8=
X-Received: by 2002:a05:6a00:440d:b0:881:b7d0:8dd5 with SMTP id d2e1a72fcca58-8a2c661aa67mr900925b3a.32.1792724735459;
        Thu, 22 Oct 2026 20:05:35 -0700 (PDT)
Received: from localhost.localdomain (c-174-165-208-10.hsd1.wa.comcast.net. [174.165.208.10])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a2c89d2e2esm215026b3a.13.2026.10.22.20.05.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 20:05:34 -0700 (PDT)
From: Michael Kelley <mhkelley58@gmail.com>
X-Google-Original-From: Michael Kelley <mhklinux@outlook.com>
To: haiyangz@microsoft.com,
	wei.liu@kernel.org,
	decui@microsoft.com,
	linux-kernel@vger.kernel.org,
	linux-hyperv@vger.kernel.org
Subject: [PATCH 1/1] Drivers: hv: Remove leftover support for old Hyper-V versions
Date: Thu, 22 Oct 2026 20:05:27 -0700
Message-Id: <20261023030527.1611-1-mhklinux@outlook.com>
X-Mailer: git-send-email 2.25.1
Reply-To: mhklinux@outlook.com
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

When removing support for running Linux guests on Windows Server
2008/2008R2 and Windows 7, one area was missed due to the code
comment spelling "2012" incorrectly. Remove that functionality now.

Signed-off-by: Michael Kelley <mhklinux@outlook.com>
---
 drivers/hv/ring_buffer.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/hv/ring_buffer.c b/drivers/hv/ring_buffer.c
index 72f30ab23d1d..d8b085dfdb46 100644
--- a/drivers/hv/ring_buffer.c
+++ b/drivers/hv/ring_buffer.c
@@ -561,14 +561,6 @@ void hv_pkt_iter_close(struct vmbus_channel *channel)
 	start_read_index = READ_ONCE(rbi->ring_buffer->read_index);
 	WRITE_ONCE(rbi->ring_buffer->read_index, rbi->priv_read_index);
 
-	/*
-	 * Older versions of Hyper-V (before WS2102 and Win8) do not
-	 * implement pending_send_sz and simply poll if the host->guest
-	 * ring buffer is full.  No signaling is needed or expected.
-	 */
-	if (!rbi->ring_buffer->feature_bits.feat_pending_send_sz)
-		return;
-
 	/*
 	 * Issue a full memory barrier before making the signaling decision.
 	 * If reading pending_send_sz were to be reordered and happen
-- 
2.25.1

