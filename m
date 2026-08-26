Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D0EA41D22E
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 13:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787751082; cv=none; b=s4dpnnyNHDcOav1BLzVUY/jQreZd6iXtVXAoZWlm8+WfCxZm02GQX+08TuQGkNyWS2OcYu8bQeKQosWf6rUOnYGEMbXZzJtL0uCMiSSw6e17jN9EWm7AWMfP2yYzGbQezZEoM9QE7ceilazAKqJtR87NFwm/cr5erqQGkkHRbfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787751082; c=relaxed/simple;
	bh=fdaPCKAt3wQcUSqM0QgVlhzUnC27158ftVMq1DkSTBA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PjXl9VFqeDHqdmldPLrqd+cRIkURldc8+F3aAy2FnUu48GhfrEU+4CQm/elU1Hmt+oi+z/+u5yi4StbbX4OEAkjEU8KrInm/aVw1zF1BM095j8NdCSLHFgCoRW9uOWCBuijmlSkDQLwxW27umN1ozry4d6IdMH+VGV27Dmm+qM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M7o5vFKK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DCitXS9d; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M7o5vFKK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DCitXS9d"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QCBq8X3898934
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 13:31:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9eTNwTlaNSB9i/d76Sx2Ndi9
	H4zgRZykgqMeSejjZHA=; b=M7o5vFKKjAxGQ9K0jJbauY5hrNX07jlEWQ84WMRl
	umbHE1yIVt+FY6YYs3O9KPx/+pLHRQ5Jx1sPc5ZR98cQjPEMIwjy0mvuh6pcMpd7
	r2ALhEmuNUbbV8ymgPKX7PlIC7SONI9Ucc42lmhAiIbe2CLwBnTJ+ctk392rI9Ne
	Hrs3SAtKkLWq6jVwR63nzdE0yXXCR+HbvsWEs1gbPqQ7Lq1QWP9Amk1OFxG+FNzq
	73xnGOXZp7Av/YwX1sgM9vUHcXNbEiCZVhpItxHcinAv1Saklq0Wo9qF7yxNwqGK
	KI+aHNzPir35XDF2IQn4zIH60ARyVfx1DTORjybO15pWkA==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9uthsbg1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 13:31:19 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7f1da5e5b06so1867594a34.2
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 06:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787751079; x=1788355879; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9eTNwTlaNSB9i/d76Sx2Ndi9H4zgRZykgqMeSejjZHA=;
        b=DCitXS9dbekcrayrriX1eWNBdc/U+cOkyH6/mE74Qwsdj/ktJ3JJ5x88NWxhNgP6HB
         b3KpPbQq8yhB2/HmtKrGXxckhQUarrT0JhJt+Hu7irUZhvdCH3Tk5YAvz2cvy3aAiQmC
         bCZEW7UWF18XnI47ofvdNA+esjhbIVGVxjMneckzWssyFNUa4DhCjfr1fb6bK3Y+Zlc+
         SKxFU3eFq5r8lt7wcBYs+ts3rDo2uhzGdO+EKlNs6LfFVRxRcD0AJBb41qTmLM3lNqxo
         MgXi2fENmIW4J7hsCL5huUrZS3HkECzuaejyGyhai3zEAz5D6mqojKSIhM35ic1mGmwj
         UGiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787751079; x=1788355879;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9eTNwTlaNSB9i/d76Sx2Ndi9H4zgRZykgqMeSejjZHA=;
        b=djaWE1zDv2KqjNwScRBofOcxIwvJ1atYYFuD/+ua/q3tglnJwuYjV9+P8kVtxR5Mka
         DvQS+PPDAsSXMLsJmon1R90qFkU6D/qaVngrETx8ko6a2tgivMfv8FkPmm/G7I9IZo3f
         P/oz/zF8b7zfecZ3tx7NxQ8nK+9SrmC/a4CusoWMjedg2p0okuBAly/ubTuMIsw9/pLS
         zYbgkJRhEOcCzOiKbGb6jPb7eKpW3RWCRW6BAw0jcD6hEY2NwxGvZ39L0EGlgfJRZ6jC
         IqzPLc/6jLmiSZNYfL/KgrxR18YYIRGSB8g139Vge6mkmfP0bvRCocMHT6kch5YXUcuv
         ukag==
X-Forwarded-Encrypted: i=1; AHgh+RqIzMUaxvcfAKsafbTgUK51nXUJx38yIDZ+nKmkSWS2InsKFkKjvcYZX5QYO6aA+xhKbZ7tOFAudPs87OY=@vger.kernel.org
X-Gm-Message-State: AFuF++nrUUPKzw4VbuvEgyvqQUddfn7AEuhDApMCGNwIgGWkeb7My3WS
	MmCQZPL1V1mwwfX2AqkLunwo74gkF2qkitIPvk+0qxCRPRr+q+VM2so9gDj4Sun9hhPdUdJi8IK
	+s+GSYolCwpdLs8OkYjLoirKMqWXzzthS9ScFxtG6pBXpm65i729DJnIeH4WwtflSz9k=
X-Gm-Gg: AR+sD12KEYIFDjIgiuDcUyI1EnVpCxMio3nsh4fTUMuGvP7Ak/hokRrW6ZH50X8RCw6
	fVKrNDSa8igSbLNIbVr1tIdFg5y3oYltPYlGRjDzSexlFJB1iDy4xZ9TJtpZKeSb4xscogh0mUg
	+hLM3jDVRPZl35KckBrYPC+5s9JrWvr+7PcWVqYDZePZn8VDEcx9uLX0dBNof5BOije/6DJvNK6
	/+34EkSdoEUKRp2S/XMgxQeRzHzo+USYS46xWVKCWnrLba926NvXLdB0BsO3MfDRskC8XPuRLBv
	6WEyqRyIC7dDrqrHzGAtkIvunmxEzb7nd1TD+TQ8T97rcmOEFtNf1JF+hn0Q2+DL8HEeri/crqQ
	PqAWt2/qI5ECmTUVCDIIk2oUGEErz4sCZOHkV9kIavv8=
X-Received: by 2002:a05:6820:c8d:b0:6b1:5637:e10b with SMTP id 006d021491bc7-6b1a035e489mr7181722eaf.7.1787751079269;
        Wed, 26 Aug 2026 06:31:19 -0700 (PDT)
X-Received: by 2002:a05:6820:c8d:b0:6b1:5637:e10b with SMTP id 006d021491bc7-6b1a035e489mr7181616eaf.7.1787751078689;
        Wed, 26 Aug 2026 06:31:18 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b1a2501bc1sm1722462eaf.4.2026.08.26.06.31.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 06:31:18 -0700 (PDT)
Date: Wed, 26 Aug 2026 21:31:10 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] dt-bindings: remoteproc: qcom,nord-pas: Switch CDSPs
 to NMXC rail
Message-ID: <ao7qnvBaHEGNz0Hs@QCOM-aGQu4IUr3Y>
References: <20260826102746.633076-1-shengchao.guo@oss.qualcomm.com>
 <20260826102746.633076-4-shengchao.guo@oss.qualcomm.com>
 <a986fdf1-4acf-44e9-8abd-46dc6928eb34@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a986fdf1-4acf-44e9-8abd-46dc6928eb34@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=EMA2FVZC c=1 sm=1 tr=0 ts=6a8eeaa7 cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=PG6VhwoxSfHQhqF9RBgA:9 a=CjuIK1q_8ugA:10
 a=Z1Yy7GAxqfX1iEi80vsk:22
X-Proofpoint-ORIG-GUID: GrhBEQ3Xl3NVosHsw3MAXMEQDr8l5fxl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDExMSBTYWx0ZWRfX2z0RASNtb+nY
 2i4h5GosF9ojdt8hDtiTeZTEqIIO9OWHV2hk0iF+Y/BnM3sEzXatis4FbCld6E3PAkk1puV8EHZ
 pHBGadSVv29t2/ys1+Wy1P7ZIa8QDfqQfhMal0tfw+p0OLy9VO4tnpsocQ/acJ/WvGc197MUQnX
 bygmkK6cmVyxVbtNOcG0YsTbdx01jiMzM7yQ0vholXARF1Jc7W9F55ZlA7TrtjbL5+1UfC+QjDT
 s9vAeeTLTISpZXEhQbLAtTp9FjIm26P7VwEXaCnnvHo883V/VHiPaW558Tcl4zguQ3P/MqyDefg
 s4/0/My05J988QdOSWU99aIASwOXqw9HjrZ1q089mYajtvlRHnvIRjlZgiCwf83wSAVY9qe8Vbg
 YVMuDoPMpojzVXOOaw7l3vRv2G7XLAnX7kbdhVewd1BllxWzTtDhWgLVrLg0rDV7xVSXVvVF9Xj
 LvbTt7SrnDwMz8i7GvA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDExMSBTYWx0ZWRfX78z1YRmQI1gN
 BbShJkYN8STCQnlqgZ28X5RGgMMEkmbWqle/mfJLsUh8FZ4EAR7XOqPagUyObfNj7DEO7UNdryo
 MUVKMXha5O0CQUOY+wyma+C10MlJNyE=
X-Proofpoint-GUID: GrhBEQ3Xl3NVosHsw3MAXMEQDr8l5fxl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 malwarescore=0
 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260111

On Wed, Aug 26, 2026 at 02:52:55PM +0200, Konrad Dybcio wrote:
> On 8/26/26 12:27 PM, Shawn Guo wrote:
> > Nord supplies the CDSP memory rail from a dedicated NMXC RPMh resource
> > instead of the shared MX rail, so the CDSPs have to reference "nmxc"
> > rather than "mx" as their second proxy power domain.
> > 
> > That makes the ADSP and CDSP name lists diverge at the second entry, so a
> > single top-level 'items' list can no longer describe both. Keep only the
> > item count at the top level and move the per-domain descriptions into the
> > respective branches of the existing conditional.
> > 
> > Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> > ---
> 
> Is the name of the input not "mx" at the rproc anyway?

Ah, good point! We only need to wire RPMHPD_NMXC up to "mx" in DT.
Thank you for the comment, Konrad!

Shawn
