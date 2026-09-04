Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1395A3A6B8E
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 11:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788520599; cv=none; b=nIighssxWe/UWMudnGrIEZDDDHSb0nyDJE08GYnZeyTVqxDr9fSUkemzD/CH16hloppiVUuhMwoyr6i9FPnOUGHNsy7QS6aCs+N6vMUW8sp82hmp1GxjEWfFp8LgyFmQJP8KRxRB3oAvXJMZkM1DJdp4OXMPjaj2JOH2sP3X8BY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788520599; c=relaxed/simple;
	bh=ER8+VqkKNh1m5awCYEZ0+WC8t8fPrdYjk//ReUw6pk0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IYkWhnthRUweYbt6Up5pr+scbjBRsoKv4DqX1kpm2pEd4TJAEWz4l7krE41ak0+e8T7LmK64MYAwr5Nn1vNOtsS85T0RyjEyw3xBpvQrfNRXqErzrUKcqjzZs9xu3tuLh1w4ZewJGgGH4IBVTEvlcGJ7ir8mG0YKomCmjNhqVhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MHX5vr9g; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MHX5vr9g"
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-7f84a55cc06so693361a34.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 04:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788520597; x=1789125397; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JppfUUpZfHKcmt6XqyrmFgzf+ARztTLGx1FGIhTdjnQ=;
        b=MHX5vr9gnpI5FXxDnZSt4klU+uF0DRX05+ChFKdk9U8fwjkEfIR29zK1e+eJGVxvqA
         8nP1XNpdi2nca9TJhD6RCrS9kp1DFJ1inrMya30oWsghuAZY1IMiLgU64pHwoclOZoSb
         E4qWg3MXLvPVXcyVs+fsIfuLSRWpQt5oPFaUC8gLq0eXexPGUovy6HJeJEQpbrXguwxr
         dlt8ahG7xoz+qIX+tFNq3nfzjC6QuYK15SHoKnFhJD/n+PnovMftIyudjK+rCHVOp13/
         UE48tj4/QBOhNvqIda6AlIKY+PZvqeD+gaQCUneiZF3J33AqssFRMDtFExNuMFf86gSj
         F0jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788520597; x=1789125397;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JppfUUpZfHKcmt6XqyrmFgzf+ARztTLGx1FGIhTdjnQ=;
        b=bM8dd/TYQkIOBgihqxioOue7omvrQRNEfaqHHnDDTMW/Maih+JCgMW9npjY7wNd+Zu
         zl6RALatclRrhAklbYYm0SvYX7guIfebZx3IwuyRSzHbCR2yJWH63U7ojiBANF84QJTR
         pgr561Y6b3CiTXmlr/ML17c6f3I9nTdAutFlViLoQ2AsSLiNS/tf12wSu1Jh762MVcn7
         aAwwzpn703xYZmX01FrY1gs1g5L+UKKCJRlD0yHTWLPz7RKQ27/q8Zy2uSOCWYYnDCW9
         Nos6pL03cRN5/hyEtZhQuheKlvO02+4IhwyqPJbA9eZ51+3h95oT4wpGqjVNG8jBApK/
         R0pA==
X-Gm-Message-State: AFuF++n/pbnycVUxoICy9R/twmq4lrXN8ICkmXPPzTfW24lvuWHREnhM
	BmGk2wCWm+3Y9iZxkCYYrq+3TrbLnps1fkKAGMOfiGXzogIrdf7f1vvO
X-Gm-Gg: AYBFou0XfKzfRfck/TMrZjZEMNpCvcErYK0cD4HZAdzRW9z+lsicHB4ocOAb6nhqsL5
	PoEDad2wUzDJwfM4CbhR7lFXwpCaNHQ4M8rvH6/WRZx7ION0mW0T5U7Hp/07wwRW5HUSeZgD4Mj
	/pud7oc+iUvDU9Vk/hJRsAnHGf1Hunfv4lWbxtV6lJI9B+IuHU53Qv02+5gqfZL8U2iyYi4uvkN
	tqzWIdEsJR+eF069Jjmrx7iTbF8wD7JP/g5Xt0wyrWmYEhqbhew24Pa9T9Sxuzbdd/ssPZ19JPd
	pLNKSKsxgyXP56S33FKEIJnnhEaWiM150w554DI4Lye0lcTfJ5hsDLTZ7YV0NpqpeYahPkNrR+V
	ctKwpwkhr5X8z2yJEyhNzLqxm/w8QDRIh07KhgYnRFoYQ6wAV7gYFgQ2LNaEzlevAFRg8jZmnn1
	zy8S2zpEs/naiBaMU8vftDmHgivsq8+Eb9ReOf9e7jT3ZQ1uAI8riXdNm4AHBYaZ67smNNC0uo9
	toRHb2a0riSAro=
X-Received: by 2002:a05:6820:220d:b0:6b1:4061:4193 with SMTP id 006d021491bc7-6b6f7988a8dmr3287799eaf.0.1788520596953;
        Fri, 04 Sep 2026 04:16:36 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b6036fcsm6395431eec.20.2026.09.04.04.16.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 04:16:36 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Georgi Djakov <djakov@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH] interconnect: fix typo "commited" in comments
Date: Fri,  4 Sep 2026 16:46:31 +0530
Message-ID: <20260904111632.29262-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "commited" to "committed", reported by scripts/checkpatch.pl using
the misspelling list in scripts/spelling.txt.  Only touches comments, no
code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/interconnect/qcom/icc-rpm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/interconnect/qcom/icc-rpm.c b/drivers/interconnect/qcom/icc-rpm.c
index ca4c8a944755..da06c58e078a 100644
--- a/drivers/interconnect/qcom/icc-rpm.c
+++ b/drivers/interconnect/qcom/icc-rpm.c
@@ -402,7 +402,7 @@ static int qcom_icc_set(struct icc_node *src, struct icc_node *dst)
 		if (ret)
 			return ret;
 
-		/* Cache the rate after we've successfully commited it to RPM */
+		/* Cache the rate after we've successfully committed it to RPM */
 		qp->bus_clk_rate[QCOM_SMD_RPM_ACTIVE_STATE] = active_rate;
 	}
 
@@ -412,7 +412,7 @@ static int qcom_icc_set(struct icc_node *src, struct icc_node *dst)
 		if (ret)
 			return ret;
 
-		/* Cache the rate after we've successfully commited it to RPM */
+		/* Cache the rate after we've successfully committed it to RPM */
 		qp->bus_clk_rate[QCOM_SMD_RPM_SLEEP_STATE] = sleep_rate;
 	}
 
-- 
2.48.1

