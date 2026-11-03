Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793670089;
	b=0eCBPq0j1fNEER9RWhmJrjQk5QOhI7JC7Zb88dn7MuCFaA4D6S/Jy0+7miuJSIKcjET3
	 O94BpFkZI/TQtY2EWsbvuuwQmpwpQKKZAwQADvFTyOgzqLrmjU6GW/Ri8vLFkLRwcxCsz
	 2da+N+ycp+2pVft9Mslf9mKDEB31lm26M9Idt1TdSAc2UXFF+01MbVausSdp5WdEJOrYc
	 gKkGl8sJJHmIrV+d2a1kON+cs0KvkwKVXeQM+8Z3PBHw6JMCRHTGtIUlczxognu/O8MSx
	 hNHvrvxx6CgKfqnpvpwX9hLb8zSPUQRaX3MCkr+YX9F/Wgxg1oxYLhDq4hjoLUcAMZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793670089;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer;
	bh=j6+ebqFALIHkVs+GSXPdulrGAa+wS32Z9u6n4TT9iNk=;
	b=sYG++O6rgKCOAEjS3+RFzGW8UmDSJkuRjEx9oyY0lSDUPdaE99Hrq9j3xGMHWhPn9hNq
	 OmyvpCBzhlPdTKWnLfo5LpY8EuDHruj/paKnv8RyopuSOZ7in13OLcMplDOC/oHS7zpfQ
	 rCEajns0sEc9Tgwi2jw1N2DXrODQyz5m641hFH0FxEbhKcOYCsoxQBY7yCl7a3Ju7hFbH
	 NDGbHedDODd/lx5LcKaJYIxzZ63Otp4mSzVj8XCuYxwxC2nw4jtJywyVLdzOEVGx8OMyq
	 KHcLJXW9Cv+5DyrSn8cgyiS6Sdy104T1Q0tRclSXvbMcVFX9ukP4UMIrjdtMvbf6zKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=lVjRCwWh;
	arc=none smtp.remote-ip=95.215.58.225
Received: from mta1.migadu.com (out-225.mta1.migadu.com [95.215.58.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B5B606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 01:41:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1B5B606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=lVjRCwWh
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=t352S/0FT850lzk82Z0dmuFpYz2kR+b4NU+jO6tvR1s=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793670086; v=1; x=1794274886;
 b=lVjRCwWhTu01R0ku3UfKeu8lsehwfXCs0VzpeFFzsa4jX84LoarLTasbhsDvQ3Sv1rYLClYR
 SkieOSCMN625bINf4seTcFJcuGWPLFQlM+uL0ja5sxsIkz0Pd2fHYjw9NigQ4ry2EiRrxFx6gFY
 WPqbzLdPBEjd4bDZAFRPiOG0=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 67552742a882805c;
	Tue, 03 Nov 2026 01:41:26 +0000
X-Mizu-Trace-ID: 67552742a882805c
X-Migadu-Flow: FLOW_OUT
From: Hangbin Liu <hangbin.liu@linux.dev>
Date: Tue, 03 Nov 2026 09:41:19 +0800
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
Message-Id: <20261103-mailmap-v1-1-6bf20a6ddd30@kylinos.cn>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqAIBRF0a3IHydYUVhbiQZir/pQFiohhHtPG
 h643JcCPCPQKF7yeDjw5QrqSpDdjdsgeSmmRjW9GlolT8PHaW6pO23R684a1FTq22Pl9J8mcoj
 SIUWac/4AUlxDiGMAAAA=
X-Change-ID: 20260930-mailmap-858ce685cae1
To: Hangbin Liu <hangbin.liu@linux.dev>, linux-kernel@vger.kernel.org
Cc: Hangbin Liu <hangbin.liu@linux.dev>
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
index 0d05be949eff..e4457f5015c1 100644
--- a/.mailmap
+++ b/.mailmap
@@ -361,6 +361,9 @@ Guru Das Srinagesh <linux@gurudas.dev> <gurooodas@gmail.com>
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
base-commit: 4dd16e31135ea8437a720222df34e8745f385d6d
change-id: 20260930-mailmap-858ce685cae1

Best regards,
--  
Hangbin Liu <liuhangbin@kylinos.cn>

