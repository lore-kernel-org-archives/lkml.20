Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 707048635D
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 00:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790985791; cv=none; b=MkVh5nEPklm4ElcXR0fQPO/BEl8jFpiVYhU9H/qTTWokOAhIYjKrynMyS7KAC8YgtZpN+s3+QMfrXTS3Y+t0Ffrjt5iU/hhVyZ/cFnzdAzJ0AX/3mh34F+Oo7bVzTsENHMA7zh570xWpnjykTKNorglexzf1ssQ5Q8PXvpPL56k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790985791; c=relaxed/simple;
	bh=2l3PQo2eShkqZe/3T8M+sGU7B8FyT9nkOEpNVRVu5Rw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UYedZjzb2hwF2Xv8LhnFxUDnbwN/My3XS47zcxtMGXMVsD0GWQ07zZFIdiekbGEToxyukrCfO+ZoNCqUJs2w35IcyNpJSdzYGt1m93V/U9nh+EnI6vtifYyyeiqaDava1eZhFeRkjoRN2hvWi/ie96i8AVx+s5E3DXC1sLk6olA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C0K4rj7c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WUI29wcD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C0K4rj7c";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WUI29wcD"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692NeSMY2943461
	for <linux-kernel@vger.kernel.org>; Sat, 3 Oct 2026 00:03:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VyK0jJ9gcM0BdaaalrnnAAq4uZXo0yp3EptmyJF9IeI=; b=C0K4rj7c3yk/9m0Q
	whwlBeuvYuxmwuFzLoQ/RXDn11nrKRD1xQF7sJeUKNcDWOoAKAL9idWqa9SO+4gJ
	Q8N155BX1leEVofxidc255HePNPtCoQ6mPDJBTTHH/9wPa2qYKHtaX50xPpwH7Mn
	mYtarRolXaXkAMeL4wdNwXVVXH719+dlgc2GHbliJt3NfaeJmH65vU0FswIzYQcC
	q3hBfnL0E5lN7iG0ExBdyoPKpTAWtVEId08nTTyLYIpI6nEn4aGjuVoODSaz0Ehk
	e+3YAwQV7etggW+Xc6XFO4XsibMutoreivwFdZHp9+moivMyS05IewJJCMaUcJ1B
	lie3uA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2h4ksbsd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 00:03:08 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cc5f70c8dso10291985a.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 17:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790985787; x=1791590587; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VyK0jJ9gcM0BdaaalrnnAAq4uZXo0yp3EptmyJF9IeI=;
        b=WUI29wcDJ31PCwyaXcwEsjSVpeyCsy4yML5pj4t8tYV8hVeMHGvBuDGIpyG6njAzO3
         DgPian6L2cS9C2mRm8pg8xZeUcFcEEAV+vJzkICN8BHTeWxik8f31v1K60rJer2xSSsh
         41T9pXZfCW7JNW/J4Qy3w/cIa9e6iZ/QUqTsWXBGZb6qY38Jaz3HWTP6QAVE+VWKR5dF
         TAkr6ykTaYFL2+JSPARZGtth5+9yxVEnScmqoPT4TJ9Sgd0nywxGzy2lVQtMwYRnlMWj
         SDSTM6xVQ6qT+44sZ+Ji4vOeWhz3/9c/0+T9lBlSnXBFtl3cop7dnHVKpeVDR8O6HBj6
         R9BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790985787; x=1791590587;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VyK0jJ9gcM0BdaaalrnnAAq4uZXo0yp3EptmyJF9IeI=;
        b=B+gGC370vQDu18cxBzURwP/Z3HyAa2R7aBCKHoCoZ+lURByI3kjc2EIXEdhphGmdzJ
         88TdYOPDGfrAZaAjq8LUn6/ojX8xYVi/Q6NukL84O7W2vg0c2H6/McLk31mKJnsXHA4z
         kduX1+an4BW7tBAOqUli3npk5Ghp4b5OHrOvOsDBxmYyjp1DrcN63sQid1wo+C5JI2+1
         Ezlbrn43usoVlJE4JNil8XXXCcKrAnOrGAof7b1i/b89RD0v+uP8NFv7WQy0y5R+qOiq
         +vOEF6Hywz2dyefUQCpQq7EVgm5ABdax+HHOL5zbcsrQ0h96l7feDnh/0L/FMiaZ49VP
         Lc/Q==
X-Forwarded-Encrypted: i=1; AKwUvBzQFJlY4vNDqjDHwgVhAHcbFKBaDPyf8THqCibSmaFdnYQ5uj6LydxnsxGn+0BtEPnIaNf1xGactLB3gGY=@vger.kernel.org
X-Gm-Message-State: AFuF++kVntkelZMs+TqRGhucLnw2rxQsgMl7LhrKgCGhTCZyRpDpZZZP
	yQgQti0jGMDzE+Z/syocyNwdcdghrQRE1vZ8UOhIXgwQNsnjsLFBrYQj8hmAAWdk2We9VvX1xNn
	nHT6xeZZudmtyj4ojdBk1BQpoy0M4RSNzvvFBDza4L7kJ8pd7e0EelGDpv6LkcHK2pmU=
X-Gm-Gg: AYBFou15Lxe2t2ycWWDG/H5GynkEuht7me1XOOx+QHubbxV2ouDzUNcAOOvkx9urTbP
	6TRwL/MKyR3Xqj3hw1ahVBWEOvbGVOknnvchNPkMcDQqBVuaiorN5GQDr049yrq0FK3DWPJ6J1u
	SXTyT1C412LwNKh6T4+g2UUAxw61VrWRULpgZUAnagp/r94xzw9eqaRQGGF9xb9sBpbAJ3EeRUR
	8gHnoqIgzVub+Ef6gtTaq5ZK1zJAv47gS2pQJIK7ifp1YvHXRtcHqZ8T10mk7heFSI+2R85mk41
	6EfgEIWW116ObflNvdcenAPdGKKnSUsZnOB15FD5YTtwh5iseBmxUy9f243CpCgY+7kSLZ0jPLH
	2cnTUWz3FTpnyKPuEcENNFF/J+C9FbKRP1qLl/QP37q7GAUO6HbJ+0+tAK+PTS95SNxkYhi1zqy
	WOdDuCd/7YKxMh
X-Received: by 2002:a05:620a:459e:b0:93c:ba88:cd65 with SMTP id af79cd13be357-93e50e4a8e1mr195370685a.7.1790985787341;
        Fri, 02 Oct 2026 17:03:07 -0700 (PDT)
X-Received: by 2002:a05:620a:459e:b0:93c:ba88:cd65 with SMTP id af79cd13be357-93e50e4a8e1mr195363585a.7.1790985786772;
        Fri, 02 Oct 2026 17:03:06 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a87e2f7b4esm14234531fa.14.2026.10.02.17.03.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 17:03:05 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 03 Oct 2026 03:03:01 +0300
Subject: [PATCH 3/5] drm/msm/dpu: assign the mixers to the CTLs per
 interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261003-dpu-quad-pipe-fixed-v1-3-6a6a00917b71@oss.qualcomm.com>
References: <20261003-dpu-quad-pipe-fixed-v1-0-6a6a00917b71@oss.qualcomm.com>
In-Reply-To: <20261003-dpu-quad-pipe-fixed-v1-0-6a6a00917b71@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Jun Nie <jun.nie@linaro.org>, David Airlie <airlied@gmail.com>,
        Simona Vetter <simona@ffwll.ch>,
        Vinod Polimera <quic_vpolimer@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1494;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=2l3PQo2eShkqZe/3T8M+sGU7B8FyT9nkOEpNVRVu5Rw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqwEY079w/wHb9RhpVVW3RfbfHnFHNQ0fcCjDPp
 NDk9k1ceW6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCasBGNAAKCRCLPIo+Aiko
 1bE+B/9e/2Lri4CStNavGIBcLvzw6LYy9zVBZyF5O4q+8tnrC2FoTEYB4CmQv5h4gZrQK0I5Dn6
 zNHsXOHnAxSqsgZYBIyVsOQNfeWUMq2p4fWq10Pjr+hxbo9DpK8UKJYNMLoKDpoDIkvb6FTUz/H
 91gQj1maMQq6c72dd8LLsGE17SebG2MxoGfj+vaGswvZietDNyEhBLs+9I6ksMVwaWoEHduGR5f
 +Rr6M7wIvW5xV3CoU9P9OOhqp+jqSuxCojQwlNPnJsIcDg37qOCLznOUaEXgZl7aUBh7bMHPB4j
 BSDmdy59NIdTsZcplZkrUtbJ4Z3j4W+PwKw1L+YbTYoJundB
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=G46JgNk5 c=1 sm=1 tr=0 ts=6ac0463c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=vcdmnXjnQzLUmDnc4OUA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: j1uvEKG8e7_ilfb4J7Iy5LzOM2t85cSF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA5NSBTYWx0ZWRfX5gFcryTQfGEE
 QxmCzxGo9dgP8P7B7srJE/CBkee5cUf7sp4nUGn7xzpemWwqp4RqV0Yj08K0ydKiIRnHH4Ng+w6
 ynVXufc/FBFMYP6AuistidYJzKXchAlUwj6lcywLuWs0HAkNFNE98SyWt23inPQxt+wUgg+i8eW
 m0XNlo/5A57fmIEOEI/Azg/ZaB0ZMnMA9anD0BEKF6xnbR+iH7pv7veZAl70a04CY+N5yXYEM7d
 L5STbxAnm+6KHL/NjmkxACjp85oMLom5kZ/U40bPBQlmQSj6rThU3majkkzbSuTFrwreWCsrmg8
 sD7DamxpPi2IkZ9fuL4rjRX2SyRdkBwy8mkui7kXxGxJeTUWFwv6rn0R+EyLKCHIUitparS8hm7
 pc3d3F90nhB2iAQdsrm2uTQpQuELTsvELUDtWEtUmQm1KmKm3o2HiPfrWeUNnoMLnzxuwhKysDa
 RffodEi41lHiRrHEgGw==
X-Proofpoint-GUID: j1uvEKG8e7_ilfb4J7Iy5LzOM2t85cSF
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA5NSBTYWx0ZWRfX+4IR1wx/ypvJ
 Sa8F6hkY2o41UI2wVK6DjP7zvgYj2E10b1x+TL0a04iLhoI8tAcg4qpqcfWea/wTctf2FGNg1lc
 P+vzS8fa9D4R/NKTqFG3nq86RW0yAGg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_07,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 adultscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020095

On DPU < 5.0 each interface is driven by its own CTL, which has to
control all the mixers feeding that interface. However
dpu_crtc_assign_resources() gives a single mixer to each of the CTLs
but the last one, which gets all the remaining mixers. This works while
there is at most one mixer per interface, but it breaks with four mixers
driving two interfaces: the first CTL would get LM_0 only, while LM_1
would be programmed through the CTL of the second interface together
with LM_2 and LM_5, leaving the first interface with a half of its
picture.

Split the mixers evenly, so that each CTL gets the mixers of its
interface. Nothing changes for the existing topologies.

Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 828187f46eae..57f50a3cd9cf 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1469,7 +1469,7 @@ static int dpu_crtc_assign_resources(struct drm_crtc *crtc,
 						 ARRAY_SIZE(hw_dspp));
 
 	for (i = 0; i < num_lm; i++) {
-		int ctl_idx = (i < num_ctl) ? i : (num_ctl-1);
+		int ctl_idx = i * num_ctl / num_lm;
 
 		cstate->mixers[i].hw_lm = to_dpu_hw_mixer(hw_lm[i]);
 		cstate->mixers[i].lm_ctl = to_dpu_hw_ctl(hw_ctl[ctl_idx]);

-- 
2.47.3

