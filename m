Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4B273939BC
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 17:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788976672; cv=none; b=Sz8ift2Y2dkYxpfNa7p/gZizN8Kk3zrpCEaw2Wrz2lWQe6MS97cVzEvJ3qCAFmsusxWVqpA9bmeWmA9n/1QBRfkWTEdBwPiTUR2A1r4kjWdAZ+FhxSVBMTZh0FiXuk9SZBwai+FhLG4tSus2Vt4TST/CWVCmzqF9HnqXqHTlxcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788976672; c=relaxed/simple;
	bh=8O9bKRxlGnnLgywGJjQ/uZq8c6/fxYvVCDyT1TV4Qok=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=MVQWQouRZbT4XMrO0KLbK3+yxjzBs28glk2Grg61WBDhS7RLG1BNHps7zSCq8Ms5N9rq6XXSj+Dexpl2ekLUk5fzUT9lkfZv7Nupcx2aPVvMsbLGdD4pwBdrPdgbtjG9i9AAvNVOjRP2tpNV203GY2Le55jS9+PFUcPjzYA9H10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BWULOAri; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TXgb3GcN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BWULOAri";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TXgb3GcN"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689H7EPo3412015
	for <linux-kernel@vger.kernel.org>; Wed, 9 Sep 2026 17:57:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4AJdDXnIcC3t+ZLAD31bDqg6mlpTdQVsA4WJa0ECEew=; b=BWULOAriVHqVQG8n
	tV2cQ0wZ+HSihGKuJn9vhQZRABaQEWNzICia/Vfch/tI4MvpsHuhvj4UQ6KRVXEl
	dLFdboNh+xfAS4+Hn7bHaIQROZCcPFIrIgu+hJVCh1DXAbScSyMrN7e70FTq+DZ1
	ibxn2BK8vHr4cKCeBeHSlM3rjvewNNqah1tSNUtM5Y9biGcWM/wqT4a9Hu88gM43
	kXKORUuBFEt5NX3cJKSEq0det+ZujLLOaoXzhUu9a0QIp6fGFYC9BeqRktNDS6aa
	wvcGBNcrjKQzqavGNUB+Pw3cBt/JhsVoPDwBZ4KDZOByEKCQyKqPlIme0WcRuMtN
	lMLRkg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk6xh1re8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 17:57:50 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e8e864ef0so10739621a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 10:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788976670; x=1789581470; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4AJdDXnIcC3t+ZLAD31bDqg6mlpTdQVsA4WJa0ECEew=;
        b=TXgb3GcNq8TfgR/JDF7GTtklS3JBkplU20U1mqYDJfsMRFdHnajOn5Lfjo8ObkzblQ
         9D0uU2/2m/UXbaFjvkoU3B7n1YhYY+ZgjVljMeM4s6/6O1rhtByWJVAZwQcp1I2SMjA7
         X4hQGHQmRrcZksbqbkmf0ufuGgyrZglWjr0f5lMNgl9gQOj6k8LbVNL//nNdj7jOfoBH
         whi7lpihz/2eUjOm5IGn+1f07vJuDGUgSW193TT2RRUiyOzVwfL+v8OjahvJiyoVWmhN
         taxFWaV+4eDgiu0P45JS9193QYA9zxq1RkOpQUNg93/7GGZoK6jFcQ+OHsZ6+LBe8yra
         KWdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788976670; x=1789581470;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4AJdDXnIcC3t+ZLAD31bDqg6mlpTdQVsA4WJa0ECEew=;
        b=eSnhRbkyK80s8yve/rS2tXipzsoPjburEv3v/qfluiCdqa2YP7MOys8EoIussre2f4
         /3s8y3c/SEcBg75ytygc49QPK1zj66tjlnKJ36HZZ+kZJK3VwGAp5oD0BxeCZhxWzrps
         4MsDP8P7Bt5NuGKM7CXTq4ykkOFwARisJMNJeMwWvtEuzxQtF2WAJlwMWNoNKArVMAC2
         8t5XWT98rnAYIbXP2He8Dksz0obNqt8Vx5RdsB1SptRgNA5XaqI4wOtbE8YyP1jGJVFf
         /ayh7pgxqXhn+QJHf04FyxV+FRfS0Q8JHg7SWsHw5uYDvWDz8piHclZQwJFCs1jGqRMF
         xQzg==
X-Forwarded-Encrypted: i=1; AKwUvBxxGIsM5XHWl4o/Jxn7bcdgrvMNG+s6eOP3xz3aHn0cmrMwzkUq3RJF48VchbwtfzGKrlBSIRmk+/BLCHY=@vger.kernel.org
X-Gm-Message-State: AFuF++myeeqHAb7tlIr090nQvBo14oMusRKK5AK4SdDlP+5F8kCkk4Ty
	GmkS66jIlywHU8mUJEH1vpojN4/1Xsh5Oaoc/RQt7QDsdU5vwHmhvTVJSJGmDtR65GTZNZ/cmD6
	Ieqrbh7K3oYexFx2Natv1EXWsEPxmFVVCqT1g3TiEonmgCq54YluhF79xzloErxpH4yw=
X-Gm-Gg: AYBFou3ee6tZyjonSwX40tuinajrSy/N//sIWU2qyAohdINTlZQMixcPynGvwtWvBKe
	HJCpeKrIBLH4P2xugZLAAy0k1bDwREVh9Ck4T4RTZnzyZKZ+iAselB/kyZ+pRzIOTonJC5kjqAE
	J8Kb2DbBfUc4zEvn4RrCAKVQ3mKZ7L96jo/vf8ktIJh7IMrNo4xaLHgdHKcZQq4o9k8I2mvcD+P
	8AjHkfFUFAi3LrWDc7FH4t5c+jsFCSBzIarMJtMRYLMEdrU7CXAjDrOHFGN2x70hPDoJCbgXN+B
	UlZ7J9ts/s+aheLG7F/pvZ6A45RMadThvDBZ8CFqbz2+LFcqwtEM5K4aNjqe1wgLN2XhSttdm//
	xjMXi2V95KG6fgqeAqfIsfKWkTD5Kglm5EHvPQgEZMGpsctr4WDDNMhU=
X-Received: by 2002:a17:90b:2e86:b0:398:9be8:ea64 with SMTP id 98e67ed59e1d1-39bac3b0c7emr10982903a91.17.1788976669526;
        Wed, 09 Sep 2026 10:57:49 -0700 (PDT)
X-Received: by 2002:a17:90b:2e86:b0:398:9be8:ea64 with SMTP id 98e67ed59e1d1-39bac3b0c7emr10982822a91.17.1788976668916;
        Wed, 09 Sep 2026 10:57:48 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-339770f0489sm14478225eec.8.2026.09.09.10.57.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 10:57:45 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: jjohnson@kernel.org, Linkai Gong <gonglinkai@kylinos.cn>
Cc: vasanthakumar.thiagarajan@oss.qualcomm.com,
        rameshkumar.sundaram@oss.qualcomm.com, baochen.qiang@oss.qualcomm.com,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20260811020523.387433-1-gonglinkai@kylinos.cn>
References: <20260811020523.387433-1-gonglinkai@kylinos.cn>
Subject: Re: [PATCH v2] wifi: ath12k: clear dangling channel pointers on
 error paths
Message-Id: <178897666508.2048605.17545031957726182083.b4-ty@oss.qualcomm.com>
Date: Wed, 09 Sep 2026 10:57:45 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDIwMCBTYWx0ZWRfX5/bcn/yAOQcK
 xPEpTZWLL+/w/Pp0x4XMGO4AZXDh8lWAgblvpwpAzI2wIVkQxGMYhATh3RSuobyMp/YxRiWua/P
 7Yrzn0ivITkUyB2TvsUbv3LXqo/DoScifHDTOxTRmSLR6jnrZS+U/91CWAMbnJolhEtXdqk1C+k
 ZgOnYA6tNW0NqUnxCbJrrKNPuZmQUl/qXq7obq17+VnzxFqcxmd2K+Je9kp51YHhFh2FK/BZfFg
 453wxJariw9rUghR99E8R4Rnkn/e11KMM6x1EmyuUtCPs8WM9YKy+Y7JmM5vkq3ZKWu6gvIlxuA
 Uss7C/yaZ/KhnK3T8a9O4TQAw3g3PAuBa9brFv+Bt5+JBD7IyABp3FF0h6CS0ylBVRZfOUynuD9
 Bwws8UnX2RyAC0j+gYlLreSbdZI6qzdLbdZDP4vlK5DjLCldBvjSKljNMWYHFmcn0vm6Sar7KrP
 hBKDAtOK2gskBOANnuA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDIwMCBTYWx0ZWRfXybZonPSMZPg8
 dUN9OebfaGr7Eb1zRIs/LBEwdINW9FsANBabN3LwnKHmEFFafij3j7F3BR4H/kQz0pmQ7Use4aZ
 cjW5o1ujgfSj8/EVyTug1Ej9hT+GYao=
X-Proofpoint-GUID: uITmgAyg3l2YjIrA-7WfmtFjjJDTNWV_
X-Authority-Analysis: v=2.4 cv=KOlqylFo c=1 sm=1 tr=0 ts=6aa19e1e cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=CpnD9HFvDKrr3bQfTTUA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: uITmgAyg3l2YjIrA-7WfmtFjjJDTNWV_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090200


On Tue, 11 Aug 2026 10:05:23 +0800, Linkai Gong wrote:
> On failure, ath12k_mac_setup_channels_rates() frees band channel
> arrays but leaves the pointers set, or clears the wrong band after a
> copy-paste typo (6 GHz free paired with a 2 GHz NULL). Clear the
> matching sbands[].channels pointer after each kfree().
> 
> Compile tested only.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: clear dangling channel pointers on error paths
      commit: 507478f6f93864978a399173d4f54c8a987c8235

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>

