Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D19DA3F1ACE
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 23:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789514353; cv=none; b=TyQlA1ZWNioA7OY11T0U81NurkYjZp2hb4Rquo+PpTWLD5kx6uwRIxnJgITBGe5rvdPHKbwHLpMVQ3WrS2tT9aVt/ynbOPtbpSIa2nvneT53EJ4OtVWiivRULzZCYi4AyDU2v0oIByQmIgw9VChGwQGKjPQoSmfVAEbT6EIkhQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789514353; c=relaxed/simple;
	bh=LB2WtpgONiLQ7gm4vgAWhynn32lwn8w7mumONl9R1DE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=G8u/LVklMoHbt4DwFVWzcf9HsUjAsNkLgX5O3IGJJ7fbJksQ/znB14biSHNRNkuQjEVpqbHD9tX+T3o0Iu9VSn0Z4sJO/PY1mRawddh6H/7/pLApcvzcSI/kmqCvmSzeG9U9VtNNxnnrHHwacfNCTzg+L3Xk8a4CDVkWFnhK7rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k/QXEAJZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N7IqOwBO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k/QXEAJZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N7IqOwBO"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FLYuq0079860
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 23:19:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GtfgcKKZ9v2ZBngMs3bfVx7nttoh7eLy//n2NDiu6Fs=; b=k/QXEAJZPF8o0hbe
	zJKDfE96pVBa6P6bbffHXgxPf8ByvvwCNLbQnT8jOezZGipe4pQSNCGmZX6SRja8
	s/9qSA3W+q10+k0RWG6A1fN7nTsXKcU7JJTQK8pJfgEic5IZceBfiq/G7j6jw4Pl
	qEI1MTMbuUDn0PJ05QNcU2Mi8jlC0Zoc9UhECS73gMVHhyBVerUWFJPQASwRjnvq
	NScXnu5WeM/LgfqcvMDPKyDNt9/T55bqjZ+k+djBfWZDep2JIUzDzKpCYkRxsXTi
	dkTVzF+P5nstaHlgNeZqW7wrKLfy/uLQa0i3+5pealS2Iu7hagzVSugToGtCx19l
	IGD4Kg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqagehbfs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 23:19:07 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39af92138f9so2576753a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 16:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789514347; x=1790119147; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=GtfgcKKZ9v2ZBngMs3bfVx7nttoh7eLy//n2NDiu6Fs=;
        b=N7IqOwBO1Qwkr6StMrDXcuSSlWQsnVPY0UGZ4Wdqv5sRHFllzUO9erQvSXnJ+TSFRO
         XVRRJ3XA+VJ6zDwQbvpMHHaxUhBDQKBxUD6uK5SpQRRgcZzjxHygcomwMxjwmSBYZXpM
         jA0HAATNqxaPpBIfvJNMbNe59qLMLr58oavwv8gi387lC58A7eZxyGqmR6e6sjySV9D5
         AgIQZy9l46SZ2oRaBOCJ1y1rGojPljU6towen70mzyQkiV/o7MB5GCwYDl7vDeD6jOZr
         wVHdymRH1TtaQD49eY74BLpKauyB5KS5qfHfjLf+FbNcF2swXcjbJBQ8KAY/Hft9IiEg
         md3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789514347; x=1790119147;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GtfgcKKZ9v2ZBngMs3bfVx7nttoh7eLy//n2NDiu6Fs=;
        b=WfIR9pDyJwSywq+pg7LTPhcBteSE/EBllk9lzXrpfp3vH6jlgAZC1a8uHjmNYYzVp0
         omxHLBC5xfM5jQz40GphjHWBqJjF0/KCZfFbukvzSNZP+amemrzIwUz7C4iQG909Zdom
         P3Pg4eBm2D8EajyAqjtXK+9e+n+T8byEotYR5te9Smom46vUypvRn+CurdE5HtnVe/Vi
         VrQe0/Gz/FRyfamkRzLb6PEztOEWubY3UNsHmtb47h7URDc9aQgy27Nu8kZlh64IRKaO
         0X81q3wo9P+oSc7yKumYfeeOWdta7mnstgTIIDQBsS+YYKDZdzAP4HgSxADKmf5v/BOh
         IgHQ==
X-Forwarded-Encrypted: i=1; AKwUvByVe3H5CU9fAiG5AK4a1VrKvpEX7iYoPhDzQFHTU2N3aQGIEn5eFEAm09TnCBeu4rq4iHuGUhWyTJ8CpbA=@vger.kernel.org
X-Gm-Message-State: AFuF++m9ICh7fmqBKB1nMopiI1HDXJuuyunUakaj44zPi9vypkntJILr
	WAUvVMU8/msh1/AxospsngO4t2w/XTperZzVGKHJr+U7zrtlZZj511ikZhgCqOYyDivvI9rFfZr
	X8VRwjgEW+tvwhfhI92AfFw/xO8F48Ml3O+p5a0ZWencaZDZXJ2D4XvYfjBW2FJ8dKo0=
X-Gm-Gg: AYBFou2lzgKuR+h7pRwVCVgtnk5T+u2fTeeJKGyNhT7gqS7X78G9AJFApNxxEcIJX0D
	zAKcaGwnLJB0Ho9n4R8/wByTxt0lOFs134s2Cse9lz49ytaHRgcSnA+R+Cxnff+PgfWd2SapKIv
	sWBgPhJJX6h06oJvtZNqHnvIKaZFbjncX4TgenJxaZzI56GUwaN9dNNyabvuKSN3UMf6Jne9uuo
	cJ5U5uu//h3OEJ9CA6d6/7Q+RcvJPObi3m7Q6vN3DDgZZnak9qpImzK4+mvONtjx2WRQ+6gkcMp
	HU+ytGcEPBGcSNsl9tNcc9brETQGYSi6Jnaut4E2lkNzJo7N59FEaMH8xpSbathut/97rzJpdJV
	yMKNCKM2Rt2y+LqTPL1DrKbRj+Xs=
X-Received: by 2002:a17:90b:398d:b0:39d:ec1f:b3fd with SMTP id 98e67ed59e1d1-39dfe036be1mr8656442a91.8.1789514346885;
        Tue, 15 Sep 2026 16:19:06 -0700 (PDT)
X-Received: by 2002:a17:90b:398d:b0:39d:ec1f:b3fd with SMTP id 98e67ed59e1d1-39dfe036be1mr8656394a91.8.1789514346415;
        Tue, 15 Sep 2026 16:19:06 -0700 (PDT)
Received: from localhost ([50.35.44.179])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5a6a175sm2279027eec.9.2026.09.15.16.19.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 16:19:06 -0700 (PDT)
Date: Tue, 15 Sep 2026 16:19:02 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: <will@kernel.org>, <robin.murphy@arm.com>, <jgg@nvidia.com>,
        <joro@8bytes.org>, <bhelgaas@google.com>, <praan@google.com>,
        <kevin.tian@intel.com>, <kees@kernel.org>, <smostafa@google.com>,
        <baolu.lu@linux.intel.com>, Jean-Philippe Brucker <jpb@kernel.org>,
        "Eric
 Auger" <eric.auger@redhat.com>,
        <linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
        <linux-kernel@vger.kernel.org>, <linux-pci@vger.kernel.org>,
        <skaestle@nvidia.com>, <mmarrid@nvidia.com>, <skolothumtho@nvidia.com>,
        <bbiber@nvidia.com>, <harsha.v@oss.qualcomm.com>
Subject: Re: [PATCH v5 03/15] iommu/arm-smmu-v3: Add Q_POS() macro
Message-ID: <20260915161902.00006cd1@oss.qualcomm.com>
In-Reply-To: <1db9d32df4a59dcac286e7a82bc2704cdd69b8e0.1789446520.git.nicolinc@nvidia.com>
References: <cover.1789446520.git.nicolinc@nvidia.com>
	<1db9d32df4a59dcac286e7a82bc2704cdd69b8e0.1789446520.git.nicolinc@nvidia.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDM0MSBTYWx0ZWRfX7lFOY77grJe0
 P+jCJLJFVgEavuY8/1BJ/NyAJ51HapjtbHEpd5rJyGfxBxsN+uy3xZ5DIopiBQaPbareN5Y1CBh
 res7OWsGovTag0noFc8pe79S7Tmetog=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDM0MSBTYWx0ZWRfX9O6lcDvAsk3L
 WMEIoxUNmjxm10A37bD/9xgfcw4XVVs5nqy5QKY/vbNBl9cVrEYd21+WIZDeTtaR77XZ1MrH+hI
 q/4Qg/IC6S95OohDSJfGQhfVQSdhz8sa1++xoPbhN2cTV2RT1WNz0pSKlFWz0Rmi+7KIS4Fn+K4
 lRvDNVdjGlCtDuqO5VowLY33IfVOOd5+iQ/bMpnZ5Z8oviq6eBVyh7EkJW76xq0P6NDoDhp3KfM
 ixOibh/7wZFnNZPQNtkzcrmQdajUjhmcbaZ598dMwtSfHFZmWPmIbTMor8eUeGgNsNIBQxs4AcJ
 u+FUqihkGIAGH3gbRaRH75tbXsFxbVJdKuibkKWDiJ/CFK4VwAG90nEZmbckzkhtfSVayv1wl5/
 n6/ZaqNin/uvjglUH3tvv6cdvrgRMTelkNYacikVt/tnCBX0em5V+faeblp/DgMotWKTM7+gtqq
 tZggQpgq1A94Okw6ZSg==
X-Proofpoint-GUID: 2T7mpSZ9hV8uI2m69l2TwnlN8_T3M2Ma
X-Proofpoint-ORIG-GUID: 2T7mpSZ9hV8uI2m69l2TwnlN8_T3M2Ma
X-Authority-Analysis: v=2.4 cv=PcZqFShd c=1 sm=1 tr=0 ts=6aa9d26b cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=aNnz9XPx1a4JIXSYt2cE/A==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=Ikd4Dj_1AAAA:8 a=EUspDBNiAAAA:8 a=39RnTaQb96y4xN-8A7QA:9 a=CjuIK1q_8ugA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150341

On Tue, 15 Sep 2026 09:38:15 -0700
Nicolin Chen <nicolinc@nvidia.com> wrote:

> A queue position, the wrap bit combined with the index, is Q_WRP | Q_IDX.
> It is a (max_n_shift + 1)-bit value that wraps at twice the queue capacity.
> queue_inc_cons(), queue_sync_cons_ovf(), and queue_inc_prod_n() currently
> compute such positions by open-coding the two macros at each call site.
> 
> Add a Q_POS() macro and switch the open-coded sites to it.
> 
> A subsequent change will build a Q_DIFF() on it, to count the entries that
> a queue pointer moved past.
> 
> No functional change intended.
> 
> Assisted-by: LLM
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
