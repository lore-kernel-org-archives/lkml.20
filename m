Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1B2C37D104
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791812273; cv=none; b=oies5pjbH/DOoVKwCooFU5LtM0RYoQcrNQpeg6rYeTqkoyytWyVcv3qrNV8m6gk7DeaHVveur/k01bXpdkdN7tfgz7XUfhk+s7qstTNBJ3Bc0/ilHvM7MMb5FiRHcpHpPJ9BE+ZDypVSBtfuzVoBGO9oMeNawVWDvK7QwMlCqI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791812273; c=relaxed/simple;
	bh=4tlOWCy5qPIRySIx5ICyqI8Z5eowUZ/DrUmWxSIAI8k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=j1mlCuN0RSyLPI2/0JAyzyQ4+A/wKQd+23Tr2IfjdRZo9Ll1NEwwF8Elc2ydSVcOSFurYbcyvmc6X8YgT/lEpJiGd1kt2g92kTD4J2SkCDg/c8xwoJiaL3IUeQ2PHTNfIzy9PR+VGNrW8/En0E9CW0N6xuOjDwjSvPn11LddzzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U/57StNF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dFQjtk/V; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U/57StNF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dFQjtk/V"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC02IK2786075
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:37:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SLklFSdnxDuuGgUPL97bJE7eAmuRyO8OXzta6tgm7mA=; b=U/57StNFWwm0hJDH
	N8BI63sXFdmiDyY1ePtJLnISFaaNQG3FH2RKeJ/iinLGAjPBUy4stddeagzZqQvg
	1MG+Wfj/F0v5jW1/jhtoCJ0zbiik3bBQebCWS7atJi/+PZV9DFlMH6miHMDX6ZmZ
	3qrxpJGTgGxxuX4Js9JjaTcxqrNjzVJEybvGHG863A4RvPjlpsCCWM/k+CuO/iMq
	KPwGI/iW2X3HOUxfXNXrAWfHqS9tqRMOXDhqxING6BQPW74lxPdN0lTDx79NbQxG
	8Zt4nexpPZS5gP/JuWLctbPeMXqxca6wz3helzPr7yE8iFttGp7yuDcdvhuEoH8L
	j+MZnQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8wffgwv0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:37:50 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93dea1b6c89so378444885a.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 06:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791812270; x=1792417070; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SLklFSdnxDuuGgUPL97bJE7eAmuRyO8OXzta6tgm7mA=;
        b=dFQjtk/VPY/CXwXJ7m19Q5g7Iv3lUVlAx6fSWxCaLl+88ynd4y33z/VMWEuLQpxvLa
         NZiTfHNKUfL0RgCaPcmQArcuyzrlod7DrDhqftIcYT7WlFJkVif8c2n1ISIznjPOjLBH
         5r2q9NUS7XXwux6FuEyncudZCe/tejKMnJdHN/rgTcSO6lnv6kMys3n6BzoGoIyKhAJN
         Um30vZUHVKXyibOY5cl1KK0PXDlytWw6VngCT7DJ3F5RZV9S7I3sIlSVvBk9sLc5sfm3
         UPNEyADRvyVrqDcpnIbNjTPJDxSjPDEzmb4MvJU7WJafo668VbX++4Zwoj5/sS9VPNEV
         USXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791812270; x=1792417070;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SLklFSdnxDuuGgUPL97bJE7eAmuRyO8OXzta6tgm7mA=;
        b=qqFXBYqd2kf+fzJ9Z06+USq6f9u/w1bo+CumTrsxLR1JQhXTs7Bhdr8rIs/A35mR+D
         PgJ7k3TalG7wvMoo8agkcA3oWRSbXHgOOStg/SXpXYv7gXnLKR4oDnOIkExt2LTl9rEk
         lBa6NWPL+A6F83XEeQdUWui2ixx/KPnp/O0wtUZanCBXBKGl+WDn99eO3VMo3g7IKnqL
         DiiufVf65ozUmJ72cfzFU/EASpt0/BLZRQBXj7YiuW2DQeNpNzgy5Mq6o/o9GXiqlFym
         15dRYIw7KWyMN8Mlh19AYwhoQcdFys66633NWvjkofDEqwze8jkvpVT0k9/FC6Jr2tXs
         /pcw==
X-Forwarded-Encrypted: i=1; AKwUvByO5JToSPN7lbwftHLa6gxdCt8HFVSQ4wR69ODor+yD6yKW0qf8Hxf6Uq7tco4sPasvPah0bRsrbbntqT4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKXg37xhww0z762S9+nyMlaKZVmmKMaSQKlYywR+SePWrfVFVhv
	wOc1VGs9v2wyiDonCKrTJ78UqnapCnS95hWwsxqV21TWPIhlYt82AW2eZh6ZNV7ZxxJhaJqX1C5
	EyO372BxNhZLO3zZ3z8rLDJ6ITYDsOTOOyxsxMG39AED+RO/cl3XFFqg78pkbzX4eU2XINumJav
	Y=
X-Gm-Gg: AYBFou1AHlvNfx9HAnYrKwk1E1Hl6PD5SIDP+L/kl//Q2P/mjkYeSscnYkIRmdChRZg
	NOMJ8mU3l8gVD4taqTuGJumyOnyPMR+jeZwJC+ylxt0ljtAyJRgjhRgkK31Bf9bBCSm01ntAFZL
	0W4/ZeLJzVILenDihac75xw84AAi7/F+E767Uw/tgIoJycwrJTCOPF9Nh3Uhf+YdfG46UgaZbW3
	X+l9nhBl9VdH5U1l7Rc8tJyS65eFD3+kPR65UlSqe7FjBMRC1wll070Vpuj/ujTrEzLStAuL2Fb
	+kcO7rSVUSllw/C/Yc3C7YhDvqcX0MV4eolzULsumfE38hCVmOCZ/S/1aaP6K29MibOBa+4Nwmt
	W2uqDT0c3Q/CnluI660M8nR09XMw=
X-Received: by 2002:a05:620a:17a3:b0:93e:84e5:3c66 with SMTP id af79cd13be357-93ebd21ffd0mr1650763785a.40.1791812269585;
        Mon, 12 Oct 2026 06:37:49 -0700 (PDT)
X-Received: by 2002:a05:620a:17a3:b0:93e:84e5:3c66 with SMTP id af79cd13be357-93ebd21ffd0mr1650757785a.40.1791812268863;
        Mon, 12 Oct 2026 06:37:48 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf35930sm283388995e9.13.2026.10.12.06.37.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 06:37:47 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: lee@kernel.org, a0282524688@gmail.com
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v8 00/13] mfd: nct6694: Refactor transport layer and add HIF (eSPI) support
Date: Mon, 12 Oct 2026 15:37:45 +0200
Message-ID: <179181225876.5624.3085409803913806974.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261007092102.3768818-1-a0282524688@gmail.com>
References: <20261007092102.3768818-1-a0282524688@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA1NCBTYWx0ZWRfX5mfX4TzXd9nX
 dGFY0nyrewSU1t+vv0/V2c3AoLKK5spSr6ZJtapGif24ugW+Neyl9l/ksxsnDsrsRTod4JT/d2X
 STkbylypgk7GElK/kr+5tPCu1jMzigOEivnUCgionGWC+66hR4NFpTGVPREb9dYJAZMxSv6cL/t
 H/8U2dKomlF1bWK3HFr/gp+ixLJRaamLUihqFdmJ1Hut+JV1+VPBaLYkrNyVujflZVf2leLbmQw
 AcGdHNCvB391+S6CmzzVNDYN6UPQQooariPRGIJqI+F6H2gGIRMNw9f0I4s1gXdcMJZz+4vIAdA
 29Pz7KoP3fm6lQMV60u/PurtQumnv9mgs25tLtkocwbcP30PihW28Tfp/OhnN22QtPLRXa0KxOe
 fT8c/s/hU7vQXfCZl/azisFSybiLWQiIFElU/AySljhq7FVJamSkU6rdcFwwwIv2Vh5rZfLA2+2
 oEk1xCJy4AXNw+uRZ0g==
X-Proofpoint-GUID: v-ZqYEcniOaiK1Ptmf-2TU2t0PA3GmDX
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA1NCBTYWx0ZWRfX8D1wGLmf18k5
 mxm2DYz/x9CklzaVv5W/ZDJS5atVvDgPjE6Kqx2b4TlpIL+0APiF0n4Ll0HYf3GPy8DTPkWPxqq
 4NDJ+mSXtiQoNdioGGtZqUtkb5jWwts=
X-Authority-Analysis: v=2.4 cv=ZcWIpcVA c=1 sm=1 tr=0 ts=6acce2ae cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=1wUfVLLtX7e_txjYYeEA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: v-ZqYEcniOaiK1Ptmf-2TU2t0PA3GmDX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120054


On Wed, 07 Oct 2026 17:20:49 +0800, a0282524688@gmail.com wrote:
> From: Ming Yu <a0282524688@gmail.com>
> 
> The Nuvoton NCT6694 is a peripheral expander that provides GPIO, I2C,
> CAN-FD, Watchdog, HWMON, PWM, and RTC sub-devices. Currently, the
> driver only supports USB as the host transport interface.
> 
> This series refactors the NCT6694 MFD driver to support multiple
> transport backends and adds a Host Interface (HIF) transport driver
> that communicates over eSPI using Super-I/O shared memory.
> 
> [...]

Applied, thanks!

[01/13] gpio: nct6694: Mark the GPIO controller as sleeping
        https://git.kernel.org/brgl/c/fcbc48dc650d2f58bfe19c4486830de0e9cad62e

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
