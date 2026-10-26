Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793007987;
	b=vsH3DJxT1Hp8Hk6+0zHGAN8oQV6eKAM9O33r9U1pr8uKjTzakr/4NP608CumJUwf7X1b
	 uiZNgxl3XcGkizsVHaEI4YtHS0k4gbaruEPT2tVTlDd7GPlKpLhjQ5G7WHsZzOs8BxG2f
	 LSPm05ocfkwBC3Yp1Bm6RibFQukuHKKuyCPytTHnK8y+yx9XKRr5Gn3Y9ApTQvn9UeX6j
	 R06YkX4pj6ejZmJw888bsREHqkTKbImcyiBKAPKLUWdM1zOAmTaqQCeelPZNa4ORx1XSQ
	 niPNJVS2v+Zc4YIliom4WxNQpjj71Tb7GkgqfC/oihQYTRM9AuHFjdUT46pTBoHJvcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793007987;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=5FaPGddv3jsTPg6XlTe9zmDBqKOfwv/g4KIMTTWQao8=;
	b=NF2Yg8xinCDQxQWlRqBlc9b0iJtbUD6RZ7nBGLEPwuB4bBZDPiBtUH7K4SkohaWarhl/
	 DmrxE5J/VehDcrbVO2wrdBTNMdVRoo81+hmN1dniV9FoVzaJEN3wz9MYNunGW+qMGVANm
	 hEWGg2pRKJXxL2CT95YhgEgbzEQZK1yOuK6egWlSRSYK32O95xGB/lkqg8g+cfjIu7pGa
	 w+vOqMHpha8ByqZVPj+1D3DmMO3Fkfm8dPnndgcCMBkh6wOpmLLPtrISpbyHwTjI2Zgw5
	 h8Li/xMcDkFuQAIf/ePVFYUFgkhZhy9bfsJnlu6UtsFUvEvAlOILwXeDnSPQ+U+p3gg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NxyqMdmK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kc7paIkW;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 234C0606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:46:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 234C0606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NxyqMdmK;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kc7paIkW
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4aui42255188
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:46:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5FaPGddv3jsTPg6XlTe9zmDBqKOfwv/g4KIMTTWQao8=; b=NxyqMdmKoVvfLMeO
	s40Z+fdjqNzuH4HzMnn20HG0ND+xaBGNFrCcuouUvBGONCTVF41j+iPQgVk4k5ni
	5gni8uuNjA9QSJJKKacl1iHxQXdebwkrcxMuMHfGjOlfMvKlAsPK2WpYclqnv/Rq
	6akED298mhKi16QeS5bvtYd77+kY5gz5AuS0sZMXNXLTWa8fYdLZAej3tePbOYuS
	hgPyRE/iVSaNR9q7gpD6GkQRBlkz+Y0/ziLvRAS54Hz0QlnIFgxZFTbCggD1B+D2
	MpzEldAro2OZjDceWlLYrvHOqz4xfW+kxDI4NesTf1/5/PpznIJEOXVmbFV70xtu
	za0lrg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgmw3nqy9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:46:25 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-53657d237ddso3463841cf.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 02:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793007985; x=1793612785; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5FaPGddv3jsTPg6XlTe9zmDBqKOfwv/g4KIMTTWQao8=;
        b=kc7paIkWru6+SlgKA2gVTR2i+E8Bu/eWnbOxfx0GitogLeF7CrOYYM8bO5tDZ8+7o4
         dXTjszSzMlAXqA+pPzwheKNtZiZ4Rx5+ODpmogKVcxa4TQOjC8PmP+lHIS6HYwAa6sHa
         ePGqnewBbc2bUn8EG2GtzI9av5HUGQGZk7QqOw5LAmBnulXugcLs9cxllA55v4SZb1Qj
         AzT56y/GeC83wgrceAGxFfGdh5RfEqCVj6F55EF2MOJ7obNLzVlh7VmI3Fe7GNAcmmnn
         6Xf5NZfsIqj0j2n9ajsUH0MOEwYtxiSOJ/rUFUfPN5uf8IzpIcxmZIoXAUt2wZ3IIhpg
         uQJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793007985; x=1793612785;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5FaPGddv3jsTPg6XlTe9zmDBqKOfwv/g4KIMTTWQao8=;
        b=NNwTZ3bqGo5fwd0rRbPFVIn530QPL3ZPGBM+oyQs3TtSkilYNTmigWIqGmxtmYCJcy
         JtfBWp26Ckmdj/eSVf/sbjpUfrDP/+RU79HGVs4Qsia7qrQ/vrxm3wokheGRTP4cdNTF
         0cmw0a6VuVqk84Lw6kvVurVA4am7U5h9+YMO8CWjV14Sf5HpM3AXfj1tWQlkTUkgRrgD
         x6DjG/yJ/uA+RhrEqw6KxeG6LjPwCabG2+CzOdYofK/HPHoR2u5+V/AST4dkHYQn0qUU
         nUFkikPF+EKDBR6TpykBWHVdYnqONWy/2ylFUFHf0j2JMevOSwiXWLIKzlRrw3yLYsbl
         FRiA==
X-Forwarded-Encrypted: i=1; AKwUvByLnGZNFDJRKzy8vJvFmqSHnd0QcK1TuScXyXMvOMXjNmwj/LI2FGu8oqlt55pwT9YZWVRHxchSP3wrmFk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLdUg15gRH1qP+Ivk5dOgh3q3+AcBWtKUwjsUzcWdaTVneVF71V
	3bIh1LZWZzF52AlYgfl6DSi62Nbl6oyATfhO7Su2S+vBDIXGWyrs+h+xl3R27WhIia9yabyy7tO
	+rPyErzdcdVVt6vgZ+4qh2UPma5hs0B3Sg+zoy00x/k/vLKicM9iQm+xc7u+za5YnTkI=
X-Gm-Gg: AYBFou1rDS/JvkJZqNtZmzvP7ITYE5Z592Q8hnHCg/pOMoqwQ6+t7b3i1oheOlcs7Xg
	9h7j7rh94k/EKH58jcW+9n8MLAYymDPOGzdVaN4dmdUq3O/cA4IxSn1yfHV4hVSeObHIxZiaCDQ
	WNeoFCzWIf7J+Do8d5a3Y/j+bEHO+QtGXXWhX7jR1QOQdYBjCx3ocybFKgZ27Uii60egOH8UIx9
	EpeX4EH3CbPNbu/WUlapVb1WLPbM14C3UMNateETVjRtRpDxkczJYcuXK0PzUI84Cp08VO20UvP
	OgjLehFgGVW6RY1vXNqsdfi8vrLyMa/YOllcpe3/hTPU7vc9Ib3Ln6LGetTe6pQJNCcPAzk4NtL
	TcqnPPBC+SLX1eZufrnA14w==
X-Received: by 2002:a05:620a:57d1:b0:93f:25c7:a4e7 with SMTP id af79cd13be357-940ef915dc2mr1132234285a.4.1793007985003;
        Mon, 26 Oct 2026 02:46:25 -0700 (PDT)
X-Received: by 2002:a05:620a:57d1:b0:93f:25c7:a4e7 with SMTP id af79cd13be357-940ef915dc2mr1132230885a.4.1793007984572;
        Mon, 26 Oct 2026 02:46:24 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd650118sm301524966b.49.2026.10.26.02.46.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 02:46:23 -0700 (PDT)
Message-ID: <269610c6-5ace-4faf-aa44-6074074e0cb6@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 10:46:20 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] drm/msm/a6xx: Check BX dependency vote index
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Luben Tuikov <ltuikov89@gmail.com>,
        Antonino Maniscalco <antomani103@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org, kernel test robot <lkp@intel.com>
References: <20261024-assorted-fixes-oct-v1-0-2977f974ddb7@oss.qualcomm.com>
 <20261024-assorted-fixes-oct-v1-1-2977f974ddb7@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261024-assorted-fixes-oct-v1-1-2977f974ddb7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 9Q-T902jkw94xD7G7_pStpGb0IfpowAy
X-Proofpoint-ORIG-GUID: 9Q-T902jkw94xD7G7_pStpGb0IfpowAy
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAzOCBTYWx0ZWRfX62kZftR+hBXZ
 j+q0c/q2IKE10lhztV/BUsjtlapK/0SVXLLaHcd6pg/taaMGklx0M0gpO+atdXKAjIy38LFiMGh
 1mYCS7VbeIIC+SB2Koc9Hg5FgO2JBQA=
X-Authority-Analysis: v=2.4 cv=HqHjiETS c=1 sm=1 tr=0 ts=6adf2172 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=kjaib4mTrQJa5ucwwGQA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAzOCBTYWx0ZWRfX3QaDHbI+STeG
 kDNiIL9srXjMb2mTgiaX82SDTzOOabeyaBaCK35hvBl67gAAMtNHMCXfm/pvA3sNii5C9o5yltk
 CgqWXMPzTUzS3lggitOR6JtgJTUlhGw64HqdQ9jni1IdpMxMvgNDrrdtxp0TA3ZcCUybWj4Eo2S
 LKJpTyb4GMGU8kACV2WkLRDF+SQUlAvnNfnV7bXnEQ+c5H+zfPF4uE1dTZVlhESqtjtdY0rzFyM
 vOkUeW2jb3vnM7arVZVdZ2wozE0fzXWlTjxD2iy5ByWRQmdoS/PiZN9xCbe80gzfnzrhECY3zSG
 jOL81frEK9x0IvBEPtUfQRnM+zM4mKaCbnlGiC9PAT0dz5GgK+4QDENZRY20CvuoTQTBmeBAd2i
 rX9ACQ6y9NMK4jJzE82AuWuhNv8zhyeawF977r22Hiik3JN3HyBErQFigaWneD7YpapA+MfTN4C
 MiP02LllKexeLKsREAg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260038

On 10/24/26 12:30 PM, Akhil P Oommen wrote:
> a6xx_gmu_rpmh_arc_index() returns a signed error value. Check the result
> before passing it to FIELD_MODIFY(), which rejects a compiler-propagated
> negative value as too large for the field.
> 
> Fixes: 020b8eaa1db8 ("drm/msm/a6xx: Add BX rail support to GMU dependency votes")
> Cc: stable@vger.kernel.org
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202610070334.bYvBJSpj-lkp@intel.com/
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
