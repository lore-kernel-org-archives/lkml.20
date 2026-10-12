Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E6694399F2
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 07:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791790831; cv=none; b=RcmckPGFY1bGOdJwBC9Kr4+VwrQCVFvAePa9cSg7535hhgLmizKxts7OAVc6ZZMtnikdsvet/iL0HCMUH/DLHYdhcUhp6cLDhMnxWP72VKb3lnJ2JgMFHlkzkDBAIYdEhQSoIiHJDjvMZq2ITGyS+xZojVqQsTB+C7HtF8xPfSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791790831; c=relaxed/simple;
	bh=TJJoflzFcFZ4cQXlQeaQN+SOZ1EUO7jBM0FzgQFtgZg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TLNkuSoQ6C69i4VRMPXaG3Ua41srkSy8VGmbtufyyddvt7J0c8PMdM81xTMFYgwSvdMDqP470+6SbeKbayE22fgDaIMgJbnMme8Hp8VAkTOZ34xWnTLwRsB0yAvHQM0T3PiJnVvSK70i3RmbRZVdvqVdJUNFl4BV00xs5VIq+kQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BbDt+0jt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kioMZBTB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BbDt+0jt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kioMZBTB"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C5Y9DH1216072
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 07:40:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7ZXhT5AUPUcds7dQKh6lnrg0DqfZ52DTtRRleOpRZB0=; b=BbDt+0jts0UI35rE
	Ala+sra75Ls/AZ4Pg20JTC93V6b5ODjcU60EV1QNpikxGXxilBDsxo+hHy/LmACQ
	EFzmLzk1UWOXRb5uQev5zjVdMEv/g9FvKXma36DdZT201JxJcuUJAlwb8JcERF+p
	5H8GdctP5ksZr4VYrFvao+8QRX6daPPp+GD2nXxxwUQxKVK+QO/AqdXefxJPvILJ
	Bm01YQ00vc7hZJTvwlxibhGG5oBOl8wbZADt5I8DCb9zaUdN7l7sMxybh4WrpD8H
	HmUYip1S8/Gy5S9Gh4n1Mxvd8adJrf6kZPj9m+JFZvlepyF4E7M9xEvRFZbyFxvU
	TvPaXw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8sgu0ht5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 07:40:29 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5350173dc7aso3618441cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 00:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791790828; x=1792395628; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7ZXhT5AUPUcds7dQKh6lnrg0DqfZ52DTtRRleOpRZB0=;
        b=kioMZBTBp20AO1Wc6g7+s8XvaD0loJJ7xDcBcNq8P2M8LZKoo16nu+d/gqHnrIhIg+
         Kdzatjk2go6dPE3K9RgWGTAbH5Lo8rpp9pjGEtN0qExUjlnC6UWqlf3rMNwjRwdQrk7o
         CIq+tl7OgW+4yWT5Phr0lx8KPJ9toeJMn+hZOx9V3SWOzKtzIxxcO8jq1yDYweuDHC59
         ConSeMOG4t99+rWo8yID4W8ZXzZi5XqVpf+HO/rzotWAzjgisOfzVqWF2gGJh2MfSuXm
         BwYSlgsM9B30a+mdFwYIzqfYhcWZYqo+hT7n6U3iHAQ2jfSQGUcf0pXj5shZqaKPs8rJ
         9WeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791790828; x=1792395628;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7ZXhT5AUPUcds7dQKh6lnrg0DqfZ52DTtRRleOpRZB0=;
        b=0fQJLmc4w962gfDNdUn9qUgRJHPAUTDfiEklw7aZNmelHUpqpZlagK6ZqoE4nSE+se
         0kAkPjzEmyAdrFnd3kK4r8NPO0U2CQ3KBWdW8/P0TfxdR7ICzS0CttDcttqn69rswygx
         46NMt3Bi+unbwmrbgCQPCQGfM8gWHPiRuUpMuGK+DKMW0/YLYcUxg0jF40B8Tl0DlYuM
         cyL64OZvwMulwWYEZmdAyLRgv3QpfM2UFLA8WKsfG0y3l6E+Sw2FmmV8zRg/x8PQnKb8
         xgFoq/xDHSYewZ5T5ywYzU9T7bbx8enUuIo83CNzsKScmbaKevUUCkEFSQ+P+fylhXq9
         KZsw==
X-Forwarded-Encrypted: i=1; AKwUvBwN+xFzI1EhJmbj/RvMNZ/6l0bkOHKp+HA1+MbrPssKVhrn+vsYufe6KyPtGe/E1D+0VJDKsXy/MFlEnoc=@vger.kernel.org
X-Gm-Message-State: AFq9FYI8a8UGtMsOA0BlKrQJ5CVhlVj9BXS+IndMTiIHSr/ElVhYvuLC
	qcFlMIK3DAHPDmJaeihANZeGG3OkYW/TcVXX7DEQ9/2lCxTswIV0dRcKXRlY6yosICr75kJTgd0
	kqJE7Wqo6ZlcTOgj/M4brCix24tjIMQSZcYh8ndmVYECqXfB6yPRju8tSSFcQL/1Vy24=
X-Gm-Gg: AYBFou2C2BpULLKRF9yofDt/9+N9Q8JUE0AjAkR4G9bvvm5efcuY0pxRzFJMkTyvIuM
	ivvSX4QaK81vvxHkcgROYqvRXXnq9k7I8hwcbCdRuwHdYtMUBVYihNB48wg6VJRXGcOHGFupiTU
	GrOpd93ERsUyfZ/Fza7tsQyJ0V4zg4X2c1TePPenQcZ+GghNUIFABI3tOl0JTZ3v5KzrZgw1oMf
	rW3slZuVnHPjIuKo6qaS8q0iO8XBPId+qIiJjaK1b1KhISZ+pN/WovqCGjS9krWGh5+kFqa63YJ
	5IBejiCkQExk38Q26W5LWSZ5E+VP0Y9j/04l5JOEEVvmON2cpRDqayfUeJXfXkzmOL3PSbYowZz
	gXNFZGQ4srCaIdAcPbmwPJA==
X-Received: by 2002:a05:622a:e0cf:10b0:533:6948:3d2b with SMTP id d75a77b69052e-5359f4990d7mr117219341cf.1.1791790828465;
        Mon, 12 Oct 2026 00:40:28 -0700 (PDT)
X-Received: by 2002:a05:622a:e0cf:10b0:533:6948:3d2b with SMTP id d75a77b69052e-5359f4990d7mr117219061cf.1.1791790827961;
        Mon, 12 Oct 2026 00:40:27 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9accf47sm429403466b.76.2026.10.12.00.40.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 00:40:26 -0700 (PDT)
Message-ID: <2ca0fff3-aadc-4dcd-93e8-df2ffbac08ab@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 09:40:24 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] arm64: dts: qcom: nord: Add PCIe PHY and
 controller nodes
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Yu Zhang <yu.zhang@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <20260915015632.283642-1-shengchao.guo@oss.qualcomm.com>
 <20260915015632.283642-2-shengchao.guo@oss.qualcomm.com>
 <asmkI-UO5oMtrqsF@QCOM-aGQu4IUr3Y>
 <086f87b9-9b9a-4acb-b18c-be37cd6558da@oss.qualcomm.com>
 <asyANRr8ac_SD0CG@QCOM-aGQu4IUr3Y>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <asyANRr8ac_SD0CG@QCOM-aGQu4IUr3Y>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=QdzzLcbv c=1 sm=1 tr=0 ts=6acc8eed cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=BjiBRVP3CVE4MUQrlPQA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAzMCBTYWx0ZWRfX/gJpSQZcBAcL
 1xxr6nS5NGQP6Q/GN/v75MRdnuDw/sFZuks2IVia399NUwPDSNx6gfn8UVBGSww/BLXmUJ9UGUp
 cmzI5vGtoHoMchXemdMcAe5bwjgEu9dnj8i8m3kVCioP2yoUvOzXDoGGEqwz2jFjXiMhw9mvsG/
 HrC6u58inpuT8uOuAkYUi5SEEpbgWGzQUENKTmmfmcgz8OKEE8o9aRGPbtITx6ekMAod1hEYWUP
 t2s4YumDwsmxYeX/eKq04jHyzfKG6aarpJLMfcJ9NdgqvcedQZdBDWWaRCjMILoCSzpb69UWyO+
 NmRPHSVt+YDs++mLRGWL7GQX38NLl9kJmSsZd9ois15bJ6TN/U7KhWjQ5nGTqwAS+H+Y5CLytyz
 jP1sqJYFcpw+wAD2MlSX8KSS+LOWKIUz+jWH5/09ec5G+tn+6Ze6KXaytSP/3JcvcBDo6gstpry
 /SVss+U4NcrTArx7Y+Q==
X-Proofpoint-ORIG-GUID: 5s8Q_yxV7-UQD-5iJcFH6_EXtpG18Guu
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAzMCBTYWx0ZWRfX/6YnmbDJV/Mx
 esxPbROfiXTe7neXTmjq8XSQiIsRbs8dKYyp9yEvcVhAAaMbcz/q/6cnToln7ZhvCfOp1+g01pw
 bgofi1zpBzAZfj8PxfiDMA38sEtEIbA=
X-Proofpoint-GUID: 5s8Q_yxV7-UQD-5iJcFH6_EXtpG18Guu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_02,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610120030

On 10/12/26 8:37 AM, Shawn Guo wrote:
> On Mon, Oct 12, 2026 at 10:52:34AM +0530, Krishna Chaitanya Chundru wrote:
>>
>>
>> On 10/10/2026 8:04 AM, Shawn Guo wrote:
>>> On Tue, Sep 15, 2026 at 09:56:28AM +0800, Shawn Guo wrote:
>>>> From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

[...]

>>>> +		perst-pins {
>>>> +			pins = "gpio2";
>>>> +			function = "gpio";
>>>> +			drive-strength = <2>;
>>>> +			bias-disable;
>>>> +		};
>>> pcie0_clk_req_n is a SoC level pin function, so it has a good reason to
>>> stay here. But wake and perst are board chosen GPIOs. I think they should
>>> go to board DTS.
>> Shawn, I don't see perst and wake gpios are changing per board, for that
>> reason I added them here, but such requirement is coming we can move them to
>> board file.
> 
> Well, we have only seen Ride and RRD so far. We never know how other Nord
> based boards to come will choose the perst and wake GPIOs. This is
> simply a board level configuration and should go to board dts.

They never do in practice (for a good reason, the reference-chosen pins are
consecutive and presumably next to each other) and we have no occurences of
that in the tree across the hundreds of devices.

Konrad
