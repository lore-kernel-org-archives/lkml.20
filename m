Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794412212;
	b=YHJvyDWBJ6M1o/motA+j9C2BmoRpZmNBhCvNNlBLmNQgFxokyle+ktZHGwPPSLPF/AJx
	 jRdmR+lKD7EaX5vMbJoXEr74dZvLKpF75h9AyXpaYWeL8KBUoLqQ0vXAUKLVEiMQmNara
	 zXs5cyI+JjaG8kbbLJREi1P9oCTTgjzWlVwS+EYNqpcLtQntrv7MBv+fai0Xsb+/V/ApJ
	 5QlWEEPOy2Xck9lu31F6CV60xUEdaiGwlCcKmreFZFDLbqRl8qnBe2KDSmuZVOLM5HKBg
	 /L0m06E3BEMj3f2Pt37TBYSU9JhxiEhF6xIB4kIP4hhOqVKrN7m6QIy1BOLetLsW6OA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794412212;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 In-Reply-To:References:Subject:Message-Id:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=N8P34AsH1fiSX6jG6cafAhHs+En/eyF0au7U2Zb8KIg=;
	b=zF7m88Z8u0v3Zl71gc8FedG19BTNUz66B8QTSbEqrdSdxCU+l8KofpD6lcCYm0JYU5kg
	 WRYyfLEcIeLE+hFRrX6BEKPdqB8HFR0i9IhGr5KdBjLrFvSSOZlXbac9nmc10MHCYb76A
	 zoLOqvlN6O8s4I0kZTtsF+3UasHYPwhQkfSgGgMvBTn0xeF+6HwJfn6hTszVlCKRuVgH4
	 S5gpq+YcmO3Jgflw0HTXMwmSJxlPnyPW4drkmER+XHqvKw4BLD6qh2vZvXEbOMkoZo1Qq
	 7nLQAKmJ0X9S0mqbD/4CrO+o2a+CAV92kNvzJd0Lrh5OycB4VwnjFk5eXOHUGtFz/RA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ciuq+rmA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ICk9q61z;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 845CE606A335
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 15:50:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 845CE606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ciuq+rmA;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ICk9q61z
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABF0DsI2316119
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 15:50:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N8P34AsH1fiSX6jG6cafAhHs+En/eyF0au7U2Zb8KIg=; b=Ciuq+rmA2IWrsGYq
	5EEfbmBQvrDy3le3DRCW8QM8HFVU5mWWotthtXORhW0LoDU2fg3GowkZQhJ4R0Ev
	zfI6XFs2qnVX6wfk09982o9sU78248iD5NLnMeJP81R4BAqz5ZmKxW7WEMzYowe2
	f6R7sNp5EprZTCRoj87TEsiP/m4rai5wBiM10Qszz99UT6GHldVxqn0gzTAlOA2C
	lkvFUcdvKUUUKb2i+65DDsw3Qopstz7Alj/PxkmcQG5u59eW9+s2gc1fhUunUP/N
	YrB7QHmQBJ8R+2fsa5EVAwfY1i8DrWk20QFk7GP3Va9DHIOD1ZM4pC8QEaoQPK3s
	DeaCYQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvdrh3gxn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 15:50:10 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-341eff9e381so6661273eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 07:50:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794412209; x=1795017009; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N8P34AsH1fiSX6jG6cafAhHs+En/eyF0au7U2Zb8KIg=;
        b=ICk9q61zLYuNwFL9Y+YKEaR/CRFp5gHM93caXMCaALFhAYRPqsPo4ntqor5rIcY/LC
         DedgpZORRs8rgP0JHBogyOabYTa7MYGZfxInTAMbiEdIPSusywNCG4lufjEHxbXKYNRC
         pZUgvS8rr8F/E1/pkbEOaZzbdSNRWdJncNJNkqvxYiLlELzyVXNnBi4cZOJQDVQnBk7A
         qjSQD0rUmiFCYeykYgyDLMyZtOrR6RAgUXc5GjfxjUu6yDs3+aX9iZCELQQqMHSBB9KM
         ioo8nYwb0xHc0ouAbKXJhDMxQWEhhWd0d6eDJmorGSwQLyzyQ6w6NtShhhcwgdQf/lBR
         3WUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794412209; x=1795017009;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N8P34AsH1fiSX6jG6cafAhHs+En/eyF0au7U2Zb8KIg=;
        b=oBjv5XK4MVlCjcK+gw/1tBM6q1SMizNBhmOYh3sBt3Iy9iFXE/m6+wTMFh5xtVHbEG
         8ep5x2OZbgve14ZhvSCNpQYDVccXiylX4u5G2ZpWifMXOES84F7/27Q6wpge4/mb3XSO
         gRySfMkJqzbN7wja1v9hPVSEjfK57CP8mYsqCN58Jk5xFcRKq5+8KeLXDngljs85geeC
         XqQpNqCrwKWiEwwFWEUejnEqO4vr+mBCD7bZoBsNXOeQoGc1Fsn8/B//yByKWV6aGavP
         dKocIuxMVlCMexIJQwce+CgmPw50NSZb2jgRJA81wJ0XikakAQtRr5h+VAxXVHaSj1cx
         nLHw==
X-Forwarded-Encrypted: i=1; AL+hErHVNhJ+viULlO2Ol4m3hIjDUGdYoTLLmRN2r2DURS/WeHeG2uhkbj4M1FhC5kSQGWanNRnMe17wX0haF7Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z/P1y7yy9Wb01tdDuVYvDhretSieqkcQNvWtH+JtL0zCUB4kIIF
	sNNidFcqiuvWJQJgSiEa+hfzaqF2Agz4t63l6thg5xsNXpP14vI2y4n0oHOqS6AzrE+zO8hXkZj
	fStzOHrRn6UG1X7GIcZirj+nKAaXJlRI/WiMduswMKDnKVdNvEcsXZtq+5ogtcJA0UPc=
X-Gm-Gg: AYBFou005M5wkM/Xu0wraEKDBAqE+Nok1NYmrskbdoOjym/FKZAajbIF/K5MgcCODw9
	JPEAEivuseTDV8KStvj8tpyIveXCL1XIqcdVPO2BWAUcc87WJa8JEur8aa6CK4WpeSWC9nlknET
	Yc3878DLppHKetLMiTzQTN4N1HK4FCvrCCWQk+1tG/qf/ogDUZKqYv60XY5hiBMRRm996GaRB3g
	N7OZRNJL2SMWG/lVMb2mJHWjnfPEz3WxcCuJC4Rw1cqAb8IiE6YFewFK8e2AjcQpUGi16OtjG+O
	iDR4Wlvzan6CdtbWsSpTLsvlcfkXyYJP9DCfrSzvI0XiwuDK0UsopRrgrJFAoxb7/F0QC1VqJA3
	htu72ZZ0+g3G0a0PhSVlknhsVkvFyGc/cmZLIgnZjziDlUyBocK2OBwPivghu25b73txWQNVcmy
	/7Dl0+BZr1qpyV9f4nFXolw2PBdxE=
X-Received: by 2002:a05:7300:f3cd:b0:369:1401:c5c2 with SMTP id 5a478bee46e88-3768675d71bmr3049527eec.26.1794412204116;
        Wed, 11 Nov 2026 07:50:04 -0800 (PST)
X-Received: by 2002:a05:7300:f3cd:b0:369:1401:c5c2 with SMTP id 5a478bee46e88-3768675d71bmr3049347eec.26.1794412198788;
        Wed, 11 Nov 2026 07:49:58 -0800 (PST)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375218c7c50sm33704924eec.29.2026.11.11.07.49.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 07:49:58 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org, Paulson Raja L <lraja@qti.qualcomm.com>
In-Reply-To: <20261106-eht-ba-window-v1-0-622f2272e582@oss.qualcomm.com>
References: <20261106-eht-ba-window-v1-0-622f2272e582@oss.qualcomm.com>
Subject: Re: [PATCH ath-next 0/2] wifi: ath12k: Fix HE BA mode and extend
 buffer size for EHT
Message-Id: <179441219793.2984996.5664366595622303300.b4-ty@b4>
Date: Wed, 11 Nov 2026 07:49:57 -0800
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
X-Mailer: b4 0.16.0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA2MyBTYWx0ZWRfX8+tGYKf38E9Q
 UhuvXrVf1BZipQeQDaJigcIS9zgPQLLw+4XsBmvxS520ITtnlhMD9ezxaYdyGeI30UuKmUFUXjk
 NtxVk42jxB1WtvGlehYnmrvtR5jT53g=
X-Authority-Analysis: v=2.4 cv=PoQG/AM3 c=1 sm=1 tr=0 ts=6af48eb2 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=br1bMFRRbvRTlr3IKzEA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: xTCJJVA4kFrjHsMxR-eAHhPLBciQTm2k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA2MyBTYWx0ZWRfXyUy2h227nudw
 wpoeIGOJV9y0maYIxwzMbmxA7xybVF/jUuZBLH1H53b2YNkc/rzIkaZC5n7pRokrMyg3k91U+FD
 BmgN2VmZBoj60RQ+DLN1oE7GDSmvharKqogH3wDm5tvz5eSMWVz067NTTGkyJbh+sN3Awn3+ie9
 oBItsG0CZCvKyCkYTtAtj8OHQI2euQJreXZ/eixCeBqt0Ot8ilFXoCxeM14DWCkIG/E0JL1X1m2
 b076kGeUDX/3JirtHTdDUEHgj3/TmIpPi1VF8v5AI9hsYn13VMzGfIH9XkvfvxpgMwCTbebe5HJ
 OLqkfJhvb6EHCiFPEwQllhznhQ1f6jZvr5nK+91O7KAiKbUZ6Y7a7v8TE5iZXFlxLBmzXcN17hX
 l4eyuBMYBWaIw3/V2Y15JijwpDMLrO/+yIJlJWWeLYa8P5MGOs6k0EE8k58LFBNbjtzYFvGeLpn
 jhSyTeHI6SZFBpEkJVw==
X-Proofpoint-ORIG-GUID: xTCJJVA4kFrjHsMxR-eAHhPLBciQTm2k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 bulkscore=0 adultscore=0 impostorscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611110063


On Fri, 06 Nov 2026 10:27:41 +0530, Rameshkumar Sundaram wrote:
> This series addresses two related issues with Block Acknowledgement (BA)
> configuration for HE and EHT capable links.
> 
> Patch 1 fixes a bug where WMI_VDEV_PARAM_BA_MODE was never configured
> for HE in AP mode. The existing code placed the BA mode configuration
> inside the he_oper.params check, but mac80211 does not populate
> he_oper.params for AP mode, so HE AP links never had BA mode set.
> 
> [...]

Applied, thanks!

[1/2] wifi: ath12k: Fix HE BA mode configuration for AP mode
      commit: 9b4da51a7d78365d920a10791ff216608239892d
[2/2] wifi: ath12k: Extend BA buffer size to 1024 for EHT capable links
      commit: ff4c7359e310744a7abe53cf66d921fa2969eb19

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>

