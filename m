Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9076D3BCD05
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 07:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791791433; cv=none; b=DSiUiHxt4hBdrd4idEJBLfR9LJXRH49ZqFAfnxJUz9F2r7t/vgklR1Y1rhuaj7TXIGyg0l5wKK5jXjlXpucQcBDR2iwbRR9APlcUMthL9lAvsh1/z4Vye6qGZ9+BbMF2UtA0uSJF658gUWGV1NJHdO7Vnmf/J4Gb02MRSbfPDZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791791433; c=relaxed/simple;
	bh=PxY7s0ef2eTOJq4et3n6pTSS+HM601tQ/kGpwr/Q1D8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LNaY4pEaLbwdtXWcORXfWsvOBJ17zzEeZ9S/wuA646b4N2gH+c0lNbewspSwKixVS8VOUOnTVVKnk07Zb4+ArnRKpbqOfEsKmwRE+Gg/KPflqUvtcKHE8r7Q+6PhK0uTteZg9CDaW6BsPTsWVD1wdLoL8BMZH2+Qf4n0qMduBMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f/4QU0Lg; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f/4QU0Lg"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a02718da81so11640715e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 00:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791791431; x=1792396231; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wVxIVgS58v6Z9j6X8602a8nGRWydc8ljk56Wi8nDAZk=;
        b=f/4QU0LgwnIUn0onkp9ulKK0UTOJ13wh8MoMtTs0jhP8x6Qya6LGJ6myRkl7M3jDzZ
         RyZcu+WwvCOFa4vAOrbkqLge1aXTFbdhNREuXenhwaFtr333QDtm49MeTAne5wyZeArx
         chKv+MPs/DWQ0M5uQPy30DxOSS2QCakfNmuZNWnmbm1YjWFPWM3OrjiGIX3UWNmGJapx
         O5i+kic9feTW5Sbt9go7yq5bZiFcaQoOChWxTxhxJs5ZRcol/Ig09y6jKn1tOL8w/3Xi
         r6jwvyQaxBj5VclwLkmuXUp1i+XRnp9UoFh855e545/a/k++rxjNMJOSd3MZlaNvI+5s
         8aKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791791431; x=1792396231;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wVxIVgS58v6Z9j6X8602a8nGRWydc8ljk56Wi8nDAZk=;
        b=n6oaS8TqN9Nlhvg5REROWfRYXziqVwsinAOH5dmeWWyUnl4veiyKPxj10mZiYA9fTY
         Y00BUnsQVJY0SARwsoNEkw/RqzQS3GyAaEP+Ea0r1Ysgx3dYAPONc4aihxB5M0wetqWs
         uTZ6K2Sf4Gm1gaW2D1ChtTk7YkVcGvEe/GNLFRADgrOcjX8pFx0XO5QjfG3w3g/sETq0
         9z9OSdlmivAEZwIWa2Eli8Rq66XiuBA70iZaGAPvu09GByOsbWsHjA8s8QBRMtZJYAqH
         k9jclC8VkLrSOLIqDt76++nNkKXigf8ma8gRTVpfZzStJ36oS4KC173x7PgRS/zlQ1AK
         NDzg==
X-Forwarded-Encrypted: i=1; AKwUvByEd+hsfLqNB05t2ir1CiYDWMzmQg4VrQ2iN3YHuzGQOODAf5I3BDVDvfvoyt9qQ/kACqAzgboTxTFxuRI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJzn+inzEs6FI98ek8q7WS+CKbekDS/NGUZh4VDWWEMXUqQ7UNJ
	GQG+RCTf62rVF8QramNPBJeJjsQhdd1HjNBMGWIl7Ldt1OdP9z9IRlEe
X-Gm-Gg: AYBFou2Py9M00/aIsFgMaLxsruAXGnNFewtjZt2vg6uEEPNM8V9NZOOlqTUwz5MWYFP
	UnRes/QLo+yzIaNubeLcK2UdKiiKP3BZ6E2bhNBncvU1G35u/Qb2jAvlWTkBDxu26VaMNtn1zKE
	dzkztroF+9KmWanVktAJ9FhcOJglfgKSf/As52kYMz373S2nzPior7ZHdKbRaZssqp0Ukq2DCc/
	qpiSoYZRQCh7RrHlFqUhYTR9ar7fHMNkwMHQEMK3+TzxXCjnVByrO450U2Jp0YkU5MfvuMnLGf4
	DktwpUbaBzJUoUfRF8qMJF/fUm5lGPLoJPR1wOmoI11MPq6/ZqIYMks9wTA1arf56E+nyQm1Us8
	Fkeu3o28rjGbXGaQ3sqRQYteEvl/+3uSaA3Yp/DcS1J4jw8/IZ3BQzzcZlsHdIk7MXEB3WYP8sZ
	rF8BLzGsDTlDBiboETFiBkQjMD/L8abGYFMMyHFA4/gRcVqqDBiAi/tLkDFxs4lNoheAGpH+iUZ
	U3j8/pRXKj39K2W66ud7g==
X-Received: by 2002:a05:600c:4ecc:b0:49c:fa21:e749 with SMTP id 5b1f17b1804b1-4a18e4d55f2mr192414765e9.31.1791791430487;
        Mon, 12 Oct 2026 00:50:30 -0700 (PDT)
Received: from LAPTOP-AVI.taile24b5.ts.net ([2a06:c701:4778:c500:38e4:cb76:562:f06e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf35930sm263268905e9.13.2026.10.12.00.50.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 00:50:30 -0700 (PDT)
From: Avi Weiss <thnkslprpt@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
	linux-remoteproc@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Avi Weiss <thnkslprpt@gmail.com>
Subject: [PATCH] rpmsg: glink: release channel OF node reference
Date: Mon, 12 Oct 2026 10:50:26 +0300
Message-ID: <20261012075026.3265557-1-thnkslprpt@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

qcom_glink_match_channel() returns a referenced child node, which
qcom_glink_rx_open() stores in rpdev->dev.of_node.

The release callback frees the rpmsg device but never drops the node
reference, so it leaks when the channel device goes away.

Drop the reference in qcom_glink_rpdev_release() before freeing the
device.

Fixes: b4f8e52b89f69 ("rpmsg: Introduce Qualcomm RPM glink driver")
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
---
 drivers/rpmsg/qcom_glink_native.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
index 55793fc18293..5142730dabc4 100644
--- a/drivers/rpmsg/qcom_glink_native.c
+++ b/drivers/rpmsg/qcom_glink_native.c
@@ -1623,6 +1623,7 @@ static void qcom_glink_rpdev_release(struct device *dev)
 {
 	struct rpmsg_device *rpdev = to_rpmsg_device(dev);
 
+	of_node_put(dev->of_node);
 	kfree(rpdev);
 }
 

base-commit: c39c2cdbde1f2ad9e2886167e55ad6b4c4907d7f
-- 
2.43.0

