Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51E444F3EA5
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 18:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790013617; cv=none; b=d/9lhefTtAa5u8DXHBm1solXvSRy1i10/GNPxjUS93wX1Itwsgl3x1VRM3fjsDldlHCDE5lzIg1UPWlYQgE0oYSDPioI2E7owksjUGltyLOgMYNFJsNBE8FogBC681VVVlZffwTmD8KeZWnsWrp/5lUTaHjrwiAxTZEEIHJ/jzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790013617; c=relaxed/simple;
	bh=lzPFVm65AOMQD6KwgnyjDmKQdJSMm7BjxYI+zaOgc1A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=p0O8djsQCSEMEZ7Mp8GLs00peSSlVwfph941apAUAaKHAjq4ftXwNVbergZNbkUosRt1yr7dW2Pfaj3I2qzHguNNrJ0g7a5M/0jCsNMhFF3B4nGeSstggbsag0oHeEbOMjyy/GdaYZm9nYUi95GJ5dXGigh1cnXaI1fxF+84PyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XP6EPdVr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gt4/bYa9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XP6EPdVr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gt4/bYa9"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LG75eY351533
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 18:00:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CEU3hvga5YEQ35KNEvE/1vgRu/Gs56CCvJfNSbfDOyk=; b=XP6EPdVrtN+3kxgQ
	7e8fQN/jxTMQUUPU2m7r1CXkWty/hhXYbvPwHRbd9ejH+MY9PtMjhTrNIZfhpWH5
	60gP38e2gKpMbCvxOIGC5k3LW8c6ChuFwGLDSd2jxNkBHYvNN93tFRz1/DE5oBqy
	iBQBg5qmMSEuM3y2HVictw3cT2AWB7DueA1nlxxz1bx+3+61sIvhKyIKgDdQ6N3u
	idEB0zqmI73x+shRDAGLJNILs+9mU3nRlFXvf0gLlPbBHMvwhs1Yrp7qgFE8Lf7V
	ZZ3U95I4PRZbYwGDPCrE6OMOwjwLLnWzJtyOOt/1P3KWJG+Yt2ORLWwbLCvEPuTi
	wycqAg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu7tsgg5c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 18:00:15 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc1bbd7d6e6so3006468a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 11:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790013615; x=1790618415; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CEU3hvga5YEQ35KNEvE/1vgRu/Gs56CCvJfNSbfDOyk=;
        b=gt4/bYa9AvqBEvPKrPFrLsPki0EE1x4oKXhMoxQ+++fk/M315IzEnUP2f3ld8WexB3
         4RVg8vIAtUTBAkiM3o/5hrU1fg8yFnT7XbzgMD4aIcaxVgiUC++PGkXNMtAa3NQa8T41
         Wukhi/kR8ttEKL0Hrpddjy8ipCxppv7HuI0ai7Ql637jfpAFxhiG9bOcRJ4AD0P1z/e/
         oqaHkHAt6mDGB/Fe9DjjwPTLRLeJ1gu6dyWlzh8LPLQLwC3rXb7hqnkcC7/cWLilNqTV
         vqrzmn8zPUX9N+WrOnEkMT5sgg2ZGbeYsRpFGoSeCVv4KJIQ6/+q+WjmZIUhML7WRu/Z
         s4cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790013615; x=1790618415;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CEU3hvga5YEQ35KNEvE/1vgRu/Gs56CCvJfNSbfDOyk=;
        b=hZXynZudjbZMg9e3oYQ00T86+Pyi5BMijElqE8WFQ7/BOuzKtX4x8KLetk0k19nuPd
         ettYzVgWKvtP3rQMlyMFHvRi32kxiSYsK0IdW7oZgFgMt4Szahtq9xACNfJiaFsVB1Cm
         46gFHCg9C71GWO1L/pkhLB6/QkfaL80HBb13IWWqFPQsCbbuvZJOQEP1Vi/M1Wl10Rzg
         ZLF6rxL5E4F3XbZMdFih5GcLhtk9AWEVmb9NRGczb8vA0gpRm3fkwchcxGHmGVtebqDW
         ydz+cA/62PRpDjydyBgHfqZJGq+K6zMDHk8ajDhMeVFTdis0E9pflTOZ2hDywxEOawFU
         Ts0g==
X-Forwarded-Encrypted: i=1; AKwUvBzpF2VjkGE+9mNcFpvjUIef5gvgWrpvDGypf4QLvlF1k/Ua4+Pk3R4DvsF8YGuMlMnpe22Av0NIgMrIriQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mpzeXyD4Fxo9+NoN0PpHYfe6KErvOGnbFbz+uG6yufraUzE/4k
	3d0a28F/MfSGXoi1GckA3GbiOQBy29P01nCpArC0HSsv+5NmBltADdGnKV3d0MDP91T8/M6kFRv
	ONH9X/CwwuX25lv1z/y3TwshuykiOwCCJ0jWEx1/h4O9dWj2iPJAXOArDLoth5tE/dfk=
X-Gm-Gg: AYBFou2tDUNNNxXDY6xGrXnCJPAMbidrbWmsAAtKz5V98XtDk4QotxbJ8EPBDgb9bfa
	+jAD8hLNQbu2MUSe2dqmKcOyp2NX6+i+5MMzutKbbtwZexvTfRcsp78VO6xqjLpr9NMERLDa912
	iAQKZoVReW8o9X1RwLOdymhsXK3H1Ct1duJu5JqRmnTc+ed6433tclw8tdcCVBNt6dTm6Yd301N
	+N2LQS3XCFFG8nszkSuA/rp9Xt/ERc8BRL/llGR+o9s/bzPVrDmrLe/+ZYMs2RQjtu1HtHLEUkA
	KW3C8fz4Y0RVUy7iW9potuX9Wp2XZyNkyJFVIPZVG892xjm3aE8IV5eUklkpejN+lVxD8zHeg7D
	vUZCXXBtxEZBU02jK7CJzlCe9+QiVR3N65WN0ILn1FiWIbLAi6hqRdhlHzmCE0zCi
X-Received: by 2002:a17:90b:4b90:b0:39e:4c81:6c62 with SMTP id 98e67ed59e1d1-39e54d65a40mr17548980a91.29.1790013614626;
        Mon, 21 Sep 2026 11:00:14 -0700 (PDT)
X-Received: by 2002:a17:90b:4b90:b0:39e:4c81:6c62 with SMTP id 98e67ed59e1d1-39e54d65a40mr17548904a91.29.1790013612621;
        Mon, 21 Sep 2026 11:00:12 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c3311a716sm22873198eec.8.2026.09.21.11.00.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 11:00:11 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: toke@toke.dk, Georgios Karantzas <gck.kara@gmail.com>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260911001143.4507-1-gck.kara@gmail.com>
References: <20260831173931.1672-1-gck.kara@gmail.com>
 <20260911001143.4507-1-gck.kara@gmail.com>
Subject: Re: [PATCH v3] wifi: ath9k_htc: bound TX aggregation to
 MAX_TX_BUF_SIZE
Message-Id: <179001361125.250336.18117819970795097529.b4-ty@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 11:00:11 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: wfMdtXC576OjekpUzWFAP0tAkbw1NguV
X-Authority-Analysis: v=2.4 cv=aqgnmiZV c=1 sm=1 tr=0 ts=6ab170af cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=KbiUeTJ1rXhcR02GJzYA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDI2MyBTYWx0ZWRfX8qzp9QQ3Utre
 liyyBD6er3/7aU1wxic1tVqm0LejQfd53KRIY9Bw0sZH/HWpmG0/jtiorHkjC83JGAkSKvwT+Wq
 5rkEYbddjo2ygPt5jFNd7nnxVxRIey8=
X-Proofpoint-GUID: wfMdtXC576OjekpUzWFAP0tAkbw1NguV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDI2MyBTYWx0ZWRfX7Y71w6dWcCNf
 xezuN54mtYTvN4QndZ6tcp0LyuVjcI/mjrkURAKJNBaRkaQsnnpEIea8bHUTjN2P/J1ALDNuBh5
 QIIQ54mCKNKVVSfUPNLkc5c9n+6k4r8COkR8kCny+6F+RUj/oUDrz3wb/Y/uh3jyJ9cwFvZxCCY
 qbim63D0z5hpckLWmU6R+cwd7oXoSMcDnYxxofcxHJbiwk0ja/crNsYCNTZXwQVXS7/ru0ZgoA4
 6bAcB6g2jmOgXz8+oNORopAdF4of+PoAWvLPsCsE+P2wbNVKYzm0oE8U1dnMmwSN/u0i8yOpZwa
 UsSAuzWDMKkkENB2vel2Gz+VS+zZ8UW4P8mza1YQbTJl5td9KCHDfCuEeqYSXF7+HqVintAI8TN
 Ko2AaPeLUCToeNpuSNKTdryZ+vUgbtxFs4JtDrg+jY2o4GihhM/swz24MuHlsyg3Ds4gWCofqys
 PesaC0kuopSTInNdTSQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 bulkscore=0 clxscore=1015 priorityscore=1501 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210263


On Fri, 11 Sep 2026 03:11:43 +0300, Georgios Karantzas wrote:
> __hif_usb_tx() dequeues up to MAX_TX_AGGR_NUM (20) frames into a
> single tx_buf of MAX_TX_BUF_SIZE (32768) bytes, limiting the batch
> by record count but never by cumulative byte length.
> 
> With large frames (MTU 2304), 20 aggregated frames of 2292 bytes
> each exceed the allocation (20 * 2296 = 45920 bytes), so the
> memcpy() in the loop writes up to 13152 bytes past tx_buf->buf
> before usb_submit_urb().
> 
> [...]

Applied, thanks!

[1/1] wifi: ath9k_htc: bound TX aggregation to MAX_TX_BUF_SIZE
      commit: aeaca27c1db3106967ffbb2b517d98c835f6d500

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>

