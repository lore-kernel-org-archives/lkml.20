Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794291735;
	b=ebWR4cuh5eVhbQMqqrdTkqKO4WjHaR9vlTtLl5s8vPiRsUh1nKInJSw40WtrzZu/jK78
	 X51OVCXhBz6JUfLaimMlXbnV/iF883dYRqjEY/rbBnZVAcOB4LIQ2ZC4mLDINn39jq8HK
	 86W6umE+nQzkmysUeZh1Ux3Tsg+2G06KkRAcoo3/KEyQ1R9qcy6w5bHLAbVDqv8L5UB/O
	 LILDH/hFIEQlCTwmSV5RQDT1sqfBkpuRtcR9BN/qU0EnLJ43H76+wR5hhgEgcNvagfAVe
	 blxaS/21uFNxNNB5QJKzDdR8x+20E6i/0t5Cnnxumcty/Lx8/ci7CtS/BH5aKEXFW2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794291735;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ESRZ14SnPt6YkQ1EMgE2FbeDzHaVw+GZ5fvb1zoWqXc=;
	b=wC1vuVOvNFwPSar0uWY+ylASQmk/H5fTJul/rQVnaouxgZeSLuz69iFuxAjquYHRtwzN
	 QbJRun5G28IDZAeOVdUavj4jU2VdCOoCOcqipEqY2xtSdQDxdRctVCYNj9w1Gp8XRuBqW
	 Ij7WLeasXxtbXR1pbzgXpNTzC41RF//B5gl0sUcfWI2e+AnWrwI/uFw8TLbRntu/n8IAM
	 twKuHYOVkNx2/kptooKaOUBWvseMTLvTAfGYqtqBCXQCI59HNNaVC9tqM86JTYS4UScWM
	 4mIITN+eViLXVAjx/qioPg6VffKXUqvPE0m5e+XQN3eWr0WX8yV44ICL211Hmp/r1GQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FIfHKbX3;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFB00606A321
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 06:22:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFB00606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FIfHKbX3
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso3379198eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 22:22:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794291734; x=1794896534; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ESRZ14SnPt6YkQ1EMgE2FbeDzHaVw+GZ5fvb1zoWqXc=;
        b=FIfHKbX3P6cMVxFdmoorQV0yAkpv33neZ+ZQmySe1MIsOhS1qbjkaznNMxSzRHhx8U
         gxWLlzRzszHqYQXjlZaUWuh24VoGITBPKGrQDHIMLxAKUCHB5tUvNeAXJdF97Ugws1AK
         YGcm8QyO7fSTh704FiAGJp/AjTWRreusbGE+D/Y61DeSEi1hz4gIJ2BKtlG4REJsgW7n
         U5M914z7+xB2p+SMRL0OgHb1A5QqQ6cU1GxvdeRJ8bcioKjgLYKBOG5x0A3HagA5AW7l
         t+1//gfZ+qsjecQsALXDfFl75r1k77PqpUdzxrRh2kNPNLAovbYKVjUzbOJwj3faUile
         pmEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794291734; x=1794896534;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ESRZ14SnPt6YkQ1EMgE2FbeDzHaVw+GZ5fvb1zoWqXc=;
        b=1PZq41cCWIh260K2SWsMxMLTY92bpQ6tB+qZ6E/MPP+ApiWeXEXbEYa+NZibErlH1n
         y/tmeIk5XVXQWq4+2gpn/KKRAJXozkT6zgzm5WS3Hi5KogiVWEnKrJzaLQgg1gEp1w73
         bOwLQf3K/NefmTbRa3j5Wc5k6DbnZh0/Dh1ovXg+h4A0uaYan77hrpe+qDd7Ux7aCo62
         /b7vFT01d+vZ0GdTnEo6bwm7ADVCtD+u5kZejpNodgnQ0d/H4gtemU9dfkcb3Q07rROl
         ccE9TOlOT9hp9OguE6Bybh4pGnC389cvKboVSYOgtyMeKfkruIFiJsDMpVgdt8U1ndsB
         N2YA==
X-Forwarded-Encrypted: i=1; AL+hErEuD+chqYumFv24JhOmSk7tK6PTfdr6lF6M4Aasdpyh6f406i9dYU9JwzdP+264x3Clr7pTc8Rb6jbcHZ4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ETnqc6oeRvtnwACX+jrDvBWR9meQaEMjijZUWk90DU/EVLPj6
	1iCMlHzjuBKiDNTGHqPvraUI7REaH9No0nthzDjTZ45kbL6iN1RcskYb
X-Gm-Gg: AYBFou0gQpRC+FP3JCq8XgsV1pX2AStjg3aIrso2pwcHYiFHDs6iNJYM/a6TqXm3VWU
	iqENohTS5pZamZLalcwHEOWsBDgq4ILhwbDz9WPhC7TYTcoRk8TtnPhblGGFLZKbRYjyD95RNzs
	M65tLtj/hszF3n9y2b3tzWUmziuOnMx2msGoaLlsmCfhAMML/vMI3MzJdOWS1DxBIrz7JhLsL0G
	ywO1jY+JQK3SRanfkNF9Ypnynv7nB67Uwg8DWqTR4Aqlrkh2pOBBEwgKgM4aJwPyapXSIj3uGUm
	zSx9734N0oYZjK2L1SoahQf2kFA4VrvXxlrkpaJjJijkqVOr59vmDSEf/v7WaAd9VeITEo1FXMe
	lxyF2RJpKteXkmFSkdmIslZ+tWXo83u79IQxnVwTl7Kc0NmpWE35DTpNlN8XutTyfT8lOfP3QWM
	1JBaIx/D8YPQWImoT0grwM8MzHsFSqZ1+2x4FW2PeEaETFlUFwQbRTF6pJsuNwGQ2KTxAhOUMbe
	5ivyx6HtwwUOS+BL7+k6K7u68mZCNfXhh11NBxfZr9bBnEQkOL6KKot/QfHBGkeFnS0r6tExQjj
	3XFl4ySFFhG5PCLcEFXA9niElB8PQMNlM+GG3xgfhRHcgi50ieIKpnPnTzEs9OAU/IE=
X-Received: by 2002:a05:693c:8096:b0:36e:53bc:467d with SMTP id 5a478bee46e88-375197c57d3mr2215435eec.0.1794291733383;
        Mon, 09 Nov 2026 22:22:13 -0800 (PST)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751d9f135asm4053625eec.2.2026.11.09.22.22.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 22:22:12 -0800 (PST)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
To: tglx@kernel.org
Cc: luto@kernel.org,
	vincenzo.frascino@arm.com,
	anna-maria@linutronix.de,
	namcao@linutronix.de,
	thomas.weissschuh@linutronix.de,
	linux-kernel@vger.kernel.org,
	zhanxusheng@xiaomi.com
Subject: [PATCH] vdso/datapage: Correct the vdso_timestamp kernel-doc
Date: Tue, 10 Nov 2026 14:22:07 +0800
Message-ID: <20261110062207.213676-1-zhanxusheng1024@gmail.com>
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

From: Zhan Xusheng <zhanxusheng@xiaomi.com>

The kernel-doc of struct vdso_timestamp describes where its two fields
come from by naming the members that define them.

Both names moved.  cycle_last and shift are members of struct vdso_clock,
and the array subscript in "vdso_time_data[x].shift" refers to a datapage
layout that no longer exists.

Name the struct that holds them now.

Fixes: 886653e36639 ("vdso: Rework struct vdso_time_data and introduce struct vdso_clock")
Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
---
 include/vdso/datapage.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/vdso/datapage.h b/include/vdso/datapage.h
index 5c4dac5bdda9..49d508126878 100644
--- a/include/vdso/datapage.h
+++ b/include/vdso/datapage.h
@@ -48,11 +48,11 @@ struct vdso_arch_data {
  *
  * There is one vdso_timestamp object in vvar for each vDSO-accelerated
  * clock_id. For high-resolution clocks, this encodes the time
- * corresponding to vdso_time_data.cycle_last. For coarse clocks this encodes
+ * corresponding to vdso_clock.cycle_last. For coarse clocks this encodes
  * the actual time.
  *
  * To be noticed that for highres clocks nsec is left-shifted by
- * vdso_time_data[x].shift.
+ * vdso_clock.shift.
  */
 struct vdso_timestamp {
 	u64	sec;
-- 
2.43.0

