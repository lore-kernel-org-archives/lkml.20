Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.60
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794750097;
	b=VJ868cbCuPphnObc8Hs07ffC7MD346XUYxWH7sBpglb+uYr8CQz6qFjOxy/z29Zv1A6W
	 r9MuTs1YAlkXYIs3R8aZOl/kbF3QdV6AltB5gPg//NeXvFmbgeVM/UPZd2Cqh/NpXQH2h
	 e+sB0FerbNiRecB1PbuLg+iotu4VSgf/Ohdvlt1c+v711pCi9l90zGTRteHF+d26xbSpT
	 SeQPVg9jllSSKok/tHPI6ZVpTPv/zYq6vCOHHh9qQEX1mA/b4zTELTNd+pc1wGIxwDkXl
	 t257y7I/nAZqCIPBqBRDHDkpVDOvER0fqJ0cGrxNjUSa3w3q4jbKTR2dsEQhGI4qaVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794750097;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=z4W5MyncCJpDGD8k6JTI3yX6S2NHlxMNz+A4FQlhDHM=;
	b=3NeisRAWqnId3iyNOqK7V+oJVGRNJwjKxUn6inJV/zBI7nNCFns7ay3nBIS8Q7jKtcCj
	 qXV8C8XlA35prWqEB0sz0O1PTCzWUFbrOjB6CLoq3mqLsoSId9LJ6sAOmroY0XbyEblvy
	 BKbiuYZ46yl3ScweTE9wCPgxbwB3L+3wHLb9q55awB+DLTsd9O+Uxe3zrNdNW6lHU+6Ob
	 6aXjZXhsopHtnUokc6kbsb8fZNV8RpN+we1soubaSzKXi3Si2hLj9uOrrUxGvyyyY/y1n
	 Ivrs3I39iTN7GDjHkjA8XRVczhok3jTu0NRtOjfJPVpIGqCtk1/xIUxK/DJ/B5s+1Gg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=BQIU8O7M;
	arc=none smtp.remote-ip=95.215.58.60
Received: from mta1.migadu.com (out-60.mta1.migadu.com [95.215.58.60])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21A1F606A32D
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 13:41:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21A1F606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=BQIU8O7M
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=z4W5MyncCJpDGD8k6JTI3yX6S2NHlxMNz+A4FQlhDHM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794750095; v=1; x=1795354895;
 b=BQIU8O7MDTno4HkVNgA7hWI4PyqqWwCoFrXE1mGFWnPkzZou2V8lT4aZYQgijeL8txZm4iVk
 1JerpBARXGsL5MM4KtQNrPRrg1eJs6MgliWs+e6JvW/1+nf0H+58czvaZCxwM8ujPFm50HRtIR3
 r0Wb1OAOXyhl1HXw9hx4EWSo=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 46ae41dc8a0f5cf2;
	Sun, 15 Nov 2026 13:41:35 +0000
X-Mizu-Trace-ID: 46ae41dc8a0f5cf2
X-Migadu-Flow: FLOW_OUT
Date: Sun, 15 Nov 2026 14:41:33 +0100
From: Luka Gejak <luka.gejak@linux.dev>
To: Ho Jie Feng <hjf3108@gmail.com>, Ping-Ke Shih <pkshih@realtek.com>
CC: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bitterblue Smith <rtl8821cerfe2@gmail.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_rtw-next_v4_5/7=5D_wifi=3A_rtw88=3A_prep?=
 =?US-ASCII?Q?are_frequency-offset_correction_for_more_chips?=
In-Reply-To: <20261115114336.1739863-6-hjf3108@gmail.com>
References: <20261115114336.1739863-1-hjf3108@gmail.com> <20261115114336.1739863-6-hjf3108@gmail.com>
Message-ID: <861989FF-EFFD-4890-B369-FB65F6E4DB92@linux.dev>
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

Thanks for the patch. One small suggestion below.

On November 15, 2026 12:43:31 PM GMT+01:00, Ho Jie Feng <hjf3108@gmail.com>
wrote:

> Promote chip specific functions into the common core for cfo tracking.
> These become helpers which can be used by the other drivers.

Could you name RTL8822C as the source of these helpers and mention that
the crystal register writes stay in the chip code? I think that would
make the split between the common tracking logic and the hardware
specific part clearer.

Best regards,
Luka Gejak
