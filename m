Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E539343B6C4
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 13:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788529087; cv=none; b=eGKgeR3+3id/St/KFd2qr1r3J8CEQ2MqnrfsS0OlQ1wgb/dnfpZqQg+GI831kE7fDz2+ZgptRDYcf2kvn/W30owU9cfnlZRrnZXRcymRz6HNHa3KwcVcsJ+RGbR0CwekYt1VBvZPXWixhegZFL+AFRfiE1RmAWZy/vNcMupZq2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788529087; c=relaxed/simple;
	bh=re93wNDeWo84am3d9S0ej3KWXH6QZE3lMHX4Zsa+V2E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=H7gWBoUkQ0bU1waD2T0Mk8JgiqCv20XtcvdGluE5BI094yomeKK6+abzV6gduJsOjcMcwa1oQeJdwlv09bh08/hSHJM7j+L2eSMhRnfuc7HAbnXfFR0EfqLpCCX6HJkh79RrrW/4s58sD1fqlnEImC9uuaPT2ouWnGzLy0afRMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BDnN+19V; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BDnN+19V"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-38e041ea211so806300a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 06:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788529085; x=1789133885; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wdzS40G5+XkQjj21yhx/Qw5lfwjG7ePaoclwXY13s2Q=;
        b=BDnN+19V5DYLO+obm3CdQDWOOFdXrTDPKYdXJ2LLZILjjAiwLojuHd+e6SFXIRcTTZ
         ZUWX/o3+nkN/g12EMSrzhmAATKrtB+sJgG2ZU4pIbNYi4lpPVyAnVpTB/OlddkeMOUhU
         YkAVXSz50E5PTWY1wi0lnCOpXvgNdi3UMvNTL3eQqgRZrvxpFttzdliUqe0/rqvqvUlX
         b380uOzIF5YLT/q0YZ8MlsZ8no7nfd8dUkGzjPjFXkYQU94EMsCnkwioDJ1VJ15DZ03y
         thRIbgNEUSkt8mj0dKtSm6b4cqlax45Q9ZDzajziTdYL63g/oJOo7/jOPLcf//55z0E2
         jXbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788529085; x=1789133885;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wdzS40G5+XkQjj21yhx/Qw5lfwjG7ePaoclwXY13s2Q=;
        b=meRVIKh98JxjQOgToKpxZXdhzbnGHaZIWye3tyf9czBSnTHzA3Qg56/NzDNfspJE+n
         hydO7rv0RA44+aTuAYLcFUqXb5kKXTR7LJkORP1k71FXAzxAvvsLY7+d+37DZdxt6Ag/
         KoxWByaEKqJX72rYwV+GlsLI3F878yTltLfWEbsPW9XQptnSjw4EMI6lXtge7Cy+51eX
         UUZiMT/FpVLk0tLHCBftQFdhuNfBAX7Gtr38dGTYMSk5RtUau7FPq87M/Cnv1V/a85fU
         h9MLE2uikdgsaxf7AG7uds+nDEKXc2pcln2T/6bOvv0JFfllIxav2NMtP4rX7LcVo1UU
         1lOg==
X-Forwarded-Encrypted: i=1; AKwUvBy5+LEUGh8QSZ6SyPm2XrbsclSF8UbcJC2YPNw+qto2Il+zPjo/4X2p9Su7A+s+3FlNleo3KD+seCVVH+E=@vger.kernel.org
X-Gm-Message-State: AFuF++k26i1g/fSvKtg7flgnunZJoI9YIgXezAxWOs/ptGDFO+wzSndo
	BMFDAAHR9gmhKGPRa4x8rPL/HDJpNhcvuJuYN17ptTragycFlmEwdSC2
X-Gm-Gg: AYBFou3rIWbp8Q5QZZ7jgyATHoFsOs4cm+JfyiPhjyfH81JpDdSTZegPcz7muyw1YeE
	DzqkftkftytKhwEeFPWeWQwJ0loRXKxNkLN7JXK1IVc4SvuxNoDskW7u31M4N38FdE+k84ZjkVJ
	3OYHzFvaG/VVPb/aeNB9a6yFYGPSFcorUi1d+cjAOOT9HIsOpK86cACyvj3A6AT4Rbw3s0/Vsib
	rVCVpQ0oU8yYR2AqBHdYvUMw0GxzSWfcTafVWBa84TnDEd5CV4qtqZ9jmHanN9l1MTMSKJCSCHo
	UgxIQvD9DYUIOtds6NQZRXCMzQMsZuipKRrOBDvzp6XmNrBD3IKND7D+xNU+tCMAm0jHViAUsqj
	GAsgks+7p/NETwLQKsfpKpWDB7oH1Sv061rQdX1D7G2BF3RMtoeXQMGacZsMMR1LHbnGrUW0/Y9
	0tJS8m0TcfKS1Yy3pHf/LKZ5uGCT6i1e3cLHbVo5rk1QPFhHKMX+6JDO4clC1lN8T6jodUl2hbS
	EhKRisRluwhTXYBvALRTLHKgSI3nOX/0RfMt3w854xfcy2DVmVtJzx0SQsJn7EfDOoEIwI5u7of
	/7piI2QG9zA=
X-Received: by 2002:a17:90b:2552:b0:398:e6b6:acc1 with SMTP id 98e67ed59e1d1-39b262728cdmr9882239a91.15.1788529084849;
        Fri, 04 Sep 2026 06:38:04 -0700 (PDT)
Received: from workstation ([2401:4900:8902:9774:f2e9:38cc:6b1d:1764])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33450e140d3sm3427785eec.4.2026.09.04.06.38.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 06:38:04 -0700 (PDT)
From: tspamiitesh@gmail.com
To: suzuki.poulose@arm.com
Cc: mike.leach@arm.com,
	james.clark@linaro.org,
	leo.yan@arm.com,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Amiitesh TSP <tspamiitesh@gmail.com>
Subject: [PATCH v2] docs: fix typos in Documentation/ABI/testing/sysfs-bus-coresight-devices-etm3x
Date: Fri,  4 Sep 2026 19:07:56 +0530
Message-ID: <20260904133756.31938-1-tspamiitesh@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Amiitesh TSP <tspamiitesh@gmail.com>

Fix typo errors in Documentation/ABI/testing files which were detected by hunspell and manual verification

Signed-off-by: Amiitesh TSP <tspamiitesh@gmail.com>
---
 Documentation/ABI/testing/sysfs-bus-coresight-devices-etm3x | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-etm3x b/Documentation/ABI/testing/sysfs-bus-coresight-devices-etm3x
index 245c322c91f1..4ee6977381e4 100644
--- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-etm3x
+++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-etm3x
@@ -2,9 +2,9 @@ What:		/sys/bus/coresight/devices/<memory_map>.[etm|ptm]/enable_source
 Date:		November 2014
 KernelVersion:	3.19
 Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
-Description:	(RW) Enable/disable tracing on this specific trace entiry.
+Description:	(RW) Enable/disable tracing on this specific trace entry.
 		Enabling a source implies the source has been configured
-		properly and a sink has been identidifed for it.  The path
+		properly and a sink has been identified for it.  The path
 		of coresight components linking the source to the sink is
 		configured and managed automatically by the coresight framework.
 
-- 
2.55.0

