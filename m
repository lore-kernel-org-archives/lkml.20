Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792580610;
	b=5l7+J1e1htzaLurzOktSwjJESJ8FVonMVOS9PKd2/uYZfyJ2s2neKLJLuiNpuTtk6uNU
	 A9I25XV9eA+Qqa46TiFAE83ovQhbqFZGJm+uaVVbru73jWWIL5/Pxwuuq/kBnklndURRO
	 L7psRPiuYm0d0rBrZzud/5hWGmoUWQl5Jvko0JTMERpvj2sXYalcT4XFIUJnTWsPKyIma
	 uDMtJORZXGEQM0baNEeK4n41qjQntJg+PW13V2QLjuYFC3rwPn9xnuZroWknncqIlx1tQ
	 OBF2KXOfpx1oaVRxyzy/BN1Ow+0hNe2HkNZXhHgEusIcBXQ4wjFwJm5rIGocYCLPLAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792580610;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Uxja2CBhb1mW7NZElmgfeGuVVftU5XvBGnIy3eg6OFg=;
	b=ry/Po+paESIXe94D4AjyreyWq6vWNgcgk+PHD9lS0KH82RzMoaqcqX/rNMjyEmHHbMxl
	 F45R99E8T4e+bFwpDPNXxbwbLPQh1zu7xOscc2Bsecxxh6gbNaEv84RLukGj7EfOHSekZ
	 a0R7vGchsnTcQJxe5e+fKQYTi/dOsR6/QKmOrH2zOgacjs3mOJqGpmyLXeJ3soA1wZ2DZ
	 FciKo8zOdt/euUIMcPuItVk3k2AYaGnI/9U+iWAdh+X6Iu6Zj0LSTlu9qA+3rdOWMbpm+
	 5Z5OiR1+u/D3CrR84Zb24mCchwdEaIQ8emh5tFBysxSpyOvzChq2+/7dABT1dsIUwUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jtZ1u0Me;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kIF3rYd7;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F4EA606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 11:03:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F4EA606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jtZ1u0Me;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kIF3rYd7
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LA6RxC769853
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 11:03:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Uxja2CBhb1mW7NZElmgfeGuVVftU5XvBGnIy3eg6OFg=; b=jtZ1u0MeTrjqFU8c
	IzBl+Y+eSRCLuajfmBB0P8Ae1BXi0OKaPZjAcTxYqMPTya75nAk/x1yJVvCJQeog
	f7OHeSSuqJHol2BUalk53HaZWPOT7b7RwbGUA4G8BCdfMlmvA+RMgAeOG9fCCN4/
	KxbCbu1C5QWJrKQYFDFmso7AF4pm7fR+MOGlBl/mPD2UsfOMriOAWsWa+hNvgSrq
	6c+DZpk+GcPZou9bnH5cnyxInjnM8mg6RA51jPs137BuiagQ07d0mdddZ/kTf+D0
	7lpR8bnqqQkfWX1Eaqf5QRa+Pgt4YmXkaRjrqKlR04EMm4hAOdwX4XhzBF7n/4Eq
	h2SMGg==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hegs02tbc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 11:03:28 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5c9e0f047a6so11647e0c.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 04:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792580603; x=1793185403; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Uxja2CBhb1mW7NZElmgfeGuVVftU5XvBGnIy3eg6OFg=;
        b=kIF3rYd7X2vaNTSo6aH1LWwTeHK3ZIMtr+cNOHG2iGyZ4R+6yqsdcMYL1IseBfLCTG
         9u28SsLYgRRDXeF9NtVdF7gn/zYH9TnMtKQ036C9/qTMVkH2ph+3Hg3/FLVtSWom3hRy
         FRuSt1NTrI7MALlGEoT1nfagPh+ogrpLF20Z8bezrCoIXSf4Mx64SNYzJlvu3R9vhM/o
         1+NUE1f8bss4dyoh501+B9pTQmOYJrVjpLl/8bvk01UFAUTbSuW6SRiZgnEZjMKo5yoF
         JTI/17NyYaWc8smB05fAy6WBxSSgzjqy/VheYBca6O96I896f1jQTGfUOs6u9Sr2z/1k
         VxAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792580603; x=1793185403;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Uxja2CBhb1mW7NZElmgfeGuVVftU5XvBGnIy3eg6OFg=;
        b=fthooFQ3FCoEOib7LtRzKTYuZeIOLtKzawhll2VWaL1Lbz7wY4Q7lX6pUrI7VoAdiS
         V3cH5cD+XOia4qs43wA6EG/1MNET/t48CtX6cao5ytBANLaBaMJDmcRdQo6rjKg6Ptmp
         Ot6yzFIQwpu5pzTeigI9MvwTkX9E8stmL7c+3PHcwdZAT+Rp+Xl7VDHKOpyHONWGwK7X
         44PEpOyaOdBs9UPYXFwqdgJB+aR135pdfHhje3f9wvC4+VgKMrcnN6jG5NZBCNVd8+yP
         NYfMB6p47JUoW6WxpVbxexLWRNnM1H3k+yaLlCI6z6KtJPyN0td7cYWaCNN2c9CJ3NB+
         Uj1w==
X-Forwarded-Encrypted: i=1; AKwUvBxc/ZnNX1cdRMYK09fz3FEzQAeiD1/Dbtc0a6SQd9fwmutStWz4NilrHFrmGGUyF4wEZat237WO595sxPg=@vger.kernel.org
X-Gm-Message-State: AFq9FYITq6XrjFsxPxV2F6VYW2HwUxRmgTnhr9nbJmv57WGowcpOE8eu
	6Xv59vnCNXBZakS6KY43/u7Orce0kOmjsKLIZl8A847em6H/r7SXQRuwc1d5FhQniF0zpRE11wJ
	xAWtXWpJCTBRKcWrTV8xJspCGh/lwjCoXrjb9hkFNyCkUI+9B/jqO/UInhgJuW3SfGHg=
X-Gm-Gg: AYBFou1hv52uG0IniVJoYHulwV70C3UeGRLxWl2HN+6FBcW67wpcLUoEfPGUFJpq2Bg
	wHHHck6zQDVEBKGE8nE+DHJiLchPZY/sXgy2wWtOzHlvuYkkfk73U2TIhj0hPFLyYWxpXnJ+qgH
	m63iX6WokbBlfBr+HL6/6brRI1WN+arFh1eONUmGZZXwDz3P4bKWbZPOX55di5ndkouOd5JHtAi
	UwJrLOKtAWhwgNxdpIwCP1LIK5F7XsIJ2bRKUhDulrRm9oEDDV+5AfxQJ5Rm0ZLtJbGp0IO0RL9
	tssbxgzVJoH7ZqBSkKDtlg4KULrdwdFs3/3z84OQ4w3l6JdzhtmzNss9o1ToZLItThNXHzt2xFD
	ohJmh35mDsGtTqtkcVzT+hg==
X-Received: by 2002:a05:6102:3c92:b0:7cc:174b:f7b7 with SMTP id ada2fe7eead31-7cc922532e5mr441382137.0.1792580603028;
        Wed, 21 Oct 2026 04:03:23 -0700 (PDT)
X-Received: by 2002:a05:6102:3c92:b0:7cc:174b:f7b7 with SMTP id ada2fe7eead31-7cc922532e5mr441345137.0.1792580602582;
        Wed, 21 Oct 2026 04:03:22 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4678f78660sm65165466b.17.2026.10.21.04.03.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 04:03:21 -0700 (PDT)
Message-ID: <42b2b13f-5d56-4668-bb26-c4623617f4bc@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 13:03:19 +0200
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
Subject: Re: [PATCH v3 7/7] i2c: qcom-cci: Build command words with
 FIELD_PREP()
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261016-cci-imp-v3-0-5ee7ec1ea1a1@oss.qualcomm.com>
 <20261016-cci-imp-v3-7-5ee7ec1ea1a1@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261016-cci-imp-v3-7-5ee7ec1ea1a1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=S/NMU4sP c=1 sm=1 tr=0 ts=6ad89c00 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=vtxEUVkT7waMBiOsAPUA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0MyBTYWx0ZWRfX6JLy1ObwV9uV
 BK/Zd3cmnNEf/anwP7y+ZUStAUt5Td8QDruhOo8J28TRh73vhEta58hyMlDRBjq7JBjwl0b33J5
 30CeluNyspYVai8b+wNK7s3Y5TJB01GNN1DDk5hTftAjs2ZbaCR5sjNnPj/NkpeGGUxDGD69e2L
 mNDvOmMtTbBAj1OOQxmUmygFrjRV+u8AP1DG8/sQA/eJnD3FDCG9POkiCxlb5LKhOWW7mUWJ3Z4
 gDNTU5NTibrVuStxMs1QbU//lMYguwKvpGpDsY40TIhhHv9ELAhAkvGQBAENWnIY1nt41OnXE1j
 T3z8vBPoKBVst/4zZccFxQA8KhPY0p6StdR43uH1cWWdkyTld4ObJ33aR5ehI7iM1U8Gpxgnwjq
 CSaFtaqz6sfLiP5/j3x4TDhv2x7IU+H1oySq/F1UPCLVDkXeI5/RohZ01AaCpo2PR0a1A6rfLkf
 5xHLklAesnWmaNz2oDw==
X-Proofpoint-ORIG-GUID: yYDWNbMsBMWC0dksTIKdXvdFSv3ZJZnS
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0MyBTYWx0ZWRfXxKNiwZD+USuA
 FdO4j8WK1x6C35zDuO6f8kvE64EuSK12D4bJbz3XfFms7ttV2g/rXK2GcPXLDCRp3ubtl6ZZ4pL
 WqIB9h2jt9QjIkgphthY9W4Dh8XH9f8=
X-Proofpoint-GUID: yYDWNbMsBMWC0dksTIKdXvdFSv3ZJZnS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210043

On 10/16/26 10:00 AM, Loic Poulain wrote:
> Every command loaded into the CCI command queue has the same shape: a
> 4-bit opcode in the low nibble followed by an opcode specific payload.
> That payload was open-coded as a bare shift at each site, which hides
> how wide the fields actually are.
> 
> Describe the fields and use FIELD_PREP() instead. No functional change.
> 
> Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
