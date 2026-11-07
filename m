Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=83.166.143.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794078849;
	b=jRv85omD0DeFoIyzMQsuKuOGVRVE76IzZF/uCqYRzo1pvgmKEeK8T5K6eDO6puOCC7eV
	 Ryp/uJJCowajkyMHNhqgfL+m68oTiCzaIKwgIZanNKezCOq1YQ22aeymydRNqqGA9MH4R
	 0bIWYYoAXjUfRH4vhNoUCNHMuYBAWBvHuhLFhwSYCsAq/5MsbZ/m75mYO31d2dFpn4mR2
	 5eDmrScaWnKF1voP4AcOFr3Rdw+H61OYMNJIg7oS0Sb8eOLyuFZj4hnR66LbWGtJCEVMW
	 +Lsuet+npNZysPYT3ik+X2PUC6i6gOZQvhlBlXvxTr+ofCTrKObyPSyiCwNTMlia33A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794078849;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Infomaniak-Routing;
	bh=79CCLER5XkcOWvks0TM+BO2JVYt1R9dSbZEWQHd5IgI=;
	b=EMG7Z0Hyq81GX9zzxF5dAYPiusnEP8v5BbuODpj8yplkQDGbKtIQoiGDp19SR9adSSEG
	 hkVazTSPFaSa0ENIpaalp4PLHTAKavzmreTeIkXG9cpa8jhcU6ew83YThn93H/FuM6FS3
	 nZFMn3WKr6SyCUFpppfe5VgWKzIKXlkVy6Oky0BSRjmTb7jwigA/xmmzBuCecpJmreKid
	 ulzKGldWnTX4+uQgLgHr49DCNl+vQ+WzVpvg0azxCv1/rzmOZOAFX9IJ7HwlgBewD3KYc
	 I91rmBOidHJemJ/zd45AtwR5yi7xl6KQoSuTX5ls2CZxBr2hPbkA6ihcp7lFelo4EYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=daylightlinux.ch;
	spf=pass smtp.mailfrom=daylightlinux.ch;
	dkim=pass header.d=daylightlinux.ch header.i=@daylightlinux.ch header.a=rsa-sha256 header.s=20261016 header.b=Jro0Z5g3;
	arc=none smtp.remote-ip=83.166.143.172
Received: from smtp-8fac.mail.infomaniak.ch (smtp-8fac.mail.infomaniak.ch [83.166.143.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F0A4606A32C
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 19:14:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F0A4606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=daylightlinux.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=daylightlinux.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=daylightlinux.ch header.i=@daylightlinux.ch header.a=rsa-sha256 header.s=20261016 header.b=Jro0Z5g3
Received: from smtp-4-0001 (smtp-4-0001.mail.infomaniak.ch [10.7.10.108])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4jMQh63krlz2Zj;
	Sat,  7 Nov 2026 20:13:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=daylightlinux.ch;
	s=20261016; t=1794078838;
	bh=79CCLER5XkcOWvks0TM+BO2JVYt1R9dSbZEWQHd5IgI=;
	h=From:To:Cc:Subject:Date:From;
	b=Jro0Z5g3NTAdltlqgUbT9BBMuG/MZxOiqoWmQ8QL3r65gCICaxzkGjQP2K7h2pqpX
	 +Dygt/08MrLx7gIVfv39CvilpengMhFae+bMAy3I66ojpRfgl3z8kB1wSbTEWkicfy
	 nIyrh9Wyv5gDifD9OtD9suBXa2/j7oAlOT7xn4y+l1rAf8FMreBnK1xF9zS1D/y4+R
	 yDUpf7vLnf9Thu12FKEqprE5RVSE85PNUNDTcUtsWqj1tpq1LjonHTpLxOOIsKbFbo
	 FtyU5o+pxAHHobR0MHVcRV+zyw0kFc7H4WAVAD7UxTb9a5MKqKyIcwE717ztcblyUy
	 7S9WqBlZthP7A==
Received: from unknown by smtp-4-0001 (Postfix) with ESMTPA id 4jMQh537DSzJBX;
	Sat,  7 Nov 2026 20:13:57 +0100 (CET)
Received: from unknown by raspberrypi with local (Exim 4.96)
	(envelope-from <info@daylightlinux.ch>)
	id 1xPlrQ-00036w-1A;
	Sat, 07 Nov 2026 20:13:56 +0100
From: Hamdy Abou El Anein <info@daylightlinux.ch>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: arnd@arndb.de,
	quic_johmoo@quicinc.com,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	hamdy.aea@protonmail.com
Subject: [PATCH] check-uapi: avoid truncating the failure count in the exit status
Date: Sat,  7 Nov 2026 20:13:55 +0100
Message-ID: <20261107191355.151276-1-info@daylightlinux.ch>
X-Mailer: git-send-email 2.56.0
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
X-Infomaniak-Routing: alpha

From: Hamdy Abou El Anein <hamdy.aea@protonmail.com>

check_uapi_files() returns the number of failed header checks as its
status. Bash truncates this to eight bits, so 256 failed checks return
zero. run() then treats the ABI check as successful. With -q, the error
diagnostics are hidden as well.

Return a boolean status instead, while keeping the full failure count
in the existing summary.

Tested the complete CLI with fixture Git trees containing 0, 1, 255,
256, 257 and 512 removed headers, plus -j 1 and -q. The 256- and
512-failure cases now exit 1 instead of 0.

AI assistance: ChatGPT/Codex identified the issue and prepared the
change, commit message and executable regression tests.

Fixes: 1f7f31bf7202 ("check-uapi: Introduce check-uapi.sh")
Signed-off-by: Hamdy Abou El Anein <hamdy.aea@protonmail.com>
---
The regression fixtures use a minimal headers_install Makefile and
an abidiff stand-in that only supplies --version. Actual removed-header
checks, Git archives and the CLI exit path are exercised; no ABI
comparison is invoked for these removed headers.

 scripts/check-uapi.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/check-uapi.sh b/scripts/check-uapi.sh
index c8beec588..93095a5b8 100755
--- a/scripts/check-uapi.sh
+++ b/scripts/check-uapi.sh
@@ -295,7 +295,7 @@ check_uapi_files() {
 			"$total" "$ARCH"
 	fi
 
-	return "$failed"
+	return "$((failed != 0))"
 }
 
 # Check an individual file for UAPI compatibility

base-commit: d48723711bae9b8cdc56719c448ba42fef28cbee
-- 
2.56.0

