Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=57.103.78.63
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794594396;
	b=nmK7AIC58UajtRtoNFKMBfbSB+reteQIyqIUX5sDsoPQAcc2PWiDzDAN9wCeCRIz0zLD
	 TilbGWvVWKtBNs0p1KTO3rmGl3LjkOVPk79xVq7TPb5yrwS9B7CMSnPIfFYOiWPAvmXTR
	 TRRdfIx/UC/isGyYAtP9VnAOaOfEhq9Tq3xxtfvTZMK2dzQLkvTzrT6kHiGC74CU5T5oH
	 eToU/f8gFCSrJEs09sMexP66r4r8nqQy3uvsCkY07y7dwSkkfEghUDvEHYTG42BqfmX7o
	 VUiIGjJTN/IOccZP9qFmaNbQukQIEVskWk9+vFonn9k36YalhciSBPKEw9HqNGlEM+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794594396;
	h=DMARC-Filter:Received:X-ICL-RepId:Dkim-Signature:
	 mail-alias-created-date:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Info-Out:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-JNJ;
	bh=dI9CrGLsTqSXRz033vXozfBoNgpgi99PpoTMTGjh9Vo=;
	b=yW5Ysr+piL2hoFpZQAaaxLR1fMs8nu8NuK16/SdmexBrqCc2xKPRfmg40I5weoWTAQJa
	 V7vmqvTSxzESfB3uW4i/FYPjJXn6QEF8NOQ/2BCyaKuF4UgYtcAparx8+kt7S4wgK9+vf
	 RfZ31JsZIDG7DU4ATMGl6s+LdbXf+/Z1nDbfDRzbVZYm0dlS9wpWIfwQ7cF4BcIVzJCZF
	 24r9ofhmoGaxNloD191ye/0cviqSOZ8WFO8qmq2Y8DRPxkvn7SRVm00B3RtkLalC2xZg5
	 CvSuI9avWtiR0u3oEoqM5kImQhRQD3k1LbnEhG8hQJmOjWN+HLj9NIdKr10JuD86dlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=tawheed.cc;
	spf=pass smtp.mailfrom=tawheed.cc;
	dkim=pass header.d=tawheed.cc header.i=@tawheed.cc header.a=rsa-sha256 header.s=sig1 header.b=qZUzojcE;
	arc=none smtp.remote-ip=57.103.78.63
Received: from outbound.st.icloud.com (st-2002h-snip4-11.eps.apple.com [57.103.78.63])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57FE5606ADAC
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:26:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57FE5606ADAC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=tawheed.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tawheed.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=tawheed.cc header.i=@tawheed.cc header.a=rsa-sha256 header.s=sig1 header.b=qZUzojcE
Received: from outbound.st.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-east-1a-20-percent-0 (Postfix) with ESMTPS id 31FF918001C6;
	Fri, 13 Nov 2026 18:26:33 +0000 (UTC)
X-ICL-RepId: 01a1d629-4c54-7838-a93c-f05bcaa2eb77
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tawheed.cc; s=sig1; t=1794594394; x=1826130394; bh=dI9CrGLsTqSXRz033vXozfBoNgpgi99PpoTMTGjh9Vo=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=qZUzojcEfqOp4RnS85AytiKRVn/9aMVBI6MdmLmbZlIGz9bEHNy6fBEQwOgNgXSw92H+h7kZ2qH542ZblLz161mnNLposvmM0+hPIIbGdF0l/kjCojq+VcOwJwasI1K9R4Y5MaQGpQRRxGzZ4VVqUfhrh+JWtk29CVoUPVcHsHwzxaMqJBfDC2j0WvF0cl5bKSlfcda+BpS2MDMn+fdCNfu6LVbCHZsX3YTo+74/9HLU+4+wQ8yzKbpLf0QtXsY76Vj6H1E3NDL7F22QTwqzwhb1PsewoQNvvAjoUyM4dE0ijXwjjNRep26gmXitnfQ2hAqpVwpz4P9f0Nz7Dbr5Kw==
mail-alias-created-date: 1711150425226
Received: from DESKTOP-HUABEFD.localdomain (unknown [17.156.216.30])
	by p00-icloudmta-asmtp-us-east-1a-20-percent-0 (Postfix) with ESMTPSA id 58ED9180010F;
	Fri, 13 Nov 2026 18:26:32 +0000 (UTC)
From: Tawheed Makhdoomi <_@tawheed.cc>
To: Val Packett <val@packett.cool>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v2 2/2] remoteproc: qcom: pas: Add SC8180X SLPI compatible
Date: Fri, 13 Nov 2026 13:26:27 -0500
Message-ID: <20261113182627.471-2-_@tawheed.cc>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104080200.135431-2-val@packett.cool>
References: <20261104080200.135431-2-val@packett.cool>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Info-Out: v=2.4 cv=cLJ1IVeN c=1 sm=1 tr=0 ts=6af75659
 cx=c_apl:c_pps:t_out a=oyWFxbOnq+dmhQrAPgaJYA==:117
 a=oyWFxbOnq+dmhQrAPgaJYA==:17 a=MKtGQD3n3ToA:10 a=1oJP67jkp3AA:10
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=kibvr5HLtuNvmma_iept:22
 a=hnSFvG8eRDSKuwTuik2m:22 a=OXmT9jt3cf_crHWiQK8A:9
X-Proofpoint-GUID: Wt4tP7gC_h8RVQ2Ci2rHMAydzoaJmLpM
X-Proofpoint-ORIG-GUID: Wt4tP7gC_h8RVQ2Ci2rHMAydzoaJmLpM
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA3MyBTYWx0ZWRfX+uP6KidQZLNI
 LS6N4VFTQNHsIxsNX3P0YBThGk0JabAJN7iGJGdz9yo5PGTDQxnYNFmca81YrcHqV9xy7j9z+lq
 U2grySMvx4B7Mj/WkGJ5xGkMBhN64/E=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA3MyBTYWx0ZWRfX7OE7a/UcynEf
 /CjUlIT6qQii+HgS64DqrgJZpgtplKuMihe5MqTabEykLIIoKR4sv21lEXz3/J0QxjG41S9OyRG
 FIXwj4yp3PW2cDHRaoQXUz0PXhnUFDgI8++vmIHhnXXeJnoQxBkbKR/spbLFSR3E1CbglNoYhD9
 zWu+DAhMb8Vq3YTUrIUnt5xshJRJ7Uaaq2c9AAQlB5Oc+xYjuFTKbLzddJIY1e6a4uLgXFO46D8
 ciidR+opM4fNLGLTP7SYDJ8wdzKgue+Avr+/1BG/65BKf+0DqjIkjVmlJelE+KbGKx3PS1QZ8zx
 AEY7s7alBRC/s1jNxcsymAaMypYEtc1D0QZlwxyfQ4D1UsOnE5P4Etkd9UuEOA=
X-JNJ: AAAAAAABjUaa9L+kY7pYfFbVN7xQYsl3IjXuxeFwjMkc3WPRe0kAQH63tOJCnhWcdHpIru
 wtTeCi0ID1KsDWiNrD708yOI7qVQ1hI6xTSa/kG7PQswH+Kof/qBGsuvQu13LRdA54fAig
 Ymjygwg3FipRVbrr4RQSHMaOupt4+hLUAvHVLa0fGDfm2xlwxQOtetLqH0XiX7ayq3G3Jb
 +3WbMX1mSx+bmY2somDFUwB66kcimpbeBlPqBubBhMatIw02SGIaRVdCI5+AY90wdZ+C+V
 5Wvi9l2mcdu3gMDuAIO+uBp68CwnoTqUSJ0hH5/Hsy5xnOJqOUK7Mw9MiwEg4/x0n/uQos
 98T9nBgAFR4J5aBOWAaSA+j1eQjdewOBbFt9CkJGdTsnzIr3MyzTjlC5cVtGs+NEqxKyaK
 0xS0Pr9FBvj/uGsWUJQkaH3Iwzqi6y81tsroKzKfU/0AHTgf0VAto8mzE/mKOLuZOARP6D
 qGj/506keoxlz9+ZQu4pwPsOsi/C0W05xweOj3Tj6yY7/fvq0dkXE40/odPKK8NaQweQYb
 VSl0g6HJkqKVqsFygt+5EmYCutp5Z4eN4RnYm45XcWY8NJqMt//+ICE5NQHKhDQG5wz9+m
 XZLE9jAq/nqjOnRB50wfnZGCYY2sBO0UTrDulNiMin0AFEmVGzQ9xVTnhQvEutSXN3gg7N
 XQUSYPALYcQvsEcmeBk83Wp6GXEzNEX0q7bhuG/UoByXGU0jj8Ygof3kjdg0Ne/M6Pc0Ng
 u0/yxkq36/M84+qBOyutHKqe2wDnBgfl3MI+WDebrxHM+cV72v+k+qkoU5Nu00aughCK3i
 O46xfoQJwkitOL9r6NiuR/MGYtFeXMEFrdBOhuEeXRhdDFViH5Y=

On a Microsoft Surface Pro X SQ1 (sc8180x, "cambria"), with this patch on
top of uwu-next, the SLPI boots with the machine's own qcslpi8180.mbn and
stays up: it came up in 44 of 44 boots where the firmware was reachable,
with no crashes. I haven't exercised any sensor clients on it yet.

Tested-by: Tawheed Makhdoomi <_@tawheed.cc> # Surface Pro X SQ1 (cambria)
