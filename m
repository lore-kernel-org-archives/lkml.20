Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD66138E8B2
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 21:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789075914; cv=none; b=hxisszQynbs4LLd1Nzyi6Ub+9VBpHXOQ1cpz4iS+O0PsiyIMPVtAhQCaxfgbkszBpR++z4zHxBuh00hf2AiJcBRmO9HObgEKflC/2fCKQVUD/X7f2Mp1eLu2nsfgAWPj0jba+2zs7rvi2XS+UYdvz6Sz77ERsURryukIg2C/srs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789075914; c=relaxed/simple;
	bh=Z/15ZFY0wE0OkRhSKa3HQyagLAQ2WKOxloisZVRiZK0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=KQc1vbiEk0ojC3lGQkoQQlu8HWQGHf6Qv+1816mQcurBjH0Xskcp3EBd93dxw0tRSsXZUOueJJv+opq+HUmd+9JUSM7ctt9PkvBUv+0TCMxglxXV+LJVwCr6MhnVyiJyAJBRlxtNYFlxgItCxU37ste7HjVQDhiPHCixEj7hHtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d8Aesg1K; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B8fj6/Tq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d8Aesg1K";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B8fj6/Tq"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ALUG1F2996811
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 21:31:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	a9JpI5ZdRgndTBK5dFpOoWltQtREyWw9mjxo6j0HYto=; b=d8Aesg1Ka6pej3ra
	CU6xakqdtgNOAZJfrpQV1RVvuNu63lBgC3KQrQIRh2Up5HLT1knMAxucBEsbXC6G
	IoWbeQjtmn8RGVEed6QV5EvzkWHrmlwdqvIiOhgX+4WhTn6IYn0cKFXlrTY2qGOK
	ZsWDc7iXkJ1sbbiEbIxWu+Y4jFqasWOnGHCEF5u2HCWiqHCBveMIPqcHniVklRQ+
	uz39RhdeQ7sYfgagcSxkl4ZaDj+GOSe/jvP9VaVNnu0uOnjmnt+bkLfY0+FKwq88
	cKOPSJCPI4NYivB8fLdLJaviWzVolHv4LKGPp9oRe/sBphc+9sB6djBRvcO7zwxZ
	+XSDUA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkxd8stbv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 21:31:51 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc4c1fc9ceaso232875a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 14:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789075911; x=1789680711; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a9JpI5ZdRgndTBK5dFpOoWltQtREyWw9mjxo6j0HYto=;
        b=B8fj6/TqWDpwXefhwvtHtbe7QZ2sHQ8wWPL1BizfmtiUGXsiARM4JdwXsGVT8L7+pt
         Hi/WphsJNHW4yyX26GWqOZ7e89y/8YmxKWAeku/AZMJPX6GiwspfGgHb49WmZHil20NH
         bNuvHG4+EOlPlTSxkt2pF0Mlx9kcc3wWaGSJpkPZaYSAMeApqnCLpGSROEhMb9vMNOvo
         GzdAG+GOBJZkDtQPBazek6iVOOoAUXhBGZm3sCuuJiQrsh8Vooo+/Tz4fFkH4tZySyEa
         NjVMAcA92XZxglloZEHlq7YQJgGN0O8ULNgT2MSGvBx/UZth1jaXBcm1yl6hn6z7OOCY
         UZVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789075911; x=1789680711;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a9JpI5ZdRgndTBK5dFpOoWltQtREyWw9mjxo6j0HYto=;
        b=rlineLZiNOBcnfPRiDfuBRNUvGL28DkjOzQHV+1TUu7qcal/7aC/nKW3Q+R3odrvTY
         tqzkiylmhfXDqLjNPW2/mmDS6ipmyHvD8vkSBmGjH3XTQQmOPFDwGfVLCm+pOkqpu4wc
         9FRDUpGLkQerSx2EI+J/WsaZYDGdqXjcZeBBJFzyao7ngiZy4YpBTQM4//ynqxxnxS8n
         5elPAyF89cE2uDGZWifgVfAS/YXimzfWbkChMz4mpD3W4IttWKVDs4p7wnlrZ41539wu
         USd1qm+u79sQq0l8fxkSW5kTxAN2N+kOKj59CmnLfjxrcfBxWBGKjltlclEeA9PNdp49
         xQMg==
X-Forwarded-Encrypted: i=1; AKwUvBwoOzN4Y9zk4RJFh4fJeWgOs1NVNMZGBPf6WmyAv8Yc9OZW4CquJJ5/VvxbCIt4WhKi/0pxTR/fWvUBOjk=@vger.kernel.org
X-Gm-Message-State: AFuF++kuvvpIBI73nP4Mm8bnf2u29n9y+HCnc5L1R6uSNoqbMdGeuIj5
	pFaOK1zC5hyOCBC3KYwvHiRCBV1xBpri2h2tQxXiCuOisnRbLH+H4X7jksYZiv6dedN9+VOhxBz
	L1S9Bp3gAppi9VNZXqneAxDW7vTC5jGesIMQLBMO+P3xkWezHdTE7qZnS17+sf1+I5LD6UvUII4
	U=
X-Gm-Gg: AYBFou2vfW0zrEfh+3YKVLkXeqJtbkc6Fu6DSrl+kVpIBmMgbeSJOUt+77Lg8er8Yyn
	ceIx8/PeANDOYMj+fZEyd9KaJKeJ90Bo+PjTYd1l36cfNK974pz5bKX5fuW7z1qIg5Dtt/VTdd4
	thOPVq7Bmbn5QrnwB2xf7yQWx1ZFFg8zEKBJTBw4FleEz0ProYRDkPx0spejSsDMe/j5TTR4FqK
	o/eyKflw/dxXvjKBWR3zKhFfgfCNzXwlm0NzQRyjzVKw/tyb6++qXY8h73aoycyHsM9y4VT64Gg
	G28dxlOlPq0AdmlhhVr0ZcTc25OARufX0/RsiblhyWpuqAF9JF/aLimgL4VgL2+9NWUWJFDGvna
	ssaJTuwRjDf0Z0eDTQ6sDeIorYGVZOHbnDmp6C3FrgItoJ3ra1SuRsdw=
X-Received: by 2002:a05:6a20:c70b:b0:3d1:c0e2:936b with SMTP id adf61e73a8af0-3daed1b805amr1616916637.7.1789075911304;
        Thu, 10 Sep 2026 14:31:51 -0700 (PDT)
X-Received: by 2002:a05:6a20:c70b:b0:3d1:c0e2:936b with SMTP id adf61e73a8af0-3daed1b805amr1616835637.7.1789075910652;
        Thu, 10 Sep 2026 14:31:50 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f0feaasm845733eec.21.2026.09.10.14.31.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 14:31:50 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: =?utf-8?q?Toke_H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>,
        pengdonglin <pengdonglin@xiaomi.com>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>,
        linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260813-ath9k-rcu-fix-v1-1-424665a1ce60@oss.qualcomm.com>
References: <20260813-ath9k-rcu-fix-v1-1-424665a1ce60@oss.qualcomm.com>
Subject: Re: [PATCH ath-next] wifi: ath9k: use rcu_dereference_bh() for
 sta->rates in ath_merge_ratetbl()
Message-Id: <178907590977.684897.13204902551937934460.b4-ty@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 14:31:49 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: h2YyxnhM7OHgD4t_pGVyJivaaXOmZ11u
X-Proofpoint-GUID: h2YyxnhM7OHgD4t_pGVyJivaaXOmZ11u
X-Authority-Analysis: v=2.4 cv=PchqFShd c=1 sm=1 tr=0 ts=6aa321c8 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=464x-sIwcsxP8w_vTbUA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDI2OCBTYWx0ZWRfX7XIVrMecMyk4
 7Ve+OxZ8Fq/PpUy8PAqBbayu633uCwfj5f2cLRYkNWR+l0ME8pUiHLIrZVjv32cqdlhaoSalXQi
 92PtgQRX/DIqxDtyRzIxvDB7wQLs4QZs3Dj+EuiWs4fjo56PzbGTOLkMhGr1J+ZrLIVrgLwX9eR
 RZLhQJxyFOOJBmVqOoTcIZHgHifcq85S8R4BraEczaMhqys8U7Ih/0YqBcb+ZsDb5ONqAOJNpCY
 Rmnjc1OxfDBz82YSNAWMfn4/hpybI7og5mQVqK4AFHs1oxUyXLUGGYJgF2eypFQotDU2Tbq+WFs
 rw0n5h0Hbe3gaPeh+nlkTetLi15iJ9AVXmwbCPGnenfkMARmD0hW0/P44wW3C5aS5iTHejcu8Lj
 SfkYjyf0vevLi6tfTap75Y83wchWxsT+3W9kwcVeXHeiF+8/rtUPrZ8u8wAnWdtx4LBYQPKbv/w
 7PZAXaajW2j0Lcytmow==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDI2OCBTYWx0ZWRfX6YVE0d/T1LqE
 0B1HpOVzEBEFh2Yc/sX7Mj0USbpeS+OC4eJnNpMri6GYpYuIl848AyotekB0lfPOT4aIdbrzlFz
 HKMB54lDbSdgcQo/mj+LkQxUzyjCxpw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_07,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 adultscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100268


On Thu, 13 Aug 2026 10:41:02 -0700, Jeff Johnson wrote:
> Commit c4f518736472 ("wifi: ath9k: Remove redundant rcu_read_lock/unlock()
> in spin_lock") removed the explicit rcu_read_lock()/rcu_read_unlock() pair
> from ath_txq_schedule(), relying on spin_lock_bh() to provide an implicit
> RCU read-side critical section.
> 
> That is correct on kernels without CONFIG_DEBUG_LOCK_ALLOC, where
> rcu_read_lock_any_held() falls back to !preemptible() as a proxy, and
> spin_lock_bh() disables preemption.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath9k: use rcu_dereference_bh() for sta->rates in ath_merge_ratetbl()
      commit: 93de43318ecdf0ff5f0e6125fe33a8b30fd10c66

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>

