Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF4E3A6B9D
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 06:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791269711; cv=none; b=USYB4QxW3N1SGJjZwJKJXgPN/EKTacnnJsHj75+bWyiGeA4BEPB4db+CTtqQdLwWfrBjX0hl6yCtpGQXMHANkI2ct8/8s55GLlusVJp7tpx+zoWpCMTANqowqPk+n26QaePrCv2iPQBQRuOLV/E+MbSWptjjhPAxltYEWqdZSuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791269711; c=relaxed/simple;
	bh=7dKDDP0i/mrrGmWLytyyROiGlnWcBLYibhwQwAadghA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GNVhn4Lzq2sg+yclX9Zx1xIs93sMJZ6Gt0X8p4a3KLXz9ulQXFzaspx/8/5fj72h3rNqR75YnGzrbLFB0Z3ZSf0k95xAoUFeX5WZGLTlGQt7ApGuZi0E1UWCSkyBpGfk5aAw3vmUT3O1x/hqP9KxKMShRq2t5MA1wjoWp9x1C9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aDZqlX1t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QahmM20e; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aDZqlX1t";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QahmM20e"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6966gUZV1045228
	for <linux-kernel@vger.kernel.org>; Tue, 6 Oct 2026 06:55:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/klLpSgzFnLd9VTNITlyPIZJqJOaOloP8mGS3oXlikQ=; b=aDZqlX1tlbtC7s92
	v09FL/s4tnWEIRpYmhhf4OT0QIkc5dvDvl/0GvMfFZuxju0XJWgFVo+WF+jvHv4i
	F4kHDtLdEEhC1qDEMP0KgEzJ/VIHdrWT7DWQ6F4r8y7Qmn01wrY+DUqizG0Zh5Hc
	8aZtssO1dGzSzUJ4X3Ijb4DuX9gMIyQWL3qWYiyl8ofiWHwn+nEZB4Gcz+bGlrim
	fu8K2dEX90JZH4LCKBwtNK6kJZRz3UNk33Q0MBXAsSY8MFa4PQm+2F2FyCz+DkCP
	0whJYmisVle2wfRbmQr/yg1RhqCz15P+yBgzlkfD0nT7J6rV1ki3FHb6Thk0mnJs
	rGaWow==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4uy4g1ce-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 06:55:09 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-98c46da4b04so1997621241.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 23:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791269708; x=1791874508; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/klLpSgzFnLd9VTNITlyPIZJqJOaOloP8mGS3oXlikQ=;
        b=QahmM20eRxdJ+jFUl7Poh297Iu6d17xzzBHCZSM93Q7WbPUAuCkOaigNlfPvl+SoVR
         mwpAXc2/4wF6XJJSVugs+ENNO/6dJnDmnGvsm9t1j9GRA/KhkoHneyYO3/l5BB6Wiv4/
         KCtDHailwiJkBZkhcOm6ZXrtLg4TugIyHF3z9xDoSn8D04TtmPCjw5CfjLJpKOEGyTNl
         O+g0q6+oTSwbe0h1LiTIdy55hBhnWM6LovG6YUOH2ZX6UMjiwTdbRWl+6/NpLzDhMNdL
         Uvp7fvePIJjZhz62RM+8bqDkW4u7lfIYI3FvbxTfCjMSYoRN87xL+YGpaD3hGSGV35N+
         MYKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791269708; x=1791874508;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/klLpSgzFnLd9VTNITlyPIZJqJOaOloP8mGS3oXlikQ=;
        b=158kEFlPgRnuD7xcixHHYectEMlCAxE3eDZCxELvA45/hshd8dA8g5sfnwWzvYDjr8
         K28p81Xug4KBLJlbBu13DvrTINb9iDLTbjpR7eBOK/y79F+ZqH4v/dYHroWWkxq+7WjG
         wrqLxDc9kNiRWDAhm+3vu3ww9NoFBqE1NSm8OpH1QFXrHHwUCMAlebM7seZAR3BkpMSq
         PlD19TixNytWz7d9gQrWWmu8dhzp1t1E5hTaCorA35i5gglF8mDse+JKW27VMLI3WY3j
         luKUu9WHl2J+iN6Rk6JSbmqcLb13KYXMM9CuvC6m34oyssiUUA19U8lc6FJQCZqzPTgL
         Z6UQ==
X-Forwarded-Encrypted: i=1; AKwUvBxvCHt++IgMwYFRJQTRr4P8F/bXdH3KdRlbqukX/2qQfV70lFSKxE64difmPB5uJCffjiuUyhyieXuChv4=@vger.kernel.org
X-Gm-Message-State: AFq9FYINbXGjZXIPJNMI64LmdSVHnhH18AIQ4/VY9lTqIB5U6B4t1vqS
	sNnTQkZA9BrG52Nk2MgAFsKgK0Px2vT3SuMtXZXTNma/swsnbPeeZgAy2EIihX9dmwoQPohQJza
	XmYxk9vtZ2Rmdv/RMosnsrGzieUjlvx5dzFnVLBJo2UzPQ9onxWYSdgbV1eFJgX5W20g=
X-Gm-Gg: AYBFou0D3m3J05izDGHvs9WfPrhwSsPgxkouelfNz6v0oga3Ouc1SmnKyx4juTTmE4I
	Pm3V5zI9yDbghZdU7NSyOEpfeoR426QbydXlrMoZ9pzNO8ELWWa8qJ6ngq2LqWlhB2SxcWCclnK
	BAIFX2LZmT5DjDvmOGMqOpeW8n5o+KKMLdNLYWNyPSCteua1mEygS4QyQGliqpMaPW/4/6fAKaf
	3zfSRrqIfxSKHj0nSWq2crFdldDEhIsnZIP21Xar4kUAzulSPNQkLxKywbyvtnatY7ODOL/aG74
	c8Gkce24jgKQxRvRnUZB196cUmE7iizAk5b1dJFwDTaxplu76RDF/i/R47ybs2Uar132gD3+Qv6
	PV4CfYCjSFiI+qJyA2aj03U4cMEYJeCSbKv9Z1LwNSZnSNpl8rEuMll5y0ddKoYRwYqhV6Nt5j/
	EvtPqe7+TvffXD
X-Received: by 2002:a05:6102:510b:b0:7a7:ad9f:53e2 with SMTP id ada2fe7eead31-7c8765bc290mr110190137.1.1791269708435;
        Mon, 05 Oct 2026 23:55:08 -0700 (PDT)
X-Received: by 2002:a05:6102:510b:b0:7a7:ad9f:53e2 with SMTP id ada2fe7eead31-7c8765bc290mr110168137.1.1791269707990;
        Mon, 05 Oct 2026 23:55:07 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a87e303fabsm52162651fa.21.2026.10.05.23.55.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 23:55:06 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] drm/msm: default separate_gpu_kms to auto selection
Date: Tue,  6 Oct 2026 09:55:03 +0300
Message-ID: <179126968612.1110179.1912784063733436296.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260928-separate_gpu_kms-v4-1-3f33175de133@oss.qualcomm.com>
References: <20260928-separate_gpu_kms-v4-1-3f33175de133@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDAyNyBTYWx0ZWRfXwFiuWU7bTOPZ
 k53G2F1P3zexkXMQQpl7RXsmkR9X5iijp+uznA/FFqK255BvNxt2UjbG6Y5aRXv169phdxfSz9s
 kgQPMUaWUKm+pwzWGpF4PQLlZF04ZWLim3+HwzZW6un3QYYE+18arzGv++7T3ksHpkefXBiMR8v
 /wn8/QgQa+Tpx5Wq2CTGMRd8bK9+wrQ7F3ryJhKBrXqY4tKYkt/jhUU3KOQx8ZTGMNgKbvXf4+D
 bSrX7LPx6o9oFcpmr3NqrVF6/Ncswq6G9vWdSMfQonGeL4ZZZyag3cNdAJIGtluPZrkOVyrOr4r
 Ea+j9A9NDBjrYjhbsxljyqxZpa9FCvLdxfpE0v+njqrVvrgur5MAlAIaQSrrA4j5VAN68gyGkN0
 xVWw3pWBAB5RAufZobjzfJ66fMo/k17LF7oICNYEfhBsBniLMyMTf+WAs0ScvqvMPxBfTBioxtm
 b6fKPs6wHv7qdlv+VxQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDAyNyBTYWx0ZWRfXyDZ8wrFbP9Qr
 oHympgFaaA+xxjhwhfSWTBrLhDaLhnnBmuHL1Skk+e8yD7Ird9Qap6Z5HxaXEazz1cVFDN8UWwc
 /IDJ+fTUUKaq89aACMXbNSKgIfmHGYk=
X-Authority-Analysis: v=2.4 cv=F97C5ahN c=1 sm=1 tr=0 ts=6ac49b4d cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=e5mUnYsNAAAA:8
 a=wOLXV0KxhkujVNyKNgIA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=TOPH6uDL9cOC6tEoww4z:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: 54ROe1e84Jj1lNGo2knr4hCwhQ8UAZVi
X-Proofpoint-GUID: 54ROe1e84Jj1lNGo2knr4hCwhQ8UAZVi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_02,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060027

On Mon, 28 Sep 2026 12:28:45 +0530, Mahadevan P wrote:
> On platforms with multiple display subsystems, such as SA8775P, the GPU
> binds to the first display subsystem that probes. This implicit binding
> prevents subsequent display subsystems from probing successfully,
> breaking multi-display support.
> 
> Use the tristate separate_gpu_kms module parameter with the default
> value set to auto (-1). In auto mode, the driver selects the binding
> behavior based on the number of GPUs and display subsystems. This allows
> display subsystems to probe independently when required, while
> preserving the existing single-card behavior on simpler systems.
> 
> [...]

Applied to msm-next, thanks!

[1/1] drm/msm: default separate_gpu_kms to auto selection
      https://gitlab.freedesktop.org/lumag/msm/-/commit/cf27afc3bd6e

Best regards,
-- 
With best wishes
Dmitry


