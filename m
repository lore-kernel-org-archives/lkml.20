Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794781463;
	b=vVEaktZW0nhREYEUNPbWvsXQ+OxhfL3xhdu6lbQsyYuv/s8wjMqPILvImCUogJBy0NHf
	 HG49ErhgWILhEZHiCYwAuLTTJxUkcGE8cJwVi8lyXGBizi+Zw1kPvtpy38jpLqvfQMR5F
	 RiYdiNaGNsn3mt06WWt5BV2OuvQxFjosjvWFlBWzzwAIIxtY6Sce5z8SPJTIRjEsF320/
	 AyjUhTKSsZbfE+53PA014xi1/HCo+35OT9KhQaVhqmeapZyRRsVYIULdwpP8/IGN7qdwh
	 9i4UJBXm2kW7H/iOjOVnelsgyTiHVSqZNkr+gHFeOiB3qZhyvP1bJQURdCbrFDbwXCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794781463;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=YkVMBv/sY05OW6n9It2eq/jMeb5IfpTG+9202Dl+KMY=;
	b=d+RqgAG8ctCSu2L4xHtOnsSMW8z6YOPhbEy9gg4+gJADBlim4mbXqP7iVX91tZ3P+l4o
	 u2yYQs1gYaeSFjdc7SFAfasX/2CFDvdC2CQKVD3QWlsarduoT8u8MRg1WOc8o0k4qEjUD
	 8lT1i63kr67Y1Kcamt2MeP6Ddf6qveFc9OcCLg60OkMx0g0DgLSd6B0UcHr3vxPyAqmTa
	 ElELmts0elZVj+0J7aogQtvo7WTxbT9u4Qm+F5vRAVSnxRnx5Uajde9RXoGk196JHYpIF
	 kOsnqpAPkrR5oMqnQbg3P3vD8OObFBbBMiFzTQvViEA50e4B5b7fQojt94oeETAGEUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b0yQvjJe;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5AB4606A329
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 22:24:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5AB4606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b0yQvjJe
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-49d611f6938so106049f8f.3
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 14:24:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794781461; x=1795386261; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YkVMBv/sY05OW6n9It2eq/jMeb5IfpTG+9202Dl+KMY=;
        b=b0yQvjJekO3PSUHhKhHzRM90blA1jqgD+9bqFw0785WKtWMeeX8nmRkizPtKugB50f
         4kgzzDXw1Okb2pUL7a/b7Tlv/deMoEF5qF8zy2dFFOCUYgKe8nsWi1eHuFmrlhDYQHaL
         xsLCJVUxO8TnwStZl74hS9tEP5Mc+iefJrwGIDhNGFnv3J6X9Xul109RTbeT5hL+IG0O
         TsH8tCyncH7AkvO+8j4h50MfyhIA0y/gycUXQ+MaHbbPWisx+jFygrjVVRZGHOb0jIAu
         f0wiRZr73uG4dXAHTvAs0h83ErXcq5F/jvpJ1dxxyQ9S/ptVF36pS3M1GMkuPibPiODQ
         mkJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794781461; x=1795386261;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YkVMBv/sY05OW6n9It2eq/jMeb5IfpTG+9202Dl+KMY=;
        b=Dtm/WhyVrAYHgeuPXn+9l1W20kSSiIgT/MMPCFjHKBcmneMsFioZJh0Ku8n2HO5PXE
         HNwQ7h34sAQRtsGGnlh+2oQGGgWhHYiCuxDvI2FUcz/6B2N1MeF1Ig1Bq/vc76D3aqPU
         Gx5Ovo3B6Xy5oS775ApyjxT2GYs2UOUPrwn+WQWwPPztVbGzY2pFVmQMwTutS1fmQJY5
         sKJVkoDrYoNXi44wnZtkTqKRDwIdf/v3v/ZyZOP02lhjmxhhFVCE4cxg2IYHmnUzy2Ay
         P5bYS+MwOmanljYqsjy8AgkWbSnwWGEtKxT4EPWGO9dSjIoSckLdDHdLeharZPf5Qcok
         A6IQ==
X-Forwarded-Encrypted: i=1; AL+hErG6wJivZgljXqJ1zhuRQUa6oLsyOC4wL9LE8iwuanEIk9kwf1CGJ6B9LeA4FgHATl+Nq18usrfI/gUnU0A=@vger.kernel.org
X-Gm-Message-State: APuU4Z/JnouwxNc2ko38oOMYOxIYRFd4bxB4JgT8HsiAev4/lzD5JNq0
	brg9T717+P8h6PRwgDREn9T1zXleRtF589Ew8RfOz4v0ELGSDqpo6y2R
X-Gm-Gg: AYBFou3ZwY/4qllPotAVYdk8GD/gxy0NjFuswDBxECP3+Q4TVWamXdA4Xc3o73D6XPx
	2iVM82ocprxtvl5LXdOH9jV4uzIQj43bPr4e9aUkpJVseCceNpjE9fsx7aBrIV1hWJhnTYh/pbe
	byanf7uJMTPSZrKjb6FEwLIXoGpHR9LagbTmLOb9DpNYxIIHPtpTZMQzN4e5IvSRV3p3JSFPOdx
	nsD6CsuTFExaG/Cq76DJ568vodHjOaYfdc2OkgF4gtfU0RxJPSCcj17/gGp3KNbW/98N0zGlIGh
	EKELDqXyGZtl9GONRM4aLO7FgTzSo5R/R/iqegV3RBzZs4q43ht2B1OTcQA6wGLbV7SW/PLQ/bh
	xNz9yu7sUVoJrG43QZNJHrzlxTiywkCo7BRcKU0hh3s5nUaZko31SJhDXx1LI+Epc3Ix92qbNio
	nmStVFDCdonc5lsQmZtL/sz3WjkWbYqogw77F5RKVzusG010PX20GoAvuz8D14yLLqXJKftSLC+
	A7aEdj7oaVZMdyb1jnrYSp0g1dtj6QBbo8xGO6V6l/ffSWQCZRpiv4s6xiiN9DR2B6af0kKeGfC
	lLIqwbWr14HpXY85gbnJGCmb7lwsLyFpj5F+mMSyQHjNhUDlZnOvlYYLQujZVDVjfAGATw2B
X-Received: by 2002:a05:600d:6409:20b0:4bb:6fb4:586d with SMTP id 5b1f17b1804b1-4bb6fb45a20mr28190285e9.0.1794781461202;
        Sun, 15 Nov 2026 14:24:21 -0800 (PST)
Received: from Nuel20.localdomain ([105.112.221.201])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2842e6sm346050855e9.4.2026.11.15.14.24.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 14:24:20 -0800 (PST)
From: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
To: netdev@vger.kernel.org,
	po-hsu.lin@canonical.com,
	linux-kselftest@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
Subject: [PATCH net] selftests: net: arp_ndisc_evict_nocarrier: propagate the last test failure
Date: Sun, 15 Nov 2026 23:23:51 +0100
Message-ID: <20261115222351.52930-1-emmaonana18@gmail.com>
X-Mailer: git-send-email 2.43.0
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

run_arp_evict_nocarrier_disabled_all() reports mismatches with a
"failed" line but never sets ret, so the script exits 0 even when the
all.arp_evict_nocarrier=0 test fails. The 2023 bulk fix wired the
other five test functions and missed this one; the v6 twin
(run_ndisc_evict_nocarrier_disabled_all) already sets ret=1. Set
ret=1 on mismatch.

Fixes: 1856628baa170 ("selftests: net: return non-zero for failures reported in arp_ndisc_evict_nocarrier")
Signed-off-by: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
---
 tools/testing/selftests/net/arp_ndisc_evict_nocarrier.sh | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/net/arp_ndisc_evict_nocarrier.sh b/tools/testing/selftests/net/arp_ndisc_evict_nocarrier.sh
index 00758f00efbfa..4afb953a3e479 100755
--- a/tools/testing/selftests/net/arp_ndisc_evict_nocarrier.sh
+++ b/tools/testing/selftests/net/arp_ndisc_evict_nocarrier.sh
@@ -139,6 +139,7 @@ run_arp_evict_nocarrier_disabled_all() {
         echo "ok"
     else
         echo "failed"
+        ret=1
     fi
 
     cleanup_v4
-- 
2.43.0

