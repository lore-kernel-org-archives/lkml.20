Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AD553E7BCC
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 23:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790293358; cv=none; b=IAphFrARjXS9uQohkOpGzNL81ZbLbOykv+IWREOvz5Di1TEe7qSHKEfBUOY6hFMZ8sNNVLF9aiW2R8sLNBLsZfAh48LpUerZqKplNqCVyx0avd8UlIDJAwV90padFCOoiroPbtQPNXay1oAWfIrZyO5xGNB4dyYagvwdAG99oZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790293358; c=relaxed/simple;
	bh=DIJDE30a8cvtr07gDXvMJB9bUPKp79v/NuH7d9A/dis=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=MvBjS5wjEGie85WfL+0pWOH8mCjYKpsOgWcmoUH/Hc8Ypqw+WwTfGNlMkO4p3lTt6SYLc9UCQ0jUj3KOqIIRHG3buoxQYt1m0jdqdQWp14SXaHW/tVW7pHD1WWCWa4NI4hIcqYysAhVowIR0kCOgX+12+id85ouvJ/TFnktZqFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=Z+CPS9DJ; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=keRzkwyN; arc=none smtp.client-ip=148.163.135.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="Z+CPS9DJ";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="keRzkwyN"
Received: from pps.filterd (m0167072.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OMYBE5817421
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 19:42:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps01; bh=S2aMP6JXuEYmwKBs6aotCGlCcE
	1R79aNZlWiI1iQooY=; b=Z+CPS9DJ6t4XqcMWXQavFMdXAq00ptPym5mBotzFr5
	ClWtt9pDJ6ZqoKJNoneEbu6d4A0VR7wwERwuRDhX2Jul59+aEoB3DvGSD6THkDg3
	uOSzJBv4FyxCMVfqKAr6ne7/saqMpj45gOTkEhU/cXt7hR0rErSI+cyT4JH6ojod
	hyfoRSQoI0RMOclflwmYpCGflu7MDdYRcAIIBOopaPL8hqp2uKJm/MDlqt2KcYfD
	L9ZJcmuPLMDllJ0YYAClMkv0Vf0V5mtzgJPLRoZ+B0Mc0cGdmTMl8qdBbdNxkkCI
	P26j5IpKnzxe87o5V8d/Fd4xM0o+bR6eQ2TsYSCrT1Ww==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4gw8c6u66x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 19:42:30 -0400 (EDT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2df8cffbdbaso1552405ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 16:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1790293350; x=1790898150; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=S2aMP6JXuEYmwKBs6aotCGlCcE1R79aNZlWiI1iQooY=;
        b=keRzkwyNEn3843D0Y1ZQd/rFgQoMHzq6JMw6yitoTMXQpJPzOSop+Kfu7dMnaIqN/1
         8PMVBZIph8h0lQoT0F/r6qZ/tnZlQ5U6sy9yGyfZWn4bU7+1+3ENPSbCPABwdVz6SlNS
         Es6dyjhZyCaIS2fZefp2puvCv+mccnPAmAqTbtulyxbKrSiYBg6ZUqWIjxt7wdkO/ldC
         jFlKBiw1qf0M5OTAqzvynH4APxWcPxVoMu7TE6e5MdOh5zzJndKFPx28hVIzlC1dhQVs
         wfoHnuZJJZ0oTT4RmnKRPDPVYyyCGMb0ZBPg32rJrLZFI4iwieJu1eJlFGuOwuVz0O5T
         ktdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790293350; x=1790898150;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=S2aMP6JXuEYmwKBs6aotCGlCcE1R79aNZlWiI1iQooY=;
        b=qYgtp4qktHcgWlE7m68QNF4O9IInZP5dWMVldZZKSxSkrPpR7YlMIdd2mBPzg+PXLc
         GENlF0to3ANX2ZQW/Judxa1bZMBQscJQgrLj5ioOdIWgFmTyGqQNLSrJEnwAwJkhTRGq
         5I7SOHX3LTXoX7OXvAOZphmPhYlUdcdkWCfNNaBx1MYfTD4M4+1QICnxEi5n6oR9d134
         qUrJ5FAnc2Of2g2arVP31eCY2uwIHuhb0Nbx4VD1l8r9ZjaWWeAVPbtNh5nJb9vnP6Yj
         J3HDxJBeIpx0xj0UUGCgcRtgkvIrOTD4oFZCpakthNauod0CxGu1ITQDZ047DxtqB3rE
         p9pw==
X-Forwarded-Encrypted: i=1; AKwUvBxUEiTNbyuykJ1TEtf35fbrh+7pxLcI5ScAMyTEhfExrDahytFaxD4QrtYkEe5pNsr9h7Su6KrixcMnnsY=@vger.kernel.org
X-Gm-Message-State: AFuF++mrM/gPp6XZAMyLT0nz+k0K+L8YdHybcYX7AhM5gyvHzZnHHjOE
	IOZQGFpLu5rh5JliCP66AYUSwdygitfa2GnOOfOOL7s0/cDXsDJ7imb+q30pyNGboEyuaJ+mccQ
	SAD0WuzK86ZCNvOwymqTQbhz9D4Y2Fl6czQUbWdEcT11mDrjS5v3d+U5Op9SNGvauJh2xrQ==
X-Gm-Gg: AYBFou1gZuaaoep0SXGxjbRlX6JGcC+FpAwUvvMn4GpyBBMTitHrJHLldMgQ8aqBCtJ
	mDfQkG2xzN9jgPputIKwkf03tgfKIrEGGzjytuzX84tCd/FYzQkOW3MhuRezwSZn3HORWypeJ6A
	wHiCQ1NXDFkHsk02dc6qfa3/8BaSD00woG83nGwflYivi14LIhHo2RfAt9zsEwHshg2buV5RzV9
	6/0+/tgLxAtP1osmSUwuOH7GWETLtPAoamOUEO5qfO+lvBH2NAaAEMFnHyCI4uJCibLB1ZdGNrY
	7IZSVxfMDxgMwyToi+mEbcBhm6jnzRQyVQ3SpxmrpzoeklKXIu74ZJAxLTJs3dM0v4T1pRAzK2A
	+wPPqqjNuS58D6f2tI7A=
X-Received: by 2002:a17:902:c40c:b0:2dd:ad74:ac2a with SMTP id d9443c01a7336-2df7e43d08bmr34857255ad.28.1790293349945;
        Thu, 24 Sep 2026 16:42:29 -0700 (PDT)
X-Received: by 2002:a17:902:c40c:b0:2dd:ad74:ac2a with SMTP id d9443c01a7336-2df7e43d08bmr34857105ad.28.1790293349221;
        Thu, 24 Sep 2026 16:42:29 -0700 (PDT)
Received: from [127.0.1.1] ([208.115.110.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df90fc2e5fsm2239605ad.5.2026.09.24.16.42.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 16:42:28 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Subject: [PATCH 0/2] fuse: convert the readdir cache to use folios
Date: Thu, 24 Sep 2026 19:42:15 -0400
Message-Id: <20260924-fuse-readdir-folio-v1-0-8dd97e71c1cc@columbia.edu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFe1tWoC/yXMQQ6CQAxG4auQrm1SQVG8inExMP9ojWFMK4aEc
 HdHXX6L9xZymMLpVC1keKtrHgu2m4qGWxivYI3FVEvdSictp8nBhhCjGqf80MwiXUDThMNxv6M
 SPg1J59/0fPnbp/6O4fU90bp+ABjOt4Z2AAAA
X-Change-ID: 20260906-fuse-readdir-folio-009ae33a7854
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        fuse-devel@lists.linux.dev, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev-db0b7
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790293339; l=649;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=DIJDE30a8cvtr07gDXvMJB9bUPKp79v/NuH7d9A/dis=;
 b=oenOQPanKL+RULof0OkLFyq7KYQ0MOS/NyPcktGNUwnKYadAxyzi1KhtN6SiuSLZfVYIlMPy8
 zEVuM50L7udBTImD8QwxMkoGJC+FKGMx1tCSV/ZNqYdoAi2CLXpc7cH
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-GUID: wo6wlENxsTwHSz_2SrLhTvLTliw80S1P
X-Proofpoint-ORIG-GUID: wo6wlENxsTwHSz_2SrLhTvLTliw80S1P
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA5NiBTYWx0ZWRfX+xcp/AyVcfs/
 4MD+F2Zj8w4/yTDCCiOUJF+/K8tF9eDD2/KlH8sOuv1hRe9yG7MRSSh318ddYV3/rA0Uo3twb3G
 E1/Ac2U0wEr3fQzgq1S+w1kVgz3MIXsZ4M2Bx52QRZWkmplHFBlc
X-Authority-Analysis: v=2.4 cv=KOzPn1Fo c=1 sm=1 tr=0 ts=6ab5b566 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=AP5Yue2pfywxtTblp62eJQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=SsB-OO3BMngHh3ZO9fOt:22
 a=R27Tia9Tc3MXFFTUv6cA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA5NiBTYWx0ZWRfX9ZM6RsLujP4D
 2NISyw6c+EeiUvkJb9iv5q+2vZ4WVjs+dN/vcEJGGuxaJfJ/z+rnVrKVJ36rqmT0/UHQMMxKwmC
 9OWxK1+RhNjFQ4x5c7/3XozR+VBZABxCvnbXX1NufrIL/P6Za3YmTjzcT20ER4oRsT1P3o5rC3I
 nAjkt+SJ8ovYrdrbQaxOztsc4VhDE/Yvq0ptCtRD5qoSaFFD6qpdyVX8FqHHirfaZ3jc13J7q+3
 WuOQ7u9Rsvl8b38Q54JETB1fkj38bQfXkxkCq+O4t+PNivP6e72zL138XiCvjxjWJ2KGu95dlau
 8j6Lhx4KRxkiFRUXSd3r7RBsWcKk5dFnvVixIpfiCWkuY+ataqXgklOLS4p7s3SeGD/73gpGnaC
 JF6sleRYFnZvOh6Hd59aXlCisH7xFRW0+LGWGBKKZ18uCfePx0X+xdNtYfyb/PrTeVRQBjlhuR7
 g63DLMmvJAS9EasW7kw==
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11915
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=10 bulkscore=10 spamscore=0 clxscore=1015 phishscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=10 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240096

Convert the readdir cache lookups in fs/fuse/readdir.c to folios. This
removes the last caller of find_get_page_flags() and one of the last
callers of find_lock_page().

Based on fuse/for-next.

---
Tal Zussman (2):
      fuse: convert fuse_add_dirent_to_cache() to use folios
      fuse: convert fuse_readdir_cached() to use folios

 fs/fuse/readdir.c | 70 ++++++++++++++++++++++++++++---------------------------
 1 file changed, 36 insertions(+), 34 deletions(-)
---
base-commit: 10bd6b32965265688fa277d166ab224de8e86eb2
change-id: 20260906-fuse-readdir-folio-009ae33a7854

Best regards,
--  
Tal Zussman <tz2294@columbia.edu>

