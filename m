Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 370B42931E9
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 08:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791361528; cv=none; b=AaeJz45nqeCtIjb4v8R66C1omOv/lmPtNIP8xNAFuuaDc2ndh2rgQ9jAbmLdQ1tOLGpMsIvcCscM+rYhs/oQWzbf9bhL4XkFhIxVgfTHPXXpvgayjRIIQWyfhMY5bHWMY1XNC/QhQAjatKYiOqAS7oyS7LWjmSHj6YUMfrSOM6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791361528; c=relaxed/simple;
	bh=ZDYszNVEjElmxLR0VTjx9YRTaDAmAgUHSJvjzGCh0RU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WA6JS8l51vfGdPSDcBpR2SI0llIJIL4/E+ALaS1XjoYW0NPjMFG79zzoLRjjzu67A6Gt97/O9dGOlNeiPr31FEBYOeAfCInVHXAw9CgTnTNhz2qiMg3ED4nmyraZEHjE37Q/UxCOuJ2vzkkX81FODzauonpXlugd43fLj2jp/74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HacJ4tN4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kO7qGJug; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HacJ4tN4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kO7qGJug"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977juZY2312995
	for <linux-kernel@vger.kernel.org>; Wed, 7 Oct 2026 08:25:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=pQBG5SbwlH1RkPs7F97Dw6PI
	C6xi4Vl8Iw2NiJzks4Y=; b=HacJ4tN4Qg83bgXfxkrxXlkf0wf0zZ/QGHe9tA6H
	YS4KXyMLf1TCaQ6GyHXpbbtBEfiXaWGJjRP4KJ5sAm4rh91gENY0Rgz+3drn1nN8
	9W1VdaOByzp4M3ZEDdJsytQp3eYK3ebhhqMXEiukrZbjw2kpp++/3EM4ASnABh+7
	wgY0opeshwrIzYhqiM5bAgJmvJslw9Vbf7CGaZnYXNjkBPsC7jXzCae6wG7DSbFl
	TpHnKjnOLi5QYtRjjdn+ANXPR9WxgPus65/AEhXGIlH7MpkeOtAHKdAv+JJdiudB
	MquMgxXuIwzOlKXyo2E9M3JXhnONimoyoYVuoSM5RNRBdA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h53askhd8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 08:25:26 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3510a481ae9so7367107eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 01:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791361525; x=1791966325; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pQBG5SbwlH1RkPs7F97Dw6PIC6xi4Vl8Iw2NiJzks4Y=;
        b=kO7qGJugi0BVZnH9scWpwxe9vPW7k5uK59bo+DLueD5W/tjVMDNd1sum6cE5fVXZxj
         Cfn3LP3rsXHqZAwDhBPrrQkPz6zXveozPb8vflqF6PxwZb08dqYuatVTpuOeA16JfF5N
         h0xnFzthkEnflEIO19/bm+8TP9sody6dAi7+rftB1fgtXYrEtDPWOMHEGmL527BB4zFo
         xDqzG1sXm+cpeupohaZl8pt7tWQcqpgbdzDsjqsxacQmfxnBOuhnxPYq+MTWaFtR9k8y
         3wQ0BLD8am60PNkKJC6p1MgqI6KoynB8Ked3RNxl270nkVIdj4e/ouLF9rwClgjOGqAi
         2/Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791361525; x=1791966325;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pQBG5SbwlH1RkPs7F97Dw6PIC6xi4Vl8Iw2NiJzks4Y=;
        b=UB1DKzkMXPI1ZrinADz3eRCpAY8LT4pEs0zh7x2bHWucHLUe3AYGzJa51UETJURlCq
         hQYRLInWj1bCPJ8JuLRXZEQXqt+2n+H223anF3yEKd4IypLRRQdygeG2S0nUgzTHFxds
         zWV7p3aySxWamuX41G0x6N711Po4KM2HSD1HGEqgq0nra8zMvfgnhr/rbJFmUZ09Oetj
         bcCAiksmh3Hq44E+G+AepPFOIEnW1q0A14cy0VbNRfCi16+WT1Wd6Az/4NihJyd2II2p
         c5eHBk9+I4a1fre07wMPOP0MGkiZKfMeiNmU3hnz+v/cp9uTbK4j+ckNBUYMlDWZlJSy
         OP1Q==
X-Forwarded-Encrypted: i=1; AKwUvByeuf7dY8k8Nmkl1nzTEchgdKXvI/050PrpxM9ig3Z6dy93mKbXUwv+d+Niv0C529r03rDhKkJZxdTtueQ=@vger.kernel.org
X-Gm-Message-State: AFuF++leN0aNWxEiolsripPDLDieJl57KXvg0mh20t/cwZe0q+gJVglO
	cyqFBKZYzy9F/04rx7zTA0HMgmF7Tw/Un9XNVdUmayHlvNan+E1/AqxbBMURCfIPmDMqY96vlDQ
	lJMoVlx3wSY8VS9EtCAYvmAAdQG6uR5q5+/7XEVtA9eyBbNakUY4dFx0nzO8Fxt1yKv0=
X-Gm-Gg: AYBFou0IctN8qiIN71+t8Ef+OOhEoyOekGMmtQISsUD7fs6jIKUAVFI2O17ayPlE+/1
	zetSL8FIMaucM+wYskE6WkZIbQHZKm1QEhVlxLC/dY/5OJxDB1rp/9SzsqjaqvoW2itjU9fGu6H
	06Mcx3MsVTsSnzINjHdOmgXljPgc+LmQuos76yRGf/hsaz0PjvhRuvXYMnx8pUUEFrBD2T9P86h
	hgHiWb6GfyQfr4kJH3739w/6wm6y6ZMhz+5GM5FTV3h5MzCVT+OoGwDb0TUxsErCH6GY7AN92YY
	n+9ltDfgpES2SkXT6Z39KJyyZsN6aC3TtsU7G6Nwe53sdiGaPQzdjfqQqA+ERBmXdJo96kEqd3G
	07N06UrQPkgZej+SYahwO9L2d0Q==
X-Received: by 2002:a05:7301:32cd:b0:34d:2c1a:987f with SMTP id 5a478bee46e88-3515de554a1mr1487955eec.35.1791361524844;
        Wed, 07 Oct 2026 01:25:24 -0700 (PDT)
X-Received: by 2002:a05:7301:32cd:b0:34d:2c1a:987f with SMTP id 5a478bee46e88-3515de554a1mr1487913eec.35.1791361524067;
        Wed, 07 Oct 2026 01:25:24 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3515aeb6013sm5961752eec.5.2026.10.07.01.25.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 01:25:23 -0700 (PDT)
Date: Wed, 7 Oct 2026 13:55:15 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 1/2] dt-bindings: misc: qcom,fastrpc: Allow hex digits
 in compute-cb node names
Message-ID: <20261007082515.xmjpa5jjptgrl6y6@hu-mojha-hyd.qualcomm.com>
References: <20261006-glymur-dtfix-v3-0-44e2bc5370c2@oss.qualcomm.com>
 <20261006-glymur-dtfix-v3-1-44e2bc5370c2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261006-glymur-dtfix-v3-1-44e2bc5370c2@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 400DGMqswAxMVtzrOp81qlvAdvOeBe2v
X-Proofpoint-GUID: 400DGMqswAxMVtzrOp81qlvAdvOeBe2v
X-Authority-Analysis: v=2.4 cv=Xt5vqlF9 c=1 sm=1 tr=0 ts=6ac601f6 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=QGBbWe6yPyKI6YAsb-IA:9 a=CjuIK1q_8ugA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAzMyBTYWx0ZWRfX93s8YjKa/7et
 XXd8bMR9a6SLGnBFeKrkqoF0XB/rMTl2S7lLMjLZCJEcye19Ire1b1evaCqMDH6Nl1+06s387dh
 +38uMxlpIUePdXr3WecGutJzQvkXrKetpPb+FNtV4M1irpqBo2YcmxIyS6RnEkWpoeJrkfP8fED
 /RxBCOSoRR81fVCXgIl403AXIUwOAPwO0xexuF1gsr4hCEtz1WUCJIsTOKv2VMrn5lYjrs5gbzK
 bV9DraB0P2E9vYSa2oj308JaImRld8ZscQq23TMCGDK7DV7BJuAEN6t9rPv5VpZ1g29fTYyq0oG
 8yNck02VylpZCF2hehbE4sYVijfBnP813bkOvUxsZApsYce+XWVCWRevWGB0/LFm0XbKq607Pxs
 8trXAIMi1IvouZzEHdb8eXM7NpuFfdljS6jjTNFeKmYD3rh9z1DeTPHtF40rC1YrAH74LgNlvgz
 lJFXM0xalkQK1agYGBg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAzMyBTYWx0ZWRfX6ai+S/9G7hXW
 I+MDIm89mi3Gp8pppVxUckPpW51OX4cetJIUx+bh1CiOCNcHeSJ9lQEgnKzTRTfGyKawYwUinWW
 vLio+pgVtdiObScyWMERVvMXF6/hbLg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0
 impostorscore=0 suspectscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070033

On Tue, Oct 06, 2026 at 03:56:06PM +0530, Ekansh Gupta wrote:
> The patternProperties key for compute-cb subnodes used [0-9]* which
> only matches decimal digits. However, per DTS convention, node unit
> addresses must be the lowercase hexadecimal representation of the reg
> value. For compute-cb nodes with reg values >= 10 (e.g. 12, 13, 14),
> the correct node names are compute-cb@c, compute-cb@d, compute-cb@e
> respectively, which are not matched by the current pattern.
> 
> Extend the pattern to [0-9a-f]* to allow lowercase hex digits, making
> it consistent with DTS unit address conventions.
> 
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>

Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

> ---
>  Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
> index 49d2a5e8ba39..14fed91fee50 100644
> --- a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
> +++ b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
> @@ -79,7 +79,7 @@ properties:
>      const: 0
>  
>  patternProperties:
> -  "(compute-)?cb@[0-9]*$":
> +  "(compute-)?cb@[0-9a-f]*$":


While you are changing this, original change had * which allows
cb@ as well ? should we make it to "(compute-)?cb@[0-9a-f]+$":


>      type: object
>  
>      description: >
> 
> -- 
> 2.34.1
> 

-- 
-Mukesh Ojha
