Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32C663C0A02
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 08:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789114545; cv=none; b=L+9QD4x8aEr7AAarp0hMtueO8BTpmGVnqERFm2oJS9G+wCJhceUJGWw8B1QWVG1SiTC2YVjDGGV/fjJOvIEIrZoACW/hTYbNg/oTfaPGlBUPFm6vhJV2MkPacB2vH3q7oX7OAFzJIXP5U7o1imAnhCzYPV7ljKySPCc1sU0wRdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789114545; c=relaxed/simple;
	bh=xq9CU9S3gz/8VXDA+D3+mMVbKXxFr9C+j9syTBN4L1c=;
	h=From:To:Cc:Date:Subject:Message-ID:Content-Type:MIME-Version; b=SqrG7mOKyiMKaa8YPTQRulNCguHJ9yFCj7BGD/YnnboH//OH7CFPeQCqvejaS+3t4WPcFryFJyCixHEFt7aMvVvNYIrHCRQ1aOsGBglygwwz0MRB/ue4HIk0qFxSFvryDEbmxkwjW1QCzYjUvYOEqG4ghvq8cRO5YK+4rU45iRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=khu.ac.kr; spf=pass smtp.mailfrom=khu.ac.kr; dkim=pass (1024-bit key) header.d=khu.ac.kr header.i=@khu.ac.kr header.b=ODIFvXgp; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=khu.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=khu.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=khu.ac.kr header.i=@khu.ac.kr header.b="ODIFvXgp"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-39675172593so656134a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 01:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=khu.ac.kr; s=google; t=1789114542; x=1789719342; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:message-id
         :subject:date:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K9BVPTP3iHBUFLufPu9HosFWecXPJJE8jbdqDi4BrrM=;
        b=ODIFvXgpJUyHvFWcQJziwlofqZkxgMYPiNhBvJORA+2nl1y/NcLUMQtCxYdBllzwZA
         bxdbgxNtcHn8Y9qBJLrp+nNNjkvMDaUvOoGR9CDEXhqv47oIX5JVXRDnfiIXvMw1bfEm
         uzRUe63pvxaNLeneCvLIJX6TA73bp9D76/izE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789114542; x=1789719342;
        h=mime-version:content-transfer-encoding:content-type:message-id
         :subject:date:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=K9BVPTP3iHBUFLufPu9HosFWecXPJJE8jbdqDi4BrrM=;
        b=W4cGqS2I48n6amzYO0irX4f+K8XncMOIu1i71irLDQ6bMBm4vFWZHSmvaXQcLXcBvH
         CFyjxvjGM6LIc4K/R/gcX1SzZKuH8AISu8Z1NZXOCCuhWz2vP+HGzOtxM5lcAfI+hVyh
         gewPwLJp7AJCWD68ltvm3MUtX+kceoEFQatqMwSa90v8DWwFgVjXiFUEYy0jqqXPfCv6
         ivgMMQOZ1utujy9XHB8N1khBTThDdmG5ZW3f2NmFUDnnu3qCjYeISMhNUKiWUh8WldlJ
         aIF/rkEbFG33mbQ3XDqsC29gNngJ7vOJXNkTyttRlA0lbdX9I1ioGFlO1WSK8SQFdIoE
         hUdQ==
X-Forwarded-Encrypted: i=1; AKwUvByAu1i1km3yM8npoxy9X8a+Fi7+e867W1T+eODLLEtjcPtbQSRik2ZKhrEkTJVS5HtZxFV6jTQuvE7arBo=@vger.kernel.org
X-Gm-Message-State: AFuF++lAUbAFPnB9Nc6V2q4+4alz5+diLSHKOvMbk9qL4OOHtCYgB9z5
	Bw+Grl5blmS72kPc4IisIBpgxsiYSl6JFs4EHCaN24lCNaEVIQwU4qziWiZ8YtuMdcc=
X-Gm-Gg: AYBFou1L5o68Nb8ilFhtKPxIM867+IgA2EeJ1GM+BMq2jrJkgGai3C0kyswdFt+imHN
	5C4xd+V3L/uycQIq4a1mrgSUfE0hKciWwArI3nIq0hzEwQrqpyt3gnjuhZGgTTV/a0Igqb/xMId
	edgKpIQyFrr4uuQbnDDppl6+es3ROj2DawTIFi4Tbge3Pw+OEjlrOqgFSIzMD4P2s/KV69aTbxu
	R7ymf+qRTnChrpnI3jdFvuqNlkCI2SkkLEEmXoYSJrJv+XpDRn2XIWs1NePh6ts8V980e7Edg5r
	Okl0JHEUKvz+CwbFPTm8Tklt7q0hxVTn0i471gteQVvVIt6GrtMi7gQcylZfDNdRBljKkYONNJo
	/2TZp7r3Sc4ErU7BGPwxpYyTkpDzfhiqX1bc0+9VQI5uTmN602Uyqz071o/CdTG4ekOGYErj+QP
	ah7U8KC4UGutHcNmy3AXB/rznLEXFRfVzYZJRyTBw5gCmBkC4zv/OLtTinJege4+IpiUfXV8FCm
	PcgDdXtidZIfKNn3vg=
X-Received: by 2002:a17:90b:582b:b0:37f:c22a:c188 with SMTP id 98e67ed59e1d1-39d9bc15493mr5443100a91.4.1789114542051;
        Fri, 11 Sep 2026 01:15:42 -0700 (PDT)
Received: from localhost ([106.101.10.72])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d994872e0sm3534834a91.8.2026.09.11.01.15.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 01:15:41 -0700 (PDT)
From: kimwooseok <5mghybrid@khu.ac.kr>
To: netdev@vger.kernel.org, theo.lebrun@bootlin.com
Cc: conor.dooley@microchip.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 richardcochran@gmail.com, linux-kernel@vger.kernel.org
Date: Fri, 11 Sep 2026 17:04:46 +0900
Subject:
 [PATCH net RESEND 0/2] net: macb: Fix PTP timestamp configuration handling
Message-ID:
 <178911388592.25348.177462085059763031.macb-plaintext-resend-cover@khu.ac.kr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Resending the series as plain text to correct the previous multipart
webmail submission and the quoted and rewrapped patch bodies. There are
no code changes; the Assisted-by trailers now name the tool.

This series fixes two timestamp configuration problems in gem_set_hwtst().
A rejected RX-filter request can change the active TX one-step mode
while leaving the cached configuration unchanged. Patch 1 defers the
one-step mode update until both TX type and RX filter are validated.

The two specific PTPv1 RX filters currently succeed with RX timestamping
disabled. Patch 2 routes HWTSTAMP_FILTER_PTP_V1_L4_SYNC and
HWTSTAMP_FILTER_PTP_V1_L4_DELAY_REQ through the existing all-frame
fallback and reports HWTSTAMP_FILTER_ALL to userspace. Both defects
originate in ab91f0a9b5f4 ("net: macb: Add hardware PTP support").

Both defects were reproduced on a Raspberry Pi 5 Model B Rev 1.1 with
macb eth0. Before the fixes, rejected requests changed OSSMODE in both
directions; each specific PTPv1 filter produced zero hardware timestamps
for 61 packets of its requested type. On 6.18.46-macb-ptp-functional-rt+,
both rejected requests preserved cached settings and the full NCR, and
each PTPv1 filter returned ALL and timestamped 60/60 Sync and 60/60
Delay_Req fixtures. ALL/NONE controls and all nine configuration cases
passed. The board was subsequently returned to its original kernel.

Additional validation:
- net 7f26a5e8040b: ARM64 allmodconfig and allyesconfig full targets
  passed with GCC 14.2.0, W=1 and CONFIG_WERROR=n. After applying the
  series, incremental builds of the same full targets passed with
  identical configurations and no new warnings. Both rebuilt macb_ptp.o.
- Pi board configuration: Image.gz, modules and dtbs built with W=1;
  the resulting kernel booted and passed the hardware tests above.
- Both final patches passed strict checkpatch including sign-off checks,
  and standalone/series application checks on the net base.

The RX tests check raw hardware timestamp presence, not absolute
timestamp accuracy or PHC synchronization.

An LLM assisted with source analysis, preparation of the fixes and test
helpers, and drafting the descriptions. Results are from the recorded
board tests and build logs.

Assisted-by: GPT-6 Astra

kimwooseok (2):
  net: macb: Preserve one-step mode on rejected timestamp requests
  net: macb: Use all-frame timestamping for PTPv1 RX filters

base-commit: 7f26a5e8040b4957ef4dbdfcde6cc7ba2db53937
