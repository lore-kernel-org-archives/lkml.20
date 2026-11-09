Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794213776;
	b=FDIPjNFUwYXiYOmT3aoGODMLJocawd5fbk3j4htJgGLMM7ITYxzl9bIcjV120rgQWtZz
	 qJ82ubIkOOog1Vbmmz5+jHr21wsOb7c1VYDqQNsMYCDlGs0Aa1XjsUq5SE2+Y6t8PFXLc
	 i19qlGs9XS3npeVMCaDCmxG2Jhpx3NUHodydKGItriFF3uSoVIE4kZPKq58sOBSGlDjZV
	 QAXv+Vjx7Ijh8aTS7on1gg+7hkXjdBnQQKjJHzUlXd2xajpUbGL/idQ2YSwmQ1+lFpDhb
	 BMa5gy0L1qUcvLNXfzQ/J7ZLzVjBMIL1+7zsQDdaqGTsLtTo8RCsn7WnvwSclMJbYig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794213776;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=LtdyX8DPqa/hf4d5KaJuhHuaYLQ673pZgSExYeG5UMw=;
	b=OVweBodgtlSZBdnSWPyGgSvzSF+RaAs6w3l8PbPBHvJOfqs0FpeSk545A3bFvPdRxtIe
	 izP9haE0accgaKsOldM4UYWGTrBCx4PMVM1suljbKbn6f3yC8e4qji0m4vi376Bpmj2vS
	 +1+q6jYgfmRs+VGSHJpvYeky5BHClEIXWTkfEoU0rwxQ8BlSb7AG8+r2DxhVSehvli+D9
	 NmDPqyWskdx4gI5Es/QlrSHYwpTYAmOVPMTUNurHYAhh6tEXCTDT+p5xic6/4jPrZLX8E
	 hbqX7r45xUbnzqz46466aXPRM/MwSmkm5PYaagyRRWvlqZd8P3JkY71a8rXrXqamB1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=nmikw6dT;
	arc=none smtp.remote-ip=91.218.175.131
Received: from mta0.migadu.com (out-131.mta0.migadu.com [91.218.175.131])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87770606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 08:42:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87770606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=nmikw6dT
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=LtdyX8DPqa/hf4d5KaJuhHuaYLQ673pZgSExYeG5UMw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794213773; v=1; x=1794818573;
 b=nmikw6dTxxCg+N2++pAkytUTJcWM6yFbByxJY9nL94bxrTkKHDh3gnGOlC2zKojDHjpjGyue
 HptwaQYKMMqNC/6go7PPV0wR96nOVsSb68EMTA/hoKC6NatDbhVI1L6HUVO++cbOwsvESQudMUf
 fQwFM5ugAWdQmj+RtKy/8Sis=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id b2eee2c38fa356b9;
	Mon, 09 Nov 2026 08:42:53 +0000
X-Mizu-Trace-ID: b2eee2c38fa356b9
X-Migadu-Flow: FLOW_OUT
Date: Mon, 09 Nov 2026 09:42:49 +0100
From: Luka Gejak <luka.gejak@linux.dev>
To: KALPESH SOLANKI <skalpesh942@gmail.com>
CC: pkshih@realtek.com, kvalo@kernel.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v4_3/3=5D_wifi=3A_rt?=
 =?US-ASCII?Q?w88=3A_ps=3A_trigger_firmware_re?=
 =?US-ASCII?Q?covery_only_after_consecutive_LPS_leave_failures_on_PCI?=
In-Reply-To: <CADYuhkpGHNq_B-2qKqjD7R4fAnaVBM2emwySyq4E4u==wLBOFg@mail.gmail.com>
References: <20261108142708.489067-1-skalpesh942@gmail.com> <20261108142708.489067-4-skalpesh942@gmail.com> <84AB3D74-F70D-452F-B621-B5487951B719@linux.dev> <CADYuhkqCNQxevZih3D+Zu-HcuyOao99iF31+Y6kDP0iM_Rr1kQ@mail.gmail.com> <CADYuhkpGHNq_B-2qKqjD7R4fAnaVBM2emwySyq4E4u==wLBOFg@mail.gmail.com>
Message-ID: <565AB9C4-8C29-4885-A830-919AEAF63CF3@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

On November 9, 2026 9:32:09 AM GMT+01:00, KALPESH SOLANKI
<skalpesh942@gmail.com> wrote:
>Hi Luka, Ping-Ke,
>
>Thank you for the reviews and feedback. I have had a bereavement in
>the family yesterday and will be away for a few days.
>
>I have noted the comments and will follow up with v5 once I am back
>and after lore/patchwork is operational.
>
>Best regards,
>Kalpesh
>
>

Of course, take your time, no rush.

Best regards,
Luka Gejak
