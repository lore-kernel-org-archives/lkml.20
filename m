Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 091314746BA
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 08:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790584155; cv=none; b=aFMgkj2O5x/k8JuW0GVSWgJcXc95hoFnbHHj8ODbZp2o85reNhUYFUv4EQsF84ZtJwRLdQPCf7U3WdIDumzgSIoyreJFF3AIRdk6D/ZvBb+sPtSzx1MTxi1QFtTokkDCB5Fe2LrvtHZSExFWLkHcJRHdei4NH+CbiseaBeen0jU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790584155; c=relaxed/simple;
	bh=49BJ1dkM8YFoU0PD1GXd1i3LqpdlILrljgEHFOW+Dz0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=L98Iz3mOjSUNpVIWYbPutetZE4jRnA3fZt6SxNbo4aXNxB0gt2mKeNvdK//hnD0A0jmf69Jgiwnu8f3hz4bxVeElq0w4LLgLMZaEO50+SMOVZrD+UErW7Tmip+fImJAyeTyxq/mct+QeJAuqLmvg4SbOnZgfvvUMTHoV61KlzQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S8yjOfEr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZzCP3Ls7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S8yjOfEr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZzCP3Ls7"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68S7xrMt361407
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 08:29:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JFAq/53iLi0CBXhyAhNHZWKRxRPK6TLgqMDB54xLcNw=; b=S8yjOfErmuAJa5CK
	zD/oYuaxlC2z5L8x1I+46O/EV1d3ZFTl2c8Zt9QXrH2cv3eDSgzDexM8i9MPch2H
	sEUqS4OUPXth5hYsQILK5DMZNxnvWgBWekW8nW3lVEj47DcqYWxHqG/QGwsmd+lb
	i85dIjnqb/PeLaph6alUKJs0MSKBx+SbjvV1+ZI+zbX/21WmT5N8DiiMTJqLGLzf
	GxveJ/zbuLAE4nOFUr8KT0L/00KzbyWwAeM5eP3H97qhAnWnsbJVXdAm30vVxvkr
	Ka2IQ186TNnQmu48dnlM3YNmpqfCo7oVGctyEECH3/6tCuc6Ko0Hn/mgywEIdKlO
	hRg2TA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyav49hpj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 08:29:13 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e82060977so532514185a.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 01:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790584152; x=1791188952; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JFAq/53iLi0CBXhyAhNHZWKRxRPK6TLgqMDB54xLcNw=;
        b=ZzCP3Ls70qNqnfFQi/Giv6u0O3AaN977VS/Ea9f7T7zltrmfL4aCYiqJco1Ty3ZNwk
         5Uya4ri1XNPzlXgu5vIwiIV7Oh8NIINIUcN0k7/KFx+tWbW+9S0E2rJUnSHhNuoGPEsP
         XG8mUXIgqS7jiIrC1xaTH2DZJ8HNZOyXiTNYvd3AcExY5Fif1dK6gb57Mv9MUnedSgG/
         U2Or6vW0uhvFTBybUJ2LN7ani3uB6+w0x6JXtNrvSXL0FmulxincT8vVD2tQ5AORA6Ae
         H6r1tZ+fhiv8+y9aE7EJgDBw+lWnT15R5rCzBNF01h2JOel/4coihw+KV0XZyQ6rQCCL
         y0Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790584152; x=1791188952;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JFAq/53iLi0CBXhyAhNHZWKRxRPK6TLgqMDB54xLcNw=;
        b=GajDPZ0eYMX2XcjAatmwsDE/t0zwBGPI2ZqkKbZhpRhQZtyeiaijJ8T0elLJgyijm+
         KCyYm+mCbiJD5KgrSjBQbn5CnFP2otS2/5XS/sauH7DT3AolLGxnb0ud/ZRO+FG2NrYA
         FZBdiuTTNZ+uN2jf4hZeEWDbkT/YnVd0sXGY9lNHNQY2sKYs017zTOfIDEbEWPpFxuKM
         ATQnpsT+cwwb1TQxQHQn3k/oE+H2v5krIYml4qnX1F0mmmrTgDrVoUrPOoACZdFnvz8Q
         hvJTcvLJ8SFB7xeFXILc1HZFPkrjXukD6XWqRL8F6URClGJGAj9nAJxEiJ95GeB3sYMp
         phXQ==
X-Forwarded-Encrypted: i=1; AKwUvBzD4Xz5sBQVqvVjGoc4Rw2pCy5XmYyU9AlxDB9mHmTzNcFS20wMCh2x6u6rneixrGI3oP/rxUXj5ktEy7w=@vger.kernel.org
X-Gm-Message-State: AFuF++nkgPAZLnBMgpDhtam4+SZTGXuXi8DQJdSxB8VX796ch2gqsR3X
	nWFHx+RPFU3rvP/AtA96ZfYkb1F8u158ch0wQte4+XSuiUBseBxwxWidbtlqrPyxF11SbhkIiTX
	FQYJdkAN4G6MYDOkqrHJb60hD2Y6iVubDMkrYiNyWEShX9H6FY3OUOfdbgjltsCEuXws=
X-Gm-Gg: AYBFou1abxhoV0iV6jyLScisIS6v/2RGeN5cGI5TyLQ/NpR81s+TbeQteBGW5rRX/mq
	hAMuVjzsm64pF8egVoN2gc8STC7t010FbS7uR0dd0aSnwI4c9eQhlgdELs6Vj6YHeX2EmdDqtJo
	M4+Bo+wi5/qPKzY0CGNOB5ORQDTVnWjLk+970jXviYt5p4lXxFnPGJNefnFWFKuELtdk+UVt6X/
	J2G1VWkZjXGhiG4ZUyyIH+n/2irHB7H2hYUURp8BBY7x9fUWlwEmCR8ouUlYkB3aTjq0zAV5fBo
	jAJOtlga4mRgjvuD9PhV7/+5lwl+zoj7uwNXSedYEbn3JSn5NPaaLUCjLLSju2mlV2pcDsDRMA+
	RVOAL69SKKdrFrEi+vVhw/xQj0eI=
X-Received: by 2002:a05:620a:6409:b0:93c:6450:9cec with SMTP id af79cd13be357-93c6450c36bmr928793485a.5.1790584152209;
        Mon, 28 Sep 2026 01:29:12 -0700 (PDT)
X-Received: by 2002:a05:620a:6409:b0:93c:6450:9cec with SMTP id af79cd13be357-93c6450c36bmr928790585a.5.1790584151713;
        Mon, 28 Sep 2026 01:29:11 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:d5f4:8a0a:ffd4:396a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a001922102sm125209615e9.15.2026.09.28.01.29.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 01:29:10 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Ridham Khurana <khurana.ridham222@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Srinivas Neeli <srinivas.neeli@amd.com>,
        Michal Simek <michal.simek@amd.com>, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Shuah Khan <shuah@kernel.org>, Jori Koolstra <jkoolstra@xs4all.nl>,
        Brigham Campbell <me@brighamcampbell.com>,
        linux-kernel-mentees@lists.linux.dev, stable@vger.kernel.org
Subject: Re: [PATCH] gpio: xilinx: fix runtime PM leak on request error path
Date: Mon, 28 Sep 2026 10:29:07 +0200
Message-ID: <179058414451.16214.2667543002075189333.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260923113905.1409290-1-khurana.ridham222@gmail.com>
References: <20260923113905.1409290-1-khurana.ridham222@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: rB9bmOk06zmL-MVZDT2VZZcxUcZVah1d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAzMyBTYWx0ZWRfX2zv2ev9mn5K6
 YxzXymoDbn+sAmJbcFin0/ajPTerceNIj+YpgA39ePnB17EyOkRYv6xytIyKnhIl5O/+55KNl0B
 B/QgQBmy8zsy+Y8b15HOSxd5UQ+M0xqIYPkKGxOQ/+l0nxek0vg4Dk7UjeHSfQwUyNIthQFkv15
 UY82bmWatQ63tbIVXEsYI+S2UpxFBPWTgHUrpmDjqFGvVIbVT7bDAmC/t0EpnuKxnH+xWEyTbns
 rH+pR2SEMKhocCGQRqwPWUirGczNjowhvPQPiEC6m1DOUERqWJu4qj9VlmICkeH19lhIpI8ucgu
 hfydyXBNUSLOs5OXBM6WyEzv4K0xxzJN2lmJ6RuSRK9sOOi1andqbtHJjG+r/6/VbKSIa5qtB9l
 vOV23N0AKqb3a/H3Liapm2sIn9ceKna+1dlizshyj82yzEFWPHsNL1kgc3pColjdYJh9r37F188
 NpEMsUNwT4Lle9Q2Zmw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAzMyBTYWx0ZWRfX4Nnb2AUdOkkV
 MUJ5w3hFVhxm3+E2hANHMtUrXuCaT7fdRnoOASIWlDUGgDh9IczIohc7lB/In5I34oyLmK8okcN
 Bh/OzPotAa5FGAyAG9blOkgUBSJqpPs=
X-Proofpoint-ORIG-GUID: rB9bmOk06zmL-MVZDT2VZZcxUcZVah1d
X-Authority-Analysis: v=2.4 cv=MqLHeGae c=1 sm=1 tr=0 ts=6aba2559 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=-tgoi-CBN2K4obTd82YA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 phishscore=0
 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280033


On Wed, 23 Sep 2026 11:39:02 +0000, Ridham Khurana wrote:
> pm_runtime_get_sync() leaves the usage counter incremented even when it
> fails, and xgpio_request() returns the error without dropping it.
> 
> gpiolib does not call ->free() when ->request() fails, so xgpio_free(),
> which holds the only matching pm_runtime_put(), never runs. The reference
> is leaked and the controller can no longer runtime-suspend, so its clock
> stays enabled.
> 
> [...]

Applied, thanks!

[1/1] gpio: xilinx: fix runtime PM leak on request error path
      https://git.kernel.org/brgl/c/ff82fc3a4a1d417dee1229681cc5285986edb1fa

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
