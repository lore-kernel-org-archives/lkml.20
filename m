Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794215685;
	b=wOMsK2eNpZYylx95c5G7EaNsclX3ZTrE6QX4g+5NpJ8AneF+bW9IAct2vvLiZb8GVwxk
	 SnmmNKJ1oYyRv0YTJmWRzyyQVyNeiKIa19qf+1YHThZkyZEIt6WhdCMR7qc/Sk4P3wT2Z
	 XOZDagiHuEL+ZKNYEKg/6pDWQI6Y8BntKV0Sm8nJT73K7W6WqW2CraXvchcYdESa9gBFB
	 qSC2Usix48TRfJwxILc4KvoHw0wdRgBPF3w8OLI+9bOAnx4jhA/lNdZhvwXF7ZYrKe/Nf
	 /RL7JSWQZnCjdb3GoLk+7JO9o2oYoMJhF1luIMu1o8/eka4sw/sJ6S36QXGRB0QkDpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794215685;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=dvY4KBfiISm+CQm5KIDUrtb6uzBgUaP0PFQaZpqv52w=;
	b=eMILdryc+PuPH0uj6V+lPWY7zflXmiAfmxz7zI8VSRoZ3H3N99/vYf0F3s8nxC5V2axK
	 bMaYdePs7EYo2Um6sf4NwtlTq8Cwhf9NHN1GG8TkhV4BKynWj7u8RkCtE5pl8LKIDNwnA
	 oz3rcq0IATSVDS1onTvt7bxfBjoX8nCoxKcZRA+orBsTjVgB4Dm0lnhb20od8dIGkCh67
	 y1Ik8qH+STDlCW3VAxMVr11VAkgIphv8fC0KyqKLFlYVj5AF8JOHYS2U8gdqub3VkENkw
	 WVQmR/YrBnGQOJ45JU05qIyrmDPOaOHs0Th5iWCsfZUPAnpT1a1zNg9uwRtM8JPsBJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CVfpLeBo;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZRuWLWCd;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55FA0606A323
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 09:14:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55FA0606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CVfpLeBo;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZRuWLWCd
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A96A1N23611075
	for <linux-kernel@vger.kernel.org>; Mon, 9 Nov 2026 09:14:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dvY4KBfiISm+CQm5KIDUrtb6
	uzBgUaP0PFQaZpqv52w=; b=CVfpLeBo3svBArcIsMoE8xRGgAiB5mlup0YLE+WU
	miqzZlFGvtGNDDsox8E4acOXK3gFfIwXz4N9NuUoFgsvQYzB36fLfpJjeTRHqc6s
	uy0gSyaVcClNbyTOzA2q8KZ6eX3yeJTqJ/ms2Qw2AhTUM6hxMMbK1fitbXikNI1A
	3N1EEpVY6+IW/Gl778ykaY1gR/3PEmrnDIUD2fTp/fa3Hmb8ffAS6UIbg308OCav
	3+Nx4dhrSnt3yHskSXih/XRxBQbXscbe0NIynFJkTP78h6opo1QkdQ+HiyPEGFcV
	CwIq9i7JbhtLjvjXIsVC9XTOcHDqrOSl9f6bgU8BbCtJVA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hssbnx1be-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 09:14:44 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cb93c874bso158110485a.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 01:14:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794215684; x=1794820484; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dvY4KBfiISm+CQm5KIDUrtb6uzBgUaP0PFQaZpqv52w=;
        b=ZRuWLWCdtN65wuVlWtWaew5IbZJQV+xs/PnELoRFpgR+THgXzTvZHHOS6lp+q9i/63
         vG1RLNwSZy/EKgkhLioQy9BvJu6DTvuI72ZPuG8/ZNGhIX27xfpTPHxjQspokzT+CS4w
         mq2ipsL1uBiZh1A8Udd+SM9ptm9xaw9Aazb85UGx3wPDnivcG0l55rJLyxme0XB0pV1N
         ZQoZ1fCQPdtCa7a1K3weoQ5WiLHJL7xD2cFw93ILwjd1phhIsepjgI/zHFTyWW8S7+94
         YChlXmlDmtQB/vMWu+nkqRbdYGmnJ5OOssgzpkC1RENEguS4LhadiD01PH1aMyZUHojQ
         QMhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794215684; x=1794820484;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dvY4KBfiISm+CQm5KIDUrtb6uzBgUaP0PFQaZpqv52w=;
        b=G0XJ7S7RjgvNRwFOrMaToB8M9C6CjeyiQUdR01aPcIQmH9HgwxS63GZeUftfb/PC4H
         yDphEj5UgyjRB5oVWBA5OEEScwgV2u+SL4FeYJvTkbOmcKxdpE+Tzwft06HIfqVu0NWQ
         tV2XvmcqbbyWmRSQHCJTFcephCxklyujk3OJBapdONG3JUTMtdcV3ezHNOrleSx4xizd
         ohuLBbpZ1J5xAmy9YETv1+eyuEYoVoOSxvRsgR8YyktBKgnYzi6ZI+N9u6WwOeWFAOkP
         zLUdLjeXZlh58/pmUKNU8NKS5w5NbG7oP8ulEnLYP8kRrBaW0XimDujEktYb3fC8UH8e
         nEOw==
X-Forwarded-Encrypted: i=1; AL+hErHZkgaF5S+KGRTRJkK2sRVhGvxmqvzslVQEaEurfbHDgLBycqbZsBfQEc7RlczclaUMp9FV2FPOFVDxdMQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/qPEL2XDquHET6OrJzLAEJOlP6rUxAHa4DnaRALYI8gVGbLv4E
	RKGuoLTAepHlvDCavquJg4z7WU0l8eIWZq7auj58D1eD0qNkUrSD2DSHBCtLqsyo3UGZHFOGXcJ
	gYiZtVqroR+k1EhabRCuEnzHhlQpoU8BANKa9yxWXpIsFQHjcr+wDfX/eTlkxI2OeYtA=
X-Gm-Gg: AYBFou1ftEoHK3URB2zXLHTzdcdkCS/yhhUldWub64Vl9z8eQQo3hBkl8F7i+Qg1muQ
	CC/nJ6IvPTZBCnj72eqwy+zbqfZAlDebCOYvKhIU7KWfl1aJyE9nvApOnyM04wZftcP6qKxDhN7
	vjFnvEJCR/LF6GHHV6eAHg0UbVVz+tfgzP9SGUdTMvzfb4U46/VgjPw4e5/kxTiQl68aTxs3bvX
	JTcDYB00KOM2DUz///X+5JenShgrMjfS0tw1Rk4A6IgoySNjdkF2H1XIHMi4A2U6tD76sbyrlFj
	YPQphoQcHNt+F+daHJ5aFmT2ynuH8fJbF/MOBPDEZ7H85eWgOjNL3bmTY5xVg+LTTrjBlPh7f5F
	xzpJ6UPEC2qqlOrpakDWh87WQKKqii2D4WCn3aSwtBze/p9wu3RovV5/j7V1EAgE=
X-Received: by 2002:a05:620a:1a16:b0:93c:65e3:df81 with SMTP id af79cd13be357-94604d2c6e2mr886323285a.13.1794215683425;
        Mon, 09 Nov 2026 01:14:43 -0800 (PST)
X-Received: by 2002:a05:620a:1a16:b0:93c:65e3:df81 with SMTP id af79cd13be357-94604d2c6e2mr886320985a.13.1794215682798;
        Mon, 09 Nov 2026 01:14:42 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b795024730sm161196965e9.4.2026.11.09.01.14.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 01:14:42 -0800 (PST)
Date: Mon, 9 Nov 2026 11:14:38 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Juergen Gross <jgross@suse.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Nicholas Piggin <npiggin@gmail.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
        Shrikanth Hegde <sshegde@linux.ibm.com>,
        Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
        Dexuan Cui <decui@microsoft.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowangio@gmail.com>,
        Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>,
        Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
        Jarkko Sakkinen <jarkko@kernel.org>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>, x86@kernel.org,
        "H. Peter Anvin" <hpa@zytor.com>, Jan Kara <jack@suse.com>,
        Paul Moore <paul@paul-moore.com>,
        Stephen Smalley <stephen.smalley.work@gmail.com>,
        Ondrej =?utf-8?B?TW9zbsOhxI1law==?= <omosnacek@gmail.com>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Ryan Chen <ryan_chen@aspeedtech.com>,
        Billy Tsai <billy_tsai@aspeedtech.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Jens Wiklander <jenswi@kernel.org>,
        Sumit Garg <sumit.garg@kernel.org>,
        Scott Branden <scott.branden@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Richard Cochran <richardcochran@gmail.com>,
        David Woodhouse <dwmw2@infradead.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, xen-devel@lists.xenproject.org,
        linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        kvm@vger.kernel.org, linux-hyperv@vger.kernel.org,
        virtualization@lists.linux.dev, linux-sgx@vger.kernel.org,
        selinux@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-arm-msm@vger.kernel.org,
        op-tee@lists.trustedfirmware.org, netdev@vger.kernel.org
Subject: Re: [PATCH 10/14] soc: qcom: rmtfs_mem: convert mmap hook to
 mmap_prepare
Message-ID: <tr3hhmd6gqvvzrngazyovx7jfbw6k45yjw2mipqu3aegsy5oda@7qromidf5btb>
References: <20261105-late-2026-mmap_prepare-v1-0-c56aadfbab8a@kernel.org>
 <20261105-late-2026-mmap_prepare-v1-10-c56aadfbab8a@kernel.org>
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
In-Reply-To: <20261105-late-2026-mmap_prepare-v1-10-c56aadfbab8a@kernel.org>
X-Proofpoint-GUID: jAg8B-TV4LBi6HrQ3TaieEBAlwhqEJdC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAzNiBTYWx0ZWRfX62idc3WXIL54
 VTSWGmhDnv9VWSXuk618s1mfbJJr8P++YZlzGPM6McecgV5+46lZ+AI/uPTyH1eRW1XCEwDyiJf
 O8O0c1hog6gcCxOh0ASnUiyoAbqBYP19AkpJMxH26nsWyYB14VCzeuhlSPv2PvIcwcQU8GGfCYx
 DlAdQvv2p8HlleJGN0+gqK7Qdy8crqN2etYmgRO4r+YsF0iz4Z8h+B6DaKom8h5aSzyTSjZNvtq
 pQAjVcRzZ8I95HtLKAdL8AfGmTetduDzMVICJGHV6vFOzvWhtfuCO31qFQYGOg6Rdhmxlw+CUws
 eDB9jV8GyUGX5VRtdqhjes46qi9R1RPMFfbl/Pf1nl94YQz5EY7T4t9UEc8QYzDyKNx43HfYeAw
 ugslsc76+JzuLSC2KJcWPiaiAG2CXJQ1wPNjvuZ1UPMtD8+BWNsVDQw//XGUAYCVuRGwOnC9VLT
 Dr215mZFOYe3iDlfYzw==
X-Proofpoint-ORIG-GUID: jAg8B-TV4LBi6HrQ3TaieEBAlwhqEJdC
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAzNiBTYWx0ZWRfXwSXXJQOOsh3/
 8wClqtAJ1wC+yB8cwcxwKwcMZ3GD/l1P9WfdGzcKLhqnpOEKFJlspoYPCpDTjJr2Vg3/GGkMWzj
 3nbhRZcc2+qg7f8kc9pBHEI7wWPALHU=
X-Authority-Analysis: v=2.4 cv=JtBkP84C c=1 sm=1 tr=0 ts=6af18f04 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=2UNkV1bVvYdQOko7pskA:9 a=CjuIK1q_8ugA:10
 a=QtEvL3ry9E0A:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090036

On 26-11-05 21:05:41, Lorenzo Stoakes (ARM) wrote:
> Move from the deprecated mmap hook to the new mmap_prepare hook, using the
> PFN remap mmap action to map the region.
> 
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

LGTM, so:

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
