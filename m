Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794560354;
	b=HeAJOzZI88pjqM3uiCIZ8qrzkUgLeOk86iLpMrkZ/JSgS0Cqh0YPzNrjiC/UfqGuOpM2
	 MhOWpMGMe+XGjwiv2/dBG+HgWZwHcO+4IKFa6UJ83/zEh5GRcfLvwpBrnm+3br2DCSW3a
	 kfIDwZIFkJDeekWbRdsthDcUAI1oLmaPtd0d+QozdsgKEx9eUKs7GaZIst60txlZF8MRR
	 3RU0d5geQy5lMgfD5RisX6tzwRl5BEe0SmzlhewONhDuaEzzW2O4ScK3jGVIyFzAbqrST
	 803Unurl5lln6DyStkcGxCJhEYcrOJDsUK6+8r5StnUlzP5DcZUWs7nL2Ncecv3f9+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794560354;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=JaCKuWoch5k2Kjk0XZXFM0Ps5nVvPhDt20xb/z6BgX0=;
	b=dNcTIlMPAgqIOIap4Ft09q9anbc+GDRTkYrV4lF6Vi4Ng/+g582OpNJgMnGI9ebgsXNi
	 q6fzp3AlaukITfB14Q6qi58P+dMEe+giJB8feEHB6D6QriedGOrrFuE/loiS7NSwtLyxJ
	 6Zr8jSrLLVxP4WLqsCTNIKys67Ylh1orZqShEUzvO4asKeTNOXCNztIdsKuTMMw+iuSLl
	 n431bYSRwTefJQSo7URkL3ri3Nt1LT69QemGeNYLpPk87PeawbvoSqOC/2PuTkvAxIy0D
	 2uGoNEH+XuK1amlEP2eUozVTKvthP5qkMC9jAdXrSkwNT6HWTtSqpI6UYsUqq7fikPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F0QAN3oS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XigveMC1;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33989606A32A
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:59:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33989606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F0QAN3oS;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XigveMC1
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD8VDLm4163547
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:59:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=JaCKuWoch5k2Kjk0XZXFM0Ps
	5nVvPhDt20xb/z6BgX0=; b=F0QAN3oSkmjXryB+McqTbr0iaQSPYlX2D23jMe7h
	tH3o7lIq0mdVAPS+NNwkMN/su6sThmzr5sTC6xO9v7mkZyvnbXjnxvw9stqfpXcu
	WX4z5RJ5SGXcBNzRjGxmp0W1VsWwkmDBOxKfLXPQ0TvbWSdmdMBxrXS5a5OvVClV
	m7R7GRaNqMoybnGaLWBKUlTU7aNy7HdZcr+xdL5tSAFNF0aNjCZxUDFtX2IDTEAi
	0bKR0qlla5OEvln95ah2olXoL9ZIPNnFq8By72s0o1qbkSNbIssU6OyCnUZ3GIqO
	z+pk7uXuVDRoBN+peJP481m6eCkso7A2PyYW5L4Z4faLpw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwh0ak0g7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:59:11 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-341eff9e381so1196763eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 00:59:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794560351; x=1795165151; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JaCKuWoch5k2Kjk0XZXFM0Ps5nVvPhDt20xb/z6BgX0=;
        b=XigveMC1mB/JMtopPn2L2kU7j3cmr7lb+/DifdyfusGrHNtu2qG6E9KtbIsX4mGymh
         AJ2J9MyLhXtZsDlmKP9Zls2uwJ11qslWEXQNBXxPrN5fHot0PQQHTTAbSgRYgElWOOV7
         ykp1TUPA/JPXrpj+kxchnQnK5XU+45jpeJtRyaK/2XbdSw9KI0U5wPXniuoNy5AuMPAW
         JvAHTzhsnzUa9Je7V/bnh0+PYbn4P2UaZzlNxe8pJdDVCQ4Ah8WvhDOKkz9vl0tECeQz
         PmQVEVBuTrHaELn/MF7lmSlNY+lFwDN/TpB0YpFA6cLmIHombQ4kllChxCjdmjyH9vDs
         IQuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794560351; x=1795165151;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JaCKuWoch5k2Kjk0XZXFM0Ps5nVvPhDt20xb/z6BgX0=;
        b=ivmMc+8iVNgpekPLWsihrXsd/5WivFw+264KxFgH7TvG5pgt84VfEVvmOP7aGAV4Tp
         CBoePngH+lQflNjqSOJalvHwAg2iVXUscsbJFj+5guTzxoOQUdTmhbUyQWB7ZFdagidJ
         Y/ru6jxAXw8+6XpNmzDVAvxjShjq9HyfknI23dyTaJ8m/fZOGFQLo7ocdRqez6Ep79j2
         YIHEdu5tg1jerjxOLRGbvuD09xpBi20bEQcuq2D1vXZqvDMaOQSVgwCRpDsCnX5Hws09
         p1mvv7osnCDgm9BOrercHXmVw1j2jJiA9I4A0vTJxBZzWy74AKWBqkXPby0daqwJsEIj
         zYMA==
X-Forwarded-Encrypted: i=1; AL+hErGkPTRS/GaHdIrdnhmqZUDfiIrSw0amfRMpVzWWCzdxCvXQaVeYMHJ2P4krqXuH0ndORdKK2854DXjxIpc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ZQ0WhKpYySVap9KFtRdHCrb9ciY8jjBctkr4KGuEzn33R/WrG
	sSr78CWjAX0E/sm2dVWXCrpOWrPPqJCweKeuBijByVeTX+Cr2WiwcupNet/8Wq0AoSGtYgW2/sF
	n2wn/mrGzyNHm5RVQzKm+yKgWE7K1fA2Nd2KNnTbjkXVf3UXGx+apz1gkECCSW0hf1uM=
X-Gm-Gg: AYBFou07FR422PGOobslXKH3NC2KYOj2nLugFkaL2gjfMKdIjXJZ5jWRqvan75PbvfQ
	p4iRJT2NYzQwRJYyvSyrXUahToBKRn1Lnq5RQjRbdkhPf1FgnVOtze8QVXBS8uWh8z30xNfVmYg
	SanB657OyzjFsozlYHmWQ/7E5XH+M33rvqdRBw5r40HBUyMl747tVxExshFe9fMsB21J1ncuKmf
	669eCB0RM3DnBqeLMaZAHKQdV/1tJcsGMnRM518DJq7R/BlTtAn1SJ5/M8zz1euHYP0QyE91Smm
	TKSXfPA4/kyb5abg/H8xW2s2e4ogz+JcPhpjvq3PyFrQw9nSiAg+Y2K3Pd7rZr+JWdKe6g/y4lm
	xFpRkW+gC/EHP6sr12NZEmpvX+NwY3XLczVHjkSehwCZHwG2q5DpEyGDgnXIlKfTFzTEAbWi3aQ
	U=
X-Received: by 2002:a05:701b:261c:b0:18d:5988:8d3 with SMTP id a92af1059eb24-1b5030684d9mr1933652c88.3.1794560350742;
        Fri, 13 Nov 2026 00:59:10 -0800 (PST)
X-Received: by 2002:a05:701b:261c:b0:18d:5988:8d3 with SMTP id a92af1059eb24-1b5030684d9mr1933628c88.3.1794560350098;
        Fri, 13 Nov 2026 00:59:10 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50313d8f5sm8926890c88.3.2026.11.13.00.59.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 00:59:09 -0800 (PST)
Date: Fri, 13 Nov 2026 14:28:56 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Alex Elder <elder@ieee.org>
Cc: Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>, David Airlie <airlied@gmail.com>,
        Simona Vetter <simona@ffwll.ch>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Alex Elder <elder@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Abel Vesa <abelvesa@kernel.org>, Sean Paul <sean@poorly.run>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH 5/8] net: ipa: migrate firmware loading to
 qcom_mdt_pas_load() and qcom_pas_prepare_and_auth_reset()
Message-ID: <20261113085856.mpa2zi4argm2e6y3@hu-mojha-hyd.qualcomm.com>
References: <20260925155737.4161358-1-mukesh.ojha@oss.qualcomm.com>
 <20260925155737.4161358-6-mukesh.ojha@oss.qualcomm.com>
 <ccf0300c-80e8-41a5-a394-6ec55fddc913@ieee.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ccf0300c-80e8-41a5-a394-6ec55fddc913@ieee.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAzNSBTYWx0ZWRfX3oFRFLMn2C63
 WQVU4rMrsG/OWEQQk/89yGPQaG6nW2eB2/E5O6hQkD7JezJoRssbs/Z0mp2EsJPc36N4UFO72Tp
 6H2DgmDT6JREzNXSv4fX32/VMZMzjUw=
X-Proofpoint-GUID: htFXsYHRcSRFF59wtTiQ61zFhKvbatkg
X-Authority-Analysis: v=2.4 cv=N+e8hG9B c=1 sm=1 tr=0 ts=6af6d15f cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=ee_2aqc6AAAA:8 a=s4fcayaxKqd7nPnH_LgA:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=VOpmJXOdbJOWo2YY3GeN:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAzNSBTYWx0ZWRfX0CGXmrGpXmek
 +FJ3DlnPFx/gUA8FsmRgWGHha89isZPiBiwswq6bIfO23wwCr6XJ0EYcGTnJJT8d+WpC3Aw4mpG
 zLR82+6ZLIU5MlCBC3/ZREP+D9UEMd3RbkBh5j5XZBzw3LpGylHaBOzVaKoOxlIBiEGDmZDBOi3
 uTi4RK7tbS+7dgKR+ZHX3eTrmygF1VfYtj4JTC2n2tINTZUtA0U63V5U/adOjGSHUW33WZxQaSz
 vLuJNsprocM1QogsranrcmlvtZ836hsB4K+tyH1VxqrU5Yk0+aRSDOK6fl/dJoWfXvWxmyXL+S9
 GmhgmRYo8ZQPBCJAJmZ+jpllrzl3AEIPxYyGrQ5mPPhvMEjYiKYUbvYcVY4xNzJc1DoZJ8hM0yx
 0XLQVuf9Q6n/cHWGE0RHAZlaHmHwaVuAkrd4y7JHIwU5dqK9CVp76trqqtSXcwS9wfLCUReKuKn
 ePf5Ya6LUqwZ45znJrw==
X-Proofpoint-ORIG-GUID: htFXsYHRcSRFF59wtTiQ61zFhKvbatkg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 malwarescore=0 bulkscore=0 priorityscore=1501
 phishscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130035

On Tue, Oct 27, 2026 at 07:49:03AM -0500, Alex Elder wrote:
> On 9/25/26 10:57 AM, Mukesh Ojha wrote:
> > ipa_firmware_load() calls qcom_mdt_load() which bundles metadata init,
> > memory setup, and segment loading with no PAS context, then calls
> > qcom_pas_auth_and_reset() which skips the shmbridge prepare step required
> > before TrustZone authentication.
> > 
> > Replace the open-coded memremap()/qcom_mdt_load()/memunmap() sequence
> > with devm_qcom_pas_context_alloc() and qcom_mdt_pas_load(), then pass
> > the same context to qcom_pas_prepare_and_auth_reset().
> > 
> > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> 
> I think this does the right thing, however the IPA driver does
> not use resource-managed (devm) interfaces, and this would be
> a first.
> 
> Why does "qcom_pas.c" not offer an interface that can be used
> without devm_kzalloc()?  What if someone wanted to pass in a
> preallocated structure to be initialized with the (publicly
> defined) PAS context?
> 
> I was going to suggest that you just rework the code to use
> gotos and the cleanup path as used everywhere else in this
> driver, but it looks like that's not easy.
> 
> I'm willing to ack this but I would have preferred to preserve
> consistency.

Ok, let me fix this by introducing a new API to initialize the context,
which will only initialize and not allocate. This will also fix the leak
problem if the earlier API is called multiple times.

> 
> Reluctantly:
> 
> Acked-by: Alex Elder <elder@riscstar.com>
> 
> 
> > ---
> >   drivers/net/ipa/ipa_main.c | 24 +++++++++++-------------
> >   1 file changed, 11 insertions(+), 13 deletions(-)
> > 
> > diff --git a/drivers/net/ipa/ipa_main.c b/drivers/net/ipa/ipa_main.c
> > index 14ac2d2faf7c..6964395caedd 100644
> > --- a/drivers/net/ipa/ipa_main.c
> > +++ b/drivers/net/ipa/ipa_main.c
> > @@ -585,12 +585,11 @@ static void ipa_deconfig(struct ipa *ipa)
> >   static int ipa_firmware_load(struct device *dev)
> >   {
> > +	struct qcom_pas_context *ctx;
> >   	const struct firmware *fw;
> >   	struct resource res;
> >   	phys_addr_t phys;
> >   	const char *path;
> > -	ssize_t size;
> > -	void *virt;
> >   	int ret;
> >   	ret = of_reserved_mem_region_to_resource(dev->of_node, 0, &res);
> > @@ -615,24 +614,23 @@ static int ipa_firmware_load(struct device *dev)
> >   	}
> >   	phys = res.start;
> > -	size = (size_t)resource_size(&res);
> > -	virt = memremap(phys, size, MEMREMAP_WC);
> > -	if (!virt) {
> > -		dev_err(dev, "unable to remap firmware memory\n");
> > -		ret = -ENOMEM;
> > +	ctx = devm_qcom_pas_context_alloc(dev, IPA_PAS_ID, phys,
> > +					  resource_size(&res));
> > +	if (IS_ERR(ctx)) {
> > +		ret = PTR_ERR(ctx);
> >   		goto out_release_firmware;
> >   	}
> > -	ret = qcom_mdt_load(dev, fw, path, IPA_PAS_ID, virt, phys, size, NULL);
> > +	ret = qcom_mdt_pas_load(ctx, fw, path, NULL);
> >   	if (ret) {
> >   		dev_err(dev, "error %d loading \"%s\"\n", ret, path);
> > -	} else {
> > -		ret = qcom_pas_auth_and_reset(IPA_PAS_ID);
> > -		if (ret)
> > -			dev_err(dev, "error %d authenticating \"%s\"\n", ret, path);
> > +		goto out_release_firmware;
> >   	}
> > -	memunmap(virt);
> > +	ret = qcom_pas_prepare_and_auth_reset(ctx);
> > +	if (ret)
> > +		dev_err(dev, "error %d authenticating \"%s\"\n", ret, path);
> > +
> >   out_release_firmware:
> >   	release_firmware(fw);
> 

-- 
-Mukesh Ojha
