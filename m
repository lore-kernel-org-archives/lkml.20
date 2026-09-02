Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C32844C4F2
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 10:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788345054; cv=none; b=YE7UGlcINrDALDa09DEZsbwsythOG/I/By1or1a3PYOtExXa/M7ZY2eUu1Bc0SiOgC1qhmdaysDmLTbX1EHomlzUIKuD4lO7W71IDbSTNFWi/kefR3gxb/BVs475YhI4bTNmD0yyMxOJG9E6RyqIFz1diy+Bvpb0abB3dTzJXd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788345054; c=relaxed/simple;
	bh=8MR0+dRHyXM7mT3ooR+6EESjBzW9WOnGSv5H8d47RhU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iT+8yZeo0xDYCYJoFd/0BgRbB0vEvhfjz9A9f9b/TF9oa5fhoerIWbN5TbF799bs56xbWcMFaE98BaaXo/gfpNg+EWZJ+5YQzFUOH9LsagYjaEL6CjkmZTYsRPEhmWFm5k6BK8HqGfM+ZLZ2STzJ44AE8l17qPxQjjB4jZIzN34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fSIQjY94; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JU/z4HJb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fSIQjY94";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JU/z4HJb"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6829NP6Q1839253
	for <linux-kernel@vger.kernel.org>; Wed, 2 Sep 2026 10:30:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HARNeVclzvscKuULqsNvnK/vJHjZ0V5cPXfo7RY9dWk=; b=fSIQjY943fc+Nt1E
	vvugyaC7Wx105pN0PrilSMKMP4dZmZhwfjgQyP4HUZJLlgk023gmWm8JNYTg9GGF
	+F/Ui1Ooyrqua/zJ+tgKdeTE89EIXMsTY4wo5hNnO2mlX9j82RiINyTrNTc33bA8
	eTAHCVcSa3HzWHQiUQXoNMrUbebyppLSIOj7YHePf/0318fHZG6zitVHj6oHoara
	IUnPZNwRe/7FK89DD3pqiLHtw9tZvFSNf1cUvVe0xGHMCEEN4A8EQQCmUI68aJAO
	dj1606VFdUD0YBpE+7TAM8GhUK5VKdzaQ9DJLgB10YiufUBSCimCpmEeIV5JZpCk
	f+7rVA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gebsx1h1s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 10:30:45 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93494cce712so196774285a.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 03:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788345045; x=1788949845; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HARNeVclzvscKuULqsNvnK/vJHjZ0V5cPXfo7RY9dWk=;
        b=JU/z4HJbLqKRKHs9ioyKXu/P706BVed7zbQgqroBnJPBMwbIPl7AEZ7tQnRPkrVZ6d
         SrVKGOlxmhJnQzMF+Jy6aawbGAEoM/ydxa6QegGDQtHzelgOqio/mwFToBB8kcZXV6aV
         OEHqVcPyzSh6NrmfeARVzCvt+b3RteUP+oz0l94omB7y4faalrKuW3rS3bAFhqFi1rIW
         LSNpyTSrnECj+YK8fe7lQV64e7Pd9sP3NcW/cRHpOy0g3t5GiLxjfaTIYQvVm2Dnf/jF
         Sv8Pe2T+5661CeTSx6eDICxdeWsDy0eBfXxce/cMxpL5i2FttlZFcSmiQ7SQdZBe2UgK
         NulQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788345045; x=1788949845;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HARNeVclzvscKuULqsNvnK/vJHjZ0V5cPXfo7RY9dWk=;
        b=pZSP9CuZuu/1fxOi33FRxeuqouhkqjeeoydt/OAEEKK7HkFl/X2wftXEU46+DN72NR
         LxaTGoIAwuMM7NbKEYYKDlFgNxSmzHl/p8scJZsQSzovAYCUiRS8K2aW1qErjYASj+xu
         ZdzoV3oOmTLEIlsNfA8fc5oYGri8aFtgZljzaPtxtXMnOReMvbQPo5DDkLlLz9HwRJkf
         jY29i9ExOVS6/QBoK2sAqoh28XnPRIxmwdvfu/7sQkrH0HSBtOxWch7+LiwA6VA0EwMj
         YjBttkILGQtC42HWArRpj6Qf+PxiWA3gy0ewPLdOaLUlOtTPKJnPgreBEA0TaBz6yFec
         +WlA==
X-Forwarded-Encrypted: i=1; AHgh+RobO6QcrAab7MQJfRmkmEc9kfUHS19gouCPGmdSZCM+vrZCqkSf3y86xYniI3PTrLuQl0Vp+z35ZgUOf0A=@vger.kernel.org
X-Gm-Message-State: AFuF++kNIf3zq+3izymnd/JuykAam84Yvz5d0OGGUPm5jKPkYGTZJi9p
	NyZl4sxu7OaXv4lipPh3hUCHmDOxfzWXAzzBobS25yKFEH4LCt0bKN1xtmVaE/G5+cOdQt3Adpk
	1q7ZhpLi9dt+RiaZ+WbHhHSAmWw5vtWC76n8ZdxQt4wZJ9RP6G7tUK5xgMbM/DbzV984=
X-Gm-Gg: AR+sD12d5mVyzyBvVX5sQ5McqPbZLTvMUF6OH1pLcqd99o02qsYcLr+vP/OPt52MBUP
	IsaeN6z89ObLi2sSV7ETKyJHHvOcKGxyqkhVr1WHefhc1FTS47+yrCdZAqZil4ennnPAGj//vHF
	wdm1Bwa2MUwg7u7K/cqTm/bsM6g4EPBHqKTU0UqWGV4s2AL0/NTGKU4+2AViia9tXkAZxic+rbr
	e1MPsWAXpC4l4vf/u6FAjc8kIGsOPQJIjaCMUJUKGj11gN17jk5XOL6b6LJNefwJy7sVKRIMUe5
	cM8sY8Y2EjxclGmSO3P0n8SPpW+FjlqK5q9VBpkKaekD9ru7vLt9A6uElXXQPyEbI+61psamQ6Y
	JBLAEU3TGQg12VLE7L9d46RV9bNQ=
X-Received: by 2002:a05:620a:8fca:b0:937:2c3a:4b70 with SMTP id af79cd13be357-93960fa64f9mr269710985a.32.1788345044781;
        Wed, 02 Sep 2026 03:30:44 -0700 (PDT)
X-Received: by 2002:a05:620a:8fca:b0:937:2c3a:4b70 with SMTP id af79cd13be357-93960fa64f9mr269703485a.32.1788345044243;
        Wed, 02 Sep 2026 03:30:44 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:b759:bed7:f8b6:ccad])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448ed30c0sm5667434f8f.24.2026.09.02.03.30.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 03:30:43 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Thierry Reding <treding@nvidia.com>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] gpio: tegra186: Add support for Tegra268
Date: Wed,  2 Sep 2026 12:30:40 +0200
Message-ID: <178834503625.13814.18008045740177349445.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260828-tegra-tegra268-gpio-v1-0-317bd91295e2@nvidia.com>
References: <20260828-tegra-tegra268-gpio-v1-0-317bd91295e2@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Ur0BiR37Kt9IOV1qglO7zH3K5Xp9Rums
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDA5MSBTYWx0ZWRfX2T3vLs360tN3
 +fJuF+Rl/LjxCkHbEIf0IvzkIGtEZuvHQuLn0+RbunLY+HV+MEE/yL5r6M7abyccZdr+2eeCgh9
 cDaN9pFOPLOFtjWl0UbpzeEK2Iuh7Ww/7d8uSrAf3u9HrcAFPGjPL4sfltA7x2daLv8VX6J17FH
 koZd1C3+4WMEk5BWaa4HJFwgta7M9ZrvnM07MBjQIsoJLMT1iMgjMpJTnU2zrSYkPXf6Gqq7Vwm
 vNK6szHX8YObx5hViGGBFLRILQfUPdUalIAk/ey75yP9zWpAwP2AmDyBX26Ozm8gj8HTn+MR4Nj
 Sv9asjoAIrMXI0wsAt7PPEm2LJANnf8IXb8Jjt4v/YXZwqm3T9vrW2vl9OGd2mX7vRm6G4GElHZ
 GGMPCy/kzGIlCH7J81DzCJfbM1PN8bImCyoGl41TU4gwVkuDk7ulCs8TBQfxG5Z+Kvyp66o1xg4
 h635fomRL48LS97g8Jw==
X-Proofpoint-GUID: Ur0BiR37Kt9IOV1qglO7zH3K5Xp9Rums
X-Authority-Analysis: v=2.4 cv=AufeGu9P c=1 sm=1 tr=0 ts=6a97fad5 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=zkdjkONUlUTOIc7Tji8A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDA5MSBTYWx0ZWRfX6DUik4rRDQks
 DowoUGrRilarf/0ltOANSaxU0jww2VBgtxr9rz/SnCunEXkuV4S9J4CEYp+BTE7kuhBNsEY3Xhx
 SsJTuqN6A8MG/KR3dSU05cTsw8PPQX4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_02,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 spamscore=0 adultscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020091


On Fri, 28 Aug 2026 15:39:50 +0100, Jon Hunter wrote:
> Add support for the GPIO controllers on the Tegra268 device. At the
> moment there is no device-tree platform/board supported in the mainline
> kernel for Tegra268, but we will be working to add this. For now we are
> starting to upstream some basic driver support to pave the way for
> supporting Tegra268 based platforms.
> 
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: gpio: Add compatible string for Tegra268
      https://git.kernel.org/brgl/c/884214495d377b97a27bcfc371fa1f319a63155a
[2/2] gpio: tegra186: Add support for Tegra268
      https://git.kernel.org/brgl/c/d5bc04687649ccf7b15b421052943870d76bbc2e

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
