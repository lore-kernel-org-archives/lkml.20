Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBC2A305674
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 08:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790324086; cv=none; b=icVnSmkQ9pfx0kpFjEgsc6G7qsomyaNOqXnulOdng+XhDyrCTeAJQAOJ1XjCIxoZLzxOyswjTuC9bGVEArefUUzmg5/5OTn1onNPs+JkEx5zfPvBkR0aUUkRfyDprjDAn3f82jG9e2Nqabz86osCdIvcaSoY9HMyuxHeMpGL2gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790324086; c=relaxed/simple;
	bh=W6CSnM3iFAotwz0hIA0yIEZi3XfCoJ2mRyKz9Egt6DE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FAyd9iHkcGRNiigpRvRRAfqa7MfgusHtGr93kjx/PMNBkMLD3qNNtUftkj9OD8QTK0EnpiDw1aUIzSRH8ER6tcEmm8FwJp/7mlMTnAbLRWe0iw4FxE4rJ7/hJCR/P4iwlbSgga0V37iuUUJBa4iIXclByA2mrTa4+B4AGR08o90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XQk9wqXx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MvW3ShCU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XQk9wqXx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MvW3ShCU"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P4YXs8289475
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 08:14:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N/+ShxuCuQM8r8Ut4gMHeV9EcMcOYcYxQqDfqAgbKR0=; b=XQk9wqXxh6qyOuD4
	E3h09v+KIyeiECaEHw9S+hwUg+dTmtNjbQZ8k0bDLBHNEdTrJty6XrxYfraCcESI
	0ys6/jPrabwIwOjwP0U1fRs/1EzQmHDaonU3aZeBKuI0gEy2tsxmL+j49haS2ltI
	4KDsjPD78yuDbb4AwbU9nOyb6DRHLVs+lLBp4PmweGN8hO7LOP0p26hqNh61AoI3
	f6E/NwcOjt4BsjQFAmCtyF+1omBa0TUUdqzjtOi/4AEIt7VtbF4sv4v6CK2X8gKb
	m4QaBHZo1JecN/sxCqJVgU6hUekfQp10VgQORhGrrlwaVo7nn7Ny73/PaDUFNQOY
	sKLzOg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw881tnd6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 08:14:43 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-934956beec8so138622085a.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 01:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790324083; x=1790928883; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=N/+ShxuCuQM8r8Ut4gMHeV9EcMcOYcYxQqDfqAgbKR0=;
        b=MvW3ShCUTCQkyXv+FI4XW6+AqNOPgJKO7mKAYFcGhjEYVnHt1KVegcVMYc3QfWPWfX
         H/1YvxGAJZwsyDmO0KiR0HdxPNjSnTbgcT0GYRjA3w7z71QMkQQLX/Wh8rdBJS0om1Ga
         W/ChUJaKwRWDj62JJGA2CmV+9Cofo3yMqd7vY9eTejUht0+2S9lsEkI4ImLUIVW8RxS1
         TUXGTuLu4Cg1coJPeuAT8e75ZJW8gCSBoiIEPsvZHOGConlRxeYRDNaYNgzE0afGMpBs
         w+eymUaOJIAKYv2Fazq3hEnJrnX/DgeNy6xD+0GJB2LAZM5iEWviU7HzAwhl0QnEnQD6
         kPjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790324083; x=1790928883;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N/+ShxuCuQM8r8Ut4gMHeV9EcMcOYcYxQqDfqAgbKR0=;
        b=Y8KM9iL38GNtRdAtIrdWqzmlbu+MKj+/681kl9TIQHvSEuzKGhUc/vUKNBmIH3j6Xk
         ZO5zsoJYk8heHIGNncQ1eumuXES72ThxT4Ey0jdlL8rfMP0GL5+dT9B1YlXlDak7duSc
         D5JOZCpGyod2CvlRNQSi1AJ6QU6/u07kbNI2HuY/Vb4Fw/CURRJ+IYLN7cXWi+GeHFF1
         DCY8nrHgDaKrvZG/UoLB4kIX9Ia6B0TrYnzIjDBnmZooL7yfnU5fLWNHFcSy25WE37B8
         7usIXpdvMZitKoflCdBpyS7Ojwy94+58o18oyTtHb7VY0qAdDaUxMOF71IBLf8V9O7wU
         tMiA==
X-Forwarded-Encrypted: i=1; AKwUvBzzG5uBGTx0NnrTPcfI+i9OukNryMHXAQ1Hs4YDk4bB/OrayceohOAb5P2tDTFx2bVC78WYZyRm9T7ikUQ=@vger.kernel.org
X-Gm-Message-State: AFuF++msuWfI5kDS25sVGpJyxyID4sg8yL8wUhdWZuTm1VjRWnQBBq2H
	py9C7+w/C+uB7o2wh2rpTFi43S9s3ectHDcA65PfeZZd0qNhNkgmYc8qrssHzW3H0cChi1AJaEg
	T041fGEOaQBIGmpU+A7Rm83AflOYmoxCUSRGNzuThOpXL7hqRNN/0mAj4EHu/a0XjWY8=
X-Gm-Gg: AYBFou3Tw5Fwi3jpo8/8xOYUyvWW8IZuURbpiWS2ocexWoZkz8ORkRPQ9/bdBDs7ylU
	27bvpwSSp1t0G2+qiX4dHG496JWlweTCuMfrBQzXosfZkJadyhmEskWvXWsQFiXVcS5hLzV3jcy
	E+6I8Z2sOD2bT9sYS/1LPNk9l9WRMIg75UWYzfzzLMou0oc+Fgi+q2ptIRYyLYebWge8Nln/axM
	y8RE9J3vHRsLNN3nQzJZ3yXmBBdnPOeMjT6bixiupRBF1Cda59zMD6dy1aBgqMUh5mgZAkgSqZ6
	o5uw/JbsJEJ9G0l86ZsllrT4L2PwDxOLMzefeQpfy5NUzaUPw+6fTVfY4wnTifYbmZs5VwPHLRe
	Dh5RKO0A+crZ1DnIy0PfrJLyeyoQ=
X-Received: by 2002:a05:620a:460e:b0:939:922b:3de1 with SMTP id af79cd13be357-93c43d15123mr300091985a.44.1790324082736;
        Fri, 25 Sep 2026 01:14:42 -0700 (PDT)
X-Received: by 2002:a05:620a:460e:b0:939:922b:3de1 with SMTP id af79cd13be357-93c43d15123mr300089385a.44.1790324082288;
        Fri, 25 Sep 2026 01:14:42 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:bde1:52f9:d7f0:c581])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe667ae2fsm127647365e9.13.2026.09.25.01.14.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 01:14:41 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Andy Shevchenko <andy@kernel.org>,
        Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH] gpio: wcove: use regmap_assign_bits() for conditional set/clear
Date: Fri, 25 Sep 2026 10:14:38 +0200
Message-ID: <179032407610.10527.4008737984510756760.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260924083512.461838-1-peng.fan@oss.nxp.com>
References: <20260924083512.461838-1-peng.fan@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=TptzFzXh c=1 sm=1 tr=0 ts=6ab62d73 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=brAkMm5aftp64Q7YyQIA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDAzMiBTYWx0ZWRfX+wpuZhTfrGmj
 K7Jpyc8V4jPonFIYg6vpLigl91UAgEWXoASPhSSBHgOB+u/vg+Hsqm1GROttk5/RLUfwwVoSOOD
 1Bn5RBM78c7BpiUe3b2PwPkznp5RQ5nVrM9eCVjzDJ4RgGomodAlbKvAExHZYg28Qvd6UmiSWuB
 wfRrDOsztchqxlcQ4PwiHBJ9WkHO2YNIOhUoR/ATyYahXl9XX32iGj7lS3K3e4WbyrCzsAJhBPw
 noMlwEoams5pB+EMgUM/d0wD2bkM4sMWiOw3kJOR3Slpe7FHhHIAlw0UyEPs6hhkbBq/vFgNlSo
 Ytj3aElyqDYNV7RgT4Xr/u5Jkx87WxdJovIb3I1poWOOLzo4rw3XJ8Stw6tQmnDZq4866UE4f8Z
 QG7tI8qMb0TsrMy1taLfgdcaE5p5jaBSvVwA5ZbMZhF6Ius3sIVgRjtLm4BT4cJYqZgDXZ/6xgu
 AouFYSAhTOrrHVyo8vA==
X-Proofpoint-ORIG-GUID: WZ_GND0Lh3DeQRPwFW2G-fD0Wav5NUZv
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDAzMiBTYWx0ZWRfX2iRe6Rlb8vIb
 2T5egFWqewJ/XStRThr/gb9WBBgLfU4y/4tIq/LizTSEk+a1yUjeLTdwPc+qXN/duirlrSp8/VT
 xxqi4WwqqovOEMm33vHmsOdW0qZV44Y=
X-Proofpoint-GUID: WZ_GND0Lh3DeQRPwFW2G-fD0Wav5NUZv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250032


On Thu, 24 Sep 2026 16:35:11 +0800, Peng Fan (OSS) wrote:
> Replace if/else block using regmap_set_bits()/regmap_clear_bits() with
> the simpler regmap_assign_bits() call.
> 
> 

Applied, thanks!

[1/1] gpio: wcove: use regmap_assign_bits() for conditional set/clear
      https://git.kernel.org/brgl/c/428cb7603f95d0ee6fad06cbf56321b1bdeaaa85

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
