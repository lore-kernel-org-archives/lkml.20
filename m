Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.211
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794360301;
	b=jnbvwq79rKuJMM79UHRD1QUaPqfd02CZj+OTLnuskAOPzpV35AKw+gMvjxDHTQIBZaVG
	 9pHPs/KmVY0FpF5qwz4elO9vMAmPpRCDuYVNKxm7HUSMisu7EIl4P4QxECz8YK7gOnVox
	 p6iigtA5srKL5XbWsLp1bWwKf1gRTrTOY3GgbndEokpjo3USw+wZcvxoEkJeCrIzVKL/K
	 AmvfhX/ykkgm15L1/63TnE1slY1xqFk4RtrVlqywe5DudFr7dLHwlBOJ+1a1EzSu1iYPS
	 6snW7C0b7Sd88h/+Q79s/paVLxSMJpTEFVEkZ8VyfVlezPlwUO07LD5BcnVKRSnV1Sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794360301;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer;
	bh=pqnqpJZbk9LN/YC96sA7caCJbjXRdT7qliZnOhWckU8=;
	b=4sC3EI8xnzqhw6TfFtaRIVZpWmS/pplvEoXqEbmHkYW3IgBmW6I2nOTMH9teZCGKXsjz
	 dymW7RnYhoOnH6Ok6MeaHAK+UpaGxA62r/Nd1xCb3xFZVZeGSErumnj36KLOLgfIUj9kk
	 l4XbTFn/Vc2HJmOct/xCxoEHKiCDXGV+IobpWVR9OyJ1TTQ+PjD4jpPL3ctph8pcni3Sw
	 TYakKMJnTdvrpLm0COEMcBlGgI96phjbrqPrY345v+tImMB9qFFcibOYuZDRbvxohnTCb
	 4BwFN5behlBcovWtsqFdvVxZopdA30ymFroCtgDGsPgAI76j9eAhi1EzQyCr29df/zw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=wHFtXET+;
	arc=none smtp.remote-ip=95.215.58.211
Received: from mta1.migadu.com (out-211.mta1.migadu.com [95.215.58.211])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABA87606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 01:25:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ABA87606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=wHFtXET+
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=ZzFsRZmu1OqL1asuBuzXiHjTs/WFmdh+Zt0FEVTsUQc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794360298; v=1; x=1794965098;
 b=wHFtXET+IkOPnXtyBPeACbETwBuroKemIlx023Z+5u0V7ZfGfc4HYAS8Ki7gfNitD3kX1Rxv
 Ib3FRcdZkv+Abjn2DPPtNA/fiwsMSnd/8AxHAPlK7+lnPCDbHht1rvyiahYuB5QU/0YcA9eoTMJ
 gIPj12rItzJq/4Q005y2aLX4=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 2d459beb49c23567;
	Wed, 11 Nov 2026 01:24:58 +0000
X-Mizu-Trace-ID: 2d459beb49c23567
X-Migadu-Flow: FLOW_OUT
From: Hangbin Liu <hangbin.liu@linux.dev>
Date: Wed, 11 Nov 2026 09:24:38 +0800
Subject: [PATCH net-next] mailmap: add entries for Hangbin Liu
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
Message-Id: <20261111-mailmap-v1-1-8ab349555808@kylinos.cn>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/z2NQQqDMBBFryKzbkomYrBd9R7FRZqMdahGSUQUy
 d2bZtHl433ePyFSYIpwr04ItHHk2WfASwV2MP5Ngl1mUFJpeaulmAyPk1lE27SWdNtYQwh5vQT
 qeS+lJ3hahad9hS6bgeM6h6NcbFj8r4Yo639tQ4FCv3oljXbO1fLxOUb2c7xaD11K6Qv4cOHcq
 QAAAA==
X-Change-ID: 20260930-mailmap-858ce685cae1
To: Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Hangbin Liu <hangbin.liu@linux.dev>, Hangbin Liu <hangbin.liu@linux.dev>
X-Mailer: b4 0.16.0

From: Hangbin Liu <liuhangbin@kylinos.cn>

Add the active email address for Hangbin Liu and map the old or rarely-used
addresses to it. This prevents get_maintainer.pl from listing not actively
used addresses as patch recipients.

Signed-off-by: Hangbin Liu <liuhangbin@kylinos.cn>
---
 .mailmap | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/.mailmap b/.mailmap
index 5ab2cf568d3d..e43b884e4738 100644
--- a/.mailmap
+++ b/.mailmap
@@ -365,6 +365,9 @@ Guru Das Srinagesh <linux@gurudas.dev> <gurooodas@gmail.com>
 Gustavo Padovan <gustavo@las.ic.unicamp.br>
 Gustavo Padovan <padovan@profusion.mobi>
 Hamza Mahfooz <hamzamahfooz@linux.microsoft.com> <hamza.mahfooz@amd.com>
+Hangbin Liu <hangbin.liu@linux.dev> <liuhangbin@gmail.com>
+Hangbin Liu <hangbin.liu@linux.dev> <haliu@redhat.com>
+Hangbin Liu <hangbin.liu@linux.dev> <liuhangbin@kylinos.cn>
 Hanjun Guo <guohanjun@huawei.com> <hanjun.guo@linaro.org>
 Hans de Goede <hansg@kernel.org> <hdegoede@redhat.com>
 Hans Verkuil <hverkuil@kernel.org> <hverkuil@xs4all.nl>

---
base-commit: ed04b202027249e2769420893220f54a56e0c59a
change-id: 20260930-mailmap-858ce685cae1

Best regards,
--  
Hangbin Liu <liuhangbin@kylinos.cn>

