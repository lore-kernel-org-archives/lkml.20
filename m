Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9679A456E10
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 09:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792144112; cv=none; b=IEVogCWEkvbTTlV0NSow0CdoXsOzrh+pEA4cbkgLbHZFryAdNyJSuEguzmmbHB+ll3VpmYx3zF/FjuhpEiWiw3/bCc0rgxPO2hjLSJ3V1XEl4gnZLT/Gkf7wSTvcf5uvkRIqhaHHghhT/84gCiBwJbBUNbwg89s4zRBnRrsd1Qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792144112; c=relaxed/simple;
	bh=IPB0oQRuXmO7WrlZ0VQqDmLES8GViOkLv24cXWQmR8I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SkM6nR4ZGCgnm0OTB0En7OqjMWRScgu5Px6e9N0GtEFC/LjFEo5yFejfEF3zb9ax3fHMpErIbISYk3T6AYIAs9Rdtw4D/Wj3dfuUMzKU6o+1dGSrG3OMqEpcK6Nc895CPOJP6mCxOKJe1m79v8muXi2pJ2votp+eT8OP/MLGZLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QSb4TIyW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FpfU9x94; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QSb4TIyW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FpfU9x94"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G8m0kv2219240
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 09:48:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TJbrPeFKvJFiVY/OMn0JYmUGNzmjz8KjLkYWLdPrWY8=; b=QSb4TIyWpH4wxXgH
	K0gXijTyO6bMed+/ymp6jV1C75Aa6WU/VXXbw8e6KAnUXVPhuPsVytnCzU7W6Sdo
	JkZfwv8uqUMW+giH6QDETVu345ny+kR24LFb/iAKtrUE4MTu3RvMHCqcZUJy++D0
	fo1zr174gi3IXyz52a2c+paatz2acUO4QY63dXnpLv1ZVXeLgfTRRcWFudjhMxA2
	cFpfykhr4hktMESrGURyuNx1wcmG2xPqY3woU90lCj2yIuBTwnfR34H3SsrIOxQt
	/KkqUjy1LyKQxMzMhYcsG6zkvECeIP5r2MBlf2wTsm7vBczhxYaloDEirfg+rgmj
	sQq8+Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb19m3ufx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 09:48:27 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5350d8a2368so13769821cf.2
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 02:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792144107; x=1792748907; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TJbrPeFKvJFiVY/OMn0JYmUGNzmjz8KjLkYWLdPrWY8=;
        b=FpfU9x94QfHZYyz1qGZwYuPZ2NcY/bgIbuFh6arOAD1EQhVnA8cpv2klxI4mr0vfvo
         Uc50cn3kKkpty76nfmlqEtYL9xXkF8+ma3ZiqquzPeN/vIRIHByJ7VgrxDWgX4ed7ChG
         p92QvNJUNyqsaXOfyAKDXY1PPJ2ekvKIc6rdwrGYyylVtgIfaGeEqu5+LQwA8KKDFzzi
         pXi6VN7xcNrJ7cAIWv+yvjFyDZkVF/D6ZDX/ZUI8KjFn8ZcMHou06K7PK/qvUDvURXkF
         hsppl8dowHsjhywOSlsxlTFhCpXDxtMKCucrUGiNwBY0t4sZMinMF1J+n4sWAkIgVK90
         B7iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792144107; x=1792748907;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TJbrPeFKvJFiVY/OMn0JYmUGNzmjz8KjLkYWLdPrWY8=;
        b=2Onl51bLOPFsZ7DAJdidoiy55KWuUgbYVrMcDuCVJfw2hAfUWlHHRRWdJqWW9/wLb6
         h2f9a0ZW0Iu5VAxYjjFxnq34/hRsQbgwDhiHqA0/RjXEIO20IKSfNExXTvqSqxhzPH3Q
         uL/YVnL/X/oLERWjlU/4hiqCmb6aY8fyA3SeAG3axb2nhuVZIqC0QzXhavbNfbfKtEeZ
         F/M1Ii3lArwa1R+j3QhPW3OfyiJEtz7/xbVoAmQspS57QgXhOirPCzKFKe7LEiS5yZWx
         u6l+8xQIlMkaZOGfEev4xJxfPxriWJhxElczH8O0Asd7o7Yi/6QFN5L2VeAHQAIuxoxu
         WIqw==
X-Forwarded-Encrypted: i=1; AKwUvBwVVwhaUgck4RW8XpKjUASb+gG4N3kEFpZWXUjHaauw4j25vPKU0le0uMc7C5MtDihNvMeKO9Ihgpsew1w=@vger.kernel.org
X-Gm-Message-State: AFq9FYL8bEMmpnBcW4vuQHKHk6GWw2mabRmQUPolRqU67w4PIqxg7ZRv
	R3cz27y528VRvbWzCM3NDhiUZX2DWXUN5znoKJtLwWIhgCqS6d06oDNqQPKqNF2mIj9e9gnxemJ
	QtTMordi9uQd4QORF5ML4YAJirUqIKfWtx57bnRaSs7mGsEwT0PaAmCT1JQAflfDjH9w=
X-Gm-Gg: AYBFou1k/gACEMDxMC9Msi0/J0bSbg/NPaybqdLIYodwNDRfWMXdEdOfMCXg3E2Agle
	++SZpyzULkMMOxi4TYj7L7lYhJtbwBDG7mRjXtZl7N063zA/bL+maa40vnSqC/6s5hSX5AmJ+UO
	IcYp5Udpeg6gxxGGezfMX4y7e8R0MXPe5wobc71b3uiswdIRwYDOE7MZmt5hRHtcWINIVv3MBuh
	+tZcqfMBGUHnVX6VPnLHSAR96B/creMgoVpepMAPZ88XMSu3z8nacG0mnIK4HYI6Ceu70Tg8QDi
	lCFaS8VaZc0htTpAzZ6Zj0n87vkxhDZh8+f+PYaY4O+BzwM4SGO/pE9lR0OVj00A/qMHzECLcRn
	hbKped4yAqhsg/wfBsNpeNw==
X-Received: by 2002:a05:622a:e0cf:10b0:533:6948:3d2b with SMTP id d75a77b69052e-5359f4990d7mr283776481cf.1.1792144106492;
        Fri, 16 Oct 2026 02:48:26 -0700 (PDT)
X-Received: by 2002:a05:622a:e0cf:10b0:533:6948:3d2b with SMTP id d75a77b69052e-5359f4990d7mr283776191cf.1.1792144105858;
        Fri, 16 Oct 2026 02:48:25 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c408e32c075sm57355066b.11.2026.10.16.02.48.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 02:48:25 -0700 (PDT)
Message-ID: <aedf3717-338f-44fa-9fab-9dd167aed1b9@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 11:48:22 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] arm64: dts: qcom: agatti: add LPASS devices
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>, lee@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, sboyd@kernel.org
Cc: dmitry.baryshkov@oss.qualcomm.com, alexey.klimov@linaro.org,
        r.mereu@arduino.cc, srini@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1790114902.git.srinivas.kandagatla@oss.qualcomm.com>
 <30285f0267cacf2dc2f7c19cfbb10bd42d50310c.1790114902.git.srinivas.kandagatla@oss.qualcomm.com>
 <43344f93-26ec-4a00-9249-6eb9423759c9@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <43344f93-26ec-4a00-9249-6eb9423759c9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=aLdlOr9m c=1 sm=1 tr=0 ts=6ad1f2eb cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=N_Gd9SB1QsfJXT2d5d4A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: HCyuQSldjI7By_frQOj4Ebl3QsG3rO56
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAzOCBTYWx0ZWRfXwLCBxOFcHjyu
 8s3/MSlpIQYpZJ2SbZDQFWpleFtLxB57rCFRYt0qEAX2JMad34DEIoeiPos//4nbgFbsFGzTiwz
 me/YF2PbO8S7hFbCenpeGs4jaUin/t8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAzOCBTYWx0ZWRfXzAW8aV7yllsm
 do6mqLjoiAIY2zfu61zJwOGT0g1ErhHdwzXhw+Mv8nfNnHDQ2dhjfI9x4bKeNbM4Bvg0y+0VB9u
 n6cMn5qUemrfAJrLV0QbzO614kP28QdsVAqLUMcRDsMxbqa1w4exEts3nQKJQEebBgKSt9ah26q
 Jj25iEdo16K78oNI7aVSf/mYFCLtP3ve9E/pF70IVlQrfbR2CUj/OcwvyHgChPvvYqMbR3V7lMo
 2LPzyfaxrPVtyt2CVfCC2/Zqmmj1Z89LUfCvmo+vaF/5f5O7GQ5yBnzk1sHAeY7QJdEw6vBp6TL
 uAaKT5IkSPv+DnbILQc5ACY3s6lJNU1sqTl4wtgtfqA83M/seT1XGs/raUwYsRbywziiIg7LM1B
 htwj3DXFnk2mwCij9j4JodgRBUo78gw0Pdy010MnLSEwlHawOKO8R7ia+NVpoDdhVq8INY0FEgg
 dJvB7zvGRVxVEqfQPBQ==
X-Proofpoint-GUID: HCyuQSldjI7By_frQOj4Ebl3QsG3rO56
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0
 suspectscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160038

On 10/16/26 11:44 AM, Konrad Dybcio wrote:
> On 9/23/26 12:11 AM, Srinivas Kandagatla wrote:
>> From: Alexey Klimov <alexey.klimov@linaro.org>
>>
>> The rxmacro, txmacro, vamacro, soundwire nodes, lpass clock
>> controllers are required to support audio playback and
>> audio capture on sm6115 and its derivatives.
>>
>> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +		lpasscc: clock-controller@a7ec000 {
>> +			compatible = "qcom,sm6115-lpasscc";
>> +			reg = <0x0 0x0a7e0000 0x0 0x12000>;
> 
> The unit address must match the reg address

with that fixed:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
