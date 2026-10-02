Received: from fhigh-b3-smtp.messagingengine.com (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9A89466B66
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 12:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790945769; cv=none; b=k4I1Vp8ciN1Ka6vQ1WKJdl9B2sA9D04VAJU5D//fOMu/eweR43C+46WFBujvt7sTftlJPAXPzjV6Xed+Fo6x6BPWeinHPDwSYSD6ZfQEjSn4WUUgswZxFrWDjbbXTwlyHSkUZP0rQaTpeR/rdj4I+26xrAbV4F04fTKcRzP1PYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790945769; c=relaxed/simple;
	bh=V95UHkrbcOYq0T/4EHPDmEliK+Q6nlmjW6vNHxvHBMk=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=MIPVUYbZxS+QFoHELo9gQy8Lc29rtpJXI065OUMr8tXGCIgKl1D88XrjTWZgE2NdhCi5jACxXjZB6sDWqqYAI5WANNNAiBC1M4J0QrHtIKuqAmFLVm0m6bbmIBxN+hXWl83pk2tb7S+bXvKZZ74LTM6cnsPh/oHr5C0gYiwBwTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=pJes2Lu5; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=PPY4g7zV; arc=none smtp.client-ip=202.12.124.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="pJes2Lu5";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="PPY4g7zV"
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 8BB787A010C
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 08:56:04 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Fri, 02 Oct 2026 08:56:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1790945760;
	 x=1791032160; bh=PXm/s1pE30yCEp+JCdAY7wLQ+ffAjFXrmF/vyDzbqVs=; b=
	pJes2Lu51R+6jHaZ9ZgMU10uV4G/G4ranHFAN9v/PquaTW68Ti+QDqdEk/UYTXwD
	9zEDrCpkWmbAABqcTZ/WxhY82zsiDWf8iABirmIWqJanyPvRxOi7qdnfssEGkzzj
	/XvCElHw1IolWnsPfzXA7vg3ueS6/JSZJA+3Ms3cqwyxJ1rF3pOMPo6K8qcUup7H
	hF5Vsofe9dyiFnhECAHdJguVk2D3COkgoqRTsQkDrySP07+XETYCi8Ze0hUSTmmq
	4h+9IVXZ0TH213Ml8uNetCOJMqr6wvFNFWEOtzl/UIxIi/zudjU9EKgD8pvM51+W
	dna04fH9IW/Oqs5X6t+kWQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1790945760; x=
	1791032160; bh=PXm/s1pE30yCEp+JCdAY7wLQ+ffAjFXrmF/vyDzbqVs=; b=P
	PY4g7zVhUeTZtwHubf+HJQJtv8Ox0E2DNtbYeCCDQmhVK4QMjrcXlngJhwiInMKV
	PNOohXVj0mWgCiUdZTFrTX9TyCmYBgUKBJzURY/E5rSmH5s4w/URCQF4eolKINPD
	+AYRNImmg0pi36NXk51sopbvncuUCqftV3i/44ICeJzjGZVwYwe+St89GDTgzdYG
	KabUEZ76JgrgDeK55Ng3K3MvZ9jS1cJ630hI2zfNcCggCH/SGtiYdqjS2U52HMVb
	ISrlouHYI/ZKh7yLlf94fYRFhmKyrwYq3LbLWzOXJGmpdiwSYN3+EuhlEBGWuNrT
	D5pKQ7ITqBqAhkcJLdcuA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-09-30; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1790945760; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm1:rsa-sha256:cQ/ZjlkV6S9JjppQ4caDKdI4oxRE1YWAE/VPEza+eVbmeFL
	7KDph4ylAWkxb4BemHsOIHN9zHmvYJo9h/zsa5nZYvKX0lU76RLSo+myOT+ajhFn
	PSacmfohr6pEMNpuF1YPv8lN+4CqSYBlZWBHrD/js3WGaGdG9t3mbrqk8WYOcdot
	4rwcjDqZ5Aoa89dI1Fn+nx5K0eRd6v8x2BJOlBZLRtBOicy8RSqBrdz+Ibabq1FM
	wCySzSB1z7WkZvpPu9TINUgl87OyvJmH85GY2ZmHjeAqsZvYz65UB8i76vxSJTC7
	aWHQMeZKukoGV0e06Ibd8SZYS6hWlrfA/QzjZ2w==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-09-30; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:Vu5FmLMNhwkdZcTjl9gs129roiSPUtO5opUDKUk3bSk=:V95UHkrbcOYq0T/4EHPDmEliK+Q6nlmjW6vNHxvHBMk=;
X-ME-Sender: <xms:3qm_as8njPu-6sD7JtIX__25M11ENfLhMf90bQzgGKXYcH6UvwtRQw>
    <xme:3qm_avjA0xaCppUfDEu6vjQHBhj58qDpxboSbFVjKlnNjbjEIQCIU5SHdnRA1_CwJ
    7iUDnaLAsWd2H1EY1Tncb4CLcbc3ht4RuLIVAkNw60q-edlCJp1RrQn>
X-ME-Proxy-Cause: dmFkZTFumxrAyI/TMWwcTIytr6mYmJc8IQAIZHsdXarQ+4jRIff1u3K8MTs6RbS3izYGlx
    807JaIgPGxpEYyt/WRtJCiUAo4KPi8Q8ED/SRpSvFspRNF3NCSmuOLhkCRqD0+wnw/uSIA
    p3hGE3msrA4TxZq4pDSFr3InPD0kN7xOEiG5cztqwLSP3X2rkojtbyYDgID1WRm6hOwbC2
    tW96tTGQ8LX0LzX3Bv8o/JnjvgbRtjBtxavyZ76OyQUIFvKWq+Hhnp+jPRy8X16f3iMnRO
    wiKp/T5pulT/IflHa2X/f3Q3nmzOfTV5hBFGL5YLXfmOfFWME6MLtqrF7VulxSiIT3jXZS
    vHhxJe2BNh1+B2AEJqTehomgZZ2DAP1JFHWWNCirbdpIgtF51Ab6a4o0XG+TXZEB9xEZ8O
    RGm5L89/I1iJdcjkeymK5+82yBidilLq64rWtcgC4pAyhtDzcKlrmgNXEP7QzcnjtRf45j
    f9Au34ZdwSwPXOExqmURlzP8c+BztUwqp5i55Zus5rznQew2wH6Y1at0QBGzZyuYllXGB2
    4pBASqQffnCn3e9VWoJP7Kwet92o3RgotkfaXPz8e8wY4M6rd41fUORrTMkl6TV58vKuMd
    D69CYa2v+7QWp7H8YZRyRV3EYYVNKBhnFLqeYsv6TynZfwreZhLYss1pr78w
X-ME-Proxy: <xmx:36m_aupao4ql6EK3cafrEwnW-P_j5Bi2vz_vHU89uyy--ScUAD75BQ>
    <xmx:36m_al9h4WqFc_rDY6cLG4VrCVR58KK3qiRsVtWm4J3vjpv7TqqvUg>
    <xmx:36m_aqeee4tZMdANMsngTqrEwPkYM6G_Bnvtfbopyu9S88eHRx9jYA>
    <xmx:36m_avK1UBct3is3WGJT2HyR195hRpag5iXXb7ySZJRsSLx8BsXkWg>
    <xmx:4Km_aqDMX98DeHSqbIU_OYxPdbAYnwMoKPqOh0NsxWS8dixTL1ZUvUx1>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 3D35832A008A; Fri,  2 Oct 2026 08:55:58 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AH4vkjSatP-c
Date: Fri, 02 Oct 2026 14:55:37 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Alex Elder" <elder@riscstar.com>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: daniel@riscstar.com, bhelgaas@google.com, linux-kernel@vger.kernel.org,
 "kernel test robot" <lkp@intel.com>
Message-Id: <2582b0a0-009f-40f6-9b5f-85d4c8b2fe84@app.fastmail.com>
In-Reply-To: <bb42c2f1-eb0b-4ff4-a4a5-7f847baed1e8@riscstar.com>
References: <20261002013306.373689-1-elder@riscstar.com>
 <d8890acd-d854-4f66-8ea9-3b30bde41605@app.fastmail.com>
 <bb42c2f1-eb0b-4ff4-a4a5-7f847baed1e8@riscstar.com>
Subject: Re: [PATCH] misc: Kconfig: tc9564: fix a circular dependency
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, Oct 2, 2026, at 14:50, Alex Elder wrote:
> On 10/2/26 1:02 AM, Arnd Bergmann wrote:
>> On Fri, Oct 2, 2026, at 03:33, Alex Elder wrote:
>> config TC9564_PCI
>>   	tristate "Toshiba TC9564 PCI function support"
>>          depends on PCI && PCI_DYNAMIC_OF_NODES && PCI_QUIRKS
>> 
>> (in either one or three lines)
>
> If I do one, I'll combine OF and OF_IRQ similarly into one.

If you have a dependency on PCI_DYNAMIC_OF_NODES, you don't
need the extra dependency on OF_IRQ or OF.

I guess you don't need the dependency on PCI either, unless
we ever want to make PCI a tristate option have that in
a loadable module.

      Arnd
