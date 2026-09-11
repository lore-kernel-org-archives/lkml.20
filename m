Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1131139524B
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 19:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789154380; cv=none; b=ki9b52qnhIpoEK3t5ZDvigIimtL4K1N3MeAa+tCzgHgBOH4FBv0l/hIA1PbuYydKSaPJtRxwIeawsEFTgXJJpEUYzC7+Xbgm2Cf44J8JmXDDbguHUFpY+U6Pg0PBJHDrFMoH2aDFreqI2i8Hi12zLflTujAnaQdYuVQgnlfR4mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789154380; c=relaxed/simple;
	bh=82SHgbFXIKNE8cz4W17AtU4jvEU/TKRageBEhE7plQY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hEQtuawxLFCySqhWh5ihln/U8VKmiG4QZAOqlhsee02b1cMTFEkmlxv/9102CKnmBSbaQdTBq7okncTRGq8cQVEKYpA2WD6jFOJ34rXpPUZzvM0cqjTki3MdKibH1CaLLs1YWdkZgvdrbSUzgqg0xfIF5WO2Z8OrojlUw1wCf4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gux0B5Ub; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y4trg4ve; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gux0B5Ub";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y4trg4ve"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BHWBRT809371
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 19:19:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+DpU9d9yKH3MESahifjxuxIqp5MAA0YI6mbsse4jUfs=; b=Gux0B5UbIvbrfSbG
	WCX/heFkRvUZQPCsQkJxJs6z9uWTzM8Aej7j1ybGt7NmcHA2OguMmVbD0NgqwuBq
	0N3u0x8yfaqAjas7TWFuxjrA1X0LLYDmzok3TSORTsxkp/dEdOxYWm+9UWyqn13O
	9dZsqi+l6sGyMIZSxbDYUzEOfvi+PyIVR3kpCKDPYBgzaX590uIFSb/7lIqMZDFv
	Uj+/Zx4UcuVYyMESulXadJsHbEq+rIdZN2gdrE/E05MooV35KpIssBgB1vQ5bU7Y
	Hw+iRLcSLrKuLoX+WtvwyZ3rgTu1ukdX2NeAjdLexrMz5/QLQZEsa8i4zur36xHf
	r0sshA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmnv20ev9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 19:19:25 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e8e864ef0so2293679a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 12:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789154365; x=1789759165; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+DpU9d9yKH3MESahifjxuxIqp5MAA0YI6mbsse4jUfs=;
        b=Y4trg4veBSE7o+VeoiU6gZtZHs75ZUKME+r0q/WXpZCCfstrPIbtpYtoDvtd9/qP/1
         2jrw4lZ2Y3wnfg3tRIniRZwD57fM0IJWIloinnnE5VYntC+4ZI2dKiDi7DHP0wafczle
         Yo/rVCjMtD9EzexodMMuBLT5TaFlze1zSNS90K0blOinU2mLZb5Hi3eWVpVk8GIx9Tn2
         rzr+vWzhdqkDm5S1ZVS9+fUgrKFQkh1zwnicPFgKTbelqYUQNr//eQ71sHp+47cvBDrd
         8oCmnCbrkNK7bJzYMCH4PO/tX4ieuvk+ovb1Hdjnwd+Rh5LH85MX3rQdJvpARBPmi6BV
         R3TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789154365; x=1789759165;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+DpU9d9yKH3MESahifjxuxIqp5MAA0YI6mbsse4jUfs=;
        b=JWv9eoKhvCSwvH2hd5vtIMnR/hkqvCWGraUBzGexIBziiR0YeILTIII3Zp801hmegO
         +5/oJaQbhky1mE6B43cztKnR1BQA0zFgbkGEGWsToId86RbGpisc28pTLGjQ9+YfAuvG
         08AdDTbSi47afH6Km6l6jsEay3pleWtlp3C3ODyfyhlRQZDAv80CCoMxdn4h0ySiZ9aZ
         AKi9YgD+xlxnEl8X67cz5PcuiWzqgVMvCzGmvPgmtifgrKyqwVpv9KhB0bvvVGIX8t3b
         bKiTXgLAOp4sMf6xkk5EoZz4gVI4dlNRe96UCjSVseERXj7hOShC44IZlQqEKTzjBh1G
         aWGw==
X-Forwarded-Encrypted: i=1; AKwUvBzENtWFlZ0WEtPzpj6jOkeJ7AvMyu5fcRVZYuEfNRReP932SV2WUVzgteEk43rWC/myG559XQTT6vecV+4=@vger.kernel.org
X-Gm-Message-State: AFuF++lgVKcHoX8ZVNm1x+BBGgNCDMEedJQ0h8PVF1tF4k9cC5aL736p
	J8OCrTXX3/9vwMOwRHXljvtKFXypw1Ls3IpyDgYITOiCZy4C8dRkS/H+sC5cE7S2k9fO1DEaXfx
	wQhopoxJVGU9RRN7748e6YLiSwLkjGwey9dwgN3XjP8XScMW94AaYnmkUvmNrp+5vhcs=
X-Gm-Gg: AYBFou2pV0JWvza+vpyD0EDQQLBI8kirecR+e07fid9lSy64MXIUYDEesviScFBselz
	T+yLBfBeHnx468aJWd2hLiM5u/9K8VPQl76T4kPcjXtTu9872eXauOHg3ZONYw/NzbNCyRFEkMV
	6rOTPuC5AAug0ZjTi7z6QNTYgv3Y4C3/Qy/LMovNhW7+cY0mUe1t/kUSAd52JyOqkgT9M4Flkvr
	K5hFOa6IaBYXdRzvpIVx1CMfI1FiKcak0bY3NVZq2PArXrK0b7ZxcI6PtaoG3K+7d5pEWymoI95
	C1M+3KzkndwM4MIptZFyny38T8Ucd4Q4tahpjK3r6LA/XLNQ1VVEth5jgQ71pT309xZ2DYlemJx
	RWoNz39/ZzOk7rbhyPVTRpdSK1MYIKsglc9FSNoYkiy4PGEr6ABr4BAb3tVDH
X-Received: by 2002:a17:90a:d64e:b0:395:4de4:92be with SMTP id 98e67ed59e1d1-39d9c1db130mr11183563a91.13.1789154364740;
        Fri, 11 Sep 2026 12:19:24 -0700 (PDT)
X-Received: by 2002:a17:90a:d64e:b0:395:4de4:92be with SMTP id 98e67ed59e1d1-39d9c1db130mr11183505a91.13.1789154364261;
        Fri, 11 Sep 2026 12:19:24 -0700 (PDT)
Received: from [10.227.105.111] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365a59b18sm8253073c88.2.2026.09.11.12.19.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 12:19:23 -0700 (PDT)
Message-ID: <ee32feeb-e626-43ba-926d-5786aaf1d960@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 12:19:22 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/12] ath1{1,2}k: support multiple PCI devices in one
 system
To: Juha-Matti Tilli <juha-matti.tilli@iki.fi>, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, Kalle Valo <kvalo@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "David S . Miller" <davem@davemloft.net>,
        Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Mihai Moldovan <ionic@ionic.de>, linux-wireless@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260908093145.2492666-1-juha-matti.tilli@iki.fi>
 <2cf63e00-95aa-41ba-ae8e-8abbfbc486e7@app.fastmail.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <2cf63e00-95aa-41ba-ae8e-8abbfbc486e7@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDI3MSBTYWx0ZWRfXzT87s+oH0K8H
 Tk/OoRsaj+H39vyQZdZQABUx8c88OTDBtkbTGuoMqATmrXvahjvRyA102oaSuKfNOYWFpIUFjJl
 ui0Dr0S2r6vKAzjWZknCSOWdR3nS1jw=
X-Proofpoint-GUID: tcKuXg5LaWcCptyUPG3WVDfdAitum6N-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDI3MSBTYWx0ZWRfXzeYGPzlHB+36
 ugWZhaERxrgJtImwNHCcLS+WCN38J1wicwrLjBISJPgyEPrup1jHc1ca3U66PHJ52CjtcSiFKpE
 HIrcfP+RyTeS7ZFlK5y9Sfd8/4soKSaYIEKm7ZWRMtFdwuZBeGqj/dLWcgnW5vgIUpJMLPFxtJr
 7tSbncc1d3vPrOilArlRc7kOGRsIoS6/GV4cBIO0HOiylIauDzSwjrKe9TGhhdIOXBa+iv/7WrB
 1RDBOYzJCVapE9VM9MdSehBOKDvzAwJNbZ8GndXUqFbntN7/7zNw1KOvhSizF2/Jn+u9HCI20ZC
 ltGvycMPo3Qd+UHLzLroViE1fkb4hd7uH89xnNlB8CI51lWYmgA9//AJ4WMbA6IBCxIYN4VGcGo
 +8zdOU8/x5ixJfaMSjbe4bI6Av0T1aE70cZj9kGc50bKyKvSuH1nJf9ySBgZotRk5gFFctntJHi
 yvzF9DAFk5x1Yn2hr+g==
X-Proofpoint-ORIG-GUID: tcKuXg5LaWcCptyUPG3WVDfdAitum6N-
X-Authority-Analysis: v=2.4 cv=XvdvqlF9 c=1 sm=1 tr=0 ts=6aa4543d cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=b6wZdvJBkCi_B7orZsMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_06,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 adultscore=0 malwarescore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110271

On 9/8/2026 2:44 AM, Juha-Matti Tilli wrote:
> On Tue, Sep 8, 2026, at 12:31, Juha-Matti Tilli wrote:
>> As you may well know, multiple identical ath11k and ath12k devices are
>> not supported in a single Linux host because they use conflicting QRTR
>> node IDs. Fortunately, Denis Kenzior created a patchset to support
>> multiple QRTR endpoints with identical node IDs, and Mihai Moldovan
>> refined it, after which I took over the patchset and refined it more.
> 
> Hello,
> 
> I am incredibly sorry by messing up the threading. git-send-email said:
> 
> 4.7.1 Error: too many recipients from 83.150.90.33
> 
> ...and failed at the patch id 8/12.
> 
> So I thought retrying from where it failed would be safe. But that
> broke the threading.
> 
> The next time, I'll increase the waiting time between subsequent mails.
> 
> Links to mails missed from the thread:
> 
> https://lore.kernel.org/all/20260908093437.2493698-1-juha-matti.tilli@iki.fi/
> https://lore.kernel.org/all/20260908093437.2493698-2-juha-matti.tilli@iki.fi/
> https://lore.kernel.org/all/20260908093437.2493698-3-juha-matti.tilli@iki.fi/
> https://lore.kernel.org/all/20260908093437.2493698-4-juha-matti.tilli@iki.fi/
> https://lore.kernel.org/all/20260908093437.2493698-5-juha-matti.tilli@iki.fi/
> 
> BR, Juha-Matti

Unfortunately this prevents many automations from processing your series,
including mine which utilizes 'b4'

* b4 am -3 -S 20260908093145.2492666-1-juha-matti.tilli@iki.fi
Grabbing thread from
lore.kernel.org/all/20260908093145.2492666-1-juha-matti.tilli@iki.fi/t.mbox.gz
Analyzing 10 messages in the thread
Looking for additional code-review trailers on lore.kernel.org
Analyzing 44 code-review messages
Checking attestation on all messages, may take a moment...
---
  ✓ [PATCH v3 1/12] net: qrtr: support getting new endpoint ids externally
    ✓ Signed: DKIM/iki.fi
  ✓ [PATCH v3 2/12] bus: mhi: allow mhi to know about its qrtr endpoint id and
free it
    ✓ Signed: DKIM/iki.fi
  ✓ [PATCH v3 3/12] net: qrtr: mhi: register new qrtr endpoint id for mhi
    ✓ Signed: DKIM/iki.fi
  ✓ [PATCH v3 4/12] soc: qcom: qmi_helpers: add QRTR endpoint ID to qmi_handle
    ✓ Signed: DKIM/iki.fi
  ✓ [PATCH v3 5/12] soc: qcom: qmi_helpers: optionally bind to QRTR endpoint
ID in qmi_sock_create
    ✓ Signed: DKIM/iki.fi
  ✓ [PATCH v3 6/12] wifi: ath11k: add QRTR endpoint ID hif feature
    ✓ Signed: DKIM/iki.fi
  ✓ [PATCH v3 7/12] wifi: ath11k: stub QRTR endpoint ID fetching
    ✓ Signed: DKIM/iki.fi
  ERROR: missing [8/12]!
  ERROR: missing [9/12]!
  ERROR: missing [10/12]!
  ERROR: missing [11/12]!
  ERROR: missing [12/12]!
---
Total patches: 7
WARNING: cannot prepare 3-way (series incomplete)
---
WARNING: Thread incomplete!

So I cannot evaluate your series.

/jeff

