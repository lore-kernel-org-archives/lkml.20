Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29A733E51F5
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789371683; cv=none; b=gYB67OpZoktpRhaR3hblbORVONfoa9NNYpOxjie5G5btE9y9Qfkl2elCCjdO/d9+YtllPYh8Xp06EXRcuWsWMSJ6A+FHRKRsOScDGjd3M6MZvCJEddOsuqtrWjTfLReKhuDk0XzL+CoJWyWhp+U7QCAuwf+5A4asMfdscF/oii4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789371683; c=relaxed/simple;
	bh=S9mfOgZNT37L0iqPCwnRCuYwvCwRk1c/oJFJz7QOEUU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nhQyt09aqMqO7e47JgWMZjbCMCgb1MpH9ERwmXXlV/QwwIfpsJcTqLyiQpwewdi3npIWecrU9Trk2WcAfD46MkorlzdPCHnML89UMUrG3/I0TyLvDymJUWgFsg5pgDF/ebhNEy0oV7QjKJCKSTTzjsGBuwpmpgXobqoEp6ZMkBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EgGDswqZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cRPTB1rF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EgGDswqZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cRPTB1rF"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5jFl13842394
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:41:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=P0lROkR063X41Wk2R6NFEfyL
	4RNeusxNUrV+Xwt9Mdg=; b=EgGDswqZ01SYxWNR+unnXQnYUUxw1HoMQy1J1hdT
	gGQc6chsMB7BhEOiZdqazN/B5lirvHoe7nEd3LEMF9F7o9lmMsHt2mcaDH7zZLyQ
	7bVr85TynDmEef8xY1Nl420++rYG/hrrpmg3oNSiZGZBv248QNhQYEHwxDqJW37m
	mQetrFUyGozl83pN2LppyefvslKcofAJBqVu7P7CgnUs7AAaZgKFqc9RQidDRv1o
	p1YAWNi3FjsssgKNcOBNjQd/SKenoGwUS9M+fGhxicxIsaZqG1MubCYLr1+APu6w
	Vq0OnhAih9BnTwfhsKOP31heO7GVc0K6SzXtySAT4VcwLw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9c5jys-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:41:20 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9390a2c895bso716364985a.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 00:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789371680; x=1789976480; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=P0lROkR063X41Wk2R6NFEfyL4RNeusxNUrV+Xwt9Mdg=;
        b=cRPTB1rFbX5o8IObxJneChtp9BJvCLNWptb8S9rqCP9ptdtWea1oYpuTVmISWd1PoD
         R9NjlHKd36QK4LfbVemzlvt5BhwxPUZrVSyuLAhpIWk/KMj1CEnns//4Zd+FYyCp+hw1
         GE4ncFI/y5Qufkex+pWCcFrnwzxP5aJILfWTD/YYLuUwgH3dhvBUFccTrmrGSn144lMw
         9GvRJCuIlPaGOTap7oNsxXXwzDLH5qWt84Xe+RkxsGt6lsclNoig1HzhUY0QBifSFGIc
         MmxI8p4lW7hzSM6bMvGZ0DZKCwSK5DrdchVT5v0w5GZw6guVM5SpscfGBViO2RybwZ52
         bDHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789371680; x=1789976480;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P0lROkR063X41Wk2R6NFEfyL4RNeusxNUrV+Xwt9Mdg=;
        b=T1fmuyzHyOQ9PdDfxQdLB5Y26U6Rd8S1H0VoF5rg2htzH/2xdlrsYTmuW6hSYI55zn
         COpJEF0KGGSSg0xhApjsPvP2N+6surtggPcaJerxXvGLGWdz2Xf1YUIAQQXFF/5SoDSm
         SalsUXQqAG/mRRQHCfkCpuqerVJNthoQEBgLI8LXvWjsgUjZzs6aD+GR8NPnHv4DWsZF
         su3hDXoPuM/ISpo2hntTwGsqf4YTpRp40LJNB0j8pFJMIXjQxQ4I6aICjxKIyzX+/cYi
         3kME+V/Ml7BYaqmahN6WzEytmNeMb+Tbq+T3OQYEoqv2mE8uke5Ow08VrBKpYhBKnQvX
         kfjg==
X-Forwarded-Encrypted: i=1; AKwUvBxsfa93ZfwWUmqhc8LHJCHKHnS1z8HMBkjQ0yT5+VGz3xLA9zqmjF8+gSvGpgCB41dwP7o8TrZeZFVyvKw=@vger.kernel.org
X-Gm-Message-State: AFuF++n679AsLh6yRJCmJIzWf0B4gFy5wh9rg4zjM1T90p/gZWKQofvQ
	jxp4NguKroJJMt9H92rJozo8Yu3csJaIInDlSk4G2tGsBUerAT8xxN4IRuU2JEhLf6BMjlNw3bh
	YgmCQ9hkRLXdxwXnVmuPCKHqrozvbcPSam2HGRC52Ue5awPxG4Q3VDQ+y9z36lw28U2s=
X-Gm-Gg: AYBFou2o0ZKnAZGGbvb4wtMqtqzrhIUhXwLMvYXIBhagoEdjB7SD+qH003Wq/RiVd0H
	sCbYvDjMSnVQnpvzcLDKejhP3IR6PUttmAS/XBVZP7X3EncpwHqaxzIZmjgP4gmAYF2adulTlv9
	rD3taoZYToXglRAaEHgbqdwRm3dEtZ2h+TqPbw88pFlk5q/kIDNhI9rYFYmrP34L414O5pIKZHu
	nGp/hI09hy3uC3Tkw3Jlj7TtMcqSHQ0SMfFklKDV0DEJAUBl4iKnZwcky+pz9RxCRM/qfIIR2kG
	diyzROrn+CgKkkLgf/86Mao25d3P+ZvLxS7iiQPR5G3Gn5RWmAwBKwt8bclURWtbcJMQ8NRP9D4
	eOa/eYjsr9oJ2zQ==
X-Received: by 2002:a05:620a:44d3:b0:939:6516:7128 with SMTP id af79cd13be357-93a2973a233mr211338385a.3.1789371680295;
        Mon, 14 Sep 2026 00:41:20 -0700 (PDT)
X-Received: by 2002:a05:620a:44d3:b0:939:6516:7128 with SMTP id af79cd13be357-93a2973a233mr211312185a.3.1789371675134;
        Mon, 14 Sep 2026 00:41:15 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb33ee5csm24916609f8f.20.2026.09.14.00.41.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:41:14 -0700 (PDT)
Date: Mon, 14 Sep 2026 10:41:12 +0300
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
Subject: Re: [PATCH 20/31] arm64: dts: qcom: agatti: Add domain idle state
 names
Message-ID: <n2ddnwkp7lm7m4b2qdcspuqhvqwyriyxxin4onbsjxiklb6jwf@udvna5roegef>
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
 <20260914-b4-idle-state-name-v1-20-660c31187819@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914-b4-idle-state-name-v1-20-660c31187819@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 1ulk5lGQkTpx_9tWk2eXnkN-21cURRIL
X-Proofpoint-GUID: 1ulk5lGQkTpx_9tWk2eXnkN-21cURRIL
X-Authority-Analysis: v=2.4 cv=c5Y+0h9l c=1 sm=1 tr=0 ts=6aa7a520 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=Dm1D3uWegqzzbaKFt_AA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEwOCBTYWx0ZWRfX1y7p3KWg4Fl/
 bcfVGTvXhxegzs5ib3OhGTKXEuq9Lt7FONbtcYshrwzu99sVqeN/RgYC2DDDMwMcajp3zTN+k3c
 ev+Rt8TTqr1PmUfNtx9WSxNNsde0yigkKargOFMUwlp34PDvFedodqFd3In1bvy/619GvmYBvwU
 GfzLHA5eEVYv+y/D7RNhL+u56lMIYPbeX3/mCXwGbBw6GK2nnaIlWf7ow2muh4C58zJEUTCZKJ7
 jOvAL5WneVeVjn5R/oJeTNp927kNktzq0omoW1mH8BjMopxgGd9dencOSFVsoz9e5FZVd8zluIJ
 6RlKCwLgLpw3rvDabNP6gEFDwvte/8cXfgJvkzukddES7xkJ5hEoCz/VDyAKwQBEEffJ7O8di1o
 /JwfBRfXcyaaHd0jvN9rQwwauV9lqkivjcaUbpKI5FzTncpz5xBzgpH1Xm/XmKAVNsQTWQGg0I1
 I73xNySd4fzjw+F3HDg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEwOCBTYWx0ZWRfX/D58icCasVIv
 cbTVjDCcEXOwjYYSK8+fKiO4/RqH0F8yzFGvP2vXZSjHFfxgL4ihA7sraZsU7Kt/AeG+8DVuPOW
 bVLBP6Chk1E+5h1+WRezK+RH8PmPYgE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140108

On 26-09-14 12:29:52, Maulik Shah wrote:
> Add the idle-state-name property for the domain idle state so low power
> modes are described consistently and its name is printed in pmdomain
> debugfs.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
