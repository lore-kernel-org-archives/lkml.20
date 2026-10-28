Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793201005;
	b=s5GFZSn48ccrtbFw4ufpDVN2EL3rEFtKkuaqzRn464QHVEqv3N8C//VM2ySumc0aikEN
	 bRYpPR6CXY0kfCWoRrOx28b6KPfnqTBxHXMmqXEfVIATQQ5H4mfWledVx42l1b+RIwQt0
	 zvbvqvOVP7IeaRNyYds7XoIHJ3bbja8yOA+nNwL0g0rJ3WqZsB8ZN3IcHhueKLCQvdtZ7
	 4NfxRVKGkiwah9rZFHL7T5a5PQ/IZErauEE56qL7ChBM3XQucU8GN8v5E2LM6PwsNBkuN
	 DdBE0pRRlABzGxyr6FT9FsUJE1vrU6pSXPOV/kvjE7tIm3ZvfmKvRsYj0miFT0RukXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793201005;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=aBelgQ2axZ8OljStpB0V7R4f/BHUvEAk/em8hk60sGQ=;
	b=CgWZ3htjews47rzqP4dcmQmiixxbBM4Md3Ezc692WqZuZZiMPRlx6Iw48qFuWwnVcYGs
	 s2UKQwmH71aHGsRb/KHZcZudVScS1Qqv6Q4Cdztd7yLmDE3mCURm6dRbxY6ZWHD487qgi
	 tk64M/cotfCB6zBX7zk2Zll8iYFqIs904sAqZGt4NrH6C+bRhX/6dyFKogPzYBIZ3BD+d
	 RB1hRqiFmFKJyAtq1XCYECmVlxrihkYrtkioa8+HHXVfqAISZWckX8e0G1WV2yuJjt80p
	 1IXGS10Viqg9bCM1JjdGD0iAXdw+aCUZZbBw6Rw85+vdVjyrA4dx3XGb/OQEp+ycDEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="fF5/tBhl";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PPiLyP7N;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D8B5606A325
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:23:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D8B5606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fF5/tBhl;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PPiLyP7N
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SFAk0C1517066
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:23:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=aBelgQ2axZ8OljStpB0V7R4f
	/BHUvEAk/em8hk60sGQ=; b=fF5/tBhlYHNmknYirP1RwqLXjuiPuei/yEWbeLH0
	eifm0hzbvx5LJrR3obu2IfRCqLGwMHNNAE+BymVgagfo1WILVmKDUZiT63ByNEmC
	50hZL63FLcnqOLNY/Mi3zMC4QxBKZipvOAx1lhJJyaKWFHMvFw2RM2fD/aDmM+P2
	L25QxWJzApULEOl7i7no5d9Xa33vjO6K/pQLxxpJJnhmstd7fDYlOboAbPE3N4Ba
	kUEqIyWnXTgAPvjvxSExFlqDydWoI8RYldPSzVhpLaH1pdXcue+HkNq/2w+Dji5p
	EJ/pyPUg77DyHXX22517Wv7xEIk+4OVgLH5/Eyp8BriIKA==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkbhwa3p2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:23:24 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5ec17386b57so1012847e0c.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 08:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793201003; x=1793805803; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aBelgQ2axZ8OljStpB0V7R4f/BHUvEAk/em8hk60sGQ=;
        b=PPiLyP7NpmrJn/sHc0gWj5IivUUiw2kal8eX9o0x6/viqDugMYe0Y8is01liuVCTWd
         0/866JqDG4PNMw5LdpYNtXtWXt3JLFwTqD5Hcd1auEkVoCEL77WEpy60AjGTgNZaeNit
         EE0eakdmgSdmH+BrsYcf0MKiG2JEFTZxYd8FMkBrAd+BVv/fyG9XGvXGldQQ+czieBeT
         NKZlHppwU32Q85GQi7C0EXGMAv+Qns5+z7WDEiRbF0RGDv7yKe7ho9ZqK6IxXTzbdm0i
         9II3exC8vl1NnEhNAqzbf7nQPPO9JkZqvisSFGYKnu0u0ObjORw0dnC0t7dp/9vOYSsO
         9J/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793201003; x=1793805803;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aBelgQ2axZ8OljStpB0V7R4f/BHUvEAk/em8hk60sGQ=;
        b=Xyl2vHKjiZwp7s1nYTe+9pRpPkDNQthFsapi1KimyheS7WxZkQefvYQcIB/ojNeZOe
         l2sOBsI1HFeY8b54MvkPK00b5rbYcAMlxgxg4qQWRlclTeZ2eT53GtSCpdS5tdVWwO3d
         HyxV/YDOOFAkEjxfD6ELxiyI54vVchd3HMS8FS8L1+Nrw2t+YVNDRrttr5DPu4UyqQeV
         gSHqT11SA6SV9ZrlrE9hBjKzRqUarzDDlCgqrnaz8l6285//8qwFGskRrFOK/9d9Sh47
         4pnp+oiNDogYWwuUM8crKFJfppyV503rne0f6IqtwfhI/7oU9lWFyRb7RxPfFnw2IzY3
         5wyA==
X-Forwarded-Encrypted: i=1; AKwUvBwln6VK5Oe79wuPG41Jtx7CQpRuNwTkA64V0bE5C1mmJbmYUeT0XqvQqyMiG+c7lBlY5ZCqdr0Knv5MRjw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLDPkM1MIK6tTgLp9+MDVbXs680/T4pyK7538ekkACAXHjNWiX7
	LNkeDbNLGUNpH9B3ctiOANazQSmuKy2EwYsKKVKwXn4Z2Phryrx1d1GVPXLG385OkmgfHj9dXdi
	7fAK8mgVfmzIOoXpjVkQbhPNYWow60gaR3rExnPCZ27kI9lgLXxqpElcLc9ifKPbNE7sbzVNi7A
	c=
X-Gm-Gg: AYBFou33Lyeisz5WfNs1Af50IgVRQaWMZ98N5yRZZ1Cmc5n8RPWh5+vniO/2NLLAWHA
	WwjE7Me2uouSjkAq2lGCgoWK+Z/SxsVa7HI1ngApeRNA2Lm1ul5IlzacdX/E27Ob7vCD8IK7Otg
	TX6hGmRty/++u02j+ofWWtoUdb8tYxwbBCkIJwldmmO8veeLJgkLFRCOrX5vIu0e9Rw+PPlwKY6
	Ye5ffMd+4lZiynDJ90jj9wkoc0Sof2Z1f1uaHY5hhe4xgysITIfmMYTjt8/b9wyF5aFtEUyeXU5
	K0fSaGOVvuJowawK9IjBi+2L1wgcmLUuiXNtauxWimcHKJzPkuytFHNmXpFus1GqDfodjhxa9/v
	YI61oDyDSnqbsF2I6/9Dh/PwQjCCgIkSTkX09AXPdtngtzegwC+hZklWp90J4hI+hLg==
X-Received: by 2002:a05:6122:1828:b0:5ea:bea1:706c with SMTP id 71dfb90a1353d-5ec4ccc01a6mr1578231e0c.23.1793201003194;
        Wed, 28 Oct 2026 08:23:23 -0700 (PDT)
X-Received: by 2002:a05:6122:1828:b0:5ea:bea1:706c with SMTP id 71dfb90a1353d-5ec4ccc01a6mr1578158e0c.23.1793201002562;
        Wed, 28 Oct 2026 08:23:22 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e412cc164sm27389589f8f.7.2026.10.28.08.23.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:23:21 -0700 (PDT)
Date: Wed, 28 Oct 2026 17:23:20 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Albert Esteve <aesteve@redhat.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Sarannya S <sarannya.s@oss.qualcomm.com>,
        Pranav Mahesh Phansalkar <pranav.phansalkar@oss.qualcomm.com>,
        Sudeepgoud Patil <sudeep.patil@oss.qualcomm.com>
Subject: Re: [PATCH v5 3/4] soc: qcom: smem: validate private item payloads
Message-ID: <5tbrgfpjpo5hqlfno4kjhmxoxksujmrwgtelw5qar6mgk342ci@mwtbajdqjfzq>
References: <20261028-port-smem-v5-0-121257d490b5@redhat.com>
 <20261028-port-smem-v5-3-121257d490b5@redhat.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261028-port-smem-v5-3-121257d490b5@redhat.com>
X-Proofpoint-GUID: sqUyuEx6_7VN6bvLrRRD3SLgiwFu2LI8
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA2MSBTYWx0ZWRfX7IplGxqMov56
 BwH/OQxB+z9ZtuLISagsPA8dkVy8jXiIv6BSnNgKylTm3cTPhoP27Kl0pJq0upoNwywiC1pO7Fg
 6ji/PcXqRlOhikqRkC2jVN+jFoPGxbw=
X-Authority-Analysis: v=2.4 cv=V+joQuni c=1 sm=1 tr=0 ts=6ae2136c cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=20KFwNOVAAAA:8 a=mk29NWWDdjAKazUUNzEA:9 a=CjuIK1q_8ugA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-ORIG-GUID: sqUyuEx6_7VN6bvLrRRD3SLgiwFu2LI8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA2MSBTYWx0ZWRfX0TOMkWEkP2jw
 mlvp3vaeYVMLaSJMXAcgTiM97YjQGnMdepID8VUe8X/sLK3NqApc3SVOTMMswX6Z2IHjrOQIrF4
 IsgesHdtsa7IV+/ouN30hKgtwuWD3oAjdYOk8S07soeODsYboV+fOYH0JReNjdCUnv0QkJk6ydw
 vWo46KYC/4nCISduuG7s89F1n07VB44OcL4pqiRdRGAP9DLmnKQKHW6fDSfVvTzC+Hq6meOr5bP
 EngA4/ZjwKR4GaS7vkgSaV/x/3tV0ckIoGBF+VFGTgB3WR/RV1HPzwuj2L93chZQC0IsKUb+6ld
 zZMoaDcZYQzY0E3GO1ylb1z7NoV9L4UoZrMtvb/j2rj94q1tL0jPWFclJCPFkoRkW0hkcgjHMdA
 2DezoiK28M3RQ5dtUB86zYDIuNH/bFTYt6qAHYLyeEyNVFXo/ZvJrHs0jOLsb+zG5S3Gz6irVS8
 2+Xb0BldFjpk0J+8hXA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 clxscore=1015 bulkscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280061

On 26-10-28 10:33:50, Albert Esteve wrote:
> From: Sarannya S <sarannya.s@oss.qualcomm.com>
> 
> Validate a matching entry's size and padding even when the caller does
> not request the length, and check that the payload stays inside the
> same region as the header.
> 
> Zero-length payloads are now rejected as invalid.
> 
> Signed-off-by: Sarannya S <sarannya.s@oss.qualcomm.com>
> Signed-off-by: Pranav Mahesh Phansalkar <pranav.phansalkar@oss.qualcomm.com>
> Signed-off-by: Sudeepgoud Patil <sudeep.patil@oss.qualcomm.com>
> Signed-off-by: Albert Esteve <aesteve@redhat.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
