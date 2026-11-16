Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.126.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794830423;
	b=bm6H6TPUmkhEjOYt8bc4cHER/AQcZkR67X55fT/jv6d948CwnYQSxis8eYBUZWO8Z5rt
	 UfkDuE6e9rzfFjHLsjtqtP4RBKJf+gJX+rDcci9XQhSYapXsyjI+jhLcTOFaJtMPXfk8R
	 k/BCHW+I0pV6Mzj+zcdJ/whuvp0My8XHpFMIBdXvx2aZ1+1O1HrbJDe1x/6RhqhuNRolP
	 d75+3FlH/yLfKvtbFna6PZuglSWKDoEI+iRxZ2cUINDFE0n8VpSkobE6b56MtydvvRV7E
	 9ERB46eTeI6UH55zZ4oAA2izhY3JZ8A9nWyhmMyOG7w6jIYvsBmDGbeHg7FRPo8r55g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794830423;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:Content-Language:To:Cc:References:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:
	 UI-OutboundReport;
	bh=5SjiDv7hAU9KASHccmkL8xIzSotpO3zTrmrUOcQQcQ8=;
	b=xPDGyV0B9p32RvoSmj+v3DKKxCTNSQRPRIbpt1Omkt+P6CTq1iEPr9boVDVqG644OEyk
	 fQ+5Na8XhMkLvgJrNkGNs6kSsgoKbwFY9EGE6NQ9CYrVhGo/P6xOHftg/kD88YvQVLa1V
	 bsCNPvXUSIj0UlaGA7XsNZamxArOz0J4BRE2bvnQJD2wBASQqBrpNf23GT3qchhGZA1uo
	 Fh7AsUP1gOb+nMmyPNoHUOMxM9Pa+oywFnLGZXCqtnFLOn5Ks1t3qMg3K2ba1TBGVCU1A
	 p2tm0EcpkkMVNmQbHmcbKD3zHpb0DH1TO62P+PDnNSN7/vz5w1GP1GpQz0B8BWXiLeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=jonasjelonek.de;
	spf=pass smtp.mailfrom=jonasjelonek.de;
	dkim=pass header.d=jonasjelonek.de header.i=jonas@jonasjelonek.de header.a=rsa-sha256 header.s=s1-ionos header.b=knhHn6rh;
	arc=none smtp.remote-ip=212.227.126.131
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2045606A8BC
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 12:00:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2045606A8BC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jonasjelonek.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jonasjelonek.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=jonasjelonek.de header.i=jonas@jonasjelonek.de header.a=rsa-sha256 header.s=s1-ionos header.b=knhHn6rh
DKIM2-Signature:  i=1; m=1; t=1794830420;
 mf=PGpvbmFzQGpvbmFzamVsb25lay5kZT4=;
 rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
 d=jonasjelonek.de;
 s=s1-ionos:rsa-sha256:e/aWYTr9Wetrp6YQf3jUaXCzwTH9
   qchw03LyjMhZZHDIVt/Xl8lESpccDTtpII8jQW34oPC02yC9Yc3oAai/l6Go7T6hrTG1wv2nIWf
   PNeePY2LIxE/8C/lVm5Qg3d2xfsk3dYEGhF6SYLWLWYJtCjrLY3nTKJpX3JrFTdeWeHQSkcjfxv
   ZzUO2hcb2lS0eN0D3VEXMwElBj+xCFhL4K9r+XxF4rscatE7HvR6MjTMbDxdAcQCljjC88t6Y0u
   wY0lTIrVVV7mbOZzpDtucdo7Cnh3F48mihEXNahFbRV/EVIEelFOxeUJqc8ao83bKEjYncsBdm2
   A7MA3AmlFiTtjA==;
Message-Instance:  m=1;
 h=sha256:
   5oSJwHQXmUuHon+NKbhbjXCd72u+GUSP7/RbRnh7JxM=:
   5SjiDv7hAU9KASHccmkL8xIzSotpO3zTrmrUOcQQcQ8=,
  sha512:
   cUoPwLXxLIIKn7rl5mZfpzS+bXLBjzFsHlq2C5tp5jCClSz7MjHzOToPGL61SZDcpoGs+iijzsPoCY5me2RzZg==:
   pSb8sFmeCbYAS6dYKHSXS/noKb7sN44wDHrT6vmhOwHql2qDtqlfh+YYky06tfl9UXLW+OrA3yiRQ9RZe9apMw==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jonasjelonek.de;
	s=s1-ionos; t=1794830412; x=1795435212; i=jonas@jonasjelonek.de;
	bh=5SjiDv7hAU9KASHccmkL8xIzSotpO3zTrmrUOcQQcQ8=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=knhHn6rhm1vGo+C8oIuuTjzTN1bVc8JLgpJL0taCgDmvquzPcdd345mYMscfB6W4
	 Zy69JlsC5Hl2no2K4ifoFmc//XpzlU2Uz8qvsx0YwJXdGi0f+z2cuE4G1lzlt2dsm
	 RqV8uX/5sLiPNPKPM5Jnnr6Fq5qSGLHSvLk/OuWFDmaNwU7+6Zr/QQosG4jPPr/rB
	 GQe6XDAQmw76Y7kuQlb2KEtCZUCW4R0DSwHvA0VO5XoDnP4NMXR1gojBHHeDNO806
	 Xay1nqWyxCLOFV1TvzuVGCUgDXg1UjNcuw03VtROLnUiXdip4RQUQyETxQ7a6dlom
	 0zlvDoztnPKO8hxV+w==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from client.hidden.invalid by mrelayeu.kundenserver.de (mreue011
 [213.165.67.97]) with ESMTPSA (Nemesis) id 1MJEIl-1x8nGJ0I03-00QO57; Mon, 16
 Nov 2026 13:00:12 +0100
Message-ID: <8dae3bb0-dce9-4efa-8ff8-0a7d59083bed@jonasjelonek.de>
Date: Mon, 16 Nov 2026 13:00:10 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] net: pse-pd: realtek-pse-mcu: add RTL8238C
 device ID
Content-Language: en-US
To: John <therealgraysky@proton.me>
Cc: leksij Rempel <o.rempel@pengutronix.de>,
 Kory Maincent <kory.maincent@bootlin.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <EEsDzyK4pKqMZ9P6eCtfk5Qp2SXyprlFB4e4uQ7_O1iw3BuvnNm95DKBxuHy-mp3vdmUWhob9UWOzN9VWXoYyQIADqKPNvJt_gfaLaWpSkU=@proton.me>
From: Jonas Jelonek <jonas@jonasjelonek.de>
In-Reply-To: <EEsDzyK4pKqMZ9P6eCtfk5Qp2SXyprlFB4e4uQ7_O1iw3BuvnNm95DKBxuHy-mp3vdmUWhob9UWOzN9VWXoYyQIADqKPNvJt_gfaLaWpSkU=@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:U7eZX4/8osm9ttKOrR370XiBqQRNx59LU9dIL+DxDoWj0cFo1eI
 Z2ePoAlcbJYjcDDqXgkkwBsdVHwg9T+yB4W7frC6UVt5CUOJ5kS+pvUOmpR9+6TNpEOguuI
 EkF46XGt1mjJk/XD6pBCeqo+vBV8O05EDopMBcfpYWvhHwrcc9UOkHhLyOlfpYCFNE9BLqj
 zBYSxVDrCa95t+e2eoS4g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:sY307BdCvUM=;+9CE/fiaECSebreRr5S8uHgNhsg
 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


On 15.11.26 10:40, John wrote:
> From: John Audia <therealgraysky@proton.me>
>
> Some Ubiquiti USW Pro Max 16 PoE units (boardrevision 3) carry a PSE
> MCU that reports device id 0x0238, so probe fails with "unknown PSE id
> 0x238". poemgr names this id RTL8238C.
>
> The high byte of the id follows the chip revision, as with RTL8239
> (0x0039) and RTL8239C (0x0139), so add RTL8238C with the same power
> limits and power limit command as the RTL8238B (0x0138). Tested on such
> a unit, PoE works on all ports used.
>
> Link: https://github.com/blocktrron/poemgr/blob/17771dd7b3a74a64c14351d1cbf8e61676934cbe/rtl8239.h#L13
> Signed-off-by: John Audia <therealgraysky@proton.me>
>

Reviewed-by: Jonas Jelonek <jonas@jonasjelonek.de>

Best,
Jonas
