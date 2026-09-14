Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DABE2445ADB
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 11:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789385238; cv=none; b=LUCjsMTy0TguqHO2JrSf1iaQ0v3zhyd4JxlvPz/q/mBJkNYwuVaWNgUqour50c1s+9Z/5ftFUGUBAlODVV8He6xMW6RzSRNYpmwy8MTVqzL1jCIKMjn4XJpPGE4uDQTDMlU3VUi1Bfi2H6iT2OfxQKNe8h5nYb+yOk8EB9cLE4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789385238; c=relaxed/simple;
	bh=S3cHWu7xcUvy0eCh33hOcgT4RaUxYY6azMPOstL4lBk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H4Jyhy490jfAHDElnttdX5djx3KWopZFsEE4rPQNnmVH2zls3qknwY3aVUYayhDozd4fCo0Bco0hDfX7nTC0OwBR0mMNag+nwsFAAwC5d3b7DyQZ6g8z1kaDvh2xmRT5g2U4N4mJly+98NIivRN3xArMYWmLYHIzEelgHmDz9CI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GosI7bja; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XkNG6nSn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GosI7bja";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XkNG6nSn"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAmfGL216046
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 11:27:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=IJCHzSLhrd043XzsASUdlLLU
	ScQGc2AdK8sGqJtE+JM=; b=GosI7bjaYzMwzcEP8402h62t9XHfpySomYVO4Bqk
	fSybZG9pT8UqZyqVN5Me7TOq6m7Tj1XDBr0IwPwwxOQBrQSpygh7HhiomPQxsJ25
	63bazsxsFuhHZhd0wYAN7K3bZBRcbQJNzRS0/STG7Jj/jh3qoBEtyIzGP6SeNiT7
	lvFKvoUD+OUG7sQxVtMIW4FwO9Xeeibk7YXDf3F8tv3MmXavGokYQCUKvPK+qfBn
	ks8b6L071OKQJOKth2ahP5De8DtjA1LnWice1oB+PZx1dAwZGqUwUzx3e2/TkZ+5
	9/4eZv/TsdFWd/ka/EbDENFxef8EeGLiAi1isL2Uw0Ma5w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9dedkr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 11:27:15 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-936e393061dso507895985a.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 04:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789385230; x=1789990030; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IJCHzSLhrd043XzsASUdlLLUScQGc2AdK8sGqJtE+JM=;
        b=XkNG6nSnbIyG0mrmEUJgkhyYesi8N1V+DAFl8UwY7LBi5WWB8jowMfS1JXW43R3P5K
         5Al0xvCGFl5jIn4KNMV6qJkC/ME3fgf3n08GOacAwBox5VWk4/pQqag+XoWYzUvp/MJf
         t9ZpkMkwhNjcXVNi7R0EALX/o7FIun/6eaAqR5q/Fn7m57XB90yOKF84WhDW76wSfJ2c
         YgvyxpsIjlphj28Px7s5+g1oxMlKifL5x9MTI0UIpMjSpSbOP5NlkuW0zgWmSmoRlJhj
         wKJLMwAXCNfcFJjJLp5/dY2dXcYQW99h9FsgFfMlKleCOOTuXPPGBzCm4sfwf9O38BZ/
         RLiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789385230; x=1789990030;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IJCHzSLhrd043XzsASUdlLLUScQGc2AdK8sGqJtE+JM=;
        b=gcSj2tj3JSmuuIjXIIX5zKE+5xjHuSy7Fr3CTtQ5oMPSPPtBCcfHC8vL5rfn8R4wC6
         33OuJPW2l/XaLzu/5X8lGzKLQOblwCqtMal/tGH7GGPRBPM6XlT4vX628YCsj1ah3B9B
         I7gFgbWgfpQoLzJfBt1ELcDiI0W9nsacQB3ne/+FqK6zzdt3u55TIg+KAeWbCYgnzVhj
         CHGhZkrZaXFeRypEG1zackJ4JcvsAEO/K6L8fHEU0hAVBSg0vlJaeW2gwcJBWtgqAaDy
         uMWYeTI8XjWX/ypTF50Gz9zGUm7v5DI3nPsBKTZUQnXSh1Vm1ifGIldHqapptmb4aZo3
         F5KQ==
X-Forwarded-Encrypted: i=1; AKwUvBxkHNJalebb5czap3BcLaKlz1mf0P37q38zA3A0GFO5Xak+NiDHei6vHAogdLoYuMUDy6CqY257m2OhqLk=@vger.kernel.org
X-Gm-Message-State: AFuF++mFYU20yhmHS54wUENnzHvOZ6Z6AKuqhbVM0q+0uvtL7NvgBOVZ
	cS9XcHL4t5GkTxnAti2bHh02WhFE8yF5NGYDUH1weKuzK/RnY/omdZFtHepv82czNoU5nGZz/5d
	LO5b7HyrAdJI2Hc7HE34r0Dm8RPF2lbe53Ldd+dhFFYSzQQ+FDSgmS3HHGU70ml6LozA=
X-Gm-Gg: AYBFou37WTp+XnLKk45E/rRQg7R5LZMaR/bNRVcoGMF6Ps2pVed6QprgZJ4dciEJQcp
	hbqx/hbnCMKxbXcx9RrWIQeRsWVFD2ijg6zRcSdNKr9TmafTrUwGF21cb99EOgtuS0+W7pVD/fB
	SslhL2W6HPC1eluZogOWSrx66PLRkkg89YHST7mxbf1GsvN9zjHVgdo0MnGYsfIusq7VielOKbt
	UGN3Vs+jqb7IEHvrz+oJqNWkzOEbHIfHPxqBUS1OT50xsZo7IfisZS0CbFXfFkqkkEw0Wh6iP0k
	t5M2L9JadMJ6O/mJiSTgxguN1Jz+PQaHw/U6RKbpv66gJ/n4c0SuTE43JGKabZRBfgyOxiwBhYO
	btgjT0QTL3NyjKg==
X-Received: by 2002:a05:620a:1d0c:b0:93a:21e5:a8e5 with SMTP id af79cd13be357-93a2986f870mr277729185a.21.1789385229845;
        Mon, 14 Sep 2026 04:27:09 -0700 (PDT)
X-Received: by 2002:a05:620a:1d0c:b0:93a:21e5:a8e5 with SMTP id af79cd13be357-93a2986f870mr277720385a.21.1789385228954;
        Mon, 14 Sep 2026 04:27:08 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb32e7f5sm26107741f8f.9.2026.09.14.04.27.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 04:27:08 -0700 (PDT)
Date: Mon, 14 Sep 2026 14:27:05 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Wangao Wang <wangao.wang@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] arm64: dts: qcom: eliza-mtp: Enable iris video codec
Message-ID: <ccceh4gy3otlfegvbd2macgc2kend63gorsak2eukap4jm4vbu@q5pcxpw4od2s>
References: <20260914-add_iris_for_eliza-v1-0-e8ccd9b8cf7a@oss.qualcomm.com>
 <20260914-add_iris_for_eliza-v1-4-e8ccd9b8cf7a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914-add_iris_for_eliza-v1-4-e8ccd9b8cf7a@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE2MiBTYWx0ZWRfXwQnIHWJH7sn3
 qkvs7U1aEHe5xUZd0Z3hBdZy40ImjfYS2PXvhcvlCVtPcNs7evH2zJ8+3AEdkB7o2npvGLsEhaK
 tqTbMLT0nYPe3Sgyy+cpu1w03maGfNHAMTZTNSjaYKP3vRNZeP8E89S4DVaOneWK+2bll+g91aS
 5QDaNQJXlmMQOv92j3WoskkxJC+fHnoWlU81BVy4t6ZPFFo3qU+0qx7S2fqmEwoiOoZWeSmKi11
 YlupDn0SH/MsYoEavOGoiujFkzmcztw5zgQy+fa8E8eP7h+XbBRnCz/PXlxVlO2TKnkdmA7jh4v
 NB9fAypQ7KXMlTNpzG+b5RBBGM4v+6G+BKCDM/YQ746Gm6vGGFx57YzagiGF5cMsw5sTA1gt5bl
 XPN6cdUBhP6TebngVuFXWiOfOKTTJHpgTb+AQJ6qoJ4hr84Xq6gaLT5FfEAg4N++z1gaCwzgHtF
 eCU895l8ip0B+itGfCA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE2MiBTYWx0ZWRfX6rkjh5ST8vVv
 qnrY5aPqx1TufG8V9W/nQKO/rKlfFIZAq0vGpvDtQmPk4Y6U6TSaTlY+6XdKyfCnGyOARCwmAE0
 8uC5Nvj0FSDSHxKjVOUsieqz1kiftGA=
X-Proofpoint-GUID: l-8bZDqyLGwZUz4SsfxKMV_TQrNw8tjS
X-Authority-Analysis: v=2.4 cv=OeUNnRTY c=1 sm=1 tr=0 ts=6aa7da13 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=zFfZ_-Fbgzo0WQ8s5VoA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: l-8bZDqyLGwZUz4SsfxKMV_TQrNw8tjS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140162

On 26-09-14 17:54:26, Wangao Wang wrote:
> The Eliza MTP includes the Iris video codec, but the device tree leaves
> the node disabled. Mark it as okay so the video codec driver can probe
> on this board.
> 
> Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>

Can you send this for EVK as well?

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
