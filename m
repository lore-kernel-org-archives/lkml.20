Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.139.74
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793975519;
	b=eFoHu5P2htReUNBsupuGOIML/r5Jn+Z48dvoL+vZawNQRM7EWqZGy7mXkWIFquETvzcG
	 HV1gXzCwf3w4QiDS/xk1QFKApOf5MnKcD00FOn1+BDVaOiLQICBTBgSyMjt5IAXrzuFul
	 TeH3pbXZX1RMdRvaINcu9JQ+IFqfcZhIzoxa5orQmUfDbIol5O8CcrMMLU9e7lzWOY3M8
	 52zYgTDD5zYxqIo/qOdsss+F9A1FfU+f+rdOe+3GZJEXusoANkjHCchnp6L8F6VuZDRko
	 z3Aj7L0TGNwdefdqG/ZzboaiZ7mfeVoAOUA1s1PCbk/Uo8ETodDh8Wi/5B4EEZiVUfA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793975519;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=msHDOlhh2/6dyJiFjHesX8sOG3GnrS78AZnmwfxUHak=;
	b=qEeQIbBF4vrPz63/8p7rDIpx8b4loEulNyu9RFyfSNStrJPj34jTO5B+Cl9pNIC3Ip9N
	 4orVWPgvKamfFimKtFXsHxpCUZ3veV+1BxStI+6D3xrLkcC4yVdsFSk2fJchFtaKT7oDm
	 NvJsx3W9pCh8JJPVQWSkk8rGe79jJReR6vLD1ol7vrniojYeIV3BzcIwdIrfgzj22FKHn
	 xhEnn+trcMyQXiZiK3UeYN0UX4vkq7mUK7UCz4XWdmzv8C3Mpv5QhQO/AHFnsYN0y+TIw
	 iU+LvLEIWLRa74aCO223hhsm4k0hyJPKi0p+lNKB8ryhADyyXmn0XvOT9GIl0aK7qhw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cs.columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=iPjHFPvp;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.139.74
Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02803606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 14:31:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02803606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cs.columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=iPjHFPvp
Received: from pps.filterd (m0499198.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6Dd3bM2280040
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 09:31:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pps01; bh=msHDOlhh2/6dyJiFjHesX8sOG3Gn
	rS78AZnmwfxUHak=; b=iPjHFPvpRjHes5nIOyyVmq7NSX691jm8bNDgFCoF9S9Y
	tC1DdpyjGVI4thxa6jzkfettF4V1aJBLZ9UGeW8JC2mezZkM6h4cbcAwkBLCNdRs
	EQPMdh5dX5crv5f/0Nb4m12uU9l44F9i05au1GyWEhiGSAvQmvC4I8M8e3uOfO+k
	38GDEWbNgVJgde8UZtO2GcVzWZTYLKmQ5q40VM2xmyncNZY5MNg7aubjrBW/O0vN
	5c5QvLj9edxTKe3Yw5Q5+b5R+j02RocbxarAb+aJPFjPXXPFP37kiYVNo9Fu9Irw
	hndA4NLeqAOFQKISzprmic9DM1Pre5CkAVIqGWbGFw==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4hs3pcbdd6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 09:31:57 -0500 (EST)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-8a88d53c7a6so8983847b3.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 06:31:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793975517; cv=none;
        d=google.com; s=arc-20260327;
        b=gd7YzMjjKHN+oe7tuqdxbT4fLkxYjjOflE6e5fzl0sV/HUxq/9HoOvEB96m2mwX8ft
         XNx7FcmsEHVpJoKXys09ht9QcMFO3yDZ3c20mY7TYwueIzTRXyFx7qFQQ/tpXrcyejD0
         0Q9yNiBEFvBYi2ulaly/6eaPoDWoi5RQ82BICO7RUmve9zJAjl2AiVXUkHNXZAQnVbuU
         Mtq0KrysLWGh7QnqEGA/Ha5YIK91aZWbv548Syr61KltrmtDd5DifdIbaW3kQwvCqhY9
         Hnuvyqoi9qZnrDTzF0/7TgsCZ9cb2SYQIPdURYEs8UV18ky/MoQQb15QbcyIjprFemMz
         SVCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version;
        bh=msHDOlhh2/6dyJiFjHesX8sOG3GnrS78AZnmwfxUHak=;
        fh=IjS6ZPFJG5VzB+GG51yFY/U7SOpJC7pxBfKJbjj3/+I=;
        b=FpbH9+8t4eRC9dstiRHy+leYPn/dcwOreDn4c2C624yQQ3x3ljhLZ8+NUZN/qYhHfu
         XqTjaQCqNQXqdsBwTPhVwGG7qcsR7BRk8oBzImDfV1eKKbtW0tnf6TYVt7DpZdlTUdK5
         RTpjxoO1ejyLYSGgQrMM+ORuJtkGecVfg0QXjzmC2c8gR0Xlmywnamk1JZjpDlDbfNwy
         p4sr3afK0JvDjHSCVngpCfBDHVHDu6Qk+nXaXpvbaQ4AAv8jEVnkb8PTLB4XjERx/MEm
         jfL+SAfjcVmRxz9HQVVskjk4kKc8H478c7+xcHuGnogbZfRHmuqfKXCPxpe6lKaEXgOs
         9nmQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793975517; x=1794580317;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=msHDOlhh2/6dyJiFjHesX8sOG3GnrS78AZnmwfxUHak=;
        b=hW1vq0/WCzp1Vpz3mdDfcavraUoojU5JntGKvzUL0AKUpoiHc3XRxhYnO9l8h4MIQb
         oe5dF4kIo00HxqI0LyQozsvjErQnhMrCwYX/7tG/MTCRUCa6xH2xVlUQuTQmufWSut80
         VsrVk7UFUg6X9j3GLYQlwrQsjKAreoYHqUbM+25DE9Aci6SvDNzDDsmS2Fh9XbLYdzck
         b+WmpuxdLruYFEpGZg5o1zH+8KX8HHYKSe6YmqrwHBRzW56uHq7SmKv4TvUEQGHKSwNw
         1lyUuLOfDtWQZ9TPM5hetp0qozyA2XU8R766Dk2Kz0qO4Ht0aDF5/k8NiqZ+JjWC3dpm
         YNDw==
X-Forwarded-Encrypted: i=1; AL+hErEB442V6IC7kLK3H3s4R51Ru02fPV+c/3Fa1PbvTw8R5SFFafdPc927D5wRgUbb6iqFwzVG0aDK9/s0QPI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+o0/FyrK8rvx1lL1hhPAj9xvnBbbMKOn0RPp2Vo4XJ7ve3Kx5D
	fBwKltKrJSKDResNRKs4SnVZqHlGl2kI+YJr3AmOeBmTPhjkzZNtN+6y3J8BlZ7CJFTJp1SLMBJ
	7VGSQfz206aGiKNHqcec5vt2jtdRmIKNe9vXbUqSMwumyWPNtwoO/G3KUCwripFM3BAHg0kXeq+
	0lvx+iI/r4MboOGsZf62eQHvzO5SyzutFURqARqiW7CbHTHRH5Sg==
X-Gm-Gg: AYBFou1c8zPFp04Wtekjr5R4cl3ut56nxEWIQFao1OnYOdPfg8NxXWDbW+XYUx4UUja
	zjuc1N4Pg7cfAFFqdyDtwSrDrKECQXsbF9If0e5qYvCLHMn8iZQS1LZiiErhdt1EggJ25RMnFWN
	qzmNa7yEJkPV0lT2kcIkkqJcKcT9yAXihDKUZQSFWYtlLFkcAuDv7Y8eo9YcDuWY8HuJo0RryVv
	ztdR7vgPDc9RmEIzsHO2Och8uGhoJgBJ4qNTKWIK0nqh5WkospjNfP3ytIS1n88nwzZXH5JNfcU
	hNRmVo+4e30hYOwcqVfVQ4GaGQ8bijEMkA==
X-Received: by 2002:a05:690c:4d81:b0:8b0:e619:7047 with SMTP id 00721157ae682-8b341971c4cmr11926097b3.50.1793975517453;
        Fri, 06 Nov 2026 06:31:57 -0800 (PST)
X-Received: by 2002:a05:690c:4d81:b0:8b0:e619:7047 with SMTP id
 00721157ae682-8b341971c4cmr11925987b3.50.1793975517147; Fri, 06 Nov 2026
 06:31:57 -0800 (PST)
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
 <20261105-hyp-pool-and-map-v2-2-44a6ca90190b@cs.columbia.edu> <CA+EHjTzSKwuu6L8f0-=1s2XakCXJnM-k89XpagcwjSx6LX6wHA@mail.gmail.com>
In-Reply-To: <CA+EHjTzSKwuu6L8f0-=1s2XakCXJnM-k89XpagcwjSx6LX6wHA@mail.gmail.com>
From: Xuheng Li <xuheng@cs.columbia.edu>
Date: Fri, 6 Nov 2026 14:31:45 +0000
X-Gm-Features: AclHuK_6RKpS_Z72WeT9xcGJ3utDDUr-1LVpo5TooayXqPvbsyqigVFTteqzmVw
Message-ID: <CAPOPQMBG2aoTW6grkCChFxnBt0Q_+BeMkTQkoCGS6xDbssY9Cw@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] KVM: arm64: Check the host stage-2 PGD allocation
 for NULL
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
X-Proofpoint-ORIG-GUID: dFO8oDjF9jCwE2dMoxdfo3Kb5g-wh38k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA1NyBTYWx0ZWRfXzoBgrct1hDZn
 7n90OzCpYz+gCcQ40xNQTOQ9HBTREw7zl3XDhcLSjduzsgu/U3tw2qJOn39oBfsoxRKCdZI8FPr
 Pcd5msAELF5UyiefZ4mS+BkZxgHY7/MzUn4JJB1UTJfpO/urj2eYCrSfHIgYMLj2LrYuZ2GfZ0J
 L0J0rnf1TlYaB3bpIlqxSk3PvRWvsRq05ZndBujNCtF6hvolhy3tl4HHzepfUtWG8u8r7RAM5aO
 v+Sl1Gv0e5sxLhI2V2Z7pliYT6J0H42uhKqHUi/OfNhByNSkT8gns4mgm4Sj6dz7fy+wjBy3MD6
 v0DHD/xtAbKZxfGZv+9G0Q88tz9Yw/0m/RZBQOxMAtQB+YiwKZTtkf0ztRbivisVpPpPUqv3Tds
 HDj3K2UfKWvv5TbspdhtMsa2Di+yzjtLtVwfK1eKbrigdpYKMHY6SEboly9kaKq9VmfXcIVCjl9
 tSDG7/EwepWFovkFY+g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA1NyBTYWx0ZWRfXy5nJtHKm+oaL
 gSpmS7EzMtTQPDDwosAUwQZzCebhz6skhYsBMycUVqKKm8l+cu5IUcSjCq8eu63e5ROn4D6pIC4
 FqZG7ED8rTzVC1LrpwI4VHJysFjHF1IxRcacSilaHT+3hXw7smQj
X-Authority-Analysis: v=2.4 cv=V5PoQuni c=1 sm=1 tr=0 ts=6aede4dd cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=BpGzv1V74M3SfeTrGa8v:22
 a=b_WDY_0Zt3HB6tkVrE0A:9 a=QEXdDO2ut3YA:10 a=MFSWADHSvvjO3QEy5MdX:22
X-Proofpoint-GUID: dFO8oDjF9jCwE2dMoxdfo3Kb5g-wh38k
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11957
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 lowpriorityscore=10 clxscore=1011 priorityscore=1501
 malwarescore=0 bulkscore=10 suspectscore=0 impostorscore=10 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060057

Hi Fuad,

On Fri, Nov 06, 2026 at 11:39:13AM +0000, Fuad Tabba wrote:
> Could you drop this patch? Once patch 1 is in nothing reaches it, and
> before patch 1 pKVM init fails earlier on those machines.

Agreed, I'll drop this one. Thanks for the pointer to the guest-side
fix.

Thanks,
Xuheng
