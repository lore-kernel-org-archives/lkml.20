Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794935411;
	b=E8moayWdh74qOl8eaLPPLm4zdDwE8qyYPzX5gORLs723ssctrOJHJ55aBfaI6zVircHq
	 fC2Jnp/xci2kRrQz8gNbozaGlmH/lhJsE18oCTuVKPC46zjgrqWHfOrbLaaRl1yyJh1j2
	 8Hrv5QtYFzDtYgeqbJoodfiB59dIrVMVL7GPfvgnQrb0Pc2obju1G/SKSxa6mVWIrTnMN
	 gsoLeetq+ut5Tbuqp5hzWiVzI1WkSPtc72Oz5YZ5/E1aR722KDZDDwlR4PIfpx28SyRfY
	 Dvl/9Pj38HzYFT4Wq/5yHpRVNXczpQUt4SCkozcXlEJXXG1vG6eqVwHI1RJDPHG7aag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794935411;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6huBfZmPJQPrAdDCa5Wk9xqnE2GPx+6fEpKq90an7Ag=;
	b=Ku/eoNpI3pe9F5Z1W9NlRGrdxzqc9D6pdA52ihK7J9iwznhDGv5TsM/xr+B/ooOlwHMu
	 6pjG9FTlYjh8Aw3OJ7kpJp0aDNpuy+0qaIDa2/9rL2n3EyAbaSFKEbhkdzfKHljJJTNEh
	 Fm8Fyp8XYMySH+zKYfoYNtpmH1/mpMrGmcnie2ePDi6//WFcbU0kXGrtFuU4JfH2WDZAa
	 52xkwQo94pkrUY5B1UdbTQGt2R0+deZ/x+A3SLhKOLLrFB8vSTMZ3IXYpq+AvZc3KiHEs
	 x0Dm1UEHErMS1zgaeKMk1dIm9XwgxQHPaMaC/PMjg6ICWophNq2ZkO0SkgzzBEQj9Ww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ntofaL2f;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A926060A2605
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 17:10:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A926060A2605
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ntofaL2f
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-49412eb1474so2643470f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:10:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794935409; x=1795540209; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6huBfZmPJQPrAdDCa5Wk9xqnE2GPx+6fEpKq90an7Ag=;
        b=ntofaL2fBYzCjynF1c8NmGqctSSh8ulMFmY9Qxcamd4g2662lO1CL/51dKeRj4sIzd
         asq/X1ettnzwnLTW05VhRM3QFS1ZqSI5yrs6CBtpOiVueImRsrmAWS4DtkFRBmS5o1Vt
         Ut9d3BnEu8iRJfiGiv53rGggN8yUmKIJeeR7m6lc0qWo/LB4SU/J8JoJwLh7IzhBMHfp
         nUv/raSDFFneQmY+YttiZio7ZvYyM90LghW7P6qvolJO74knLhgGCCoIT5elu3kSj3B1
         OK66m+1MhR8zEny+qXxObduPj9ayVgNOoANAGLpWHtHlzBv6I3D0vTqVk56N0uAc7dZs
         7fuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794935409; x=1795540209;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6huBfZmPJQPrAdDCa5Wk9xqnE2GPx+6fEpKq90an7Ag=;
        b=Vgk/mog/A04J+KdUuLCXCk1h7Uuxp6if4IkezvSKtap/TejliVH18uWaUysC1IbxDK
         4E/j8tzTll5BPwhYiLq0ADq/xApETSXix/OSsfgD3kOjBFCgpW41zumrjJ9znpTMcYuP
         IP46HCKhGvfxugPj03Yd2ELkPaRAoiQ1mbgz/USE8DGLWAbutA3LkqtQ5vXZt8IwUrzh
         tJ06iV+GqcL6FjrghpXVXUIXIOrxeinYklRSy7Ju0jvB9odQ17UhPEbslETNKa/6Mqjc
         g2kfT22ka+jYS3FeIeUrqjNkXNLhzZV+UAk6lYPgKeCawZoi22eVyHGrNg3SU1JDgxeX
         pyIg==
X-Forwarded-Encrypted: i=1; AL+hErEbFDYSHgJ2WxJSt+FmUM43AVuwyLmjQmsmeNfHFu2AfTjlwEdkqdbwhlJzrGyY+y/PT2JZgk74xhTxx3A=@vger.kernel.org
X-Gm-Message-State: APuU4Z+IVc8P7f48OaQqtoeQJbeibhAMoO7sdvRRJMFJPyAcCgNoEXSn
	RygKpxfLdGFjPOeIhzUBfcOS/dAX5zNumPyFqsCzRo/1Jt+VaNK93q0A6jBmzMcQ
X-Gm-Gg: AZFdTZdKOeSFSjBBMVDASfMO/AOtu7mRoTA5EwwqLevahdqefCXPhYHLqmWJdifJN0e
	91vH3NgTkAFnS2+rGocPKw69qcw5owqyGXDo08pM45M033AprrJIepNhhpvDry9siMVD2p436T6
	2EOBPv8BTuiYub3hJ9bwQ0zFHDSmLHbjnBK+/dPgGurD02EL61I+Y5kmvW1CWDeBCt81DeJJXBG
	Vt87b5J4IpYW8Sihk8WSaMHUUc4BC0c1h2WmSEfS7N+2W36bneEQjI1VK9Pih86mqfkjRN3la5E
	znlKNCodlEleCd5wocNEnDhAntFSBYvnkuu7CPP81LPoPq1QpEaZIP+vLRD/r9bI0Mv33xKfS/o
	P7nFFy3Hjyvwmh22Asj0V91j7Ic7diaJ19xuY37cn+fFjnLgLSLZIu+c3SI2KQ0Vq6ayadjHip5
	s2TyPRHvE/zvKLULxUH2VcUBTCaH4Pxb7DU07MmSEM40OowdLXU2zAotUI1OBL1S7sVHisdJFSJ
	5u7WG+j6nF/my1CunC/ILYXi/ZkZyhuMV67G6pkGuhoaJiNCmSNQfr3pdpD9pWjCZkkpt9t4YT5
	NLkY/ua5Fq6lHUeRObJ2LqfHbWXkCCvTH/U=
X-Received: by 2002:a05:6000:41c9:b0:492:b1c5:6db4 with SMTP id ffacd0b85a97d-4a63bbc379bmr82062f8f.26.1794935408907;
        Tue, 17 Nov 2026 09:10:08 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c6d079a2asm26828762f8f.16.2026.11.17.09.10.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 09:10:08 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Luka Gejak <luka.gejak@linux.dev>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Zong-Zhe Yang <kevin_yang@realtek.com>,
	Tzu-En Huang <tehuang@realtek.com>,
	Yan-Hsuan Chuang <yhchuang@realtek.com>,
	Kalle Valo <kvalo@kernel.org>,
	Stanislaw Gruszka <sgruszka@redhat.com>,
	Brian Norris <briannorris@chromium.org>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: [PATCH rtw-next v3 4/5] wifi: rtw88: reset the stations outside of RCU on firmware recovery
Date: Tue, 17 Nov 2026 18:10:02 +0100
Message-ID: <20261117171003.1840491-5-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261117171003.1840491-1-mehmet.fide@gmail.com>
References: <20261117171003.1840491-1-mehmet.fide@gmail.com>
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

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

The recovery after a firmware crash removes the driver state of every
station with rtw_sta_remove(), called from an atomic station iterator.
rtw_sta_remove() cancels the rate work of the station with
cancel_work_sync(), which can sleep. With a station associated:

BUG: sleeping function called from invalid context at kernel/workqueue.c:4722
in_atomic(): 0, irqs_disabled(): 0, non_block: 0, pid: 14, name: kworker/u16:1
RCU nest depth: 1, expected: 0
Workqueue: phy35 rtw_fw_recovery_work [rtw88_core]
Call trace:
 __might_resched+0x13c/0x1f0
 __might_sleep+0x48/0x7c
 __cancel_work_sync+0xa8/0xb4
 cancel_work_sync+0x14/0x20
 rtw_sta_remove+0x34/0x10c [rtw88_core]
 rtw_reset_sta_iter+0x20/0x48 [rtw88_core]
 ieee80211_iterate_stations_atomic+0x80/0x144 [mac80211]
 rtw_fw_recovery_work+0x1dc/0x2b8 [rtw88_core]

Use rtw_iterate_stas(), which collects the stations under RCU and calls
the iterator after it. The recovery holds the driver mutex it asks for.

Fixes: bcafcb959a57 ("wifi: rtw88: use work to update rate to avoid RCU warning")
Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
Reviewed-by: Luka Gejak <luka.gejak@linux.dev>
---

Notes:
    v3: no change; the station skip Luka Gejak found is removed by the
        previous patch
    v2: Reviewed-by Luka Gejak, no change

 drivers/net/wireless/realtek/rtw88/main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/realtek/rtw88/main.c b/drivers/net/wireless/realtek/rtw88/main.c
index ce65a1a80840..8e7ae747b900 100644
--- a/drivers/net/wireless/realtek/rtw88/main.c
+++ b/drivers/net/wireless/realtek/rtw88/main.c
@@ -664,7 +664,7 @@ static void __fw_recovery_work(struct rtw_dev *rtwdev)
 	WARN(1, "firmware crash, start reset and recover\n");
 
 	rtw_iterate_keys_atomic(rtwdev, NULL, rtw_reset_key_iter, rtwdev);
-	rtw_iterate_stas_atomic(rtwdev, rtw_reset_sta_iter, rtwdev);
+	rtw_iterate_stas(rtwdev, rtw_reset_sta_iter, rtwdev);
 	rtw_iterate_vifs_atomic(rtwdev, rtw_reset_vif_iter, rtwdev);
 	bitmap_zero(rtwdev->hw_port, RTW_PORT_NUM);
 	rtw_enter_ips(rtwdev);
-- 
2.56.0

