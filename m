Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793873786;
	b=DWBkUkiMgp9y4adtKhBgXX9BSLy5MjgrWdQ2iCvaGdgbHPD8niS7bdhdRX4ivjUWm1DZ
	 Vb/uUHNcZJ4nYACG1p2hciiSMoDsuzDJljjlCK/l44fceEs95+XGmhd2jVO2SjagY3sFP
	 hmWysdqVnr/5Dl6o3PfEXUPWlYrE2DnUPwupNrs0rJJGwY1TEPrp9fM+Pcj1Mw8otPBU2
	 6GSZIUTtjzk431pBRBAq0Ygjv5s4VqTBgoR1q+Xg6wWgSkOVydUxDmW9y1CypP1OZQai4
	 LyWCx4KQwQEPeq1lRDYmEPT/BdaxkqvHGiEKQ0zY/SBQ38i4BJeLw4Wxyq+ZrZdw++A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793873786;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=sNLRvc7OS9U73u6m0l5Vfg634kpS6gu15CVwplIGc98=;
	b=gHpr6/eI/a6FkLid6qwwztTHYrBIgC4Wyk2Sh2x28b5zRrdjU+noiuiEyaG2mtdZ21vt
	 Rrio9Zq32LGF4UQcEVmgOP7jCvS4tnbhja/EVZJYnzF7R3gi9UR5szkO4RNYzl6IL24O1
	 arncC2pV4BmGekRNFUOByGlnMsxyLUbTDpuue+5GcAL7dESjtF9NwHoTf/jXXVeIjHCx1
	 mcqfRTJLPJoXIqzayEqvf/tnQFGeaevx4+SHMBM37n/XhRDJGK4fjN+5sdjD1MRfs9bml
	 iLy8xsbfUTg6Xvz2moy11i+XosduTznUFbHc8FJ3nTbRz0VS8tl+qF2zP3ycal8n1iQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Dm/rrgvG";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SsO7qFz2;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE812606A32F
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 10:16:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE812606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Dm/rrgvG;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SsO7qFz2
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A59tPaF4084523
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 10:16:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sNLRvc7OS9U73u6m0l5Vfg634kpS6gu15CVwplIGc98=; b=Dm/rrgvGMH4DSLSF
	Nlir3zx3307J6xCw3fCd9n1NIa/n+sLVK18mfBvjQQ12WDY1TY8woRYsmKtFANu8
	7MRIZ4Tz65xAnOlFyf+eArVvFLG5fkuTUe4jRioo5pT653Gka47VkWXjzJ+cr9n/
	6cX/wN991s4mWBns3uQmTzajy4nkPOHEFbngA49gNM7HiLmf6kmbm4tlvWVRFeq5
	isxxeI+cppMuKbblwHKSfp+/d6XVRIXD5BPs1UL0Uy8KOVadfVvpqJEggA+H1XFV
	2IFhLuH8yFyPdQ4boXhOd0hJxgIQtb5AxMxhmhOFXJ7C7gwKkP3RfNZ2KAPdj9SP
	4H+jkQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrqhkr387-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 10:16:20 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36de26cb4b3so1143257eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 02:16:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793873780; x=1794478580; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sNLRvc7OS9U73u6m0l5Vfg634kpS6gu15CVwplIGc98=;
        b=SsO7qFz2tz9dgth4FHcGwJ4CNlsPXqS4tYpy6Tuv2eqnxGQNNF6OBsr998YZgzh6LJ
         lYSasC8Xvz4N7AVjogVkLqCDgx9wJzFX1qKdK6V7yIiTgCBF08moxUNRz75zlDoujFoj
         eeI4ImQBgFG3TAK0++UYg9IvBh6rEH9zWqtv2e+e0d0acv1ZZ8znk+WV2yBTB6xkehiR
         PLwkAcFWdPGdqxN9op7BWnSg0OVB0UcL8/GoNuQDv12aROtobiRkx/5eivnZEeouWmFS
         6r/3b6kluqHripQcao1Ww0+5LSyYxFScEHYiiICSWSfrWYS/h6iD7XgcQDhDJHIOQhyr
         7v1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793873780; x=1794478580;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sNLRvc7OS9U73u6m0l5Vfg634kpS6gu15CVwplIGc98=;
        b=Vu3ZSz8dEROham1oTZ0Uci7wOVBwd1pxIShgwQNb2395vOjt7RSedVpWDfcQcoToQ7
         IIle4EcsWGTWYZi7Ww9hQ5qAo4wnsCz61EHVaDIznpQpKuO9rVLmAPJUDf80gQJZotQq
         k9dKFvfySj7MKhoPMXwz53JEBJb9nEXxn36455mzW0U7jPrHwSWzn6hC8Xotf7j38BSI
         aeFQsWNXE6e9leJ9MIoLKQy5CI10sEvpdcEOLn/EYWbLf0na1NG10qWR0bxtacihX0nH
         JfhPB23OSFw7uzYzXDvHBbXtlpPZwCh2stepE5opVVmYHy0Nd9r1cLuSMbUJA1jhBo//
         wOQQ==
X-Forwarded-Encrypted: i=1; AKwUvByBSSIluaXxW/yMdptNqt4NcTakMC06CfQ8Fo5uBES3kLSva44YeiY3urbKWAfoikPrsd5TQDY3SazgMzk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+R15XmHk8TZzpFIoovhb8duTUVrl+9ahJq2pQGPqDjJiirj7ag
	Xi1nQgS8CzShzZceAGCR6+xTW0PVXug8GSpG4MypVXCfqzb32vqgiIGmRz+0DHaG/SKJrr52Sk4
	TDvi39SVuO6OlFBfoVHR4fRbrZa81VQ0yORYNcWT/5+J7ApK/pBFKUkz6lXPPg05X27s=
X-Gm-Gg: AYBFou0Kt+Pv/nDJcebFxn6q7OYnlkhxRqguuWcaJuAkv8HO6qi/lB1pWeWBAEMBgdL
	xrB7Li2X80DBLwo9XvL+mg3MeEXeRY30Dk5vZ1QUG52rRt7/dK+ZuPGs+dadTdK/F7yXxrfxkwH
	r0MzqFLb4C914UqMQIrdbY56xhFf8owqk0+1EwWitPePjOFEGIUsbWuI/+ZdN323UY2G4mFsvYu
	pkJmG43MQAqEpXni3vpg9yEqHRqHSrIjPfJzf65W1SOR8gwwa6axn6BtBCbl6Lkz5OC4+kK9Mrb
	KJ2P49YfSwIIKf8mQS/nhD1g8UOYaJbTNIYI/yN5mZS2QFUS+yHYxumBCGk6/polVYR3vBYBwzk
	HdU4y8g3gABuz0w7E8547l9l7PUkddObH1br8fV5yyg8ioURpGo7/Hx4y5ujD0Sa+UNr9ePfx8Y
	Zp
X-Received: by 2002:a05:7301:1705:b0:36d:1e81:4a6 with SMTP id 5a478bee46e88-36d1e810863mr5355038eec.13.1793873779435;
        Thu, 05 Nov 2026 02:16:19 -0800 (PST)
X-Received: by 2002:a05:7301:1705:b0:36d:1e81:4a6 with SMTP id 5a478bee46e88-36d1e810863mr5354978eec.13.1793873778588;
        Thu, 05 Nov 2026 02:16:18 -0800 (PST)
Received: from [10.217.217.199] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38fa273sm17792403eec.16.2026.11.05.02.16.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 02:16:18 -0800 (PST)
Message-ID: <e07bf018-9a3b-4b2c-aa2d-32bb3a8db60d@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 15:46:09 +0530
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
Subject: Re: [PATCH v2 01/12] dt-bindings: clock: qcom: Add bindings for PDM
 GP_MN clock divider
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Richard Cochran
 <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, netdev@vger.kernel.org
References: <20261026-b4-pdm_clk_gp_mnd_v2-v2-0-ff8e4bc8d567@oss.qualcomm.com>
 <20261026-b4-pdm_clk_gp_mnd_v2-v2-1-ff8e4bc8d567@oss.qualcomm.com>
 <5ekc5ibn66mc7gubh2n7htv3u64zomvfopsjnddanzayenxnpv@nczbef2enjfr>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <5ekc5ibn66mc7gubh2n7htv3u64zomvfopsjnddanzayenxnpv@nczbef2enjfr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA0MCBTYWx0ZWRfXyBDwPMSUoiPC
 8qXHRbrSk6KHvosLrMKCCbMXG7f8Z6RyDCWZUbhbqovtV5ecJrs4OB65HT0NZmbhDuCbpN5emwP
 Nh1VIIm0++qmTGoNm/CluS11mr9PBtSY8R5j5vaiI12Mtg0/7p/QSnUhAylRNTj0+XCW/4ho63O
 yeObh9WQ+EWzFAp+DwX3kQWGYOTuLKf6dV3/chhtG11iJNgZg0Q5tnBsTB+e1JMhK6IdfaGGX8R
 E+LHpcymCEfA4jlt9DBiLm19MTrb9RzPliatH1AWQilmpeQXdx00tQMwlEV1Op0NXcT8tktIBsL
 Koy+o/Yh0Y7TjqlMna7QqB8ODvVrPDhPtMX2fFmKgrcW3T6gE+mJvCYBRlhGr2Q8Wyel5gvXA03
 lx5FBgT0/YAyBVlfUGfQB1mjuF8EN3VMxcqysPo6x3TDR0mdXB1v4YDp0AxrLDYMuNDhfAMX8DB
 Avx1GUzWy14mqUgQEdg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA0MCBTYWx0ZWRfX00TjH01mUkJp
 wvNTeq75iNOR6UwkfEJbOWMbtIltbXuamyPKIG8uuz+yX5PTgHEf3tFl9KOk1yVEVpaefR2OK+Y
 8i6z4OeqHcbIDj8XDIQXn7yOwcDyxc0=
X-Proofpoint-ORIG-GUID: oBe6MbqQU0zpU3mJk-Rdou_I1q7CaAm-
X-Authority-Analysis: v=2.4 cv=a4+lZkSF c=1 sm=1 tr=0 ts=6aec5774 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=D307_pyVuiG9t-qGCPMA:9 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: oBe6MbqQU0zpU3mJk-Rdou_I1q7CaAm-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 spamscore=0 suspectscore=0 adultscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050040



On 11/2/2026 9:24 PM, Dmitry Baryshkov wrote:
>> +properties:
>> +  compatible:
>> +    oneOf:
>> +      - const: qcom,sc7280-gp-mnd
> What was the first chip where these registers appeared? Was it present
> on SDM845?


It is available, but we didn't enable or tested the block on SDM845.

-- 
Thanks,
Taniya Das

