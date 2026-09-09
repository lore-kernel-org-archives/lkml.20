Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F5E530EF68
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 11:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788954332; cv=none; b=I93tgu0GgBe7aJz0CIj1AJ9+W59dNSxNHqvYGg18suXIfS3BCx2gxSa6z+DfmN8hWtyczXqH8xMI747+V/XgMwj9of8+4sQKWSYxR9qtj9knsOtsQ0AGcbI4U2yEmC8zZSJk62YcHbGsjBgiTMfksi7/3Q70NgJYQTLSJnaACq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788954332; c=relaxed/simple;
	bh=w8t0PcgJAx9ctFVVcRI8rM3BIltwafJlxl9b/hayqeo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o0wLIP8SqRVb9S4DFvZZhByDcRdgkC3Yo5sGbxOChgV1BdzosMXg/XkgL7i+0nXrXHdOGzfMTysgzdaWUhvpC8Dhj9EIwuytAVIVNKYifoxyV40ZNVS+0uoryOXKCtryjeldx5rusSJK5cQ3B5kPKfmLOwcLSlgFrvJkGzxcPJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WVctFaCM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DfrKrV16; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WVctFaCM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DfrKrV16"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BU5gO2653421
	for <linux-kernel@vger.kernel.org>; Wed, 9 Sep 2026 11:45:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xZd03ZLm04N2hieg4Jz7IpXL
	9lB9dSQLJ9uFkAaXkhQ=; b=WVctFaCMOilWNlc2G3VjyRltEj9cnMnJrXHG4PRE
	3iBbZuR2pwOkRuoowtaf+axjvSB1gbBmVr3VJh4xugJ45VFFezVSEZ1NfqxdxpT9
	1hYut6M97u5llEel2Xtp3bfqf60yRduELQqSPf2/S8mNi7NCLJPQuhwPW7JbliFB
	8SvmZjpWb24yxcJgOH2GZgj/LajfuywIoc5M2XhyO1szDqeqT03H8MRNrPDgEcay
	SFeg5kxiQOyGstsWMB9caO5BA8a4NT96/HGJlgzMcPIN8thesYIf/H+tlQgc6L4n
	wVy4I2iHyXFCpdERKUB2USqbyxczhJCiD+22WHLjpBHv1A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjqha3u7x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 11:45:30 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e5fc4c7e9so590970885a.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 04:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788954330; x=1789559130; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xZd03ZLm04N2hieg4Jz7IpXL9lB9dSQLJ9uFkAaXkhQ=;
        b=DfrKrV16EWbHc3WVml6bzX1pOg3rOysKa+eyyhMjj6Jw1FzlNL5W/qo7QFFOgCcBpL
         B+WSiHwjeX+uehkQXDLvMF4KU0GQXKUPReyJr+soOX793KZznlJnTM3pI9HjDCKPuB5y
         ZucyYc77YDvxBlsCsRvQu0B2k6vFEdIrsX/VF50kIlqPecD3Qg3hI0ztWiwpXN/FHPvJ
         SwvbfGYnyGZI08VFlOVgi0yAMKeznNtpzfw0V6ToK1Zm40tUlVB55oEgLgiBOOOxY3Sk
         9nWXehe6oX9TmRHxTowzsxhvyNemXGS4QabGi63vg10uMhHDee31+BsmH3qFJG/Vcy+E
         7C2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788954330; x=1789559130;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xZd03ZLm04N2hieg4Jz7IpXL9lB9dSQLJ9uFkAaXkhQ=;
        b=EPbFUB8SuE33Zycg55+GCCbkSb5/4UIOUF2Cf7rjcewOXjVB4lUudB3iKxoPkoJfaE
         oZCkSD3VuvxSvvdEt0d+CBHPHyNrcnrCPSkgvA2I/jUqUacGn1ERaMteu4mMr/S0nWoY
         y2KVqnWRqpPyeQ83JCcAtPFbyEtUyJmZweU79wyMQ7AhpmB/5oi1WUJmDyoydJEh0lC8
         gMKj+iX3b8S5ezdQiUBNB2oIUpw7qOU9ND4B1wrS/hD0mr+626nz40Xb2Fa5WqN6N4tT
         vFuZuydfwAMYbn3g5CbJE5KSzrmxDP4Dfpo3f11kMsgEa5iVkq6WZRGVks8K1NvzwrEU
         Yaxw==
X-Forwarded-Encrypted: i=1; AKwUvBwGyZ4UcbTlKutDgeuv/iowqss5oH3+TK0x2z+rLiUSSzKO6YIQn7pcDOPQmji4tGLM1SLUs0pONKPy2EI=@vger.kernel.org
X-Gm-Message-State: AFuF++nwBLLOkw1mu9PiWTUJWmQnWL9zvdeirrR60oAksGyMAEDFnjLs
	py3zgV0GIENGftRdy/LivVEPRlF47MN9GzeKQjBTGx6fjBe+7UCrLlLK39sryzxWXAbBcvhJI72
	pf7WwjYblSRpNgM6STjnpHbjVkPX6PT0vK9d7eQHubwN0djN2hTGT9gcnk1eap4vi8ro=
X-Gm-Gg: AYBFou07XgerIUy2DBPSEELEdUo8/KmWPyWfs92RdDrxnExjEYHC8zd23nm8FWLKpsX
	LZVzGgQ1uwYCpsxq8OfWazH2vSNtPo9+/+4Kq81q7qc/ISu9fvgnlmJRwtlHqXj7wlrizcvWkCg
	ZeVKgH0Efc9xaeZ2gIAxA9O5Yhxqa8c+d7mPkZsumlUdO3fdna2r15HKP3ycLxUuTK8GC8CEqfU
	X5Cc0Xesw/k9g/lVuvFzWszpk+loF878Dsbd1wx/m96x+L6Mz7tnP5o8K94bQ5y4tEQCYN1hxaM
	ekmt97Q0mSm7yKE2cXbJelGoajS70ryKUdSCXW8xpAVDaY5elO+7mk8pJHz9hOafuvKP9p2vObR
	5sHpUvkROr0Y=
X-Received: by 2002:a05:620a:1493:b0:937:1538:6b93 with SMTP id af79cd13be357-9398053a24amr2721123985a.40.1788954324801;
        Wed, 09 Sep 2026 04:45:24 -0700 (PDT)
X-Received: by 2002:a05:620a:1493:b0:937:1538:6b93 with SMTP id af79cd13be357-9398053a24amr2721115185a.40.1788954324141;
        Wed, 09 Sep 2026 04:45:24 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.7.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d00a5b19dsm412127415e9.2.2026.09.09.04.45.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 04:45:23 -0700 (PDT)
Date: Wed, 9 Sep 2026 14:45:21 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Brian Masney <bmasney@redhat.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 3/4] clk: qcom: convert drivers over to use
 subsys_platform_driver()
Message-ID: <yj2cq2n5rexjq6p6xjlxucqk6bolianwg36qf7lfe6zcpd46mo@ue2ulk5scwu4>
References: <20260908-subsys_initcall-v1-0-cbccf4cd4288@redhat.com>
 <20260908-subsys_initcall-v1-3-cbccf4cd4288@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260908-subsys_initcall-v1-3-cbccf4cd4288@redhat.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDEzMSBTYWx0ZWRfX/fgPzFGDsejA
 qzBz1hsqJKkb777ezGhd598dxHSCBWsgCaEF3NVKwunqzMa8ri9yYVQrLtID/H070K5bCMrl2uq
 O5Csvni+KLkzUB/gppGUj+I+rVZ4aNm1aRcHy8/Rdi0ywOIe29jhr+/CGBqtoJwjsUBmTKTVffc
 XGMBJJWyqHQr+R3pgv5tv3kpnt7fnaWsv72QjGSFasMijEpv8wxz9gZICTxLY1ZMVM8VRDLiWXJ
 GoGgjQXejP2pyPd+qIRb4ulIcFWLXvOaAJt5lWT8D1V0bDufhs5JIlRLJmLpcdxlyS2gfT6DFFW
 1/nAKiOrlgs7xOerTUaQp5TUyTPm2QV6gd0J1K0iKHqGEeCBFkHjwt8oP7KfGNCZ42tM1QNPmKI
 qBNWxEa87zG7CN4CBxvweGOdt5cL3NcUsZpeu3OsuRhWs/Y6dXyd0m1/pSmk7m86oaebY4NL4pc
 VcF0VsJyxS6iU77EeVQ==
X-Authority-Analysis: v=2.4 cv=Z5Xc2nRA c=1 sm=1 tr=0 ts=6aa146da cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=dePp4Gl7O00gmbwhyVsZwA==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=q2Z_u8HKrAuHhouZslcA:9 a=CjuIK1q_8ugA:10
 a=tYq66TkwoL4A:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: ee_p_ZqAycj5Ll3m-fP6yv9GVRmKYFj6
X-Proofpoint-ORIG-GUID: ee_p_ZqAycj5Ll3m-fP6yv9GVRmKYFj6
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDEzMSBTYWx0ZWRfX54DmCyAV0Ekk
 CNG41PV/S/Ap6zZcZ/y8VjUaRez29DRWPI7cWkFaLoNMK7TBbhfb1dB/QA24qMfw4cF09CEnhwB
 RKihtIOzoSgPlz1R02EOtXb1J/WlGTU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 adultscore=0 phishscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090131

On 26-09-08 13:47:20, Brian Masney wrote:
> Reduce boilerplate code in the drivers and convert them over to use
> subsys_platform_driver().
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> Assisted-by: Claude:claude-opus-4-8

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
