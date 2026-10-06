Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 343263A6B9D
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 06:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791269648; cv=none; b=OcmassJgYFC/a6S+p6RLjE4a384qCnD9TV8jt4mQbyqaxv7+xOjIjzFFBqhH9gdoTZE80XPiL9WLZHz7MPddUureniUEK27rJmwg+p/DHlZOGlzHKPzl2oxhwG+xQHQo8LfOVoaZbL9dOjOeSFnirh8Cf2vb1M4Qi21OLBNw2vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791269648; c=relaxed/simple;
	bh=HvjebI2VgZ/1pC+f9/B0QnTfES/OTWUYCuYyYVJnF9I=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VNIxT5YkiY6Fz1ijwTHxhF02WxwjfwOGhYux1yFSZYprOR3DR3KKOeeypt8w6KGKHnhjWvnVA34jKh96zeKGrCn6CpMKqoMLNNwDdLAOzSf+wAdRqVNuNNpogEv0OCfNCbCGsaYN1A12dX/EjKZLBW+/OdcHyZwGQT0/IsbPvTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oSXgdIjW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YlHOEd0K; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oSXgdIjW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YlHOEd0K"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6966e1QE3432717
	for <linux-kernel@vger.kernel.org>; Tue, 6 Oct 2026 06:54:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=F3qPHT8pVKTz0CEs0C1FqZN6
	y7UwcXfkx2bFX2Qbfa8=; b=oSXgdIjWFUXvdr4YW0GJ9Vs+/XR41VeOGMVK8Znv
	IEoNNaPcAi6oFmjpFDQdOyy+OUEarib6ancgySOMyZzYrwuVENIrrvH4qrA7zij0
	JFiAzwncuK6YC5aQF76pOitelRnZYX2HhqQgtuKvSenfSrGetA/JW8pYS2EINreW
	d/KtS0n0c7zVGnr0K6H+69NIacrIOUX2nSvC6wXdsx9lxRMkga474JHKxDz5RJ3g
	8XUMtKH2GXSrAAnWUz6kT+YQq0jNpq0O5Pin6VlmzP/POZUdYbtqD4Bp/XeyZhEL
	SdFVDbcT9Koi19dMNpx/M+Pukchq/viB2hVYPbNFDhsJOw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4cvnkg59-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 06:54:06 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cc0b31ecaso540196085a.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 23:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791269645; x=1791874445; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=F3qPHT8pVKTz0CEs0C1FqZN6y7UwcXfkx2bFX2Qbfa8=;
        b=YlHOEd0K3gCbHts+1pRdx8K/f7/EN0kuxrVfD9X18QCRq4C70COsU7y0BjWdfoIrSC
         fTpNWCM90vg8hFar1MsHlmnTD2vsAe4PPe65xQIjVenrgkevBcdHJC3u2bXNyi5uLECI
         rglHGsqQQvxk7oc1SBO8wtlR4gM7tu+RtOCSWLAKhJeojzomisFSRueHtb9W8ivpVMVm
         qgaioDwSTx5qrjZ6+twt2xR3ss5dcjW/sGkB5CK68THHdkEcofejhSooj2uxGyVSIpSH
         igIwzPt36sVCPTtw5K9b2s4KxlVNusPMxL7/wbXZv8X8G0dOEAnHzHAN03d/4fDRqGTK
         FTOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791269645; x=1791874445;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F3qPHT8pVKTz0CEs0C1FqZN6y7UwcXfkx2bFX2Qbfa8=;
        b=htdNPMSZhc5QTbAQ9KfDskcLvvl98yn9z1H5MJmzVUIEn+ra5vt7gXrGu3fbU7+JSj
         gv+fmpCUG2TFfbmf1yi0puvKq/7Cjism/u0Wn9PDnNUa9VMa/sPbLA9TK6odDRuM/sV2
         pavvPHZrcREL9OB2J0XIxXDB0Js16PoO0u2fyP4jSh5T7AqJQwajo+1WZ6cGn/xTRsnl
         vf/wmwIA7NFGNWF6l2PSvCUUVGxKIydSOfRvY6PnEWImXtdoYHaq2sGEdICB67fhElgi
         1fciys3YMmpVKjMGJwlAHAWY8O/2P/3DphSv88Ks/rtj6Bf8BsE3d+SsgFsWtCeUAM4w
         9GAQ==
X-Forwarded-Encrypted: i=1; AKwUvBzBszxLL5Cbmxka1MaLHidxSeGyPT4TR49xgMCB7CaZUnECCzevhoWecxYzpr/iVnW797plGy+wYZWY06Y=@vger.kernel.org
X-Gm-Message-State: AFuF++m39AO2W2v5k14Bs9/9LBkGKY29RaFic5fx5VzSSIEVD+ChBXuS
	3giuwM/8cddae9+owlpBGqOzzG6ygWLtEuCGYGHgX3H/KCMN9u2rclTzEkrebmQkg3e+SDriAc/
	JIP9HN2d4spBxW1sSdwmvLmLo0xe1OSu9IqqvBSQ6pUMEn7lsRORtu2/X9gWpvtYpaKI=
X-Gm-Gg: AYBFou2QP9BknARMp043QDAvhVjSI2beGtzFvzHa4r2G/O5vjBcLy6E4+hTVDpBjluk
	RaBZxUSv7CpbJU1aUGgsocv0y4+jYVjXUxEj1eKci2r26sUndYdo3QiR5YYEysivV/cW7vLjeZ6
	pZYnz1gkDupNllFz4WxKYE+fxfYFZl3mdsO55kalstjY3ZtiZ9eNVR0HLBEVWXowGmcPF4rYV+r
	eUMwhQQRgGOTMv53M6t0CP6k8vtKK3A++zj8FOb0vDLWEvYIxSLY9T36BQ1GlCbpLIdC9XzW/+J
	y0n6wXB3o3t0AeITL5I91proexVH+/zmR4nMRGs/SWvyepd57hx8OFikSX6ujkT9rSaUaSKRxEW
	0qa+lmnztj3Rg/pVudP9OdFyfTZqJ
X-Received: by 2002:a05:620a:46ac:b0:93c:be5f:b807 with SMTP id af79cd13be357-93e8f31ebb4mr91867685a.13.1791269645126;
        Mon, 05 Oct 2026 23:54:05 -0700 (PDT)
X-Received: by 2002:a05:620a:46ac:b0:93c:be5f:b807 with SMTP id af79cd13be357-93e8f31ebb4mr91862885a.13.1791269644496;
        Mon, 05 Oct 2026 23:54:04 -0700 (PDT)
Received: from trex (5.red-79-144-193.dynamicip.rima-tde.net. [79.144.193.5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178c53299sm86954585e9.11.2026.10.05.23.54.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 23:54:03 -0700 (PDT)
From: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
X-Google-Original-From: Jorge Ramirez <JorgeRamirez-Ortiz>
Date: Tue, 6 Oct 2026 08:54:02 +0200
To: Harshal Dev <harshal.dev@oss.qualcomm.com>
Cc: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, andersson@kernel.org,
        mathieu.poirier@linaro.org, konrad.dybcio@oss.qualcomm.com,
        sumit.garg@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] remoteproc: qcom: pas: pass no resource table when the
 firmware has none
Message-ID: <asSbChjNgM0kayo4@trex>
References: <20261005125411.2151326-1-jorge.ramirez@oss.qualcomm.com>
 <20261005161224.umj6zzov57tifv7v@hu-mojha-hyd.qualcomm.com>
 <asQQJNOd_p9acgT1@RAMIREZO.na.qualcomm.com>
 <2204cc64-d110-41f0-85be-7e6e1db79a1d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2204cc64-d110-41f0-85be-7e6e1db79a1d@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: iBMT5U8-yYF6xiJcCE0QbjnjlMDI5rfI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDAyNyBTYWx0ZWRfXxTYHSQ1h8w+0
 7n+dHb+VQO12EHTa7A+4Gq2QhhRiCmgCyyys177C3/dLy3bu3ibQ1hBr/vAJbm0iWKREypZqMnb
 IcCg6vHUMUUC3yPZ3+pivjDNDucaemqZ7z9N8QZ2b19fGTm0AbqtsNtAli0QGm1K88O1tNm5VRE
 83pe6N60XbAm/l1fQatzlAXO+CD2r9ru47Eoq1LtfEFo/s6Ivkq+UR0iSDLPTdBZZtJlqD93GUA
 axuS8dh/B6Bv5pc7YnlvixTTvdoKqnERi7tb9IueKEECYTX0U76c68w81ZswJa/aD3zeiBg/1Ai
 IBaSof7WW9bt/G34zkWO1hhIXahJE1bR9Drb879JG42TgWMEAiESWp7gz0Sa9meCA9vwGMSFirT
 AUdTwM68xN6mVfnIL1287vDipXVa4U99mcOKNK2swtpDYIPv25YiRj83q02uiOarTJtfv9GTlTt
 eZSkjcuv2bV1AHQKk+A==
X-Proofpoint-GUID: iBMT5U8-yYF6xiJcCE0QbjnjlMDI5rfI
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDAyNyBTYWx0ZWRfX+whtJwhDcBYT
 zANiExrwCYkjwMutEMphhRRPySdot2kNFdaZs8oIceDwopxyZkX06cVZeQ3qUrmpP2WcAvIs+GF
 gOODULQ4XDwsmVc9x2exOkGY8Tsbrd4=
X-Authority-Analysis: v=2.4 cv=ZYeIpcVA c=1 sm=1 tr=0 ts=6ac49b0e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=nno+U714v6U58lXnMUU6PQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=pC2VPh1sQNmcI4k0pqoA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_02,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 malwarescore=0 bulkscore=0 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060027

On 06/10/26 10:53:31, Harshal Dev wrote:
> Hi Jorge,
> 
> On 06-10-2026 02:31 am, Jorge Ramirez wrote:
> > On 05/10/26 21:42:24, Mukesh Ojha wrote:
> >> On Mon, Oct 05, 2026 at 02:54:00PM +0200, Jorge Ramirez-Ortiz wrote:
> >>> The firmware resource table is passed to the PAS backend even when the
> >>> firmware carries none. This only works on the first boot, while the
> >>> cached pointer and its size are both zero.
> >>>
> >>> Stopping the remote processor, or failing to start it, frees the cached
> >>> table and clears the pointer but leaves the size set. The next start
> >>> then pairs a NULL table with a non-zero size.
> >>>
> >>> The SCM backend substitutes an empty table and hides the problem. The
> >>> TEE backend copies from the NULL pointer:
> >>>
> >>>   remoteproc remoteproc2: powering up cdsp
> >>>   pc : __pi_memcpy_generic+0x110/0x22c
> >>>   lr : qcom_pas_tee_get_rsc_table+0xf4/0x25c
> >>>   Call trace:
> >>>    __pi_memcpy_generic+0x110/0x22c (P)
> >>>    qcom_pas_get_rsc_table+0x38/0x60
> >>>    qcom_pas_parse_firmware+0xa0/0x100
> >>>    rproc_boot+0x2d4/0x380
> >>>    state_store+0x40/0x100
> >>>
> >>> Fixes: a4584bff63c8 ("remoteproc: pas: Extend parse_fw callback to fetch resources via SMC call")
> >>> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> 
> Thanks for this patch, I was about to send one myself since I observed
> this on IQ10 as well.
> 
> >>> ---
> >>>  drivers/remoteproc/qcom_q6v5_pas.c | 11 ++++++-----
> >>>  1 file changed, 6 insertions(+), 5 deletions(-)
> >>>
> >>> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> >>> index a005546c265d..e871e03ba794 100644
> >>> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> >>> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> >>> @@ -463,7 +463,7 @@ static int qcom_pas_parse_firmware(struct rproc *rproc, const struct firmware *f
> >>>  	struct resource_table *table = NULL;
> >>>  	size_t output_rt_size;
> >>>  	void *output_rt;
> >>> -	size_t table_sz;
> >>> +	size_t table_sz = 0;
> >>>  	int ret;
> >>>  
> >>>  	ret = qcom_register_dump_segments(rproc, fw);
> >>> @@ -476,11 +476,12 @@ static int qcom_pas_parse_firmware(struct rproc *rproc, const struct firmware *f
> >>>  		return 0;
> >>>  
> >>>  	ret = rproc_elf_load_rsc_table(rproc, fw);
> >>> -	if (ret)
> >>> +	if (ret) {
> >>>  		dev_dbg(&rproc->dev, "Failed to load resource table from firmware\n");
> >>> -
> >>> -	table = rproc->table_ptr;
> >>> -	table_sz = rproc->table_sz;
> >>> +	} else {
> >>> +		table = rproc->table_ptr;
> >>> +		table_sz = rproc->table_sz;
> >>> +	}
> >>
> >>
> >> Earlier code was intentional please read the comment below.. /**...*/
> >>
> > 
> > AFAICS the comments say that the call might pass NULL and zero as input
> > resources. And this patch does exactly that - it doesnt allow NULL and
> > non-zero.
> >
> 
> I agree with this fix, it was strange to see a NULL pointer paired with non-zero table size.
> As the comment itself says, a NULL pointer + 0 size should be passed when the firmware binary
> does not have a resource table. This is also documented here in a separate comment:
> https://elixir.bootlin.com/linux/v7.3-rc5/source/drivers/firmware/qcom/qcom_pas.c#L131
> 
> I am validating this fix for Nord, expect a Tested-by tag from me today.


hi Harshal,

I have just sent a different fix that handles this case on the tee
backend instead (so that SCM backend is unaffected and can continue
implementing its underlying "null input pointer with a non-zero input
size 'protocol'"...the fact that a comment is needed should have meant
that a better more explicit abstraction should have been put in place
IMO ).

In any case, I have validated both patches on hardware with the TEE
backend. Probably safer to drop this one in favour of the other one.

Jorge


