Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794318429;
	b=XX9cfu3+ua1mlPjDFuitansZZMe0au1HkfeoAU+E1qld4sydqEYRCTMx7NRIlQv7jrgz
	 sBLHrEjxeivqrCPb2MpWucFWhEoTUx9junA1HVPZTMU4V+UnNagwN/HRZ0n5x4OZzJB7A
	 Q/PekXQUYIpMD6KxkZps/FulWZEd1WeqsjFIgmO9oJ/6zBsmFqFqK5tXGo2rnhMDgmviQ
	 /Vgg99tEYzQ4zk5oO09zUnC0vAXXY4N/MrC+NMU016L2llRzFYBdEomrOi69WAklfoEI5
	 qw2+1T6tusHb3wrZrgU1NBFP+evlSaGJz/PtltDL2/6LdzT/HkX96qDvYxaqEHHsVYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794318429;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=a4Fhzbkhmif/Q1YTBeQdgBPZx6+cgWjAkrEiLzB70pI=;
	b=UK9smIC/UbIVNSJkLQzo/NrN8y99Ujygr7zyvAMcYrDtdJXCJtTEKgPa5IUVSfpTclR2
	 gMdOKFP42kJtk84Ck0B1Pywr28dvwoS5FZZqcSJmFXniXJ6mguNMeu4AgwCJB0PjrweSQ
	 BTnppQ6dzciiLVuknYM8ZvPh6ReZXDhJVXWOLrp3xbT2nsIqsbJ0dJoq5e34yIt2PFfdt
	 n6ymzxHoaipgZV1qXyxgLgnBGSF1L8NdnlGJWjzJoFLcVEcPYjD5cpmXcVAPRNL/NU/Ad
	 zdf6GIs+1e9Zi8DZxfYrE92ThVqrNsBlHmcFNEuaf5bYqcxBx9v1N8DgvB/A1nWwyPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MJp+vBix;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PDzquLVQ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AA60606A325
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:47:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4AA60606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MJp+vBix;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PDzquLVQ
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AABANN01599610
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:47:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=a4Fhzbkhmif/Q1YTBeQdgB
	PZx6+cgWjAkrEiLzB70pI=; b=MJp+vBixiSQCa0nywMSxlCJQ8IEHd2/XfCOo6u
	usTNGSZm4OTUYTSy5yT/UxLMihKg2wwsZyL9seyViR8joyht7Xc70YHVMz4/T+1s
	CkDukBPUdYuNrb3bM09+QxDQAnyLBO0nj8jlU+A2Fk2mdNFdZRNq993PnHF0OkHL
	7dHsD6Go2BMrHK3F3zAzu/n2diWHWInXojWBOxyrDExdYzifMGAGK7sakntSFTLk
	gFZIn8le8o3ulJ6j9BxgBYWPKEDd7jwDsVZJORgivp9L3SPeCRqLj9YonT2P39EM
	6Xb/LUDll/VuPD0EOFoL7Mh0/SAcYc0/HGAWvXBPw62C/5kw==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hutv4aa6u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:47:08 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-99063f4065eso680953241.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 05:47:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794318427; x=1794923227; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=a4Fhzbkhmif/Q1YTBeQdgBPZx6+cgWjAkrEiLzB70pI=;
        b=PDzquLVQcVzBG3CaiOno3K54peGku7XvKTJBs76CdB0HBrXz9ya7tshGxd8QZ8iDnF
         aQKdMNamR2dR4ZYgpcTmC4xER3mJp9sRT/m8ARHVwik4f4brKA3+/Z8Aw42k623ivBlk
         6XNcJQvvN3U8TQ9hQ8Jbnfd9Kk0wrKpkxW4HATtCOo0H9Jyvj6akh/pNEm2nEF51OP5b
         E0KHJutRiPCbtsREWDmPp6xgu7vHATAPKcT2Q283Jb2C+gyG56qqGxnlNz7aUTEqpkJY
         ZOX4NAoBYtrcacekuN2Z9rQR2gb7K+PPFn8jt0CNVN15VrjXle+3fEaydZeeONrf4OqW
         DFlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794318427; x=1794923227;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=a4Fhzbkhmif/Q1YTBeQdgBPZx6+cgWjAkrEiLzB70pI=;
        b=zIlTGha+7MXt/jq29xw4/Z45h5QVm2gdZA9pA/hweqCYXJk1+gwDPKrM2pj5OeMP/m
         ATFo/HLxEo17wVHDWIp+AvtFiTlvQHs3tdpoyagnJBPTwZD+ccYecCKrCZj8kqj5qbct
         3UlodOD0wzq+cT3KHWLwxdwnytMZL2iLzyOva9cMw5VmlMIAEJSQ36H5EJDgktn4v83T
         MacYIrZUXt/0biUeduXCaw/sbkNojAlrbAcn2vyKQW/R9ACNQFjZwFOjlpo0LywUHsHL
         PGZzvzyhCweUwSn9oFUhsXAfEqwydY+ev5mFKDOqm4w9C0OnLY9nad3Y4azpfxk8jDOz
         a/ag==
X-Forwarded-Encrypted: i=1; AL+hErEWOyLg/0yDcpjgJS9ZuyhFFhWD+5+qi8scFfoK7Hrnn1Q2Z8tDOsKYROIg0nWcBmdngFBRtRuQAI27lt4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+UT90x1B1qaJksPdYziV48vFooc9Ji6XhzyuaMMYLUVBDghlFf
	ubGKojImQqax/rQfaghhE+XWW3/W3ND+pMRxSlFXLIfuwU0ojTdzMOOuAB0efIdl122MopM88lv
	PY7jee8O3MMxX+3j8B1+4l5GRaZu6rU+L1BdUWkkStmfMq//9UAo+hwVDfJ0jiLClq90=
X-Gm-Gg: AYBFou18+MPzPQfAE3bXPMu8gxvDtoQazFAEjCrOfBCb59rRnO9F+Z/ZU+ksFlpTjRj
	m3MpWuDpxHNHvbFXJjFa69UWGwiRbrS8LgtnusdQoSSY5idONQiGKxRwpSnJmRQQw55LyZ/odDu
	aMN88RRT54x+2mApczt26v7GZDFrHKpDDdcOCM+ngh94nO84wKYWpxybSJONpN1goa8aYRwvVN9
	CZ4WVOIU8lZEwT67B3U38gkCBwQQ7j/TPFZkROxat1bN/LQwnxEKL2K58SFQW8ludoeZF8onvZS
	mxIC2nxCxlEYWFHZRvG3d8BcZ7/FtJEmq42tPiQCS2SS1vV+5WIP1fwowt3G13vl70EUh3mjS+p
	SdbXH0GNbOvQ5PIJ/86Zc36AtMOijoisgL+jaZXYDkJ5VwhOM9KbTjjOU8bj0LhZ5WKdlxm7h7p
	tXZt5zUK5U9zhqMCblk1lhubbVovH7LV0IJwcCYK1enRh6xdbsH+aVOTAelCVWtwU=
X-Received: by 2002:a05:6102:a51:b0:7d2:d194:3de6 with SMTP id ada2fe7eead31-7d301c24414mr776934137.35.1794318427245;
        Tue, 10 Nov 2026 05:47:07 -0800 (PST)
X-Received: by 2002:a05:6102:a51:b0:7d2:d194:3de6 with SMTP id ada2fe7eead31-7d301c24414mr776923137.35.1794318426651;
        Tue, 10 Nov 2026 05:47:06 -0800 (PST)
Received: from brgl-qcom.local (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba02387ad9sm75913445e9.5.2026.11.10.05.47.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:47:05 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v3 0/5] gpiolib: improve concurrent access to the flags
 field of struct gpio_desc
Date: Tue, 10 Nov 2026 14:47:00 +0100
Message-Id: <20261110-gpio-desc-flags-atomic-v3-0-2f463bce8086@oss.qualcomm.com>
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
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFQg82oC/4XNwQ7CIAyA4VcxnGUBhug8+R7GAyuwkWxj0kk0y
 95dtpMHjZcmf5N+nQna6C2S824m0SaPPgw5yv2OQKuHxlJvchPBhOKcSdqMPlBjEajrdINUT6H
 3QAEqVWoO4Awj+XiM1vnnBl9vuVuPU4iv7U/i6/YvmThl1IoSrHGKV7W+BMTi/tAdhL4v8iCrn
 MSnVv3URNZAwkHW8qiUOH3RlmV5A2GDvhIRAQAA
X-Change-ID: 20261104-gpio-desc-flags-atomic-cc963a1ccfd0
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>,
        Adrian Ambrozewicz <aambrozewicz@nvidia.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2012;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=EsD1Bmi5dzDMQxvdgxQkI78EsxjQT0cKxosp+R1L8g8=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq8yBYPLoAqM/QEpQxCGB0aAmPDW2oAe8T/ZZDV
 g63MwVmYC6JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCavMgWAAKCRAFnS7L/zaE
 w/bDD/9Vx13T150wKuVuGd+8FaF5Cr5W6C1v9rsqV75b9cV8B7ix8mVOKgd7KznjBoYV23vp4IQ
 CgS3H96pjf9S6CqkqDedOWE5DVMuJ6t1wTZGF9ztJTRpBQStxJ2XiFIKqP9vdMMQaJ5xMi3Lhgd
 LmLS5c+8ujy/xgHld9iq0DK3LhCyk2hlczsI3eQYz44EnXcNnx3D8yBFEKo4d5Csi4I62DiguXj
 W4dts2a0dyu1tO5ZwnyP1snTY8U3V4oSf/heDcRLqkTO4Auzyxa2Nxdnl15amJSQN9MpVT1xnkU
 ciR2ReILsezVUMe/4gUI1ViDgHSoBTCnPVGgZ05wzF19Xu6Poks7Pc3rM+AtByivqF8/xiwto6o
 giak71/ocBbOcLpaOrD+BKT3jdj4x5Thhpe5P02XWt/UFwYZRtkvuC+H/WIvnxxkg4dh2v3wU+w
 MgcUNIozM8ZEZrQUSNOzuASlkRWfF4Uzg2zK7BTMDaGxVslK1ZGW7seCCjKlu4xBGjYr8TndhJ2
 3UYlbHkXyBFwB7RyCXqjRjtalMZjsGUSFriMBsPumEGN/v0zxQ2MYW1HTsK/W9iLXkXHZC90dEc
 o8fAgE/g8dAnMpMW3gUNnEiQ7uRTWQSVmi58wIuZqAerKAm/JyyQ81xgLBwpYNj03LKXPX8syUZ
 NtjB+TmMdTaCuxg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA1NCBTYWx0ZWRfX88de4KZwkYIg
 HjEKh64cDMgoBEIkbB8J4L6EbKhnUcDiu8QUToQ7czKkMFyFCOg1+eOd1Noy7i3U7SmuoZ+ZjGm
 /YhWZPNne6rtMcTWsAyAGYcm4QF/f3o=
X-Proofpoint-ORIG-GUID: WXAzyxnb524pcnHCj-ktGXBrcl0ipiNV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA1NCBTYWx0ZWRfX8eJiDLO45m4h
 YwPLP4zDhu2SknwRqWDxEsK4ol+gGQmDw+2Devw2dwtbznxVydugljtsHexEa3L56UaaGh216m/
 hWvsrss05YZF43150Q4e0HZ21iixR8pTiMofOaAaf057gG4WiogKqQJdFC3JzQfXHjk4hyDxOjv
 d2LAP8k0tJJc13ylgzCPmHl0IDU9N4mtcJAuCofuMyn+RiC/0wpMJ+1xsLBC0CI+d1EqLa55/Ga
 klG6gG1UaXGC3gUrXqI46DNTMFuBEK3/nuRRRktbDc8qco+xvnuKBCvQzHPNRbLABGs5SNefZXY
 KA8b4cLd3ozsbdsWt+2ZhcsnTAUyv6Y7J10UKxV5mg4k34icatX/zqsVjfkQFxjHOTgbqSZBkcK
 xXh0YVj670z0RbwG4iieNONX4SNIBb7pVoCa6qspPuKGv8zInQIXhC0687SXP8mNn2iOi/mUi+2
 hm2gQtxUfH5IokZ+C7Q==
X-Authority-Analysis: v=2.4 cv=B54sQ+tM c=1 sm=1 tr=0 ts=6af3205c cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=css3_eirYtEXeZdFt6oA:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: WXAzyxnb524pcnHCj-ktGXBrcl0ipiNV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0
 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100054

This is a follow-up to our discussion[1] about desc->flags and possible
races with users who don't/can't synchronize with other means.

It's an attempt to use try_cmpxchg() to update only the required flags
atomically where needed + minor fixes using atomic variants of bitops
where it makes sense.

[1] https://lore.kernel.org/all/20261015153714.GA105746@rigel/

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v3:
- Don't pull in bitops.h when including bitmap.h
- Improve coding style: fix indentation, set mask later in the function,
  make lines longer and more readable
- Use the right Fixes tags
- Link to v2: https://patch.msgid.link/20261109-gpio-desc-flags-atomic-v2-0-c4c54b476628@oss.qualcomm.com

Changes in v2:
- Drop the custom gpiod_update_flags() function and use the existing
  set_mask_bits() macro instead
- Add a patch clearing debounce_period_us before GPIOD_FLAG_REQUESTED as
  suggested by Kent
- Rename the functions updating flags in gpiolib-cdev.c
- Don't rename the flags variable
- Link to v1: https://patch.msgid.link/20261104-gpio-desc-flags-atomic-v1-0-e23cedf619ba@oss.qualcomm.com

---
Bartosz Golaszewski (5):
      gpiolib: don't overwrite the entire flags field in gpiod_get_direction()
      gpio: shared: use atomic set_bit() for descriptor flags
      gpiolib: clear debounce period before the "requested" flag
      gpiolib: don't overwrite the entire flags field in gpiod_free_commit()
      gpio: cdev: don't overwrite the whole flags field when configuring lines

 drivers/gpio/gpiolib-cdev.c   | 93 +++++++++++++++++++++----------------------
 drivers/gpio/gpiolib-shared.c |  5 +--
 drivers/gpio/gpiolib.c        | 35 ++++++++--------
 3 files changed, 65 insertions(+), 68 deletions(-)
---
base-commit: 630059a5a632377b9b7b487baccde92b7ae1dd47
change-id: 20261104-gpio-desc-flags-atomic-cc963a1ccfd0

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

