Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792873509;
	b=PEUDKv7PVG7mU3+9NlzTYpjuyax7hQZ3tvDkVnRhSnZYREARcSzIbkLW6rpar5zsjRp2
	 Alx0OFd8532aAo1kLegHibeOkYyb3FebsnA/465vjxkOUgRgbhfZiJ0J654iNyXJHW+WE
	 5BGvT25VoiBT0Q0YEpxoey9Ume4bo73NEEyG3GrSxi8DbM2MQOaUQe3QrGcKq4ajTf2Cx
	 smAkidEx/MOqL5n1Z3MEkJ3NmldAihyyv9IkpyOlzcSdlbN7hiuo33VupTlG9wRgXNO9p
	 0aazITT/4D/21jzlTT5OTpfxi7w4yzCM7PEG0tkKxW3xGoXPbhtLWxR4PS2FgW/rGbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792873509;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=fvgN99J0Yong6xuWrkleinpqfRDCxfSse99001Aj3X4=;
	b=cs+ZDGSI2rcHK0dtWDzixxSrRfOJlcO5u8/U3cCpWzBUgif6cpwwZf8RXmWuBtSTbtMW
	 k0Er3HoIHWgd+nxpxs9mzII9JxjdkItXUf/RcciccPiabFg3KDM5JOkBEy794LwD3nbja
	 6IhDwxSjW9YYIUmJG1tdU/g3+46m3+k66+iQH7/GmCKeyKTALcNvWA8zRwpPpApT+4D/e
	 LgRoXhxldx0nRpO8AHh0bBzapCCzpqckJZWiDW0AHTkCPQ/Dywau+2QOKJ8BKmnXNu1aQ
	 ap3POu4SOVwKYS5zakw8tKNOHanv/I9paHlxaiIbwgUCQ858iZCQJEE7bD5b0DYuV9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ODDHW1CF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gS457mYI;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B415606A31E
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 20:25:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B415606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ODDHW1CF;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gS457mYI
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69OITt3c1261049
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 20:25:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fvgN99J0Yong6xuWrkleinpq
	fRDCxfSse99001Aj3X4=; b=ODDHW1CFlJuMQQ3T8avwNsPwCAtKVwoK0Y06DwmX
	aK4+d/g1DecejGeTJDL9UbzyumMpgrUw9rIhv0ldELoSBTz2P8jeOyx+FTBY/1+s
	ifA91KBzkJbeEAEaqWnk1b2ad59VOkK0ScgDKuI7Xv7tuoEOrEfix+xklow7LyNv
	F+bo717v+uZwbJolfk2mbxMSqBsVECH43hq5KVzpnWMfjSKMxtSUunLdLq2cfQpy
	1fjMx3ZTAMAxhGBAkmDmq91RQwEf20Nbwi8uZo0l1AzANQhdpdk6GSFaq8iKR5Zg
	xjVyyU+tSuCs9gauOA5HjXSiLohMpAL24KsyH3TonboKoQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgn27sq4p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 20:25:08 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-917a109c937so28905436d6.2
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 13:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792873508; x=1793478308; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fvgN99J0Yong6xuWrkleinpqfRDCxfSse99001Aj3X4=;
        b=gS457mYIXmwZ5pzyBIuTySIceGdky1VANbGF/Y2wG9SyGr8ppO9hduDK1qJw2N0+Xq
         VgYGoR59uHnKqWbUlUzxmZTZIs0lU+zAA0qWA0ThassPSOaeklRrOHC/15ZGos2a9c9+
         kbwlRnokfcER/JHZFfUfEDFajVe4Hz1CgbVFJrquV1ywnOIDXgMk4NAnoLeQyiLeF6oT
         Dbxsr8ohm8uyEu7UZr5oPvAyXW3Ab8jgoVdaycR5Qnvmhyid2E78jFkMDFeNVoZZC8dn
         PTJ2cPHO1KapifBS56g4Qxst2lwOnGsKXZC/4WwFC138mf+I9TqNGl2d8a/+esQ19DPk
         Madg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792873508; x=1793478308;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fvgN99J0Yong6xuWrkleinpqfRDCxfSse99001Aj3X4=;
        b=TaDnVVS2TuckWSdOSVYC2YBE6lKYcMkW8mAMnjlt+0zNPBbepQLDTW23WKcN9mXyf5
         jh8kwKFAe1NRhUqQjKGeMJLcvJeN74Gf79kow7LZtYOGdR4AKQ8pFJEPXujnr9GbL2fu
         ZMD6coKsEYs3SQt3cC7Bfr/F4x0xNim896LDighyG4GcQmm7q4E4D+oq6Ea7QDTxGjcf
         OfOmUB4owEWyqZ1OUIk+eVIQ3xA4xvfOTFvnyLqER0sNl8t8ccTFdWXYBs5hva47AqP+
         a7fJ+3kM9eEXiuQK8tQOgGhFjOENgAsI+EUmU58IjfBW6/KVUji537l+F8T9SHM1CmuQ
         Xb+w==
X-Forwarded-Encrypted: i=1; AKwUvBzbZAB4Vjy0kXdg2TbChnPy/7wyWOueM1fkjQUpMaeGKjAPUQYdz8j9jsZG1rKIP9SDJXNpIttrXfJOP70=@vger.kernel.org
X-Gm-Message-State: AFq9FYJuQRE68wjXoVm4GDfs9B8zY0zoYjtBLxrGYPkUd6Zm+4ZblE6q
	t/rw/0+mJqKm3+XjEZRNycuexFfqDuVF8cvDQAZ3WHHSPmJnfo1Mukgczq03Piii8H/ZfQGSb/y
	tMxNH4B8KUnZLFPfubgJ4OFp9nDI04J99ko3eFkneTAS8fknN+DLkjNsUz6KSPBHH4jA=
X-Gm-Gg: AYBFou0AN48nljsIS98Z3xrKqjja0AA2WtlGwf7N0md6PYwHLuVswaT8FlQm9k3PIJY
	s5qDwaRTk0BavuwarbR9bxon6cRxc5FZT8EeFol5gp96IQbEzso2992oQhPMiWRG3jv03upXcUf
	vAXMbr1xkPC1dLw1VKfQ4APpouaAfSgAfF5NG6XPkICS7t28tlXseFdtOQ4coOBNydF5Qi62Ljn
	jdI4X2YYjFW6Gg4FOoepUDSpOeVyPn/F2pI5g7KVgerJsDVEzH/nVBfts7kuIMrTjWOaixzztRc
	quY6f9MXM1W/VginTJ04H07ZaMH0UbnVNjrkJyh4yeSWAwmBULvAiy+GO+i+yt1OwjSnyFp+aOI
	7rGWeUh7ZnWpmS9so
X-Received: by 2002:a05:620a:700c:b0:940:cdec:c867 with SMTP id af79cd13be357-940ef9bf00emr379195685a.70.1792873507382;
        Sat, 24 Oct 2026 13:25:07 -0700 (PDT)
X-Received: by 2002:a05:620a:700c:b0:940:cdec:c867 with SMTP id af79cd13be357-940ef9bf00emr379193885a.70.1792873506753;
        Sat, 24 Oct 2026 13:25:06 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a359f59750sm52347475e9.0.2026.10.24.13.25.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 13:25:06 -0700 (PDT)
Date: Sat, 24 Oct 2026 23:25:04 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] arm64: dts: qcom: sm8550-hdk: add DisplayPort audio
 playback support
Message-ID: <e67ppax7mdncrk7jlty2s3yrih3sqwom6k2rkpfg5pmeudwinm@o2x4i4besp7v>
References: <20261022-topic-sm8x50-upstream-dp-altmode-playback-v1-0-8a189c71938c@linaro.org>
 <20261022-topic-sm8x50-upstream-dp-altmode-playback-v1-2-8a189c71938c@linaro.org>
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
In-Reply-To: <20261022-topic-sm8x50-upstream-dp-altmode-playback-v1-2-8a189c71938c@linaro.org>
X-Authority-Analysis: v=2.4 cv=G7GJgNk5 c=1 sm=1 tr=0 ts=6add1424 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=lwKPvcPLtPgdvEeQYCQA:9 a=CjuIK1q_8ugA:10
 a=3Q3lADbaBCgA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: uuFcidKObBrldXUALFpRCR2MSy2mckmw
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI0MDA4MSBTYWx0ZWRfX0z1k3C0bFA5O
 3XqGJmAXbRUwTuCkj7XdKqCRWPSR+m2VHNOv0XhiB2JHrE/oGwsh79xm/e1THaZbNtzCAdnK+tW
 qz6WbYqSyN9hkg1Ra2/YbNxPbiCPNvI=
X-Proofpoint-GUID: uuFcidKObBrldXUALFpRCR2MSy2mckmw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI0MDA4MSBTYWx0ZWRfX09NE0sZ6fsqE
 l/xBjagChCuqho1UjOVldJ8hMMP9/sxBjHBPg9MATfPoipvGWtGih1qkmoFuOdXMar6+jfOxmwq
 b+M4/9+JNQXC/Lrd61KavITpmxCG6XZZhCO0mNuTaYgYu+NtYjcmcGPJUBHrxD3k/Zjxmbg/cvr
 5wNg0/yfPlrBE4YpoG8K/ZrcTy9aMrgMGuxoE1GhYFxaXGKSrWVxjnD2JQpMl7S07ms8YGZPzgv
 3ZEVmbBUgFxDGri0lDjqhwt5Om/JjkDPYfBv8iHtHmwKzFUxUXjffpUaoIK34Czq/YmLcKq6v6m
 6qukizm5ooUCoGAdicKTzESrDpeQtQiAasEm3vCGmU4bmGqkXavNwmQR9WoUQD7HvhmFHHIPfXC
 8C6X/0aHloofZrYnPfzdQtLcSUXtbPAzV9bFRxMpCLJMxuMe34tsEO7Ush7auvHu+wkaxrcxjyI
 TYa1/a1jCx+E//NOZZw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-24_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 phishscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610240081

On 26-10-22 11:36:22, Neil Armstrong wrote:
> Add the DAI link needed to enable audio playback over the
> DisplayPort altmode output.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
