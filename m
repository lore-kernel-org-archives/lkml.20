Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794779779;
	b=toAXvq/TDETMzJb2P5pLXiiXznBjYmeIISiA9QIk4vlyTOA8vnEJej4v+SBCoHvTSBMI
	 Lctd6j4t3JCw877H77XIGggLfytsLdEoqDYYV+hg+NZrPg/j+e7PwzbIWaSQFy3GfZvbC
	 yRh+csctJKxLGMjfBqXaaaZE2ocEcVBaTYbWa7V3ZmmT2s35Xi05MG2Kntmb4mtzpkxum
	 q+bj3xHGSQO8wmo2TuPUGI6eOCSjebpm1PORAHUQPzhivpBdDZ1IGSVoxOD2Acu8/iHkC
	 GJMq9aPhfj+yIUiuXfgtgeXTacd0sHTk7jcAL2Xn2HX+wmPhBzpEC6PMSpsXIZp+XcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794779779;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Provags-ID:X-Spam-Flag:UI-OutboundReport:Content-Transfer-Encoding;
	bh=PB2n/hbSbGORBrb7UPYTii6IqkXDV9Ot5Uk04f3ykr4=;
	b=tsSvhUKlIc0ejVf3oOSGys6VghKgJy6rFav199FUKbVRmUKeobD77PPFAmCwCs2I6+k2
	 gmb1OnkLpA9Kku4oIOlmzWS9jf68b40di0GnYlhUCQSd+LR2clqJyIlMm1y1J7LQCSbME
	 tbs6ibjeu4hBCFfpt3JUGsErz6KJ537pZsXH2XF3unDYpubIjm1UBqgyO2MQ1+ZWWqhB5
	 ibf42dOWDmeyu6Nyk4ub3XNFYzz6dHe1WXjGdtf3f6Wg9id7we4ezK/O4uPKseiVAE8la
	 wK4E+q3rinLc8WjAiUCDfQ5DDGYW/7kQESoEH3+XqvgywFFx45po+RDXpti2hijqQ0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.li;
	spf=pass smtp.mailfrom=gmx.li;
	dkim=pass header.d=gmx.li header.i=arc@gmx.li header.a=rsa-sha256 header.s=s31663417 header.b="o5MN0LL/";
	arc=none smtp.remote-ip=212.227.17.20
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21329606A31F
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 21:56:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21329606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.li
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.li
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.li header.i=arc@gmx.li header.a=rsa-sha256 header.s=s31663417 header.b=o5MN0LL/
DKIM2-Signature:  i=1; m=1; t=1794779776;
 mf=PGFyY0BnbXgubGk+;
 rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
 d=gmx.li;
 s=s31663417:rsa-sha256:C5PleNm+Mn4JAKY+lPEzUNHmmTBI
   l4WnC0sC40dRrOk51tWTKnvI9Umpetzvr9dain2wmdQsDY5NhF4NlIqv8R+X/xAKwfpz5srmIOj
   MynjVv1d2ClgXKziH7LHUvTPIwQJhlJhKSICuVLXyTvH16CeoqcWN51K0Y/dfCcn1NY8Uh3+Zlr
   rj2pGivMlhGpn3z4Rys5/HKp5ZiLsrUo28qGJbGrSZEN83RY4jRFMhbNP9HQaBNSr/ZiMJa3P6B
   yc4ajFyKTr3E6wOJz6YO0VFm3szK6hq3Wzd2kZfHisDQXcTYAXyDe2AVYLGvBbyX5PDYPoH03Yc
   uS+QnBRvFyFiAQ==;
Message-Instance:  m=1;
 h=sha256:
   kcyWeiOxIiHTJSvAMrWzOxO2MvMzoLImV/+pugtrtT8=:
   TFcGiow7101LOuRJHw1kUcOzHwrKvQxY+Wx5WiwPUno=,
  sha512:
   RvlA9KfYHok1UKIc8XjQtpqW5uYqlKhTlSjPjNGLgGWPVM6gw+mExHriKPSqQFnCbgAyN9+u4Y4TavYWQcpwKQ==:
   gT5YsPeLz8Mz5A/AUsqTIeqmgtVzbCbOQQ42VqRq/Qzr6SepiutamvGPDG5we9V+StEpTtL1b2vub8lN9h4uRA==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.li;
	s=s31663417; t=1794779772; x=1795384572; i=arc@gmx.li;
	bh=PB2n/hbSbGORBrb7UPYTii6IqkXDV9Ot5Uk04f3ykr4=;
	h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:In-Reply-To:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=o5MN0LL/XU0U17BPkxcTt70rS/jl4fMSKZH58ra7LHYR7B+uQfcitdWxPal8DLTR
	 IkeIsiCbfJMVQlgYk4MABS9KTtHQLVMU1U1EyKUXqjJc4Vd1AN8NdxY0bV5itrB+f
	 pF8DCKZELtT5bp+WXziotFVhkGv+LgpFI/noGOS16OVPcSy0TfAliDPbAjjQaMGwJ
	 svAF5TdTw5ZoG+a/kuLaJ/PMm7kmMsmiFwyJSLBG38EYBDTaXPlBAI7fTAFQMuBww
	 m/3mJc9oofdnlFYSBfQoK1k6j1f27lAokyZmepyV7kG3f+KPCrTR9XQgMYDHwcfDy
	 FWunnPR5lJRGdyC5cw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N2mFY-1wSBS016zM-012CZo; Sun, 15
 Nov 2026 22:56:08 +0100
Date: Sun, 15 Nov 2026 22:56:07 +0100
From: Christian Ruppert <arc@gmx.li>
To: perex@perex.cz, tiwai@suse.com, linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org
Cc: mrwillporter@gmail.com
Subject: Re: [PATCH 0/4] ALSA: mixer_evo: minor fixes and tlv addition
Message-ID: <avoqZ4w7pw76NIHZ@khmer.arcnet>
References: <20261026174427.24947-1-arc@gmx.li>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261026174427.24947-1-arc@gmx.li>
X-Provags-ID: V03:K1:1Nxp7C1/TRmWCsbXW7rfTg8eE9hQze7I0TLEnGt7rJatHSAAm0U
 aFs2JRwrtqlff2JY181HR5Zst0NIpGIvW6xy0S9DgMG3eW8r4HwyYtBKWTMCGZWbwTIzD4z
 Dqa4swPmD7LuQznUnzDK8TmMHC2DJhJ68kJfFHl5OSDyQ63S8KodV+sYCO50v1+hn2DZGRS
 prfplnvwsuEy5fTh+416w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:kiwTaVQ7dxE=;FHQJY7sE55qpG5O/SKHkLwdA0jY
 6uTdu5oJ30RTYK6shYsjrYrxD8UhkdPGCWZcszZEfJVqkFOhDX01XcABceW/RC+8jaJnTPfDP
 0mxCWeXpcZcrzkdM2R6+mMKdsEww18BI55KTSjfV5eYvCIte3RHrQxkL2qx0nnI/DPMT6uPNI
 vr5qSacrH0keEpkZ5+d8kjuhlBrKyzoVqNt8bKqFgvaDugOpBhWC4w0M4URIX1TxGRELO5izD
 oKBWpibCk4aVEt7Aahuhm4UKqAhimxsGCa8ipbsebNtsLWC7Mel9O1C+gtrzmD0aKkwE7h54H
 iltmZowEmQQABVoL7caKph2b6wP24bikiA4f7d3kk6x5Kk1WxjK5WTudpRLasY83l6FmdXIHA
 O3nbfF/t8aHqM91ZqSr7IL1o8B1DiTu/pKLiifNeud6RU0q5t+lxUv8JD4S8hkXSEGR+/1I//
 ODaAUhc06am9V+yl2BCmHwOinIbW8fmIdfGZ8gEfhJfJ3crJ2V3rpwupydBKnspy2/uUU5bNN
 w1PRdbPrIAIaQXcD1fPctSjtvRDvgU4JeJ7HBWbtxNE0mq4czHmef2S+IaBBK7W2gqxvUUM+z
 zyKRWYBcBWabYsr170frR2zcUOQl1HTGTmJOp+KuRtEHUfxX6WBeDd1smqSVsv+LRblQOSC0N
 0CXYIVrRC0dNFZ6S7g6vVGqAuvlegJc3E6JWKuIhOn50PlF/5irWtyyVyVRb6yuu/AKKLh6w1
 g/SAsBW8j47LzT+qRr40ViqAF45zZ2acBkk1O1DjiInyaE+ZIh6mqi+79/7u7g3K16+IgBsiD
 PHhI7Cx610+jdwYQ4gbEEhsDAnHv/1q1PQxPvyhjRsBzE52dyzcmYi863D9CoCXiLxaNphdTV
 tRswxUOXiGFGK1xDcbygQ4q/saoEHIHY/x1QD0Qp5tww/NTGxiPFWzxw/DrzhufBdv2CzqHIW
 eWtW9w1dtLSrJ3LkMIym4QVE/1b9QqYrrn1QOoFy3OhdNEBIlsLr5UoK711+Z80EHoTfI8cAp
 a3wE89U5qPx44FZvDr41+xXt1PQNS1/qVa42gfLmT0dGlUbqEBDsi1OZYALVvnW9BwE87fEVY
 Rxtb5sg4Xqvbb32f08BJ5npd4Hj7AGD00XjX87o1M4SlY7MYW9OIL/Y/cQhGyudvQZ3vKJRAS
 4LPT+R2it1pDL0fY77hdOj/ZNm849XFvqNdrDJroRZlY3AZViHK21aZ47zaJ6vVRSycpHE8vI
 8AG6xAnKjwKFLY1tIzR73iO8DFkexVuMGiA3VonYuxiKsktvoTwM9phLqE95EON8XIrNhfdql
 fg+l2t5xSKsIE1dpa2MjKnNkpEHhvfbK4brwjmYC9o1XAySJXVv05nh4ChfdoQCiOsirsW42+
 L8N3VpWUKjHnChv/uPUmy55LNPtrkyOcUxaDBYqpWFN1WtSD2ZFf4jzHd5a1Z22lvR/6Fx6p5
 troE5ci1kkdwQt3xfJ8reLcycjZOpY1b/74ykiRnsFMDR2YKLVfdVkQqP/85LJgdd4fvkar3n
 Z4aFrgdLW+PM6gz1b/n/YlowhmjwFbtIkmP6+cVqp6RJTqCNlVA4C40nleHIym2zeqwoBXEFg
 P/XnX5KcjZxvIQ37A54oxOp9xsw7rcJ5mq4dqVvK9C+P5wUKaHYm+DLO1PZwJLIXVibKI5teT
 4r1wBtkx7DFSz5iQNapQM6X0NMirkFGlRTRlQvIJfhhX5LOzlRyg88W8PdL+kqpO/iFWrr2Xi
 qOhFY5Tpu6RwwEHs1Gc87qcNPJbwbU6ByWfDdqBMNGKwfCxHwL9OpcIfnWcpnMSqnxbnWvIV/
 eUAFSaET6xbeIrcGXskj+I/PdxIjbPxpvnwY4vSnhN64is7djfNSlhJBIbsrLCLGEa9wb5lFM
 6DvtqZjClaiIWlcIcN6/Rsttj1Y25jfY7Gw6fNj0kbN4sqostTeUtfEjtVsviM5Euopl5ezGP
 ycmm2x9o10PBYy6LVxjv31aJx7Wt4ij4HbxNORoOQMClrcAY/XrJHDj11OErfJN/MBGI4/Uip
 OY1kDUYLG02nnrsRFfCZ6EQ0Oo2zCyGBYB5oKr8FOhzaRcYnuBIM86dX+ZVKDuLJeAJ6JhVi9
 gRNa1cUE0EAcaGAVys3zb4MPEpdXa0QyZgJpgihs3Jsm9FKNJ54S0DPSLi37ZA+C7DUg+NYba
 amwb5GX3p+70BpP4QxaJReFUAEE6LUXK2SJh36a5rmzIOH8ZJ4mz87JBcCoJMknj+fqMeeml0
 kw40eZ/kRAvMHs8rnWEvefJqI2e36vVk8zF5pZut7iCqqqpg6rnLHJCCbO4TyN67RGFM6MCfb
 CCXIdGEOUVC0aY07RR+efP/0JrUkBOC1X4fysm8WHMY7gtLSNhbC+wYBeoI4cG00kjLKOHY44
 PX9Tc1d1Z1SpxfsEKNRo2YRwjIeCDAthA39TLA3qMGx11sUezNlN7SyRonrD1ybrPSfpiUMHY
 4sxgMla3R9ZNW9ZXzpmuXMaCGZ52XyB/FQqnJIbmcIG/8FjCQ364kFdUtFkNAvU/xzd2BS5H4
 PV5LtAli3c3r4jAnc+IZxO34CtYFgUr72SvRWUeVZpUxO70doldF/36gxTPa7vABMxjhmsoHw
 9PrgwFNF4ZlQZydjnvWdGkTpZY1MQyTTCXdy2uWi/4ysvmTx/QaZo2DH1CfUTyxKHhMxaJVNb
 6IRwRMO8xHS4yBj5P0tGNy+1zJeq0U97FOc5FEfeiQ25bRpav5FXFJiEsZioFMFr1pzN1WSbI
 l5K6jkMpIjWpnJVGFgxNxzZ/iJ3AMaIApflYVVz1MPTb5XB+6JitENB9jWvPlYh0V8VH5QEm/
 4bqkiPWI75YtaHibZrujd67ssTuS3Jzox6r1r/3NCLV64/vNzBcljmkt84fTCFGKxOtdeKRUD
 iVESJDnHHMuXrY2vO7vgAaB5B9glGpQQhJA4otQI0F0wm5yAPv+OqcpNugUJeSgc7XKnWOSq3
 nGHqRBJ3+hq7y3guz8VxI9G5zleXSJyAfGJAaeHxfJ+vphFVkyUAfnop274tQk9h5D0npd1ok
 dIcKEPJlNDejKygStORBwhh+/LKbajDpQDLX0TJ1hGnwSyJHjROVoCgIQBFB/K3bbnjqf2qP4
 DUXLxFcnD2Pj7eoFFG+OcS0HdznNUOeikUeh6uZ0rOZa3KWduNhBd/uIjgEf1bgATkQybDfD2
 6CemjhCbByvK4TWbtBZjmRkh/y/gROOqBAfQvfd0dU0kqAuKsUTHRMmf7tH6+38ra1gWfT8ao
 G/hIPdRSLJYOdVDgq+tr4Sthm9gawJxav7Rnw9UPkkURxM6CU2Jhm26EOZHcUq3ClHHPCmbCQ
 KBRO+lzCY853UdPYfFvAHZ6xOluyApXcOOQg4Lso/hTKxPpwIF5ofp1kUMHJVyyKC4rgmNcMG
 5R0BgY99N3ZQTQCzvshY+ClB1ek5xTBXBnqotAVRoKjteN8LF7eZ3j5D5Rs/vYyFPNwAO6LIe
 M2+yCnYrqtPaiJQwu9uBW6GPWX+zfjsDUGjzysj6W5qwf3zV6DPAqPW5xYHnZKtGXDCMD8Yqk
 4T3ziY+zmPhPI/pszpjLHS4vV1vtRLvAtLzLqnc73fUudLqh2xTBGwaAXDqYOPt4xL1kBe/1O
 GSB09CRjpz0oNrcRnwItogkmI+nreVn6jjqaCa4rq29UJ44Kq6ZM7TehVZKDqRMJUAWVGIBrE
 fdW8IA2Xx0dtLgHIffMNlEg7QgwnCQFP6y7wlmMr/09asMUqrfi0TFk4RiVob9Iv2T2WkRtvu
 bjFU5/LjJUxkMCEyAzr9yY4zJ0ohScn/+onqZ49dilvMwgSgDmEWmqWbTzGlZxhA9D/PytFug
 bdIewt2lUcG29xZHP6kI0KlsGWke2EdUK11+8bIjmxMgDIkIi9hB5r+nJOscok2A4eiC4p1tC
 MoYsRDgJColXZ1sCyfaqxA6X0LD/0uLj1VD3VQhPG2phBTxFhV83CdTcU0NrAFkXcVEZjkPMh
 H5RVbnQonb4VEAjz7bmrKto5VeF8XfjQEVcnQgvxhc1isIi+AHSCJ20qNvG+ljoeET0/CN043
 2xLSsBXoiHURmB6SHatTpu8b1sJA3W5m1+ANFuQAtEMaquNUWCZwfr5i89ZDmnvfXPfblLTA+
 2uWtrgX+OeaA15Yfu+ihNzZoTTEr0MUDfqpqdlXb3HesEGYMRSUH8gEwn0xGmEkeTAAxXFK1n
 xgyrv7vf9uoWA9P2BSuH1QgpmnnU9+MYWm3SuYdunUdXqnb/qqR/gn8PJ8f8OVjrUEKRwJbFT
 Fl+/7hmuyGOnfY1+SeQeYKzMgAmEekdVW7J+2026WpmicYg0Se+YEar8Cz2DCVxlNhrQHRZ2W
 344LqgaCj9ES0V9wn18DKZcrhq6v2RCaMhVoNafXajp+PMmvEBMJCyftC/BN8DQ/ARasZ0ANE
 +9pDgFSkygTH4xUwDLHD5+wIFm0hnNoIMkPEBXlAJ5xWtUQUMIEnwglOCU7EcNaLwsRoKZWbz
 ozE3Ow0pmeoQoJffpnCkAGrNtfO8UPc49J7UNSytcw+yLypJCC3Jurfjs4LnUojlnubkXxYhS
 VkbfmzK+xvM7ZTixsRk9xwal9t24VykBs9HFfMWYyUx6dSKEMiaZfCc4MMR62ILMZCIKXakmX
 Jf6nXeZSyrAFPv+h0ttVt/Io8SrJtOoqCq0a72pej++f67LQBDip8fIcozYHIYOoc+I14WJnR
 +YLKCKZQGiqYYh3Mg3hyNU9QgQakMgWHlkXRET/u6/OkvnsZdwIAyqhy5uKmKy1LaZm0WweK7
 zBM6K1BjHcsAhPlmfyRqE6O3+oo1W5cV/lR+duDD2fdoOL7AoEgQjeZtIZ2JCI5Q6TmMWV91M
 lmsZVMCnFSLmH89xYpoQCMo+BOQoRxlgu3lApNKuni0yMIs1ci/KcBdiTzzOOif7I/bPQj0Li
 FwL6Y51mstflLNe0abZzg5iJniXmlUaenjn7HdKOS7evp32Vu2m1pRMFsw33EQGJQ3bg9Z56f
 Px8u4hDRWXGS033hBtKEoKT1xbmHntT17ksxqm/sksxdRGF5aHUSjie8ZXDpNVuaNfRrI/Qah
 Z+P0Dj+2gB36akCun/bvpKWLFKIYfAAMLk9/z6krQW4cbvfTvkY1aESU+kE26nM5viDOGH55/
 yLHmxdp6IJHiguobUgI53fphBBxnm4aBWXvnEmkV1VedO4kivHKahGilKQWb/j8yqF7gdiFO3
 Vgqlzc77CP2yitzLOTVJ0RK2LgUoL5X2CJbWSzcmCPoNcNfyDHWRjz27Nu3/LBWexm8DDxYov
 SKi6JnDwyEtxCdgMr3t3bgYkCdSSRXGC9dqD6Pt2b8i+y8VtTmNjjqesuDYoARwx01/JAe09A
 5NNxpDMXgUdEMV/CuxM5orZ4hkNwk/tLU4DmlYkjVwWXiibol40rf9fD7/hfFg8rhvXnuVuXX
 4nWT49npceJ3T/SyIDBAalGPG0ltKqi9F6nLpPfgxumDOqyLYFeaYbG0CNJz8zgciO0ptoe+5
 C9kMaCQQi1RHlDIglld+u+1KoLyUeD9VeZeKIj3ujsguy/xkNnCwE8QdVlb2Yi/by3TRToN36
 MoO8ao6o1jIsBrGwFjePwqFzCRa/Z+5Zo+UuwbJP6Ujz/wI95vgOfhnq++YSPybfY0b8R60vo
 lSe2/HqbFEZagD2f3S/or1CBR+lCW9qaIhIuxvKek1kCkOOj+Qj3fsbdrNhX+xApvmlH0O5CU
 DKWGtI1fK4KWQgJ2bd1lgqo053IKdVKCwkz0tSXaO6T5oClgldXAilnMo4RQ4MZfxzkhIKDuk
 7HYGME/I9fqiA1iO6RY1uaf93/A9LiahfkNiUVcwHmhsJiJA3Wme8mKCpSeJg1CmyGTfHmOSs
 sOx88E4+qc+rtvwTF5lof7x/ZDlj49I6Rxv8g4fBv43ySOUWfLE4nJ3EOLItgqlvnT5PiDVlP
 Fq0txa7PhVELSv+16QsBtyBaZ5wL/pvn66oFSkOD5hHvmlqGNLCiQotLB8S9DsTUMv7V+Wygh
 9m/fL9Cmhkjbh9/PlqAcdsxaY/3Efz/p+4QTuqvOy6ososHMxxdv2DTvnTCOef+ccUrEXs1Nb
 vo3ktxlZaDHxcfnLFKCOADGhmQsVONyj6tHB4BKJJt1zUdElyDoH5LPsjNZBSIMmeU0mKTMuS
 6LUi806lQ31FG4bd0wDYI+ovBWPhLoqpjTF6cssf8QCskTe58BsOxXQ7YTq2kj3WvPgzaY1Cl
 XQ5C1j6zFy14hPmjf5Tqqw1iYEcfnPW4xMvjq0924dLDBvR8et60LrPr65izA6wqm0hdHoqnj
 0Fehyu4oW5beD0DNw/OBztte4STfcx87Cz90h65c0ZCeWMXijA8uCVdJ2YvBe8q5a0RoYEdu7
 QkZmSKzYBgDE3tcGPUDvy+79PNB06GQRzoGKDJ5XBKZ+1fP2Hy8GFSfOiibp/gmJVJs14uQQQ
 UKnzXUHKsjTfQYSvhiev6fQWDNH8aanjJDJEB1X0tMWOvDSl6znLiqkIGD1AdHPt/gN69/KR/
 J+CZ+9VyQOMOT4kVnlalV74oe6AC7/QusCZlAptxl8vcVIAbjrZ7ymhTg1YPrX3EksW7OGYmB
 2gkQjMcHCloaNDHaPbVRWV8cV0SXcEwjlRxakSmePi8c1tz3EGLPnv/6z0VPLXul0ojrFpdqi
 9Z1Qzs92k5yN5uZMJv3NTr6c5U6eSBv4ky+FzthOsfte3f5xv3n3ySB8rBd52QHBPnmlGWJyd
 uYDdFXlJRjJW7P4CQdPBTPk5N3v24Lllv32+wJ42cvRNVfkke5EK+SbSUKG5Fd+zAENZuxD/a
 3OZRGCFnmjyPEMhgp2lnlqwtm09BTs/KnO4yQDKUlTuBn3Cwop2oDFutjN6ls6wH9vzE3Ub2M
 5uWoUX1jDzI+d4mpEMl6Hv6xq+cBmq8la8L0iuSrNJQogwzxRU+21vE4vV4k9WlgtSa3duK10
 DxRe+AOiyTQ9YXLbykQIofLoXOg==
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

I wonder what has become of this patch set. It was intended to be applied
before the initial driver goes into a stable kernel (7.4 that would be)
and the iD14 support currently under discussion with Will also requires
this.

I kept it intentionally short and limited to bugfixes so it can still be
applied after the merge window is closed. Let me know if this possible or
if I should refactor it into the bigger patch set for the next merge
window.

Thanks,
  Christian

On Mon, Oct 26, 2026 at 06:44:22PM +0100, Christian Ruppert wrote:
> This patch set contains fixes for minor issues discovered while reviewin=
g
> the proposed audient_id driver as well as the tlv definition for the
> recording mixer channels. Thanks to Will Porter for triggering this with
> his submission.
>=20
> Christian Ruppert (4):
>   ALSA: mixer_evo: Remove double end marker device list
>   ALSA: mixer_evo: Add missing snd_usb_lock calls
>   ALSA: mixer_evo: Fix endianness of boolean inversion
>   ALSA: mixer_evo: Add tlv for mixer channels
>=20
>  sound/usb/mixer_evo.c | 35 ++++++++++++++++++++++++++++-------
>  1 file changed, 28 insertions(+), 7 deletions(-)
>=20
> --=20
> 2.56.0
>=20
