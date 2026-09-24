Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6574446825
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 22:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790289418; cv=none; b=hdkme5R/n8BCcgMfrs1DG/vAn9CtsXE0ui9koC/sDSoNQ9y1PKEyyvLz/cRFVHxj4dUDmkjAQpLN+JvKQZTLAMxmUUnOxmR+j0KoudbYDpVjGIlrumA5y9rOcOEHZI9j/eWfxCCWbsodf54okCKWWnC/1Pd3p6rE213ZIpwHRrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790289418; c=relaxed/simple;
	bh=JknbI1AFX3JEWz9ZUQIuWwBQSt/x+hCytybGhyddOQE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Hmsa4/8uJ7ZkGZ7+F7CON2EvK87Riog1OjcdktzJsPSiLj+s4mbuhObtvOoIv4FScHqoKWddztB/XBPZAN7sNfK3jimf/tUBoBeAgyjikb6QGHJTLgCYTUheswufeP9NrhVZ86U0E5fZuzE3tI8UwhVovGzkJ57NcIVhEfbDdA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PlUatk1n; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Is5dup1M; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PlUatk1n";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Is5dup1M"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OMP3kX3467102
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 22:36:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s/xSqJlOl7EjdT/3t/l47+j1hr0vJTFvoJBKOwjDyj8=; b=PlUatk1n41tAzO1B
	PX1tOR480nktBDvXyTUN3Mch0LXudLeEAIlNhVxDbhygxH86COstmPZ3gjNoEbJl
	EUR8R35n2Wz4q5Ai2bh+pgYArUFRrY9puwtnMFAZpo+1yNIySROsTD1g9RPUqP4j
	seGbeU09R6Y3y7FmKgw4j+VtFbLGaHMZGrMszydloTiV1WebcdRGicYs1DoIv/tg
	X3TltJWVj/O8cDRNua0YU8eRHIvyxDDkLP73/P5YKXd8HvuXudezBWx1B1fJgGKh
	WaOCODTUzYbTGjBuTX0q4BkQKY56op1Yp+B6uHqP1gatpGMHKO8IdL3EFd8ZFqoH
	ioIIGw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw4652abv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 22:36:55 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-333543ac378so296868eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 15:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790289414; x=1790894214; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=s/xSqJlOl7EjdT/3t/l47+j1hr0vJTFvoJBKOwjDyj8=;
        b=Is5dup1MrUdc2ioyKl3GJi5uIPIiax7FC+NOjR/UXRmHlC32M/pzuufsnpfny2GV+0
         Hvefma9n2TIhfs+Ieo4oyJ3YNpx5Y0zBbj8da0XN4qE2iZA01yehIPyFzoCAH0Y1OQzF
         O+NdSo/ESzD2h490W3TUiPKp/2C4MV18SW9csEO+be9z8rBnft41QCltL6bJBMWCeoxS
         7LFR3JknxqHPvku164bnO7JKoi2UR9GsSzBEkZrShtbFoVubrSfjIbvZubA2Vbflr4JT
         p66mhlRFgIWDsg03Q+xGcKfK9Y3qXBWH8xVP4N++nL1qbLYzh/2k4FUNu/vBiFYwiJH9
         6CJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790289414; x=1790894214;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s/xSqJlOl7EjdT/3t/l47+j1hr0vJTFvoJBKOwjDyj8=;
        b=UxheQs2XY59iEqrTo9FdsGoQQw7HalvcE7SWool6r85XleMtimMzsv8VggBSv/w/0P
         uzySfTI3P1/C5ey5Wdf54xEExg9CYtBtNY7fQcDnpb/jslVB9/98lhy+A9XAHYphu45O
         oFHV5Z1TDPIFvHGWA7aOBzj0ivuTadlFZdO8l3ATKFyKOQZUZ+alnFi2bhYSeuoHCUNk
         8q8DEm0o6FA+SOVxDpfeJ7vQ22zmda6LWux7ZlVcokCaIj8Q/OPv9ehU8nNAcUX9wlVs
         mNUlsvFhY9ZTef70semi1+HyCT87ErM7r2yZyCe3ROTJ4kx4E8a3qMxCRHDgh1vKlWEK
         xxmg==
X-Forwarded-Encrypted: i=1; AKwUvBwGTRhVduYUso6Pk8db1edAv2xDAJduAONnSpj8oaV1H7C4WY0iFyGaNPgBNKmjXQUnL1V14claxBQIuz4=@vger.kernel.org
X-Gm-Message-State: AFuF++mxVmNvDSrSIvKy16MYjyfJ2TLSvDQ0VxwiHxHNXcrlxY6zmPaB
	32o25QnLWzwbX+HqNiUVKd2WwixxvtpKh26QBBhyLhAOtrj1H1Xd15zeNqffWt8bYdm78S2yh0c
	xuW7YsOOcNYb+ovS5IxZmWMb6n9Y53APD1ZWKLBNdggR6cItvd4h85b3DJZuwlOXqZ6I=
X-Gm-Gg: AYBFou2J77tUbx1ZeVaqLyZ/r4JZUWJ/4mJm/RzC3rIYQjFZx1iEDA6oIYpRW+e75OX
	lJ6z7CaFllgsO3j9CiPnLJWpFkUaK/iWl5dALTjnLeJS4MN+bMaa8bzA24QPKu2LGpeUHp9amul
	dtMddkvFzH6vXBgQlfpgAFL2XtaJS2bIARWjnUMghKqivBUfDIpHci8otn1XzryQQRmkF6eXjDB
	IUWDLmYjrr+TZLn0QCBXv1t6cxUpClTRmhCYlZQSwbjcczdyF4G2UKStTwu0xfPpTqCPOrbzVSZ
	pAXhro777VJFSK6nbVqP/kiFWM8Kw7vzsUATwHxP/YzqM78eyhh4ZI9LpxuLIQtXUepnPKVfGJv
	DqVgo5KMZyQF1eHyFjEELz0Omj65WenXb6u0jInVHHnGb/quYaKAUqw==
X-Received: by 2002:a05:7022:b042:20b0:128:d20a:2f40 with SMTP id a92af1059eb24-14503fc0c9emr3358122c88.8.1790289414064;
        Thu, 24 Sep 2026 15:36:54 -0700 (PDT)
X-Received: by 2002:a05:7022:b042:20b0:128:d20a:2f40 with SMTP id a92af1059eb24-14503fc0c9emr3358092c88.8.1790289413429;
        Thu, 24 Sep 2026 15:36:53 -0700 (PDT)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145ac67c505sm1379403c88.5.2026.09.24.15.36.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 15:36:53 -0700 (PDT)
Date: Thu, 24 Sep 2026 15:36:49 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Hanjun Guo
 <guohanjun@huawei.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Catalin
 Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        "Rafael J
 . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
        James Morse
 <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>,
        Reinette Chatre
 <reinette.chatre@intel.com>,
        Fenghua Yu <fenghuay@nvidia.com>, Jonathan
 Cameron <jic23@kernel.org>,
        Srivathsa L Rao
 <srivathsa.rao@oss.qualcomm.com>,
        Ganapatrao Kulkarni
 <ganapatrao.kulkarni@oss.qualcomm.com>,
        Trilok Soni <tsoni@quicinc.com>,
        Srinivas Ramana <sramana@qti.qualcomm.com>,
        Niyas Sait
 <niyas.sait@arm.com>, Lee Trager <lee@trager.us>,
        Ritwick Sharma
 <ritwick.sharma@arm.com>,
        Gavin Shan <gshan@redhat.com>, linux-acpi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v11 12/13] arm_mpam: change MPAM-Fb error IRQ to use a
 threaded IRQ handler
Message-ID: <20260924153649.00001584@oss.qualcomm.com>
In-Reply-To: <20260924152739.2865510-13-andre.przywara@arm.com>
References: <20260924152739.2865510-1-andre.przywara@arm.com>
	<20260924152739.2865510-13-andre.przywara@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Wrq+otfv c=1 sm=1 tr=0 ts=6ab5a607 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=7CQSdrXTAAAA:8 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=kM4gzuUOBcDNVL6HCnIA:9
 a=CjuIK1q_8ugA:10 a=scEy_gLbYbu1JhEsrz4S:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: v9eYEJJfS9QWylIWeExKhUznFdJ4Ymn1
X-Proofpoint-GUID: v9eYEJJfS9QWylIWeExKhUznFdJ4Ymn1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA5MiBTYWx0ZWRfX1B+XOUahNwTW
 ZBqUZSl1TH4zCv0s8vcbJLxUlZGjwC1+D+/xzj/ycB8+czmQUB3wfRB0smwe6iPHVF/6ZjKGwOK
 8MG15gVSXMJ+rl5cj9SfpVjg6eVgHf2fJVsjEIr/c/nvEDZCxCuI5s+DeVwK0DMQVu+3TDqSjrY
 235maPbb0SpMRiKQzzQm5NADNXXPysips0Ngl92hx4mF9yldlACnMNS+LvmL9zBbVogPjEiqPHf
 TQuXZ/3tz9yHKFiR985Cq2wH3QQ1Nk/EoFEaESr2W5S9tc3a0Q71P9n6qZpOv/dLWjFN2o9ekCz
 V++kOq+imuP3e8Gmv1hXBcBhN3HJCrJZH+9BWDi8wpBLCQIcBQy73XyxXlyeRlvHeikmZB8SzLY
 1OiPBorBKqhQrEdoAyedCxvrPFbf36oIzJM8zyfUQTq1+N0Zf55EP8bgA8E4zzyyjklHZLsAwOK
 l1QgiU5zThlsBjZUOBA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA5MiBTYWx0ZWRfXwW02cr7Oz9tj
 9E2bzDiJXXt78FyKnbpWGzuZrhnQAZS7riVyG+kNf5r9WpLMKQW7zy5uFqRwxM6bp5ojBCYAJew
 4ED2LaoIqXj61yPObEWHQQ/Snkv5qaU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_06,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240092

On Thu, 24 Sep 2026 17:27:38 +0200
Andre Przywara <andre.przywara@arm.com> wrote:

> When an MPAM MSC gets into an error condition, it can trigger an error
> IRQ. We cannot really do much about those errors, but we at least query
> and log the error, then disable MPAM functionality.
> 
> This error report relies on reading the MSC's error status register
> (ESR) in the current hard-IRQ handler, which is not possible for MPAM-Fb
> based MSC accesses, since they involve mailbox routines that might sleep.
> The same is true for clearing the interrupt at the source, which requires
> a (potentially sleeping) MSC access as well.
> 
> Change the error IRQ handler to be a threaded interrupt, but keep the
> handling in the hard-IRQ part for MMIO MSCs. This is needed since the
> CPU affinity check in the MSC accessors requires a non-preemptible
> context.
> When the MSC is using an MPAM-Fb based access, we push the work into the
> threaded part of the handler, where the accessors are allowed to sleep.
> Also forbid per-CPU interrupts (PPIs) for MPAM-Fb, as we cannot use a
> threaded IRQ here.
> 
> The actual IRQ handler learns how to deal with errors. We cannot really
> handle them, but we can try our best to disable the IRQ anyway.
> Should the level IRQ line deactivation fail on the device side, we mask
> the IRQ on the irqchip level, to prevent an interrupt storm.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> Reviewed-by: Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>

Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>


