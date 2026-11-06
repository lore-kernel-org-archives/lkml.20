Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.213
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793985940;
	b=eHYxrBgPySXZ1Zy/tlj5MApXqfeXuybbScbM2ACQTSOEwrRMPUL75xnGQxTv1T74fuC3
	 iEj2BVBm7qi8lvwBtxzu+fVTm7EWQCFoc7HXvUr4QPPUf4LPOHAvaIr3PyVDeiJFRDkD9
	 Vkd562tTLHoFJpvLEJ5d8WcsI814MpF87EnwS7sKf84Y04p+5YsTa5Jsg0B+KErcAQTAV
	 sYHAciqq+UD+wgNGIN6h+6JgZCVx5ppr6qzpBOI8bwnat6oZ2m4N8SCGjT/RAmsdPT/jC
	 TlLbNVb11AHYsQxlyDHZa6zHEhcuAqnh6NGF+r7XAiD83fbbJZlCTiBkp5IZj9s770g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793985940;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:MIME-Version:Date:Content-Type:
	 Content-Transfer-Encoding:From:Message-ID:TLS-Required:Subject:To:Cc:
	 In-Reply-To:References;
	bh=H/UOg9os2Xl0arg8y4J05IPhLBvBmxhpvMTgvox6by0=;
	b=nkO1No03B2PUGxuBd0W4UyPwAhiwtI3qxtT/1kjAeL54Ux+g2H/mAPUv+scpr7FqlgU9
	 ojG6w6x+wtLO07rCXDtLh3DEl6vajcy4EHIL5jDYmvbix+yo8x/gcehsK0tRAawFmCNhi
	 +8zarXJ5kNRDlRg6UXyPeAII1cQchf5IZUAJIWgV627ZVVDURitoWkilL68jLRTJd/T59
	 MjG8yswXwth1XYRG9bh2gMCwywk0RONEmk67BfM+K/siR4Yi0EkkO5ELUYjaAHwepXr7I
	 U7d1JtQL5k8oj4+z+OZ/fAKWpoBMIX7UBW/7vtaSMkLpfLePbPSlfYDHaMwYHdKzonA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=se1TPWB5;
	arc=none smtp.remote-ip=95.215.58.213
Received: from mta1.migadu.com (out-213.mta1.migadu.com [95.215.58.213])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6476F606A32C
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 17:25:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6476F606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=se1TPWB5
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=H/UOg9os2Xl0arg8y4J05IPhLBvBmxhpvMTgvox6by0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793985937; v=1; x=1794590737;
 b=se1TPWB5A1/5xq4I21fUODT/aCpdXspCHpS3hMRPMJdyAnIipAsneUD4E5iEH5wsrKcRNjpP
 Qu5A4f8j2c4U2BwvaGmiTYNBPn9fbYfmaWXFs9TUczLwTUlNOIrbJvSEtIAeCleXC6FqegK/UBr
 7lfiJ4lWY+Q3QZV8GhtbD/ug=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 8687d25d106980cd;
	Fri, 06 Nov 2026 17:25:37 +0000
X-Mizu-Trace-ID: 8687d25d106980cd
X-Migadu-Flow: FLOW_OUT
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Fri, 06 Nov 2026 17:25:37 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From: "Luka Gejak" <luka.gejak@linux.dev>
Message-ID: <af3b96b7fa3d3ab02ef1ce53e3196e0cde53d624@linux.dev>
TLS-Required: No
Subject: Re: [PATCH rtw-next v2 3/7] wifi: rtw88: correctly expose beamformee
 capabilities
To: "Ho Jie Feng" <hjf3108@gmail.com>, "Ping-Ke Shih" <pkshih@realtek.com>
Cc: linux-wireless@vger.kernel.org, "Jie Feng" <hjf3108@gmail.com>,
 linux-kernel@vger.kernel.org
In-Reply-To: <20261031070950.425176-4-hjf3108@gmail.com>
References: <20261031070950.425176-1-hjf3108@gmail.com>
 <20261031070950.425176-4-hjf3108@gmail.com>

Hi Jie Feng,

Thanks for the patch. As you can see below this patch is sent as
"Jie Feng" but signed off as "Ho Jie Feng", and checkpatch warns about
the mismatch, to respect DCO. The other six patches use Ho Jie Feng in
both places, so I think only the author name of this commit needs fixing.

> Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>

Best regards,
Luka Gejak
