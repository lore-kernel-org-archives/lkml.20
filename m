Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=103.117.158.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794580606;
	b=lCPwdq7BxIyNT055//xNb41ygL7A6XBbzIgDN1Hp5z34GEVQrycglBYmQt5goMjXjB+R
	 Nm9W0XLXbmwumFUJHMhbR6cn5yWymhxx0VOWL90rWZiKPi02bnf2PNlogxu9PTzDKS0vd
	 xGe2v1iSvN7Yv+LpkyL8JPljIUVkIVS4AkQ49aKYCTA/njf2RPbKxXyjAn188eSKVvUUn
	 EMfRuguqfrMmsT1YaDP9TLsDCh4yPTx0AngNaYU2fp6//kCKH0P4FJ2a2VBA1l4VdaOQC
	 QyIgK+Id3Zb9ule91ed80QqTF7w/QsXkA5tLIKeeyryxbkr3FY0D0klEa8DcmAaGK4w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794580606;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Zoho-Virus-Status:X-Zoho-AV-Stamp:X-ZohoMailClient;
	bh=Xa0hGC33Twzn+XCBE1Wfl4I1ASOYAOq3uwybg/h8DG8=;
	b=h1ceWxN0a98wyiG4ZEHUcj/RYvdxlcEqOaYyWzO5+U8oK15qn8ZA7simYAuHTykWVDAG
	 rYc0pSoyYbgGPhLNcOoyvWnngySAq7IkLUFA2aZavYSO2a+C7945bebTFM8Y+qnw9yQc/
	 oE8Kp7WjqfP7KRlzZ0tQQfIMKGPkw6xy3gnbwWCUx3VgaIGcN7B3GeMhMGCAVTnflQrm0
	 rBnkMubU1oXrBWmZUYVoHhXTBKMDdHVultzTkU3+zk/LA+Flv8sKfz01l604VGzCZ3IZr
	 Uo/AIv/l4akwUVy12mlnWRq5suR0F9DNklLyQrW6W5aX6EgHiGMW3sgRvsIkXVNjx9A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=inferno0230.in;
	spf=pass smtp.mailfrom=inferno0230.in;
	dkim=pass header.d=inferno0230.in header.i=@inferno0230.in header.a=rsa-sha256 header.s=zmail header.b=XScjqbWj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=103.117.158.53
Received: from sender-of-o53.zoho.in (sender-of-o53.zoho.in [103.117.158.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC79606A323;
	Fri, 13 Nov 2026 14:36:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6BC79606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=inferno0230.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inferno0230.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=inferno0230.in header.i=@inferno0230.in header.a=rsa-sha256 header.s=zmail header.b=XScjqbWj
ARC-Seal: i=1; a=rsa-sha256; t=1794580578; cv=none; 
	d=zohomail.in; s=zohoarc; 
	b=J0QcVZ33GmClLpt3VghHS91XLED30LGnG87Wiop3F+K7twyEoGypwwI/KJMRhrujrE7TY5QjCH8KmLOGuB37B5/UzVQ/N7DbNK+0+tZp+0DWra33TcTInWn8mfuFTT5UiBz+qcnnpeL+/PavNpzbHSXt0gHwY5QEHK0YOcjL4Kg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in; s=zohoarc; 
	t=1794580578; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Xa0hGC33Twzn+XCBE1Wfl4I1ASOYAOq3uwybg/h8DG8=; 
	b=UXFecR49UatWqTEWzo/hxedCW2B7np8YzRYM+HC2PDjxrEaBGou2KpaZ8RYTzuOw6NfPL3lgZWaRqxJY0ndfhm5H2B0PeUvbJaO37LicM0x/7EwEexrrM1EB4S8KlBkm/sGVR5N2ugWwKFyOc/vLySL6IfhD/pz/hpd0bBF2H9w=
ARC-Authentication-Results: i=1; mx.zohomail.in;
	dkim=pass  header.i=inferno0230.in;
	spf=pass  smtp.mailfrom=mail@inferno0230.in;
	dmarc=pass header.from=<mail@inferno0230.in>
DKIM-Signature: a=rsa-sha256; b=XScjqbWjaLNbBaLmsfzEuN0cBff7jbNxyiEUvUHm4aCTwD598+SxNwAl4cV5PhGKyOEMcwG/e/e0URsbFrRUc2Qt0rZYTLMHULK3DxkLiwiGs0EDoUaSk5Fy2d+BLkaMh2TsVHSdqvWtvjHkW56PIlkbFnKB/8+lFELsQcUryTQ=; c=relaxed/relaxed; s=zmail; d=inferno0230.in; v=1; bh=Xa0hGC33Twzn+XCBE1Wfl4I1ASOYAOq3uwybg/h8DG8=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zoho.in with SMTPS id 1794580576449368.42053150656534;
	Fri, 13 Nov 2026 20:06:16 +0530 (IST)
Date: Fri, 13 Nov 2026 14:36:14 +0000
From: Aditya Choudhury <mail@inferno0230.in>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] soc: qcom: Add SoC ID for SM7550
Message-ID: <avcgXkYgdjpfnfbZ@mediaserver>
References: <20261112-sm7550-soc-id-v1-v1-0-57299906d81a@inferno0230.in>
 <11036baa-7dee-45d8-9319-311288ca267d@oss.qualcomm.com>
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
In-Reply-To: <11036baa-7dee-45d8-9319-311288ca267d@oss.qualcomm.com>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.12.1.5.3/294.544.16
X-ZohoMailClient: External

On Fri, Nov 13, 2026 at 09:12:24AM +0100, Konrad Dybcio wrote:
> On 11/12/26 11:30 AM, Aditya Choudhury wrote:
> > Add the SoC ID for the Qualcomm SM7550 (codename "crow" in downstream) to the
> > dt-bindings header and the socinfo table.
> 
> Please use the real codename of Camano for the following
> submissions

Thanks for letting me know. I'll adapt my patches to use 
camano instead.

Should I also send a v2 of this series with the codename
corrected from crow to Camano?

> 
> Konrad

Best Regards,
Aditya Choudhury

