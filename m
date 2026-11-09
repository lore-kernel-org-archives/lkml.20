Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794216433;
	b=d6ZUWg52H3VBIjayBD6b0hZsogATZ9LvmJyUuUbm2SY8jj83MstJVwkou4DczaYlqOrR
	 yTG4X4ed2vE2nQ4w2vXzrCuHeDJuqfO5+K04Vz/0882TDIYUikfuQW5Vsio/1uvXFgL0c
	 Cnc4sdVFoccc9jXEOeXRC08wmm1N4Sj57Qkodz85NJs6HSjoh7F1dy2B54sExhDkGV3xg
	 5G5CYpg5UY/45QlCEpRViTCiyIH6ASDG5gzh+L9nNriS0w12teI2XXK91F8PJqObCTmYT
	 wsqqpm9yTyc9c4Qujd8nIivc9Ba6IfEGTuQqhCoX61m7Yz2Q65Zc0K03NddBNnbkGxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794216433;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=LK8qfR/Aun2uVmWWdIXIFGgyjuzjhTdjWseA7YNgrGE=;
	b=J/eiyajFIz/ROQd4aIi4wzU81SE7HpIaD+KQuq+CpjXy9BrEruMEgEGlnsnpwvV2n3lG
	 sW6fPONbT5ZcyOf2dR2mg9mnH/M2q4XQjfQjddPw85fWDTAnE84FyPysedubOU4iZyEvI
	 DXJ4s0Q/G5kyP3Gfezrw+XogG729qMDXSGW3ophbvb87CeGnlZNgbUWXGBDxONhfSQei1
	 DeeEk+cj362SqIiGzL3IvGTKko2fEIN2FmS4kG5cFiO/vDqL+OlAys7t0TGugqvg3dtmq
	 q3uy4Ls8O6edwFys/npFH1m8Zg9mgX4d91aGIiQ8f1mnvOxHj7wcKgCaWtHQOpO49CA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Nkx2J2Ev;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=C1v0Stkf;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7317D606A335
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 09:27:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7317D606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Nkx2J2Ev;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=C1v0Stkf
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A969wAD3611029
	for <linux-kernel@vger.kernel.org>; Mon, 9 Nov 2026 09:27:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LK8qfR/Aun2uVmWWdIXIFGgyjuzjhTdjWseA7YNgrGE=; b=Nkx2J2EvWO8oc993
	Du5PQOzaqWqiptZ9EJJD7gqQBEvGbvYneXJOy7W04wfoE0cl3b4nqa3QKC9kFxQC
	bOjm9HwryMCsczYLep+kZSc0OFwPuJP23XZfWHqnM5zudstvO/aPUr08mpSuaumw
	ns82GYZ4Cvcaz1AhVbmepOMcWM/BgFY5KYbE2TJNt/VmtwEBSRE07ELG8Xfnas68
	g/f6v2CNsEqbC2Ln+mtNNZNUzJY7CqrUrUJxut/qskfUdIJb3bncVt1cyIQzfVWi
	30yUdJf5zuZVNMqrIxutX++HjoCJpGC4QbmX+VgFTohQ/I7xtiTLLMxlaCYM7Rzh
	fE6BHw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hssbnx2sv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 09:27:12 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-94776ee7bf0so103999485a.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 01:27:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794216431; x=1794821231; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LK8qfR/Aun2uVmWWdIXIFGgyjuzjhTdjWseA7YNgrGE=;
        b=C1v0StkfBz/DLErhqGZ9gx8BsETB+rHi/98lWNRy3mjhVYnl5vXA7W24m7tyQrB9s0
         8fM8HzW+uKaF7MnthvPOTCQH3kKeXZFv3llsEH+iv4CLMDfzKEbBJItAWsGhsshX6d9i
         hBCTJqi7O9DhWzi6ltEF2T33TuHJpimBFcSaDCvO+mWhn2qI0K3XKHRNLw4QGNPk0dU7
         olK9Zg31Fie9Fm/D/1UBkaYlazQOm/SKx0McXboEmMlkJBePHnymTb1tMyIU8hG5wMMB
         5fWRYH7dNKWCmcWV37W8od3CRcpGADOjaj+IExImgZbyNRdCTyWVQuK2RdMfqJ3t+Ao+
         CU/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794216431; x=1794821231;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LK8qfR/Aun2uVmWWdIXIFGgyjuzjhTdjWseA7YNgrGE=;
        b=A3SbEW07JtW8MGvy/avwv0pVDFOcJU7WMU83GrnQoHKiD1f28sj691jdjed0MUNgL/
         /U0AM5wnRLsADRdrxPcWC01RT82AmTJuMlogt3Rj2GSuANxvbYVzB0eCx6QWDT9mcBCS
         8OE9wNJyu9i5z28oVICfeG7QzmQPxs9qw9S54pydcgFVOtvTh5FcUMeLZBbFZ/2COqxA
         s8gZ4O7T3RcOrsQzObHQjQCp3Y/ES2eRFtADeBaq0A0wAV0mQpdUaaT2BtVQymCgvjNm
         QmpXzCI+3loOb6RxpB5MtfjO9dyFMBTtZxBFW2zmoEcyvEmI545JZRIuNmJisB9wfR/p
         mOsQ==
X-Forwarded-Encrypted: i=1; AL+hErFyVwWJFVQjz1XTrqnIOO/x1Pk87kvqi2N3TJfhuJ4lU90JN/RA5lLrSavF9odxx2Ko4qMdT0E9vhMwPNQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+lOUb0gnGH+eUsYJhJam4JGZEG9BTG84doExd0cSdoskXt6tqv
	+Lwfhq9mn9E50fu6NkwUt9jJbOsGDpCzFeUO4zcCBQOoIk7O28bvJT6n+hUWjDvcFVxW7QXPyiO
	5veMIBNALGk8OXLZVz9rlYjVGJGnwDJOvxS3aEZDV8qkS7eqGFx4tlgn2D1hmzsw5FwM=
X-Gm-Gg: AYBFou1bG5qqEvUajyr3gvXHujqE2wtS5mvbgySYjsduEzieLsWr7y2weObIyTu1oOJ
	WN3HYjKZtaxqeps0VilToDqXoda+cW9JG5UX1RTh6rK+xVhm11KOc09cZVTuiB3O0rz5jxfwBFZ
	OGIMLLHHrCRxBMFI7zPXoQWL1iSOhVs23SNHZOvxTr4EnKoNh2Qyp9N7F+wiGsaAVBcMQU3TQYP
	u7sexCmLwRn9vhjdrDtCisLYR4hWqyPvX0KBeyorqYLyzVfyjtsSbaWTjg/yaR2P3zqykwirxOH
	Nr6pTNeVl2Wn95i9yLQwneN5QgVEdxd4M6vmQADT5DWwQiosRmWfeWklw8ZWEpG6wZRuhR2C91c
	CYYqlq/8kwTRt2NKmd0NZyyDwQbTe4pamtp4XWRtFMwWbpZ/A9wbNPoDCIh9OOfS91BLH3mKBGX
	jY2iIfwbZa4OxM4nuKm+YOnzrGMa6p5Q8/U433a+FXDWdoFpAKMe8F6EahdF2Snw==
X-Received: by 2002:a05:620a:628b:b0:93f:3565:813 with SMTP id af79cd13be357-94784248893mr446921885a.9.1794216431335;
        Mon, 09 Nov 2026 01:27:11 -0800 (PST)
X-Received: by 2002:a05:620a:628b:b0:93f:3565:813 with SMTP id af79cd13be357-94784248893mr446920185a.9.1794216430881;
        Mon, 09 Nov 2026 01:27:10 -0800 (PST)
Received: from brgl-qcom.home (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b90f1117fasm143977425e9.13.2026.11.09.01.27.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 01:27:10 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Brian Masney <bmasney@redhat.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] gpio: convert to subsys_platform_driver() and subsys_platform_driver_probe()
Date: Mon,  9 Nov 2026 10:27:08 +0100
Message-ID: <179421642642.23273.316224743809455221.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261106-gpio-subsys-v1-0-0785e37520ee@redhat.com>
References: <20261106-gpio-subsys-v1-0-0785e37520ee@redhat.com>
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
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: X4Lch255NZ4nqazG1hgtBNOuLWrhs3Bw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAzNyBTYWx0ZWRfX9z7RX8GTv2Lz
 q8PjVQ2tbGzQ2QqO0D8EHiT+VKLAGbWMhFeP3CaqCffcjzi72hSXvKgX5IsfabdoxCshEAsNZLx
 BcyHiiPkMWnvdQwO6iphmSoW2KqgNErubd0UksGUVd3EWsFgFunlV10chUtzUCAexVdMFYwq+Nf
 qBZ7eQOQU3scbWD5Uu4oPcAIJ9xuTU7t0+D3bs2B2662SuOsveCp/9MeT4M9kIW+dk2JXYLwbDj
 QUQCqPh7Wbq6uPys54/D6CLXSDsHL6L/rO9BLAKfmnQ65aBdu71WsNoN4zZ19uKjRcnvzY0mMxa
 RMH577Ig6grnEkn36oEUsG1ndAr1972++QAJ8+pnHxJdW4ylVVWUKUPB69PXO6Lr0DrG2fGasx3
 b72xjYSA2kL6QYQal0PAO8JG39fdVw9ov5h/NIZ23Q10hqrfR9sSQzPu/vKY5i5R+J8DcoPKWTS
 gtwU+4r3lLmFqLVZRgg==
X-Proofpoint-ORIG-GUID: X4Lch255NZ4nqazG1hgtBNOuLWrhs3Bw
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAzNyBTYWx0ZWRfXwWRBMD1fzdtC
 fvj44xSU81xBczVGhkEJtiyIRmc/wktxKX6TQxeKjeNdPtSebcEimLZDtugbEUMVNNYxsguCqo8
 0UWS3rFF+rYr4PNkmaOh0s3/diqc2G4=
X-Authority-Analysis: v=2.4 cv=JtBkP84C c=1 sm=1 tr=0 ts=6af191f0 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=rSSKzaeXPotlMy-fnVEA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090037


On Fri, 06 Nov 2026 19:08:43 -0500, Brian Masney wrote:
> Reduce boilerplate code in these drivers and convert them over to use
> the macros subsys_platform_driver() and subsys_platform_driver_probe().
> 
> 

Applied, thanks!

[1/2] gpio: htc-egpio: convert to subsys_platform_driver_probe()
      https://git.kernel.org/brgl/c/fe4afc147b43d578411fda8c360b0505b5b41f6c
[2/2] gpio: tps6586x: convert to subsys_platform_driver()
      https://git.kernel.org/brgl/c/4fc2c9ab68f4324bea62cb5a43e93392225f1d11

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
