Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3008230E827
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 16:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790269134; cv=none; b=r9GM1GOgKG7IqKZ0xdiSjdWIptyZlWGw6XtqcKbJT4dK5Xff9WdoX3eWrHrybivC9jELR0hUYvRYfWSZR68vOKm6d0AKSugYSzAnuAV/irrqfWNtgL/LGc4alP4yRAaGPFZWwo8kacweoIn53zHXCYrCgsjlibAcuvGmbBy8n7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790269134; c=relaxed/simple;
	bh=a8A9yqjmhJ/+cI4yw1HQmLXjHtbCYV7LwVPgha5XwhE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Hssz+BHLrdYV8BDyvLf9RmWTsJGoJ4AfVWp+Nhcz7Ogp2VKCxrqr9iENE/QgSy67M/+64P7YOdkIfiYUQaQE76CxGoEZLt7sVRj9OLfocEW7fcpEJ3ZUS4zORc04jH6/0uekzMJM1irRn5XXZPMk7NQiDKpM9Ux0UCO9Z7qMG0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xu0+sAhP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ReYozX6w; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xu0+sAhP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ReYozX6w"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OFfaIV2757908
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 16:58:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rFAGiOFg8Ohk1lbqGxk4BCZDcIv/T4pj8Ax5ybWtFqY=; b=Xu0+sAhP7595qGZV
	puFGsMwbl6q6Rc7svCwZK+AFgMMAFmZn87UZ8N7stAWgs0b0fX/qeHfXEwPqf/JI
	jtokQwdafNIMplnB+yMcLHyw+cW2OteWLk0U7jB5dum0+Gi/XCATXkWIncHTNygg
	sddbbfhSpaQFHFNsp0+KMdS+G74Gb/U83Q3pe+ucyP+BmwIwCjbJI5tR4fVCVMzB
	zgp1sV3lLSGYNFQktGsggcc3+d5FaiXwXpabwwiX70UTB3IMx4MV9zwSKRVDeG6R
	nJ4WDyHPLzInzX0l+Ks9kur02sJ2OKBXTJZnHpgLhC4ExgQQkv/n6naBb9WImHBw
	uIJqUw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvx8ajthk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 16:58:52 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-396901263b6so76858a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 09:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790269132; x=1790873932; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=rFAGiOFg8Ohk1lbqGxk4BCZDcIv/T4pj8Ax5ybWtFqY=;
        b=ReYozX6wZ0XKv5/Q/AWdJO6IuwKbPeRxTuSD5P7PpFaaxt/F+VcfwYuVEsC0JRkijU
         7euWswj1/R7HuHlt33AXroPLRqGF5lsHzOTUEHI7QDQtYblmXXb1PWFC7dH4xUxldNQv
         AzxXJWSKwrWde6CzZtGey3KyeSQ9FE3/KLPLHNxkOzQksAzAMSyhdMGfjf6Ba5lScj9J
         kVgdxhQARjx3v+6ijHmVFG6gRAkwty/a/B1eh736ySL2nEwjzV3WzIUcK2wclVb1n4dS
         ukFzCCG6Mr+itK76Xo75XU2H/BvX43MgJ50OcpF3iQS+8es1uvm+5dtrEldHQT358TAX
         loAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790269132; x=1790873932;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rFAGiOFg8Ohk1lbqGxk4BCZDcIv/T4pj8Ax5ybWtFqY=;
        b=j3hGqlgMiemZDc6NbeNX7JSFMtWCQWt8aRFEB28qC8grXTWrJwPn1RcgbFrjNjwrXR
         OLeGs8t1yRgS9QNEeAh1YRmseA8cxI9SLsxWafdkmm+FTdstbjQdWUyk7HzoexUYDpY2
         VJTMtxvfPUxCtaexyoKdqm37wOP1Sj7bbD0ItB+pRvQxfhi9hwG74I9B74ATexwOa8MB
         6r3GKUFqOkWF7c9yd18SuM+2xKj+RVCmWj6LHkjDd7J1gUA4KI73A7H++TVvI/z7lvbl
         czxZBETC34foO6ZIPkyi6kyB6pnEtpibyuuOQp0VUqntGccjfcSb/tTVfkGUzlgzcwfT
         ewXg==
X-Forwarded-Encrypted: i=1; AKwUvBxR2dx8yvS566KpjyJfyFskjoj4hR1/9Hk77Vwnm2vDcefQL3uVyo5IWzY8D57wh2sFZmr/jzZckvQ91kY=@vger.kernel.org
X-Gm-Message-State: AFuF++nP9IOaixlDpHSTMiCENllBT9Fw0nb27XozfJzTcakPtDnaq1ty
	Wb0BMASI59WdcfsA3R5Lksp0PSk2p5z+VWCgF5IsYt4bGSxhR3YSp8nfEl5bJUJJf2l9NKPGDb4
	regdxby7AfPUTpZ3sklxf1ZJLmGCeTIv+wE7rloD9PrhcPe6b/HikKYSA1K0gYIyziCU=
X-Gm-Gg: AYBFou00tc5zlXW7v+RdnQEyZxLoQ7uCnE5J6GAy3Y+rt5NOmtimrPSsFGb1Qa7IiM4
	Y4lyxLUenN/vo9N3XBpwciPZME2O/Be0+ETao8bKE5pNDAP/6WxS4jU4cPIeKu0bw0NL9jpXqq5
	jevr29D8dK8Ynush5+7tZ5CDaZH6LIr/PYGOamzl9Hc8KIh4QbyVMcE8o5PnCY5nLrY/ssisMYc
	qO0ZkhnqMxvDzSGnHymCoKeqiXXTVu4mdwezxvRiqs/JvwHS5QvDkflHI3i+jqjgB6aKXUbmXZh
	rg36gGZgFqfjo1QbdRe4c+S2QWf4huPWcmekD2WdZAl2PtcJu+YdRtTWBFyhZ8kLzkb9fXGSUdR
	+mpd5h3mr7vb+2MB02jV/eQKW7N/629wlQ6jQXMUax/qtGDhF4FuVHL8=
X-Received: by 2002:a17:90b:3c4f:b0:39e:6c69:7775 with SMTP id 98e67ed59e1d1-3a09898525fmr2917430a91.30.1790269131517;
        Thu, 24 Sep 2026 09:58:51 -0700 (PDT)
X-Received: by 2002:a17:90b:3c4f:b0:39e:6c69:7775 with SMTP id 98e67ed59e1d1-3a09898525fmr2917416a91.30.1790269131105;
        Thu, 24 Sep 2026 09:58:51 -0700 (PDT)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0a8d290d0sm2047321a91.13.2026.09.24.09.58.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 09:58:50 -0700 (PDT)
Date: Thu, 24 Sep 2026 09:58:46 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org,
        will@kernel.org, catalin.marinas@arm.com, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, steven.price@arm.com,
        aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com,
        joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
        linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
        sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
        WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com,
        sudeep.holla@arm.com
Subject: Re: [PATCH v19 2/7] firmware: arm_rmm: Check for RMI support at
 init
Message-ID: <20260924095846.000051f3@oss.qualcomm.com>
In-Reply-To: <20260924135201.850038-3-suzuki.poulose@arm.com>
References: <20260924135201.850038-1-suzuki.poulose@arm.com>
	<20260924135201.850038-3-suzuki.poulose@arm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA2OSBTYWx0ZWRfX07dVVXxaFSCE
 9Oxpxkp9diJ+aT6mVM5kuLiDwSST6NEnXt9x+gswHpnuWjE05FjXIcA/N9lOUCREYBMmtZfl6eL
 5JZeXHQ+4CmMQLmsMtdagzt571HzKXw=
X-Proofpoint-ORIG-GUID: MKsBVLmEtiN83gLbOpcL2-aztmI3l901
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA2OSBTYWx0ZWRfX2u6vgGOoQ1kb
 PNBg4U0BQEXUi8XvWu5u1Q/1KTqp0JSzXm5D+MYkTRskgY2MahRzh8jy3SfGAzmYkTg+y7GlBN3
 MMRpzaEBjT35cm774mzieVSgnsR40DyTxsa1cFP9J52yM+l9PUWkrUyzu0sBFGKDDj0P6CrLze8
 iMdn8Mz/Kv9u35vyxKrZ45SQVJ39b9HoqXqgMEGiFy2TLJl7qKIS9jRMs7LuFn/OkNJ5F0jYktW
 svuIHO4OEZHnY4Jq1+kRIm+T2/bcEv87GtfuANAaAQDW5V3OZuDpfRSSETbF9Vjnyt+jGAKIhUi
 NE+mouJy+AkqrGVBOhlmxY1NStzJruoKYoDQHFsOtsRV2pV9fajsgfAGvN0tsvMEU29zTOdEx+I
 T5xzADZaYkfR69d01qgKAb4JlVbOY7p73a5C7eLvo2qo5yhqjb5TFvaJBHT7WPXSznO5Kv6Vn7e
 tluhHWL6csDkjnYivpw==
X-Authority-Analysis: v=2.4 cv=a6SlZkSF c=1 sm=1 tr=0 ts=6ab556cc cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=iEv2s1z673h7nQAfKJgA:9 a=CjuIK1q_8ugA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: MKsBVLmEtiN83gLbOpcL2-aztmI3l901
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 impostorscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240069

On Thu, 24 Sep 2026 14:51:56 +0100
Suzuki K Poulose <suzuki.poulose@arm.com> wrote:

> From: Steven Price <steven.price@arm.com>
> 
> Query the RMI version number and check if it is a compatible version.
> The first two feature registers are read and exposed for future code to
> use.
> 
> We only support this for Little Endian kernels, the Big Endian kernel
> support is anyway marked BROKEN and is being removed.
> 
> Signed-off-by: Steven Price <steven.price@arm.com>
> Co-developed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
