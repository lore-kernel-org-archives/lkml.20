Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16AC8399CE9
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 20:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788813238; cv=none; b=nFBwDW3cjV0QHeW/wDaKo1OvRMphG5puUZ7pycX01pb0svTEUp3vn3O70RqFYiSSr0ob4YuFTzFmzAwaAZpFAK2incPwVokDidYkh77ddTeG/CUYizN+kHTNvf0I4Lq6x+KGThGsqwjvFdhC/Nxk3TwZfL7it/SZliV6i5XLDHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788813238; c=relaxed/simple;
	bh=slxYMd9pIzQAMKVqHjrMfdvbnPLm31GqOFhQsu0FO7Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TF3WNZA2ZprCCS6coffyF/kii3yqv1gY1BRt7CRpI4uxvTLsryDicAG7ovidg1wNHiDUl8tPtA2V77v5LpOKZx5AUyUcXiYGru57bLrFlpqcpW3fflJ8gtNvkVsaGWTBr6xZm0mU4uVSYDvcirvUbehkifw/mVeZJj3GNOEKxqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CBxFsh19; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AU0b1aXX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CBxFsh19";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AU0b1aXX"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687H7jHr1642056
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 20:33:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gYoBNxGLCxDZv4uAHMCNobIrbYmFXndZnMWIP9T37jE=; b=CBxFsh19AT4k+2gG
	A2A4/GcF7oPQGVdC7W3lsh/9k2PO2iwHkZUnds4FiZOnWGQ7gLqs3JwqAE5fJHWX
	BtxM3c6awmRbVNrnUXu8ieXFRQqncQDZ9aPL1DqJByNl0ve+c2Tvmn6A4Bz0vrXk
	CYPpsfQpDAN7LbCqLTUL6U7l+a28lZouMrXvTfrHo3pOnwp/YajuI2EjtjgYRgU5
	dQ3p1ACMP0sRam1P0yOrgY7pEuVRDPyPgWlWvD2CMbrdsZZVljVMsxB8h7dpv5vt
	MXV83PTCsxtulGTTCDi9T0vQZPFz9/2P1jEscPe4NVyuOBI2xH/gc/MdGJYm6kNi
	HaXkQQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghruaaxed-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 20:33:56 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cbb92868263so3164162a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 13:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788813236; x=1789418036; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gYoBNxGLCxDZv4uAHMCNobIrbYmFXndZnMWIP9T37jE=;
        b=AU0b1aXXKf+e/V8FXF9/Ci2j7SCEmlBKdYtvsTWsgr3NrgATgHcJ+g/xDd7giMWILc
         M11gzawDUaIAu424MXQQLQzCsho5SBEtyMPvxboOxRxoQk3kJQRUxlRzXIB6qvW3V+em
         YbHW+bayY9Gh56/GXzkun+qThMBRfXERMg8xWoAnopLJX2XsVATaOEMNfhigycN1JGYc
         s/g5r+sAZyeRYkFU1jDNqlVFO5rq3T3IbgiLqWMrVqIm63POqlxjnf8+ds1RJogZRPTB
         /d7W8Mm7+mx5QuvySLIFT9UXqGecNBCY3p4awXSF46fGt50hLfEF//niwC551z/bfRgN
         pCkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788813236; x=1789418036;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gYoBNxGLCxDZv4uAHMCNobIrbYmFXndZnMWIP9T37jE=;
        b=p7SXZGNiEOLjLlXWRoqsb1MB1PClY/W/egxoDU6YPbq9i4/qEWYUreMPrsnMGlVzTP
         NqcdLEqhUJdEFmBTKetq8fDK7f9tOouxvkQ2qpuLYKGxebkDC9bTNb+IrsZGSFCkFe5E
         DVWdUWKD/ws3cq2XAFsrwEYLTBN631Mr5d7jfa4bemrbmNUCS6eRfHg3wEy1ZYQOF23D
         5e75yDFVCDAGmmZCEp/VWFTf3TLcPH0wxI8fmv4dHx83YBhMUZgapujNwULneCneAO71
         Pgfk3ZJi5sXrSAXVJQsWb7vTVZs6dYGHYjmsm6VoulmPLVdmTn94dF+r2hnSu8UvF7lP
         oOgQ==
X-Gm-Message-State: AFuF++k7zM6wqyysK5h2Tvq+o+vvQ3sZMUpiKIQLfU3adAOCZuRkXqXq
	CE0gWlBr1Z1dl2Xo0fFBKOG1t1Ik+gM/rT8ulzggTL4YabDbfB+AQFbJyl9zmy11WK6JLLwmZpZ
	mKOxJX3eyuJ12/nEB+ze77zKJZSdBNNUxjmnBj0jfdLlQwKmrV0edLo0Fr7EZ2FRRpQ==
X-Gm-Gg: AYBFou0MiEjHiAkerBR3UY+AT6Q00iTsV1b0OBKfiFv5smepBr8Z8HaDwhBAVeGpM5y
	hyWkjoqr0GEbIOBeBZ2j9Gm3IISOJF9cH79xpQ8Ccsy0ntxiuBBLDFlByhFxVP67o7GEQoXV7ta
	kL19wV0NnDqiTSgp9Yz7fnp8ztshGyh9cbvpohs2dPFDjiyPauUK30g60+0Aly4KOduage0xDlE
	FZNecSlp/k9b2/hxb2LXTGSbWSDI4bcefArLB0/xN9BxSQnspFTIkM8KfkuaAY5JBssQ4wkiKP2
	E90ruUKYKXWC3pmfglOJQG15zuGNsvzHc7zQoRS2a3qa4tiW6P0UyoYxyBGq6xer5gg8/83avKY
	xL+oMiGVqerUWVNf6vq1xC0XcleNHYmemAqWzJ4IGBlNi5cHLuFBBhawwqP1tY0Rw3bQEl3AZgI
	yYKDwFLo0dI2eJ/AD00li6jg==
X-Received: by 2002:a05:6a20:4321:b0:3d3:b02a:61a5 with SMTP id adf61e73a8af0-3da3a217599mr37266731637.28.1788813235703;
        Mon, 07 Sep 2026 13:33:55 -0700 (PDT)
X-Received: by 2002:a05:6a20:4321:b0:3d3:b02a:61a5 with SMTP id adf61e73a8af0-3da3a217599mr37266691637.28.1788813235300;
        Mon, 07 Sep 2026 13:33:55 -0700 (PDT)
Received: from hu-pooventh-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339af25062sm47841297eec.16.2026.09.07.13.33.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 13:33:54 -0700 (PDT)
From: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
Date: Tue, 08 Sep 2026 01:59:20 +0530
Subject: [PATCH wireless-next 11/18] wifi: mac80211: Enable skb extensions
 along with mac80211
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-smd-v1-11-65ad4ab30fbd@oss.qualcomm.com>
References: <20260908-smd-v1-0-65ad4ab30fbd@oss.qualcomm.com>
In-Reply-To: <20260908-smd-v1-0-65ad4ab30fbd@oss.qualcomm.com>
To: "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Johannes Berg <johannes@sipsolutions.net>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org,
        Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: -F2sLdz6_yu5HkwF_pR6BSwEg3AEiOB1
X-Authority-Analysis: v=2.4 cv=U+aiy+ru c=1 sm=1 tr=0 ts=6a9f1fb4 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=iJey_kD_w1PlP-9owF4A:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: -F2sLdz6_yu5HkwF_pR6BSwEg3AEiOB1
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDIyNiBTYWx0ZWRfX8U5mrTDF0I+K
 AC/jO+w1e7kfhjSO7NWOA3wrEO6mOYtmQCsibkUeZ3vDWU3CA8ruv0CbkvyqC71AJ/yjxmM+Nil
 eZBhM7LQnj/HI8hN6P7oUaOks721q8c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDIyNiBTYWx0ZWRfX5fN+Ki3D2087
 GD5Y9uELNbpljXK0e71aUyf3lNHkQjrf2RMp2RiD5mbRXIbTyLC/UtmNS0jjRhmbQU5Jc6miHVF
 FjwuIqVEEVnfPlgEyYSvHs5TDG/TqmpX8Wq8PtiP5GsKJCXx/0m8Bok7uyZjnEoiwDZYXwksboN
 KO+f9vmkWsFclPt1rvOHi/lN8MW+reSqrzz07GpwUwEEaiCpdAeyWfWy3rL+487kf/fE1ksZSYV
 1005uxy1WHOb9CwJd31BazPXydwvYVJKVhry1TJLcKatMl4m8QCnCnwhed5waHYCrpaAU/H0hji
 7bZZhVQUdfms4ZuaoMriqXzHgkJNtC+G/+xtvyJnO3B2Z6cvf+GOAlSye4VcSdBYEc7IykkIU4a
 B1jz2osGN4r38OfOLWkYygiPuUNW2nz3Pzn7yWZoL1bxmw7FPdbVW+wPUHFGYBwgwP0aj1ZzJk6
 h7zJK/BG6dug0ljvQdw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_05,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070226

When mac80211 module is selected in build configs, enable SKB_EXTENSIONS
as a dependency since mac80211 has started using SKB extensions with SMD
as its first user.

Signed-off-by: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
---
 net/mac80211/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/net/mac80211/Kconfig b/net/mac80211/Kconfig
index d6bc295e23a1..10d28985a1ce 100644
--- a/net/mac80211/Kconfig
+++ b/net/mac80211/Kconfig
@@ -9,6 +9,7 @@ config MAC80211
 	select CRYPTO_CCM
 	select CRYPTO_GCM
 	select CRC32
+	select SKB_EXTENSIONS
 	help
 	  This option enables the hardware independent IEEE 802.11
 	  networking stack.

-- 
2.34.1

