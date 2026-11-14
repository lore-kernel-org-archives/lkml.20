Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794636002;
	b=QlWEjnkCLh2Q/1AualuWp2BXHlGXTr136/u0QPRzrTU5k+qXCDmrptA9iT8YLtVpPaQS
	 3IGmr/GZPctNww1qMt2/b889loD5ED5/ZfJ8Ey9pK93Id2AjrBQtmupY1q5mXLfCR2SaM
	 rZEhWt6rYEEgdY0Ke3TS0fKWcApq/TqEM4i6lygLB6WNjr6v1znuUGfy6Z94Bw52vaVpC
	 mMGsuC4XyfH/wdj0lZqtLNwhQmMHakCSaBDg+q8s+lW1Qhf7maOSsYLM4iPouNPreMbcg
	 lyjyJmTSE+UtpiX8DB6T7vn0qFpK1D5tjVWwZN6L6oS/gcvAWJEVQckhGJvtDRjfRUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794636002;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=nitv642DJIuPKcSaK1AiD/SOvyc25qlxCIBt+/0tYtI=;
	b=XW9Z04N/1B3dcQVK0D0MetrQ9ftLziGDc9Ttr/pld5ADzrAx539fFVgpiYA6w4fYVfAR
	 IwKGDsf+mQO8y7ZhWDSchvRi9fs0BM+BG1KMCrD1c2nVUX0lUExYDjuuEgKvAHNBD09UI
	 NbSPTBdSD1Ew5NX9yNw0/FVtTWNosNqwB/xC8IVvnTkXheMBs5iWww9ST5/hXMOPNlwvA
	 P82BYICTj/7VuvZHVP2xxj9SXx29cGbtRZqjSDDqpNc2D4nzCUpn33VsB0LLsDgQjYzPi
	 glGrK6igkUHTNIi+FbPF3ubiOlmZlyd3GIOpKT2wp2I24+x64vv1FpAnHxVVcsgMpfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tz0QAjXA;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C907606A332
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 06:00:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C907606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tz0QAjXA
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-37628596783so2992473eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 22:00:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794636001; x=1795240801; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nitv642DJIuPKcSaK1AiD/SOvyc25qlxCIBt+/0tYtI=;
        b=tz0QAjXAf1Cc2MKwU31CKxEfqGZtKCSRW6xsbROQULBVyz+kyY+hS+d48ZfMPnZGT3
         EXOO6qfV8SFS/YJXx2PkxyDKoaaXUK0RNSuH59qXR6BjYdaG+Rl5THkDj9KGr6j5ng0M
         sdt6TIG3DuX08xc+7XQXedXZZpaJV0nNFAtA3IiTZz+ecmLNva2decH7FQqza9yCMqYJ
         3vQvmaZEDJfC+yGobQr5n1lu5BDLPCyFKgpLfi+r71i3JDTMgVYlEGn/1VT2UgNJFFzi
         K56Lve6mXHsanyxWMadPOovdPC8M0CU4IIIsQLL8lW8Q6n8AoJE7N4V5q9oZy+T5rwmn
         K4zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794636001; x=1795240801;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nitv642DJIuPKcSaK1AiD/SOvyc25qlxCIBt+/0tYtI=;
        b=KURfwNqHrgC9LpIA5H72sbKQT9BeN2k8FhdRU7TlFPENxHVIo6z51rSFj632vdfIqy
         1MK6RqsUDTGzoLdkUDl1DIZyCSAHB8BDFX5EUWM4iNX9+vHt6SmtFr2pEKCDBfoLH/QN
         wKVTcomHVGjHR90IGEp9ceSCeBu7kwwkoMJ7vmT6kZ4Hbwpd6UZZN8ArmGlxO+NSfsSZ
         jtDYcihFFVeWK4y08KC8JT+IHGJJcgD34fkZzacw4w6QaL/guXAEqQQe0CTnISXhnw2H
         NnFmcrxuD2QnDqFLDQV+VSd1PpeUDrcoqrL1D00FsPqRNIHtHmZcR/BRNn9QSAnYnjqt
         isVA==
X-Forwarded-Encrypted: i=1; AL+hErEsw8GN4m8/9F09amcmKlhVcXddQBeu1izmOnQcUtwh/oEcE6G87eSCI4dFLktQfCVkUeTotOEfiNYkg8I=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ijg2BPPaGkoiGchf74yZPhuZJt71wBsHkgi1sFhEonwNbEqkV
	y9Ltb6dEWEQZy99QFr63HLchBKOLXeJbvJ/El+8momY+1KODm3YYoR0XGZG2+g==
X-Gm-Gg: AYBFou2zy4IQ2itIA15CGu2p9isJtT10on5AvDkTNDTFfyZSVG9IAyk51pIJTCPgBWP
	FbtX7crBHCorfnV2NvYWJkthllfH9OIDi+Ofip645bsXEppYgqKCM20ghvWtROh6FVPFWoYvIFz
	yg6TAeUbEG/67LhQq0k5FFoo7lTT6hLKBJ4ZOiIIXUXRJL52XE5ClmD75SdFUOdnHXViKOEziCf
	nb7DpDWQONHCwydGTzp3L3LKBalXQPrpBvNUP93oh7PrbWIycuXv78hno/WEPyqfJiCQ2F2jiN1
	ngJQ6D+Pg2mJ8PBVEckTOPa30bFlQfw8OqpYrhpyyYYLAiIsXR7ObPkxMtK53IMDXUl7E4Zco1c
	hzXGwxKeQP7yaWRdYQKcU4+61VMzk3XFbnGIZHFCTVlar/jeXWYEE0TW9b/6dE7apwR5S6d9Drr
	qiqK7bhO37F/MIYnTQwdmcsoD8eVFIpj0AgorK6/IKhw03peFzdApdlwdRlBFwO0dhlH/uiPjwP
	TbP3QtOnGjW4bn1iUiQaqWoXeRkUi5PkIwfWzA4m8Qe4/4xf0Ct8uGSxLK1TUgsQSmPAGBUxYpE
	eK08+ESY0yfnE3S1rVRosM0m+wbELTdMBSMDZx63AEOwbzDzL8tSMk8yooWBSkp0Ac95kkP96Ss
	UYxAi3Rr1nxvhW/Ln
X-Received: by 2002:a05:7022:3a85:b0:185:fd0c:4585 with SMTP id a92af1059eb24-1b50312b3b0mr4578152c88.33.1794636000901;
        Fri, 13 Nov 2026 22:00:00 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:560:7267:5908:e9a5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031b2519sm11323590c88.13.2026.11.13.21.59.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 22:00:00 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH 00/12] HID: rmi: Fix report handling, device lifecycle, and
 clean up code
Date: Fri, 13 Nov 2026 21:59:50 -0800
Message-Id: <20261113-hid-rmi-v1-0-afc43d97d766@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIANb492oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDAyND3YzMFN2i3EzdJAsLk0Qj0zTjxBRDJaDqgqLUtMwKsEnRsRB+cWl
 SVmpyCUi7Um0tAIratKlrAAAA
X-Change-ID: 20261021-hid-rmi-b884a25f3ad1
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Andrew Duggan <aduggan@synaptics.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev-6b8b8

This series fixes several report handling and device lifecycle bugs in
hid-rmi: it treats short output report writes as errors, limits trailing
0xff stripping to attention reports so register read replies are not
truncated, and validates read data report and transfer length bounds. It
also gates reset work and power management callbacks on device start and
suspend state, re-selects page 0 across resets, avoids GFP_ATOMIC
allocations with hard IRQs disabled, and stops modifying the shared
platform data template during probe.

The rest of the series switches output report packing to unaligned
accessors, uses scope-based cleanup for the mode buffer and page mutex,
drops dead code, and cleans up coding style and logging.

Jiri, Benjamin, could this series go through the input tree once
reviewed, as I have follow-up RMI4 core changes that depend on it? Also,
would it make sense to move hid-rmi to drivers/input/rmi4/ alongside the
rest of the RMI4 transport drivers?

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
Dmitry Torokhov (12):
      HID: rmi: return error on short output report writes
      HID: rmi: only strip trailing 0xff bytes from attention reports
      HID: rmi: validate read data report and protocol transfer bounds
      HID: rmi: fix device lifecycle, suspend, and reset work handling
      HID: rmi: re-select page 0 across device resets
      HID: rmi: avoid GFP_ATOMIC allocation with hard IRQs disabled
      HID: rmi: do not mutate shared platform data template
      HID: rmi: use put_unaligned_le16() to populate output reports
      HID: rmi: use scope-based cleanup for mode feature buffer
      HID: rmi: switch to scoped mutex guards
      HID: rmi: remove dead code and reorder report write helper
      HID: rmi: clean up coding style and logging

 drivers/hid/hid-rmi.c | 506 +++++++++++++++++++++++++-------------------------
 1 file changed, 252 insertions(+), 254 deletions(-)
---
base-commit: 84abb955b1015477aa11a96e2f3ac1b938b77f48
change-id: 20261021-hid-rmi-b884a25f3ad1

Thanks.

-- 
Dmitry

