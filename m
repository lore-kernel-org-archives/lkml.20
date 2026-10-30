Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793379357;
	b=Bm37aixdPqFWkK8xji0+DDuM/ytTTF/udSf8VW9V33QPjWzyserHuCmBY0z9xwxM1tEc
	 BFcU6P/3n3y6Q9IXpazXtQzSFXCmUrr5MbzjLZyqTLR9fX+0bFizMgrKSXqqddbg21OWS
	 pgdocBverGdUjmlcXCw3fct4cjNVa4VBgxlQs6UW7dB59iOCggnga9jmmz78tMF3qRNIB
	 l6mgLiWjmGYcYvdgERnhscDT4sIQltJDd+WAx0FGC4zHaesWju9S6MKg5CI4VyVEpPAGP
	 9Fw/Xn5XVhQ1rR7D+AwUWV1gdEAyvXcPqkBY7NL3oEqLrgSh1h+kT0riTArDhDO7MqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793379357;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ExZHM9hPcqVst3NbQ2hdGZ4vWGi1/65DTEs1IfXZWwo=;
	b=LjJhPt7A8VaxPbLgGQLzvqzNV+0hh4R7lyP+KsBVV9NDhyFhg3DugzNN7UyZ2YoCvIL9
	 IvGubaQ7eh38tCYhC/b+VzNji85ekAapGdCM2Gx3vf/FBJ7qvi/UA9ccOFfQZJ+0tCjgx
	 uuY+TZHE3zAro32V2mVTvaRSEaBykTmeK22ydpS8p2njCaIM+zCCJix42rILi9tUN6/tY
	 f1nYgEe6cpd969g6Zzfc++xGWO/fXBQCQ1A5J9dRlHJhRhz4vVRxECyJ0kp865O7c1LZo
	 Oj8B5MCPcmcJGIiJk2GjumaD9nFEmF9h7SpCePeYMVnmQfj94gu9LBtPDQjxGXHXMTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pcKpA1QB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VUwJzgz2;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 948FC606A321
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 16:55:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 948FC606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pcKpA1QB;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VUwJzgz2
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UERD6s3564437
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 16:55:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ExZHM9hPcqVst3NbQ2hdGZ4vWGi1/65DTEs1IfXZWwo=; b=pcKpA1QBUxKqAvAF
	4lK/xm6iCV9fsyY7HjvxQF79U27otjHQSDOsk8I6TBHx1rzXcSG6P6Sk1o3dVMv6
	iwS/xrcqK4vAylsQhKPjBB8PtH1Oi2T3Rco69SOIUBrDxgrPfgOnvcfnIfI7nQq7
	GGUcOA0EeKPoFs9gFW+t7pvkgPjK60RuQ3en/uoLj4biuV2wM4qcptDvFsaIkFGU
	cFb79XfkkHmVJ2M70Gvo68H3Vnm2kOf85EnQx9bbj3xz3d/jYIMUxr/380L9ZHgK
	e8pg8KHvQvVK4xkCIagbk73vhl/qq5Hz1YNu0ZvMii0ep9L3WdtuJxjKeNsBYsud
	NZGOhw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qm2c6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 16:55:55 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2eaf3f829b3so10331785ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 09:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793379354; x=1793984154; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ExZHM9hPcqVst3NbQ2hdGZ4vWGi1/65DTEs1IfXZWwo=;
        b=VUwJzgz2U8V9XOm4OUCG4W1Vr8jg0ULn4wyI4l7bmpqINQH0rKREEvMArV5gjRVziv
         LuLcQOQMmgPyhkLIKB+AkP1DCSwMIkI8MK0jRtNTvYPsJK9XWW2JQfnJKD6Sasck5iZD
         8H9VCqNNeEYFmpYZzLAFVAY2FtnZympio7pzrPIlFJKMmpQKoEPYsXdoVRYgkW/lB4Ej
         vDZJd2zvEpESjf5Kravzsw6sImea7NLDCwLRra5Wx+XUO9u/Py2AGSBd9BZ3f9vQQj90
         J+Bco3znVkORM6zGk6xp2nKKRRXUgqqlQ88u5v4fNMSX2hrtGz9edx3ZRb6VgYQfNQbT
         0+cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793379354; x=1793984154;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ExZHM9hPcqVst3NbQ2hdGZ4vWGi1/65DTEs1IfXZWwo=;
        b=QLHsUpSRmczTIy1Yz27BuKv/R6RajPzEry7MKfJAgIkEvCfdBgXtYmWPs8yBBwLRce
         tpwc32U0hLJx1N1J1BZe8V29NQetxTKyrHXEyzcx8Ihvg4rwz37aC1OPiOFF+fAvMVvS
         X0cglwh9VN2S+W9PR28bPoqKipPKDrdtkgqxD4XUGvfWatZDvtCe2ule/8Va9JvtUCeI
         KBdcQs04hD2uQBlwn7bjT+LTQk40jJrQ8Oe3yRNR4q4JgC99o1nysFvkKdaGW5EiSVZ4
         UkWBwhxvIHSf5riIM68dWRmgXwEin9Ork5AzgkarWCi7li79GU6HMG27Y80iOLTuVZ5d
         P3cQ==
X-Forwarded-Encrypted: i=1; AKwUvBxIIrvu0gZDJHAr/G07IyXZjkbyieF+Jj5LbS04WvxtGZD5UovgW52DCdYRKLBlRapoSbcN0j/X3JxXlwE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJSHNjK5YA8oojhW1NHxl05nY5wTtQyisPhzxRzi4t1x/8+JiLD
	AIUHJnSF9LkbI1uCMM5Y8+diqpWyMjCH0soFGRg02IbKqYA18QuD8nCEqN/mfp2LVCiZdUQ8aH5
	7HOYgwLJ0hOY4s5C659xoT+51vblevyeB06aZSh+sUTRp0emA78hFZKz3D5CkmFbeGdU=
X-Gm-Gg: AYBFou2FkrxhIHKtS78CDCf0+ZVpqUusCWxE0dPVr8kaOi3JFo85EDbEtlWGP/KvFfS
	D2eS9ad5W7Wrsr5Cs1b1m98jQn1Ap3d9Zl26jofcWOKQWdxtnQ1K8QDk0ABVupXCnbtFF/U1HlD
	W21BwXz1bANyZ0LT55+7pUJx5YNKEtUsH1cM3N/SAMN0DPr7TsA7mh2CAfsGjcj5YBa/TY2eTGH
	cjY4xTrWuaNcKt4HwIFdFFFSH25ytGjQYiVdMIGEPHRB8hy4Yx+GiUlx4Dz1n/drQ6PZna9PbMd
	j6DDojZ1uhifrbqO/yA1yPsHHHbhTdk3Z/rMVUh99We/kZNKUTrOBB9Et/h4llC4QEvpOmzhTCy
	+vO+YBkrvxWliC/2wLehk7ZGR96t+bjGApoz20HPqsoedOzxMrba9q27j6OEgzSUK8LOvIUsLyt
	Os
X-Received: by 2002:a17:90a:e7d2:b0:3ad:a270:a623 with SMTP id 98e67ed59e1d1-3ae8957452cmr2511751a91.4.1793379354267;
        Fri, 30 Oct 2026 09:55:54 -0700 (PDT)
X-Received: by 2002:a17:90a:e7d2:b0:3ad:a270:a623 with SMTP id 98e67ed59e1d1-3ae8957452cmr2511714a91.4.1793379353761;
        Fri, 30 Oct 2026 09:55:53 -0700 (PDT)
Received: from [192.168.1.14] ([115.98.177.53])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb096d3844sm1087439a12.11.2026.10.30.09.55.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 09:55:53 -0700 (PDT)
Message-ID: <8e78ac53-4dbe-4684-8f3f-00f841c60972@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 22:25:41 +0530
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
Subject: Re: [PATCH v23 10/15] media: qcom: camss: vfe: Add support for VFE
 1080
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Atiya Kailany <atiya.kailany@oss.qualcomm.com>,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        rshankar@qti.qualcomm.com
References: <20261028-kaanapali-camss-v23-0-95f250b18612@oss.qualcomm.com>
 <20261028-kaanapali-camss-v23-10-95f250b18612@oss.qualcomm.com>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <20261028-kaanapali-camss-v23-10-95f250b18612@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: tT7CwcFlYYr82DbncrZbSpRXeIaM4qb4
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA2NyBTYWx0ZWRfX3RJGec0BuVUr
 yAZvXpnOZ37zVTy3uDgE9p+oI6UqB9zHOGhnrm3B+XaLK5yCnNpp//1hqKz4Lu5mnijACluxTPm
 qsnUPKVF2UD0syPpjHmyfUu2ivzuqpA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA2NyBTYWx0ZWRfX1Nen11d0DqAl
 gNbVXhiFiiK/8nwSQwyQwNDzIAPLGOtWjy09Vwg4cixckpzKE5zN0QI2bTQBa9HELyO8Bg+3jR2
 RtoLFWW/zEQQqNaNcGJDk2A6/uA2NQ0zPkdGs+GbaGHL6Ak9xEgY+ha1JyUfVgX/srkzLd9gxi9
 zT3RjyUHEmCXLm54vEvgWAwGPUHni+R0ttlMMiRmeuI0xKScH0oP05gLv+oMuZl5Neuyx1yuxKd
 QZxETvbsFs8sjtVxG2y3ExntuPIdr0EbtN02iUyo0GPmHi7ZY1+UM3lym5gwTrE2MMOZm6DV6dB
 w5NASQzLMt6UvbxFk9s1Q0oN6V7rzyQ5a8Gano8jlZ9kXW1rA9BSSCE0pi23DS7TXpKLZx0ukV9
 lXtY2B0KGUlVC0A6okm3Ufvu/HXcLu6fD+BJY6nnao2K9OjZI/Ul/8dH5fbTnCiuM0SKgk+n2Ai
 JSBjo1uIMY81hQYcD4Q==
X-Proofpoint-ORIG-GUID: tT7CwcFlYYr82DbncrZbSpRXeIaM4qb4
X-Authority-Analysis: v=2.4 cv=TpVzFzXh c=1 sm=1 tr=0 ts=6ae4cc1b cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=iaXPdgsK/hfklW56b25dCw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=WYfwUfNkXDalausCwDwA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 adultscore=0 suspectscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300067



On 28-10-2026 20:50, Hangxiang Ma wrote:
> Add support for the VFE (Video Front End) 1080 found on Kaanapali SoC.
> 
> In the Kaanapali camera subsystem, the front-end blocks are referred to
> as TFEs (Thin Front Ends). This driver continues to use the VFE naming
> in some places to preserve consistency with the existing code and avoid
> unnecessary renaming. Support is currently limited to three output lines,
> matching the constraints of the CAMSS framework.
> 
> Kaanapali requires REG_UPDATE and AUP_UPDATE to be issued only after all
> CSID configuration has completed. In addition, the number of AUP_UPDATE
> requests must match the number of buffers queued to the write master
> while it is being enabled.
> 
> Although real-time TFE traffic is routed through RT_CAMNOC, both
> camnoc_rt_axi and camnoc_nrt_axi clocks must be enabled. This ensures
> that the PDX_NOC, which sits downstream of both RT and NRT NOCs, exits
> reset in a fully idle state.
> 
> Co-developed-by: Atiya Kailany <atiya.kailany@oss.qualcomm.com>
> Signed-off-by: Atiya Kailany <atiya.kailany@oss.qualcomm.com>
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

Tested-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com> #Kaanapali MTP
-- 
Regards,
Nihal Kumar Gupta

