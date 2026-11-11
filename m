Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.233
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794378518;
	b=0Tc+unbWdeWHVE/BIWUUpY+wxCQmKizD9oXxIinsCoS09pDUb2UvSznuJV/8Tgrr0NDt
	 OmZ+OIF5WLqnHnzkIBRvTdxdzpceqzrZ2xEQuCzowmzkGyF9KihdBt8OFnOCGRy1fRe0Y
	 EXn2o87MDNUcYBTGJixwBtEqWWZNJTGY9XTrwcHwpEPO2kldfzfGL5L8OOeBJWX72dUgF
	 onCn5I5mKQ+kl5anOyL66fNjUnFPIRMD7wOYsR4hKCOTeyyTJFYD2ttJIB5ts1k+1cBI9
	 OIejNYx0zfW7TvQytsIEnaCxvhU/lVJy/og4XsKUXsREqNiVR8f8zRpYoTdZ7b8o4Xw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794378518;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=QBLR9XH6XThUbhGQIxGDHNv6K9NcvEAlLUNRJvnhuEQ=;
	b=ynwUSATDA4J2NBszYIJfwlv+Z6M7MGsw0Dn5WJygKFhU+Afrwin2RqtIUzN92WiuL3oY
	 DU+lf1H0R/9ADEbR41ZVetdKgIBHHOEh/6LedoWt7gmODxazW3N7sEVIXjWORc2BJH5wt
	 y65WqTNpp6Hlna59640U1NHKL7nrAkxly3/Vin27JZPEciKJkUHE3kzsDghiU2+anOrGM
	 StPf/fQ5OYBwJxZXW3DZL6SEJ25mnvqPP6owuuxFgNKp18475LLsWRMCebfUt6cFfKTn6
	 K1KNfQS/RjzBt7hvd+Anf7+Q2gAUSP40lsz6WS1mwxF35zK2Uf1kiKbectR/s09zPOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ADBcKkEa;
	arc=none smtp.remote-ip=95.215.58.233
Received: from mta1.migadu.com (out-233.mta1.migadu.com [95.215.58.233])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5E51606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 06:28:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5E51606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ADBcKkEa
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=BYbsrt73utANP6mJklczqOlZOZawKJyWNF3cXm6ASNQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794378514; v=1; x=1794983314;
 b=ADBcKkEa5QyorHa+Ceev5wxwZMVzdoXqLZpy+vw9WQRNRDA8KOz5jh+FI0TtEr1a6sunBPez
 T+jPXRAQT+bhJLKomksP2IdhO9pU+PARJqVHki7HZj1VkGh+F5045v/zGZioo38Ikm+qQjhQwuB
 XanT99FVDShNWYjC7cDpV4rc=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 2fb7476acf35cca4;
	Wed, 11 Nov 2026 06:28:34 +0000
X-Mizu-Trace-ID: 2fb7476acf35cca4
X-Migadu-Flow: FLOW_OUT
Date: Wed, 11 Nov 2026 07:28:28 +0100
From: Luka Gejak <luka.gejak@linux.dev>
To: Ping-Ke Shih <pkshih@realtek.com>, Kalpesh Solanki <skalpesh942@gmail.com>
CC: "kvalo@kernel.org" <kvalo@kernel.org>,
 "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: =?US-ASCII?Q?RE=3A_=5BPATCH_v4_0/3=5D_wifi=3A_rtw88=3A_firmwa?=
 =?US-ASCII?Q?re_recovery_fixes_and_LPS_hang_handling?=
In-Reply-To: <3fa52468b46142639eb6800cb52b146c@realtek.com>
References: <20261108142708.489067-1-skalpesh942@gmail.com> <3fa52468b46142639eb6800cb52b146c@realtek.com>
Message-ID: <7243D84A-CB81-477E-9A87-05AA4B3D0892@linux.dev>
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

On November 11, 2026 4:37:18 AM GMT+01:00, Ping-Ke Shih
<pkshih@realtek.com> wrote:
>Kalpesh Solanki <skalpesh942@gmail.com> wrote:
>> Changes in v4:
>> - In patch 1/3: Also clear RTW_FLAG_RESTARTING in rtw_ops_start() if
>>   rtw_core_start() fails.
>> - Add patch 2/3: Prevent double free and sta_cnt underflow in
>>   rtw_sta_remove() when recovery races with station disconnect.
>> - In patch 3/3:
>>   - Keep rtw_fw_dump_dbg_info() in place on first failure.
>>   - Restrict firmware recovery invocation to PCIe devices to prevent
>>     scheduling while atomic panic on USB and SDIO.
>>   - Explicitly check rtw_hci_type() in rtw_fw_recovery().
>
>I can't see v4 in lore nor patchwork. Please send v5 (identical to v4).
>
>

Shouldn't Kalpesh address the review comments before pushing v5 so we don't
waste a version cycle? He mentioned he'd follow up in a few days with v5 to
address the v4 feedback.

Best regards,
Luka Gejak
