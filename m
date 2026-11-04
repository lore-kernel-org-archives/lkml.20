Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793806622;
	b=OHF7+/pngvASwQ/HiaVhmwE1lHW2PaQWZPQbT9nCi/llQcUpBFaeRRzUevpEKKAvo5Wh
	 MnauKicihAP2SRASlWwwL2jXjCz958GBddTjxdyTufMpFZtYDiXnQMq6/GRYwa8EaM1lK
	 n2sxipWHJ5tnzmGoE9/YPOm4mO7r0+BJ/00ZPIWQNMz9wsjYshjg8Pomdr1jfiJmsey7e
	 QvuyqgJn4HUEQLRye0Npulpu97NNDU6ZdWahXTR9Fss3lwqtdweN+gXmLglhIdFUF9RG6
	 axH8awI+G0bUuwTH8caT/pboxavMRHNpgInhTJ1uNN4eyMaHrr1vjzk5WqvuIvwTe9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793806622;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=6pVKBiDnuyn00gja3O0ypStn3VleiYJo4KrnFl0KpQs=;
	b=IS2yN6BFoT2QdkWx8nK7k70EfLEfb7F1/PL3YnwSSh0r/TX6Rph4cLWBMKdvHma4doJv
	 VV8j1o67/rgvjSpFBH7bYo8WFnnHXoKK6/VYy51nRmrd+K8biu94Dy7pvY9sbBcaVNwjn
	 GCt0oa/tEOGEzUBfCOfO6bqgCx4dCCNnyNu7XYr0gyAgYJPVnfTCcSnlIeQrUDxE2NhUb
	 v6MLrCyH0XiYoiQZI+ADgSGAJELkWmHRWKMe4+HLMyywmQV+NDAYUOIulSkw4btsoZhlK
	 2zkjcYj3TU6BgUXamM+mt4cpUuZ8gKjYT5nubOYlw2+GakeKmt19+QkElqtYcROynAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=HqLcrtjh;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AD91606A336
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 15:37:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9AD91606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=HqLcrtjh
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so8791765e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 07:37:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793806620; x=1794411420; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6pVKBiDnuyn00gja3O0ypStn3VleiYJo4KrnFl0KpQs=;
        b=HqLcrtjhJZ1T94YpELeXGYZilAVbdMrRKmVDDPsN3LSS7WtFZeALDzz191BR/+9JeE
         RVitdkFFX7SdSWBZ+sK0I3iuJS5h5q9RolnuGwQ5beT5EXl3OKr5LmB2OyRJObiLKnBC
         RCzHcxYDgQ1XbRFiyfJ1j/S0pWStK0RbO5xXf6lv3gWkdSNscG7cjtPF1G4/bUBAI03I
         EKhvrtPv+v/HyHf2hHAgh4eV4qbLKFc5wvIcGyg6TfDldIrXp1Gkj2n2TnC/rXqOrkhF
         h0whlrx/OeZU+qNvU75kNKxETgUAwg2Dotq69nijRnfTz1L9qdTOTGm++GogutUGG4j6
         KQaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793806620; x=1794411420;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6pVKBiDnuyn00gja3O0ypStn3VleiYJo4KrnFl0KpQs=;
        b=zkX2cfSJJYWDAWeEhUDu2tTsWzFwdrJelasvQRzDhJiP4OUD+IRTJPilXlL2HWjMXD
         CW6hZxAQzIYpEe5MznH0BTsQZVOStrvH3piu02hIDnPlRF1ciVjMqCu9JJVFOO2lnnyJ
         M7D16z50xO1d3Ft6Ww4tOt/u3lzwBg7SG+zX4G+Q7UBL+Lw8LgBMFFkCqSmn15fMdaM9
         D5MVJJ/WCQIonRFOyTXfqnxRTx4qnfbxrb/imqA5hYYGmZwH7ZOK94xoT603g0tt+071
         rHb2JVKdWdbz9/N5gKoQfQTciqbBcTSNP1Xe6gED3iCuPanNEQqHJVqvQMLQSrbR817I
         b1Iw==
X-Forwarded-Encrypted: i=1; AKwUvBwJekuw08CAtokKUqoDdFy8C899tEgmUTD1Yuc7ABCevpxIHV2iJuqahck/gr4P/bV28/i5mJl6ucrNtQU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+/iBryZZopvhIPkpKleR3UMZjpmUHfcd2Od/P9SxTT8SHs2WmJ
	760dbhjD0WlQl/Rtmtu6m6q9QBCHw81BU5hNyUIcycaVSTuEYTjm4i2bCBqhqhNvoJo=
X-Gm-Gg: AYBFou3hditiy32/HwmY+oQLFMZ3IuyPNIo/K+aIC7OFTZRVLSNgud52dwRm5YY49aY
	Qd1vX4arAD3CZHURZJIjTtIUVem0eHfKu5SwPPYssJzPhkLMs2iSeepL1lOAV6bbNZL88qDGZNl
	gKf0w8x73RNBRTsIgTouvAYu2ammyL/mqtT36X+M0cWz2cUihvsuH3VYRvqd8XbSeiiRTdDJEAM
	U0DoDLkDm21c+FCRaEAkB7OK+HKduABU1lX1Nbw30droFe1k8UGAxo4xF2TpozQ0R/b5AS+LY/t
	QBTkcPJywmp1eczyDzwexaQ16O5uGbO19j5uhnngBJUVk9bq5WWeWHfNb/o2W5ODFYjJ6oXR6yr
	3zrG99lU3pD2yaFoLMUBDslrLesAspiKrp5yjLqDCQdGL7H+K5H26hFr77ZqauLHqZy7rHlxHqb
	3rnXml3k756SJgL2V+CeaF6S+o58xAAfNUjuhwVFbewD6nS9UQBsyVi+U6RdY+SC5pNjzu54hEM
	gRy6uu8ANDU3r3033agGYLimrht4HqmtAt0Rw+6dqIBaZjjt/yR24X5Ni6H/kPttYsK4tsuo/UT
	WgfpbHqBjmDqKYkaUI5bEhib1EB0rHdstLc9Qy4R7EQLBPowXacqrQ==
X-Received: by 2002:a05:600c:8b55:b0:4a1:f736:79f3 with SMTP id 5b1f17b1804b1-4ac17ffb30fmr363654655e9.5.1793806620019;
        Wed, 04 Nov 2026 07:37:00 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b43d4c9d4csm82566395e9.12.2026.11.04.07.36.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 07:36:59 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 04 Nov 2026 15:36:35 +0000
Subject: [PATCH v2 4/9] coresight: etm-perf: Fix sink device reference leak
 in etm_setup_aux()
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261104-james-cs-sashiko-easy-fixes-1-v2-4-410c03941267@linaro.org>
References: <20261104-james-cs-sashiko-easy-fixes-1-v2-0-410c03941267@linaro.org>
In-Reply-To: <20261104-james-cs-sashiko-easy-fixes-1-v2-0-410c03941267@linaro.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@arm.com>, 
 Yeoreum Yun <yeoreum.yun@arm.com>
Cc: coresight@lists.linaro.org, linux-kernel@vger.kernel.org, 
 James Clark <james.clark@linaro.org>, Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.15.2

coresight_get_sink_by_id() returns the sink with a reference taken by
bus_find_device(), but etm_setup_aux() never drops it. The paths built
for each CPU take their own references on the sink, so drop the lookup
reference before returning on both the success and error paths.

Fixes: 226443925887 ("coresight: Use event attributes for sink selection")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-89fe1ee7-7e2f-4c78-a8e6-93a1a260015b
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-etm-perf.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
index 86ec4708b7e4..bd302ed1543a 100644
--- a/drivers/hwtracing/coresight/coresight-etm-perf.c
+++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
@@ -511,10 +511,14 @@ static void *etm_setup_aux(struct perf_event *event, void **pages,
 	if (!event_data->snk_config)
 		goto err;
 
+	if (user_sink)
+		put_device(&user_sink->dev);
 	mutex_unlock(&coresight_mutex);
 	return event_data;
 
 err:
+	if (user_sink)
+		put_device(&user_sink->dev);
 	mutex_unlock(&coresight_mutex);
 	etm_free_aux(event_data);
 	return NULL;

-- 
2.43.0

