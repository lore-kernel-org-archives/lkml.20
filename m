Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D95564F4032
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 18:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790013615; cv=none; b=VLp80/A7ltR9EvivmJohlYohfWTIT6DHJ8xzxVH7LMYB+7x8w73MTBxfbIgx4FiYAUbR59avd/I+p6I1hng7zlN6Y7+J7eqJiqBu03CDHJRAv0hCeqwv5s6spIgo9DdQiOL8zyCzOFCPUk5/3TrCHmQGWBV9iTKIaYgVjeX5WBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790013615; c=relaxed/simple;
	bh=V/azQhttc44ebopSYPCbCKIgpwm4SqDUHB3m4ffi+Tk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=J6QRQmEk+jKOY0MtBliqA9p9nYutV252aJLa2I0eC0AeDiXQ8HbONmD9mO2g3QlWB1Z9XIuAEdbRlP1h8Y6+1UYj6SquMuAQ0tZvT1WEWV0CqfaQ+82Hm2ExxatRlbA0QkP/u4Qz9FojSj5PvWWhpYxcGM9QKKcmzUs7DbtSdfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XJ22OteC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qb0hj+C6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XJ22OteC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qb0hj+C6"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LFB67N886453
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 18:00:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pm5B7pklnwfPYckNndlu/FGgaXUOCb3QM83BtmKF8D4=; b=XJ22OteCctDIchKI
	LRkHsw4T5MEUUm+yqX3wRx2CO38VN/Nh/dC+WCkoMGPzSpsdazHiC2F2rQnAM0lS
	7COR8x0+t8jt2Ygtdtus1o+suchhk5bQOFir/nHRzvRnezw1dya0ljqDYTZa32qs
	ZEu8+qG2vzvvyBwUtiE6afk7Y5TBofv8/guRYhCJFyQS8efgq8L3i4EEjf8s/Jqm
	k64V1rLlZVa54ijo1u4j7TmDrVJGP/T6hsPDUbMEGTOcjI7lyoZ697cP8CKE8SDU
	ZCxX/tRckE8txaQIYOucCu5YQYba0hVUnXjLyWZaVwZh7TIxYR+06bi4X6BZDIGS
	8vWSaA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu0rj2g6n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 18:00:12 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc1cdfb337eso4607286a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 11:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790013612; x=1790618412; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pm5B7pklnwfPYckNndlu/FGgaXUOCb3QM83BtmKF8D4=;
        b=Qb0hj+C6sPF5zzT6vnqHxScnt12gqf59cFpkI+QQmY+Rf8cIo7iw+PA/X7q7VbQ/rE
         OHSLZNyr00+LzAeUi0XHGxEDhtBBv1w7GphAEyA9U8+qQgyNtcNlPSaqKhsLCMy9Vc6O
         bnOnqj2Nx2eYYd0cucs8OhJMYsYlvLPVkA0CoNsgNjNfjrUbEjM2jHDShro98vsJumG2
         cWEXavxWVgIBzcOCoFkvECWnluu1tn3x1GtMyKFDusoVb6+Je+6Czk1fVBC3t3QrS4+U
         QpciHB3kWaS8+aRb0nagqyQ6WCx6BPjzloZ+mXVdpFJKVwaM16kJKh8t6oCiLrVhXff+
         bjwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790013612; x=1790618412;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pm5B7pklnwfPYckNndlu/FGgaXUOCb3QM83BtmKF8D4=;
        b=S5db2rOVXWsiplqWqGDfi1oeqbVkeJbJX/VadTHP4nUJvhwdwaVwhLxlcgfcMZ+kpm
         FltcwRmd2E3ORuUCVceQC7H8wHi+3+B2vwxlly57cDbmPeeuT8bgDCUIkyMT4XT+D6ky
         9CWeyArQRZAMIh8ADznk+dypYud1JxALi2T6+dAWTwq3SfqY/armwKJOy/tDHcR8By3T
         uMIDfGixjdBO1QR01zGSt9Bsp3aeEgdgpzzwZtKqWDmkUVNo7buL/rYwZbWuEoljUIv/
         hwIGjOZIOSExoBH/32i7buiU7UUKifv0xRKj5xZmg65uuiOv+5Jded25yGmVPP20rIul
         YX1Q==
X-Forwarded-Encrypted: i=1; AKwUvBwHDoBQaPExi5ijvdt8xv2rkqEqN3C3pvLdyMycUP3i3DZEWtwu/GPDEyXmsWu7TQRP0hMREhcLMoOZ/PE=@vger.kernel.org
X-Gm-Message-State: AFuF++kgJgQ6mkpq+I1VOUDu17A3Kx+ezaXHc4xqd7blN+NIj7Yb4Jr/
	tTMNc5mkhwsp+amcoPe/34P0RpLGA70NmMsQsR+L10O3UEkILywcmHyN8b7HtZV7SSuRq4WLj2O
	yEV4SRR9IEocRgm31we49GQ5rJTvzD2gsfViqC8HbK/uwU7g2Pi+GOKnBjyCXbqOBM5E=
X-Gm-Gg: AYBFou34gXLlm13fEqP6xSI7UmsTcRExGAQ6Q0NyLqrBg49XaZXdHqupeibxLzAr1te
	+W7cQ8W0a4cd1QTLvzEx3dBL/zfo6Rstt9NBYkVOTDvR8Lma2XxWD4brp1gA5mglY4WFg71J8LS
	bPMv+AO2U6BYiFaRI9QGSTknsBkL79DqqV2Vweo7/NJ625ikwOxAHXP3vjbHc2+mDgVx+oUQdub
	cv/1qUhckXsXcuTBvmNj9iypWUD2Zc7lQfmcU1iaqDiBGplQLUkLIEzQRVk53jTnNxcWJ5A7im4
	Wn6wRsgRsyqv+/IaHzdcbZy8g00qMCoS8b4DqK7hhSUjyT9XVnHO3Qu2nqfD0qaFoi5GHqwdHrs
	rKF0FTen6VxzVAghCC5Esozv4n3hO39GHPCDzWr/R3J2bY3l2vck8hw==
X-Received: by 2002:a05:6a21:1505:b0:3dd:85a8:4c5b with SMTP id adf61e73a8af0-3dd8c591b15mr17679620637.34.1790013611648;
        Mon, 21 Sep 2026 11:00:11 -0700 (PDT)
X-Received: by 2002:a05:6a21:1505:b0:3dd:85a8:4c5b with SMTP id adf61e73a8af0-3dd8c591b15mr17679578637.34.1790013611105;
        Mon, 21 Sep 2026 11:00:11 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c3311a716sm22873198eec.8.2026.09.21.11.00.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 11:00:09 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: =?utf-8?q?Toke_H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>,
        Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260814075837.20005-1-pengpeng@iscas.ac.cn>
References: <20260814075837.20005-1-pengpeng@iscas.ac.cn>
Subject: Re: [PATCH v2] wifi: ath9k: reject short WMI command responses
Message-Id: <179001360935.250336.10074436066616143164.b4-ty@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 11:00:09 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDI2MyBTYWx0ZWRfX5zI37wM3+rUY
 tvY2nthQ66LDlUe72paqEj2qmJWwN+7nCO7KiXczXms3ZxOCnTIzhcJaY9TpRWSw+ZRUlCRB/1+
 3vMQSDB7g9hrepwYxt5sR/RXSxTloPo=
X-Authority-Analysis: v=2.4 cv=AsR7T+9P c=1 sm=1 tr=0 ts=6ab170ac cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=2Cg4bRl-HtXqh6CIwg4A:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: tDXsegTHhXpf8_BiCLfGZhof1VPGuBws
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDI2MyBTYWx0ZWRfX3y0mnoOuVgS2
 0HsFB+OfB43XFI1UcVSXVA8R0x/bWPr+BfiaBsFD5BtMWlK8QNUPK6Wg6YzFsYVUSnnJi0+AD4U
 9o0/Oqj22Cq5kSDOlbtz8ZTX4aRShc4aAsPBnz+hg/NZ65m9yKOmgsn7LLd8TyVYCJuJaGRYlWg
 eH/edF9SHbjwt/iRe0IAo8vzwDOWbWwLChMH5my5O1jGRYPhSN3C3pdpECy5zyCo2SNWAX7FJaE
 peEz0YaszCjN6+LMDG5OqXsSeeXvOpJyKj6PQlx64Ah5iu3LxGSEqEN8qfIS84WHoGb+oX75c0v
 OuwurezgqZeMteuPA6O5i+eIHIwcdmYv/ILv/BlczMVxuYRZURMVUANWGD/1xrZ+ExIP0RBarB3
 JbyXPo4SSXnvEFrBzLpKqviJiCYZetT35zuUKj//NDeeLS2YwRirEk9vOS95zEn8Ia960d/ru81
 gCFD2MW4ZF/2gZy8/YQ==
X-Proofpoint-ORIG-GUID: tDXsegTHhXpf8_BiCLfGZhof1VPGuBws
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 impostorscore=0 adultscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210263


On Fri, 14 Aug 2026 15:58:37 +0800, Pengpeng Hou wrote:
> ath9k_wmi_rsp_callback() removes the validated WMI header and copies
> the number of bytes expected by the waiting command into its response
> buffer. A device response shorter than that expectation can therefore
> be read beyond the skb payload.
> 
> Record -EMSGSIZE for a short response, complete the waiter, and return
> the stored status from the command path. This also prevents callers from
> consuming stale response bytes as a successful reply.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath9k: reject short WMI command responses
      commit: 93ce8ea70451e800601bc9444aa33043de15d67b

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>

