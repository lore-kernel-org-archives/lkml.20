Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49E1D280331
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 01:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789434833; cv=none; b=ukqxEsN0zPL2vV1fFMbIVPlsBXf3pv8u0+jmJT6tq45syjd52daTWSFsvBB2Xj8oeHB8GVuFEL76kFce8O/QSqtN0FNU8eVLhjJEOx7SOf3PoMbE3MSu0sgTtLdNSDUnT7mqR3yz7k6I47/rJT2GzGAAQi/i+3OouMLzWBKMrZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789434833; c=relaxed/simple;
	bh=ZdUW3KC9naKIDkAGSiGquiNX4Ac1xMCc60Ruj3r7Cig=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fTJN3nN3MrCWx6xbATFy0OyYwZ9X2wWblae5n/PAbEhIKRDWDJBNfsA42KaSgxujbpYpqYKE2fCpzlE0bcNe0eYKkXPf7paXd+ftNb6IL76Q6729hTERdBjAh8fJQYQiM4Et+XI0tPs76NJa9+kTxfvZ7zWzXMk6SFmNfMOsZ6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vb8fIm0K; arc=none smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vb8fIm0K"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-52fb766bfd8so32081241cf.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 18:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789434831; x=1790039631; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9b1lBFng9K4L8nuKAcvrbbiVs0Np5hE/iDE9F6xQlyE=;
        b=Vb8fIm0KqlltjzUsM1wstLmLVsA+WIS4etrI/p4s20tVsFRITsJB0LVLNz7yudpc8a
         TNw0sLr8W1EGghpJu0wtauIDtjoIz3QDmBomwVaYFCVBfwPj3V5BUlp4dJX0kD8gBZHx
         Z9LafUkJmUeOmGl0bjNADjIRTE8SjfLkG/RZnAmyKdBo+v8wfeNoKL++T1u7ktb9Htwb
         d121ma3Qe0ayoZK+CWC8U6Mb5d7P5UxzQporUXe+bO1Rq3HGO3CwjgIDV6i+yTgCaF5N
         wzlD7IaYJlvpYxF3JQHptbhQp5CtNMVA+qMSyQd0helHTmTdJerHK98LcF3Lek4jVLfy
         g3dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789434831; x=1790039631;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9b1lBFng9K4L8nuKAcvrbbiVs0Np5hE/iDE9F6xQlyE=;
        b=i/CM49oQpLkkPWkvxtIAhza7gdNzODajGGcenhV+gyWWGGeQXYdTS8B93jpEMmcwYG
         oNxW2PhSKL9vziQ3/tnN1gs+AwmeDfa53N1uSCC6HvsaUx6ogo3MAOskpNsSKXkrYOln
         4FNRPEAw7Y/et1jGYlXjYkzRmHqlxes7bn/IIjuRH2R8854RHDEqFcqYkqluSMktQ2Uk
         k1T9GUwaKsvPqwcnKnO0EhHr3JzSkMg6qIaGAFvn1fuPjwxuDf3rwIAPf09lyHPs/fin
         USEQ8gos5b9IRQJVwM4G9odRiw5Ci361+KwLqaulupwoxWO2cXmDjZ2/sMMOybkSUiAA
         GzdA==
X-Forwarded-Encrypted: i=1; AKwUvBz4tulcZtLHPKSM9W71CMfTHcBppVvZkP3aNJUiCTU4utJfjC1IFkdONyNmwWZuWjBhepJGS61qOMc40es=@vger.kernel.org
X-Gm-Message-State: AFuF++njFKIpk6un95TYLSMjE4zmW7xgZ3wD/nXkGAK0C6+PK0JbT+32
	C74ynVmqfVXMeTJ5zA3CwOEefk3bpoj6DBUBfeI4g7G8f4LzHajJlNk=
X-Gm-Gg: AYBFou0XaIfxlUBupVHadO4o/Vpcgm3cVxuBM5AvJLL3DKnIDv0s9FQ2PTEt8U54QP2
	ZAjIBo400Y6jEC5T5Uda0N/sTmObcV4CU/KMChGT3HzbgWtb5SKT2H9uUfQJ+mgXWY5UBMJ2Q7T
	LIeFrRxgy1GjWiv7ebv06jwKFdmBQzRfgpN6+L4yYJbPzgF2nxI9M6jg1rClCsXDiPA8O8nXhXS
	6m3Fp6cjgDmj18gzEx+0cqwSoLdVctC8DguJwY+S35dmNf9XdejOjoX2qdpuWn/pqYtnGkwJC/h
	XfwrtvhKYWUijTkSEnMD+ALUndKvIUuzbRdyXj6DTFpciJQozZOFhjdmRpa5WU9KGRXDH3OIbMV
	qHi9n7P8vlj8J3PMB5fc5VH2Lf8ae2lyv4sxson8nhlkFQ44AZIO67F6qVmr+01CSHVOs2to+eS
	vEXQ2ccAVUtiJnBKKnApJ1nBtet5rXGgK6XIGiOWhoe9+d8VX9SOQ68+xpxxNqAaj4xaKVYM1cq
	o/4Z+yS0qkVaBxJIxw8j5fn4P70SEw8xs5p+d2zjx98/l2IaYSo7NJwOi13FmIx4OKOQpp8fS4s
	l9f8wR2tZLhHRGIDPw78evQGn+UG0A5bSq9HhW5cFe9yf/jpE2uPVf9U0ibyZ4nd
X-Received: by 2002:a05:622a:2b47:b0:530:e2bd:c272 with SMTP id d75a77b69052e-5310d0793bbmr102700421cf.52.1789434831180;
        Mon, 14 Sep 2026 18:13:51 -0700 (PDT)
Received: from 6e-wmo5420-02.ad.psu.edu.net (6e-wmo5420-02.ad.psu.edu. [104.39.213.233])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f4b699bsm109060396d6.37.2026.09.14.18.13.50
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 14 Sep 2026 18:13:50 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Jean-Christophe Trotin <jean-christophe.trotin@foss.st.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 2/2] media: sti: hva: Release the runtime clock on teardown
Date: Mon, 14 Sep 2026 21:13:27 -0400
Message-ID: <20260915011327.57695-2-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260915011327.57695-1-mhun512@gmail.com>
References: <20260915011327.57695-1-mhun512@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hva_hw_remove() drops the probe's runtime PM reference asynchronously
before disabling runtime PM. Disabling PM can cancel the queued suspend
and leave its clock prepared and enabled. The IP-version error path has
the same problem.

Disable runtime PM before checking its final status, then suspend the
hardware directly if still active and record the suspended state. Drop
the probe reference without queuing more PM work. Skip direct clock
cleanup when CONFIG_PM is disabled, since no runtime callback acquired it.

This issue was identified during our ongoing static-analysis research
while reviewing kernel code.

Fixes: 57b2c0628b60 ("[media] st-hva: multi-format video encoder V4L2 driver")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/media/platform/st/sti/hva/hva-hw.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/st/sti/hva/hva-hw.c b/drivers/media/platform/st/sti/hva/hva-hw.c
index a608e35..cb55dde 100644
--- a/drivers/media/platform/st/sti/hva/hva-hw.c
+++ b/drivers/media/platform/st/sti/hva/hva-hw.c
@@ -395,9 +395,12 @@ int hva_hw_probe(struct platform_device *pdev, struct hva_dev *hva)
 	return 0;
 
 err_pm:
-	pm_runtime_put(dev);
+	pm_runtime_put_noidle(dev);
 err_disable:
 	pm_runtime_disable(dev);
+	if (IS_ENABLED(CONFIG_PM) && !pm_runtime_status_suspended(dev))
+		hva_hw_runtime_suspend(dev);
+	pm_runtime_set_suspended(dev);
 
 	return ret;
 }
@@ -409,8 +412,11 @@ void hva_hw_remove(struct hva_dev *hva)
 	disable_irq(hva->irq_its);
 	disable_irq(hva->irq_err);
 
-	pm_runtime_put_autosuspend(dev);
 	pm_runtime_disable(dev);
+	if (IS_ENABLED(CONFIG_PM) && !pm_runtime_status_suspended(dev))
+		hva_hw_runtime_suspend(dev);
+	pm_runtime_set_suspended(dev);
+	pm_runtime_put_noidle(dev);
 }
 
 int hva_hw_runtime_suspend(struct device *dev)
