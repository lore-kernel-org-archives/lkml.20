Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EF233CF210
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 06:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792389876; cv=none; b=VYrGC4+ySRiIu/7KugkTqZdxUxXo+S9X/CBnecTw+tFTkqy8DXcMl8nJ9N/qp9QYWxkPHNu7o0O8SY2kVaGdGHWVMDCa1X2utPOc68EZp9FE59hRZKUoD3J4vlhqUatn/cPL1vkSNbz4LnkJ3kb4CDtjJ3pVtpgPOtBzOjvRb7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792389876; c=relaxed/simple;
	bh=UpAbfxihf6NJ8F5ckaOty9uycZ4I7rj2LCsVKLG/4r0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gEjvzJtvtsNeiM75pDUVBtlDxvfweVOlXH2enZNwijDZb7yvh4AxAoHT6/E4jyNviw5c0+c+ynu10Wy/rU7b8GoB44g3DHMgs1IHXdaQ1cWkuzgn/PceGsAO3C10JGq7TBsKsBPo+fNxoz6h3PMCYCgYZ+gfEjI4mv6gZgzYJT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=seanlyon.dev; spf=pass smtp.mailfrom=seanlyon.dev; dkim=pass (2048-bit key) header.d=seanlyon.dev header.i=@seanlyon.dev header.b=jhoDv9hm; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=dQoHNPnb; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=seanlyon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=seanlyon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=seanlyon.dev header.i=@seanlyon.dev header.b="jhoDv9hm";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="dQoHNPnb"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id D1DC31400062
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 02:04:32 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Mon, 19 Oct 2026 02:04:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seanlyon.dev; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1792389872; x=1792476272; bh=m7HxTsbSYO
	NKQfBmB6CvSOTMoyZG0SvkXRsK0VQtehY=; b=jhoDv9hm9WdY6PoF7qaYSEBv4R
	pxHg3nYoAZujLphTy4jXw4xgPneMGCB+FqtAgL5syl06BjWhkI+6Ysez5slyrUWK
	Za4lIjfr7hz+tl1BIVYDWbz2+5OG4kKn826mzEQGTGrO01sxAjat8olc71kEOP19
	U+Xqc9yUE1EOax2YIE++EPP4E1wqMZfzM2CWjLgT7OrLR98VyUm1onmTlxESJ/VK
	fZ91Tfdqg7Ju+9aIoht/q/n0J6xrniivaQxAMzqp2zVdfBXehMXmVyaK+Zk0e9dQ
	L/KGqR9lsYdrEDsdL5DCKhdZHBfzLnnZTPRtgfymTIrxnijoxXogrPHox8QA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1792389872; x=1792476272; bh=m7HxTsbSYONKQfBmB6CvSOTMoyZG0SvkXRs
	K0VQtehY=; b=dQoHNPnbqzcAiVjCRP5REVcCK93kXQYawnRXBKR5yAAjMjgRhnB
	ll3RDVvnqojYL1wHgm+DJhUYkxr7+eltfCU+Zlsp/VqP/nK4apG0J/mPcTgNommz
	2jBBhp3x1zvRoWoD+dO0EoEX05E3gIGz/62sW4YyF8UcBXc6V6jUcGjmFUCFq2oV
	eoAsH4It9pJ6C9xmcx8DC/dZhSRs3aGlI1Fc2tyYVsYWx0fp6f2qXzOvJEMoXk+N
	4Hrf2IXuIVYNvFCYAWpQryJSRzAX0Lcjuz2+RPHD2kRTzKfZVnqWBhaXZXYafvO3
	BqqK24hb2w3txDcHk3HWrGcKSHEgMnsw1dw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=sign d=seanlyon.dev a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792389872; d=seanlyon.dev;
	mf=PHNlYW5Ac2Vhbmx5b24uZGV2Pg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm3:rsa-sha256:AuKsK2jshElc+oiHeqS0n70PyigTMcdpJjBpp0doMianyyJ
	++yN8/NIcSg5JbBmjtUao8tGRMVikk1vzzqdMM3eUARS5mthr32wluJ1yGcBgvvz
	fRBn+IJt8qKRhRNQy2K1K1vL8GIbB6R+aASHv0Rvzs+oxO2oh8ip907CO8JE68Cw
	JHHfVUjkC7QqQkdissE25wEKNon6rTVuvVitmI7T/Gm0z7kpWDg3k8KbtsDG8kRO
	iKhLbRBhATva+gUjVODAJSRl0+4vpYxaodWsZ/DWaDDAivU94fLscJNgDkU4h6o4
	C+lVHibeLSmTjryOHOpb5vEXQtka66C5bXhzRAA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-disposition,content-type,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:Sh6CgQv2lVWYGjpmv4KDiE1snbVoBF0J5If67UmDqac=:UpAbfxihf6NJ8F5ckaOty9uycZ4I7rj2LCsVKLG/4r0=;
X-ME-Sender: <xms:8LLVarksXwYdKgqUn72rtBdhf55W784kxdSSuKGdhFqOV2t8I2jOSg>
    <xme:8LLVaquPQ73m3vDC8FmnT21G_BOv6nnEEUz1ZHEb3GW9n-htUsX1Sh23-dj-dnWky
    G4QCwgAxePGztmASOLaMD0PZV2lB21K9g5CBi2LTkOTp15RkSl2drAp>
X-ME-Received: <xmr:8LLVatK0jw3YGwjilJWNZKx5Bh0Te8ooyifyegDw-C7epcB10CsPPl-2pqNsO87e4eLSU6uLr--jZp7uWmAUXXoSiQ0>
X-ME-Proxy-Cause: dmFkZTE+hzeJAZQnGrgLhmSW9gh/tQXt9DaFejGM570UW0kAlfkbKUO/i4O0N5sEnRhUhq
    6/YaxA5ux0CJfN5JfG3K0/FCNnt3PuSbFKfF62ypE+ZI4Vw0iL7W8Gl4s0awi35f/5rhmQ
    tA6DJ53sxwc9wDhkCoXVtR5SY84HXgmRKi3r0lMtCLHGbpiDtF9BEn66ulkg8komwp+QuK
    p9E0a+6botTksQxdE9E230skmR3By5GWLKYHAMMfTvIciY9IdGkiSfGWDnWNS32hE13qvn
    yExIF4LQxpmlqUM2w/QiMpY06JA63uTXp1XmC7xz+lH1p5sRf01m2uU0m1b/1hQvaFNJHs
    okWxalxq5oW3kCQVXVM41D3ahyaAH0JIcjKmzkYEq7LW/9Tn8FgxylazxqbIcPZqpHzs/c
    83oIBzigYJNZKURMqSA5y1gUIa1xlVMinYaXSr3Tq0vMwNFaRbRjuovatRFGd7f8l/gw1n
    ydDysFDyksF47U+q3MLQ6HxJ+0Tit/U/XBjg0p0yHgtx5qEIPq3ZkW5FZ+jTNCJBhS/0my
    stMBQYMHay2RsAtFaysDC8YCSpPY6H/TYcGvSrTBrS0/aYoxGdwgREZVCXqyWRfQsAHQFE
    +jWhrdcb2drQkUSAZS1h0kC6nR+PMiB1t+7nQ1sM0+oz+KapgTkKuYMuEzOg
X-ME-Proxy: <xmx:8LLVaniTrwOMnY2br2lAA44HCyVZIdWfWwHIzu8f1pxnsxj8XzWDow>
    <xmx:8LLVahtTS86Ty8etF4BaO_rMUZ6pC5PeFJNGDCm2zrAq2mSj_YvRmg>
    <xmx:8LLVahg7_ElxYOIWJI885n963vZKf2_jr3RlFQOHXBwml_rnf9FQXQ>
    <xmx:8LLVasfaZnF1fnOandJzrLyrL7rpV27Wdi6IvM000Qu4BfVmhr-wzQ>
    <xmx:8LLVaj6XJLjQZHNSilRn4Q8vtkENakwqO-i5MnPqq9cmZM44_LfvpwU5>
Feedback-ID: i07c64b5b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 19 Oct 2026 02:04:31 -0400 (EDT)
Date: Mon, 19 Oct 2026 02:04:31 -0400
From: Sean Lyon <sean@seanlyon.dev>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, patches@lists.linux.dev,
	linux-kernel@vger.kernel.org, torvalds@linux-foundation.org,
	akpm@linux-foundation.org, linux@roeck-us.net, shuah@kernel.org,
	patches@kernelci.org, lkft-triage@lists.linaro.org,
	pavel@nabladev.com, jonathanh@nvidia.com, f.fainelli@gmail.com,
	sudipm.mukherjee@gmail.com, rwarsow@gmx.de, conor@kernel.org,
	hargar@microsoft.com, broonie@kernel.org, achill@achill.org,
	sr@sladewatkins.com
Subject: Re: [PATCH 6.18 00/52] 6.18.58-rc1 review
Message-ID: <atWy75eclKHeeE6N@ncase>
References: <20261017155104.830766652@linuxfoundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261017155104.830766652@linuxfoundation.org>

On Sat, Oct 17, 2026 at 05:54:01PM +0200, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.18.58 release.
> There are 52 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.

Built, booted, and tested on hardware for x86_64:

- AMD Ryzen 9 5900X + Nvidia RTX 3080 (nouveau)
- Intel N100

No regressions found.

Tested-by: Sean Lyon <sean@seanlyon.dev>

Thanks!
Sean
