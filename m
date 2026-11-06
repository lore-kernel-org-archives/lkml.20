Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=148.163.139.74
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793975651;
	b=igEQIQQ/1oEbKrbUeImrcIoOpsHTe0mdWgJuN64IK/L0SIPrmKjWWKNwmcUXaMAviAF5
	 hypEH+bmMSOjzMDM5iqkkXzjpjMjO95Ny6A4yD6QPebIK7kKryjuGMyc2TYe4C91QUxpn
	 9Vwzobm91yZvBBCJg+ACn5t8xFk2ttn5qXzqjZ1fxd9aXZiK06sGbc++ZqZxHgR2MjJhf
	 ougbU+qJe2wvAHbyJr/AhjN7+ZZue2Y+vR4snVSSm+Uo1fB5OG8D2ocWfAV/s7OuxE2z2
	 dckrPzxh8g0FKk9ltHqMAy0IBsaO7rWUZ6o9S0vJA/8M0raBObaD8iMUCTa7U6BlcTQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793975651;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=6NEDxCP1xlNVWbzDZl40x2kZVNRASxcVTF174olVpag=;
	b=kkPbryh3moWu0FyuZdNOF7d5n5XwzygWsfFcUyUfBGNOrvB6Bw4vsw7WdiMksPDSxOLy
	 +udDKUmcx+OQ5+Xzl66WmpP61Jp/kFcNphr7+Q9Jef6ZMwoviBPunWJKgoWJOwOhF/uEv
	 iH0JcYnI3IVJFscEv6o1jcQD5RHpaBj1HzydwfAcvuFbpKwJADVVKzx7wgh5m8EfJsMFS
	 Kj67+v4qoYxNrGbExtZeFpcCZeKHEF1PxXkgWRu+JCdNYWrnZNlwaGtnO8E306P2mLsBm
	 eqQrzBp6wsxahZGJApI7YaTmfh1of6QHR4wRfeESF48gFMhKkkTOrbxw//En9xqZlLg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cs.columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=HB7KHfbr;
	arc=fail smtp.remote-ip=148.163.139.74
Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D905606A32E
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 14:34:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D905606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cs.columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=HB7KHfbr
Received: from pps.filterd (m0167073.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6DdJ4K1941032
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 09:34:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pps01; bh=6NEDxCP1xlNVWbzDZl40x2kZVNRA
	SxcVTF174olVpag=; b=HB7KHfbr/7te2RP8UOwHGzPddg5VJkjPEiIbnJKXxAtM
	/1arVxL+0OwLMHleTH89/y0TkcJrzfL2pcG7nqNuBJUuUWGO6Vr467BpZ5k+KRXh
	e4EDEr1vfgtpwAJGILC97fAMPf/yKukD3d1B0qULBP6FIgWnLBlVgoIavrpQZgmZ
	ql1N33Fw2cBBclJ2RFf2u9dFdxfH7Vk3jNKsgkEzkpINJMWLOJNLONnRiwf6sDvw
	QX8c99pRXGWpNYsgKnpWLMQoxskExW3Nyq83HtmG9WqgdOKlI5RvLj/WOtEfe9Mu
	HBSl991SGWtJoCHM3WMi40KDIJI25LsRXMSpp8dIaA==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4hs3pbucc6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 09:34:10 -0500 (EST)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-8b2fd108b28so9076377b3.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 06:34:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793975649; cv=none;
        d=google.com; s=arc-20260327;
        b=lMgSslu/cD8V6Pa2YOLk/VOGVkTruIBb40TKT5qyzI1nbPazY7UaJViUj+rboy66jK
         yoJowOAd3SondNVnB2sBLznM5jZ41dQbJ3T9O1IlIhNlBU4RWqwvDkeppq2yDGLno95T
         13QC0zDYyjktATvX7OB8Npxi4VNf/G0qzPGRYJTNq0cstOp7B637fT5K04qgk3zncb4j
         nA+Kvnpsq1TeiyTjykx3WHccsSZY+/bMegtCNeCjfcfOLDWaWwJljfAKwsunxpSS89jo
         3ksH2A7jxb2ZjDg/4q4YCY3dE7NbR4YtbEe7SuWTxTHy7yqcZc/dVdB1Aqe6DBy7yMgw
         wiTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version;
        bh=6NEDxCP1xlNVWbzDZl40x2kZVNRASxcVTF174olVpag=;
        fh=Y3kIn+hyYUMdmM/sR4dc2FXK2y+nz7LhEJ8w8nbBmLM=;
        b=iUTaUfmfa3gFMKMajLF7cUiWiegvut7fbh+DD7QNPWY9UQTwxxLDXq2EcI3P1pcaez
         JQ1WVOXpVcHlN9M60TP9x7L/vIyTzp1Y+q2DSxWLtyAJQqHxPlu9m4yHaqqnomiwUITT
         Sv3Uow9cKGeJPaLol/JLZAsNj0wrct8WVbgN469LRZaSKBkIVveNTJpVkw3XhnyJt68s
         h9uvKX/pM6K/1bAijVMPUj4db1JhppafdOU8Nec3K/T/sIFGPcT31O3NSnNk2Xpg8pPh
         9/e5o9dOlFBqKT336UlFRGmnoWq0/ZjLmW2QY5/3+autMZoEOGClbULw4iKZZyDd+huX
         +mTQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793975649; x=1794580449;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6NEDxCP1xlNVWbzDZl40x2kZVNRASxcVTF174olVpag=;
        b=VItyttjc0PXLJLgP2ZL298wWD/a1w1ma0ZCAirU1+6T6QgTNdx/dBVs7qFrY7wXdxC
         zk3b2OyIStSXjIkaVwcxQ9NxUKAkXTFDj14tcC+3L9xJVXahOvJIRxvsP4ESUNqbGaFV
         6NN3lLnc3XqX94yDnoRYwzO8DOqxk+IgBnwQFLeYmAPIhfOEM+rZKejCx9EecIiTs7cr
         /p+JgfhZ4mY9Nl0D9C2b8GL55XHzG4DkCkVUUHmEs/vH6JG3E/FxYEAnqKK9hkVy2tVc
         Cqy4Rec8qAT5mf5rNs3fZS3TD3hdV8/ARibGM0Ih9G2OtBuKE5e+HqA0jYMZgQF3RT6g
         Bs1g==
X-Forwarded-Encrypted: i=1; AL+hErG4WMxxKHa+EOJjHodmB9I6R2HwHrMnLrcsRt2gG89r7Yiu/i/14ehZVJVTvlph+wYbBccYyWuBwz6sSp4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8UtMXCQI9hh3j+d2BktoVZsb8PDemvLbwDfb6XKgktlgDqAIDa
	Dsr1V9r/Blr3t+uuFWZBz8rFq0pjVkZLLc8vw89TbPRB83BBB40oEmJOhQ64ZkzjxpCYh8MzMvK
	UbUg3x8pqqj1TUYGvAo6ejSC5Quh3yrluFd4NUGvx1k+lc2GIVFyk9Ls2ITPM5EaQunZ2PC7dSw
	AvT39sT1eqncZnvxRYikBwcxQqnK6NAww6nW/P
X-Gm-Gg: AYBFou1UsYYnksNNGLHq3dDV/VTqlBKNuN1h+hbwzPzlH94Pi4J5OMVlLQzHvq/xaUP
	X9lo3ZJmuaplkyil25OhLe3e7ZNepU+AtrBNIe2bYzplC7Nub5EqHPTFSadCF2kJcLJ2tdOixMY
	vf2uffivxCa9+enkg7LgDrom5zH4/QBdod0Bosw26/kItwPXLpX2kumya0QOMnSGjlXtdyWz2ca
	9pwhpCVt/+337dRQGtKY+4ydQvZ/buzmMmUb0HHOI1GFyaPEBBDyiyVyipnvEsDeqlvm/nz8/Pd
	9uz9InCfRZj02Jg7zeo5jXdkbwgYP9vZrw==
X-Received: by 2002:a05:690c:6d84:b0:8b3:4729:a9f6 with SMTP id 00721157ae682-8b34729f672mr7082647b3.78.1793975649565;
        Fri, 06 Nov 2026 06:34:09 -0800 (PST)
X-Received: by 2002:a05:690c:6d84:b0:8b3:4729:a9f6 with SMTP id
 00721157ae682-8b34729f672mr7082497b3.78.1793975649191; Fri, 06 Nov 2026
 06:34:09 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105-hyp-pool-and-map-v2-0-44a6ca90190b@cs.columbia.edu>
 <20261105-hyp-pool-and-map-v2-3-44a6ca90190b@cs.columbia.edu> <CA+EHjTx-X_2DaO6Yt-AHsP55SFWjz_EYxEr-TB9WSN-ZT+d3FQ@mail.gmail.com>
In-Reply-To: <CA+EHjTx-X_2DaO6Yt-AHsP55SFWjz_EYxEr-TB9WSN-ZT+d3FQ@mail.gmail.com>
From: Xuheng Li <xuheng@cs.columbia.edu>
Date: Fri, 6 Nov 2026 14:33:57 +0000
X-Gm-Features: AclHuK-Zp8N5uQ35n3k4Ff40s-dY8xGBlNZLkKpIQ2XYz2iYHmj0YH4-CjtoP6I
Message-ID: <CAPOPQMB6eU0MYNewcq8HKsEMchwY-X3aT0Km9uULBappFWZcjQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] KVM: arm64: Don't replace a valid hyp block
 mapping with a table
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
        Quentin Perret <qperret@google.com>, Will Deacon <will@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Mark Rutland <mark.rutland@arm.com>, Joey Gouly <joey.gouly@arm.com>,
        Steffen Eiden <seiden@linux.ibm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Zenghui Yu <yuzenghui@huawei.com>, kvmarm@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: 0ELFjhXIHwklwDCzi9ZUb4YvtgBW-IYl
X-Authority-Analysis: v=2.4 cv=Jt5kP84C c=1 sm=1 tr=0 ts=6aede562 cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=jHxIr1HyPKZ_Q5_91PL3:22
 a=wP-KkE5Gt7gKT99KiR4A:9 a=QEXdDO2ut3YA:10 a=MFSWADHSvvjO3QEy5MdX:22
X-Proofpoint-ORIG-GUID: 0ELFjhXIHwklwDCzi9ZUb4YvtgBW-IYl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA1NyBTYWx0ZWRfXzM2bVuZc3pbr
 9/nfZzKWkuZ4BPQnUYqojH+28wF0z4Z+IvoZoOSc38WiGu7ybB/LOwgoKnV/JWcLng78MZJQD1J
 55SRQcI+wG10ULFoOoJ7KnDHEWmvSOvVI55YInEaZpOoAnHQ0ljy6VFGiVhSClttYcccelV27RX
 Pd3xKdnn1CBWXYx+J08U5+IPwdE9K/JPpfDTCkZN0tPkLvHRJ3HTdIFXvmX/+S3Ke+69H5qX5jW
 NLboNEaaqZp8OPg82gCdlm9t4Ol8npifPhvrHnu/FN0FeMOTpU6SbAptUYsh2zNzjmARm93PrKz
 9KffrFgcvq+kIYcwGzpEb8Y/Dn+0/ub4cO+bA+SbkZF8V3CuT4gkorA0vQmHFwRMugb65RPdfZG
 G3I9XecgXHs/5SVWvcQ7Q45bdaPolAq22AacjF5PxYGG20dXD4YIFVRGwuWpv1v3hvydEBAkHj6
 mO+oi9HTutDobxT+PjA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA1NyBTYWx0ZWRfX7ThORvZB+R48
 3GdYZJF+VocWpXJyeDeBaBpj8tEJnbvs831yZ7kGv7OYHT1JrOfKvWD431vgVYkxNhwRkYl9vMb
 4UO90MhIy6VYk9Znm4h12bRP/w+SXPJ62rVDuBHHlJrQsV7459LF
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11957
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 adultscore=0
 lowpriorityscore=10 clxscore=1011 impostorscore=10 phishscore=0 bulkscore=10
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611060057

Hi Fuad,

On Fri, Nov 06, 2026 at 12:03:29PM +0000, Fuad Tabba wrote:
> Could you mention in the message that the WARN_ON() is fatal at EL2,
> so a caller there gets a hyp panic rather than -EEXIST?
> kvm_pgtable_hyp_map() is already documented as rejecting such a
> mapping "with an error and a WARN()", which is a better reason than a
> future caller.

Thanks. I'll reword the message to say that the WARN_ON() is fatal at
EL2, and point to kvm_pgtable_hyp_map()'s documented "error and a
WARN()" instead of a future caller. With patches 1 and 2 dropped, I'll
resend this one on its own once reviews have settled.

Thanks,
Xuheng
