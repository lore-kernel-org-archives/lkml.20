Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B5EE4C77D9
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 15:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791213001; cv=none; b=s08KvewoWPD/vNvp7oMGUivHaCmehO2lk8wZjtmrimBslMQ4BqbI5oR78SuYYxUfuFVNiEEycPmNL35mrUMBTlvPvgEB7duTij3/wv/nSfbvxi42IBET+cZAxc5w2pHF7aBrTwqIDPXQ7R88DV0/nEwgc4yLiK1W4OLmi3eL6YM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791213001; c=relaxed/simple;
	bh=6IeQM88uWsoEPW+UmEcejYga+D2dFtB5DxWxyb2IxlI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=gjdsqU1ZaXizwfvBQRbqm+KJz12FlACSV0C0nhhTk2UlAuVSF6c72yujZ/a+t1OPweFCiNrZ32YyhS8iMQB6CL/F7vUwfN62V517STxj1WCA/uEnUb1MKpCpuzp/iXQP6c4PMlaItLPBc5Q6SF55fgiVLtIrSFbi9usRciN9fns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AkpCwTj+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z/ERwA44; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AkpCwTj+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z/ERwA44"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695EP7sD1583630
	for <linux-kernel@vger.kernel.org>; Mon, 5 Oct 2026 15:09:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ufaCf0U2AcnN/hqLilmYCSsvPuytCqyVtjw/wA/CUsw=; b=AkpCwTj+wij4vo2h
	+jineqiZAyF5xU4j7prbDAmwfTt84sutibdVDJjeVAKNQSD3cD0jPtUr2D1sRa5h
	6RvPAlaSX3wBv9IP8aG4vrsq0NL8eRtfRVILiNt+Ao277uwmM5xO7DRgXRM5fmy4
	jNRnA36M1+QYuT915FxONO9/NjkODOPBD5bRx5Q8h7jL/s0Cj4+z577mw75OOC82
	NRtcAW/jA289nzzWPHuVcgGhB3ZMviywRKrSrbsrdpK3xzoWON7n4soQ7e1HwfO2
	afqnlJWhXRfwG2zTRtnbOrUKBxjeGgWQ+o89wfnUbUXhgxP5uMqsQ59tmq8muXL0
	2PpwDA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h41gnaed0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 15:09:56 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc78c0402e7so1015870a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 08:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791212996; x=1791817796; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ufaCf0U2AcnN/hqLilmYCSsvPuytCqyVtjw/wA/CUsw=;
        b=Z/ERwA44lHm5EIyc0G27Q+uiSf6gMrDg0PWqE5X6b1lHYOPckyr/9+jZEfwVaHb8zV
         KtBLbnRXEWi8QEEzgWbLsW4IuICnU0rUsl2xkEu2PdCtG3VxmZ3+aPE7mWWb/5aXv7iG
         9vzcRWP237bglBdI7hyIbF/c8xEYHP/NKie4hztgvxCHfsMfewAlb2iWVEmI1QWhNdPh
         JuQee9/+oGbryVGhtauaP+Zg46sMSDJm98UyZgybx++4Xidc9GJCyr1hZuDJQ0xj9mY3
         JRBugEtWJ70/g3yJtvLV6TuVBuykgQ5LNohErYwfC0Zz7uozQL/+zO8TA9UO8SdBJI0s
         bRgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791212996; x=1791817796;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ufaCf0U2AcnN/hqLilmYCSsvPuytCqyVtjw/wA/CUsw=;
        b=koo65DOcuYXUioGCWFlPqqZDSr38JaSTtzkWWHD7SrLgLQERhoefjsuFwYWpEfBSV5
         Ykj5QcCRKxVUEwf4VM4zQyk97dG7HtJja9PVyVJg10mC89/lMTlT6dNzskmx7TuiMHmO
         9AmSvpXiDbXyFN//exR4ymM+wRGnBKEYl/ypmUDBh2vWXqbIOniSi5PQLQwnLypnCJ80
         A4F37mCSjGvwtvZh+8oYhUSm1cdDVlfzIyoc9aFJxsS96G1gS29tYq4TuphnXE67nyHW
         3JSij1VEeiqEIPSnjDo50+2vSv8Ngi7LRyYKkeNljqxfQ7WGeV2YMUNSK4ROiV6gj6tR
         0gWQ==
X-Forwarded-Encrypted: i=1; AKwUvBzxa3iMUwiOj3D42aR46fu+0bXnpiaWeNtAD2WvA/6LBo9j+NqUTjZyDy4hWsRTnfZp/QMus4cP13KQA8Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYLmzWMyF8CXDdyEjRa0lhx/ilUg5RlDjN5mmpwllKG8nv3e2Gy7
	nF4nLsToL/N1KajxE7NjV3ll9ANgs2eUu2rp28b1sbN+aLtph4oMZDAB+Y9U3RW0YzMfqvNV2WV
	tCs4V/j/eWCCnQtmeE02GzHrQgpkemvLSWUIhCxjrLc/eHQ1GQ870+/eFPO9kTeMmE2M=
X-Gm-Gg: AYBFou19h4GbvuPvwrwa+89b63Cab4w4DSVFjp4i2B3rxombxA2urqVcl4tKR/zyV4p
	5Rv40cjNQTIoRir716+5yB/hs/vua6UqYfLh1qZ8eMZUml9avZD0GKUhPL2LQeRRUnnL7v0zh1J
	JB4NTQAex2tX8xTnE2QZlBL7XM0d4be853cPLkmG0vK915NRxLjLMyrNfjZ4tlP/zJ5V4nq5zTY
	lZMRMab160gN8tPI0TRozSg7A6vStBVb58s7NZnqEIKBgX7uIRSKAq8oNrEMiWL5rFh/3fE0p09
	OOieqDem/9keEpbt4eP9+r+boOgBhr3CMgLf3jiZFbYqFBw9Xm8zsV3dgSabo46+d8VS5VcVOxK
	sfUBOovbCXLXOPD+vaHprPXN45xAs1ge8N5AwOCR1LQROB3JkdI/BkCQ=
X-Received: by 2002:a17:90b:2d4c:b0:3a0:d7f2:5a58 with SMTP id 98e67ed59e1d1-3a6ce606ea0mr6489955a91.3.1791212995719;
        Mon, 05 Oct 2026 08:09:55 -0700 (PDT)
X-Received: by 2002:a17:90b:2d4c:b0:3a0:d7f2:5a58 with SMTP id 98e67ed59e1d1-3a6ce606ea0mr6489926a91.3.1791212995189;
        Mon, 05 Oct 2026 08:09:55 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e5a5cae1bfsm9130075ad.28.2026.10.05.08.09.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 08:09:53 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>, Kalle Valo <kvalo@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Govind Singh <govinds@codeaurora.org>,
        Brian Norris <briannorris@chromium.org>,
        Niklas Cassel <niklas.cassel@linaro.org>,
        Albert Esteve <aesteve@redhat.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20260914-fix-ath10k-dangling-v1-1-15c5089682b1@redhat.com>
References: <20260914-fix-ath10k-dangling-v1-1-15c5089682b1@redhat.com>
Subject: Re: [PATCH] ath10k: clear QMI if failed during init
Message-Id: <179121299276.2358654.4837860539167198110.b4-ty@oss.qualcomm.com>
Date: Mon, 05 Oct 2026 08:09:52 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: GR6uYfr4RkiIE5af1RNi3ezPHDLBhwar
X-Proofpoint-GUID: GR6uYfr4RkiIE5af1RNi3ezPHDLBhwar
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA1OSBTYWx0ZWRfX6g6N8SzGGZze
 pzmjrYQcXryrVx1Vv/lTljTFmwBh6FogODF8rYpjf+Kw8ygpN1KoLxIyhZ20tOQJDoO0uKu93WC
 bvGVcqinfCOdeLSVX7EvdLH9F3LS8QGmf7r5wvMYqyPYlwqQYBbqEvU+vEubR1LBYrM9mx9nEHn
 HI8E7kxZMG3rsv90CF+pH51uJ+5lecYafpC0VyKIGrvdjC9at60vvRiHC786RRjQL1al3ZFGnpH
 /k0m8FHgzfs1Gnm/jhBAgyhsty1UnBG3GYQZWFtF8mH4loR9zFr45dL5/6VBQuWnStU9h+Uboif
 enXQIQrdJtAOM8qLOUBRwXllL6+V0tj01fFwQr1O2f2+nBnHMFcq/xDGt9A9Nt05ImiY0iYxOyh
 rQsN1lKIroo+LzKuZedYlV5B06GE6Lqjf6ZuZ7l5KNtNfGxn8XVL9q9PPWoCRsP76z0jlUr3DrL
 XkCkq8yK6MgdSbMWOCg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA1OSBTYWx0ZWRfXwF5tw/IY2l0s
 yp2/r0xdSYxV8zTUABXAlJM4b+DZBThQGFQSQJQ5psr8EBDrAvwOdXT+anG+k91n3iJaviyLima
 mX2NFwJSNACLbd22+6tePt0j64tsW6g=
X-Authority-Analysis: v=2.4 cv=P9WvFSAu c=1 sm=1 tr=0 ts=6ac3bdc4 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=5T_40O9Wg91NOdeNfzkA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_04,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050059


On Mon, 14 Sep 2026 15:05:19 +0200, Albert Esteve wrote:
> A failed ath10k_qmi_init() left a dangling
> pointer (ar_snoc->qmi) in the cleanup path.
> Clear the pointer on the way out for hygiene
> and consistency with deinit().
> 
> 

Applied, thanks!

[1/1] ath10k: clear QMI if failed during init
      commit: 129324b60343dec19d45dcf87736f129b18b95bb

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>

