Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793769894;
	b=nlt/2TEPNW9S8bRIjPlzM7KoYrgjiyJbyzLtjeHK/iE4zfM1z42EmBoc0wxgSkQIxsbZ
	 uyPUlNnLzk6weJQVIyoZWCQxWW88l/ihvwYuraQByxiMgvWeowFHE7eZ/0nG8z8qA40EB
	 TtS62Uwva+w2QEgWkTf8JK7gpj9fT7du9Ic1h41PAOuKj6jwhCSFySs1BAm1XZc7z48ax
	 z1/9qQ2YyjHoqIv0NROpOklW5OujvoRXzmQfo4gyXpVOTFAmH7wjF+BjC9tla6JXaTMuI
	 dljazVfZ9sc27Sei57OhDg/WSv11E44/IRE+VfPEk+ifR9qidlsdFKdBSjgiDLou2qg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793769894;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=md33AtIgZOxHAVQuAff3BEQKn+9xIRB1oN4Tai/9XIU=;
	b=MfiAbEc6vicHwGu8aPSoP9s/bf4VkQQJypTb4HQgtQypLh8J3+RoDdJylSJrajv/6ZWH
	 nWuxGIUUFO9zXsGZSaUHPQvwwQhad0jPxhiJ4JxYHrEnnoDGtEcvoPNCcHtp1tMEcLJpT
	 hxuS84T6FKoRWeMCs4GJR0s5ArJlCPkgHFc+y77og5mHdaSVhTiMfBlTl5DE0TLRR/0pz
	 oi6lOsmReO2YVQqHDO11TSPyGd/PmccscohUaUdAoe992iGCjNd1VsoVzq4PVbch11nJP
	 Flh08XaYjq+mKxCbVHeHnTNNmcCI0mBXPjZ1NwLGhNKkE746oz1oEewL6agfUM70ykA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NmCn6UWJ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZhMNErrB;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7980F606A328
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 05:24:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7980F606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NmCn6UWJ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZhMNErrB
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A40RLM7222109
	for <linux-kernel@vger.kernel.org>; Wed, 4 Nov 2026 05:24:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	md33AtIgZOxHAVQuAff3BEQKn+9xIRB1oN4Tai/9XIU=; b=NmCn6UWJ5QAd9kRO
	+GbeO0V7OSTI7SKfo6+flMchUAmW707AK0yGXc/uos+YvcgSlsSwujZyXcE6lrWC
	erctnUUDFeddim+o3y1WNcwxgZHg+q2aH1d2jQzJgpH9vSniBoebjv2GQQwptU7O
	1sC22sn6BUFL8gGMIszQ2NgC680MEnVs/TQJK7LTj775zKN8GyIB5Uew8EuGDtR4
	VqmPMLwYw+/XCpr2gVxXI6bpM9ekQk28ECwYxuunUMq6bO+zmXB8UbzpJmHY1Wrg
	4mGO9uGqxVt1164WWqFbWQy810aawBD5VB4EwuiCafB94UmZXtaM924UIHBbm88r
	ly/A1A==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqjubjw3r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 05:24:52 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36a1e2485fdso620712eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 21:24:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793769891; x=1794374691; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=md33AtIgZOxHAVQuAff3BEQKn+9xIRB1oN4Tai/9XIU=;
        b=ZhMNErrB/W1c2DncWGSr8Pxneo+BjV12AU5uLsOASBE4hsOS3urmRtKmpMTG4C5Tl7
         p9iHd6CcXGoH4ayQVN8FTp+CONquhfJLhiJQPNKVALwUjOJCr4zWOk5XmU7xP/MXe0vO
         JZRzkkyyb6drUMMqQPWHYKScC8zqlZyUgTfg66G7KmWNEhEW1idUqhHbrCiFGeVV+BbX
         QKtUP62spnmYZa144t0/UH9q4hju+noDmdAgzV3+Uk06hUXxrYb8E0BznOftK6XBOKh3
         YXRVGw9okx9yiZ1eDVd4Ervf0BI5FsUeHulLh0+gvGLNYqRypoWZJSdLcigNCFGJcig9
         lLgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793769891; x=1794374691;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=md33AtIgZOxHAVQuAff3BEQKn+9xIRB1oN4Tai/9XIU=;
        b=xu46oGHZ6gm3fVnpaXhnOo7wuHjr7VSdFVGkZqbLRolvwgCTKN/9QIgiRk3BwyD3ur
         MUqIYEdJy86rKQ9izu8+YBBkrlGtpUG3VgvEXRFVGLlkxhKnvZMQl07vHpCddZpD0lKE
         PGmcA4ZW+nL/7OzGUC15RxqTRK+PnFETVzsLoNIAX+EEqUxjVbm8rZKgYp3UF8fs0Jp9
         mmHvsTdQPYl0nLlQs2Ah6i4PCksgffAPyh+nxx1x84C6ta+KMsKXpCTHBlSKO0hExtKM
         N0S+BewQKkzGYXd97Ta06m/mL0r2Cp+ZmkLZtdurl98qYLcF5Et5sQrhgDKopdHKdz7q
         qreg==
X-Forwarded-Encrypted: i=1; AKwUvBxdTtViFXz5TM0eioGCgV7HMt/OyOxU8cjb//3A2HGIv+WgNZq+OvGK1p2sPikuJ98sOr5Aq+V6wNYr55o=@vger.kernel.org
X-Gm-Message-State: APuU4Z+hX7uoRxh6wygR2VNAEDjlN9T85ZSPCZils4gGQYXNpoe2VcIh
	lYT/4C6JDWB2t3GLQ3aOPFHsptfCWo5LJs5AlKGujvOo+mWvIFsUz+vkJn9RsVSXIzp1g+ZFyHS
	BVxn2evPnRmOPgOiedsNcCy/gI4DQa30NQ47jQ7zfhSsW8OzmG8TfaQuZ9l2nQ4xCOvqyxIw6Vc
	iTaw==
X-Gm-Gg: AYBFou3ujFv6fNXoT6jox6VW4yd1gc+ZZOmoa28qEnMSXwVo0I+DA7tL2d8nHgP9Eii
	vTH/CjE1nMRJbX15iIhB07+gR0WmmD9UeLd7Osow1uP3NMvAesY3YkAyErwUTc1sfkqSZ21h3Gw
	CHn3ffyFaQRYOVTgkil6bXYE4Jh2DnczwtWxqPvTuYUtp21PnOKjUJ0hO2IdJ0rmAd45OUinF/v
	8svd1Z8VCgdmAAwpI1s2QglXJ5kgG702G5V0N47jr1bbm9VFXoZS6+SnyI5cngmZIFQ/3JaOSjV
	h+Dv6jmeMbUaHoiavSTwKvBAWnIAUd2d/KQyUbc5iI/W4pKEcSHFBYFgns6ceOWWgGIixJugT9v
	9qdWqUNLw4CoCJc+AlbDKFqk5s+eOmAryzQwKMWXQGzPosb4LCKirfdsLcLZK0Xb+AoaceTDK6U
	KGPuxJcPLaltHgLEzD81B48CdQjFsvcaIOEoPIUYB7NBZSH8RIB+9LlloUD55GjyZSwCmU13g4x
	c8=
X-Received: by 2002:a05:701b:2059:10b0:1a3:87c8:7efc with SMTP id a92af1059eb24-1ac5cb186e4mr23305626c88.39.1793769891056;
        Tue, 03 Nov 2026 21:24:51 -0800 (PST)
X-Received: by 2002:a05:701b:2059:10b0:1a3:87c8:7efc with SMTP id a92af1059eb24-1ac5cb186e4mr23305596c88.39.1793769890221;
        Tue, 03 Nov 2026 21:24:50 -0800 (PST)
Received: from [10.149.108.218] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c1c127sm4387310c88.6.2026.11.03.21.24.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 21:24:49 -0800 (PST)
Message-ID: <aa665b5f-a3a9-4aeb-ade4-b9b8f04952b3@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 10:54:45 +0530
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: skip hardware rfkill setup on Surface
 Laptop 8th Edition
To: kernel test robot <lkp@intel.com>, jjohnson@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        sibi.sankar@oss.qualcomm.com
References: <20261103094024.1764151-1-gopikrishna.garmidi@oss.qualcomm.com>
 <202611040318.qlss0Yol-lkp@intel.com>
Content-Language: en-US
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
In-Reply-To: <202611040318.qlss0Yol-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAyMSBTYWx0ZWRfXwifVK7F5jTpX
 HJX1U7LJXDXoMW65CzrptKmsCl7oXA1czJLgMmissVPjru87kfQpxM5PigyGVPEc+Hx1ONL2hwf
 Sx04Myi+Eywpm0Saw9W6Ap46ivJxJ00=
X-Authority-Analysis: v=2.4 cv=JeUpPkKV c=1 sm=1 tr=0 ts=6aeac1a4 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=anyJmfQTAAAA:8 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=i3X5FwGiAAAA:8 a=QyXUC8HyAAAA:8 a=sEU2oqu8ip_TAauk1soA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22 a=mmqRlSCDY2ywfjPLJ4af:22
X-Proofpoint-GUID: TqPFva5uauntJHu-qPl_H6hA21qy2RiJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAyMSBTYWx0ZWRfXz/0EtSJguXMy
 G838AczYfl+RVG98Q/Nb80BlUkyKNlzYQCqkLkG+3PcKn3mVrj6ZynvD9kur8lLYTFoKz5IlKer
 UJj7sL5DVHlVq6kS28gIF8NTO5f1KBUG/tLZq0j9iQWpuMiIlbcjub7D89Hl8XvEC34UgE94Oil
 GOSzSHh9Te6Zyzyw5KmRxaLC1uGnHoqDIp8RH/D7M0AB0H3jcZHOBPWTkRcVxXepITfE/5AAjOF
 5VDk4LwJscmCFvMkfwzk+aRP9ucnzBLP39rv+BcYGfCBgKwlXdaYc6tYyjwXD3K/Ci4XB6f9cd9
 Ez3wSpvEhezlrnDgIB7nIYZbkiKTrEH87P/XATYbuxBYX5wjzlzQNDQfXexBhFVnc7bLtSBPY6L
 RWs5MzyeEi50f26thdAIIj6SyQJ4ZEhscuoT/PW9+sJfT0fwuoXSP46v+A3qIgwJhoYrqpJGkF+
 mMBLGvdiT8z6Cuaw3DQ==
X-Proofpoint-ORIG-GUID: TqPFva5uauntJHu-qPl_H6hA21qy2RiJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_01,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 bulkscore=0
 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040021



On 11/4/2026 1:18 AM, kernel test robot wrote:
> Hi Gopikrishna,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on ath/ath-next]
> [also build test ERROR on wireless-next/main linus/master next-20261030]
> [cannot apply to wireless/main v7.3]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Gopikrishna-Garmidi/wifi-ath12k-skip-hardware-rfkill-setup-on-Surface-Laptop-8th-Edition/20261103-014024
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git ath-next
> patch link:    https://lore.kernel.org/r/20261103094024.1764151-1-gopikrishna.garmidi%40oss.qualcomm.com
> patch subject: [PATCH] wifi: ath12k: skip hardware rfkill setup on Surface Laptop 8th Edition
> config: arm64-defconfig (https://download.01.org/0day-ci/archive/20261104/202611040318.qlss0Yol-lkp@intel.com/config)
> compiler: aarch64-linux-gcc (GCC) 16.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261104/202611040318.qlss0Yol-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202611040318.qlss0Yol-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>>> drivers/net/wireless/ath/ath12k/core.c:91:9: error: expected '}' before '{' token
>        91 |         { /* Sentinel */ }
>           |         ^
>     drivers/net/wireless/ath/ath12k/core.c:86:39: note: to match this '{'
>        86 | } ath12k_core_broken_rfkill_table[] = {
>           |                                       ^
> 
> 
> vim +91 drivers/net/wireless/ath/ath12k/core.c
> 
> defae535dd63b1 Aaradhana Sahu      2025-07-08  76
> 5949d1910f13c2 François Roux       2026-10-06  77  /*
> 5949d1910f13c2 François Roux       2026-10-06  78   * On these machines the OS cannot control the WCN7850 hardware rfkill
> 5949d1910f13c2 François Roux       2026-10-06  79   * input, which reads as "radio off", so hardware rfkill must stay
> 5949d1910f13c2 François Roux       2026-10-06  80   * disabled. Ideally this would come from the connector node of the board
> 5949d1910f13c2 François Roux       2026-10-06  81   * DT, but that binding does not exist yet.
> 5949d1910f13c2 François Roux       2026-10-06  82   */
> 5949d1910f13c2 François Roux       2026-10-06  83  static const struct ath12k_core_broken_rfkill_table {
> 5949d1910f13c2 François Roux       2026-10-06  84  	enum ath12k_hw_rev hw_rev;
> 5949d1910f13c2 François Roux       2026-10-06  85  	const char *compatible;
> 5949d1910f13c2 François Roux       2026-10-06  86  } ath12k_core_broken_rfkill_table[] = {
> 5949d1910f13c2 François Roux       2026-10-06  87  	{ ATH12K_HW_WCN7850_HW20, "microsoft,denali" },
> 5949d1910f13c2 François Roux       2026-10-06  88  	{ ATH12K_HW_WCN7850_HW20, "microsoft,romulus13" },
> 5949d1910f13c2 François Roux       2026-10-06  89  	{ ATH12K_HW_WCN7850_HW20, "microsoft,romulus15" },
> 2d169d089ae8e1 Gopikrishna Garmidi 2026-11-03  90  	{ ATH12K_HW_WCN7850_HW20, "microsoft,surface-laptop-8-13p8" }
> 5949d1910f13c2 François Roux       2026-10-06 @91  	{ /* Sentinel */ }
> 5949d1910f13c2 François Roux       2026-10-06  92  };
> 5949d1910f13c2 François Roux       2026-10-06  93
> 
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

Thanks, fixed in v2: 
https://lore.kernel.org/all/20261104051838.2912931-1-gopikrishna.garmidi@oss.qualcomm.com/

Thanks,
Gopikrishna

