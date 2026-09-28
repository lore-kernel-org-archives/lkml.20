Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F68049B457
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 10:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790591412; cv=none; b=eatgIK7js3uNm4VyCHWKFlFPjUZFOLYNCHlvpVnv9Ul+xy8a5mJ4n6xczXzfhrb9nQUa/k4xDuJ14/mmj2jeSl1GtRVQ7TDjAG728xVVq7cFkX1/vrnqCa9Gfx86MPKf0xznysmX7bh8Zn9ijpxbx5B8iC1XBJRloeMkg887DMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790591412; c=relaxed/simple;
	bh=7ElspGVGTSSLssoWG5anEWcOuqzB+d9ZPuu2zqwQF5M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r+qeOadyh25InYq6E5yPYksRWWmbDjrlOH/rse+RglWmFGy41M7zSrFeL5xp5MIxqnBYjNHWUHxlG62Hc7C+cuZgGqglo5gZpX/ToXCw+WHqcPK8yhHRdvCM2Wyz1OFVnmoIQ7uCjQCnnMoTTuwdrOe9R5+3iTr410hD/c+pTl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gMDYg6kZ; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gMDYg6kZ"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-39b2ad861b1so294631a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 03:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790591409; x=1791196209; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xCn04+uUjc4Puwo2X+70SQYBQteH/fiUqqjHU13FJ6U=;
        b=gMDYg6kZEF+2Ytmk3RL05EuK1VN9XZk6Sb9fD33MgeqjVmdKJ1/gAZVBVBC7YF05kR
         MmBUHV+mUQ8LTcu/HDzHzMrySqzyyAsvai34MrhePvtNWuuro51ZZEMccXeVja4E/aGJ
         LPFFYl5QFtoPJuOqx73QL3NbqWkKqa4fG4bbhbY394xSSt0mYL/l5dO+gdNUnurqzEFu
         ORhOpOU59zPBb9ArsANfYyCB/k28IuUkeuJ6ylV57tkr4YZ+7kgMxRGt9rJYb7nphvd5
         s2tjm2ZmXL2ziJeeVGB1xnGXUUx8VIP7Wtc/HzY0Fw8k488pZeYQni5MI6kPU7QNbVP8
         2Rfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790591409; x=1791196209;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xCn04+uUjc4Puwo2X+70SQYBQteH/fiUqqjHU13FJ6U=;
        b=GUEQxGb9xnut0eve5RpB25w+K4HKL7wBWUE2niHnVm3yLJr+Oga/D5WMqqUQ8+ysnY
         y1fwfWFPH8hikv9LCWtFMqE7EDep0nUBcNL533+FdNqkJMLjwBmNSxFV6LIur7sjcvpR
         UVU5QSi2Al4pCsGC1ETUDUSSpyVF2KhHtXT957gp0CaxwDZ2+Hut2CgJhJ0Wr7G4DcVi
         Nq6IqiDNP3BiskEwqPEnoB1IBfPT+lECHnb6w7/pg/BRNXmBW2iYJ6FR4lw6v3U66MS+
         GbTSN7f+sCAB5OhCReJeUI/AsGVAxHJw+36wCWGTHauaL7WzAiBRwchK6Uu8YmJCrR/d
         Epeg==
X-Forwarded-Encrypted: i=1; AKwUvBwS1zdOMUaXprRGsCWLNDx7lzqcB6iuZ3rn+omKwiALDwjYvlgfgu/rPhvoLQYftFj1MwJekobedsuvQ+Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYIycVNE3Fi5GmZWzIwE/84GfcorUuMHJRUW0vPMu9i3w15sKF5Z
	80Pxh7vFpqX+7EwX6x9VyUs51ZXUe19KZ+cdfWrJBi+8aqW7WgxNFESajc8X84an
X-Gm-Gg: AYBFou3uX+/MMSP2Krl5Ww4TXM2CHbNJ5rCQcUZLXt2Lhvp5rpkHc7anKodY07R5CS8
	jtefjLTaQInfsBSYPHDjwFD+zd/nF3kPhd9wWiNstcLbYLHxfCOoHnC3qfUnksS+zI0I8lBmXHR
	S9ALHYdghHxgg6zdo5SuIPq8g7beYHsM9VWOYGqkqQNwYmH8xfrXGhEo9TxTmIDaagaaV/SrYKA
	2pBofRCrcsJ7pXZr3Skz4/SsPCuNnlZo8zPUFu7GZCaK6mkERJK67Jfwq4ttTE7pYXLVa03UEVd
	3IUmhU4AtvxweDVJtgj/tohretJVyOCiuAWAHZylCOxToPwk55CR1Z6x8urZyZO0lFAfsTgp95k
	xexAgrFvYfDJCxR53s4KF61LF/D6SbfDeln1jttPFyFxgwGs0P/k21sEsOfP3aphwxxm8iZ7z2x
	XZmrZ8UHdhEcvr386KMTvpsmarDjp3m8xhaEZ97SntyWqFQohAC0FFaClMnB8Ybe0xMiFzbnaGB
	AEX8eTskfbvDQ==
X-Received: by 2002:a17:90b:39ad:b0:3a0:60c0:7f8f with SMTP id 98e67ed59e1d1-3a0b21d2233mr13678139a91.0.1790591409045;
        Mon, 28 Sep 2026 03:30:09 -0700 (PDT)
Received: from jfliu-sfa1411.. ([129.227.183.200])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b9355e49sm20234282a91.4.2026.09.28.03.30.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 03:30:08 -0700 (PDT)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: linux-arm-msm@vger.kernel.org
Cc: Jianfeng Liu <liujianfeng1994@gmail.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/3] firmware: qcom: scm: Allow QSEECOM on Acer Swift SFA14-11
Date: Mon, 28 Sep 2026 18:29:43 +0800
Message-ID: <20260928102951.18369-4-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260928102951.18369-1-liujianfeng1994@gmail.com>
References: <20260928102951.18369-1-liujianfeng1994@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Hamoa-based Acer Swift SFA14-11 provides the same UEFI variable
access through uefisecapp as other Hamoa devices, add it to the
allowlist.

Signed-off-by: Jianfeng Liu <liujianfeng1994@gmail.com>
---

Changes in v3:
- Change compatible string to acer,swift-sfa14-11.

Changes in v2:
- Add power-supply for the backlight (vreg_edp_bl), matching the T14s
  LCD variant
- Fix swapped vdda-phy/vdda-pll supplies on the QMP PHYs, matching the
  reference design (cf. commit 7c1d0ef2969e1 fixing the same issue on
  Purwa boards)

 drivers/firmware/qcom/qcom_scm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index df20773dd7541..f2d2a05c910ce 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2215,6 +2215,7 @@ EXPORT_SYMBOL_GPL(qcom_scm_qseecom_app_send);
  + any potential issues with this, only allow validated machines for now.
  */
 static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
+	{ .compatible = "acer,swift-sfa14-11" },
 	{ .compatible = "asus,vivobook-s15" },
 	{ .compatible = "asus,vivobook-s15-x1p4" },
 	{ .compatible = "asus,zenbook-a14-ux3407na" },
-- 
2.47.3

