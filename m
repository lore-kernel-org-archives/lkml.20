Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64B793D953B
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 12:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792153518; cv=none; b=bjPhRhjVF915ZNkNSM0wOsWSm6A8izCLKHwW8Tjk4qEnViNcFadnrFgg/HbejSvlciYnfRmJ93VakMoX/RrLpAeD4fbdKpJy/frzJwjTACSJaCxgSp2w/LuqT69lX33OjWCp2wlLP7xzq+WCG+AroAdW9+GtNa0iTmnBEktgYFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792153518; c=relaxed/simple;
	bh=dc+PAuzSp05COzPTtZ0GpZ7Q2ZzEoUEbj829EqBWFyU=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=L1sDt3af5+Sw/2YywhXzHVMoh3N1i3tFaVZdVBErCO7N4BYOzTMI0O24jAR7kHjZwaxYyCFRkLBuYgt1GJRsBvoQPHECxSjt+ZNpgsaz85A9HxhzB96glDzUxCzX5xrPtMribk2+YhKQye7Ag6JsckCPuOe9TIG682uSDQ/B+nI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pZcrHI/N; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NH2hIn6W; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pZcrHI/N";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NH2hIn6W"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GAA4iL942709
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 12:25:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L5KKnw3ZnqYuCdQsMnmUoivXJzAJ+F0aigtmDLqNde8=; b=pZcrHI/Nn21/Kc0N
	jrfmdJQXG+JchReAoDZB7DGEIM8h9K520r3Saz9pktARjYxC0gp4Fpghm9zpRB44
	soA0Wk2vNmaB1KOM5mxDOkV8Of4sUvEDLfT+Z33qresL1ne7zM4bjQj0OkEoNj01
	9XI4c9eYlPjYf19X3KOoikHz2MOrsq75/HXS1SwN9uHdgBfHFiwVf1avQ5AWzbIZ
	2Nu/C+RRcfcBQSJs8zXxsGCKJyU3HoBWCBnscsnZmCX8OzOXdH1wYoigZcl+lW0x
	5WGJaY2P8fplPqmFKTqtTKYkorYG6p9BjFVhJjOpGWbJGmILuJBr8ZJ1v6fup4GM
	2ChiDA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbhur0ey8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 12:25:16 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc7d2ff0087so5671162a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 05:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792153515; x=1792758315; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=L5KKnw3ZnqYuCdQsMnmUoivXJzAJ+F0aigtmDLqNde8=;
        b=NH2hIn6WLTGPN5frhpTxv8cwaPoXYJRoGYB55nDfk+oOQ3XfnElypOSRS/5HhwG+0+
         aKmWYjqhkHIfbN0BTzNBl6ipill1nsPdDf/9IuFQUKwWc7lpWsLpsosJaZqtcZYHfn9b
         JEi6q3ksJCl/8rCvha8NQZXoiVA8uZiSNpdepn/XXbMnWFkV79BQbJwFMHh5nIOVwwsx
         QHgNMiKEnjRM5L6pWjWj7SlgUe9hx3HE/18WVcT7x43W2qO6wVtzxhhKw4wy3UG8HuIC
         0D2lb90kchJsvCeVSb8G27SApuI9nASvVORj957RvTc7U5HqCaNcbYL5kwAJd+ytxlk8
         cr1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792153515; x=1792758315;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L5KKnw3ZnqYuCdQsMnmUoivXJzAJ+F0aigtmDLqNde8=;
        b=YsfnpKXjn4ZQzJDgrlKjR3Pwal9gFrid+HAyamxMBQvhBznOgKmZm4ihC27Qb/KOSf
         lMUwjbFNVpKaiTuZo+gKhYmxKJ5+GTakVGVypxEQcflHQotAT8TvubkSBpaS6jApS3rJ
         DIh0p/OrcTNFtmP1p9+VY0bdynIKJ4S8dOSJnsTPHrHADaUyv8jReJFjLOkj4ByNnMy4
         6lmV72d4RetdE3lJb7LLtKO+a9eCxHk2JJ6nSJF7XbQBoqHkDc6ddYRQ/hXsfJf9SIe+
         1b4ccoA+hAGSWZHV1YzgB5ZrCOVFk+wO8kszJPAZhBbSnpDqf7R/64wbf9ioh/Yvopoa
         P2+g==
X-Forwarded-Encrypted: i=1; AKwUvBxvkNhTD88egBxNHsYnEdTPZipJba+/n5DLewqsy07CPH69pfAGlUYaUShpGrPy+NCyMwNCiHxw4uShuTQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYL+OUzZQc8jdQUefexhlCfirX2wdflbAtYrA0SWUsWpXzLDRYrG
	eLHW4nSrBnJJgCxS4Wn26BD+K/8zfdH0ghokm53vn8HSImGyMUrjVlHEWztVr65gqeZsSg9E0kT
	uWlfeNBrm4wliri/qY0Yv5XN+8l4j+hwDCK0MDsj5QkabLwAE/4364QrqXmVpRgQldTk=
X-Gm-Gg: AYBFou1CaL83iMKvxd6d5UYohMpflna5l8lrSxqf0e/dmgrMWZYoF4CnTweFyupaO8A
	Ref9SlTvXdB2jCaCzDZNQcSCdfMYdU6m93qsLxOK3plYlNfSFpwA/X5s3Gpom1C3Z7I8Ord73xG
	qIVxLbTXE/My+qjf7/AvqzhE/LXRx4jrWb/ILZ2icIJeoSm2YZYA6xrVODQ8bPsOUS0Plv8vD/W
	D+3/VWg4m2wYf1JQhj9dp+2qvCyvNF2kDpDcV7UG1cn06f+S6/KXrbzROtk6fBti7L4pBQyRTqg
	GI1NCiBHQ2hBdnxM1nDgnbWrTX6y+qiYLckoMPhmQPBMo47zsKpd/R3eEZXsdwxuQh+P4wHO0sq
	efhGrWZ0QSdipZ/MA+qxchbsIZnM=
X-Received: by 2002:a05:6a00:4287:b0:89e:779b:d03 with SMTP id d2e1a72fcca58-89e779b0f37mr3987774b3a.6.1792153515217;
        Fri, 16 Oct 2026 05:25:15 -0700 (PDT)
X-Received: by 2002:a05:6a00:4287:b0:89e:779b:d03 with SMTP id d2e1a72fcca58-89e779b0f37mr3987742b3a.6.1792153514715;
        Fri, 16 Oct 2026 05:25:14 -0700 (PDT)
Received: from [10.206.111.19] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f57268ff1sm1007172b3a.22.2026.10.16.05.25.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 05:25:14 -0700 (PDT)
Message-ID: <05a03228-09ce-4521-b596-4e9ece57f4ac@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 17:55:08 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Subject: Re: [PATCH RFC v2 4/4] phy: qcom-mipi-csi2: Add C-PHY support for
 X1E80100
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, geocausa@gmail.com,
        Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        David Heidelberg <david@ixit.cz>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Suresh Vankadara <svankada@qti.qualcomm.com>, tjose@qti.qualcomm.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261016-x1e-cphy-rfc-v2-0-377654253193@gmail.com>
 <20261016-x1e-cphy-rfc-v2-4-377654253193@gmail.com>
 <010f8a27-e058-4c8b-8681-24df30c29853@oss.qualcomm.com>
 <80314471-1913-4dbd-b91d-7b25bf4b3b14@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <80314471-1913-4dbd-b91d-7b25bf4b3b14@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA0OSBTYWx0ZWRfX72Jw4Ddyursq
 pVrwYa5wgY4BYhGO0zWPFqoS954SDgfr7fKKYKUZRaPYyb+5XFlYg1tf1tk7bp00+PPi1VD+HF1
 e5A/FOKJSwZhSNryM4kZnrGH9QzMZxtOSY6z2iv4gwnQspymaHMDRtAlj8CLi20YReB4of6WWtQ
 RVs1agMgsQb0NBKh4WctnGq6QSrUq7UCC/4GFSeFnzDSffXPhba+IThRPBUVwM92WUpvrMJ4VQR
 9XqtJLKZDUh38SzM2kX0RHmRkzhC6jD4uGR5G4+7VK60wWC5fe4gR3P+Pl+4s2Oo+Xhrye44gN9
 Z8zWwE4S44soe1+6F/k3xrmkxp1XsFBoibycnpYbLsOtin7jicxOmNgXE1bsIfVnnK4VyQbntEZ
 tnUbz11CH+C2AuvHc0GKUmWxQLy2NRtsEJ08DnAxxtzIQHL9g9xcA4gF409bM/ui5S6/pxNQCjc
 Cz5CtYh8zOXpePWkB6w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA0OSBTYWx0ZWRfX2MFeqEh/rNZV
 puaW7cHlauwWO+llFBs6+8pUGbOk2/+BMxzWl69IZNFpLOj5kHNWdx7y1Q+PyFeX22O4px/GCCm
 QGN1IsCDc6cRTrE7gCgAPd0nBVt8o5Q=
X-Authority-Analysis: v=2.4 cv=PqsG/AM3 c=1 sm=1 tr=0 ts=6ad217ac cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=A2W6AcXvy7-QRKLDUaIA:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: Pj0c6-TzCwcXZhfxkOQkUR0XNpTGd0tY
X-Proofpoint-GUID: Pj0c6-TzCwcXZhfxkOQkUR0XNpTGd0tY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 phishscore=0 clxscore=1015 malwarescore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160049



On 16-10-2026 17:35, Konrad Dybcio wrote:
>> Can we write the delay value in hex as well, to keep the table
>> formatting consistent.
> I don't think delay in hex makes sense to a human reader
Okay, that's fine.

-- 
Regards,
Nihal Kumar Gupta

