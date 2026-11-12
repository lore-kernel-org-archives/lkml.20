Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.140
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794476309;
	b=mhJoI7oojXGzEP+a+EFw4rOHW5iwydAa5FacSvtIiM1hzH8zco9h4A4lXV8mgeo7cNch
	 MwDR6fYQf8A6MDe5/9bmneBNIXHR1AcAYgi8qnDIQBKY0i9TUmOCovbnPva4xOU8vhRcw
	 ELhnBzSwllT0mONW1wnerZ71WpitwDnjMTQBXyuGaM2XYBjvO1SOqV5sH6VE2PuHCXNKE
	 76Usy5Dzj7fX3Pkh1Hd0AVHFLv899bavVTDKVVIDLpCApSlXzfMobEWE02RlxlhqqRDf/
	 ueAjBCDV7sQZ6gK9MzOHJ4Es8zW3rpOVbEo8c2yPhKerVzD/qXZEk1fYtxXeUtWow/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794476309;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=U2TDbKAnFz/PUpn8r3Gfv9DpcDc8O6+4aawWDP9AXUE=;
	b=YfMdUbi58vykIMFxRlGhl8aUKdX5RJpp60UA0QARJxF38jPr6KWcKaV7GeJiVFTdHhbp
	 vbQTK6Cb5pU8NdM7ICID57NbTLqVzdLxnfYqLNrjPT/n4LN9ZKpOKUNhgz0PovtACJ5mF
	 4KyIUcpJsHOsFaMHZNUsMPdveN0kqzCNtA4ChZAk5TJqPdAbpKg97UIjeNjD56W3UxAdn
	 avNXiofWw+bcDmoSXe3glqaD2fQEuWDRcW77lyrK/1W4MEENhktqlRuf0CmZ36q3jMLEI
	 vJYA1O7Ya8BsPvbuvyPCf/o1vq6fmzPxzY/bOXAfcygMsAFtQOOYt+szH4jsDblOBwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=PgSIoqhe;
	arc=none smtp.remote-ip=91.218.175.140
Received: from mta0.migadu.com (out-140.mta0.migadu.com [91.218.175.140])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1983606A321
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 09:38:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1983606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=PgSIoqhe
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Bt1xUj/VmyXvca7gxum1cF/z09pb5LjCLbZsA6IbGVw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794476307; v=1; x=1795081107;
 b=PgSIoqhe2Ly6GkaoGdIa4ifVpEXj1dtW4gsnWYN99EyBn9m/dpugt7RZTIYumJGH1RGYP8Aw
 D075tWfV1o/7IVJJeF8gOsKqAhUP05zBsNnHWszm9+4eKvT5myY9kAWStWwID7bIw6PvOUSfgnx
 26u9WN1KU0muJ7Gak5oklx5g=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 01d0cf1fa9ea3b88;
	Thu, 12 Nov 2026 09:38:26 +0000
X-Mizu-Trace-ID: 01d0cf1fa9ea3b88
X-Migadu-Flow: FLOW_OUT
Date: Thu, 12 Nov 2026 10:38:21 +0100
From: Luka Gejak <luka.gejak@linux.dev>
To: Krzysztof Kozlowski <krzk@kernel.org>, linux-wireless@vger.kernel.org,
 Noah Weinberger <NoahWeinberger2003@proton.me>,
 "pkshih@realtek.com" <pkshih@realtek.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "security@kernel.org" <security@kernel.org>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH=5D_wifi=3A_rtw88=3A_sdio=3A_check_p?=
 =?US-ASCII?Q?acket_length_against_remaining_RX_data?=
In-Reply-To: <912f7250-d1bb-43cd-8efc-9ad7b0c4f1a9@kernel.org>
References: <tKht3w_knueblApO8rdPrR1QcEs6-nv-6y_7lYwYWCYqQJJ2ZiPAgcGJZuiQVeotGyIaO3EZ9j_0jFwlc5ESOzzhNSRjQu5vvUGR1kf2MUE=@proton.me> <43A4B4D6-EB5F-4079-8BE9-A452DA8B2AB6@linux.dev> <912f7250-d1bb-43cd-8efc-9ad7b0c4f1a9@kernel.org>
Message-ID: <9EEA5565-0A03-41F8-91ED-C50D4A632AE3@linux.dev>
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

On November 12, 2026 10:24:53 AM GMT+01:00, Krzysztof Kozlowski
<krzk@kernel.org> wrote:
>On 10/11/2026 02:34, Luka Gejak wrote:
>> Hi Noah,
>> 
>> Thanks for looking into this. A few comments below.
>> 
>> On November 8, 2026 11:27:09 PM GMT+01:00, Noah Weinberger
>> <NoahWeinberger2003@proton.me> wrote:
>> 
>>> Subject: [PATCH] wifi: rtw88: sdio: check packet length against
>remaining RX data
>> 
>> This doesn't apply to rtw-next, which is the tree rtw88 patches should
>be
>
>This was a report, not a patch whihc can be applied. It's visible by
>lack of DCO.
>
>
>
>Best regards,
>Krzysztof
>

As Noah wrote in private email, emphasis on submission and version of the
patch:

>Hi Luka,

>Thanks for the detailed review >and for pointing me to the >existing fix
>in
>rtw-next. I’ll drop this >version of the patch.

>I appreciate the corrections >and the guidance on the target >tree,
>testing
>and submission format. I’ll >keep those in mind for future >patches.

>Thanks,
>Noah

Best regards,
Luka Gejak
