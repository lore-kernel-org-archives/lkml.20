Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.223
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794533390;
	b=XjgdiqoHn3huAB+vLYq6sb9DWzGs19SP+t3rTgKPyo5DnFhZIRr9kP9Yw8yfiEHummpE
	 M3OLhlB5SykJjZ/SfHuV0sAu+Y7RNg9pciTNChq6PUwxkEAiN29ZffFQn5GtWvg0Un4GM
	 4VZHi0s9oVSJQ+z/BJHd3vHxTpvijz4lhJHTCqKiddYOrM8l99gRGW3npWnB99Z5zE3lm
	 2wt0bvhThRNp2cEH8cThQloAwCu9Uo440zReJuMVMKjQnDXN7jua/ydBuHh7HnKEJtpBl
	 Hid+/+4zXo6iWie7LCLjGAdxygQnjNsufrzcXsoeBl11K1i6NiIMv8ECJ3tcLynWB/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794533390;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=oqyJWamYBJxq+jEb/AG04JWYCWpTDYqf7zDMnJ+2noc=;
	b=bUR6QLoaPLnzsFRnjqEenG3YUAYKCWVywZ9HemdJ0AAbV8j71APF3haASwxTVWwYni1q
	 0njDvUFBZleTNCd2XoXwmKK6pqMrw9DVfMQorLOgRk7qXR/Wl9B5qUHD8Yl9KxW3Oip8o
	 xGaQPwjeBTHTHBgSnNve0pcFSgbg8tY+hbyN7ZboqmxmuYLCezvo6a3iwV/R+IvtvfpNq
	 6lRmACeGK+Cvfq8W8JTO2QYHP9h1QVTsfpZXQ8o/RQydGdzQSe9MXUACmgOdHrTqBjibG
	 WJSTaPTt/0N6IeAbYCYAJAzyPh6hHVEy76edQPDFrvP7HkRoWE08jj/VQlURDy/mwXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=hZsC7XUV;
	arc=none smtp.remote-ip=91.218.175.223
Received: from mta0.migadu.com (out-223.mta0.migadu.com [91.218.175.223])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D11D8606A327
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 01:29:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D11D8606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=hZsC7XUV
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=4mNA24lWFtHkqGkDQ70hiaByiqDolVJTxo+Az4AGD24=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794533386; v=1; x=1795138186;
 b=hZsC7XUVp8t5bMTEMaUwtWeQAeOkNxNPFvP7K13k5SCghCHWeYVynsMeSTMD5Shcqjlc4Ulf
 WDhVC9Z7iY0n6CGrK54D8xzFlepbra8aUl/ITL0jbBZwWn8bUo8NZUxxTojPISyfc4COEwRwRPB
 VppQ3iB2gBg8DjjvxwlFmo1k=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 6f6a5250961c57b7;
	Fri, 13 Nov 2026 01:29:46 +0000
X-Mizu-Trace-ID: 6f6a5250961c57b7
X-Migadu-Flow: FLOW_OUT
From: xiongwei.song@linux.dev
To: alexs@kernel.org,
	si.yanteng@linux.dev,
	dzm91@hust.edu.cn
Cc: corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	paulmck@kernel.org,
	linux-doc@vger.kernel.org,
	rcu@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xiongwei Song <xiongwei.song@linux.dev>
Subject: [PATCH 0/2] Add RCU docs Chinese translation 
Date: Fri, 13 Nov 2026 09:29:16 +0800
Message-ID: <20261113012919.5631-1-xiongwei.song@linux.dev>
X-Mailer: git-send-email 2.52.0
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

From: Xiongwei Song <xiongwei.song@linux.dev>

The following 2 patches are adding RCU docs Chinese translation for the first
time. 

Currently, RCU is not listed in TODOList in subsystem-apis.rst. I propose
adding it.

Thank you

Xiongwei Song (2):
  docs/zh_CN: Add RCU/index.rst translation
  docs/zh_CN: Add RCU/whatisRCU.rst Chinese translation

 .../translations/zh_CN/RCU/index.rst          |   50 +
 .../translations/zh_CN/RCU/whatisRCU.rst      | 1220 +++++++++++++++++
 .../translations/zh_CN/subsystem-apis.rst     |    1 +
 3 files changed, 1271 insertions(+)
 create mode 100644 Documentation/translations/zh_CN/RCU/index.rst
 create mode 100644 Documentation/translations/zh_CN/RCU/whatisRCU.rst

-- 
2.52.0

