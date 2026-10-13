Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC6DB3D9DDB
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 09:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791883145; cv=none; b=HZDZ6jKs4mjaCh5IGPgg7+GCJLb0gDzaQ86t5dB6RFjATSlQvxu+ZVEtia07gIJmQHYDJzTJb7u6BNpvRmniSNHCq8MI3QVwo8ub5+Q9nWnosBCzeMNGO1Zb2i90gZy9XJQpAReVQsoRr7UKjPvdSuORPxICjePBIEWDKeRjZ+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791883145; c=relaxed/simple;
	bh=ZjDJCoA6MxAlqVBWalgo95rJlsZqJs5EHam3F2kFqFI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DCG6myWpXCmD5DfjXeelMCqcgjRCLItf3CQsc6xocM0fJM9jFsGLeeCPbBFPIgTdfohOcL1G46swERZz67oG6PuGcPBg5TtqCtcW0BmZp3gHgQVLIpWSMWCiUrouf+CIJbR1sHi8TMZxkyIMheQln00JE4CeV2gsnFJzjJoiofM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m+3COEDl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XegUqucV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m+3COEDl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XegUqucV"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D8B2DZ922923
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 09:19:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=uQ82qhE+xbrPharhAgsD9+NR
	Ct+bFTtwURK4hSdKntQ=; b=m+3COEDlKoRKIgnoYo8+Ib/egwZwTuGWIqvL1820
	I2EeOkYgsfW2+9Ww2MmvcNxsU3HwoM7ARx9UyGQdxP+XtKGbZv1SksVPwiPIVfeK
	VSncdCH5da4DKRUneB088gg5LtLq4ddjw3Ibmcek6fERcag6jMxbwI5t9WXkvg9t
	qsz5z6AelYxBQs10BQdiQ11QcS9mhrWF5Wd/Zs35pADw8TOH60x+6/tx+FCl54B9
	PwIugTzhc/Kj53lLHxl4VRXIqnN6P3NUhO4y7he2H+PSj29+iVXOVrgypBcy/XmE
	duAXPHcP0lUXixC+f4ymtEWCMBM/WBRXOmpL5jdzwjznyg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h98h1t5ng-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 09:18:59 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93ae8e7e546so575626585a.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 02:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791883139; x=1792487939; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uQ82qhE+xbrPharhAgsD9+NRCt+bFTtwURK4hSdKntQ=;
        b=XegUqucVk0IawPabM9lY0vVVthc16hJXk8o+Y2l1v/jfVPsFp2FpYUOBIEujSFGM89
         ZCeBBkPUcDDawMZ8dQNQ7GqXlFJ0ue6MM82ge7AkURT9ODArOVqnwGwD+SjQdtPt5Zae
         NAYLvOv2xAVQGMEPwv5iPXVDwFXH1WB4h4lGHSHzRvtdnXHFAtexdfwnMws3kMYmn2zT
         zlIPuV0huaL3YQCMoc7onxx5iRqCI6He6X16nAf4JbwKNWV1SRVUJoxzwwbnZY8BETxN
         flEwEZw5amVGbm2v3Twfk9W4/0IqLGfkBuJvNFM+ukaJfdhJYCXuaQaapxiOdCRqSDTz
         5Awg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791883139; x=1792487939;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uQ82qhE+xbrPharhAgsD9+NRCt+bFTtwURK4hSdKntQ=;
        b=Fa6NjwUvJLFaoMXfUOkN9wWSKlSDw3LgUxhtk55bi34tJQx4X0JLZzoU4C/QFg+XJJ
         8yZsVheOLSQhL+4sxLRmIWJUw1cY/cfN8gCUjcc1YjpuNXBoFuYjsnn3/BMqXJrCWORQ
         nI8j2EKFfZ17OJ9uBB8CKOSF9gNJ3SROCzFgj+fLfIKcpAo/Ku3N0AaR8BSFczDU44ec
         3ItMSgQ8EVHT76hiYGMeT0IRuuEa8YUbkXniG0pOOFRfRDL1X+PSJAnANdMH+3Yiv1RZ
         KfX9sCtORRDtEKl0W14xtrQ+rGuVXVVMj2fGbVx3V61uvaIyM1pGYxsxl2LtGzlaQOPh
         N12A==
X-Forwarded-Encrypted: i=1; AKwUvBxfTA9o4S67fePwBcNHb1v97Hic0QcqQDCF0dmywGft3AmzUa0KoyqEEoPSSUrmQaXgxBTGJvchgDVDxRY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKofGBkFdsPClV1u4wpX5E4dr5tpj6IqdL+RFWLxYIOgFgLlJCS
	H+ZJuBkVYRLYDKsbOanU2IqTLYnoqbcyH0dqc7lWrg2TofMUxxriDZCCrpMzskzzKU0NHauGet5
	xo0QhHWz8H+/ZB9rcmxRUGaNwuhdWZEUKaAAl2esK/Ga362N7GQU45kUYG6zATqT52V4=
X-Gm-Gg: AYBFou34dDFTV+69WVEDepCExkGx7U2q46d4lNYtlCWz2f+zLLEgHdKYTcPp2J5aDpb
	tm/7MQYPsBqQ9gh+Vkr+yXCWGGSi+SdrtfouGp9M/q1rIanNQp5aYvDZxZK5TtFdLqcK1A+dVkY
	uYWLB3NOyVPwyH6SPTvZNV+55F4M91js/FUplsjUMPyw7Sb14Oq8K0+b9fM/cn7ht4A+B3dHNjs
	e/d3D/5B3Ip/jnAlGqF6BoATzEpcFP8qJCuegQIi3IQzMx8jMTRPzTqR2YpqoZKkPtzCSKtwwa/
	Ttw6FYmZsyAG4OaEP+lL4bJ4AylpWyT0uT07orUES+egjcJ2BkJB72QC6UgL3VdEDbEYFowYi3P
	+qVOHTIKtbzo2J4LR4ScAnv1xP8n/4bjmpa0gFnp1gEtIU+/E0DFmyfjZNllzV8HRamGPRLtyep
	Wn4vIGqggnQ1OM
X-Received: by 2002:a05:620a:6601:b0:93e:7192:191c with SMTP id af79cd13be357-93ebd1e0044mr1950630285a.17.1791883138856;
        Tue, 13 Oct 2026 02:18:58 -0700 (PDT)
X-Received: by 2002:a05:620a:6601:b0:93e:7192:191c with SMTP id af79cd13be357-93ebd1e0044mr1950626285a.17.1791883138276;
        Tue, 13 Oct 2026 02:18:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bcf8a3970asm1038505e87.79.2026.10.13.02.18.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 02:18:57 -0700 (PDT)
Date: Tue, 13 Oct 2026 12:18:55 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nabige Aala <nabige.aala@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
Subject: Re: [PATCH v2 06/13] drm/msm/dp: Add support for DP controllers on
 Nord
Message-ID: <gmsyzeugteg67h5vwzf2y2e7k56eg6aicbonzjl72etgedd5oe@vlizd2npwtn6>
References: <20261012-nord-drv-dt-v2-0-a2ab9af954d2@oss.qualcomm.com>
 <20261012-nord-drv-dt-v2-6-a2ab9af954d2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261012-nord-drv-dt-v2-6-a2ab9af954d2@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=VqC2kO2n c=1 sm=1 tr=0 ts=6acdf783 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=rMXm0_BZOgqvqhzNPSsA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: 0OeZZeJ8ZjBHbu12gehnSem-KwG0mztD
X-Proofpoint-ORIG-GUID: 0OeZZeJ8ZjBHbu12gehnSem-KwG0mztD
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAzNiBTYWx0ZWRfX496hFb19FJiX
 JoQDpfYLXxqKMjaXSB6CIitCcpUdiK8Vak4noVXLwCJOhv1Gc2Pg1JW0gb0J5wWG3mQqTq0hQXt
 0/OtZcG7Ug+06L+rp3l1LTnm3xNplfo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAzNiBTYWx0ZWRfX7PhaABtyR/uM
 o1S/HGKeGvwiJwc6PxxozEozelRnw+c2gu4SHNQPYoCv2TF2P8gvkQ/5WqH1iJ8ny+RxQdpZF50
 Np+Gz42ninvqWu8obu+WUBjIDAnTQfz+KNTyEVvCxYZo2PDg2czKYU6lj6DGoDS397KOH1XDKrj
 U2FiQwHwHtJoiVkIWepqjH/y9684EAjSkDq9mMCQyy1+TvuE3CQ8S+T1W3FwQalIryIWOoxJBZt
 erHifcvS/F91VGGxpkpdtJrRFOGvoY1wHazp9Cz67lAPUpGGhrmt7k+dmhc1mantPvmMBBOSiIs
 Xj5jWLLlHa/zdD2fldo+TKP/Eei9n2dXEjYwGX6KrsK8TZa3+CobtIql0/PxIpoD0SCYvpQIfZ0
 W8hDhNlcIALahfKRVBgDaK/kGoHU2MOs5qxXrnpKxU7r2nYzxf1BTh/Wsc1Y+cYWkdLkfTHyAtK
 fzMsXSoyLGruFdQMheA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 phishscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130036

On Mon, Oct 12, 2026 at 07:02:16PM +0530, Nabige Aala wrote:
> From: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> 
> Add the Nord DP desc and compatible. Nord is supporting the
> four DP cotnrollers, two per MDSS instance.
> 
> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 9 +++++++++
>  1 file changed, 9 insertions(+)

Why are they not a part of the existing entries? Is it a newer core?

-- 
With best wishes
Dmitry
