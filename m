Received: from mail-pj2-f0.google.com (mail-pj2-f0.google.com [74.125.227.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 371BA222565
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 03:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787887508; cv=none; b=Wnbw+yF+l7FpluvslB51jAoUcZxKACptGVBnCkB+6eSkjpepA07zHy6CQr/EBbVmcPDCPDGUMSgY7AO0go4zK7zptPi6+M2FIpIF+hlQS72pKsk6st3eR5CfjnLkLHzwM/d+h7IBS4/S39JMQrTGrfTC80fFCBMvQC4+exGEFmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787887508; c=relaxed/simple;
	bh=yt+mLfSWcK0f6sKjTvFhMgbeBoBtwF/0GIVGw2ZnO4c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=enRAhb3bzLmtmXJP/WOaYwM9jJUFJ3jUobCfiEpYES8k5Aqs7yG6+euDUZ6NJ7FYJSFAWUDzHoBovS/mPL7GwX7GI7+8PO+79j0Z+6lOd6qPavAiwoSWzTs2Q4tgvWUgn7iA8l9AiYoXUn7/I5Xv62Y9IdpC0X7hBSyyfR9mU8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj2-f0.google.com with SMTP id 98e67ed59e1d1-380f4166f80so508934a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 20:25:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787887505; x=1788492305;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BaJs+obz6L+QhNc39Iv8LiC8QOj4nRSSCQxNzvKMxEk=;
        b=o+qQaCk0grtEhw8zJO4yv68x05S1+EFA2/guGHT/myOscDOC5FWXxrtf2oz46giPpt
         zVU3KfKySqTS4h6tsCVwvo12zBIIVwDuoagD45QnzMpxkVlwGWxeoBe+VhosJHLEpe7j
         SIaoC2flPyOzl+ve3gRXUnaxiufnQ3rqAtsN/SU9YErYEE+3npFGNwU2NfX/uAGl7JXX
         Tf1HdB9WyzOY2jFxZRTQLGtwCoAK7UmoW4HpiRWNKo6+jW7P4UoQ7xg/1M67HC43VErr
         DR5uvv0MqQHKPZQtxuZ1UI5GcZcJ/Gzf7Y8k6aK2T5Mj5xoLc9y4cJIqlAd/oBFKVf2/
         AMgw==
X-Forwarded-Encrypted: i=1; AHgh+RrX/A0A4QUIM0g/bqseDgRFNKiG3At9W2FQ3wrV4t6WZ/lpbZxXh/05a/Z/NiicZw07HNLbPKzfPcjksPM=@vger.kernel.org
X-Gm-Message-State: AFuF++mgqI284fRc1rSXaqWFLpTldkgeeRanodFLx9mOg9oZnNOZaSwH
	UdMQycLmUrxH/kFFeGH9NISQCKzlM+y+MrVSFUxLP9tgUdJXIo8Et3ja
X-Gm-Gg: AR+sD12Xj6dvd9ubw4yzSJYPqpQhqcV7cMSQBHeprNdE6ZudaEk9I2zFbhvOWXf7L7l
	J2BZH9Rl5sdcEIrUcj37cFeILx9BXHj2KlGE6Tzigx+f8+afFCsQeBzcFprqDF8zSRcDkEMwh4R
	ZZQSqXKQGOyCTDAAfMGadPsbiW1fltrMIwIa9oO5uFco2CJyAYIMieq7hDuM3CDS3zkP59o4Kjo
	bkK/6cQzdY0RjaMGQBxHEZEN8ajc72S9885TbFtOXa+fKsivCuWTOTxwBtLCy4kjHt2aYFTY/XD
	r+ENnS+sQRq70Q/Y5AafL4Y6dRbMZnCibGGb7DQ2W2EOdf/ZGZ7qgL0vFXq3bMlfpkxZM5QFVJM
	5WQK0Uby6BqZEEgM/vF3RigyfxsAM8gw6dhsDhPoA6TXTqWk+3TmhM895W7BvEr6Hz4xRzCTpZn
	ikRpxcdDzMkuusRrc15N1nFVsHhzsnZ7FTfsB27bgxnSzO2V4jAEqE7IhbBgAJMQEprXnpvjZl9
	BoXvsOFSOl5iLHYQ8p4
X-Received: by 2002:a17:90b:2b90:b0:38a:c3f:3b87 with SMTP id 98e67ed59e1d1-396d0fce294mr8160222a91.12.1787887505458;
        Thu, 27 Aug 2026 20:25:05 -0700 (PDT)
Received: from kylin-XiaoXinPro-16-AHP9.. ([116.128.244.169])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396b1ab4e12sm5142275a91.16.2026.08.27.20.25.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 20:25:05 -0700 (PDT)
From: Xueqin Luo <luoxueqin@kylinos.cn>
To: rafael@kernel.org,
	daniel.lezcano@kernel.org,
	christian.loehle@arm.com
Cc: linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xueqin Luo <luoxueqin@kylinos.cn>
Subject: [PATCH v2] cpuidle: teo: Do not return a disabled idle state
Date: Fri, 28 Aug 2026 11:24:57 +0800
Message-ID: <20260828032457.2317326-1-luoxueqin@kylinos.cn>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If idle state 0 is disabled and none of the enabled idle states satisfies
the PM QoS latency constraint, constraint_idx in teo_select() stays at its
initial value of 0, because the loop that updates it starts at state 1,
and so the candidate state index is capped at state 0, which is disabled,
and that state is returned to the caller.

The cpuidle core does not validate the returned state index against the
per-state disable flags, so the CPU ends up entering the disabled state 0.

To address this, ensure that constraint_idx is at least equal to the index
of the first enabled idle state (idx0), so that the candidate state is
never capped to a disabled one.

Fixes: c410a9a142f1 ("cpuidle: teo: Change the main idle state selection logic")
Signed-off-by: Xueqin Luo <luoxueqin@kylinos.cn>
---
v1 -> v2:
    - Instead of falling back to idx0 after the candidate index has been
      capped to a disabled state, ensure that constraint_idx is at least
      equal to idx0 before the capping check (suggested by Rafael J. Wysocki).

 drivers/cpuidle/governors/teo.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/cpuidle/governors/teo.c b/drivers/cpuidle/governors/teo.c
index ac43b9b013b3..906f4f89e365 100644
--- a/drivers/cpuidle/governors/teo.c
+++ b/drivers/cpuidle/governors/teo.c
@@ -426,6 +426,17 @@ static int teo_select(struct cpuidle_driver *drv, struct cpuidle_device *dev,
 		}
 	}
 
+	/*
+	 * If the latency constraint does not allow any of the enabled idle
+	 * states to be used, the candidate state index will be capped to 0
+	 * by the check below, but state 0 may be disabled.  To prevent the
+	 * selection of a disabled state in that case, ensure that
+	 * constraint_idx is at least equal to the index of the first
+	 * enabled idle state.
+	 */
+	if (constraint_idx < idx0)
+		constraint_idx = idx0;
+
 	/*
 	 * If there is a latency constraint, it may be necessary to select an
 	 * idle state shallower than the current candidate one.
-- 
2.43.0

