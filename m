Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793775205;
	b=CERYGIBNOO7CsA1tXChVYG+vZBPaiEkBbjcUmRG/vVGDbDgONuaoglnjeYjlO5gNn0Jw
	 As8A4ocAXXCjt1DmzhHBtx5U2voBdBK9ak9+BEVB02Qzn1cj8gsudccpoPzKHYw1ikAHX
	 wUZfqMK1FKgWY1UGy8roAESlqp1an16qbXhrcqt40YVNcX/g0h05FMJQgDS3vUZc356GQ
	 eJ3iIPdcp+QN7FSRu+Vph8Pg2cXRu2WwfkYgF08Pxoy7EmbMhRs/N3sbD9aV4wAjtFD96
	 dpkI0G7fbmT6H/6VBwSdJLQtzq3eJyRak4Oqo9v9M+dn8PXzdtLaPM61gY3IfQ52X3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793775205;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=bAsP3vEcsMK2Pyfp7DECuhtXhrSBH3wv4vtWNL9Hj1U=;
	b=Sz0ZkFBosAT/PnU/qadBaJUolWPq+G7c09u9fRGnZ8FeIH3vUXvvtOqZzwwS6f93fSy7
	 QVYCSfjRu8gBnLeHErVP5McnyC5f5nC+KFWBU3swmkbMyfvjYnC1Q+FNfaBAmMkUG8J7M
	 hvMSzEkbsS3wW+vNAMjfgXRzPlOuLXa2wJ9U91g7C2HQbWaPduHUVopVf/B7GS0ZjxgyZ
	 /6a9TXza1o7f1DjrtAllJo39zhJP5vdI1oxxAAkWZdOpPYGv6ebJwRQZvnCLfMgDtZwqT
	 gO/WoiJy3FCBLGZwA0xdJdAGGtrayek7kDxotNu2QmWsMygmYqkkr8xqndFlUUlsPdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JnrT8aeB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bJsWGnIj;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0929606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 06:53:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0929606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JnrT8aeB;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bJsWGnIj
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A40RFgD1248584
	for <linux-kernel@vger.kernel.org>; Wed, 4 Nov 2026 06:53:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bAsP3vEcsMK2Pyfp7DECuhtXhrSBH3wv4vtWNL9Hj1U=; b=JnrT8aeBkvY2MHZJ
	ggyESnE4tBC0LAs7gD19JJW3qSkdEA8ngg6p+IR05G29hn45K3BTEh7bPj8s7Fr1
	oxb90hILLnQmYU6Ga+kbmvk7vrVmL4Eqj8OM/K4Y+IUAXvL6wglWZgnyqFKumfHl
	VqdjwUXMErhHP1QCV/RRjstfD1QiGUqOo2ICBL1lIQSSJrso/7f6a8CdaD6g8Ho9
	FZd0eFRtwbaHwNNIbSvwPLTTq41Yz9qq4oMCe3IRd7uG3lCZa2Ph6cis1362xK8R
	NwlyZZa03NNapZz/CZXTxdUJGQ+MDkd8MZ2CcjbMKxaohe2B/S3J/9n/8WjW3nDz
	heI+uA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqpuva0nk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 06:53:23 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ea446ea8c9so10718045ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 22:53:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793775203; x=1794380003; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bAsP3vEcsMK2Pyfp7DECuhtXhrSBH3wv4vtWNL9Hj1U=;
        b=bJsWGnIjxiZewPhPr/gwA5eK/EjrRSZVPCt9qp1SmBeIXILowXBFEmKSX6z2YFaBo0
         3HVqKuUDSe6nPDoivbQXc8j1EiknlY0/cFnWkUGCZPCtNES4/omAMkcCH0z+dLXF2yzz
         XgAbYsZ7QP3lwB5HibSkjSr6hp0S3Orf6BfH8zbtcjKfqfrTSgs2B28vvjjBlK4XQNvB
         p2EB9FJ9ZOi4FZUYYEBun/5qZ8X2x4CDZRbyvXK8YgvsFcl8V84niSf1gm9tpT6NAvUd
         HHmSx3h8Yj1EA3Foq+Mf4cNGEhNLOBv0fbLcPzRVsBLUkTZ62Y3IKLyW9UYJnu/8/Wie
         UPNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793775203; x=1794380003;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bAsP3vEcsMK2Pyfp7DECuhtXhrSBH3wv4vtWNL9Hj1U=;
        b=gjEyuexsxo0I6APo2iQN1uvNxXodRoK4FsB9h5IEUXG1DLa6qPutXRP9ZJg/d8Qc8L
         r5QzBpkcUrEvlMvSleGI3iixOze/yWW/XAGR6EmXQZDFOdjV3nWl9R1cff1Y6unw4dE8
         RdLLdQZSrwh8KIcJc4/acGY+Y3MYv//LKcJqd8JAJqkT3qseh2MFEKuyXIhdy+CPHB1G
         dKQ4D2hh7GJgcDPL/KMQ49rSi1jlK+DCzH6GLD3gc9WttlBK2dYvCxOGpOTWon0xNU6d
         n6ZFpZySadOFbow2YBQbI88zwNak0gh2aXh8tGPd5ageuQZuANc3xwkDe/PTsWGbt/jK
         1NOA==
X-Forwarded-Encrypted: i=1; AKwUvBxo3ddI2ZhwxqXEqLcxU3eiGgaPckVorOCyo9PO6AYZMqFo92Cu8neofPV7Rl0pPhwSSw8OuOiYWLJO7FY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8lgXwJO+tRdlP1o9UBWBeScjeujaqy+C3LfHeMBBObS/Q5kXjJ
	HUZLI1CD/uc2WyPNp1ZsVEgSVKqm3QukebQJXXmqFxuDj+QLvA0lJc1wirHfvj1GB3wGlp467tc
	6Ay2hs4NXmKQ8Bn3TAPfI6g2ft6fCW69XDKGAgZ2DSb3vAXt+wsjKxQGzIDMyx9uEJCk=
X-Gm-Gg: AYBFou0zrJU77Qe66rmtg7yIKwGD53zT7gnkhGgsKGavq4zwQXY9YW6ZZYzezG9rZMn
	1NGE9uoO+uyHVf87IEYTi90PH1AuYCLvqVzIl0T+lA9UYy2CiDi2XUQ91jeKtAp1VlZKluze6Wh
	qxEmy4UENSqZ0O6MbSRAqHxqvQqSRgIHuvlOAr/97nS5wB5hW5gCYHKPfiNVqk70bovn9jRXhMo
	7kiR0UWTmSTImHaG5BSS4qYkr/zLe4CwIvzJbSYuuWRAgwCt7WFHjUUag1izr+9aHb9J6rX2XSp
	i2QhQ5zjBxUn6SJXSCHxra+PdEBpl0T1iFOSC+pURaYvNhS5A0s+HXU3mgMXTNxKbs2tEs8dISm
	FfrkxPBFoAwViFMeuGWnb5TDXuAG8M/DIdSkNBxo5CTM5rgTYQex4MPlpgHxI1vWEQdUBaPMQ55
	p5TnH4rJMvoGOCNuNo429aaJxTu+fr+eGcvv8AS/42MgI=
X-Received: by 2002:a17:903:1aa5:b0:2e8:5857:b5f4 with SMTP id d9443c01a7336-2eb364961c8mr99565705ad.10.1793775203234;
        Tue, 03 Nov 2026 22:53:23 -0800 (PST)
X-Received: by 2002:a17:903:1aa5:b0:2e8:5857:b5f4 with SMTP id d9443c01a7336-2eb364961c8mr99565615ad.10.1793775202770;
        Tue, 03 Nov 2026 22:53:22 -0800 (PST)
Received: from [10.133.33.51] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed090724d1sm3471465ad.35.2026.11.03.22.53.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 22:53:21 -0800 (PST)
Message-ID: <029eac4d-9516-44eb-922f-73ebce894925@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 14:53:18 +0800
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
Subject: Re: [PATCH ath-next v2 0/2] wifi: ath12k: refactor m3/aux_uc firmware
 memory handling
To: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20261104-m3_and_aux_ucode-v2-0-b6c335c14dfe@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261104-m3_and_aux_ucode-v2-0-b6c335c14dfe@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=O6SsLx9W c=1 sm=1 tr=0 ts=6aead663 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=WH3b8gmyxz3kVt_5t98A:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: whR6HQ61ZaR9Qg99r-Qj4rT8dq9pcXQI
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAyNyBTYWx0ZWRfX0I2dPkHTgCii
 0rJLZmrDtKgtsjBoG+VfCzAgBwAUxremNihZl5izcDv0nwnspVYrMGrYpq3q1YSsZVnOx+73jjV
 h7Sl0uBffq4PR4Ze/26owyqGQJY+Uvk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAyNyBTYWx0ZWRfXyvgrqL5E9ZGq
 7uaue0AuzmrN4DL+0HkScMBd5tC7wseMADOzNlzbDQQ9YAbRjm+2ySexVExBCyTtNgFF1VxIxGw
 gQhwlFCa6yX8fbXmeQFXVvGbCiOfiFbA1PiTknpqnnCy2MIk4yfJO7W+FjNoKOqe/z/jLNSNzjo
 9Q7u6H9jNqtLrsIRQJB75ct0/tUlAHkRI14ev3QeAQ4qIZUbIj3HUkRI3W2YzwtTYRHAiHh7uiC
 yV5LuOz3iJm5wFvscikeOwOZvEnGCtDjgYxuznsE/cF/yPDZrJQz0SCvAGCsIEhjVwlQq90Tylv
 M1wQglWfJ/9b89/xAjuqO59t/1YaX1X7Mtzu6sCsmRiyp8HBBn7DP4yFFRkRFDBOLYGy3SIpfRd
 IiT+g+okQKrDjJ0CSlgdfUacvKmhelUSJZnBLBQC+ZlhGUpsoMkQWimyGaoeZicwu6SodDigS4a
 2N9Yxn5wjm+POFMQ3UA==
X-Proofpoint-GUID: whR6HQ61ZaR9Qg99r-Qj4rT8dq9pcXQI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_01,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 clxscore=1015 spamscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040027



On 11/4/2026 2:30 PM, Madhavan Ganesan wrote:
> ath12k_qmi_m3_free()/ath12k_qmi_m3_load() and
> ath12k_qmi_aux_uc_free()/ath12k_qmi_aux_uc_load() carry near-identical
> logic for freeing a DMA-coherent firmware memory region and loading
> firmware into it. Factor the shared logic into common helpers.
> 
> Patch 1 is a preparatory, no-functional-change rename of
> struct m3_mem_region to struct ath12k_fw_mem_region, since the type
> is also used for the aux_uc region and the old name no longer
> reflects its purpose.
> 
> Patch 2 refactors the shared free/load logic into
> ath12k_qmi_free_mem_region() and ath12k_qmi_fw_mem_load(), and
> rewires the m3 and aux_uc wrappers to use them.
> 
> ---
> Changes in v2:
> - Addressed the review comments.

this is not enough: you need to clearly state what are changed in each patch.

And I already gave my Reviewed-by: in v1 review, any reason why you didn't carry it in
this post? I don't see any major difference between this and the previous revision.
