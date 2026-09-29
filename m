Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 544954FE2C1
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 16:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790698219; cv=none; b=lYhY0qau2pCSZVoD1bWq94BdI98cET6OeChsNiJlBgvEu4vyJy3EZvbFmPyUvc8TPaasVip8Av6oQsx9UnhvQABXcOUSM/aqIAQDqio//ASQbYGbEGUb91Ku7hxH1m60LfvyR1C0tRzP520Pu1uf6W3QPfpXDWmaKi1LVMKtMno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790698219; c=relaxed/simple;
	bh=KeqC9VQXrB3+4LnVZRdfg14afrTEwBP8hLl5Kyalv0g=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VIgZBcvYvohuFdajW91qgiAJuYIo8fVsUnq38IhAyeSAdjLSt4SybGvdhwg0SnU4KiodXVtSXDqo7nKHfFkBVxo32OcFuIUihNq5TIvXwBHUghA88QBBKRBQc/4AIysJdL+u63kj/+kdWpmu0p/8rrwgOGLCHqQPM/YRkPDPytM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QmJ/TaNb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OFd/2KE/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QmJ/TaNb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OFd/2KE/"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCqfCP3936790
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 16:10:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3nZ5FtLuY8+oVQiX89WT/WoAXT+i4QfhDJec0aS0UqM=; b=QmJ/TaNbDw+ozn+u
	9yy6hwUNlhl3CuoQ9RpIiupjF2ujDaTV3C/H7E7HAOGbiYXv/kmRExf9S61Tkfxu
	QrRmCiDQ+TFmaZNNgO/wjzrm/LLmNR9YXFWR0rX6UcwYd62VLLyyuWSXco0rFfbw
	zhuTXhw5rLjACGxdrSByOdJa+hg1e4Cdr+nBIGqeVutomoVGRnDEqWt4EM36UdQ7
	oZ35NNbP0Xg03yUqk1UkdXpvkXDKnLJX2/H8+cVTX2JGBLVRxkky3uwIUjSOQGbj
	Eo7Q9+5xBgIc25meQjENE6wkr/9ToMtugDaKGRAD1QxSp0G9Y8YlSGcO81fs6Hm2
	T63uww==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0bn1hg05-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 16:10:17 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-139b62317d0so14913c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 09:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790698217; x=1791303017; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=3nZ5FtLuY8+oVQiX89WT/WoAXT+i4QfhDJec0aS0UqM=;
        b=OFd/2KE/TYlOOvf1JKnlMeXk32YcFv79Zlmcg4JI5CHY3IQL9PB69yUdz8xUSeZmpM
         azWi3w6JstGTNxykoqDXJZvhKtjkmkwcVkQD3EVn/ra9ByFTENFBe5ZXFE6WddKhURip
         KNitepjo89FBNAK3BTc9fiQ36rkOClFCMMWbljK4PotmPeco1L9D8c5GKzqP+jMk7BkY
         AcMHVMC1gOuE5g0Rl89Fze6dYlAoYWu4e9aBQqcfIQfBag8B+yfZ2EPx4Ur+6av3osnr
         bPDKTHXe+ufY9rZKLI/OPYpz/a63HCREnW+nVJtJQ15KW/l9++fVBdY+KRNwuI3VmTsf
         sWWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790698217; x=1791303017;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3nZ5FtLuY8+oVQiX89WT/WoAXT+i4QfhDJec0aS0UqM=;
        b=jOmm1s0g2PWDNeX8LH76JFB7MmzMoB1fWzOcumtCXl6GF2alSzhgbz+PzoouLsrrWG
         OjEeC0U9dqWz/PJZVlBXD7gZ8elSTWwMIO6pIuG2TgPnhWNEoCkWzylZ+0Rg907B7Tsi
         l61RoVZKnWqode+k5jvhvYJi0mVTmRuRE7I3U1Atw2mrXiWEDzbaUIkBA7t78Tg/gY0e
         agiIV/ESlW6TObkdI+epbdUXDqhaZ7JR+LUM53zB6Mwd1TxeNUO5Iqjk0eczn/pCEFzy
         T+4e51jkluSyOi0hxNPDQ5n23oklPRu4AIj10a/64Mh7wObEK7zeW4yFVasoDlDEbLbx
         mBAQ==
X-Gm-Message-State: AFuF++k/13wDtrOV8yDNij3x5f+IVRtY7gfrrkC7cW61T2FdlYNfgjUs
	zXTZ+Mgy4lvEzlgdGZqDatKF6gVCkl6f18+RCH2hVp7PZCk5PhTQhQK6fdy/xR2RQpFxksH0pDX
	L9EjMg2hZ0Ht/00w36fIwVW6MFP9DVjyGLuJMjaasV+kWAmo9qD+OBQ2dmu7e0d2SmxM=
X-Gm-Gg: AYBFou0RcXaG1lKNah8l1rvhEIw0OYCegM8FGNIEp+cgt3G+5jVikDUtfiLTLrC/u8l
	XHWUpl3OEu6ui9mLNqDx1opUr+rGdDRNQu6CTbztipqwzggm24M9WGgiDh/WBCZ+1wmysZvE7KM
	Lf9q85Z5skrXgi0wEgXD3rBc1lBvxXXvZKRwqGZ/MiZR8xvUlU+MDIU+FtrNTkzWFnwpRnJlV26
	xlYtMIK5vGpvSkYxELEVHoTNXEo5WIHzaB2L5/imi5ZsyNYu+tx4ji/sMJTYS+O9VAVemxgMkWU
	Tk0OTfwjEH5AMGQPp5lgmSHJ1E1OiV5Vqq0tFJ+l1yynTrc9isRF+3WAp/pyfNfMNI338nYsiVl
	xwwGqzI/OxnJmk5eTOzTN/BKTs0tg0cNt8SNjY7idtbAuiZCaaMidkSE=
X-Received: by 2002:a05:7022:7f1c:b0:149:cfa4:9b3b with SMTP id a92af1059eb24-149cfa49d51mr7719489c88.3.1790698216625;
        Tue, 29 Sep 2026 09:10:16 -0700 (PDT)
X-Received: by 2002:a05:7022:7f1c:b0:149:cfa4:9b3b with SMTP id a92af1059eb24-149cfa49d51mr7719451c88.3.1790698216013;
        Tue, 29 Sep 2026 09:10:16 -0700 (PDT)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14c6489457asm350724c88.15.2026.09.29.09.10.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 09:10:15 -0700 (PDT)
Date: Tue, 29 Sep 2026 09:10:11 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        arm-scmi@vger.kernel.org, linux-doc@vger.kernel.org,
        sudeep.holla@kernel.org, james.quinlan@broadcom.com,
        f.fainelli@gmail.com, vincent.guittot@linaro.org,
        etienne.carriere@st.com, peng.fan@oss.nxp.com, michal.simek@amd.com,
        d-gole@ti.com, jic23@kernel.org, elif.topuz@arm.com,
        lukasz.luba@arm.com, philip.radford@arm.com, david@kernel.org,
        souvik.chakravarty@arm.com, leitao@kernel.org, kas@kernel.org,
        puranjay@kernel.org, usama.arif@linux.dev, kernel-team@meta.com
Subject: Re: [PATCH v12 06/25] firmware: arm_scmi: Add basic Telemetry
 support
Message-ID: <20260929091011.000076d2@oss.qualcomm.com>
In-Reply-To: <20260928130134.000019ff@oss.qualcomm.com>
References: <20260920091928.2014972-1-cristian.marussi@arm.com>
	<20260920091928.2014972-7-cristian.marussi@arm.com>
	<20260928130134.000019ff@oss.qualcomm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA2NCBTYWx0ZWRfX3T7NaCmO3UeS
 8sCqIGJsbrTCKg6PjqZvUV/og7mKeL5BPp4WtWyF9v7AffJQthy2+OkoGdsF1+s32bPKGb3gNdr
 MRaKDQnThsrFdm2e5XUEokoBFPLd304=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA2NCBTYWx0ZWRfX/5KWhzbi6H/B
 g9tQalJq+yfjbTUKxXz/iSvQol/qTmbFBQ+THF1LYmDApiAxRPLGhDaHaMbumvDOBvFN/a8Oirp
 wf0EzZcZSL+pdvvHOqo4feUF/E8/o+STn/XZ/JNgj2ZLPE5zzo+siEj5ol3GbUOpppfePEtIAtm
 NGMwoTMMq7MG4BlyaQfGg07NOzNE124is2wo1I5AgjKmIamoZft4exyOvAGurHu3rzxYCLdlCdc
 ghUXsz2gSMUouEO35BzrjGZipyNJTBSRnXPqbeTe1XcGcFbDIDrqjfYwzzGjQR8SJl7FmcEfqnu
 Qfn4qib0EWcCGXx6g94jRcsjr8LmEf+1QjJ/tXEizsMmzdM05DFr+gaAxhOR7c6lZ6627oQyIjE
 x69q2p5wqU63qsi4AXYzPuV83DqBDQIOIlV365S5HgfwFj9cGQyfZGsJILXcDejWx8wcC0kvij6
 QbhLItslUediaXcpB/w==
X-Authority-Analysis: v=2.4 cv=JMiuIMKb c=1 sm=1 tr=0 ts=6abbe2e9 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=Usant2sCTZzwgyS8W3EA:9 a=CjuIK1q_8ugA:10 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-ORIG-GUID: _h84rpsqgZ4VC1iayNMc3zjdbRvExHg3
X-Proofpoint-GUID: _h84rpsqgZ4VC1iayNMc3zjdbRvExHg3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290064


> 
> > diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
> > index 5ab73b1ab9aa..2850b018da0d 100644
> > --- a/include/linux/scmi_protocol.h
> > +++ b/include/linux/scmi_protocol.h  
> 
> > +
> > +enum scmi_telemetry_compo_type {  
> 
> I'd add some breadcrumb comments to help people find the sources
> of these.  My personal preference for enums of things with spec
> defined values is to also set every value explicitly.  Makes
> it a lot easier to check individual values are right.
> 
> Note that there are quite a few more entries here than I'm seeing
> in DEN0056F so I'm guessing there is a draft version that isn't public
> yet (and I'm too lazy to see if I can get via other routes :)
Ignore this one.   Somehow I didn't notice two columns, though I will say
that is an ugly style in one table!
> 
> > +	SCMI_TLM_COMPO_TYPE_USPECIFIED,
> > +	SCMI_TLM_COMPO_TYPE_CPU,
> > +	SCMI_TLM_COMPO_TYPE_CLUSTER,
> > +	SCMI_TLM_COMPO_TYPE_GPU,
> > +	SCMI_TLM_COMPO_TYPE_NPU,
> > +	SCMI_TLM_COMPO_TYPE_INTERCONNECT,
> > +	SCMI_TLM_COMPO_TYPE_MEM_CNTRL,
> > +	SCMI_TLM_COMPO_TYPE_L1_CACHE,
> > +	SCMI_TLM_COMPO_TYPE_L2_CACHE,
> > +	SCMI_TLM_COMPO_TYPE_L3_CACHE,
> > +	SCMI_TLM_COMPO_TYPE_LL_CACHE,
> > +	SCMI_TLM_COMPO_TYPE_SYS_CACHE,
> > +	SCMI_TLM_COMPO_TYPE_DISP_CNTRL,
> > +	SCMI_TLM_COMPO_TYPE_IPU,
> > +	SCMI_TLM_COMPO_TYPE_CHIPLET,
> > +	SCMI_TLM_COMPO_TYPE_PACKAGE,
> > +	SCMI_TLM_COMPO_TYPE_SOC,
> > +	SCMI_TLM_COMPO_TYPE_SYSTEM,
> > +	SCMI_TLM_COMPO_TYPE_SMCU,
> > +	SCMI_TLM_COMPO_TYPE_ACCEL,
> > +	SCMI_TLM_COMPO_TYPE_BATTERY,
> > +	SCMI_TLM_COMPO_TYPE_CHARGER,
> > +	SCMI_TLM_COMPO_TYPE_PMIC,
> > +	SCMI_TLM_COMPO_TYPE_BOARD,
> > +	SCMI_TLM_COMPO_TYPE_MEMORY,
> > +	SCMI_TLM_COMPO_TYPE_PERIPH,
> > +	SCMI_TLM_COMPO_TYPE_PERIPH_SUBC,
> > +	SCMI_TLM_COMPO_TYPE_LID,
> > +	SCMI_TLM_COMPO_TYPE_DISPLAY,
> > +	SCMI_TLM_COMPO_TYPE_RESERVED_START = 0x1d,
> > +	SCMI_TLM_COMPO_TYPE_RESERVED_END = 0xdf,
> > +	SCMI_TLM_COMPO_TYPE_OEM_START = 0xe0,
> > +	SCMI_TLM_COMPO_TYPE_OEM_END = 0xff,
> > +};
