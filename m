Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793891092;
	b=W3gqDcK65NZ9Xmnj2eqrG8emlrxVbIsSe2HNbNEpUM/V5LCG6NZTHbr+oYsiu6sK/Bzd
	 Gqq/fzri2YWRn84CUt7NssSWTWUhkBWwmW+tst4EBWgSg1XIdpP/ZrughA61pVPiHuAfp
	 722ObY49aYLqRjgB08QFzmR0aX8VT15l8K9JSglng9woqQDu3xOoIei+exKQLLwzfd+N/
	 qrfdC8DsJz3yAdpMTEzn+Gsqn6veElaKry2HgnO27kOzCQhxJrWEKfn+ff84n1s5hC0so
	 cHsT1iI/retIcI/xS7QFRwStr7QJK9npbQOGwdWtwXi0wp2LW7UNLcOJ08ZVCl2OXoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793891092;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=bfpdbUUIX16VN5mCBIU3OZ+av/8U5ZQPuLtnxoG4U/M=;
	b=a8RFiqalf+LChTutfbV7BfZy8GMkYTdjS0lH2YyoYHnfkbha5s1ziikiXkUcFn4vexNo
	 m8QeYpRJOT0HvY/zU2BW5zsjs6WDy4KB9nnsHCUq3KKyaOGX6mj/EpBEhwEqS8lI53FZl
	 rmVD5S4xnoF6e43RhntUK9F3oe9BF1okzNg+RWmkebmrGtyA2WNP9RpdccHGM0UBxdgzI
	 D3THGXEhmnSyzSgHQ19AL7rypEjxCltli5QmWGUk3H8fhtATWH0BkXRrWOWD6RUQBcc9i
	 pc7q4ijRPJe7ki31el7xaGqMMTqMuFQyw+M+/xITKCop4HKhcQJBUc6cuCzz4uKXU+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bzFOeGay;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4410606A329
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 15:04:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4410606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bzFOeGay
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso3297411eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 07:04:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793891091; x=1794495891; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bfpdbUUIX16VN5mCBIU3OZ+av/8U5ZQPuLtnxoG4U/M=;
        b=bzFOeGayjr/M5InmbjnG+mZzsQJNJyGjTjP8LVB8WONzHZ7oSs8qa0N9nw2STWV8bi
         0yCpaqQA1Kr363JXv1yq++tKnGLSMxNrzMyCdn9zWauPDQHW4/1nDqrMFhEDNaDYWgtC
         gClU0IA/e8md0gpkNY62b+BeH2ZOH7xEIX+c2PC6cRif+rdndbxt5zC43niNl0WWEjLs
         lxq7dKIJBSFtulQKRfKN82gMNktOjMsfhbze4OdtyKgSNDM+2duIwoOPPDxEYlK2Us5o
         Gc2tEf5oF8IJuOR/HqVT+KU/2PCUDPkRmXWRAYrN4EVE/CoS4bBq4xQ6LXl5wsFVxFsy
         JPzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793891091; x=1794495891;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bfpdbUUIX16VN5mCBIU3OZ+av/8U5ZQPuLtnxoG4U/M=;
        b=Tuvxt262Dm2qpnR/fBNg4HJCwn58KXVeAH4D3LWUQj+0abJFzfRp5ht17hEbeLvGBx
         9qw5HerlmPEawGtTSeqSp5PW6zPkm7ZUgjpNH40CVaPPpCfzhy7jOXIKbhZuyBvNac3i
         qjT0POwn9MifES+/O2z3E+6T5t8HVCQTyyoyIsgCTZmZo1XZ44dHZF1qnwkChSVThRkv
         H+OCLmwKEvDEt8/s4Z6rmvnzgGe3dUJZgoLLEFOef7LAuWSrin0Q7V7UsOtYNzENDXn7
         9r2Ign511+BobQoB3j6ncVCY9/TGqBP7qXdON4QPThVPjGdDtdidOud272/9dU6D70vx
         Tuyw==
X-Forwarded-Encrypted: i=1; AKwUvBz/ZBRFfSCUJAk+WZxd6P0zWq6c+yoa008k+i+mXe8LbDAT0B5GOkkAvL7ZLeU67qbP7noqxqiDtHBPIs4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/sx7B3+PgyLCvhJH7ME5/+e3V9Qyw6Hkh+BYDM5EiTq+XKEbOL
	p72hJDdqmmw/HINAAt9Hd+5oIxy7hP39ZqeHCxwLoRlqn+Tw7U0Lk9OC
X-Gm-Gg: AYBFou1HKyi2WerStzsRdn/daw/dOvACqTnZBXaaWXYCRGa4ygukEn+zB0So6U3dZ/h
	jWiaWA4VmETjOu3NwnaM4WChyazBkTOYUd8RbZxIDsFcY147h6BVdNArXUQ+cothnl/fmH+HcIs
	QtiuSREf/3oCv2s7N8WKZwV8mDbl+5nFV399FSWH5rSd7NpRTXeJZDQJQ/+XJ7qKorexTGp9Ig4
	uUuNVQPS01zheDAkrGswU7kBcgkfMU97d/D3OMWviOeGugVJ86kRA37Q1QQRh/zDbnLRAb53J67
	P4Op39D1ydaaIeuq6eJEH4XCfVDJXiyhmqN/QSGXpM+BYL1Tvr4SDHf/zylBoMVauKE/E9ol52J
	4KS91DIvq/sDmx409lXwu9dC9E0Hlulhd6iFCnB6E0qOaaZChrBfqUSk9Z2xqrilqzdsDBFnCRH
	kh12PiVy3+cvKKBgVTuiiFTlbvkfAXA/XxiiPWcIeIU3Y8GQLruXSLHXIeUXz0hCgbvdAttfaxZ
	80QZ3VdymyrT7ZPWmcKo6mGdL5YRZAQImYN1YPw/QysRDKgeaBfnSM87jK05+zq+zGduDZA/SA1
	SwIMmpx0UPKwYZVlyLYy45DaGNWJ1k+EzbCwQsGWVQXIkY8q35oZsA==
X-Received: by 2002:a05:693c:4145:20b0:36f:551:2bd5 with SMTP id 5a478bee46e88-36f05512dbfmr772632eec.32.1793891090524;
        Thu, 05 Nov 2026 07:04:50 -0800 (PST)
Received: from Anonymous.localdomain ([223.181.63.167])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36d34d5960esm18325064eec.5.2026.11.05.07.04.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 07:04:49 -0800 (PST)
From: Hussain Sitamouwala <husainsitamuwala21@gmail.com>
To: outreachy@lists.linux.dev
Cc: johannes@sipsolutions.net,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hussain Sitamouwala <husainsitamuwala21@gmail.com>
Subject: [PATCH] wifi: mac80211: remove unused drv_offchannel_tx_cancel_wait tracepoint
Date: Thu,  5 Nov 2026 15:04:33 +0000
Message-ID: <20261105150433.10816-1-husainsitamuwala21@gmail.com>
X-Mailer: git-send-email 2.53.0
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

The drv_offchannel_tx_cancel_wait tracepoint is defined but never
used. Its only call site was in drv_offchannel_tx_cancel_wait() in
driver-ops.h, which was removed by commit b4ca6084a84d ("mac80211:
remove offchannel_tx API"). That commit left the trace event
definition behind.

Remove the unused tracepoint. It was found with "make UT=1".

Signed-off-by: Hussain Sitamouwala <husainsitamuwala21@gmail.com>
---
 net/mac80211/trace.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/net/mac80211/trace.h b/net/mac80211/trace.h
index ea46c3cca21a..f34d079f3d38 100644
--- a/net/mac80211/trace.h
+++ b/net/mac80211/trace.h
@@ -1472,11 +1472,6 @@ DEFINE_EVENT(local_only_evt, drv_tx_frames_pending,
 	TP_ARGS(local)
 );
 
-DEFINE_EVENT(local_only_evt, drv_offchannel_tx_cancel_wait,
-	TP_PROTO(struct ieee80211_local *local),
-	TP_ARGS(local)
-);
-
 TRACE_EVENT(drv_set_bitrate_mask,
 	TP_PROTO(struct ieee80211_local *local,
 		 struct ieee80211_sub_if_data *sdata,
-- 
2.53.0

