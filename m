Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.126
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793996857;
	b=SzmWjoAHbbV1Bh79qS4lDyaX3ZTbgL8rLdRaZ3HBTOsDtYOUbcxYDE/yo90cjvfcAtDp
	 MGGE8nhtdr1LHT9cEs3+JgLTWjSV7TP4kBl5GLUecwJppCFWDdggxlZkCAziv29z10GRK
	 hv4eDh2BVRDfWXc0+UPc7kyWL4j4K9tl4MA0nGahiH/Xo//yZ1BfWombv4zb61g+100po
	 NZKlAIPQLyZdLr9T9RTK9jknC8mt1x1xJiHu2hPBSh9dKGZ3Hcn+q76A98T3cZXJGe7Yi
	 DDQqnbaFisj8hJUUSDZ3cD9dwDMBufxbNeoECmoxUuDGDZ0vCrkR6oZuRi3WGsEx6ng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793996857;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:MIME-Version:Date:Content-Type:
	 Content-Transfer-Encoding:From:Message-ID:TLS-Required:Subject:To:Cc:
	 In-Reply-To:References;
	bh=5CwGPfss3o4B2UDwxJPyt7xPqbandq8EHhhTglsWcE4=;
	b=DAr05/+szmNtWR1BTcMJ+n2mf33j1XBI1URV128YcDvasz2iWoASknRqASpppGOHe4Ua
	 JB0nkogR9OAV8qdp+riPwduizFmUw3zXCKk02CrmewuYgx98fTAAS7LjQeEbSPFWTWD9A
	 sX01M8bYFas3wvnoddjJegNITx1DbHPkUpgN/u3uOFw+zL0VPkjtYhMl3brq1BGSJr4p+
	 Nfk1JmCHkbJrMSlfofztlq7inWMJ7pke46fuOyMoORZlsWN4MgTCaNwCiu5lo1RRuNAxP
	 LKK7HoNlUEBIHjAgsgNmCsJNFRCqsZ+Fc8DCcuFuIqapQ02PvlODv4AOmmqg/PF7H+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=KaCVBGhO;
	arc=none smtp.remote-ip=91.218.175.126
Received: from mta0.migadu.com (out-126.mta0.migadu.com [91.218.175.126])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB400606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 20:27:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB400606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=KaCVBGhO
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=43lSI3je5SgzVn0fvn0HfJb/Ol5l8VVjob7w0n5ta/k=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793996848; v=1; x=1794601648;
 b=KaCVBGhOFNko4IdzlRU2aIGG4WN0YSqAO6FhiAglIuFMTGCFOVl1y27PZ6s6EXzmJGiSYAx5
 wCdtaSMl8BfQyK/fBfy9sysOh8fJA9mAfRzTLc0lc8MjVRIY+V8fk0Eerw84NA/2pNoKsQxDnqo
 CdNIbSsroH/6foBdJ+N51WfE=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 009fa777757b40f2;
	Fri, 06 Nov 2026 20:27:28 +0000
X-Mizu-Trace-ID: 009fa777757b40f2
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
Date: Fri, 06 Nov 2026 20:27:28 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From: "Luka Gejak" <luka.gejak@linux.dev>
Message-ID: <1d7fe388a84ba7a078efbf1972869d63cb8234ea@linux.dev>
TLS-Required: No
Subject: Re: [PATCH rtw-next v2 6/7] wifi: rtw88: 88xxa: adapt channel
 sensing to receiver gain
To: "Bitterblue Smith" <rtl8821cerfe2@gmail.com>, "Ho Jie Feng"
 <hjf3108@gmail.com>, "Ping-Ke Shih" <pkshih@realtek.com>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <3bd7d396-bb54-41bc-890a-bfeab90dca3a@gmail.com>
References: <20261031070950.425176-1-hjf3108@gmail.com>
 <20261031070950.425176-7-hjf3108@gmail.com>
 <4ada79186cd882a6d3344c43579e5addc4d4e644@linux.dev>
 <3bd7d396-bb54-41bc-890a-bfeab90dca3a@gmail.com>

November 6, 2026 at 8:46 PM, "Bitterblue Smith" <rtl8821cerfe2@gmail.com>=
 wrote:

>=20
>=20On 06/11/2026 19:34, Luka Gejak wrote:
>=20
>>=20

[ ... ]

>>=20=20
>>=20 Bitterblue, did you turn EDCCA off through the edcca_enable debugfs=
 file?
>>=20
>=20Yes, that's what I did.
>=20

Thanks=20for the answer. So I think EDCCA itself is fine with this patch,
and it is the lower thresholds of the adaptivity mode that keep the
firmware from leaving LPS.

To me this looks a lot like b0435910e47d ("wifi: rtw88: 8822b: Relax
ETSI EDCCA threshold on 2.4 GHz"). There an RTL8812BU running as a 2.4
GHz AP wasn't seen in scans and failed to get TX reports under the
ETSI threshold, mostly because of energy from the adapter's own USB 3
link. The fix was to use the normal threshold on 2.4 GHz under ETSI,
capped for EN 300 328. Your network is on channel 13, so that would fit.

The 8812au vendor drivers don't use the adaptivity thresholds by default
either. Both v5.6.4.2 and 8812au-20210820 build with

        CONFIG_RTW_ADAPTIVITY_EN =3D disable

and as far as I can see phydm_adaptivity() then stays on the normal
(mode2) thresholds.

Jie Feng, maybe doing the same as 8822b would work for v3, the normal
thresholds on 2.4 GHz under ETSI and the adaptivity ones for 5 GHz and
JP. Bitterblue, is the adapter on a USB 3 port, and do you see the LPS
failures on 5 GHz as well?

Best regards,
Luka Gejak
