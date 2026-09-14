Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D97C3ECBCF
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789371705; cv=none; b=KvoFAFVtvpU3njn9vRGRSIv13xh8HFFF6KojlVotmyFZdJAlSzU4SBjxx126D/uSiyiwHjLlSJ1A7l4wjhfVj4tqs94jXjB2ynVsrjNPg1u1PNFHvxrL7oKgA481mMGvow9GFX47TmJ8eteC8vIwCOapCU0au7W+mkenrQvhnXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789371705; c=relaxed/simple;
	bh=Ws9u3/CWwGjM80rr0l9Bq2F3GBfaiOwW9ZLAaSwD8bk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AGkiRciFRE/iS0nTUiDG8336ffhUgc5xF52vQp4/4vm5lLyM20G+wjS4OVcV2AfdGGoe0dyl91yX80p3cwzs+42rU+RRj/OBayScN9LcBwNKL1pDOytc6SmI5xZVVPF4X88NTSmdJmoPi5qm8qWJBwIZKeVTNYdGUcasfgXAQ0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k1FIWYpq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=arjCITed; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k1FIWYpq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="arjCITed"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5iwGU3739615
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:41:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=iq1F7tQsXtHe21R/reAaPCE5
	BzLGvftOFHOFXiCbkNg=; b=k1FIWYpqSjYYjzh5270bSYMMFxigGYJ6u3RvEoDs
	APMn7qEfGT5MUWlFwI+E3OcuhajFT4p22oa4jjdAuzB8DZz6VbIJbJswpTt76rtI
	HggKKkmNnvKFcBXSIjNh7AB1cgPJ0MDuWEjG/+Y1GQR/008LLiUbiaK/WXu9h7qR
	t85f7KNuro19ijCONAcrlb/g3xh+bcuxyKn7aDAC2TqgrCWhR0IYhlf1Z+i6deuE
	wUHtyIJMabLPiTjfLhKCOZorzhl95vleT3Ea3/FK9Kk+m7DPx2z29FoJ9APwZIHc
	ta/KKXT91jRL7lnocyiQw22hmjPSsnQPV4wZtcrGsAnwCw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9ddjsm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:41:42 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93a1bffc2eeso270189285a.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 00:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789371701; x=1789976501; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iq1F7tQsXtHe21R/reAaPCE5BzLGvftOFHOFXiCbkNg=;
        b=arjCITed6+vzLC3iQKer509/aU1bue2ztmeSnMrC8tQZ6+fg7K4uAqDQsIP/i3YsE2
         dx2vzdjkeRVnsRnuDxSJzbBoyQCHt0dkjOrqHn1pazdYm7XyZF6DuOOavNuh7vAbUWOR
         1xLncT8yttgSoT9JsFrChI11UBo7Sdo6M5JxXIhwPWPhpp7x1iQxRbcwnWeskinaY9PR
         r2L6WyqVkm/smYQ7nQd6RcCuEiXVd+3GJgpCb3PbdlA3uM6ALv4VhXI5/G4k7NjFhS/s
         omD0hLLtU2dxkAIrHV45heyswSGpzPfPlcDC2cm0Cupd+Xy/o9u9eXmtugdBAVSC2z8P
         2UXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789371701; x=1789976501;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iq1F7tQsXtHe21R/reAaPCE5BzLGvftOFHOFXiCbkNg=;
        b=YNR6s+J9Cv6CkuTA6Dvf0RrDESGS+7IjCUMwotYFgrPLb+e82TtUM/wYv19OzgKooM
         OBPLtiuY85nowZRMo4nAZjWByI2U2HOYZNY3azYI42k4G4niU/SdyzLmnJ/IGmx1oQnQ
         BL4FfUnxaOUfjPsuXf1ad184gR+T8UsjUkzsBJFAXAI1wqFcQNhbJtBpI6iVO7gVRyo6
         8ocAol0bsR+RmIwiP/bTC9ebzYHV1fNlglOphURqjD0OC+yCxZYLC63VWYa2nXL3GDGM
         kypVn3/1fZe5H6rYhhu6UBnYMwf/dOlvJWtVAtB2Oy8JU8PuwlVVEx6cz3FD7SK4ke/G
         6+xg==
X-Forwarded-Encrypted: i=1; AKwUvBwMrBTHNZimHJXaqPmuCOKZ+qZFUFN5/FYsp+1kuiXS4QJNgdZL6O8PBMQ5v4jPzGVPUxkN2pkmrksFaCI=@vger.kernel.org
X-Gm-Message-State: AFuF++kuwudxOKO4YUlnPJt1u5JOTI9CWhQMlyqJMygzcItfca7co/ZO
	Rz7eAb59Ps45g13AJMj1ualgG666CoaW1KFysbwmJdNkCKWZEx0yQKysyKTlj10o0oGLXbU6aGY
	0sGbDkawb0Mc5r7dBJzFnHXIgSrnmKHO4EI/aRqwj/xgxX1bOj5LG8J1lG4JiWDFbogE=
X-Gm-Gg: AYBFou3v7khdlYPJfLdUcGioYXcRju91ql+fIu96LsU8G7hG548wNxrGVCPbyGeK4qm
	qSI8iDFNxALahopyN823dGKjgPCYAxSp7FTknFR0ziMlIhmfzYw5ADjr847V9DLJMVLbD27ubFh
	yTZb4KpXpjbgamOGWDa17J/hcsfReJ/dzXrfNj0qCWDe3GYFLKVWDSK9pyPCxhhisINt9asIXGF
	DohEvpWr970Ch981FeZZSc1mFisN/5lJX7AFW/UvlsbJxPCuSQrXMfaUShmPJTAq8DVGXQqoY6w
	7BPD19jMTdkF1pN3C3Hf70QZoosaRhYdMRfOS9jGhPPOStIai8pbNfc00J20IIv0IVrI4NsqZcE
	QccmBSz+iV1jfLA==
X-Received: by 2002:a05:620a:1983:b0:939:a0bd:2c95 with SMTP id af79cd13be357-93a2973f678mr187347985a.4.1789371701401;
        Mon, 14 Sep 2026 00:41:41 -0700 (PDT)
X-Received: by 2002:a05:620a:1983:b0:939:a0bd:2c95 with SMTP id af79cd13be357-93a2973f678mr187343885a.4.1789371700920;
        Mon, 14 Sep 2026 00:41:40 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7723d458sm93064255e9.0.2026.09.14.00.41.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:41:39 -0700 (PDT)
Date: Mon, 14 Sep 2026 10:41:38 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 22/31] arm64: dts: qcom: monaco: Add domain idle state
 names
Message-ID: <3enm25celxcu3zzitfuiz2p7fo4f2b75jcpzg6y46z4fx2tutr@pbipgojr6ehw>
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
 <20260914-b4-idle-state-name-v1-22-660c31187819@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914-b4-idle-state-name-v1-22-660c31187819@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEwOCBTYWx0ZWRfX/e4GOxjA1G9y
 9hX0VHcoisYidbzlMOqqX/aWlBmBSkxT+W+78PU8wQxh6bF12vnI0LMWvmJnI+YQvPixb3PlEBh
 4lIYSQVuverqj/mqsFCWla0YtKbXErsch1i+SwQhI2IJc8JIOxENMzQEQbn7g39EBXIAs7S9QZp
 kPhdVcsGWhEQjQLUJ0qZMA5fYax5f/1NJxi8oK5JM4ejWoBesdZT6MvY+8OJS1ZoJDySwVrWvWA
 lvFhDm6ebHc6CJ21lMK4Dz5k55n+80coPTDEXwAYRSeznRDXiGkYY18E/qG/ZqFNna0enIY1OJg
 kUNi+Cag6hQxUQQKihlWSLITzRJ/fESFqEmGq9AmWYvwrEquWOQS8UIWTVvQVIqsqflW7RPXtLO
 RI7ZfMDtRbOnP3IUhJzvfjNLGjeGhu1nAecrQSAQfcp1XtgfAqEjZvLXPfGX3/jaoxKS14kwV9r
 l7t7iHSZB5SUINnhw6g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEwOCBTYWx0ZWRfX2JoyFAumM+kX
 ACDCukiOW5aXnU7TDXN4nsZfSw0fXGohzSUzZEnPbqa7eyz4SrSQzcFcJE5QDb68pBuradKdg4h
 RQagsedvAz5GWOkLQi1CBnDy6Wj0IWw=
X-Proofpoint-GUID: wmj3foTgulT_j70F4mCIEaaah8JUs69i
X-Authority-Analysis: v=2.4 cv=OeUNnRTY c=1 sm=1 tr=0 ts=6aa7a536 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=HAnpKfeiUU4SruykqnYA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: wmj3foTgulT_j70F4mCIEaaah8JUs69i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140108

On 26-09-14 12:29:54, Maulik Shah wrote:
> Add the idle-state-name property for the domain idle state so low power
> modes are described consistently and its name is printed in pmdomain
> debugfs.
> 
> While at it, update CPU idle state names to match the low power modes
> they describe.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
