Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793514243;
	b=rhXGGq4/bWuN7AZ980PDTGvjnOW4Ey7IX7VTF2St6AeLPM2vDDpAfGBSTS39Wa5ToO68
	 mhjucci52NBwEJP6eIpSpczwkJXKVeKC2TSt3j9CiB6GKe/YE9zPOQrmOGjucGBSV55yO
	 OQnLgtfeQzVjpteDd6iG1EWlUVQkvsaZuRcaMWAuVt6xcNPxGnjTYY9TZplGtYG+WF5gw
	 bi+PwfCAx3LGkr5hx/4UsegQyFAEDIVYLubOmIdEhBzQDcTGU2rQYTsFOhZXQ3wfuPove
	 4z2DAHqBL7m1TI9lALN4WMxbLyej0hWKSfxzWkCsgg9cOb7SRE8T567JuRZvxfSKNkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793514243;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=U6RxQqnraCujnuFyGwdEGaWyvDwvEokaINvEdRIrFx8=;
	b=Pq3xuEHVZEwV/lKb+51Q/7EEOZeLd7133tGRim1zOyyGr/mMC4cKtOVaBh172/mILm5e
	 Z9zMNCyzIxv8zrqLsbbZZxLXu8rdlmiMRz8maIDjnz28GjmFhiNQCFGYEbxx4qkLlB1Ds
	 WBb1XUDgM9Ka8HDL8kkn/CDDVWp6D1ejImphKX9HU7ViAy5v1WHw2Sezb1P+2nBQVvwiy
	 Kjqxg96yMrIKEmCmDJmkueFw5OGhviwk+sJ/70Zdpx8cRwuLSZaNu9tvrZal2AMFsBu5k
	 mwgECMBcuda3IM902g3mFUSAfzlsbxAHDB6meoMaOb9eb1VrJTbM4/j0jBBzDSKqkGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g+y36DUi;
	arc=none smtp.remote-ip=209.85.215.176
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D13DF606A325
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 06:24:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D13DF606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g+y36DUi
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cdb15cd8558so218342a12.2
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 23:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793514242; x=1794119042; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=U6RxQqnraCujnuFyGwdEGaWyvDwvEokaINvEdRIrFx8=;
        b=g+y36DUiYCN2ds2/LESOdmzu3PGF7A+GvYMK9x/7YlArL7oT2RqzCbC7NN9x/SDBTS
         0oWBIi2bEnAH5Nah+GO8HYiV15KdoeWvW5QVplVNIjSksNN2uAJNsb3vKGBAPYHzn4Xj
         BHSLh+nlOiG/lv3XlLhUjtn2lxC9/FqCn5yE9kcQJxNnZSw9PDTApP2u4ezbgagbtHmq
         atRhM5RWODdjrTMb3hb2E6u34RoU+0wT9DBcm1vrFr9g1jD5mN/pUXFaY5ZETx9J7efm
         15nIY26eD7WlMkmHwyhpHBBV5YnyHcR3297OFdiFvMvfdEGQdRdWWKBnUC2yn90ENDOf
         /XwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793514242; x=1794119042;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U6RxQqnraCujnuFyGwdEGaWyvDwvEokaINvEdRIrFx8=;
        b=z1schNomTfMd7TDh/RBJtSR9VK6WaW7wdnfNKt0M5+G20um+pAlkQ+0u8wwVXqEUgk
         q1x9G3VHiYFMeuRaSkl8mvVpsnq2WInlnq1TAvMbuKtKlXqMqOCuIPym9SAVZlkg5ajP
         1Fu9Bb7YjWRGF1QoXiof369bTEE4odkc27vTK8zgiSD2YBf9aHkOBjaRvPIFQw5M2Tmn
         6wWH3pZZlMLBMoZVG1uo0k7VxKWEEA71UiJ+0jeCCHKTPxXTPCLJZWi00yWpp0c86Jha
         jHhwTB2HbM0VEwRqLjWyJUaOpA/6UG48DxyG8FV3FaJra8Iik1crDgJawESUp/bRNQh8
         n+rA==
X-Forwarded-Encrypted: i=1; AKwUvBzHsPABVbo1NCnEopR942C4/YRsXBolqAKJACtoARltDJy8ADydy2juKMsz8Q4O8AJonozruV5WMeFDoWg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9r+I85ofKgs/HlNpgji3821YMmVmzNdbBF9BjWhKXKzteROxel
	x1UZFfDUKzXBudXSb24Wr55K6M5ufrfcMEP7FmdrY+qyLzRaDJqtkP3e
X-Gm-Gg: AYBFou3FYQNb2VigxD0wHMH6Ri4QvPOisSiHZ1IaS1nT/2/VLTOy64aJcDvvu8zzJ7z
	n2KACyUNjDkpCIk+6/GWopy411ntLxFfrghXt6YOT6Yc5kDN9fpo5VDOpder0CsZgvsU9Y42OTf
	iTS8RkRwkGz70yBnUyVH2N6dnRCgin/xn99z8UP2UTENV78Ei3QfwFtOoiS9V84q0i6b3IMTIyc
	ORr13HktWDiPKgMpnGXUpGpwqHyD7T4KFt7LnOc1UCDTGFsH38WALgoKpK2JJaI+Q5ZuhDmX6zX
	Ph5gDHErhxNKd40s+Ldbw/1JMl9Pik6kcuNiuIX6AMdB1ktUUMb2GaQlJNzYkXAKPmylfb4Jw9P
	YhlB3MuVul9iuM4pz2mrVNG+v8Jltdw3S49feD+QEpMbn+zvcm40hIXP2b7ETEGxdo4OLIx4LfT
	MJyNMCiW2fZeF64IlHwqy4jI1GjWDf8kCZ6kG9MWWfzRola6hLvIpZQ3/4La3SJbq6bbyQcar6c
	CIty1WInXlpKpwN4jv3CCW0KdbGzI7woYoihM7ZkmITPUl2kB/JQQsIGz9+Dexcgv+kqxreRhG/
	fu89Tk0QyZ21cUo/vKqOi4SQ50b6mV1w7Opjg3w18HOX6K0j+Gj5BJnF54KvwUz/wlj34iB4wz3
	pr8SxlevTvX/gQ8/WFvLaCsRyKGhXGq1BJC7l2acaYaKMTKRu1R2EWUaNmjEDfQuO9TfxLbtpMa
	dmHkyxl4JUrG8VAAIzhFE=
X-Received: by 2002:a17:90b:2803:b0:3ac:96a3:77d5 with SMTP id 98e67ed59e1d1-3ae897e066bmr4668404a91.36.1793514242027;
        Sat, 31 Oct 2026 23:24:02 -0700 (PDT)
Received: from EAIT-H54D9Q2FJQ.eait.uq.edu.au ([130.102.10.191])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e2a703esm14092486a91.0.2026.10.31.23.23.57
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 31 Oct 2026 23:24:01 -0700 (PDT)
From: Yu Zhang <yuz08559@gmail.com>
To: Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] stm class: clear output->pdrv_private when the output is freed
Date: Sun,  1 Nov 2026 16:23:43 +1000
Message-ID: <20261101062343.16629-1-yuz08559@gmail.com>
X-Mailer: git-send-email 2.55.0
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

sys_t_output_close() frees output->pdrv_private but leaves the pointer
in place, and stm_output_free() only calls the output_close() of the
protocol driver that is bound when the output is freed. The protocol
driver of an stm device can be changed while an output is unassigned,
by removing the policy and creating one for another protocol, so the
stale pointer survives a re-assignment under a driver that has no
output_open() and is dereferenced again once the sys-t driver is bound
back:

  P=/sys/kernel/config/stp-policy
  L=/sys/class/stm_source/heartbeat.0/stm_source_link
  mkdir $P/dummy_stm.0:p_sys-t.a $P/dummy_stm.0:p_sys-t.a/heartbeat.0
  echo dummy_stm.0 > $L   # sys_t_output_open() allocates pdrv_private
  echo none > $L          # unlink: sys_t_output_close() frees it
  rmdir $P/dummy_stm.0:p_sys-t.a/heartbeat.0 $P/dummy_stm.0:p_sys-t.a
  mkdir $P/dummy_stm.0:p_basic.b $P/dummy_stm.0:p_basic.b/heartbeat.0
  echo dummy_stm.0 > $L   # no output_open(), pdrv_private is kept
  rmdir $P/dummy_stm.0:p_basic.b/heartbeat.0 $P/dummy_stm.0:p_basic.b
  mkdir $P/dummy_stm.0:p_sys-t.c

The next heartbeat then runs sys_t_write() on the freed sys_t_output,
and unlinking the source frees it a second time.

Clear the pointer when the output is freed, so that a stale private
pointer can neither be used nor freed again. If no protocol driver is
bound at that point the private data is leaked instead, as before.

Fixes: c7fd62bc69d0 ("stm class: Introduce framing protocol drivers")
Cc: stable@vger.kernel.org
Signed-off-by: Yu Zhang <yuz08559@gmail.com>
---
 drivers/hwtracing/stm/core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hwtracing/stm/core.c b/drivers/hwtracing/stm/core.c
index 64a9eb1..5b7dfa3 100644
--- a/drivers/hwtracing/stm/core.c
+++ b/drivers/hwtracing/stm/core.c
@@ -345,6 +345,7 @@ static void stm_output_free(struct stm_device *stm, struct stm_output *output)
 		stm_output_disclaim(stm, output);
 	if (stm->pdrv && stm->pdrv->output_close)
 		stm->pdrv->output_close(output);
+	output->pdrv_private = NULL;
 	spin_unlock(&output->lock);
 	spin_unlock(&stm->mc_lock);
 }
-- 
2.43.0

