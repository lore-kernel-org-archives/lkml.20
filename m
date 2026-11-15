Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.94
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794750165;
	b=3ZI3AQUbWiVh3hC2+UHT37Qt7lFxlheYEXPxbuIuQqt1J5Lc2Qjwt2sJwiw80G3rW2Nm
	 PqoewcyyZoOnd+reDXIoui6IoJRyyya/IK6vFwiXogpQoSNIrXwFh/aDtRT9fuY9gpjJX
	 RqzL/iPb5O2NDo1jyduv27Eh0xm3UDRBjfJZ1eV2lyFEmC3mZ+bijhfb7e0mNoD/brB2V
	 OoH49r8rQB2H0SP49PWNQ19t9lNhXt3EyXsrii+VnsUvQw+tusSWZf+OJuoJOCUMdEMG1
	 vz9pUrK6E0V+OV4gFau5RqGd7g67wgvB/6hvEuzvsvK6PvRP9Z9BW3+HG3FqwfeJ0lQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794750165;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=CzrZb3Zd8o48Hpqe2mTWemktOybsKjrXRs/zD4WvXLs=;
	b=Z9gLkNOwFJybtUN5oVqRxiwXY/B1AktqD+Qbw1NJh1oId0k41ardLE+BP7+i70WUzfBo
	 32vJr5Io9uJI5AM8wTiyoQQBqo6EZnehnVxOOqBu5NEttqfELmwktbJitquPa+0wEhaZ3
	 a3sfh16mgjs2oyqTzdy3k7F0bITnP0Nlikhgi/yYjxRinMtSgmawCFQBPU6qUenWx7WJf
	 PMz3Spn3OrLFg0Tfao0jaFpO5jyciCgOqrykgPrlI9n4AsGoqUwNZoT62cp4HPfrJgnxp
	 ghJyJSIBMFXhDVsgl8oCfytvo/JWevChn9tfqum/gchlF1Pkb/fBIXK188Z2nN+Ohlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=YCYNzJCN;
	arc=none smtp.remote-ip=91.218.175.94
Received: from mta0.migadu.com (out-94.mta0.migadu.com [91.218.175.94])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6357606A31F
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 13:42:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6357606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=YCYNzJCN
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=CzrZb3Zd8o48Hpqe2mTWemktOybsKjrXRs/zD4WvXLs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794750162; v=1; x=1795354962;
 b=YCYNzJCNlhqDNm7T8D15c6+TVxAW0LOvBB363LvetluLJR4q8PKEj9kctOJnPo9FVr1PGMOO
 Esjs6cGrosgJgixg5M6cb7XlUfLygsVqM2fOPsK5dyvqp94IEMDRX8QOz66HzHaCnc/7uq0/uMb
 ydL5Du+/242VbXM3PNfLOW5M=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 260a9f29dcf82ef2;
	Sun, 15 Nov 2026 13:42:42 +0000
X-Mizu-Trace-ID: 260a9f29dcf82ef2
X-Migadu-Flow: FLOW_OUT
Date: Sun, 15 Nov 2026 14:42:37 +0100
From: Luka Gejak <luka.gejak@linux.dev>
To: Ho Jie Feng <hjf3108@gmail.com>, Ping-Ke Shih <pkshih@realtek.com>
CC: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bitterblue Smith <rtl8821cerfe2@gmail.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_rtw-next_v4_6/7=5D_wifi=3A_rtw88=3A?=
 =?US-ASCII?Q?_88xxa=3A_correct_carrier-frequency_offset?=
In-Reply-To: <20261115114336.1739863-7-hjf3108@gmail.com>
References: <20261115114336.1739863-1-hjf3108@gmail.com> <20261115114336.1739863-7-hjf3108@gmail.com>
Message-ID: <329749D3-41A6-401F-9D1E-EEDDBC3E5CD8@linux.dev>
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

Hi Jie Feng,

One more thing in addition to the other patch 6 reply.

On November 15, 2026 12:43:32 PM GMT+01:00, Ho Jie Feng <hjf3108@gmail.com>
wrote:

> Use the newly promoted helpers to implement support for 88xxa

Could you expand this to describe how the CFO samples are collected and
used to adjust the crystal cap? I think the two path reporting limit on
RTL8814A and the handling of the efuse crystal value are worth explaining
too.

This adds more than the callbacks, and a short description would help
explain the changes to the shared parser and chip initialization.

Best regards,
Luka Gejak
