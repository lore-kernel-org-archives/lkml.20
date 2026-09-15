Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C1C3480342
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 12:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789476553; cv=none; b=PS3D6DnJHYWyw2DlhMM1hvImQ2+mmFrRIy66eXriSJlsZoajq2/BM1pXLsdiFRH8f97IdJ1j1FUrb7Wug87f/rN2Tmc6aBxhn9inYtCTYdZ0ohiYBUrEd18D88PehusuHJFTk2TNWV9Wu0ejzU8WoSYa/yBXYgc1iTCQEy3zaRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789476553; c=relaxed/simple;
	bh=fIAisb9Ef8EnJfagA8Uwkzg8Nx6okL33AKeNqRsgj74=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uWYPS3nKvYzXSRso00LuoqU5aebmmfG3OcFE+ZAYsP1I2tqwHeWyZPS4AWiF2Bf9L8jsX+dL1ALHx0hSb0UrZHMYPSvIh4Pkkeq2hevQ60OqWIFlCGTCxFajGX2U0Wfh+FDWKz9C/lvuMXqt/obQAQv3IdbKnQRnY50z2TscDL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dM2mj3XX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fNjeRs7M; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dM2mj3XX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fNjeRs7M"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F9hJEs2674980
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 12:49:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=aYjUtVfkuu2mjvRNXERbcbQF
	PHzdPQHxPaUZ5w86/OI=; b=dM2mj3XXB+VhBTSco4W/wKBQPZz0Ejk2nFaPvRMU
	6YpPkDoGCuC+1+9OwO0j6Rx6A1vR4RraCVgm0nFTDfiVus4bLow+ol51GJX4rkmv
	7UgpHLbGaUSH5dZj6bI9G5haDD5pjz26xEJh2eWOPcy0YzfIYIjJdExH1MtNmqoL
	nQBdl0L18pX7TqrV62OBIXbZUQ8aYEAvcwcd5d+Hq6q4ukxA2h+VPiX9x4rkNEJ8
	XCNBL/jHJCNfIJGi0ezUPe1Lwzz7QmmpKF8Bc+pQzJBSsuW9/G9HKzo6XU+xKTtL
	h+gXCXFGIy+odZ9HvUGhMdnXgoCAC6jTS62mcFSTlEZAig==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpye71w3y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 12:49:11 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-939f925ba4eso840682185a.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 05:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789476550; x=1790081350; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aYjUtVfkuu2mjvRNXERbcbQFPHzdPQHxPaUZ5w86/OI=;
        b=fNjeRs7MULEQwbCD4p2j7ZfWO5orxt6pdMVwawJ6HTsfDXLl3pfQOiHIkynYG/noD6
         X2DpO/79ya9KuSyqNtoSkygx1Svf6P2Z1+xzotBY0EXWzrhYlumDcsgjSPm0AGn12wyT
         /j6aO0TG8CMWJJgGhzec3c+1gj0zdxIP4ie9pw2egUf9k39TKdXX4FaTIpZrB2B9Sz7q
         UobiftL1/YWMekwF9Mql1XzXkeV1P9oyyCjnqQGDq5mIkWLOvAi+YrItb88wCK71u6fA
         D32tpuSQPl8RgGhG6YKgxqwaAnBLZuRlq3r7Q30WDcPcai9Lvj9of2zAciVwLxrb7NQq
         J2Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789476550; x=1790081350;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aYjUtVfkuu2mjvRNXERbcbQFPHzdPQHxPaUZ5w86/OI=;
        b=MDk+XxOx3u+qDgS8ez+ckvNue4o39YChqmVBFsok/9RkfV0cq4EzNuOb2mZvK/5Sdu
         iDLGrxGsg+TJAmcxqNyQ8xI3u0hygkwY1CLywO99SikySYxg2vwGZJOzMzFduqvBLvPV
         7RTJ/O8T2zlT0YL/U8hM9yql3VH5ZUp5IZiUjPC2FB1NlLnTBBC97W7KLHZTSUcRdGMD
         wSTDSxjR1WCEucRbEHwF4DnXrmF72V2G0cRrYGD8b3KuEQbKB7+i6zdiw5i31IK2tg+K
         pzCdcko3HPVUS9gkuoaGdYzH3V+UdMrzIJDlCYP0tP4nkVoLw13wBHbIHevGUFp83kwo
         Jpxg==
X-Forwarded-Encrypted: i=1; AKwUvByCO/GJPLx+yoLiJrWPtC01uC0ChoXmMMOYPoGXoGU8rwCybWQ6rCjmiui57SgULMkTbkXU+rhhO1a0Awk=@vger.kernel.org
X-Gm-Message-State: AFuF++nBFlfkFwqlZiz6ntpXM6iJT1BWRTsUtYoY2XhhSPt3y2Q+0hg4
	10QmZLp6uTjyxllsu2IIxxP1FwE9jK9FzwGP6aXn0So5LnbMitap/2/BK/yjR/glMK/tlZ9TtHn
	u8gzBUa4+6VmulO1BBHoyvb3xhmPeax9vwwOGVcvtdOCiyvXgc8oc2HSzQWhJPi1X9bQ=
X-Gm-Gg: AYBFou0L0zl4N4i1XF6PWoLUEoR9+isbvKkT3Hf0rR/MsiG7VOfRgUcXj6akNyx3pg+
	2HfVHqkwFqCNATLgBSHMcylwze464uMLiLYqRnVCNXf0AXZ2wknb0Ry83rJQsaWapKu82nwQ+e2
	S2eFoTsM3q6OvdL6SVzYwK+XLwMsCPiwMM0YDUEHT2X8zZc9EKPRcB6+eKlyNLwaBPw9lft4Qx+
	opy6XrLPq18U0IVvbVEBz5vOJdfyV6uhbtl8wobVn1FfMHz8/nhSdJJIX4zt/jEDrlc9KXd8XtC
	4+CbwqfexVPGnfVKgciZpcVBcsqODXacy+rnSIfQN7KsXoWow8UvU82SkijokglHSDkLWaSKSda
	estIMDzfptlrYqg==
X-Received: by 2002:a05:620a:4886:b0:93a:21d3:f4c6 with SMTP id af79cd13be357-93a299f5cd4mr1017777585a.25.1789476550261;
        Tue, 15 Sep 2026 05:49:10 -0700 (PDT)
X-Received: by 2002:a05:620a:4886:b0:93a:21d3:f4c6 with SMTP id af79cd13be357-93a299f5cd4mr1017772485a.25.1789476549687;
        Tue, 15 Sep 2026 05:49:09 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7ef28e6asm59986355e9.1.2026.09.15.05.49.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 05:49:08 -0700 (PDT)
Date: Tue, 15 Sep 2026 15:49:06 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>
Cc: Mostafa Saleh <smostafa@google.com>, Marc Zyngier <maz@kernel.org>,
        Thorsten Leemhuis <regressions@leemhuis.info>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Revert "interconnect: qcom: x1e80100: enable QoS
 configuration"
Message-ID: <2vvtep7kqrdgbtj4hgogvbnpmfl6m3zxciqju5igo5csz4sphf@kmou5iidw7wx>
References: <20260915-icc-qcom-x1e80100-revert-qos-enabling-v1-1-cc4ba943bd9d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915-icc-qcom-x1e80100-revert-qos-enabling-v1-1-cc4ba943bd9d@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDE4NiBTYWx0ZWRfX/2Jap+Pz4uHc
 OTCjZ3jLpaY/n4X7CV3EWt+igvIlAGCsg4DMEmRlPnNTwk5pl+xGYW3QrzO+gIQanJQBTBvrPeQ
 PS/npYQDPhH54fuxXZsnwgr8Pex+9UpLeMpjkSe9nKPKrVVaisJzN/2HoJ3N1O/VAWM5uMdIfME
 HdjSFlnLwL7Li+MgASYAgO9eqYwAng7LVlBYj29SiLiKG2ntjZNgMtCMU3C5BzPIvvYSjrXq+HO
 HbexGO568FcUUKkFe5mQSSyp9NuYB6wz7Gu3BmcbMhX6koghghiCg/iT160o3bUxpG+Cx4bW5tC
 bXm/c64hG4tf9dyORS3g/d4ES7OQTb9NiqknFyYtVOsHN9tvC4waUhLFwV54YY2Fd+Ty2g7QJc8
 RZM+mtZrVY+SUH2be4G9TdMlL/HrnhqH9gDc4a8bhFZaNVyXH0QR+j1lxsy8iNHWGDUpmualyc4
 FQBHZFrWW+SbkgEq+RA==
X-Proofpoint-GUID: O6MXG_oo7gZ-BgpAp7eHrIlHfi6uhaDz
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDE4NiBTYWx0ZWRfX8zD3kkdKqs7w
 hJ7KnltrMZqwSSWC3/hsFCyXTJL2tWNivYzyz8OkPGKFUdJbdksq02PMTi8mpbvDkvXu3XMPv8+
 JwNAtsmmhcpQEVmpNwWVYNZGJuzqqVw=
X-Authority-Analysis: v=2.4 cv=fck4WEQF c=1 sm=1 tr=0 ts=6aa93ec7 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=1XWaLZrsAAAA:8 a=EUspDBNiAAAA:8 a=lUHfYzHv343R4ZC3hUsA:9
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: O6MXG_oo7gZ-BgpAp7eHrIlHfi6uhaDz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_03,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 malwarescore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150186

On 26-09-15 15:44:50, Abel Vesa wrote:
> This reverts commit 5a8b2cc36e796d595c9d97eab23c2be22805cc1c.
> 
> Some Hamoa- and Purwa-based machines fail to boot after this change.
> Attempts to resolve the issue have not been successful, so revert the
> change for now.
> 
> Reported-by: Mostafa Saleh <smostafa@google.com>
> Link: https://lore.kernel.org/all/apgeBNSiP01YfNcs@google.com/
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

To be ignored.

Marc already sent one here:
https://lore.kernel.org/all/20260915123703.3228329-1-maz@kernel.org/
