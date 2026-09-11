Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E0E4443C20
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 13:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789133703; cv=none; b=YOTKhyqYpOF8x2kQhQoasCS8dhBrLsKv0Vf0wKORkcKQQsD2kAOYkbBUUgcu8XF0yOUVrnGpKWUljAbf6DzSHqrhSwlPqlo1ppw7H9tnByKR/yNWh7m27HZFSIUKL+D002wdQv/GFcrdumfErmwuNHCX9DCLSWCuDdNg0kEfj+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789133703; c=relaxed/simple;
	bh=ztJJ8z71GuGpNXypLWHAaVbZFrb5gvtjilMWS/62OAA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T1dD2HhOiUH0RQ9U4sTIJxkFcNGMlm0YjTEGRIrDCjGSDrsone96JzestwgyMV4P3xBPXZLVQj+LksACNwhfS0KEnbXd84O6VlCwAlOr9MnnxcJxkHfKOWjyIZ6kRkmAt/IWmr58AWrn4bDDqzqwz8o+DQUWVWThB0WB4veVuqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b0CwuEQa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BVnvDLYm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b0CwuEQa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BVnvDLYm"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BCj79H170656
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 13:34:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rlEXIvgwRQfsHm7KtaBqwgRU
	nTtOOLNR+RQID0qlb+M=; b=b0CwuEQajB0dD0vX5AVMIENVbCA04WAMWp6Ve3DN
	mU7LG8QkJwsaoWqw/CYM1oZB2Gx9WmVEREenY6m2Vmj6k7zgncjYUlvySfSTOcMW
	IDBoDRpvRiQzlXfGzFRY6mOt9G1iskCzeSdB7jM/+8grbyro7PTkhqH1HX8Aokpb
	zN+BpOeSqbP//15I4BhRtJzawY5/g+MOzN4OyfDe/+lOp9QfCGmG7ZgJ0EYle1x6
	4T22vFumxhDUtENHdyltU9Ows0jj+PKlSdhuHq3E8UtcEwQ8DYTWU+zBdwb0H1+k
	gzn9G/RUG6st67G8U1A4yOXVr55ABerkEpClh95aJanvRg==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmapg24nm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 13:34:58 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5c7b0f8e40bso1127156e0c.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 06:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789133698; x=1789738498; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rlEXIvgwRQfsHm7KtaBqwgRUnTtOOLNR+RQID0qlb+M=;
        b=BVnvDLYmgeGrkohMSZejL0oa72qZVl/i9e6XYg355k1iLBQKBDvluBrsr55maKCw5q
         IKrO3C92R8B8gPl9LVYRElrmb9K5cejYqT5isPRVPeahIJUoztVIHU+c+W8iQgVsdpNO
         3nVdJLsnToztVjmBy4nCChaUMi5JZ6DUZI40d7UTXjDBplt++jVwpw2Rzozdjbdtw22n
         j0l/KITjUc66OhBvXOLeJo+xk2bvAo5nojDNkcrHnqVmBwTnCzbHy/08x2F2ryOsfHxi
         VfnWVH9Gclc5pkbrfHUY0yKDKPdZ/nsiPgDYxXIsiKSKfmPmmknhEf30gwHDKg59rZtL
         fQvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789133698; x=1789738498;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rlEXIvgwRQfsHm7KtaBqwgRUnTtOOLNR+RQID0qlb+M=;
        b=VUyA+EbDeVW5p3Lkq0qkBk7HQ9jMwNUesDSeTacUqfkdTEpzvoPoRSLSunG0QN/Fyr
         AZPNsVwdSZhqncemipu4u/m6TFgT/8iG2x6WEf5jKtp9+7s9qZW5ygK41WLZ5uOemzaU
         fKEjxtA85lbTFFEWSY//D2liX8ZLKUaliMwZXTeAW++aXH50Zxc7GUyuZgAtfU1eBpr+
         j8tcmieJD/88pQtoXdA3Nd3qD+5ZCPHCzuBI4vOSuwyA4uNQMNBXOmyeUkFD7KRaF9NF
         7/ypv8gt4kDmvgW+CtzuTetv18SG+BZiwZwutLH4B446aJW/e7Mv8TMSpiX9A8AVudD4
         YIvA==
X-Forwarded-Encrypted: i=1; AKwUvBwAUyf7m3zfS0AYJn+c1Wlt+MSFVZwzgxmOtQbpvQuU4kS99Fl1CJVNzKGsfraao9sWV0g/nV3Bn9V0PRQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lv85OY8W19E5lsDg6g0YIYEOkIa0jdb5P/FXUBZMH9Du7Gg6Wj
	hf+zZP+MCWkCJ9iyTJhTsZWDcKmr5RfBhR2deDNnyfmF8yTM8CyTUzEO8+vPGCFdBlE0ZI+vWvz
	8ZAcCD0y93GuY2Vl89S9ntgtIez9OJaeCMXBtNDHMLY/3NhATL+APxXxSq2VbVdq2X2U=
X-Gm-Gg: AYBFou0uw0/pXn7sRRifZztSEkpBin8v7v99+MdBbyynpUjO5v++aqt1bIMPc4SoEKq
	SbrJ+5jhYo+14dTlonedXl7Ngj3G1N0fnifGTRIOPvJ3rp34Nb8FbLGWhdIu4iGhjaCYKwU2DLj
	szRIcLhTRZwEHfUZdGlATRrS1jVffUTXccEJsf4QTDai0S9mTlqz1eCeZf/DWwd5NUcdZTZmIHo
	z6XPOo9vp91TfnvJeUn2IoI3sGtvBDakCJPw6Sty3G5LeNt+dbAe8fCIUdmJOPLUONb/LLlRwF/
	GeC5fMM7ZHUcmm2NaYHOc/H9bDzM2Aab0sQgJbioQHtXZjewqWfo0CZMnLUE9g4vR0IRB+1zJbU
	D33DMM5oou4YCnw==
X-Received: by 2002:a05:6122:c8f:b0:5c8:2852:36cc with SMTP id 71dfb90a1353d-5c846277c7dmr5049701e0c.4.1789133698199;
        Fri, 11 Sep 2026 06:34:58 -0700 (PDT)
X-Received: by 2002:a05:6122:c8f:b0:5c8:2852:36cc with SMTP id 71dfb90a1353d-5c846277c7dmr5049629e0c.4.1789133697651;
        Fri, 11 Sep 2026 06:34:57 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb357288sm6149026f8f.29.2026.09.11.06.34.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 06:34:56 -0700 (PDT)
Date: Fri, 11 Sep 2026 16:34:54 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Monish Chunara <monish.chunara@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Ulf Hansson <ulfh@kernel.org>,
        Kernel Team <kernel@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-mmc@vger.kernel.org,
        Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 2/3] arm64: dts: qcom: Add SD Card support for Shikra SoC
Message-ID: <lubx7heokegundvb5yndi5g2kaw4jol6tgegyt5qt22axf4piq@jacg3xx3ooyg>
References: <20260911093932.2376058-1-monish.chunara@oss.qualcomm.com>
 <20260911093932.2376058-2-monish.chunara@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911093932.2376058-2-monish.chunara@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: FFjFbUGHQp4L85OgzjFZILw6-c2JWV4p
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDE4OSBTYWx0ZWRfX/OXjg7rGvaRF
 GSkqNCyG+aabKKDx8vbl0QjprOzPO/Qa00ea5KkiUAMTl5LNj9miVxUt3SBvIMJDh03nESwW+bF
 x7T0hg81tlvgWJhHSMMtu/hKhmTBYGM=
X-Proofpoint-GUID: FFjFbUGHQp4L85OgzjFZILw6-c2JWV4p
X-Authority-Analysis: v=2.4 cv=DLoacCNb c=1 sm=1 tr=0 ts=6aa40382 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=Tcdqd_mqXDpkZi4He8MA:9 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDE4OSBTYWx0ZWRfX5Pxh6ZsQ9igO
 S5SgTktkq6wyfWuqgJbhNwpTdARztf9pmHPzC5/hQvIfr8RBVfTxZV4qLVLxc7O4B2u0vnw+Ynk
 A45fyroUPNTQXA/bttCcWMr0q7hb2dt6efgxzcedUoRl5h8fXlQ9HhXOokoddS1AP5Nf9fTsYMQ
 iDASyQ8WFH2Ez5IzuaZpgDCgvgNFFpy7WtqUD2IoXC/4Tca5t2y3J+7+yvl3zMqzom2BfNE0HT1
 pOLbJA3gMCHby49aksAJ4Eu00bwXcqUDhVjQ5OK6WU+N1AuWoHbRJqUukkrg2RQ8Aeh6ZvmmygG
 GlFdRw1mlEcXyH/PSKvDunyEU10mAbRtiyipxu5ydDrKXFsScIoSNMob5zKvC7L3HCQQxGa9pYT
 mJ6uUZhb0xMZXY62kKmDei3uac+wiMq1I+hzVjGx/xseENkcJb8oMpDeC9cgkB9fY6FCLVmQbZZ
 H+Wi5EjjKHNhBCO14Qw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_04,2026-09-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 phishscore=0 adultscore=0 suspectscore=0
 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110189

On 26-09-11 15:09:31, Monish Chunara wrote:
> Add support for SD card on Shikra SoC and enable the required pinctrl
> configurations.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
