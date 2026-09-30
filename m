Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8F9B4C77BD
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 11:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790767015; cv=none; b=ORu2S+fONqAUBcEjwkics5p1rnIxEGGuuwMs9S6odfle4i8zwyWbgSbgJZjECyq11zI2nMMq3yeyglaogKGFWYRNwdPZCItJya1aEQagS+xoP3eGUMvFleoTPPpDva2KljJK2iZ6snuvFLCx/pisz5v3KJz5AlU5NL5vzFnbvqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790767015; c=relaxed/simple;
	bh=PTm7KfAf22Pq8oTJK9JiCTt7+1syK75vpiOwmFtY9J0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=J72IkJgW8o/2iITK7ZtL9b9lDoHqNBWezU4sIUNZv9BW70Z8qe0LigSt7BSV+EqOLroznidCyJOmuJlT4T+mgnqQ2ZEHEp41Vs3liVvjH1Pmnkq/Wp5xPJHRDGwKOfmq2UVbTLAwa9/VlkL6+TgcSgayejyoXCSUc6FlnsHSK/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FUvQzYJe; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FUvQzYJe"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccafb751so2482111a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 04:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790767012; x=1791371812; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wY93XBZD56JE3eyu1OkHEle/LlbtoW01BFCKk6aYmNc=;
        b=FUvQzYJewIwlr6o5zL/7Vg5RevxVcyF8QJ3I+yogBzB1R/B4ZN1xDLpG0gKYTmvwUj
         YfPtQ310owCh1dWR6H+YvKehCnuPF0VthJ3IWL+vr3ubtkW+wWV8m9n0tk97MIH++6RR
         JmrOWoPwfikZa8JAd1fmznCHBol9FBxsOY7QFA7UdUY19u46i/6QoyQrJpys0hsonB/F
         uCG9RMMcPyUbPLTmWMCKyJONY3dyWFY0sH061xGl28Nn69iPJLLYMQKxce8gCbw8o9ie
         7bOrbW0MfWCQxuucAbqdY2S3ClqR4zIb666W40k4MUwc9kIp5NiX3kaZjTQMch/ltGmv
         bsJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790767012; x=1791371812;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wY93XBZD56JE3eyu1OkHEle/LlbtoW01BFCKk6aYmNc=;
        b=bROZxqhu1tJpKXqXllxsXCQMf4RUnFQ+c/PcpBUiK8zi14OIEZGndV9oz5Q7BS9M7i
         Tzb3Z+fUDVaDgC2JpqBYwVv/KC4StB+NbpMFJ+zf0IxQ/TeMaHR176k5so5YzFS31Ff3
         5hc+gYYLr/ljEpD6//zkFW7YVntEh9Px1NhquhBvo4ymmNMMzCOaP/FiG6kuC7cY7T7k
         gdiE6gYby83kT5LJljNqdf1z9oQWKjtKW++yidBIF6SjHcYHlsqAnPqikQ2KXxGIK49I
         hanY5u6u9Yb7ZE2ii69ajq/79A6kLAVPPWdzMhyuzfbw85Nbd1T1l2/6k35oemqSjQ1U
         OWnw==
X-Forwarded-Encrypted: i=1; AKwUvBxfamp66mVmUythk3nlsE/HzvsUgi5q6ZslFzjeW6AR3x/jza6PwZvXNo6fuFhaNP4ls9UU2KVWOEKPNEM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIgcKazNFR+cJQKWpI/6+pONRav99YI2gZ/4+v1idCQUVI1x3HH
	tOi7fuxC5rFd2fAHdmNGK/tk5CO4TxNs0JaMUE+5+MgJeO/8btoLzb8L
X-Gm-Gg: AYBFou1sT1ceHUev/elk1fs8PJLFxH1oI4yU3XQ/8kbCideyB+rsnQdgSvRL1SurB/8
	ro+4pFK7jo/r9s+GwY7vvMj+3zt1OzQuNMoN/wZbB09+v8CkMzFMEYUXQjlAIPA5ZENEtwJF3g+
	v1/5ada8reYqtPcDkAtbt14/M/lE3SBdrLyWHQLZEW4sXY/UjB1FZhFt82uSSG9ox9C7yHr3GnQ
	l5+m1Sb521srTuZZlezwCSvpp96zfDbii7N1YUuc2s/wfvG9D0+N9mv/B+OdT/KPvJKX7L2WN+h
	6O7k5eLIPgwrUCR+jZ7Lt8SD+GdaoqZz2N6RSCIp2IW3ewKTJbVDhdt0mEUI81FTL3P8DVzX+gQ
	PUxTlbVyfSgknVHaCrtnhQs60228DUejtcXp/x6yNL442eiumcHgcHOWjVn/mlMI+fcQdhdN464
	f9nuYLC1B65Za/Cz4fF9ustZ4s1OYa12Mu1+hHVn3/J9VD+qWb1XJmvCBnlljAoTJBW54Ev8aZf
	J80CHFBIDdaTzDr5sYPHIrGHmL67VSWnCiqoR5VWiV1Q/RuEarOMhDTq+QdXYn+ys2XWKpLtSJN
	a/tAB4U/hI/CHIguPNbdwv2MYExQMohAVG4ocTaTrONkXjc=
X-Received: by 2002:a17:90b:5830:b0:3a4:a045:27cb with SMTP id 98e67ed59e1d1-3a4d193d3a7mr590091a91.46.1790767011654;
        Wed, 30 Sep 2026 04:16:51 -0700 (PDT)
Received: from rahuls-x2elite ([110.226.112.135])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4ce40a6d5sm2873273a91.15.2026.09.30.04.16.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 04:16:51 -0700 (PDT)
From: Rahul Pon <theflyingrahul@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
	Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
	Praveen Talari <praveen.talari@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-i2c@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] i2c: qcom-geni: release runtime PM reference when set_rate fails
Date: Wed, 30 Sep 2026 16:46:41 +0530
Message-ID: <20260930111641.1134-1-theflyingrahul@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

geni_i2c_xfer() takes a runtime-PM reference with pm_runtime_get_sync()
and then returns directly if the set_rate() callback fails, leaking the
reference and keeping the controller resumed for good. Route that error
through the existing cleanup path, which drops the reference and resets
the transfer state.

Found by code review; compile-tested with arm64 defconfig plus ACPI and
W=1.

Fixes: 10e74f4c5046 ("i2c: qcom-geni: Enable I2C on SA8255p Qualcomm platforms")
Assisted-by: LLM
Signed-off-by: Rahul Pon <theflyingrahul@gmail.com>
---
 drivers/i2c/busses/i2c-qcom-geni.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 6a39e21d5e..ed6495ef81 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -1003,13 +1003,14 @@ static int geni_i2c_xfer(struct i2c_adapter *adap,
 
 	ret = gi2c->dev_data->set_rate(&gi2c->se, gi2c->clk_freq_out);
 	if (ret)
-		return ret;
+		goto out_pm;
 
 	if (gi2c->gpi_mode)
 		ret = geni_i2c_gpi_xfer(gi2c, msgs, num);
 	else
 		ret = geni_i2c_fifo_xfer(gi2c, msgs, num);
 
+out_pm:
 	pm_runtime_put_autosuspend(gi2c->se.dev);
 	gi2c->cur = NULL;
 	gi2c->err = 0;

base-commit: 551c722f40809618230001baccf219193e22fc5a
-- 
2.53.0

