Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=57.103.77.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792449626;
	b=ePKrYI9laoU9WHEYItbOXETcNpUJ/RluCJGHTlh0kcbYMtXsQQ3ZbLXxHcNcFg7P0XUO
	 p3jJPuH9Q87u9oPFgBZcFUhmORl5QFqOwOxWDAqhx9zwfcmivyCNp8BCeCUg75W/EQJ01
	 udQ+U/zYonNIogqYoe9884qUMha2AVgLfmOhWSxyyqLkts9+VwJztRUq53cSgxBTCNP2p
	 fzczHhxjmWcEu/ZXd5xqGoR+LYjQdze99cni28WcPDjlYdLOb0ldnVHRTdamC9rGmv5cX
	 ArG2rarTziDyHt8Dr96r4WRV3+f+qrr5vONJR9RiaG8yy2fYOCyx5h8pszAh92AYNLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792449626;
	h=DMARC-Filter:Received:X-ICL-RepId:X-ICL-Out-Info:Dkim-Signature:
	 mail-alias-created-date:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Info-Out:X-JNJ;
	bh=5pXi2sRbBAYWTBRjuYPyBroCk7obWCltBrEvYib5BRk=;
	b=U1Y17cK+38HAitxpOlOTpyHHEr/lBVbERLg1mYyuJ5q95qTJdIHBazgmG8aaz49GDWsq
	 CV+NeYKl4FCPTOi/NK2VTK+L/4Ah2fCke/u5mAS2NJxzbZ8/HLbgpwFRg2AKQlqWj/K6i
	 PhuxwqwyCt9lW+cQ+bKKsTQ8pRud5RQ2v/K2AdvgkTVd/1kBhINi/BrZhkV8WLWzOq+wN
	 zfrFTnpMRk3bIBi7KcPyZibhV/9VVcoR/MXWl407J+TFVB4gEImxt+Rpnp+296DyraTSK
	 I/lRYjLQgGyN4NpMmWPLkkVMxNQXjmHVqpRVYhO2QAQuaMdNidLD9uSpKZvypjIkI1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dxdmail.cc;
	spf=pass smtp.mailfrom=dxdmail.cc;
	dkim=pass header.d=dxdmail.cc header.i=@dxdmail.cc header.a=rsa-sha256 header.s=sig1 header.b=A2bsX6P2;
	arc=none smtp.remote-ip=57.103.77.151
Received: from outbound.st.icloud.com (st-2003j-snip4-11.eps.apple.com [57.103.77.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87C3A606A320
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 22:40:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87C3A606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dxdmail.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dxdmail.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dxdmail.cc header.i=@dxdmail.cc header.a=rsa-sha256 header.s=sig1 header.b=A2bsX6P2
Received: from outbound.st.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-east-1a-10-percent-2 (Postfix) with ESMTPS id 255101800225;
	Mon, 19 Oct 2026 22:40:19 +0000 (UTC)
X-ICL-RepId: 01a15652-a4c6-70b0-87a4-149b74a34b96
X-ICL-Out-Info: HUtFAUMEWwJACUgATUQeDx5WFlZNRAJCTQFBHV8DXhxCDFYCXA5LVxQEFlIOXx9yFEEcXgxeBxwTWlhVCQoPShRUGVoBGQhRUEsbDlwHS1oVVRcOAkIfUB9MFldDRB8cGVoUXBhTRVEfVFhDGUVWaUELTx1dGVscQmRYVwkKD0oUVBlaARkIUVBUEVdQC1gAEwkaCgxTRlYVAUoeWVRSAV1YQAZdGl0LFV1KC1gHDVdBDThXFVMGUxlVVlAOCUtGCUkdDg5CGEYfVCdXAloKWx4=
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dxdmail.cc; s=sig1; t=1792449619; x=1823985619; bh=5pXi2sRbBAYWTBRjuYPyBroCk7obWCltBrEvYib5BRk=; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:x-icloud-hme; b=A2bsX6P2qGZprOMYcbvhsvzGsplPUW+3aU4Tn0qVLvzYxPug0XGJEnU7rSnxiIYvoqoYVmgj3s2xyNku4UQdHiG8++WDQFc8Z15u9Og2MmLo94vqsiwhSyGN+q2HTFXwjbb4rAGTeL0mmnGTknwMA6FaoWgC/RgpgEN8d1POUOIVzTsp0NJg7FMlV7kVe5p2+lvbdOOsyxNc/my8n3OCTxf9Y6ZOem8XWjVb7PQQsyfmecIO77RzwKw3+hyZFrVwuvZk+/3M6uqU3o58VvyEX5AxevQXwix/jFt7wW4lkSLK6H4T4KnTCcGD0J7wd6D6PUSVRD5QKI7BfYW4G4tsxQ==
mail-alias-created-date: 1790174225171
Received: from [192.168.178.181] (unknown [17.156.216.30])
	by p00-icloudmta-asmtp-us-east-1a-10-percent-2 (Postfix) with ESMTPSA id B89D118002C5;
	Mon, 19 Oct 2026 22:40:17 +0000 (UTC)
Message-ID: <32c0b9ad-de82-4c93-a850-69ed2850fe14@dxdmail.cc>
Date: Tue, 20 Oct 2026 00:40:16 +0200
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
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: sm8550: Add support for Samsung
 Galaxy Tab S9 Wi-Fi
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261005-gts9wifi-dts-v2-0-c3ac9b0f9ceb@dxdmail.cc>
 <20261005-gts9wifi-dts-v2-2-c3ac9b0f9ceb@dxdmail.cc>
 <2e3c1082-e5d0-4a33-ad3f-272dd74aa54c@oss.qualcomm.com>
 <f7ba4d5a-0e8c-417d-a1fd-5b5e392df71a@dxdmail.cc>
 <c2f7946b-ba31-4f0c-bd84-fae3481f2965@oss.qualcomm.com>
Content-Language: en-US
From: Nizat Mikayilli <nacht@dxdmail.cc>
In-Reply-To: <c2f7946b-ba31-4f0c-bd84-fae3481f2965@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: c433lpCkJP9JY9MpEN8w9GiDRvhbCqs8
X-Proofpoint-ORIG-GUID: c433lpCkJP9JY9MpEN8w9GiDRvhbCqs8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA5MCBTYWx0ZWRfXw67x1x/vluXu
 V6Kl9rbK7CgE86LZRygxd5JLO0P6X4A9ZAfEyTak4eYW9+tC5lj9QBqiHD79naENQ7BJUE0euQx
 QyEHaukKmdjY0prEf81PxLXXU7Y6DerH6CoNFf+h/RKNEl6mNZPGz3GmcCrZdX6D8i9kAabVd1n
 fg4Inns3Pi0uVM4M4gtkBjrPU/IfedS4iE6cmKSm8UKkKt1uWGQ7QJhJQoUfOSInFlvY9E0VFmN
 gpz7d3ECevMY5v0nMaaTWwFjLbzRL0dRsNslaV3gGj4Eqb4oHJHZZGfEI7Tf2BAYHV7k2QlmABQ
 zAlgGZxbYJPeI7nHtKz2167tP7jf13USIjrv0W9+VoCOzdbg4nxh1VoSNR11nk=
X-Authority-Info-Out: v=2.4 cv=JsD8bc4C c=1 sm=1 tr=0 ts=6ad69c53
 cx=c_apl:c_pps:t_out a=oyWFxbOnq+dmhQrAPgaJYA==:117
 a=oyWFxbOnq+dmhQrAPgaJYA==:17 a=AqZmfHzJsoaMp3Ki:21 a=IkcTkHD0fZMA:10
 a=MKtGQD3n3ToA:10 a=1oJP67jkp3AA:10 a=660iZSQnnn4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=zqu-M_Q2-P-lgxK51TQA:9 a=QEXdDO2ut3YA:10
X-JNJ: AAAAAAAB3R+zTMouZRuYT7BGL4P5l0RU9uHWYW1Czf9nUwDJh5Iat1X1gGPa9O4QMI4JXm8tkaKucDxGg5hm84biPdl4Py64JLh0S6j2KWcAUdyNRjP/fC9tk2h7+CARrEXVbP3Q+X1SGZhldhQD1y9weSkDXWbOMT27j0cG8y1R6LOnzRnVjC7mDpwYdYXHBW4l+Y2/3f4VMEWsTmPWNUZVrUPIF/Qjc2xdVL/Lp4c7k7aBBNw0QrQf1fdhffJ+BccxZ7eGOj8N1MouRmN0Fhzf8k9cAOzAcm4YcHy82X8gPYi7tlELIcsNxmQ54cZQF3LGwhhN/2+xLbn4lmAYvUPzgTnby1yLkzJLyJD1D0QkhEwytSRzlmTnYhZD8xhiP/dMn+AfxcdhlycYg5JGAtOWnXanZKzuzVTCgDhdjZZJjwu2TM9Qk+cVvdo8ryitysUNDRzh4n0PR1ZDMFVu6OCdW0ukpjx7EEnqAvzLkj2b1m7+yxTTpahfcm5Q91EPUyxI3q1u7SqjnbmGRFz4mLPOvqmkepHVS/9R/owHoOKawy0Hger5gDTlVOU0tYyKQoisYftT78NoNGxfejvSHxMRCkTjwcinAItvmYahmM56Le7cruMJ5GFckdg+bdpc/6k8xUK6pVMseC70IR6lcpoNlipi9hZYEvA7kk4P0x5pnf57gzczP44W0P/7R4fMlbWNevacApkqA2tkHGPQdu1LFltmRuEjZKQVZC9b/Zw0H5Y9Oj9HDycMaPUC7QrbLjxEoK2OfEoJnoNnMxBZR2P0E/dKUAINv+cko/ayUFRsJV+cT93+X4qeP5ht6fU+Sok74fUoay/7fB3J9HIw86evu9x8mdYXAgMpqnwVx7RH3O43FQP+NVjoIjjGCgwSlLGDpL/ouaH2CZOdW4l/ibBVplyuE+SopZn24Cd41GsS186blYCqIAVHuW66p/1VDpiqjMBjWcpUhA5x+wKo3muuQgJ0TKi
 VnODqt82k1hG8V/Jh/OBA5jaczGtkkkIe8vy52FUV4iyU3BY1UvdHCxH89yOigJuMe/lpcnUG2dWUI88EmF01h300SbdQhemwJZuz8Mn3g/gqGhEgxWQtp0SIzxThPDdetZsdZ13OKnIcgu+5Zz1s38RpGfctGb8RqFDzM0Al/mbRN2usVm8L0VtS+OpNm2RLkpt9zqutZ98gb3Hn8fdRvM2EvGYoHU0o/Fdxm7BdBK32105/iej6yef/amRnQfT8aQTdLyvoVM0g3fdDjRI1Sh68hcU568NN7SH1cKpmmxKKBxz/1KrEQI/+tElBwOtas+m1zVyL6NRObFJ6sXW7wJL0wfUylIyMcUpAlIE+ZU4ELOEX/65E

On 10/19/26 2:33 PM, Konrad Dybcio wrote:
> Please show me what your current diff is, on other platforms we didn't
> have to go through these hoops..

You're right, my mistake. I had copied bias-pull-up for wlan-en from
the downstream DT, so the pin was already high before the rails came
up. My hack also drove it low at probe, and that's what actually fixed
it, not the PDC messages.

With bias-pull-down like on qrd it works without any driver changes,
so I'll add Wi-Fi/BT to the board DT in v3.

Nizat
