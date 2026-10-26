Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.152
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793011647;
	b=0jjVPusKAlUT7CNNIeA7hP2NRCz4nJMPA94UjEBkj2obK8DCTtSlKgEQ2rv6u2Q5MWlk
	 8etIVNXNgXuUUWyJPWIdKJXNlrPdYFcAz0+mF+qL/nqdalrDQafj2uZEG+PmMlfvJKdiP
	 ktFtP5vMPxLinMkJ+GBW0T+fY0tPc9pXObmu/gcxTuyopMrx4ikxwNoluf+ieps8icUps
	 qBcZKjC6s1npoJ4iLXEw2rFIgmIftgriZoZ88t/K8KgU0cmJyshhFY6wXlzVkTLF/LI/F
	 /2IMhl8pqEXLPObUnaH6jETtYF0yg0oCcX7lQiUJCHQpWtxJDtoleTbphYszcDBZMFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793011647;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=SVAcX6Gb3HNs5IR8OdNwJpF1jsluL94NRCuw/7pcfCY=;
	b=LCXJ7IHoVjQ4TFoRugckTC4YFxTPa7J+7iQ2aRYrJLlhFFx89kO/WpqaxDFo4z5rDDtH
	 7ZZJggqR8I6G603Gyxoa8QvYViedvaa2f1006RR43Jruc8F43zhPAMqxHDRUTb5Auj1jA
	 tfrQgOU9/9U83N0gCX2tYc9jUBqKT1kESwy4j1A45ub/1NHq9PATVqjwIedt4/+lqiTU9
	 BhHeUmGzxviUIqnVUdxtO41QiDOHmVaTS+NVOrAKDf4bd1NWAhomOv5bNFRhQ7TVxuZQa
	 sfBM4L5pV93azVvnRPdoE+xCW4PGHeZQiF5MSDUzkpv9lHXsJo2QsgnAqbmn7Nmhh8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ZTBbmyQM;
	arc=none smtp.remote-ip=95.215.58.152
Received: from mta1.migadu.com (out-152.mta1.migadu.com [95.215.58.152])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B509606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 10:47:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B509606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ZTBbmyQM
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=nmQxofaYbq2Tro7RLOB36neIEVztkT/Dm1op9wfzcug=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793011643; v=1; x=1793616443;
 b=ZTBbmyQMXAzJGP8lgR8juGn2a41UornBcZI92ibMpN94cJvzBwEQdWgVspFUV7b8OqYNUJjs
 y4gFQcm3WUUly8dGV+SEWWkqYPiiqp+7dhnwNVhsLe8DHqwAQgozGJHig+yCnRw4AGowp2OSSmk
 Nd5d8DWz9F0pzKLi/NLGyjn8=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 52ee54dc4b49457d;
	Mon, 26 Oct 2026 10:47:22 +0000
X-Mizu-Trace-ID: 52ee54dc4b49457d
X-Migadu-Flow: FLOW_OUT
From: Andrea Cervesato <andrea.cervesato@linux.dev>
Date: Mon, 26 Oct 2026 11:47:17 +0100
Subject: [PATCH v2] MAINTAINERS: Update Andrea Cervesato's email for LTP
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261026-acer_maintainers-v2-1-4cf0f350fdf1@linux.dev>
X-B4-Tracking: v=1; b=H4sIALQv32oC/32NwQ6CMBBEf4Xs2RpaiBZP/ochpiyLrAnUdKHRE
 P7dgncPc3jJzJsFhAKTwCVbIFBkYT8mMIcMsHfjgxS3icHk5qRzUyiHFO6D43FKoSCqxcoWtin
 PtkNIs1egjt+78lb/WObmSThtnq3Rs0w+fPbPqLfeH33USitbWuxKV1VO51eZhY7oB6jXdf0CR
 jvpocEAAAA=
X-Change-ID: 20261023-acer_maintainers-dc9838b478fc
To: Andrew Morton <akpm@linux-foundation.org>
Cc: ltp@lists.linux.it, linux-kernel@vger.kernel.org, 
 Andrea Cervesato <andrea.cervesato@linux.dev>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793011638; l=1796;
 i=andrea.cervesato@linux.dev; s=20251210; h=from:subject:message-id;
 bh=nmQxofaYbq2Tro7RLOB36neIEVztkT/Dm1op9wfzcug=;
 b=E6jIBQ7Lf9+R8/Eoc6Xq+FvpNy44Y2BEJ6NJvMbe0eMzXa1msWq5MzlhIXWx7waW+Nzy97r5a
 RWaOnobWqaxBABE6/iH8b1wsF7MPjWX0GfBL9B2TqCBwCPDd36A4t34
X-Developer-Key: i=andrea.cervesato@linux.dev; a=ed25519;
 pk=zKY+6GCauOiuHNZ//d8PQ/UL4jFCTKbXrzXAOQSLevI=

I'm not working for SUSE anymore and I will use linux.dev email to
develop and maintain Linux Test Project. Also update .mailmap.

Signed-off-by: Andrea Cervesato <andrea.cervesato@linux.dev>
---
Changes in v2:
- Update author and Signed-off-by to linux.dev
- Update .mailmap
- Fix typo in commit message
- Add ltp@lists.linux.it to Cc
- Link to v1: https://lore.kernel.org/20261023-acer_maintainers-v1-1-848cf4a99a10@suse.com
---
 .mailmap    | 1 +
 MAINTAINERS | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/.mailmap b/.mailmap
index d73ec73e5ba9..60c198336fac 100644
--- a/.mailmap
+++ b/.mailmap
@@ -81,6 +81,7 @@ Amit Blay <quic_ablay@quicinc.com> <ablay@codeaurora.org>
 Amit Nischal <quic_anischal@quicinc.com> <anischal@codeaurora.org>
 Andi Kleen <ak@linux.intel.com> <ak@suse.de>
 Andi Shyti <andi@etezian.org> <andi.shyti@samsung.com>
+Andrea Cervesato <andrea.cervesato@linux.dev> <andrea.cervesato@suse.com>
 Andreas Herrmann <aherrman@de.ibm.com>
 Andreas Hindborg <a.hindborg@kernel.org> <a.hindborg@samsung.com>
 Andrej Shadura <andrew.shadura@collabora.co.uk>
diff --git a/MAINTAINERS b/MAINTAINERS
index 1e3f9f2751fe..13f2242150fe 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15835,7 +15835,7 @@ F:	Documentation/devicetree/bindings/i2c/i2c-mux-ltc4306.txt
 F:	drivers/i2c/muxes/i2c-mux-ltc4306.c
 
 LTP (Linux Test Project)
-M:	Andrea Cervesato <andrea.cervesato@suse.com>
+M:	Andrea Cervesato <andrea.cervesato@linux.dev>
 M:	Cyril Hrubis <chrubis@suse.cz>
 M:	Jan Stancek <jstancek@redhat.com>
 M:	Petr Vorel <pvorel@suse.cz>

---
base-commit: 6b4b543fa18757297ac756a6fe6e64f506b7844a
change-id: 20261023-acer_maintainers-dc9838b478fc

Best regards,
--  
Andrea Cervesato <andrea.cervesato@linux.dev>

