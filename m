Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793631798;
	b=sE0+uxHXH2vObnyPtZpxG/5if8nv5UFofTFH0MtEmM1WYG42umeOkU1nRkM4piz2Dy2/
	 zo15jXRUtqQA2l1JeAXkWGGk81AFmgYKoj+eKY5nkaoHSWHqQDw+qnKf2imcVGA8WwN8j
	 FC8EMtSEZ8NsTIkfVewPZ/GVoNawUOXqVgIWBD4Ec6i9WCe60bDzERowv+dyi19cxuiii
	 2xB30caLQn14aVdo2g5yScPOSnXU9lHU7B0Zz8J4R5MQWQ1z5gCmUISGoaKZzWMtLMLDt
	 bk+vxrPZcak/pevrRfWPcgJZdiYRSDhTOH3SesNqiw67Xpel6Izz7n36oeXTcKbB+zA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793631798;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=NaZIPeHJFWb9YSV4xiIF6FuEZn7FHHL2p7dwHN+KzUo=;
	b=QlwqGuFnzChfPDe5vZal2J9Gd6TGjPRiulV1ER7RWPtFayuFchuSvP6zpDJBq4Pz0VxV
	 BJZK4QgavL6iW/GblXnIW00k+7/QD0259BomqZU/C5SqPwojxLH1MahWVojYKJfHogilb
	 kfbA25MnPOF7Yd248LIPu6EH68+WqvwU4EJEQJiUM2I47yrYPAdFFklz4IXjgx9vhQgoC
	 ElPqkLkj2NKEL04qhTorRwWeTTdCx8yE+6JEZ27Vzjnh92fw9sv7y1puIG52nxaBMa3Jl
	 YxKc/2lAJYLknHMmhtPL8MdCAb0SU+wJgZeBIEKLUz3N+0GpUUSR82cMylJJkaS7bPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=p1NaAAgZ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IYqgE4kD;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8E516082BCE
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 15:03:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8E516082BCE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=p1NaAAgZ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IYqgE4kD
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DpI3W2991827
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 15:03:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NaZIPeHJFWb9YSV4xiIF6FuEZn7FHHL2p7dwHN+KzUo=; b=p1NaAAgZ1DQr8ZyP
	ihQIlhr81paqpITIhuVnOV8qSW8FV9kvsHcrlE5YTSChn01KCpTI+3DA1Q74tl8B
	HIaYrQoAteb4uCfKxjULLlzJOf3fr1Tgm+I/Iak57E+O0r7BK9bRg/Hwvabniu3g
	Dl9HmogXKMNOSm4ZVUfz8vTPOE8nY9/SWH3jqWXmVrdvfYW0G95ob96uaZ6YXMMw
	cKUeXQAlyGnWLFh3phk4yi/UDZJEq4cB30ln+piAdCGPYSo07b4zIhNFEJQYCsOf
	roAyHaDcCelR6yxUsI0IUPUOCqsPn3xgS7OrK49/YU058VgzKpsYbg9cCbymJ3Sq
	PT8ESA==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpsavgwd4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 15:03:15 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5c97957d83bso175061e0c.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 07:03:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793631794; x=1794236594; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NaZIPeHJFWb9YSV4xiIF6FuEZn7FHHL2p7dwHN+KzUo=;
        b=IYqgE4kDA1zSeILSmjbX+v5lPgvRdFGpraid7iAo0YFxXOyuMjTmDtDTmzZCGzaT4R
         g+r4/zxNwQrhMzklflyhYu/cWSTe2ieWkx8L3uQjlfQ3YllCpudCFR/lfjT3G9pb7Ra/
         fbZgLKDJtZxNzCcQHsnUO7VhzR2k1G9BtDN2ykSrq10jPj6deyE449hVXZlOtBVMN0hE
         soZj4wIaAY9ZLouHsLCokkKYyzvHor4nVMezpif5Lk344hKcPQ4JcdDVoSDqGKeHYzPL
         uwRu62c5gD19mHSDDJQQyMatERlhF6gdYwLTiFI62olvPKMLfx7b4dV+EqwIHAejKTtx
         mpXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793631794; x=1794236594;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NaZIPeHJFWb9YSV4xiIF6FuEZn7FHHL2p7dwHN+KzUo=;
        b=HZgjb9qy7njSWHTTj3XhrZTNP0ffo6PZyPox91ztqOd0sXYtSaAEciggQVJcG69Jwy
         1+MLO/+0bMX2qrWyRHko0bfpLDc6xNABfKSPZQ5jtqjNywTMWBQaigbToEi+qf55AM9M
         gwIET8uGlZrr4utegcjgTt3U3yQ1ShGp+xMNwax8hLOLwVN/9qN7ICDCCy2+7cSAlVLf
         iB54R1VjRnYZVGjb1W2rvf2OXoUhoUEiivgGRdUA8m4R5AsqNIpOli5W9T8NNjhNiZNl
         CwK7KkX+j/jg46OByP6+UzJgDheXHzneHrHjWiQyzKjJMDIj0CmjQjua4J3qersDeW4g
         vv3A==
X-Forwarded-Encrypted: i=1; AKwUvBzl/a2EiNngANp2kvDkEgULFoo5PwdVkqBvTmYZ31UX+7JlMI9oA3MWuOY1KFcj9mwXtIRO9TrrhE5jAGA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/vMaqgxGA0R1/sHGPHcIcOlIzJoLMt/qNqJzslu2Rk1+fFerWU
	KohBriDwE2uv5jF+XoqQZALAw8SNrTBqQabJDSUuo3L1pr4+NiTL9MhUHeGukoz9c9p7AzIDmdo
	WAi+ddLhz11AIAJDqGA8KUjypQFYiKbgAzavREaWxJcugYkBzTqBEmV8bQ+mhupBM3dk=
X-Gm-Gg: AYBFou2k5znR13llyCZbz6bjme15qxA1nRslzVzvJKXmRL+fEbVJY2oQMyf32BqahVL
	EKzz/MPN3fN1MOWHbNhTP8IzP+lpO778E9c9ySMaWlJXFElFNtjucPADlbfi8h84q/RUKsuUqjU
	C91I2VibjYOu6CWq8WDan1kNfUzLHyqp81vf/iJttm4taIESXbF9K5FLI59uuK4a79m9Rv6hP9c
	Q89TkHRbG4DA+qQ/h8toRTrzmqa5oKtjm4aSqK06ZYpOttMjP7x0dywMNnQV47rK0YJAEHXrW3X
	MT0+xCxxj3YCzgOIr+9PTUhGDR6mjR4oJgl5I7zSn6M8zQ9OSbmHuvMNw1GB2DPvHFj+e7Y299y
	WDumrigcdBRQ9SVGUOl4i43+v9Xx7PZ3mWZDvyc8c5AjV1vTFuv109QLUTVNMxG2oW+PczA==
X-Received: by 2002:a05:6122:8487:b0:5ce:bde0:9b53 with SMTP id 71dfb90a1353d-5ec6881cab8mr4165966e0c.3.1793631794248;
        Mon, 02 Nov 2026 07:03:14 -0800 (PST)
X-Received: by 2002:a05:6122:8487:b0:5ce:bde0:9b53 with SMTP id 71dfb90a1353d-5ec6881cab8mr4165778e0c.3.1793631792302;
        Mon, 02 Nov 2026 07:03:12 -0800 (PST)
Received: from [192.168.226.93] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cebebf164sm282766b.13.2026.11.02.07.03.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 07:03:11 -0800 (PST)
Message-ID: <6234d23b-09b4-4a78-a2d0-35a71cd70504@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 16:03:08 +0100
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
Subject: Re: [PATCH RFC 1/3] arm64: dts: qcom: nord: Add Ethernet support
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261101080413.1428016-1-shengchao.guo@oss.qualcomm.com>
 <20261101080413.1428016-2-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261101080413.1428016-2-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1OSBTYWx0ZWRfX803CbUXtk5Xj
 rNqID+QJ+g+uWbMCNcryDhjgSgYWzk/FKvT3oPj+AqvAm6fgTfAVCp2hFz5KCMTtJ05r0R/NRHz
 1kanhhrYf99tlBpglIUnvQ4TxJ9foPqQ3h7HgTbJMhVGcaoMSioo9xDOrS8cYOgPyr6ZrRtGaLK
 NJ2iXDwThGW6Xx/yt+XE6A0+DK6Dkn+RzA3rAd6zHK5nIofyi4P3Up+lEExg20BU+du+bq3tTHl
 Hiri/zhfr/J0NOQLIaHX4LXklNox9PuLMHlkFD/B9FZgRobwMq78WKjwzZ8sYcfxUDyKnmKOzKg
 viMcmkio1qvuOPBHMos3LgqQHM329VePYaI4Z4YsnPWPC679rCKrwfCUK5i0XEt2Jj64j6W3nNq
 1FCF0SUN94SZgmzlpxS06DRTst1qCg==
X-Proofpoint-GUID: zieNZxOjpAoFnPw0Mo3BOY3UnkqXNooY
X-Authority-Analysis: v=2.4 cv=FZmiV5+6 c=1 sm=1 tr=0 ts=6ae8a633 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=sMZvD66PJ82pgKsSUfkA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1OSBTYWx0ZWRfX8fNUpMi/3sZq
 0DluWUa5/S6OsKHfPAK5RB8VMWC0TO6lBJ4eYINoxLxfWpg9/VOMrukLkxbnO4vl5c2Wb1MxCdc
 hxY3Kbwy+zbpsqcrif1PccyX0PHZsNE=
X-Proofpoint-ORIG-GUID: zieNZxOjpAoFnPw0Mo3BOY3UnkqXNooY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 phishscore=0 malwarescore=0 spamscore=0
 suspectscore=0 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020059

On 11/1/26 9:04 AM, Shawn Guo wrote:
> From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
> 
> Describe both Nord 10-Gbps Ethernet controllers, including their XPCS and
> SerDes blocks, clocks, resets, power domains, interconnects, SMMU streams
> and DMA queues.
> 
> Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

I think we can't enable the ethernet hosts indiscrimately (I would
love to be corrected here!), can we keep the XPCS nodes enabled by
default?

Konrad
