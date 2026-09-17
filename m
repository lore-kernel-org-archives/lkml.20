Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1C4E480DD9
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 09:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789638611; cv=none; b=mS1uXfPUUQ1H3KfuQrTwFsrsEg8TuV+ugOFCADtbQK4XICPTFdL2C2Nnn4MNVAZtJ3bVQNeBofYzUsiajFtDyP+QAkEAcQu5LgvTtC8bpG4FVb3p+389kv8M0DQV0uuaVl7oTCRCn25A7bgGac3WsNQKV2+Tb17HOH+cIXVVe7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789638611; c=relaxed/simple;
	bh=xOrPUnzbedw6kt6yPbrXP/61YDvqt4FbJjPsYG6H8bg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uLYFTR9yL2TUwIHczxqjRgukl7rjeWQR+n6clJ5jj1YcQ6z6YxbZOpT5NNvRP/RVqeCJlZXXqQmd1GmEf5IBdeCtFq2f7cBtLxoXrK3oq0ymMmwhgOSSxTinm1CXADW0t2PFNgANX5sNyUMEt4z9bY0A5evIRknSe/6uac/vBQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Eq3g/gpT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R679CvnO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Eq3g/gpT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R679CvnO"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9ZsET4186857
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 09:49:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ebwLc4I+nSXZhdVKp1UmDQhXxipBI4WgJpnSLBihB64=; b=Eq3g/gpTQfYmmfOf
	zavsCp3fvQQ4SohIfjbfjpWw14Rb4cBSJdX5Iw4fK4zOLYykgPdKlc7hb8uLTB1c
	erHp0Ex8yeQbagrtca2VRFa0cVPlLFNkKs5F2IJFrKzkqmEM7BnlRmVijSik0Bul
	rIwoYPUBeirUEox08FzKGZe7UTy47ciSh+vOdhX7KtpwHXxuHeKHC+hF/nxUWZ+O
	YhvJaOpvtDZiLEw40ZBXeg5QsfbWXg3bTDrNFmXehiUKHtuVGT+En2m+vVBaxE3o
	ByrZJ7is1umsG2ooRMKUHusXI5AZnGQcAZus7SjlrIhQjnrgaFBPZgBJfursbMx/
	InvdJA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gr7uc9hn4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 09:49:53 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93a3f673221so220515685a.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 02:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789638590; x=1790243390; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ebwLc4I+nSXZhdVKp1UmDQhXxipBI4WgJpnSLBihB64=;
        b=R679CvnOmVp+gPonttmKNt8AQ2Pm+1/FepmeN/9IICOd3ROGYNemukV3gAs+JEN8h1
         dSkc9xmWjKdjlmUKdDNKrMI2FjpZ6qNCtpQYYGU84WQAXWFIzgzNoYcKNu8nts7pH1xp
         N0GG7BFkAv1yrEB9/mzyFLObdEoeTt7+bPy4X9rS7n/JXTAlG3DNZswvPbqKzm/OBs1F
         n2hTugUyRWlgUfZtJ0iblMdJ5g4rFoHttbbfKCdMQSssnURrSEKPq0PhdTkfJY/1H8cr
         GHWmBUp6vAsKocg3v9Hm+dpe7VW6x8BCUVOr69AF8K1UH7XNSdlYOkzAFhnhgikNML7J
         qVhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789638590; x=1790243390;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ebwLc4I+nSXZhdVKp1UmDQhXxipBI4WgJpnSLBihB64=;
        b=ESV/XaI/aQtOq4vcqH0031j/7s3v21zIKKOH60DBLtIGDkJcloblqgwdwQXvH23mDZ
         q3EeuytYJ3npiA84+tw3aIfrkTz2ed5XwlP5YP0h2EiYUY66lsWK5Ut3EqF6Ll9s+VFT
         0rh3eLDJiUFBpf8uQRx6ZPJft0bpc1r5NIsdN1wA/wxOX+dfXI/JHodPyZZ42jIlQVTo
         RbcCuilGpb6JAMaohwRRtX1UXiAsqDc3qmivzVIYZnciygLE/KooY2be9dJcoJ11/b+K
         R8jlhgdBg7/CSRVJ548GNxasAOqyXBMeP01iI93rnc3L5rnmdiWmlA7OFej4bkAI45Fr
         W2eQ==
X-Forwarded-Encrypted: i=1; AKwUvBx62/6bfI5GpUIAsXJGZT4eViJpBEbb6jzgMNZ/4jnPkEoS7gSzXEIDg9C/bXqCYz7/dXTn31MUbYcb3ZM=@vger.kernel.org
X-Gm-Message-State: AFuF++lwdTBf+/DmZ0v3dsoM14YsTQFSgn1mZ21TvrwnBNzXqsnwyExl
	F7OALwaagmucu5zvuOAQI/3mFRRo2S0QP0ZzQCqt7eRMFBWD1VVIdCdYyLqaIit1NiFCJVKSsq1
	lKeuRw9WrJiqkigv+30baLjGrhhwqZeOLxl6s4tc2YNJh1bWmg1AqMk5D7pfwN7ObAWQ=
X-Gm-Gg: AYBFou25bq4eJwAJhCK6aJGjkx6U0m2a4yhvqKVWbS7mhfkd+0+ZNWPCzgeaXXiAzSL
	PjWsDJ8g5T34Ac9olBqG5IGRicytatiU2W3XxQieqGCuzepwMzKGtoHsMVgkATLdSGeliNDIxv3
	BCHLG9FxuGRnlFupxOjVzS1q5CFWVMtF3dQvQRlc8vb+O3w5Evi/b1I9emmchbpSceRzdjuN9bv
	N87JJ2qEHFn5kW/5lTN7xaOza8pqah7fVtn4AyKRvn5FXP+Sj8Sar9Cz4UB7wDWU1vKwwTSB3eY
	LpUe+zH4ZSvzMxDXFFZ9uBbZmTsixqpTtvipC21SBAX9hckWz6HPBFTicyF8sEGxcMCZMVCgFLi
	UBSSkhLf+2uJB8QCqnFsiyApvSX4=
X-Received: by 2002:a05:620a:4722:b0:939:99a0:e6f0 with SMTP id af79cd13be357-93bb785b07amr965473785a.30.1789638589740;
        Thu, 17 Sep 2026 02:49:49 -0700 (PDT)
X-Received: by 2002:a05:620a:4722:b0:939:99a0:e6f0 with SMTP id af79cd13be357-93bb785b07amr965470885a.30.1789638589359;
        Thu, 17 Sep 2026 02:49:49 -0700 (PDT)
Received: from brgl-qcom.local ([90.161.207.100])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bef7687sm15736333f8f.1.2026.09.17.02.49.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 02:49:48 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Jingyi Wang <quic_jingyw@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] Fix intr_target_width for modern SoCs
Date: Thu, 17 Sep 2026 11:49:41 +0200
Message-ID: <178963857689.7532.5477084907068663029.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260917-topic-tlmm_intr_width_fixes-v1-0-3bc1d056aa6b@oss.qualcomm.com>
References: <20260917-topic-tlmm_intr_width_fixes-v1-0-3bc1d056aa6b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDEzNSBTYWx0ZWRfX5ygfOC0qHxwq
 gq1pyUEa+0BNtxs5P73IV56+yudumQEW3FQZNmnnWls0E80Md13b8wDs3S0PXiItDTmJSyKACsx
 6/9CnTonA17M+gGn58PJH15hzbzPb0n55fAoAagVOaqa7/sTZalsqWjw4XrTCsDXqTn4VZu4L3v
 JnV0FKSSWpQ9EdxtCDd9ubTGZ8Dc72p+A0GK0VgEcdaFfIP5Q2V1hGcVZCeXX+ueeFp4U5lbReT
 VQht0GTIzCsWx7c05iQhORdjYuZGPJ0zMxo1AeCf1ym1t7EFIywlcS+NcFVWwNbrOCFWTKLWn++
 PlXTSJ7e7ihgFfEKjaAbzbKd3e2DF/IEI/RezmgKUBH3d6nYTGB+lvhguuKaYM8txzkMU2e1oyj
 pJNo+mKNswLNDH1kZKFhKHF/MkqAsvtNJ2SE+LXWu01IftFg/9c9PQRPTgTF71r2hmbrL2WqNuD
 uKeOeJUo4V0P2DOyVBw==
X-Proofpoint-GUID: PTLlHBOHkRYi-K0MVZB5XZlFqdoT_T6e
X-Proofpoint-ORIG-GUID: PTLlHBOHkRYi-K0MVZB5XZlFqdoT_T6e
X-Authority-Analysis: v=2.4 cv=F9zC5ahN c=1 sm=1 tr=0 ts=6aabb7c1 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=BQ2oiuy6hHN+kKmom1QVvA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=TOHDll6vaYcQP47MitwA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDEzNSBTYWx0ZWRfXxLY4OOfW/TiL
 CzJU8LwZOABIImx4wloyqoGEKQI7oMaSJDYWJ8+7zFVL6o51jNcHVeKAlIh6gys+ptZeq9RjKZr
 Yj0bTniDsfe55Q9HOnMmHMsoQOhx5uk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170135


On Thu, 17 Sep 2026 11:03:24 +0200, Konrad Dybcio wrote:
> Following the Nord patch, I asked the robot to ensure the value is
> correct on all other SoCs and it found a couple outliers. This series
> fixes that up.
> 
> 

Applied, thanks!

[1/3] pinctrl: qcom: hawi: Fix intr_target_width
      https://git.kernel.org/brgl/c/9d4c3e0c6a53eb390d58b8d7aaf08885e46f93fd
[2/3] pinctrl: qcom: maili: Fix intr_target_width
      https://git.kernel.org/brgl/c/912df33f296e6c4ced8c0a5e7998d570a0b82214
[3/3] pinctrl: qcom: qcs8300: Fix intr_target_width
      https://git.kernel.org/brgl/c/dcb5df182b37587d5ad6bb4388751bf5180957ac

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
