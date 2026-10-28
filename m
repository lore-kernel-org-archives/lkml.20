Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793180780;
	b=DooiSyG+JeDhsTUVL9YdTpveT8RdMgpxvTCu6F8o2xwCi+6JtCG7jbL+PBm/E6/aHP6i
	 E/K5CCqJ7/kFWzYCCSdfXMtjX356SLAzC7WR9GTYDfXythBcOCvi+6PvPyCvdt9++LBWj
	 IFPJZtJgoUiRjUcNBX4TialBg+TlWvUKrTbKm4UDs+weX2ERLYppMQ24pv7wCOEfj5Np/
	 drQC+9vEetQJFUUhoi5DDv81kL4rJ6LmzbYuF3UP6Z5EdUhDo2EaKyBQwoFnLIhM8DbPx
	 yYIGJ/63vCHhCndLdQADPFA0y/0f+I/W7o5I72+E2mwEbVsAlPqfY0TfhQ++oHFfq6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793180780;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=3A7sCrPf5XBmefcPTnQWdbsYupGHp+WgEFWYi+0+UaM=;
	b=ig2nsCXp/F9M2fA882cfJ/PzPbUWlIBq6Me9JqwZQuhnBfSHw39bdbzhr+WXbquoIbrJ
	 QsmDYw1ZTjUZcgtFL31/U7aZ/R8LwxtSO20lVvjc5kG+rCQbYgJNj1/5LwYysYZIOC3G0
	 sJNtNcFeRItviiccxkIYw/797432S3mUar/mVQaLLHstV1gaYYoo2PgJGxtF01eEnFH4X
	 1T/WPUzpaDRSJc61+6hHrFGmGrPFWejV3s0g57gMAn9TtBXwYibgXBpEms7H9b7beiQo1
	 VZrwm35K2GchCyx7o5ohYfjqar+Ex/6VJVCV4IscqLgGWLan//yqsXFVEZYTZub1tag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=POvrRvz4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Fw0gS1jk;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04A12606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 09:46:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04A12606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=POvrRvz4;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Fw0gS1jk
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S8K5sX1167750
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 09:46:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3A7sCrPf5XBmefcPTnQWdbsYupGHp+WgEFWYi+0+UaM=; b=POvrRvz41W9uThg0
	GNb2eSltDIZ4tAbRUDcekQ/rOoqJIoXChAw4eu1Q/LI17G92gb9Wj6lcirYmxdmp
	b3NVhb1Cr1eA9qhLcoWjC0m6hIZBTSsyTi6WVMIKW05Mzqy2CeGE6VDdKXNZwi20
	s81mcapVW49ByfDbm/zMGYRZQCHvSbUmGnfJOgymQPQV+gO8ZWNkRKzb8/VrCWog
	1IEdnFU2WgFo9raGVwb7bYFWFD1Ywa0vWM/JFdIazYf2vadYhmXiAF5KcAqyvGt3
	XLaYVnuLTKGJxV2ZTfjdm+t6D81D8YzQxk35GC+bNEyTBblp62RO23yqb9MnmY8H
	ZieSww==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk7g7hk7e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 09:46:18 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91c817b56adso7058246d6.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 02:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793180778; x=1793785578; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3A7sCrPf5XBmefcPTnQWdbsYupGHp+WgEFWYi+0+UaM=;
        b=Fw0gS1jkOwkR3M4exwNXb5vamIBa56jLco4yIHiJAo8MLefN4dHWxPfo3TaNizYL1Q
         vDH4D2Wxift1HnW5SqGJs0mrkxz0D2486Ug+4g9wkKlkoUugYDh6ccBonbEYLeX1X44z
         1ZepPdzA0+QyVi+Aot06VYOoiwqVdF4Wdzp91acPUs228E2gOrt+mLNwwr7w8QTqjtPB
         SGYMQi4REmscyJl+uZkef3Xu6raUTdczzNEQQNOvJiFegB5y1a3GgpRuML6J7rinTC5O
         o8G61ZGFUvzx7AxbnHRMAXZzzMBzi+pQLVUVfwNxq2rmQbltACZ/shwjvaGbY33QMmY/
         RiSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793180778; x=1793785578;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3A7sCrPf5XBmefcPTnQWdbsYupGHp+WgEFWYi+0+UaM=;
        b=DE+gQSDHZXaPjJPEqy77s58bf4aOSNb8oJxS0lcFyAT0J2uQ4OMvVHZX4PnqsIUDNl
         mMaQ4ctsO+ESOHQ8qZoIbBA5C+JEoRos2XkDiqghy+ZR1I9yL/GE87rc+OrQVvNuh+N0
         uifAtke7jc0mCykyD8TOVm/dM6AUGgbYRHUtGzCNOgail5I5h+a0OaHXnl8iICx27VDa
         Sg6LIrEB9WoQm6Mtw/eDiHexBrRYZjb41DZ5xSLmWX48TKzNuEMTWqwqGKQaeUpXrbWT
         tVF2A8FgGIjMZlMNYNswvGsEeXenzfkZh8J+ZK3p/5pNlzuAadxM615bXKMldegyQKBV
         kJRg==
X-Forwarded-Encrypted: i=1; AKwUvBxxiBTHmAsQG6uq6SUAI0e8wrk8Ne2R8PlebjO/dZJ+v0k29CzLho7UGzyQQiggznrjt7FcqkBU4XrzWXs=@vger.kernel.org
X-Gm-Message-State: AFq9FYJsJUyk7DCGVADsNq33cxawO4oKc+gCL5WlHFfzBXdgRmRc09ZW
	RqCmy5OuMC1oXn4uQezd0zkfGLhHpR0f3LTkinTPSkj9PEX/Q2P+U9a5e+eV1HDBakykLC35iF6
	oEY5M0AEE3hzLNyNNy3oYhkZBU4xwAU0pmOlgHXrD6gOViVlTTM+bn0OSIoileq4nMvY=
X-Gm-Gg: AYBFou2cNFK4l0br3JHMR1YU+IeIl2/wCbr9SdhCsgasaLSjkJTN+RY/HrhY1Gw1W2q
	Qgjs8ZnyaUZzWkeb7DvffQ+M3Ntgn9VF7On7aUReYWAqZBGKlUFbnNls8Bq9JG6UmCJYOWupIkT
	ZMUe5/GIswijTwRchJH1igjcw2S5H3MQeSJIGE9JLdL3IaU8sB/9c1eMVZLmts7IEGmLhSVHEt2
	XDf4i5hx0mv43QkmECIPY8nfJcEV48c7+yoV4NuhdSo4uqqFh+i/PV1Cx83XmfOYRTJXezCsPut
	IQb1lV8s3O3AUjco6Qat60GtthBZMwMhkc0MdPADNScOHPyB1CD+KVWFV75zp6SmLfBR3pWhbMa
	1vhU185yl+ZW188lwc5LyyoCzMeY30C53zpF5xZlpz6rYw6JGgqql/+ucyz7k0UZA7ToFqDD2Nl
	ah
X-Received: by 2002:a05:620a:46a6:b0:93a:82a:71e5 with SMTP id af79cd13be357-94408aa271amr236648085a.19.1793180778401;
        Wed, 28 Oct 2026 02:46:18 -0700 (PDT)
X-Received: by 2002:a05:620a:46a6:b0:93a:82a:71e5 with SMTP id af79cd13be357-94408aa271amr236646685a.19.1793180777987;
        Wed, 28 Oct 2026 02:46:17 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a969e61f9bsm20311365e9.2.2026.10.28.02.46.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 02:46:16 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: linusw@kernel.org, brgl@kernel.org, Orgad Shaneh <orgads@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: octeon: allocate the GPIO base dynamically
Date: Wed, 28 Oct 2026 10:46:14 +0100
Message-ID: <179318077288.13137.6470160689389731507.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261027060221.2687941-1-orgads@gmail.com>
References: <20261027060221.2687941-1-orgads@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDAzOCBTYWx0ZWRfX9X9r3bcUeEJT
 PkOpz3e+12clR3DiLCzOXUsIAOq4i8ikVQOYBy92x8T3RmmovkDM2oZINhemzPk/z2YjV3aA4LL
 xbPG2+oWdS2aFG4HAG8HDTAtTQTqhkk=
X-Authority-Analysis: v=2.4 cv=SoIFe/O0 c=1 sm=1 tr=0 ts=6ae1c46b cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=feGN3rDt8dsL0tduLgkA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: biLoJxFtV3-7Ew_kbin7idH2aZ-80Z0j
X-Proofpoint-ORIG-GUID: biLoJxFtV3-7Ew_kbin7idH2aZ-80Z0j
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDAzOCBTYWx0ZWRfX04lSRcL3AoPy
 1b/2ndXD8K2SP7U1vM7Rua8hP18IEH+m4dIdcLyoL2TUuYxN1ut/pNySdjqZsr8z85pjVfQ8HuK
 XZu+M9+/Frtnb8UuRnmkc1AXaHXgFj2EdVS0/BQCZP8KgxpxSmKrbE9mflW5RDyVZm0zfK2bqmx
 hLdPe7FlypZHFEdlIZGOhJFjmPbLqTU9LrTe/QuJJmjoV8OcsSi8Gltc9pJp8YuGzg71tZSy10g
 r+qdpY1RP/R8JgImEMIXLZ2K2H5AmKMhyS5JLuS1kasETFdrPXR17gJerJ7mNnXy8QGoNkEnoS4
 XVwd57HW68DRKCUPuxyqp+o4RiAf6eiw44BVDrPsUTM4svISGk15IV8Ja3EPPaHXkab0bPzNjXJ
 Ra/QT6p2MXCv/oGqIGRtAQ7ouL7yv1FxUAroxyOe8JQ/OpD6prnxAvqbLYoyHMpvfEULH3+sQmg
 8B4buW7bD5FWjBBdv+A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280038


On Tue, 27 Oct 2026 06:02:21 +0000, Orgad Shaneh wrote:
> The driver registers its chip with base 0, which gpiolib reports on
> every boot:
> 
>   gpio gpiochip0: Static allocation of GPIO base is deprecated, use dynamic allocation.
> 
> Nothing needs the fixed numbers. The only in-tree consumers, the
> gpio-leds nodes of the D-Link DSR boards, reference the controller by
> phandle; the GPIO interrupts go through the octeon-irq domain; and no
> board code uses the legacy integer API. Let gpiolib pick the base. Only
> the chip's number in the deprecated sysfs interface changes.
> 
> [...]

Applied, thanks!

[1/1] gpio: octeon: allocate the GPIO base dynamically
      https://git.kernel.org/brgl/c/dd2ad62e78990087bb62864ae76e7c2251fe5b90

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
