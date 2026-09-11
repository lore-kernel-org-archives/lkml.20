Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B474395ACB
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 13:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789133681; cv=none; b=GCOyldn5XKnC/tK3oCV6NEYwsvkK3FEgDlK6PtnlAbpvti0yEXSIA0ZnwAsXSp9d7mr9w5FcoJGBbP1fIje1C2BIPoK7TXHnIPR2cg5scIuqUgjeOIQm/hyEeyxYp+tagDIkVaenKBwqBcOaCwiuR1OzaCyS1v27bZUsnEEZP+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789133681; c=relaxed/simple;
	bh=CQQOsVNYXPWgs9fvED/8XjGSPi4MvN1+4E4vHhPw2T4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SELCyJf2GEmMnQaTo0T+wN36LFM4iTMGdDhEpOD2SxmiRiENMJKeRiYoDtW8nyCWR2cAes65UZQoG4ao/WZoIov6JOJhmBLF9El8yyEZ5wMlLpFDmEXfcM3rvLC+7u6oMBDgncj35NH3vbci+VOQZmbdk6ntP3a0Sg1apTlH3Ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UXFLrFwc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B3N40qMm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UXFLrFwc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B3N40qMm"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BCiuKo4140722
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 13:34:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=nK0vFGtg5QgNaoNnYyvBeTW3
	5yhfDRtCR7670jeoDy4=; b=UXFLrFwcDScuAvtfIug1g3gLhqLuH9gKDVVCAgkG
	9evBkgMeujpIS2NBQrZFsA8cCSv38gZBIBUzIeqTiynFMzM1rNbFmaICqcL/PR9U
	fAp0julQB02eim+cEKXrKGOXnz6LyFHWer3VLxOVkEwXuY/a47P90gQX9FeDH6kS
	+sCDA2tdKYlkqv91fB8ytpFoce+UGQbKpKPqb6ETLr+yZ4Nif4jJnCugOyvKCQf+
	XSFVg7tQ+X2bU72ur7kTt6EqB3qybb6hr28hG4EWGLruCFQ/Hi2EDP9rXb33HuhK
	vdMdowrXxCxnfcl5TjDZcU73eNo7KBH3VsdzcvJMwfGoZQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmbdr9xrm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 13:34:38 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93918756165so165050485a.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 06:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789133672; x=1789738472; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nK0vFGtg5QgNaoNnYyvBeTW35yhfDRtCR7670jeoDy4=;
        b=B3N40qMmht6ElT7v8DGl8wuKXTqWA5Wa9DR8eqjjVLGe0mTW8lwwZr2uaAr0TVqk1X
         btzIyX5KGQxP2+Hapn/eSy0rWq2kvykLq6ii3dZTwVu5neL5+xYQVJvxSLut1RePeWvc
         Bet2Np7LAGrGsoAqP+8PDwoGzG+floNfx3EibiTTqY60zBcLLQUFiPpeUgY8T4qJ5Hbc
         Wt1Z10N+wm+HWu5RCzS1XJ0EIRwq8qw4dxbRzcTXgEO4FkGiNLkul09r2vhHl05EAfbZ
         Q7aLvw+NmXYaZHyL9Ysakgpxa3s4smMRTz/d6pCYeJ1dDLS0xVfpajjUOCS4VKUbOzI/
         E0aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789133672; x=1789738472;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nK0vFGtg5QgNaoNnYyvBeTW35yhfDRtCR7670jeoDy4=;
        b=RCMo8+5QU88EuTsLX7XWJnm+Q0shmLUdz86EO9pZzR5d1TZNWR3NHWevPOHUbDWvFj
         ssbQlYBf+ZI1VFuww32+6jyBGRGY6OyIu2h9OBlaXirtZxRx2Ry3te/9/V78mQmgbfxD
         gOB7pwEf0+lOuE0jvnL/KEbcVhb1sv93BvRlCvvDKyaprqPH/LhVQE5lRagxZrcE86fP
         iTzae8JuDYGCiEdOUh9nCk3PoE6i1RQej1ILNHHhL5G/fKGDcLwEELYuaH42kfyzpscq
         cxYEcZEM/ZU4FL32fB15gCYbCnOS5SR1nDUWohoigk15k2vkbtzyZgY+BTC9TI7sKEnu
         qS8A==
X-Forwarded-Encrypted: i=1; AKwUvBzptDmk4aAVBM7UtsJzOiSJsIfp/ac/pRHLvwM7aYDXRijb4NQckwjYoyi+xSbV5SmQwmWwOGRmoE19C9s=@vger.kernel.org
X-Gm-Message-State: AFuF++leuaz5lMWDVmRJc6aENQ3/zpTX84pPrh1Tomvyofzskw7lktfz
	YKIb3/G7KJ9qdEbWzqcUC8/VNna8THGVdEMBCgtYeDzITS5nHdLzk/+Jl3vKa4bI6lMf6Ve8PVV
	/8XN6oLiouGfLHpE24Py3bydS6jEm4QikC4l6mjjcv2S7JNcs1Xikd5vYJKqMsdsQPf8=
X-Gm-Gg: AYBFou0t26ghMm4dx+LERbfnLR2t5/C38K3w5UIA/LY0DQIhr7yGSCoYBD0j9exP7Qu
	4l7pf4jGj/BYWeFN/39l4Bty/aPsF9xk47O6lAI2VtdsiARoXypP6ye+dVWp069v7arF1OmP0HF
	Bu+gpevFvKdJo8qMTmY77nnKoNsneHfVmcoHJ5kHTTND7YlB2VE5r2kI8VmnM0QJPjKw97Vt+pQ
	FRGI9tmRL4uX0FL4HJa80JOnJ3+dLs7m3S/CSraBjEst7dEQ4gqTVD2AoyGA0MOE1t3Upq0z+yX
	9JJWLxYtbwxd3oeiH+Yr0HyKsAn2oqdJCsefdRY72M7a7ytpfR/0IxwYGMzzsVfdWtgiUHoq4Us
	fX713VRPcu+zk9bs=
X-Received: by 2002:a05:620a:6506:b0:936:ef9d:2c74 with SMTP id af79cd13be357-939ea212a7emr626818685a.30.1789133671696;
        Fri, 11 Sep 2026 06:34:31 -0700 (PDT)
X-Received: by 2002:a05:620a:6506:b0:936:ef9d:2c74 with SMTP id af79cd13be357-939ea212a7emr626809285a.30.1789133671102;
        Fri, 11 Sep 2026 06:34:31 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb35f3d9sm5358056f8f.35.2026.09.11.06.34.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 06:34:30 -0700 (PDT)
Date: Fri, 11 Sep 2026 16:34:27 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Imran Shaik <imran.shaik@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v5] arm64: dts: qcom: shikra: Add support for AudioCoreCC
 and AudioCoreCSR nodes
Message-ID: <oa6xnrgves3llyn5ojc2urmv2yrkrcetwui6utx225r3hiqzjr@rlqlp63xqji7>
References: <20260911-shikra-audiocorecc-v5-1-b0fc3a2251ca@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911-shikra-audiocorecc-v5-1-b0fc3a2251ca@oss.qualcomm.com>
X-Proofpoint-GUID: o-xQH9fZZyIwuYvXzQpWj2oMU0vNgTp0
X-Authority-Analysis: v=2.4 cv=PLmaavqC c=1 sm=1 tr=0 ts=6aa4036e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=tlOuMNSg9W14aln77gIA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: o-xQH9fZZyIwuYvXzQpWj2oMU0vNgTp0
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDE4OSBTYWx0ZWRfX63YZ/BWUV7na
 1h2Lv6FCU3rn44vbElDLfZ5hOnynRTIcqCHHjU51MUIcdLCDyVHwFsX4FPTv/RQD2G8TAgl6bAH
 VcvuQcVJLzL8dsgvS1dZ6rdPA1WDRyQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDE4OSBTYWx0ZWRfX4OT4knLqVk0w
 hbMynuL8QmjvHX7apGb9AsPow868et9/PXMi/FHq4v41/ZRYzjxqTrWYjOWPSJ1f7akd8p9CeFM
 qgKYryZdmat1a2UYyQy9Lo7bjdXbGLmVuzLPOQq+epl5nFEbmY/WhiR+9xKncxGpacXZz7D/Hrf
 ILD6JqW3l5CEAmbiO8zBkBKDUkVjzR9v87PQXNisd0NUyeHTN6nQd7o8gmZ9M9bPoDvMrbN2DZ3
 d8Z6pEWN7TOvWf6rWQXahiVRDPHyjHURmmGxTDPG9Hg05t1frS20pGYH5CWfKon+y2yVEQb2GuC
 StlQ3E/+MB57qdesuZ16MoIMhRswK+EsOQNn8XgLJ7zZ0Znwo7IJ37OlFZE54Wl8LzjYE710sUV
 pUmjGn7kVU3SfjGE9lXCHV9esaLvj/3LfNdrLAr8ExwQ7hnmf0dqo3qmte7OD05h3IvHJ/w+F4T
 MJVZFsbOAPUDkFIcRqw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_04,2026-09-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609110189

On 26-09-11 18:06:04, Imran Shaik wrote:
> Add support for Audio Core Clock Controller (AudioCoreCC) and Audio Core
> CSR nodes on Qualcomm Shikra SoC. The Audio Core Clocks and Resets support
> differs across Shikra variants based on Audio subsystem enablement as
> follows:
> - CQM variant: The QAIF driver runs on HLOS, hence both clocks and resets
> are required to be supported on HLOS.
> - CQS variant: The QAIF driver runs on the Modem, and required clocks are
> handled on Modem, so from HLOS only resets are needed.
> - IQS variant: no soundwire codes, hence no clocks/resets are needed.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
