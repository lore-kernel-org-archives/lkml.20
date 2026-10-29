Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793314569;
	b=PkWkAttZ3YOeF//WWp7HCmWWLAWMipFzE3U1eR0VXycOXc2JqZj5sN3vJ6O+QVaM+NlU
	 XercN09fTvlMYJN2LPWJiaz3Hj9mMsJNLsjORdFRpwFdA3wfADZoIKIRYcq87QlD1N7k9
	 GFIlSeM9aSRvj3n1y4L/r9T+IyG51Ffbnu9n2GDx5IyBMV1J6oyHjDC7Kj5w3Gd1d91aI
	 N2j/DpSOZtbH/FLLBeNXyp7VjAwV4ZFm0oXIbx22RGdCcK6QpwW/uzQghtvh3LSbgKMl5
	 eXZOL/9qCUZwwBXRRxtR1Ffbq6+P/JJMLlsyPBN/lYqzPLQdkreeeM7DigV78ra1uqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793314569;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 In-Reply-To:References:Subject:Message-Id:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=XMQ4UMg22/RflarQ5xSdQ9z0hCdWnlJwzEMCsHMdtVI=;
	b=DwMq0AyWT8hfG4dbv6UD0lwHty6P252Jrjv1D/b/oR+zMomZweNrdzxLeMIXsWohhYaR
	 K4AbCqoOtknJTZZ8/sxX70yvWSDfsC7sbUk1yGRqCv2fGp0pMcu81lP1bw8jTBYfL/qA0
	 xn7mx643/E/qWEI2tvLmaxEp0S/c43dU8eajaaYQ8DJ3bQqzWo/iw7QVHQ3TT5G7Z3t7x
	 9U5tTs1PFtlCW/SgPUHrqErzf8Z1VNJ6MiqVef8ZNudUrOStsgFUvUE71FuBTCyPZQRRg
	 2bnaxUUibkT0wlxQoa9WAX9rTH5zbNZhkkxuXrfVOdJ2occYY1H+iAFIZ5Z+G57kXTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=m9byPvLY;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KZ80xiz+;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8901B606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 22:56:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8901B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=m9byPvLY;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KZ80xiz+
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TLZWEm1348780
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 22:56:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XMQ4UMg22/RflarQ5xSdQ9z0hCdWnlJwzEMCsHMdtVI=; b=m9byPvLY6pqVhV5O
	e+4RT/RyiYe77pl9POU4xpdMonnIkfOYMfY6+LdynlLzlAqvaGyWa568g6JqUr25
	6tmmlhou0i5FpkHTH2K4zTsOyeJ96DUjhBmEng3wkZ8XxG2IMzfTWjQ5fhMDWkHB
	qz/ILmBfnTYSNeRcniesWN4VB4SKO+ob85cBCO4vAqS0J0lWxZFblyMxHssoGEIs
	e+5+tfbDY3IFtjo1rv9DQ3bKe9MCfxHrtD/Do9Th+lRhxaFFMvY+T/L5B6ZFUQAD
	Pevv0W8tst8rPCGKzs2gBzur2PyfALeKeCTfYKttSzyqVwer8UIyKNK6xoddV2CN
	rFur0g==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qg81s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 22:56:07 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-35c5aef2a74so703862eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 15:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793314566; x=1793919366; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XMQ4UMg22/RflarQ5xSdQ9z0hCdWnlJwzEMCsHMdtVI=;
        b=KZ80xiz+NEpZSvJ+4hVUPBfqzfcbXnVAu9bIvG9ZRozm8nknCSJCqQl5UXsetjfXOq
         Ev5UiMukE4TnsVACt305K1h0JMS+DysVaol2DMqq89d1+9h65ntnAUCKWfa6FHn2d8/D
         00WSRlpExqf6JSAozD+7ITdpyYz0ACIoGz2khaCUzxdHshL2AeitZtMiS6bOpsaaXSHB
         DZcIH5GS03vGUouaXv1uXJMCPSrj/A/qzQtKWxfWTKGQbIk+p7xzTliTNhNScJqLhbXl
         bTqC6JP3TpnTBZuoGEeqUQ3X3NtxMJIm0b8WXoYOEnxxiOLJr+QdtQkaVGNy3soXXGTv
         WTog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793314566; x=1793919366;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XMQ4UMg22/RflarQ5xSdQ9z0hCdWnlJwzEMCsHMdtVI=;
        b=ySuC8PhdIl3GXI84bdyP2iwDwpG3ilrAUKMdgy+jtrnSry56iUM4FL2vWa8xadl+YZ
         h2qCxbzNip9Bxl2gPWZHyPsDbyxeulpMDRJpjGcSwAs+M4tq4p3IcHXav8h/sX/GAt83
         9oNP61nRFTcCrRK3czG79ATnFUb2h0tTSWvPbNabxTljWiplt3quDHtj6l0zorROLWm0
         Qj/eGlaAUp+CmmePoEsCv5M4YAi8d3hmP+aPhnijhPfy1Zg3kajxQnEQRHHLf6iz0gFK
         82XtqqitYxQXwfo3RAh2b/YAyVfq2IgIhTDypqWRe5RQOWehn3KVHmic6CgpwSZ937ut
         BeJA==
X-Forwarded-Encrypted: i=1; AKwUvBxTthViJmNhpxetoaKR2kbiqUtUo+95TFXxjmpl6ygUXEdzmUzJ6+38hN52JijxM/cYEthW9Eam3VT8AME=@vger.kernel.org
X-Gm-Message-State: AFq9FYLnaF0bPtbUqREQRMC/45ySwn9DzvFYrrY11cTavhptdfp2bbuc
	oHEWrjSQIjPxBJZ74AyAzMXMJtwH8f5N/19SzSeBaCLsBLapi9sa4jDvOeGuheW+F/AMsoPFcO0
	8kmamBlgdywUjCsAgCTrhrbuOk1fcHUmxzbmQfTGHKovMuI7J3kTgRoUDJ39EMjl14yM=
X-Gm-Gg: AYBFou196jUW9fubV2HqH9QCmtex7MHZMFxpkD3mQ7TheBFV/Lep9ghll+RVGGpBQAW
	gmAD/GqDj5B2+qkuk0AP/Xx4Lzi+tI2cD9r3/n51v0qSxHfbpB1tPObOxEmnhhBiRwwpUno24Lm
	Whvrs+R6G1uIVr+8i/bAevrkwoNh9LdXjYs0CUajKRJOMUiL+b2razZHHdeVI/gk8jiK/MLmpr4
	VlssCdsHXxTLz7v9M1s35clWlGfwH2Nnyq2m16rBF7SsLXpqDUHGt3ZpHOy/y+oC0/6ngsnMpAr
	8+jnpL9FfZqlVeuIit6KIjtZY4Dbe9dErFqXynbvQ7jUK9xfjCw0FB8Y4lrQRBnedbRbmqpP7u4
	WBg8+5QqPC1iORVW92eFdwZ/PCjk4KaHLFITSFDJMbk4H2iCP9vln1RlMRCZQDAdKt8oG601V/G
	OLYERbT238YMwS/FfhQhqvdLTP7HCs
X-Received: by 2002:a05:693c:639b:20b0:369:f2f4:b227 with SMTP id 5a478bee46e88-36a4238e9e4mr1139187eec.18.1793314566159;
        Thu, 29 Oct 2026 15:56:06 -0700 (PDT)
X-Received: by 2002:a05:693c:639b:20b0:369:f2f4:b227 with SMTP id 5a478bee46e88-36a4238e9e4mr1139154eec.18.1793314565493;
        Thu, 29 Oct 2026 15:56:05 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428af91bsm1644278eec.8.2026.10.29.15.56.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 15:56:04 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>, Filippo Falezza <effeffe99@gmail.com>
Cc: Kalle Valo <kvalo@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20261027-ath10k-temperature-v2-1-0793e80d73bc@gmail.com>
References: <20261027-ath10k-temperature-v2-1-0793e80d73bc@gmail.com>
Subject: Re: [PATCH v2] wifi: ath10k: Stop unanswered temperature reads
Message-Id: <179331456469.1083805.7983060076518551936.b4-ty@b4>
Date: Thu, 29 Oct 2026 15:56:04 -0700
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Proofpoint-ORIG-GUID: QOFmxBTmnz6e829nd-O8wAZ0gmVt5mH0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA5MCBTYWx0ZWRfX9JbOarHz0qTS
 EClkxW1eawOMzRGAMtC1d3M3Lr3pmpCUR++Ukcld+TmgDG8IPXzgYpZ3go7Zxfzkep8j5s6K6Cg
 MbcfNOfmvVEBWJOs8IwlQudiJ8/h8DU=
X-Authority-Analysis: v=2.4 cv=DfSCOftW c=1 sm=1 tr=0 ts=6ae3cf07 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=DdSAyOQbr8Fa4xelbuYA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: QOFmxBTmnz6e829nd-O8wAZ0gmVt5mH0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA5MCBTYWx0ZWRfXzO5vRgoQ2fIE
 wJX9SJU91kMowHMDAQP5ahQ2CEGGLOBRH6q4XxIFYinmXWu5pKKNyeQawURiV1PBgR9DFdbLGxo
 gJVsUW4TX+WAjN5x/vYem9d/lNUDP3KL3rpwCkpY4pYoQ5DifU6tEjWsa3dDSNGfrxApYOb6tSF
 DWzF8DSvrtqaxzhfh1rKbzDbkMvTcouZYY+zcZ4otpOoGOzPi7eofBHP59JxCN3Mwkn9NDELjnR
 b2qU78D+bmCVMbtTVkZSSYbbjZEI1nbhyeaeeowtIO3UBHzum3DY5YaxeccP8hWcm5ZOjMyplID
 berGkJ+nT8/IACiOL385HdNt1aDoibgHVFK3Mn+k4K8RYtfkGHsY70xghwS0Qhfbf7wNscZTZq8
 Ivsf1PJuaPNaomJGcpUmFT94ZKThkN3zKlJJ/dzQEeIyBE2UFX7/Flfn211rTp/RLZoI/brJ+5a
 QFIQjEu3cPXZ1kVWnVQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 adultscore=0 priorityscore=1501 spamscore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290090


On Tue, 27 Oct 2026 01:56:20 +0000, Filippo Falezza wrote:
> Reading the ath10k hwmon temperature sends WMI_PDEV_GET_TEMPERATURE and
> waits up to 5 s (ATH10K_THERMAL_SYNC_TIMEOUT_HZ) for the reply event,
> holding conf_mutex. Not all firmware answers: the WCN3990 firmware
> WLAN.HL.3.3.1-00694-QCAHLSWMTPLZ-1 on a Motorola Moto G 5G Plus
> codename nairo (SM7250) never sends the event, so every read of
> temp1_input stalls for 5 s, logs
> 
> [...]

Applied, thanks!

[1/1] wifi: ath10k: Stop unanswered temperature reads
      commit: 2a87e367c62856b87a90f745c6b7d2eb91e0c51f

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>

