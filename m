Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.23
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794750007;
	b=llWWR4PowwtLkC0VivuOdc4G3yc7nG8Lqufo0gp5d1xwepOLtdkz8iuheGMf49Brclg6
	 rmYnb4hVbOOljY73GtpR18c+LEEclla2wo7oiXfd/1B09dut2z1Nu1irkHQ1F5bXwTC6c
	 sGlBxO4fGchCFTlHD3NwqiXTPrT2ryzAFtv7KRmBa+eSl8tb8hZbzMkQ7D1pVzvDgIELs
	 QRLuegPSS0p7l9qt3SskYvuzYWHJfVq38T5QPmRXmrV7P8qll8wNjEt77SgRuVhfum8By
	 D6y2QScUpemg1fSKz08/lY9/XoU6clfK3JqIc3/oI3gRRbRXdkHTcs2de455D7G4Zqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794750007;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=tyzB/wNMNyW5iEPRaltfrxfifBujmIUNbCHktd+CPYw=;
	b=GKop3S1nQ3H+RSbFxAxZaLn2dffe4SlGe0qbFbRtnmm7N+yJlz2BlzWGgQ2DOeM1+mq9
	 GBSy+msW/siXxVhGWNvHSx3bING7mrxtmVONasx1NY/JRZuxyvcF2GlCqZs8/I/Lh+He3
	 pH9Qf8htCvpp/sHsUIYeddO2rBraJXbyLZ14oWLCc5lHe0ADwgtU36vQhRFNf7yUIZbwW
	 OPghW9Z+OXqERazjV++B2wfTmZu0H2apaGeMMqn457jJBqkLEQFQH5M2qadx4rEbFBZ+/
	 hCiGRul0fBUgHpCj6vt1Cy01LbVoEI4F3EM5AHiIeviWNWLWyJlrVtDe/HpSp+H3FQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=hxrLhF6r;
	arc=none smtp.remote-ip=95.215.58.23
Received: from mta1.migadu.com (out-23.mta1.migadu.com [95.215.58.23])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84E97606A31D
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 13:40:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84E97606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=hxrLhF6r
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=tyzB/wNMNyW5iEPRaltfrxfifBujmIUNbCHktd+CPYw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794750004; v=1; x=1795354804;
 b=hxrLhF6r2PGpyMrYcLEqBYteTP62osLHKWATHHY1+amDrE6LjDjeCll7RMQiVu/j7gshATJ9
 6boGMLrOwXcEj+4471oOPFQXY0BPyMZ6qO/jlUio95iVj3TCqvLsXbhK5/+0m6ae71Q4elaUsJT
 ajJCyccClJwKX8OL1cEY8rRw=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 574456b2b668cabb;
	Sun, 15 Nov 2026 13:40:04 +0000
X-Mizu-Trace-ID: 574456b2b668cabb
X-Migadu-Flow: FLOW_OUT
Date: Sun, 15 Nov 2026 14:39:59 +0100
From: Luka Gejak <luka.gejak@linux.dev>
To: Ho Jie Feng <hjf3108@gmail.com>, Ping-Ke Shih <pkshih@realtek.com>
CC: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bitterblue Smith <rtl8821cerfe2@gmail.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_rtw-next_v4_3/7=5D_wifi=3A_rtw88=3A?=
 =?US-ASCII?Q?_correctly_expose_beamformee_capabilities?=
In-Reply-To: <1F34F485-2BCF-4285-9C7C-189DF4E5FED9@linux.dev>
References: <20261115114336.1739863-1-hjf3108@gmail.com> <20261115114336.1739863-4-hjf3108@gmail.com> <1F34F485-2BCF-4285-9C7C-189DF4E5FED9@linux.dev>
Message-ID: <8AC70D36-4A4D-40C8-82B7-A33EE345A729@linux.dev>
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

On November 15, 2026 2:37:46 PM GMT+01:00, Luka Gejak
<luka.gejak@linux.dev> wrote:
>Hi Jie Feng,
>
>Thanks for the patch. One comment on the description below.
>
>On November 15, 2026 12:43:29 PM GMT+01:00, Ho Jie Feng
><hjf3108@gmail.com>
>wrote:
>
>> Implement beamformee support for 88xxa since they have
>> support for it.
>
>Could you expand this a little to explain what was missing? As far as I
>can see, the chips had no config_bfee callback, and this adds the SU
>beamformee setup for RTL8812A, RTL8821A and RTL8814A.
>
>I think a short explanation of the sounding and CSI report setup would
>make the change easier to follow.
>
>Best regards,
>Luka Gejak
>

This is supposed to be for patch 4. I have used a wrong message id.
