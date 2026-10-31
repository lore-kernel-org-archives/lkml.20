Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.135.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793478815;
	b=d1rsiZFGsVdmIXDvO7XK8OuBZzKqkeq1S89Cq9veZWSjej+koJlI7z6pPFJe1gHAqUdi
	 eZk95H/pWn7h1aspSVx1uyCeUkLG4xEkriz3PZQj49Nh48C1I9zp27pAcp6R8n5cHaQ1v
	 Odu3aL7Dk1cYCMQer1xgbHBCmjlYy/vDZ8XYt3GnpVAKuPHF/RyAx/GKawAmQl2Kzsask
	 mofkpA0lTWSwMr2vbancOG0UVAi2ppDll74ofMNfDp+lYLQxwtQB2f7WZuVEQmQjAnSX3
	 Uu5ePnEbHKtPj8WxBwijKUOGk6fYKceKvgoTQFzoJmgXmcKnMefLQYygKx3m1/93unA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793478815;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=SUiGiQ0Y+CFpbO7hs7vpkUK0TSJwBq9jsvGhQh6Op/E=;
	b=fMWNsZfahVbHxk4LV3EOGmGptCoZwrXT3WyNLpLI0cRy5mTyo1ZA5vf3ahuuBqymKrRI
	 PGnggjQXLfRxxTbTYdSKH49hvS+uhFbNfG8JNViCdQICIVJ0p9ziZ/bjZrowSZApA4rQx
	 yWj+uxZiX6qEgHkaiN6HtN10NIYMn5dZubMwI4DFRvnQknu/G83gdxbAUkPYB0+QzsghS
	 hQN5kNMgVpbMRvQrxJVk43JkZOvOnflC4QNN5/MafMcZdPbAAd2jJ7958GTs6VtfiwPx6
	 F5NMfPSYoAVSCgW1nEQMcTi4WktRHqxahHP5+hbrlSpBP9/9fqUcIZ3ybnlIv/7Uhsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=riMMskYR;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=xv8CiMH5;
	arc=none smtp.remote-ip=148.163.135.74
Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3A2A606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 20:33:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3A2A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=riMMskYR;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=xv8CiMH5
Received: from pps.filterd (m0167068.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69VDmXrb637629
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 16:33:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps01; bh=SUiGiQ0Y+CFpbO7hs7vpkUK0TS
	JwBq9jsvGhQh6Op/E=; b=riMMskYRDKEVqPF1V9/F+WFmw36SiRakiE1up0oOJb
	KBdVIL1HF2g65uDc2o4i7VXxrEMf7igtE9sTy213J573b2lEBaErATvecMs+jVqM
	r1ypEc9a96wtHAYdoVgwXzIHp35gy//E9I2CVhHnEHckgFeCalqg8Ui1Tn4zczmm
	ZPX0D0qZD0TkYYvJyI0gkjMrLE0HWC2YwuBXLgTaISC/s540iZ/EbiNmrPTgYpzg
	xp0qh61GBeXipwEGqXFlR9pIBqP5YRvsa7CHysuoLP19vX2dZSirk94zeUmsaEn0
	H+OLoAGLns22/i6l6KpUWP9k5cMoPqWWM1AmpbV+rUlw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4hnakq3epm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 16:33:32 -0400 (EDT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-944101e6367so348427485a.1
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 13:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1793478812; x=1794083612; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=SUiGiQ0Y+CFpbO7hs7vpkUK0TSJwBq9jsvGhQh6Op/E=;
        b=xv8CiMH51q4CVszt8zecye2JyA0yWwwM+bDtgNwYXnamKw8rHjKsm+ekIj4KLuLJSo
         nLPY0yPg5kE/MR8B8f5RVm4ZMYku5bLopxkTkpQBWLcpPp87XjWk3k/uUqPt1hREfJSs
         Lu+NlaNCpS8+V46CJHNMs3BMxdm6DzNsOBI/4uQmmF6bZ/wpPULkUxn8a0Ig93oM3kYK
         T1lxQCwp7EGY9zpdjIJMK4SHZ8a/jwHWWRSZnIkRe4JLWA/nY3Af82rv7Cay7kLBs3J8
         qBRdC5XryDMn3wGg6V00IrJEmv+DdG5OTNIQuuGzH2dmrgcOy780jPGDukPZ/xWDvWZz
         Qgcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793478812; x=1794083612;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SUiGiQ0Y+CFpbO7hs7vpkUK0TSJwBq9jsvGhQh6Op/E=;
        b=f8G4tqOE2OsquLRm4l+vJaod8TOv++T/FbqMeJCtLAvPspnv3eyFEN9yTZA7mm53Od
         pZI4QBLpcs3woZD75kKGw/3j88IAU50SGxO5FWF9jd7R8MQWDm8atjkTssfqbuTwzfvZ
         Tt9y0GaMi5NCzrrrwPhUkoq1EN8xmzS4e8+lmpGuAaZbed3mbsZcgEM8YFvK2Dk3in3f
         Ke2W3g2wmRKlTrHpRRu6+mxVFomC6lcrJJ1GxEdiuwAL0DSLAS4OoxnvXXtbiGAeZSQR
         5GrpROClJSpSMx5c8U9DVpHr19IeXVksZUlny4DQJjrBKe/QDOW5hbJ66nYMUvPPPGfR
         LohA==
X-Forwarded-Encrypted: i=1; AKwUvBw5c7cfM3CA9jmS6vtpp7Sp0mkCtaJMhJ4wMfFV2HuBF3hUXAlitXbAeJBmE9bsvjVanMlK43ZLDKaflyw=@vger.kernel.org
X-Gm-Message-State: AFq9FYI/duLtAXaAFkmInj5UppKvr9mZLcTfCIHJoJ1hLZOiJ7qanqL9
	JN0HESFhDvMMGhhgdGzeF4qL0KMPeBAYE0qCcBu9Y4fCHeWqSe80oF5l7PCHOK9YKAP7hlnbOyD
	1ExVjwG4gcsitRFJZk3xIqVLtIe3NQ4TeQpNhzTwcC/OVAmcVd981eJrhIyHN2w==
X-Gm-Gg: AYBFou3a5hDd3LqeKrGd/ewrEN6jQQi7W6mjTqAR46FdwdR8JrONQjAJADgSNNQRY8q
	0vPSivKf1RPXOs9qtMbAAqU+Mi4fnmTW22jdhYgvAZ5v3TLXuMRVibOrBcbiu1/kTcPmhC0WF1S
	HM1ItB9uW2BeEpy4DZZnp5B9fltrumBEw4Gug2i2c96eHRJUOhCpBVgx/miTFZIknZt/eo9sbfz
	AderBPOwF3xoOuluQWe7tpGKoaQ4WYUC5sVwKi+OtSPPXmX5RYwXMWi3UrRBEWubrRqNoTO6rQs
	5Nzox67fTBV2r4z1E83t3MM0WbZXH0tJe9B6041/zcpCXSMIXCrxsciLHvHIqx/apNaThDofsWc
	3vECxTbB/YBNBAnXoUSr5jzJ1LAGSMcNTDU5l40RpNnQiG7O9G2RI+EUUupA=
X-Received: by 2002:a05:620a:6013:b0:93e:5de7:fd45 with SMTP id af79cd13be357-94413382637mr1224532085a.18.1793478811932;
        Sat, 31 Oct 2026 13:33:31 -0700 (PDT)
X-Received: by 2002:a05:620a:6013:b0:93e:5de7:fd45 with SMTP id af79cd13be357-94413382637mr1224531085a.18.1793478811503;
        Sat, 31 Oct 2026 13:33:31 -0700 (PDT)
Received: from [127.0.1.1] ([37.142.155.128])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b81c74sm10019650f8f.36.2026.10.31.13.33.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 13:33:30 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Subject: [PATCH 0/2] iommufd: remove the last use of set_page_dirty_lock()
Date: Sat, 31 Oct 2026 16:33:17 -0400
Message-Id: <20261031-iommufd-folio-dirty-v1-0-2cef66d2d6d1@columbia.edu>
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
X-B4-Tracking: v=1; b=H4sIAI1Q5moC/yXMwQ5EMBCA4VeROZtEu0vEq2wcSmcYQTctGyLef
 Yvjd/j/AwJ5oQBVcoCnnwRxc4RKE2h7M3eEYqNBZ7pQmcpR3DStbJHdKA6t+GXH0jTMb10qfhm
 I5dcTy3ZfP/XjsDYDtcu1gvP8A2Hxrdl3AAAA
X-Change-ID: 20261015-iommufd-folio-dirty-8abff4281f3a
To: Jason Gunthorpe <jgg@ziepe.ca>, Kevin Tian <kevin.tian@intel.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jean-Philippe Brucker <jpb@kernel.org>
Cc: iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793478807; l=1411;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=eNe3oAs4Qkr5hSIiUWON/YrrFv+X7yStpz6+TWXlJBc=;
 b=wSTu02Ccl25+NdBAeIyxiHEktfMw0UcSgwzuHdGHGICvU2T1FNmcw2CwKjP11wjvt5B+BZ/4F
 uDFd4B5MfcWBCd3IobPHWNkxqmYvZuaSFF355H2Aw9luNORuzsNJFeL
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Authority-Analysis: v=2.4 cv=NJBAaE6g c=1 sm=1 tr=0 ts=6ae6509c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=OyQKmhT2Qqi7aVZxTY5mBQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=usPcmh10W0ubT8QP8_c3:22
 a=B_Kq-j8faEqg3xUN6KgA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: utoQ8ZAgomQwGBcDMm7HL5kmnwxJkg77
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA4MSBTYWx0ZWRfXxkyh738EVU0o
 ZoWWoZ7QBsN/faq8fXzHiHMN/37WWhVD0oX+rxgtwK/19snZnvnQRIKRcPVm6rk04bkDZ0gUdbz
 uBr7jpOhMzg52vPW424/scu4AlhqQ86+ruaAvtAkUrGC18IbjA3R
X-Proofpoint-GUID: utoQ8ZAgomQwGBcDMm7HL5kmnwxJkg77
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA4MSBTYWx0ZWRfX0YPQ8/avLXxR
 sjIDdeCjtmgxVzwuH76c8Hg5p1UE2e5hfyQedVuDW0U5/817uF8HnIhQBQHNwh0Z9XwWgohZULv
 ZQGg7la6beNBd+qnzF0PPNrvsw99+Ed5wPmupyulwfi8Z8Y4SAfh5z4ZYCvPSeIkTMtN02rZb/f
 sKMiNV+d8iBKzKMRCSR1yFMan0+XUsSTcgRGku4Z+DgdwBfWopCzfnvsmLMAxy3Q9tlLzFL5GXp
 ygt+JEtYr5Lb75IK5w6+tcinQVnHPjmuxAPzuDxR+USMP8HpdHKx47oWwczWODyDmeyBT6GbHyp
 VoL3xhWNymVE75uskqHLBumcldRcLHd3Zu1zcWU1Zrhz+vWmBhSISZiSKvGH0agspiwlLNZ0Kiq
 W//pvP5Wl2TRtv4YVyPLj5pH5/9VBT3IdF6qPUFt7Ex9vtQGUAItILc+zSlg1iiJC+jaOaudOvd
 S83FOTgGmnatTWzFa3g==
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11952
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=10 adultscore=0 clxscore=1015 impostorscore=10
 malwarescore=0 priorityscore=1501 lowpriorityscore=10 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2610310081

batch_rw() copies to and from pinned user pages one page at a time and
dirties each with set_page_dirty_lock(). The second patch walks the pfn
batch a folio at a time with memcpy_to_folio() and memcpy_from_folio()
and marks each folio dirty once. It removes the last use of
set_page_dirty_lock() in iommufd.

The issue fixed in the first patch was found while testing the second:
iommufd_fail_nth turned up a dev_iommu leak in iommu_fwspec_init() under
kmemleak. The fix is independent and could go through the iommu tree on
its own.

Tested on x86 under virtme-ng with KASAN and lockdep against the iommufd
mock driver. The selftests and iommufd_fail_nth all pass.

With ftrace timing iopt_pages_rw_slow() through the mock driver on a
non-debug kernel, slow-path writes to THP-backed pages drop from ~1310 to
~930 ns/page (now the same cost as a read), and writes to 4K folios drop
~9%.

---
Tal Zussman (2):
      iommu: free dev->iommu when iommu_fwspec_init() cannot allocate the fwspec
      iommufd: copy to and from folios in batch_rw()

 drivers/iommu/iommu.c         |  6 +++++-
 drivers/iommu/iommufd/pages.c | 35 ++++++++++++++++++++---------------
 2 files changed, 25 insertions(+), 16 deletions(-)
---
base-commit: 04bcf84613346b973a8cc0c59238b6b5bc902688
change-id: 20261015-iommufd-folio-dirty-8abff4281f3a

Best regards,
--  
Tal Zussman <tz2294@columbia.edu>

