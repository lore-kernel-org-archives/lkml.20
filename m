Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794614547;
	b=VF48VmgKljaewVER5T0tzC5qZXA2gjJZCpBgTY05pBjdhKkqtHfNpDOb6Sx6P5minbNN
	 GNFKgnTBJ9MclnQoD99ZQoID89vSTB3tZ4VFn+WnW5PMA03HndCd+T9trP8OWbYHxdrgt
	 MUn3B22okWzNotilMjh2anHZelH/6YfyGrWPRy24rSsaUfzr2PtRtEt7UUotx6zS5At8v
	 9rbic8TMLaa5THfp/rGsnPsXT9BDZgqLAf9Jto9cIFAhcpxpVlsEa4+BXOhYmuOTX18VG
	 TtFhSEsbu8+aO7i2gD2np097G3ifvpYKAKdhVGki8Sr3qTWMY136kv5v5yFMyABPSNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794614547;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=kxRETnsBm6VnWvhVvC7Nguz7Rrl10P8nelMFGOXi2xg=;
	b=0V89gJ3YWTEvimw8NYR5jQT4uvTemG1c442BSmGpAFrWnmFB4PahR2bvfrvmcSWyVXbY
	 LIkIcZzHB75U/SIK1BxngM+lc1wA28qkc2cfA391DFwnKH1ej76f8XychwH2ASqzrTHPI
	 PQPFfoUiBsFREpNa+FAyau0oETJfQd1AdtMCMka0wwCJ42vSt5UD2uaiQKCONv/tk8OES
	 DR1CATTryrdmNRcOgcUYJytErRiCSKpe+QeMj83thBTOFean10wZlX6j+Oh9aWUJtvIrH
	 1rBESqJS0D4Ll0P/z2o8DukdHFG52FIgE+62GFZfd1XNOgJtdnXNTjagc8JYXGaq41w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N9buWkxV;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF3DA606A336
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 00:02:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF3DA606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N9buWkxV
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso2700337eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 16:02:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794614545; x=1795219345; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kxRETnsBm6VnWvhVvC7Nguz7Rrl10P8nelMFGOXi2xg=;
        b=N9buWkxVsPWUF7Wm8IEY+qKOjay49Vms7+Ng+fde0FZj17F8b1nXN9efqNsI16Ee97
         DkLj1XN+FvhumFynxFuMeMTHQLp9jIxc1FgsbO5GWu/m+yq1V0gsfr1A9S5bvywswmco
         7tArPcpFu+TwZelBZ1Yq9/qZIEawBJvanUdNTSSaAT+Mlv7W5vSf9WztzClX+NsdEo5+
         p2gBNuB1twVFSw0Tcd9/QsCevKIJOJkkf48/6PV76ObeCKS6lohNqb9EOag63uiTd/Vn
         jFvVsuOGUm7PZmxStFBjVfbysYfyErbWXYwnwU6RUed+dluW0Tc0VVyCtUoL2kL04mNo
         DSBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794614545; x=1795219345;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kxRETnsBm6VnWvhVvC7Nguz7Rrl10P8nelMFGOXi2xg=;
        b=t7ixT0vyz8w7ipBx9pWUtVhR66+C/B1plTBvFLfaTMXTLkKgo6E9U2HGFiXdLp/+mW
         dQoQBPOJr04q3lXpPjEZAlLNp0HUpQsefqVJZt+aQhxTy65WJ/TCUTI/RnO/PPsQS7tU
         p/yUFOQzLR90yy11Peviq8y2bR7O0bO42h/uIroF2rdd3/Tce+aWqZTu9BVl3zl7sj67
         rrraUPKcP4B9XbqYeqMQDGjatvZtGdG6cibgnjTQIZNR4yNls8DVFspY9LLKG9MbjFL5
         KxPLc8XCNX/AKUivPtPHcWHZwDdPgu20PZslIrgGbW3JSPGpBPQthLZdjpfLSYTJaHMC
         eliQ==
X-Forwarded-Encrypted: i=1; AL+hErEa2aOUHjIGBLR9lXcBdIOy02jf+Zr5+/YlND+0gSkowWtnTOqDnuYauqFjiifzibDn+BV+4vuILvwBsO0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+1iuRFaqz9Mp3OmiVSPOLyx47cQT7vIYtzk54yqbOUQmv2ccHM
	yXxoBtvxZUHh55mSQ1YadQ8C68S3864cI5k3VeXhehs2zlw0h3PyQD6g
X-Gm-Gg: AYBFou3CNTlX/cJAbjqIgnwAyRAo2DV0kOdbmueZ+MGCjF/+Zou1+xw7EbEncnZRDwM
	WouFG4rdO0w40UCLauflv3LUGAAhU6J+jj2qBtxB989k2ne1QOdvXMp1wLsSjzdY8N393Bwyzov
	CTv9uV5J6r+N/CZod7c6KA7jmMj+RkJrwL7QAUvzo2ZhasMkv+MVBBQqJx/+B+LuwfB4kvgZYls
	QHhTPbKXBuot6rrCyahik7a8dU0DfdV6q/fXfIF9E1N/soW0kuygcErWB1dyjoC/I8kCtR3hG88
	chN917O2iwrLijF/FiWa5t/dbotyh+NXZry1PWK8tRBk++3j/5QJuDu8Z2ggwQQ8ub2fkG1z+22
	UtLwaoedUierWvF/mH3g42gmnKIOc+wLPKbKhDQbEbxTcY9MxI4eQWwCROC7Hm4p7eTKayIKYTJ
	WNMzKzcSgW+hEh33hh+D4j6cr8QVCj0Lg5jpet3ITSq5VV17s3sc+zcEeMPkH9dGbVhsgtyVljC
	NdRz4JMPCMfkHKeFZiphYlgi+nzwAUpo8/wCkwVsknGocgqToSgMlMKiXfO1hDwnW5QvtfCzhIP
	dKEjGTuWJ9y76QHySdbsQx5+7QMAOrs20XWNBQ+axga0/QY7s7F6+Ztqqm5/qAS/2F7D8JXLruN
	0eU6YnRNZRlxQ1or//w==
X-Received: by 2002:a05:7300:bf9c:b0:375:370e:f1ff with SMTP id 5a478bee46e88-379671238f1mr3369208eec.35.1794614544915;
        Fri, 13 Nov 2026 16:02:24 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:560:7267:5908:e9a5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379565d269asm11309849eec.23.2026.11.13.16.02.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 16:02:24 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Andy Shevchenko <andy@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	"H . Nikolaus Schaller" <hns@goldelico.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>,
	Andreas Kemnade <andreas@kemnade.info>,
	Johannes Kirchmair <johannes.kirchmair@skidata.com>,
	Yuki Horii <yuuki198708@gmail.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] Input: tsc2007 - drop unnecessary cast in tsc2007_calculate_resistance()
Date: Fri, 13 Nov 2026 16:02:18 -0800
Message-ID: <20261114000220.1280581-1-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.56.0.679.gc527c65306-goog
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

The resistance value is already bounds-checked against U32_MAX before
returning from a function returning u32, so the explicit cast is
unnecessary. Drop it.

Suggested-by: Andy Shevchenko <andy@kernel.org>
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/touchscreen/tsc2007_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/tsc2007_core.c b/drivers/input/touchscreen/tsc2007_core.c
index 7660504f58ff..fc707e672424 100644
--- a/drivers/input/touchscreen/tsc2007_core.c
+++ b/drivers/input/touchscreen/tsc2007_core.c
@@ -82,7 +82,7 @@ u32 tsc2007_calculate_resistance(struct tsc2007 *tsc, struct ts_event *tc)
 
 	if (rt > U32_MAX)
 		return U32_MAX;
-	return (u32)rt;
+	return rt;
 }
 
 bool tsc2007_is_pen_down(struct tsc2007 *ts)
-- 
2.56.0.679.gc527c65306-goog

