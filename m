Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C94F7420488
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 08:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790064903; cv=none; b=Q4FMUXePdgIC+FiigqZmB5KkxjqghRiGGf6VVG06W3Sggrrf1u8xPp5MAW2i8L47ZVgxUqz8vq1m1ixp3+sTHEzJxjcjwyW6BI+kuUG/TPiwRKc9TNS4GC46YfGzSbpJpNt5QyV6Wf+JbYYEkqmyVWCtn0ctmJk/NPkg1Xpz4mE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790064903; c=relaxed/simple;
	bh=QdmMjDMXOUbf3uJAdob1pCjvy+MqJXcO6U0Kewq/5H4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SCfvCOSkfEU7wvF7lTXyRJJTageLLYEUV4d2UYSRnIm7M5SXWlSnJ6fuR83tOedhGX6RSYzc3iAfoj5GMqhn2hnsURuuQL26w6HwoxN0s8lXGMn4Lq+uAOrZUMfbeNu1zFE+VQc8BXf6G0XHmX9gFJLc7wZOEGRjKhdj+gRLHAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oupMneNz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DNHZ2xUe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oupMneNz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DNHZ2xUe"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M2sadu3675452
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 08:14:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nUVwl/Cqz9oHS9EDYzWm3E77+kKD/YiQILpCclthFpY=; b=oupMneNzioNcUTOs
	MGAqMOc9eeKi6luGAIoBFRTNYc6i8Na92RGA7mpeup0bIouMmHX3Y3xziZO9nPiH
	2aNVtft2mHjuaCxWclK5HuRc0eHXVCncEMRmIEGMLv6SD7RGkO2wQrFs77FE/MoP
	cq1ATti7Q8q4eLNYyHNYQXKdHMiEPDT2/3i6/FcJjDyp0UqDr1b3xLPCXxM/45E/
	7/EhwAlxvcAGZDWAztR9+RIlpB7FsQLkfgN97tS3UK2BP/irxIcAMuiDl+a4p1TW
	emScBDB4LUWj2cKZCm+He8P3YvAoHWZRtkFxolUQiy+E2PT5w3fbA6iogNbpn8dp
	DvoLXg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guha5s5df-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 08:14:55 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93bd22160bbso350100585a.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 01:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790064895; x=1790669695; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nUVwl/Cqz9oHS9EDYzWm3E77+kKD/YiQILpCclthFpY=;
        b=DNHZ2xUeT8Rp9ULBGASsQ2YkTBJW09fFDm0wxIHQF58k+C14Di4ZXhoD7yp0p6l+QW
         Z24+GQLrtBZxKp86rVRlZGQtVBJ2T0kV+rA63x0MahsKfr6VjmVDrI02vfBgFQBurcLo
         Tu1FJXHThQC6uvlbRLyXu5nEzqve+DA3VnbqR6/AEsvfAP9WWUi6zkLCKabfmX/riRNU
         2b5wLWz7sPLY2Ew0oH/pF209/7zfR+Sep8b1KKXiib4Ak5tXBkqiVnIAET475JMSv4zZ
         +2ySwJkV/m7EF/c2aXiDq2o7EFqvAu4NUbNPM1BnCHF/t87O3WeYsPX6/31EkffpmTMz
         AfCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790064895; x=1790669695;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nUVwl/Cqz9oHS9EDYzWm3E77+kKD/YiQILpCclthFpY=;
        b=vl1ev5o+sY5IFQY8K439dYiAPKoT5vGrPyG+ymtL+IVc4wYC5LOqPwB2XArlRB5Wvy
         8hEVasRSQwVONGGWfqxji9f3w3cmEnvM8iVt14kRW4NKJOPSf1xfJ6o6PXvI1FbVwp++
         wsLIlLUeIP17KGohJVSovlbhr0PJJduz2c6SKXWK5v2rR6kCv38vorMhgYB1UHrRccP9
         IYf+HDhIkK6Vs8Burd0vRsepXZF4YIRnHwk9M0RDMYqUmYT+aZpaRf6W1xhC3k2CA1d4
         OYzcvMNfPKLftUSOTVhGMGXKAzGRkDijhX+USdhsl/GeEWDGuS1/gbiDzfOlBfDm5DiR
         pzvg==
X-Forwarded-Encrypted: i=1; AKwUvBygUfMzfu9qCblT+leBgwLGNauYjfW4YZGAJxPlHnX7jKFV39nnoGwMBnx4gY1CYYFjqyogiER2pTlSqbo=@vger.kernel.org
X-Gm-Message-State: AFuF++lsgIWAmVcWfGXDpKsy9UeffUY+8Wg1cDAJbYecHjoSsbos5CQw
	xfHDpDH18hyqizWxDfdWlz9d5s0ao5I5C+pdHK0cRygav6txyJZxW8bNdHhkZ7jp0JaaY0OVd7b
	vnjAkQLFvL/CQ9GUXMbCU0WAZZiC02+UNPrMUI6IyblIL5GLe0kaCoW1dLyiiuaa52BdEvFmpvm
	o=
X-Gm-Gg: AYBFou1xtQ455wmBCWN45zcp0Ea7dtHitanE4LWNy7Vamhaxu5HUvhWzXukAb0FdpJY
	OMfnufsG1iJXWX6XaiREuKR3gGT3m4ecowJf+PIiF5LhvvIVqZxR+LN/uQDcg4QXeL+qJj3QRTe
	7GCclve2jy00ZipICjsZiWLj+M9umjxfcpA+jD4223Rq2+YNBMdDp5HYbQSqCGxJkTzuvUgkduS
	DyiuwpN37DWnVelBlJkrXaBKDBE4s116TZRRtiLIAwF4wH8UP0kBVP2/4EFYzhe3S40KEjcCMDD
	dgEPX0RC5K1x8jMRraycrLTsTAXDs+zXOlaSh5bJUGVzmPA0wfqFQ2UDWfJIKozYYj9SD+qK/pg
	5TnHQC1lDp82PmQI+RS5UkhxdIA==
X-Received: by 2002:a05:620a:2b88:b0:939:4a34:621e with SMTP id af79cd13be357-93c15dd29camr428478885a.28.1790064895461;
        Tue, 22 Sep 2026 01:14:55 -0700 (PDT)
X-Received: by 2002:a05:620a:2b88:b0:939:4a34:621e with SMTP id af79cd13be357-93c15dd29camr428477785a.28.1790064895059;
        Tue, 22 Sep 2026 01:14:55 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:5105:ff9:e148:c440])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fdaaec8ebsm29624705e9.2.2026.09.22.01.14.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 01:14:53 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Gilberto Conde <gilbertorconde@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctrl: qcom: ipq5018: add missing pwm3 function on gpio13
Date: Tue, 22 Sep 2026 10:14:51 +0200
Message-ID: <179006480189.5296.14114612029159651511.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260921093419.2870168-1-gilbertorconde@gmail.com>
References: <20260921093419.2870168-1-gilbertorconde@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: tk8nYb5Z8ln8U-73hsTDFVyShoOMPH22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDExOCBTYWx0ZWRfX1pXL6+hPeLnS
 NnKCmxzpw+OzRHn7FhAGNiPnNQUee3sy2IRDH2E+iMW9/KQ7SXH/LQk2VpocNXKFDnq1jTPrMIx
 h2y42wTiDZUxFm3BWfuBbgzJfkgMgZs=
X-Authority-Analysis: v=2.4 cv=U+4Hnuru c=1 sm=1 tr=0 ts=6ab23900 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=ywFeef63eliSz_rKYaIA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: tk8nYb5Z8ln8U-73hsTDFVyShoOMPH22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDExOCBTYWx0ZWRfX2MxFyWrMhlHk
 fpvAHZOfrgxnsYmMhUtz5pQpzad5VexaWqAkECfPFIgTnGobDzvAXEPpPzkn78h8Xw6TXGpBwm9
 FvcIF/IWjgpfhKhb60DuEUOnXC6E0C/K775akaDAget521uFS6+GovgwsmwqXQQv32g7WnG4X9Q
 YuJKT/CjlFPmR6/mT/wy0+wlycGBDknmdVH45FbP/7GNv+nSnMVaBeCsaWX5mQdVzq+akRA1i0I
 a+5Y6fuDXAIcBQqhAbkaq8pV13fgHuIfYA4VBOhmE+MsiEsj56wmiXq+xfLLrFyL/eH1WcTXDYU
 G+cl1FtZZ3lmSf4gFcK4kAW+7EaeFwpRFy2A7eEQMQVAS24gTZS0GkXnfpxe18Hkj/t3tmTqG4+
 GPg/5riziuVAFcymxeRs5NLERV8rGvKzsDZidXrH+oJ0BzS4tmBQV9BhWexABwYaB35pP00ISl1
 Fd2BwQp13rW7UCmGwkQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220118


On Mon, 21 Sep 2026 10:34:19 +0100, Gilberto Conde wrote:
> GPIO13 supports the PWM3 function at mux select value 4, but the
> pingroup table leaves that slot empty and gpio13 is not listed in
> pwm3_groups. Selecting pwm3 on gpio13 is therefore rejected by the
> pinmux core:
> 
>   ipq5018-tlmm: invalid group "gpio13" for function "pwm3"
> 
> [...]

Applied, thanks!

[1/1] pinctrl: qcom: ipq5018: add missing pwm3 function on gpio13
      https://git.kernel.org/brgl/c/c6c159fcdb4e9a678eda0831f971e4a3a488ec47

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
