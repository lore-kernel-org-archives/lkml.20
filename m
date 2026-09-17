Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19768585960
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 15:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789658105; cv=none; b=uWEDjJSiLp+LcsrdKpvuhvWTKCzg3qnHO863E44OdAdyXUmeRUL9t37PevQau+9UBzbAlM3bjylaWsSNQfGVWGiyxjiQ2HHxbKYRQ2ajdVpJoQoEPKARWARMqP+gJUuA+m3gXk5aKsaJAqQT+73YpTFhDInq2e863Ej1PiOjpwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789658105; c=relaxed/simple;
	bh=o6usTF1cUqrcLTldjDsw7thVeXzJFAV5ZRdoFq7CFPE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tJNKE9NyLiAJkC/qvmbKKRjbBxv3/JVilLnH1i6HcuiVg6KDYY1mrorNayVxpkoXJqsM3NW75eN2YtXJazqfuFeCd+fDPyjD/f8kUBl3/3QVPPtoApmZUfYZvrIaowyrDJazVBJG6m/JHBbx5DUHbLdnPd/++LHX18cvrSXE084=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J/kZKm9I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WyzNYYMF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J/kZKm9I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WyzNYYMF"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HDioKi1137748
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 15:14:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GjrcoUvvTRR8V2GjuvP2w4bl
	COCAR9ShGqbE3Pn80+U=; b=J/kZKm9Iht2olj0pqweHJ6QAqKiPdMJIm1mTX+wJ
	P4WARLi8PvC1BYZhPxmXX4OPy6b6klnV4K66vSkqF/SoBw53lJNWM/6+9aHAMxRO
	12FAscfIU6Trn8h260bcfDc2hV8SRVPcL0ki6OHO2xqOZnKUPzePlit8GuATfQkQ
	zYIds2b3ytsArH8/SoaMsv3UzKxjEbzZdY7uxuE1w5bopeURpwBKjr6En0V/YiCJ
	ep3W3O19hnR3+R5gQKL7yKv3D06kkdcs7wDX/0tTLeG7RBkIpsxfnAw4rJpfPXAw
	jZiBU/YGc+VQBknykP7HEPZSYp2Go0U12MlVka4T8AyUqA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gr8uw2tme-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 15:14:40 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-530d43c9a55so18467621cf.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 08:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789658080; x=1790262880; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GjrcoUvvTRR8V2GjuvP2w4blCOCAR9ShGqbE3Pn80+U=;
        b=WyzNYYMF1FrGtEsnLzxpTnFMfsYpKN9vVtDlOr7FNwOE8l1jVjrT32efF3ZYYhqtIj
         KHO6K78Wa33ZH+ibEpQEF5io7gBEc6fTj1nSc+WT5gkpSxR1W9xRnjOooFUJcQsn86PM
         wm8zkYrIXt7fC4dZ5BPpihoIn+nM/W5JDPn3h+rc8FUZFTAAm/SA0jBClXJOmMpnQpgG
         SWKZuSNzkZ9asbJpywLsW60ZaUEmeL/aapOzClgF9490fnOxTbWWW13+zWo1Wo7uPc8c
         fwLarh/a8kaMf/Z2EuwqUhSQgIp0LuaVL2fHKYWC4Je5mBA9o9w3DwzlLEo77Kqcicxz
         UHxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789658080; x=1790262880;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GjrcoUvvTRR8V2GjuvP2w4blCOCAR9ShGqbE3Pn80+U=;
        b=vg0R7CTfEz9Br5PL/xKis1nFPPRTZ+7nhsvt1EtPboN3LB58QGKqjl3ZuRtJcsfsG7
         IxvWLE7dJHRYl8hKymZrptcq4v8MaiF2JOgjyVLpH09KRKiIV8tmUugCx+9qPKnv1/lJ
         CL+SN1UvPemcb3NrsBukEiuYsJXgd9poFSqQf11/f52YFmQ21tgP6GTheDRffpe3hJZT
         rDKmNx73v2I7eSto6dL50iYQQjG4BfYMV4cfJ0lZ6IqtEmNJeOLB/WbjI/9U8wn2a7ex
         wfgTQPmDrAD2u+FQMNbS1d/cwxA3tg6gVTgLx2tOu7clU5zOLde/g2tNvkC1JjxltulH
         tNUw==
X-Forwarded-Encrypted: i=1; AKwUvBxu3RPZRQUYQYAKfRa5JYw7b9p3BZvCTGGGPz5fA/WDfOu8V/s0Itw/OwFP2MV9zNPMcjz9cCrO95bjnW4=@vger.kernel.org
X-Gm-Message-State: AFuF++n3VKUwWtN7bXVN/8wrjxOwYL6viR9ol1TtOkFxPHajhdAlTMr/
	9oJpoh/7kHtgeBk4qmHxsNlcFd87zNa1v3knIHir9C2EHhsiiDEwRAUVIVZ6vU1Y0dbBJzsO2MV
	4CYXoyv2ShPYWfGenDS3yl6Md2ifWOvK4a7WOWBnTPREr+3mlVGYmSMKKCU6z9LBCmrs=
X-Gm-Gg: AYBFou1hmOq2CaUH+iLukche4FuFcxYYcw0km72gMIp7re70Xd7w68/nYkpxfaM+Qdj
	ndM4ljnoCmgsFFcQ+IYAkLRdUHfTN5Ur96R2PpcdW+B01peqRbSU7iP6U4lx80bsY7xD5IowSsB
	vA9AkusaacVjUOkvrOwkOh0JEjpYXelVEObGC+eNN5MEyM/99NPhlpQvn1QOXx2tl+zuL6Jo3/w
	sjCkSbATEU1g+hilvwQWshjc/ptk7XBQKaM1p1T9TQrVmNsefiVXX9ca2Kq5ZRNjt86rnfokrIc
	iDuSMKlehmi4GyebiUAnD2IOfNVmgZy7pFApEonifqN09jl1QQoX+GEJaHTQ2mG5KgFJFmtrHNc
	s2UTvLRWiyCM0yT0=
X-Received: by 2002:ac8:7c4d:0:b0:532:9adc:63b1 with SMTP id d75a77b69052e-5329adc71e4mr10865291cf.66.1789658079825;
        Thu, 17 Sep 2026 08:14:39 -0700 (PDT)
X-Received: by 2002:ac8:7c4d:0:b0:532:9adc:63b1 with SMTP id d75a77b69052e-5329adc71e4mr10864741cf.66.1789658079232;
        Thu, 17 Sep 2026 08:14:39 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf1fa7dsm16206450f8f.8.2026.09.17.08.14.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 08:14:38 -0700 (PDT)
Date: Thu, 17 Sep 2026 18:14:36 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 11/15] arm64: dts: qcom: talos: Move PCIe phy and
 GPIOs to root port node
Message-ID: <lr6wb4f37c775a36xrbgpg232lyjdrni5tz2trdsitgfihchoo@r6u3kgtw5zay>
References: <20260917-root_port_v2-v2-0-6272b7caae9a@oss.qualcomm.com>
 <20260917-root_port_v2-v2-11-6272b7caae9a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917-root_port_v2-v2-11-6272b7caae9a@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: QVegDvrHzSSdSMbvPkqeIFlORPzASgT6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDIxNiBTYWx0ZWRfX93rHHEHlqjfW
 nBClfFc2I0l/787wQsXyph/klSNni1bC99VRAMe23ICghluIp5WXogzcjU5A/IkBKwcFaSJANdD
 QRf6ImB0xaonycwLNf9AOUbA32FWxWcIGqSYsyJbtadaBWt0W0wxYsvn5TVzS/+Y8Z2ivox6nGj
 HGMIncTC5Hq32vjR751uZamcypKcln8pyY/4E8iVmGtOuacjFAeTOuGAwAKT+4/WjB4B/kBN55a
 IK6PqsNIBFHzV1LCHub1H4yvY5WwOjzzxJQI/hvoxohucCNeWxWT/o9RagY9yiY7IDm05TY0xYY
 iLRWiu78eQfnB13Cd4WdjNloZj210DyilfKvZxCr76IluqWnZdkiv5HVXjSgJSQLUrhPI3qn6Q2
 WEXCp4H8NXPh7aEWhXdOYrt59zOSyWYSnkO47mZPc88kd4Mk3s853a8LYEA7p342U+zYCbAa5yX
 Q8A2tPwMNjZN96MZsNQ==
X-Proofpoint-GUID: QVegDvrHzSSdSMbvPkqeIFlORPzASgT6
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDIxNiBTYWx0ZWRfXxZcVPpywl81c
 8A4ERb4slYIfvm3YfyYbM6wNMfaQpLYG1Wf6ftdO7GpNcirrqKbjYjCpZrZbl+dl5gYbNjNk9ub
 F+kqXS/IXA84UFcEsPP7AvPWW/DullE=
X-Authority-Analysis: v=2.4 cv=dMUzC+Zb c=1 sm=1 tr=0 ts=6aac03e0 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=adJbRHicXYsKkr84VsUA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 impostorscore=0 suspectscore=0
 spamscore=0 phishscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170216

On 26-09-17 17:55:25, Krishna Chaitanya Chundru wrote:
> The PCIe phy reference and the perst/wake GPIO properties are
> per root port and belong in the root port node (pcie@0), not in the
> RC controller node. Move phys from the controller to pcie_port0, and
> move perst-gpios/wake-gpios from the &pcie controller overrides to the
> &pcie_port0 node in the board files, renaming perst-gpios to reset-gpios
> to match the binding used in the root port context.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
