Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 456E43815FD
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789372158; cv=none; b=DCGWIjGuBKhUHHkuR8vPx4d6Pz8QaX0Fa1dhrqZwChj3qSTObiC+xBbCJb8LULG7gaU12tFxS5Q7VPfbZ99ltDvPLAm6OW20k5slZyfHd6UTya9mJ72KnR65SfzPeEEh85VTkK79tvQQtzkN5f40JpowODkfaa5WboabVvYGwpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789372158; c=relaxed/simple;
	bh=F1VjdFSl9/atwZ3hE3R7ac4wdUgSa2oHodjWqqw69dI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mctDG5IJP8VfE6WyCV85HYwFimo/yFJoa9VdySsoMLosZeZrcbGD6xFsWL3dUI/zTcYsrYdlpSbchShwKCbckLMcZGtfBVGhcicrsa5Dl6EJBYdG+IGyuN+JefwSc/5kv5H40moXLGU3A2O2g7u0W++YA+6nY2rfoonFwWKP810=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j4dK/xei; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bV+G9hnG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j4dK/xei";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bV+G9hnG"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5j5ZI063767
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:49:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZjLBQtd7svl9wuiVQ5/yYYCt
	Te6o0rbws3eQ4NEqK+4=; b=j4dK/xeiOzAb+5QAa/E2Fq28tsoKLnCeLalYD6L6
	mSfppLO0hQVNqP7uOVQAZkeco4fdb+9zcxJ5B1RBzuCLsLqI9nPyBawp8OCIiTjQ
	reBwH8gh4WztHsfYWPxzHUvpD4SBtzzjaEzzoZASCz8FmSHeDJgXjIrzxBR02fqF
	LSQ8rJjrRD08Ejq0xnWdEzrr0WqHpbQXkOjekPzOA7eWqgtNo7FlR7tl1BG7bLsj
	fyi9vcDalCg3FHsQ/aUnrmeoHkFsm1cq/wNYxq/z4zbM14NB9RHPSatq7IgmECrz
	Ur4LZ38JD7GNQfMERrGTglVNT1p7d483x0ryEeVhd81XMw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9dnn16-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:49:15 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93a1d44c437so121807885a.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 00:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789372155; x=1789976955; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZjLBQtd7svl9wuiVQ5/yYYCtTe6o0rbws3eQ4NEqK+4=;
        b=bV+G9hnGPELImCWzvHXSD4pv826MpOm3Lnfl2RsYW+65mVFy5bd+4goEEz1w6VQrv+
         /0MrzYJSy1dnDt3KQPdTPKBQw/sFrAKVqGAzszDYYMB8/bBkUOqw6IdHTQbF9jUOyYYM
         q7NjLKAQWrne5R+LTSU4KJM92DpISCUL0QWmFyRKjUWVx0bKrHwarvvSLq0VvC8Rxs2N
         V64+gOKtFVD9VSSl6fwi/mF6gSP11My2F7HYwJ9u8sh+FJz/IBPidsv/xNAyZqsWOAWI
         j2YSlSvsit7Z6krlVlr217SbazGDrgmCvEvL4ARWopliWTfINxx9lLzTc6bxjLJL8Mmc
         ZFMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789372155; x=1789976955;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZjLBQtd7svl9wuiVQ5/yYYCtTe6o0rbws3eQ4NEqK+4=;
        b=m2NBcWb7lCOJgaeR6/Z9CgYGLWnr4sLGdEMUZjRcpc37dic6wKFBsiTkIVViIgV+/m
         Q3zhJhFuKg/M1MK8Y9ubSC7uzYPHkzCZmMlS1se9KFLErznWbXuY/SCE9sOqYLBlAitq
         2/nshx4IyljIuqioUCMADnJaM3K3XF/g/pDbtHMKXigqAgTqPAb3/5o8p4whemNlPBJV
         LEQnI27O4OrsPJQJsxspxbD7VQUZN4SQzfI0b2aRgP4lkFek2n2TQ8V9l85tyYv82x4q
         AnBMa4zJeKOimH01Wf1NFi38m2YOq20Qt/4rDg/D+MqCIH+GyvExJyW2vv/+o60+ebtE
         dRpg==
X-Forwarded-Encrypted: i=1; AKwUvBwYSFj207CSuX2cZJtFqixHBhJGH5k3gMKXXrZTF/F3PYlk29wtzThdelChCnV/AlyH9GNuwwiKm3l2LSk=@vger.kernel.org
X-Gm-Message-State: AFuF++kkLORJURtpipWcnIxqyaCdA8z5BpGD59oauGVI3XI2qd4u0LVR
	YSeC56HzN7+rQhmgEjO4fmJMpfmf7d2hmRl1xvjXd1EOiy7Hz+H1Mc3yGUcNEtJvLjDB03kX9FK
	8mz6ycw93p00x2GC6bBLvS0Y+6XJHg7EhtHD2NOeoN1v4njpmU3j0tt2lNVtu7Li0f/s=
X-Gm-Gg: AYBFou1aGbEdz9rr2Cq/tUAq20OIxiBtCkcEmI9wutQ2qItllPzz4f3mB95eoc6Smro
	Kj1nbk16ryPUrkLutwKro7XwguJNbw3KMTzmNy0PKyii1XvIMEQOOfolNMpbnkimYiGxrMM3LAm
	Dq4AHlImqoIfKaK2kUJ++aGLxdGzHysEx6Ql/1+T2avg3tqV2RJBPpeLGmhtABH7kk9rPUYwn7U
	t513Z/4KMQYcrMOLgeN3g6Tu9cNdA3vxczxXCV6m8JROfPv74w7dD4zPKdMtA2tXNyX5cxPfaP2
	L58oBSaCKNk9nfttY76Mgke1Wm6o0RxzjqCDGFnaqlBStQwPQHU3xh0zZ5L/4LTRoOhJcHCEQ21
	7CJpaiD850EE35Q==
X-Received: by 2002:a05:620a:6886:b0:939:9b1c:ea4c with SMTP id af79cd13be357-93a29975ae2mr193516885a.28.1789372155272;
        Mon, 14 Sep 2026 00:49:15 -0700 (PDT)
X-Received: by 2002:a05:620a:6886:b0:939:9b1c:ea4c with SMTP id af79cd13be357-93a29975ae2mr193487585a.28.1789372150065;
        Mon, 14 Sep 2026 00:49:10 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb2ecfc3sm24108231f8f.4.2026.09.14.00.49.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:49:09 -0700 (PDT)
Date: Mon, 14 Sep 2026 10:49:07 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Ulf Hansson <ulfh@kernel.org>, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pmdomain: core: Fall back to node name for idle states
Message-ID: <algsevh27dlkxbqfwxogx4irhkxs5ps2itl22t2idupk4b34d3@zdh3kibxt22p>
References: <20260914-pmdomain-idle-state-name-fallback-v1-1-e4242c409a0b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914-pmdomain-idle-state-name-fallback-v1-1-e4242c409a0b@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDExMCBTYWx0ZWRfXxyaT0KCG4X4m
 wxumQQ17KBftwLLlfZyeTdD30jYJAykGHUQ+4eE7H3O4f77SftWmv/p/0eguecG1o/da2nu3Sut
 WS5+Qg8V/jTbMqGybKqxk1m6bCX4+6NBdtYl2DWwGE48fxc2UaJeArvzVLF3MxsmFI8fLr75zro
 y3Gr9MiNbEDkizgH5gn57LrNfbtVHwPoNSVM2lXNGU+N/HT1lZIHRY1UUZqn0yr2k8UiEco6AS4
 AWyIeITbhHh+SOdywcoOOU20x3DF5LI36f/FYALTQnMUenzO0bhlMbqaEItdlXFokPcY4o9L3tu
 jSSsBmvZ1XJ8e82nNM10q47G0vdWqFhGC5j2C2CeykZJsou/UFTKmWVLP35G4jp1y6UT22ygPT4
 it5GW/fuSKhpLpDfz94TRViIUwTpNxLwLZPcb0VqpZb4OK2K0iIJQTo/CAfZYYj6LlZ2GVAvJH9
 nl5xl2HMnwwog4laQ4A==
X-Proofpoint-ORIG-GUID: Da8v3qFbfcDCSQQ4t6M-ez5ZE7Z1LUy8
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDExMCBTYWx0ZWRfX5nkCdAQ1gSPE
 Zt7qApw5s3AWoet8JU8a8j1pNL2GcVICqTvU+dRl9fzhGyGU9MuVT6rwqFhFMtHwt/vxzTeD/xS
 gd92EztQUlnYl6DzX7At/6PJIwJhE/s=
X-Authority-Analysis: v=2.4 cv=Y6htIReN c=1 sm=1 tr=0 ts=6aa7a6fc cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=5kt61lt8hwMnmxBZRvwA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: Da8v3qFbfcDCSQQ4t6M-ez5ZE7Z1LUy8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 impostorscore=0
 bulkscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140110

On 26-09-14 12:24:25, Maulik Shah wrote:
> The dt_idle_states uses idle-state-name when available and when missing
> falls back to the node name. Do the same for domain-idle-states.
> 
> This lets pmdomain idle_states_desc debugfs show a name even when
> idle-state-name is omitted.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
