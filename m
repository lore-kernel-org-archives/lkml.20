Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6824E45C717
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 09:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790932842; cv=none; b=lrBCJYegwHnLVzm2NH6i24b0J1B2+Tl0lxIautBnOVipJ9j3tGIq/7P4qkFeGxvbWjmTEqXBb6qg0Q13q6yGgEk6TIOscxSbJXdHUVSr9Q/TpuqajMEW4t3QeImFjETUqJAvX+NS/mKZWeNqrg8OH0alaAnXwn/nPHY3StR9UQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790932842; c=relaxed/simple;
	bh=+HiGs7ic+G67g+jK6ihA8DwHby0KUl5GrLnvv3fDxps=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P/Yhec9hYAXkmGu7si2wRyHmcPdPsm4wCuD6Ohm+cwfILmg6YwOPqIEPzcCawZkrnSQNeguyEmzJEgjIlYrtEsPRJMfrmcfxXqFDUtGPZTfBGws9fC70+RwYgFAC3rurICAalG8TyHq3WB2Asp/NC06N+Xk8pDeocutcSo6U8Cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RsrDEX8t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KkHk/HYX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RsrDEX8t";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KkHk/HYX"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6925j6bc233741
	for <linux-kernel@vger.kernel.org>; Fri, 2 Oct 2026 09:20:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=BEvD6iYviTx0ERjEtbXW1xNy
	bpDy8Ge//Ongv2RbrMI=; b=RsrDEX8tfSN1k4qR7Mkz/rYSek0nBT/75bonCZIp
	1QTD81buRrzX19IPc1/lX1lQwgla0bPdUhKe1DkPMkYO3xkQ5Js4Ode8N05rH5c8
	GklCBEhQyYD6CjzHxSLoGTIgqMt6Ep8fEjcymTNjtoJFweDAAiLiYXlU4xEl3402
	HmvmO5YiIuGjRZXAeHnsyj2F1S/eL0hwBxopyPAjjKr+hUXwVZ3OVUFA7c8mI4T+
	FMvJAWrorIZaNwd5zvLRFs/nbO51zSQoBlXqYT5G5+baLqYf5q5m/iPUpDoPLNAc
	9Cl96xd3JwGAdlhhh04WiDGBFOUF8TxWMHmX6TlP1Fem2A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1t9abe89-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 09:20:39 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cb93c874bso262713085a.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 02:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790932839; x=1791537639; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BEvD6iYviTx0ERjEtbXW1xNybpDy8Ge//Ongv2RbrMI=;
        b=KkHk/HYXgc6/N+B+dAb7RhFvVn0Ux02I3rAJ60byTGCfQUPxE7pSYVRE709m55WVPv
         5fAjy6eUcbwv5yMo1MixCGJbnWi1Q8qC1PE+84+g5mwYUIA6qVby93N14iJ6IgLGHNmp
         gq29m1nb0ruK4K9HdTfv2zHaG0DH5/Rqr33Q7jepuRgY6avlqBeZKwaQ7OjxfkKq2g06
         q2qLYzW4BXO4WNJ9cdktdUdge5d01F7qXY6XjawO8tvZWihluych8bdbI1YGtglXVVc+
         5Atzimv9OYVWCGN3SxpUjej8gAz6yvEOjK1rZk3mRdmVHtjaLzfjpbyD80OhU6VSwxo3
         LgiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790932839; x=1791537639;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BEvD6iYviTx0ERjEtbXW1xNybpDy8Ge//Ongv2RbrMI=;
        b=yC/hA3xId+PO3D0fp7KulminUTde1+imtg78RQkKr1/jdJ/0Orev1AO6an3dcmH7J6
         C3Y29JVNqyK0bhJZ7Mh6drB1za5FFeMuhVq+99xGyJQ1GV3/p3clCkxk07cXvCpDb3eL
         arm4pS/IOfkrZoTyIpR18hmKIUNRm55V7XjAioQ28pHebt11jYU/JbznRkyAXPxPEm9k
         kSuZ9rjr2jaKW4MH0SZv9fI0BrksHephIH5sAQtJW1KOmTL0qCgCV/3vSuVWulPsZ3BQ
         H2eJvVmGojQP632ROFKPyxidGIh5HnEYkFasHkQ9vKr87A97QQD67R+kaPM61JVVnbqx
         OCtA==
X-Forwarded-Encrypted: i=1; AKwUvByETW6XB094Wqq/9hTZA9v71ROny0Ekn8TFdRESkRos8DkxRRD6NGfGQUtvqJwdu/tedswg4Id1zmMwAfQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kbs3BPLjmyejgD6NSyxb/EAOW6LDpR+yozSRlAfKkBzVRuNUlz
	6jmFpS/Pj2Ly6KdfnINZrn/45AX8yXrBt/5tWPfPo4HMX7Cu/GErG1j3Q26S7Gi/8Pv+y8ORoJx
	LGirPUuUTzLJg/wrRE94eznx32PruIi+oxifUoQCb9rEGWfR+gY4MbT/F8OIn/rCi1Lk=
X-Gm-Gg: AYBFou2Yj8fOaw/czPTEu8/VKGSDaofeGodlV0npQ4wieggk73NOAb/Lhp6akOk+Ptm
	h8s2u0xgzwZya4X0i5uiz196SyZxehY1QBGhpwoC5chZHvfGkjIaPzzSwLugs1DDFUG0T2A4FIY
	8vn9Zy2CYGLLZZtKmcfhcF2zpCclv6H0M5anjt2pnZwLTONjfRQSAx1U7hkENgTmzEizeopxeVP
	lN74YvnF5HkgVYETIuub9XzqVLKwJd4WCJTaia3hbyJaCE//z328zhldzvk8rGaiefj0N4tIbtR
	itVVv+pNqZQntqwsZuJqlG+tfAZlU4vLAwaQdnQNmTnNeI2ZA1UrGuKCDs9RFm8PeZyZ6VGAWYh
	CCcV25LTSPG+poE4=
X-Received: by 2002:a05:620a:4406:b0:939:c7dc:8712 with SMTP id af79cd13be357-93cb5a5c9d6mr1029733185a.15.1790932838919;
        Fri, 02 Oct 2026 02:20:38 -0700 (PDT)
X-Received: by 2002:a05:620a:4406:b0:939:c7dc:8712 with SMTP id af79cd13be357-93cb5a5c9d6mr1029729585a.15.1790932838313;
        Fri, 02 Oct 2026 02:20:38 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a030326132sm48429645e9.0.2026.10.02.02.20.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 02:20:37 -0700 (PDT)
Date: Fri, 2 Oct 2026 12:20:36 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: sm8750: Add watchdog node
Message-ID: <sad5fandsyilvnj5b5huytervp3jfuf57ctfsm5qroxnrvvn6o@d4z3vv6kcwkn>
References: <20260930-sm8750-watchdog-v2-0-b16fcda275d2@oss.qualcomm.com>
 <20260930-sm8750-watchdog-v2-2-b16fcda275d2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260930-sm8750-watchdog-v2-2-b16fcda275d2@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDAzNyBTYWx0ZWRfXxG8zlD8tBnMH
 G53oMuEwxM/k+6IwWMQmJSmQ7tds4R+6nLY1Pr8vGuZ8IzpwSWUHPwPWX54dMG7QwC7vTWe8t9i
 h2OHh9AeMvWIz07OBnkXwRL8z0QeyU8=
X-Authority-Analysis: v=2.4 cv=N++8hG9B c=1 sm=1 tr=0 ts=6abf7767 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=EiYrS7xXfcF7w+nkr41hpQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=x2DRelJqk6z56t6zBn4A:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: Q1LpHWIlO1IMG34ZrSVAFRTeV5Z112HI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDAzNyBTYWx0ZWRfXyHTdIL6QauG8
 dy59nYfRSKn/JN/OUyYBQNq4Ara3IMD7sCnuHnr2sMYsB37QfmlnZOKXUxMgRQm4QKKsHz4rMeD
 DhMQQagYN21wQ6MxE/j0iK5PdrFw1+2Kwk+eA8BEpZgU4w5eLTeF9YvWQXrBCihSj7peXjI070s
 ZeLmwiJdfInFAg3xJkk1hDZIA3G40N+Gqjs9f/LqQ3nhfbLFyfIOM7SbTXnuqsBV3HgynJPyXfV
 8T7Q1LxzMlVDRiogqJ/fsJMUxbViYxIvxO2HB0Qf9UDvji9Q6QABoRhcCs5AtReXqEazwbUZ8wX
 RlbZ85jL9r1S4dHTtgEWuveQAr+3F+Y8hzzp42p7us25jOUNpRIjxrWg2LZj7FZUUQiLXEet4HL
 iAb4rfLDB1vgStUuDDTW3xjsCVhteXRhZO1iOEqiD6eEpaneL9a7OoaqCtLDE6W+PtgO0YP5+ZG
 ZhzDr7/DcbLIHokSlbA==
X-Proofpoint-GUID: Q1LpHWIlO1IMG34ZrSVAFRTeV5Z112HI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_02,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 adultscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020037

On 26-09-30 18:32:06, Komal Bajaj wrote:
> Add a node for the watchdog on the SM8750 SoC.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
