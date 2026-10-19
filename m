Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C613D48C8AE
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 07:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792396653; cv=none; b=Vi9P5gu243lv3NANOeOqw4/2rLg+bbfLzs9F8l03tubkqQ5OiQYcCUCwGdQ50w/yh4shMdlh5BF0o/OF8aafKRsHGCzOsoimE4ELyuTLNu8ATYgHkG/wMjmDqllqVwc4p5lTapoUpxiUPxD1VbgvvLgOJfWfJtLfKa19Fee0Wr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792396653; c=relaxed/simple;
	bh=u6Ds4ERwD4miSjn/mQSOGAbHAzapGlw42DsLAnt5SwA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KVpEax7g0t1YFt4MX7wuUQOY2DlG4I3dlxMIuMXujC0FUgLVrBrWChXDwq7Me7vkh+X7vFAGgSKdI2YR4aDORi5wBQd45huPCePpdnA9vx+z7rHg6DJ0H99B07NJQ8J0cC91R+p8Hvf9GLflWUmv2AXi8jyNBZkee9jhzr78yAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fN/hrEPR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MVqHF8PA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fN/hrEPR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MVqHF8PA"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J4j49c1702840
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 07:57:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vK7lFhQUw8fB5ffcbcr+lqba/Far5hOtw4MuBbSmAlo=; b=fN/hrEPRMEN6Tfce
	lE0pUjPijZU928u/hLVXYEnbWOgZuRXf2jNXySdQ2tD4FE18Pqw2wuWL+vSHDfuL
	KIm+WhgYUkPgjXlZIzYFulEc6F7YsShAvw9OrclDpoSzPnxAnyvjmHjGBfJ15ARN
	48WHNfDmTeoLAkf3dvUmno+vRy9ComlqkfkBwrp8P9MXSF9L4p4XzG4bq3okeh/C
	k1zJiRaISB7Fwl/pGK838mm80u5+XSTRq9snRs6ydz5QdZfUy14ELjj4VOatSFov
	TefaTv13E940KtyXb0wPOWqe8cG5q2E/qmdHczFhgLNhC8a0y+AMiEkx/Oazu2Rt
	w4UIIw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hd5w19p9q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 07:57:30 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e82060977so369745485a.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 00:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792396650; x=1793001450; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vK7lFhQUw8fB5ffcbcr+lqba/Far5hOtw4MuBbSmAlo=;
        b=MVqHF8PAlQbSCcsPwxCJCd9/kyhJloZeB2AInJ8U+Aapr5M5pyfI9ta3ETy6G5wJd1
         XsAnExOrEOyiOHnXnnWuRLDN7UkJyPTNeza6AXyTA907ejj3nYYuIJJexjzqOJ0R9vGN
         e6sTQTwkSV6+AxulYaschlKIcdqtcfiAMgfDKdqpV7CTnv/MwNZKsjM6hlQjeIplMvOR
         MHvX88HxCFnCn3xYYxQAYiXgyvHF8KWQwBnoKkGJj2GOck3Yy2UlkGDvweS+JBfsgf6N
         9WJdPhQu+TKn+1NWhQ4f4ZpUwRZY+Y4HnIjSZ4ZQ6m28sbMP8f4NoeXLTSfp+z8IyEGZ
         3Lzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792396650; x=1793001450;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vK7lFhQUw8fB5ffcbcr+lqba/Far5hOtw4MuBbSmAlo=;
        b=kp1iVkDjBAo4tWfzPcEAXi/Er21tB6IsGB7kkGTRj4TAJrMs0L3c12+UvgTkRrM2zY
         7j3S6gu/pacS/tzub1h3s1oQ7/SCA63gbhkYaRv6Ec65GDvswEzsEiqK8xsMUPVrIo5W
         6B/2DScqzf8cAlN7kPlH5AQeeb+UfWX5quUNkTOh4cdz6ghk66GMs2OCHzarR30InzgL
         E/DOApk2pt2oO+MepPPjIqIRlnVS1lVewQOA3nWCybGrQ0DDnpzMXmIS85/d4+AsDO2F
         WqbD52UlvTPQne8Nn3VZ4UhK3r5mSUVHLypU2CE6WX6BVl7fPx5LyhZahoUfcltg1Lbq
         gzXw==
X-Forwarded-Encrypted: i=1; AKwUvBw4WbnkrlzcGMl7uqrsBXjLqFAo50I11P39f1/9iNwR1rZmLYOkYOssPGNDv1idhMIiPFWw4atwly/Krlo=@vger.kernel.org
X-Gm-Message-State: AFq9FYI0q5zIxRFKKeqLkWo3WtifWLrtAMQYI9pcil7SyNAkuem/pptV
	vaDTFXTt1ByXaGWzZuuuhhEZdmBzgvXheS7EkRonJqFzmo8YOddr6QrZoQSZi2RRBrGj5tzNjfg
	76PXqo+z+1lmO1kzTVXtn5blM+a1dkQ6oSh4lEFH+CvHehM4rN55YhjtG68o8CrV6g7M=
X-Gm-Gg: AYBFou3uMVhE7F0leI5BIhuTbRw19iaAASTC+hCj/Qg8OsYtAbJD/hCz4kBeHwvZuWl
	bj1ACUEIzGCnTOJurgtE8/E4PhfS9dckk3w2R+nCpyZM4OaKfAEWocZyffuox40M1NL4kzLa1XH
	iTgV40A0kLQNbNARCPOyM1zLNOzIQDijRROGzCidIc1ZhXk+yPo18uSdKFdCaz6bQdJF4vAqVox
	eCBH+WK7KcOSS7MuNpkSK/6kDoCK68rLqKu28BP6K8J8v3twx5w+akgiXks0+Wa4quS5ggWG5Zw
	x1trxr5ZP1BciT5+waYbOqzNbWWigiFM83QfTXUaxye/iEZKC8vB6VjFwpZJoVmK4JtPw0QHmwS
	VejqufT2/6q63w5eIU3ocyMAgTzA=
X-Received: by 2002:a05:620a:45a7:b0:939:b053:ce44 with SMTP id af79cd13be357-93f17f232c1mr1703872485a.22.1792396649121;
        Mon, 19 Oct 2026 00:57:29 -0700 (PDT)
X-Received: by 2002:a05:620a:45a7:b0:939:b053:ce44 with SMTP id af79cd13be357-93f17f232c1mr1703869485a.22.1792396648551;
        Mon, 19 Oct 2026 00:57:28 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1cf983b88sm253558125e9.7.2026.10.19.00.57.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 00:57:27 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Jayaraj Devaraj <jayarajdmit@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] gpio: lpc32xx: check devm_gpiochip_add_data() return value
Date: Mon, 19 Oct 2026 09:57:25 +0200
Message-ID: <179239664152.5295.18206280425730298577.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261016154209.23193-1-jayarajdmit@gmail.com>
References: <20261016154209.23193-1-jayarajdmit@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDAzMSBTYWx0ZWRfX1Ox1zcHGjQ6Q
 IB6qq22qWCeiCGVGYijV+KcFHDhzS33HL/DN7fcO+bYAN4tFubS7WpJQCCsvdtuHGuZlIjvnJVo
 NwW+HhNcrlZnfjUJWArdRlRgnhAlAiA=
X-Authority-Analysis: v=2.4 cv=KuPYSmWN c=1 sm=1 tr=0 ts=6ad5cd6a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=HUrnIdepTNFFqM0LFW8A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDAzMSBTYWx0ZWRfX6YsT6wOClGIM
 gzwi0I1KrrNrXjd1JSPiJJK17CrHHjxba6pOF1HOS3KBnXsRGWhkQ5i4Nv/nf3dGjAlq1G81gBr
 1tMeQJGEzPDUBI9+AVAaya6N1DdkiXxtKlxCLEh0Zfu6NIfkRDPgYSBBUZwRH1VowQ5EJJQ9DYn
 ocnZ182Fhk825UouuhyliLyJizzT88F5pICdyu1NI/ktyosEJbiy73mtVNokHWCuSFjRL1xKGfp
 KeVx4QYBBDLlOHUDGUUZHck74YiHZSpbvK2v0e+2acw1CIZkOGHWiApr4nYc252zyFa7/+ebpJK
 17EpMyFVnXE0rBD3NpHJwFvLaseE7l4hHf2k54uQ3NB5PpyFbBKyDPDLecJewOcp1MDDiLZqZbG
 UYUpu4100njHmLd/BAlbic6UjENuvcEG5Yvffphj+t7VX680Qaoom7XFhOaCl4o1HbDl345Lx49
 NxUlbCDAvW9/GG6eC1g==
X-Proofpoint-ORIG-GUID: JdIFj2YLUEu_AOUmSt3YIg-5cLvmn1rP
X-Proofpoint-GUID: JdIFj2YLUEu_AOUmSt3YIg-5cLvmn1rP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190031


On Fri, 16 Oct 2026 21:12:09 +0530, Jayaraj Devaraj wrote:
> lpc32xx_gpio_probe() registers each gpio chip with
> devm_gpiochip_add_data() but ignores the return value. If registering
> a chip fails, probe still returns 0, so the driver binds with a chip
> missing and no error is reported.
> 
> Check the return value, print an error naming the failing chip and
> return the error code. Chips registered earlier in the loop are devm
> managed and are removed automatically on failure.
> 
> [...]

Applied, thanks!

[1/1] gpio: lpc32xx: check devm_gpiochip_add_data() return value
      https://git.kernel.org/brgl/c/c117172a46c5169b28293003a109c0cc7b7588d1

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
