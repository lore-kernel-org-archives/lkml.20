Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FED746EF72
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 09:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789983550; cv=none; b=VvNTpvvFBjwtb2suLD5PR67PN+PivaQZgF+RrLPSdGT7O5jc4yFD/f+t1O+9JY296R9u3vnD80Gqr96CRp+VYTLdQ5zGRQMSK6uTs79ToN6EL2hXhXEUPjIHDxlbiHnSPfzQz666wfq9hAmnS8YKSaFcXlMrulAUUAyVAD3l6ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789983550; c=relaxed/simple;
	bh=KApJYgp4+5IAMPSqpZq9c8V4lERgpgS58JN6jbD83ac=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=N9kiqAFGHTyvPiXyQpxZNXi8fFlNH2jPwF6C9X64GAXJvCHWFfxjT78CXT+lOTurwkn470JrWRbMrSqqnBvGakPZhfBxNi3Vhc4/xVH8rtnnlnTT+4aFRyDhgswfFMLmfluf1F408O8kNwlCsM4dJtEI6FhW1un4sZNqnyHWpBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HjBtfKl7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AJ60k+Pt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HjBtfKl7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AJ60k+Pt"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68L7F4hT957140
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 09:39:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n264CltQyN6aOAXWMZFeAq+AlGsyk+1sXEe2BGRw1JU=; b=HjBtfKl7Hbs7j0Bc
	pmjwYxIT7O26GkpF8lK7h0rSu4vWDhgvfiwUKvDujtAgKAnnXud8DKLNkuvpQFMt
	aF1N1/XKlkCefWBLBhd4tAykOlr73PtOCUPBZkTgCgLgpxOnSZcxN1KS8trUyEnF
	b0wfVOBeLG/kZTyMeHjwf16Os5sxak4W0dn8HA4i1ssNYTiA5yYqwPAai5ANh5kC
	AGiK9bNBDDmiAC3EvpWviQNwJetUNGs31t4Ux85xS1uA+hLcrVlTgaoHZFHUzCNf
	ZEs+ZbSXkb90+sDfe1HRLyu28pj6rI7zJ/q3SZWPuOzC6crqc1H7V/nGorR7pXuY
	ZnIjMA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu01d0jxq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 09:39:07 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-939f3426a7cso570301785a.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 02:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789983547; x=1790588347; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=n264CltQyN6aOAXWMZFeAq+AlGsyk+1sXEe2BGRw1JU=;
        b=AJ60k+PtsOuE2b0ha32JhyeksHvV6xp4LlfC/tPqiGfmgEiyB5weKd4eUEN7EEtOf+
         jG58WlqXGIOw1NjkQlAW1QUH+43yvGIXV47v+MSaJCbblknIdggAtIotwuB6Pow2C+FL
         l39qWSfRaTx17258ycLqjaeE1ryAzOgDfWYfayXlm1O/xiOJo2KcovqsKPsZYYvpgHF/
         cZj9k7KG7h/f1z+ANvZdXSOJsUKs/rmErvz3BNayqG1AMo/GPH1oZgfYzisLW1MTDk7R
         R/ImQSbfLi99VqCg+V+x8PTkoJjIU0hYA7Lr3NQNn7ZSd4nFod2UlXb2Pl6og+SIWbDp
         jXgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789983547; x=1790588347;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n264CltQyN6aOAXWMZFeAq+AlGsyk+1sXEe2BGRw1JU=;
        b=EI80693WICVqPFZEjMKX8Or869cHVm2eI0oel6gkfM6hD1u9O4IYo7Je8ptLTBfjbx
         y/FKkSBI43uAkBHxgfOm7gvwkPIxicFTnfaRxpLjWHElZ6BpU7iPgIl1168kOPZAHf8S
         QWGwTU3QeZ9A6EuUGTVpVXcWdHlLgeb2fDlcVil49LXArbh6K8EccA9ZwTpDYGrdZq7P
         8X6+kHpp1pYEZqeLZa8F7kzlvY0uxmcwS/XHtFt1aL1cm4JYEO7M7HcTib/jtVUtFmqI
         x/MzxSyCSd08R2My2ZyIaY6WX9XDqRkOgR70eW3lTvBw9Q5i2RYchQHaKb5ifUAeRSCX
         G/3w==
X-Forwarded-Encrypted: i=1; AKwUvBzHE2fcZkjIk0qiKzTnrcLf78il6xbuwZcdBIPuDmxU1Psc5Vx8ml5HNVN+L3QTzFAww5efrm6/dv68cP4=@vger.kernel.org
X-Gm-Message-State: AFuF++myE3uKKYJN3UCGlu2Sb0xrohTOHlguED6oNmLOPYC00kNk3XDO
	v0361DpC211gG5fjRMThvm9UQChBvjRSTUVTwjxrPqo1+B7gLwo+0UidRpot5uhkK1lqWyrHEzL
	qTZ1CIT/4aSvi1KDOGDydTcWXOmJjdvD3ZSjsfhdHfF3rRU1AN8adkSQZ5csBr9tCXxA=
X-Gm-Gg: AYBFou1Q+1SC1/g39eQAmrS0P1sevWQK5kp7nheKgmKv2+RyjbfPWSeZ3pbP6AULguD
	sw0fiAqd4iyLm8kwmFhNfzSlpRaX47ayXV8r3EQJMKzvzcp1LE1lnE214mLKpLk2CT5ZyIlmqs4
	/Rly3d8sQ+XLsccA245bs8czu4z36rXKsxYvcDoO/wPsonGVvIqFj5WX09T6v5aTr/4o44PZOEC
	C2hPYB5L3NfJdqsiKFJWMcPErH18Sd1GjyfZg0OuNEl2F8ZonTB8/kS2DF2SAUZlEEVAvgnYl4+
	WDaFyfEbgkHrrPL9QFo/7Lgpz2n4t9+q78b+CZjQ+vMlKwjX4JvvAelMNZIqPlxJ/C3eMrzy74q
	EFiJrz6Up1kjA4P0RPrSLEmky4A==
X-Received: by 2002:a05:620a:1b93:b0:939:6dbd:de57 with SMTP id af79cd13be357-93bf56190admr876183285a.32.1789983547288;
        Mon, 21 Sep 2026 02:39:07 -0700 (PDT)
X-Received: by 2002:a05:620a:1b93:b0:939:6dbd:de57 with SMTP id af79cd13be357-93bf56190admr876181185a.32.1789983546899;
        Mon, 21 Sep 2026 02:39:06 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:d04:d483:faad:1e4e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd07411fsm225949235e9.7.2026.09.21.02.39.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 02:39:05 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>, Kees Cook <kees@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Kees Cook <kees+treewide@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org
Subject: Re: [PATCH] pinctrl: qcom: tlmm-test: Add const to reg_names allocation type
Date: Mon, 21 Sep 2026 11:39:03 +0200
Message-ID: <178998354066.55625.13342780382170419764.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260917211009.i.312-kees@kernel.org>
References: <20260917211009.i.312-kees@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: qYpV5A7ypToMyfGeZOl5gY1OfvsunaM3
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDEzOSBTYWx0ZWRfX8Mi4wo1Guv3e
 3y5iTfhSpA1iRhbc4xIGAUuNduPcyjLH1F7kITKDFLyGdoaWXDdTvDMAOjcLdc8yEs8InZUm8vq
 W0PSmAs1ue7hCJNyBlWbINBflnLCm9Y=
X-Proofpoint-GUID: qYpV5A7ypToMyfGeZOl5gY1OfvsunaM3
X-Authority-Analysis: v=2.4 cv=Ht7jiETS c=1 sm=1 tr=0 ts=6ab0fb3b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=T_YYQzP2RJLLj2YXv3sA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDEzOSBTYWx0ZWRfX1T3d7Dbd1Ze3
 w6h6BgDtmeI4xBzv5VVJVbkDJFU20YiBwZzEx0i/Oq8m+YmHSIjcDJJjQWXhdIBJ0K0LLtrQjiP
 jl2uoWLdAjUHJ+RlAf6Sp353DXfYEe/DBUStcDNAVSopn/gqHP6ode9xb0d01otsn+QpMWCpdwR
 jYMnprOos06HfWPihWI/Lb6Dxqv9nDzKD0JbS8CMfZochg/xbog+dEywwy3nrLpLfNVn2u5Mrtz
 rofahMveUoqKWbJpYa8u/1bS8ZtnfCKz8S3+VzY7pzp6AgVI8N9Dr7lTUp6yWcmtsx5fpw+f/iV
 Qs6YqPG51QnWPF2nrapoXqXliOEaOL3M0ikNYoEC0JY5Fem6okjqTCIGoMijPiV8sttin4WE45d
 54vQTiS3wQx3TX1rOWowHNKEsqIkppOygTP6g45AeEwMffEqdG48P7ZrHax3e6xKVXrU6+o4+Yp
 2F9YWR5Jg/9GAu3TchQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210139


On Thu, 17 Sep 2026 14:10:13 -0700, Kees Cook wrote:
> In preparation for converting the kmalloc family of allocators to the
> type-aware kmalloc_obj family, we need to make sure that the returned
> type from the allocation matches the type of the variable being
> assigned. (The kmalloc family returns "void *", which can be implicitly
> cast to any pointer type.)
> 
> The assigned type is "const char **", but the converted allocation type
> would be "char **", which is the same type without the const qualifier.
> As there is no general way to safely add const qualifiers, take the size
> from the assignment target instead. No change in allocation size
> results.
> 
> [...]

Applied, thanks!

[1/1] pinctrl: qcom: tlmm-test: Add const to reg_names allocation type
      https://git.kernel.org/brgl/c/4d7c9430a26aea6a69521af3aa2d78dd5bc8d3ed

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
