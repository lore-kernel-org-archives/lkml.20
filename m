Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F049530E04
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 22:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790117384; cv=none; b=T2IJ9IYjqFuUIrIrKccnr3qV7Rsz++Wedl+gHuFO0/u3ZErnXUbElLm6gh/urzXb4lIptDfvIG0i9xfGC4gzgZ7qVK/C4StMNM4f2hqCr9gCdqx8S9oDO35dEIf6pdSiGl/0BLlR5IiGYHYwp7cVOgY+mbHp3kRRMITARaipMn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790117384; c=relaxed/simple;
	bh=qNzbdmq/oIh1lUZzfllq5i//OOvif/27x56ElsknR7A=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CTloT+UaEEDkRYECdcKuSOIJ6kMYuRDm8t/dFJfFOh8EWz22OXc6OHxEdyA3pnBqD+srtivSk0XErZooUcIC0ia7M7P7cyI2bTSsqHyuqGfCYjWN1Sq7+Cji/tD3uzcXo/dZg00AzGEwWZlV1uWr6eJnGHxUdJbgFPDVXX6b4zM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f7DvbwpJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e/KrJ9n4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f7DvbwpJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e/KrJ9n4"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MI74wA1873608
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 22:49:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YorCO9U54gBbhM07YPBvezJSmHCc/9vnYs1YoAkAYVM=; b=f7DvbwpJMVDR7TMA
	P4ihPwzr1H6UYxQAMTawgCVJKNVtvcx4mE/9wflDq6mZ0GzO12c1imrLERwRAkl0
	nncQI5NA2EGyXi+9w1GA5++uYr04LbF5p+Ei/e8yy41f9Blz/+Dk0fDN45qgW6/f
	fTTbV5ePWcBvcJrC23PtMtbinCFVQvsg0JEl6VxcngSydKegP51NJG8iEOEcBlc/
	w5XpibGZsyfPemv/2izCojD9X6Zy802NjSVqZGkuJuiT78BcSIgtN2yz2UvN1X9T
	dJfdZ5+yDZS8CMMGUza5KrTYsutWQFYdXn74/ZdNRWbJXyDYyRKZ7xjTtIWufkUT
	QN/Cpw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guqk4ufg9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 22:49:38 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3282d5302ffso310176eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 15:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790117377; x=1790722177; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=YorCO9U54gBbhM07YPBvezJSmHCc/9vnYs1YoAkAYVM=;
        b=e/KrJ9n4qDnTmuooZfvygY8ILiO+PcX7qP817Z4+E1R3yFJt3wfIFzZuO+VBiHAkDP
         Pf//8Db2tBcjN4HQ9m6rvsC32xfdYoAqbaU00vIwJcf8CZYnLci1R0Ec50QlX6AgaruM
         7sjxvXpWqyZd3tJfJ7UzKV5PrBjvYSg3D+DQXNFzLt8hmIB8nggk0281Q6NjwYx5eL8E
         yIIHJXRYiHRi/XorjGpY7/KsPgU8OcKyWY1NjGK0PP3CSMk4OOQB0waVc6AoqSyccI+H
         Q7UlFpEtwIs47r9KB3A+0/i3lJIRiPtiAexbV+PIJQo6Hid5qcEfEQpKcHWPQ154LeK6
         0zPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790117377; x=1790722177;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YorCO9U54gBbhM07YPBvezJSmHCc/9vnYs1YoAkAYVM=;
        b=SN2Kf+9E1K/79UvmEVA7rn+T4W6c4WiTLdLfiIiE3pybj4N58iC6c8q+bFBCWvZIaB
         2M2ERbOng1k4gmHSB41BywlHu8W7ysRfUupQFcrhoACQ48l84lkghkME+Zf0Wv8aW+MP
         v29Ou+k8E7iDEMiAJ+emaVtW/mzq+KO1P4hienmvV1urtKmMWqdT2kZeDUWUjykfc+Le
         3QbWQb9pSyVFzwzX3ruKusZHlMPAmPke/oYD5XHYQeYBXQogax98XOaramW/hDA0HKkQ
         m23cLcpL+2DmXkjCqEpe19s5TV4nNJWXotk0hvhYXfTgGLZXC5dl2+K9PCxdMKppd18S
         eXbw==
X-Forwarded-Encrypted: i=1; AKwUvBxc1DEvlh3BJON7B8bIQo1SDRHP/qqq/onxUTPl1GN8pWSOmoyvAUPkyxBVi1cFLc6zUclnNftapV9IH1c=@vger.kernel.org
X-Gm-Message-State: AFuF++kdV86sYXSygHNEOdj/QKqJqVwXp795DViywE5eUj39PTKKmS3v
	2eBL/f2X2rxANUQsZPIMp1FACbu8BnCapuv4yfdX/haqc8UzzupAiyKMqlo8oKnnX6zfyFxUzPN
	NaPOLYi/1++8N9CU+o6/4rbrlL+00hynouPobaPpCMg5YZnmmPhQR1kzgIVjvtl8rUmA=
X-Gm-Gg: AYBFou2t6qws76tm1x67n0q5iL31+kkwWqk8QOUcYFAFr11C74EYB0yvs2YXnwnmmEv
	Df3J24mwLqkFRgUlSsgJafISUlXVhOutEDrvQ4k9cz4P0LUi3N10kqhpAzKmHmqSPXcWF4rD6Z3
	5NLn5NGllJmMeqA7ZU5iO6R5Zdf4o3wUuGkQjHY6nlZfZ+5roBvwx7pKszo0YQ7db0QE8y1+px3
	BAoLurlSN3/TYyu7aCz9AbJ0CHMLLnduosRoDL0VfLB9Dx2PuFg0VlM2tuAnyDYrTrGJj/cp04G
	B32XNysC6i7ZF4Q1xp9fPfA8Difs9cqoIMTT0oe134abUcB7r+2lyfiKny3joy6vojDGTcmo5X3
	YdE/rx3dBTwfcu2SluYjrKH72tZ6uHcXL/DWK1EEdcivVvEeC3+dmOJA=
X-Received: by 2002:a05:7300:7a8d:b0:33c:1941:8f8e with SMTP id 5a478bee46e88-33e5ca9fdc9mr916127eec.13.1790117377267;
        Tue, 22 Sep 2026 15:49:37 -0700 (PDT)
X-Received: by 2002:a05:7300:7a8d:b0:33c:1941:8f8e with SMTP id 5a478bee46e88-33e5ca9fdc9mr916091eec.13.1790117376769;
        Tue, 22 Sep 2026 15:49:36 -0700 (PDT)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e939fe502sm1214322eec.2.2026.09.22.15.49.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 15:49:36 -0700 (PDT)
Date: Tue, 22 Sep 2026 15:49:31 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org,
        will@kernel.org, catalin.marinas@arm.com, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, steven.price@arm.com,
        aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com,
        joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
        linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
        sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
        WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com
Subject: Re: [PATCH v19 15/20] KVM: arm64: CCA: Introduce Realms
Message-ID: <20260922154931.0000171a@oss.qualcomm.com>
In-Reply-To: <20260920212845.707-16-suzuki.poulose@arm.com>
References: <20260920212845.707-1-suzuki.poulose@arm.com>
	<20260920212845.707-16-suzuki.poulose@arm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDMwMyBTYWx0ZWRfX/7WEBURcS1jD
 YKBmZNZDbrRv7APtKEDVVUOLNfAShksBYbOjGQIPB/5L1F+tmtMHWL6cNlzlt5mKTDPReeZ4AWt
 z6wLcIMMtECkahOwDMDV7jUFQwnWpe61xFGAGe3qPCoF51WBReXF79lHVw9tt3MWUPeeg53pcRJ
 B7UBlGPTRDPsPImAPfkz8tuhpaHpWebugXfmntOzZKEvZncGDT+Ozh0MqVat0QNxP/BZ7Nhe7iM
 HT7RbvgLRDXekGFzSLE1XPKNcp9UGDyKVCr42vNgLkmJUx31A8Rurm2OodlpUMIFoan5x2c6rhR
 X9JRfJLrHguut3BQ7/Gd9U+WXHTiIsfNA2y+4zW55zez7+b9c3EcpgArGNCy0D6joBFPT1XWxXA
 la/vG6isj99x5KL+PH2CD442tNGy01sdNvizdG3d7WFC2uJV7qrjI/Dk1zf1AOzaTdh3gzPB89G
 jMSQjua0iThSpuamg4w==
X-Proofpoint-GUID: iiCqE0OnDDCBDxlCxA4NpiXe1jsWDFNw
X-Proofpoint-ORIG-GUID: iiCqE0OnDDCBDxlCxA4NpiXe1jsWDFNw
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDMwMyBTYWx0ZWRfXzJM/WnTEGPBE
 qw3/q4/EUWIMVX+wWXQVQ/UECfSENBuAn+Tq5VOK23jbablhv/3ilWwRsC+m1nmGhWhvUwPtzMk
 eqP6OQD+ttbzAueVUdGLACqCI4Nnfqg=
X-Authority-Analysis: v=2.4 cv=XrVvqlF9 c=1 sm=1 tr=0 ts=6ab30602 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=1xClAnr3vSIPrHROFcAA:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 phishscore=0 bulkscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220303

On Sun, 20 Sep 2026 22:28:40 +0100
Suzuki K Poulose <suzuki.poulose@arm.com> wrote:

> From: Steven Price <steven.price@arm.com>
> 
> Add foundational work for supporting Realms.
>  - Add a new VM flavor.
>  - At KVM init, check if the KVM can support Realms (though not functional yet)
>    and will be advertised by static key kvm_rmi_is_available. This will be
>    turned on in a later patches, once we have all the bits and pieces ready.
>    For now check if we are blessed with KVM_MODE_RMM.
>  - Add realm specific tracking in kvm_arch. Since Realm and protected pKVM
>    states are mutually exclusive, move them into a union.
> 
> Please note that we cannot create Realm VMs yet. This requires further changes
> to the UABI and core RMI driver support, which will come later.
> 
> Signed-off-by: Steven Price <steven.price@arm.com>
> Co-developed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>

Seems like sensible infrastructure to me.
Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

