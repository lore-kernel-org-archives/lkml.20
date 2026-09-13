Received: from mail-pj2-f10.google.com (mail-pj2-f10.google.com [74.125.227.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CA03372EEA
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 20:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789331123; cv=none; b=qxU1dGdKYidGvsFmqbaCf88MwXgY6dCQWZGMIwP+sz1PNe4W424FMeJ1i5N47hcbICzyc7VxpoDMX4FfETvoLqpWf1b1vlegAB21BhtBB9u8NT3MADqRs76xHzQ5bV5G85XPrM5Us8AXeIPN0XCdloZnlh3RUIn2ZpPr8W8yYwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789331123; c=relaxed/simple;
	bh=wVPdfHHc7Y5YOi1bq3/wbK/y4FPB0AGJQDgGhhASs/M=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=k9AiQUpG5Q8lFtzpCkTLs5DE9iTCLug1OOOdsFuVwOLlkhvkLg98MqiRcSkbt4dRm4dDkEmUha5o09ZecT1Ztm3LAJZc7HQBkA2cIEbagpB8Bwwie8b4KPMeYy4x44sw9lm4NL6qWseLnavuJWzgDvTk2ofcbd2jX2OGMYtpQ44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jS9Oyhi6; arc=none smtp.client-ip=74.125.227.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jS9Oyhi6"
Received: by mail-pj2-f10.google.com with SMTP id 98e67ed59e1d1-39dba3b9252so675432a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 13:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789331121; x=1789935921; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OwAJqMNkilHzTnH+YC8CauxeBsxg3wPDdOMmRVO1D3o=;
        b=jS9Oyhi6WQ4t64PinJABMWXnDoH0gkUUs9MKRahfYm6jv5ifrAejreoAVEK9Jm/2sA
         HVRhXLJzPeIPQdbHolwGYEtojcyWJDVudMfQyrTlCcBrOK4obAOn9NA7uNnswlQArbFe
         RlwZcg0bgpOCg6jLEEOZsTciEI50dDeABpzY3nijbe2uw98XxQKhWV4f3Z1MQPoriyb8
         vLQ2RxqPkPpecyT4O1DJ4TXdkMZYjyYRdnwffnQUiLAOVssixjVE4X9omjm7khGV1LYT
         wWYoLEXoRECNbnz1IJVfekPIK0bu0CMeDMxjOmhj6RU6ikLk8homfnSBTgqhm5CDXU5L
         SY4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789331121; x=1789935921;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OwAJqMNkilHzTnH+YC8CauxeBsxg3wPDdOMmRVO1D3o=;
        b=BwJBflxZOj6lYLvn8xVChvpd06dSOcxzUPAfnascmk+b8wccu5HmnJw81J1lgFMkuF
         aLdcCO6KHIDRGD8jh8yVERhYEBlYfBtnmsnJeH1WXTRP47v/V0n9QNgve3WK4JzwaFH8
         qdFuH3M3umGVwNP3qe/kZj1UHInwAojsv1CIasWveB1Ew38JEiRPkk2xNaLWZAOe9/7U
         7w8TuJnCLcGq+LwYzg9+Po2BmNPTb99ZOQ80ffkQZdcInt2Pv2MH4eCp/FAAM1dyC2j5
         Soy+wIAGyMzM6ZLRIF+ehxCFBc+aSAPWFq3gymUrEU/UDzMXsrGHQRayuhXraszeipjU
         kXJg==
X-Forwarded-Encrypted: i=1; AKwUvBxvk2IHu8TKKaHS6Yg60bI+t9YueZVneKV+m829nm9ZO0j9DVD4JC0DSz/8YM12XCqSGqGAG1kI1J8HXtI=@vger.kernel.org
X-Gm-Message-State: AFuF++k8ttaK3NvNgrqUUp1pAsBqYyk+lcGOE7kqMmOpamD1QSj6kZTi
	UO6aVH3GPW5PmFBr5VCEEKwlBaC9XJsKxEFcizb4A2we21kjqA5JeSwv
X-Gm-Gg: AYBFou3LIlYyF+Kp5VLQ2T1E8UwjRHLT/1hSjoEmpWRZIDLRGIK81cAH37OHV5FGO3r
	jfwgRtVJ/3JoCnP6dhtStSCFFD19DL7P8ZpQK3TU4yiNRTwtxGH2CS4145a2tSVN0qE17ifhsvH
	nvWdSv4FfP+N5Z6nr2B/wASQCBDU9ASA+C5SANSUOLI8KqIp/OUb46O31CO+ZUx4dr21bed4gm1
	fkG/7d/daIqDZKJC5PH9D1zl1j9qIfavJFl77lW/iOQvt12lqv6F52dA2NaiuiMH+lTIWmQnsMG
	d/Iog9NtH2OSFhDSKIDF+CalK9zzZv38/npUDxteJ8GljV6/UoJDEALoHgZkXlzo5nN/eS7Eu1i
	TEkRRdr6rGntqjXsJwsEXYIuHyHdhQNu2z2Qw5kmJUzXEGUtVRt8VtaH5YlBqyWBGn9NB+VFJHI
	TZ+TbPHpFnP0CtIPITqEPZj2+roTFXxQhks0dKGGiRcrxbp707KOa8bEcK8H//8Efhjus3agmjL
	MZkLQYtAllrRZiP6zumpA==
X-Received: by 2002:a17:90b:53d0:b0:398:9bd1:3216 with SMTP id 98e67ed59e1d1-39d9c3597b5mr23602257a91.23.1789331121452;
        Sun, 13 Sep 2026 13:25:21 -0700 (PDT)
Received: from localhost.localdomain ([112.158.192.173])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d98a58d23sm19214591a91.2.2026.09.13.13.25.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 13:25:21 -0700 (PDT)
From: Hyeonjun Hong <hyeonjunhong330@gmail.com>
To: Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hyeonjun Hong <hyeonjunhong330@gmail.com>
Subject: [PATCH] media: Documentation: vivid.rst: Remove stale capture overlay mentions
Date: Mon, 14 Sep 2026 05:24:22 +0900
Message-Id: <20260913202422.1230428-1-hyeonjunhong330@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The introduction of vivid.rst says that the framebuffer device is
available for testing capture and output overlays, and the feature
list mentions capture and output overlay support.

Commit ccaa9d50ca73 ("media: vivid: drop overlay support") removed
capture overlay support, and vivid now only implements output overlays.

Update both places to mention output overlays only.

Assisted-by: LLM
Signed-off-by: Hyeonjun Hong <hyeonjunhong330@gmail.com>
---
 Documentation/admin-guide/media/vivid.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/media/vivid.rst b/Documentation/admin-guide/media/vivid.rst
index 034ca7c77fb9..6741f25220fc 100644
--- a/Documentation/admin-guide/media/vivid.rst
+++ b/Documentation/admin-guide/media/vivid.rst
@@ -6,7 +6,7 @@ The Virtual Video Test Driver (vivid)
 This driver emulates video4linux hardware of various types: video capture, video
 output, vbi capture and output, metadata capture and output, radio receivers and
 transmitters, touch capture and a software defined radio receiver. In addition a
-simple framebuffer device is available for testing capture and output overlays.
+simple framebuffer device is available for testing output overlays.
 
 Up to 64 vivid instances can be created, each with up to 16 inputs and 16 outputs.
 
@@ -35,7 +35,7 @@ This document describes the features implemented by this driver:
 - Raw and Sliced VBI capture and output support
 - Radio receiver and transmitter support, including RDS support
 - Software defined radio (SDR) support
-- Capture and output overlay support
+- Output overlay support
 - Metadata capture and output support
 - Touch capture support
 
-- 
2.34.1

