Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.121
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792932648;
	b=1glv6DmpX5KvtI1pPH3flQPR/5tC/ZX7ygCvtD9JauXCDPjpfHNeZCjj0sEHyP5SqpyR
	 1YSGYBKOno2mSXlkC5raZvMSZQZITAL4JgBj4atLDjbNEYM7T+kI/WxWs+HzIXEoziQyL
	 osbnF0RC3XnOlY5zJqOjzexS0dCp/w2n8X+6h/rv7LALBxYQuL/8Xj597x1YZC4zWw51+
	 jYiXyRp/4pMxCpL/PCbRBwh6tMbUy3CXxOj8kNsfcCSSe9iFg7DD6tCBo6wNP2nOz+Z/r
	 2bIgyFiFeZJcENJSr+Xq15oIfkFT5GWihm+YT45uoPZiAZ73d1DmmE5GFdXLUQJlINA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792932648;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:MIME-Version:Date:Content-Type:
	 Content-Transfer-Encoding:From:Message-ID:TLS-Required:Subject:To:Cc:
	 In-Reply-To:References;
	bh=cJ51G6pAmia1MscnsYfswwFx5AV+tMo1EILMAOCstQ8=;
	b=MZ5y6JtSrAi7RLuV9RVeMDjRO5V0vDnrp603Js01sAqhFnrvjUB9qHig33Q+evvvNsKV
	 5lPMA4cPc3i66sOPjmbZO1mZ2BUSyPdHJXxGv+fGXsqBFBChymeKTQxGqeSORfwFMG0XT
	 OYB8NHyXBrHoBWPrl8kFqlZg2rSiVKRt3+FFOs2VHANovjDsn68Pxf/SmGwXn3/YRfCJs
	 7c9wxe2k4E7y90jCiloNq50YcK3s445AZ1dGn0SsNHLgVKNdQONmS1UbWpBe2qBeDIE1q
	 /5V7SjmAd+8PYri0+o2J88DrQqIvoreceimUCwf1rDdB6QaznzhiJiUWeF0JRFFeCCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=o+YFH6E9;
	arc=none smtp.remote-ip=91.218.175.121
Received: from mta0.migadu.com (out-121.mta0.migadu.com [91.218.175.121])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FDBC606A31B
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 12:50:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9FDBC606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=o+YFH6E9
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=cJ51G6pAmia1MscnsYfswwFx5AV+tMo1EILMAOCstQ8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792932644; v=1; x=1793537444;
 b=o+YFH6E9hiMwoIwgOfBft1tB5r961JEuD65rDfF3YtfUMmX6O4NIQpOnQePRR3GVb1ztPkX/
 4skmivJOk4Gn90Q/0rHr87Mzi74KlMXeRfqgsJ04BAsfMCVmVaIazvLTgY8jLWHNZTr/jCAwrhm
 F0FXmzvOlNhG481S+g42FjA8=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id ebc4431b16746fed;
	Sun, 25 Oct 2026 12:50:44 +0000
X-Mizu-Trace-ID: ebc4431b16746fed
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
Date: Sun, 25 Oct 2026 12:50:44 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From: "Luka Gejak" <luka.gejak@linux.dev>
Message-ID: <3d046336002a182f7751814750ddc522a53968e1@linux.dev>
TLS-Required: No
Subject: Re: [PATCH rtw-next v8 3/3] wifi: rtw88: time the countdown
 downloads from the TBTT
To: "Mehmet Fide" <mehmet.fide@gmail.com>, "Ping-Ke Shih"
 <pkshih@realtek.com>
Cc: "Bitterblue Smith" <rtl8821cerfe2@gmail.com>,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 mehmet.fide@screeningeagle.com
In-Reply-To: <20261021114543.4132776-4-mehmet.fide@gmail.com>
References: <20261021114543.4132776-1-mehmet.fide@gmail.com>
 <20261021114543.4132776-4-mehmet.fide@gmail.com>

October 21, 2026 at 1:45 PM, "Mehmet Fide" <mehmet.fide@gmail.com> wrote:


>=20
>=20From: Mehmet Fide <mehmet.fide@screeningeagle.com>
>=20
>=20The countdown downloads are queued one beacon interval apart, with no
> relation to the TBTT. A download that runs late past the next TBTT
> leaves a count out of the air.
>=20
>=20Queue each download 10 ms after the next TBTT, read from the TSF, so =
it
> may run late by almost a beacon interval; a later one is followed by
> the next at once. A TSF jump, an IBSS merge or a reset, restarts the
> schedule from the next TBTT.
>=20
>=20A TBTT just before the start may already have sent the first count; i=
t
> is taken as the one that did, so no count is sent twice.
>=20
>=20The USB chips raise no TBTT interrupt, so the TSF register is read. T=
he
> beaconing interface is always on port 0: rtw_core_port_switch() moves
> an AP there, an IBSS runs alone.
>=20
>=20Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>

Looking good to me.

Reviewed-by: Luka Gejak <luka.gejak@linux.dev>

Best regards,
Luka Gejak
