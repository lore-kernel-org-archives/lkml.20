Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793708988;
	b=4lQ0041zKEsdG378ukUhvME+QmccooHORTchc62sdJbP9BInrJxG57jX2gbujl+cdjx4
	 w45SfJvMnFSa2lWs/oZ4QnKX+icx1fXPg5ht6T6Pi3Rt8PXFuznYrZobRAqPUH6QHr7Pt
	 ExZtd3rHRvDhoemvsUd6sixmWEoSqoZ1ndW787z8k/8p2ZUGCuB7hZHST4oTB44ypmj5n
	 fF6rioNHYKwYBziixjaYCUJLOpyVik7sAYvcT8Pl1qAK7wQnpr0kjzweDgfwcCDzDZWP0
	 ARTYpGnHd/Xeu26WaTbVzNC3/T8AiwvDr8OhoLc7eLOiRIvrqqbvYIfBwgYCPQ2xXuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793708988;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=IDI+igDoc6QkC7pgWT8Wprn1keJKc8oLjyvAr5GbucA=;
	b=Nz4VoTcg2uUd3Xo6tY0/y4YDJEpvCI+OgVp1fB8IqAX1arb3DTv8/iOh2+JIpjNY8kg/
	 FDO4qQkztPdn997yFPvWLTXWHADy/dDMnMDYTuGLko7NgQeMBVZOeillrG6nk91s1Uvxe
	 kabJJfTFIyYkPDdpPlou8kWGy2EIhj5iG1oamTVMtE1kumJerXGfhEdME/V51OikKn07h
	 OGI7OB5B1YE3B5JNIEQmIMtUtrwEg9I07chKMkjymmxrJ6Mnjz0tPZhNQU3SeX+ZvG4DT
	 bUAFFH2nk/RtUfFK6efIZtATLH5oHuuz5nWrvg0PQ+9N5stU8G1GU+P0cpFXTK108sA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EDDclsUC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gugOoYN2;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF795606A328
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 12:29:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF795606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EDDclsUC;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gugOoYN2
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3CPQLl2497452
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 12:29:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IDI+igDoc6QkC7pgWT8Wprn1keJKc8oLjyvAr5GbucA=; b=EDDclsUCxxBMMyPS
	hSRvJNY9XyOMPssJxN2bWsAG3M5QV3Mo9ybSqfB56MCR9Gvl4jcHa4oZ5CftGMW4
	vzKklfqahmA7YyvrecFKafFk/s+yDkTrZhvYlOk+YO+p/UX0Lwcnjpu9UeCDwQPj
	VAE1xx8G3frBAyWWVkaZ9qhkmBdv0L7ye/k+4iHmsz3U0kLITNPElieRfQVAJLTf
	IVbCfW/CDlXcdVNCj0rEuogCOHzRPWD2XTjz6KffviY66ir/FXJry7sgis8RnXvk
	9NYXWmso4AmHZoKPeB0cbleLnfp3F302T6DhK3FdldgdcHLyquf3Tx4gJ9eJMKow
	3nzbww==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq07r3q7n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 12:29:46 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-98c6374b678so3745753241.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 04:29:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793708986; x=1794313786; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IDI+igDoc6QkC7pgWT8Wprn1keJKc8oLjyvAr5GbucA=;
        b=gugOoYN2/WM/kDivAuJBtXpihzzVU/JUJS14+FC7Uhqwdzb0ooMCyd7j2rBSgjpJo2
         L89FbR1PoSRMS6cqxm8NK5ZipdUOkd/ku3vUUsR6O6LM/+nBnMfmdE9Ms/YTti0kjO1d
         6Mv+HKKwzKc/21lG0ENyZQ5I5AKSzW3t1Tv7Y6z1kSggyzhETO+IcImhdmCuPcWF4ocl
         SAvtUnqKl1dpH1deZ7Tm302bganlXr1ayJYSo3GoOzXGIOtboF8lrMQEhkZgqA/Uu6rB
         LfJgEjGsfgCcd39P8fqs8aKLI7nNrLpgC1gIPEI7cY2kNwR7Fd4TGKJb6KM+0rUsSC2q
         V7Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793708986; x=1794313786;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IDI+igDoc6QkC7pgWT8Wprn1keJKc8oLjyvAr5GbucA=;
        b=WDIAFr5DfD9lEIyvHFAWLOggNpEOAj7inoR0tdHxJZG96OvktJc2wqqoZZo2IF9jCT
         9mCN8tXlfpzade7gBvx9N8H80++9PKaPfOQ0I+dR7/scDu/Qx4FpnsVKZesgh3HhTxAw
         rsPLSvAKVR8O54lmctuwssBKZSChULGXldg1KYUoyUI/TbYFi/+GpXBZ4b4yXPwB3HKH
         EXOazpCT27hp/tz74owq68EJylwJ9MQQRGmvj8twBGuTtL32u/RdKiE20vjisDcC5w1Z
         5DWu3B/0xf6BJBl4mnaaQ8PjbRlEJAcKiM6lqLno3pHZLtI8D7kbV8ksrSXhTG6u5Xlo
         hw1w==
X-Forwarded-Encrypted: i=1; AKwUvBxnMlf3GCNb/fYcRmAm/8gR9wDGBemmNudQaepfpn865F75Xjc9GnKYP/T1e8zH9TbmfJAoYr7Neb/XyDo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Agnb0mUutoi/TjG2awK2q8QdISHH8ZAJ+s2X3rJs1v+RfikS+
	GOEBqEJpMhx2S7R4P6rUV4SYSLnTWA5BGQ3g/VqJGaxdF+odPbCw7iPJfPDiEaqU7IuJ/kS//Um
	x7fd7xI5nOmNXCcGI+VhlSiae1rhmCrPNj8wiit0MR1HCZjjE0APEYqnZuaC+PHOdT5E=
X-Gm-Gg: AYBFou1+b7/Pr3p0GILOeh5NR8+JTxoahFxjq1H7zvNssVaVTP/elvM2UpQz6ddSN8R
	YFdPkr/jk6DpM2xB4sSXwRsS9/FtuLDJzln7PzwMnwGR/3kwmyNqP6xcu0FHU+DYNkKIyd87Ggn
	Sb1N3DZLQPvEvsrcfhJPpc1XFyTWpSqUBKpoKUywi9uFGP/U9vBNcleP23kxF8F4aZkTHSTzo1X
	aHxD53DF1KdBY/Cor53pSKt1o/JOcdofSURL0bRHifoArsFp180e+wKltHeCv0Hj9KJ8vPdyYlE
	8s+1dKXxZOSMStpEfpYsGeQfq9tTMQOkltASn70hWGT9tEsUw3x+Nml6AeFq4N/uJt2xjlMYPko
	eo5truDdQUhPymKfOzQP+DyvWRs1IsFsTI+PiqV5W2ZsHAKzVcCzZScPWxl7XiKjg7Jv/Jp8B4p
	Gi
X-Received: by 2002:a05:6102:6881:b0:7a8:1837:9eb9 with SMTP id ada2fe7eead31-7d07273b428mr4586998137.27.1793708986047;
        Tue, 03 Nov 2026 04:29:46 -0800 (PST)
X-Received: by 2002:a05:6102:6881:b0:7a8:1837:9eb9 with SMTP id ada2fe7eead31-7d07273b428mr4586987137.27.1793708985574;
        Tue, 03 Nov 2026 04:29:45 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d5dfsm28910586f8f.3.2026.11.03.04.29.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 04:29:44 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Shuai Zhang <shuai.zhang@oss.qualcomm.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        chejiang@qti.qualcomm.com, quic_chezhou@quicinc.com,
        wei.deng@oss.qualcomm.com, jinwang.li@oss.qualcomm.com,
        mengshi.wu@oss.qualcomm.com, stable@vger.kernel.org,
        Cheng Jiang <cheng.jiang@oss.qualcomm.com>
Subject: Re: [PATCH v1] power: sequencing: qcom-wcn: increase WCN7850 power-up delay
Date: Tue,  3 Nov 2026 13:29:42 +0100
Message-ID: <179370897915.27908.8240780682152468371.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261102094800.3225454-1-shuai.zhang@oss.qualcomm.com>
References: <20261102094800.3225454-1-shuai.zhang@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: nLuHM3qWKZkNY0hiwa1A9AttPZs4mdZs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA0OSBTYWx0ZWRfX4ab5uq7llE9F
 IjpUVUhLW8+QJr94xsI509S2DFJYyyr5nV4YdDlwxZ9Vr7DSJ/8sLylpl+2qTjUtU8FGv+5H7eM
 FWzoakZIXTxFEQ8QBYLFEPBJ3rab0TxAekMoDdnzeXgLp+uSV5qndkdY54+11z02fefUVBu72cS
 9OSyDqsvpJpr0Po1SrI+9JSIgOtapWG0sAfSLquicrXKi1fgnU8kuQziyRqyT0lqB0eaxr3hz70
 o1X/n4LvZCAIs85Gd4du6j3+dzr28FdcqT1/cv/q6mQjcab9qVVxD0KyJawXDqDlDpnGb+xz7ac
 q5J7geV5kM1ie3c+fv7jjJsWONWxGP1oI5gJWjwIl3Pg//EJJVzF+IHJlPZsp37Ohwmk/EX1jI7
 enpfvijxlbEIOQiF0R9brDXPzf8TPtxdodXp4TNm0BgOqeIDlRRpVstH/PyEkuiPcIJx1UvtfJm
 E1zFRkpKHV4ecU/RLsg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA0OSBTYWx0ZWRfX+9QFo8x6dP9w
 0yfV9MkAwsXJHlaZimPsBaKEMNdSaTTf/aybVDWs5cvKgdf8V381hEq5ptOK+/ls8PmJ3eVmTSZ
 SQ3x9WbIgL2LAWtzbNRSufis8Iuda2M=
X-Proofpoint-GUID: nLuHM3qWKZkNY0hiwa1A9AttPZs4mdZs
X-Authority-Analysis: v=2.4 cv=NZlzRGD4 c=1 sm=1 tr=0 ts=6ae9d3ba cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=KLQxzaQ-LYvYA5eWPjEA:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_02,2026-11-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030049


On Mon, 02 Nov 2026 17:48:00 +0800, Shuai Zhang wrote:
> When the WCN7850 is powered up from the Bluetooth side first, i.e.
> BT_EN is asserted while WLAN_EN is still low, the chip starts from a
> cold state and is not ready to accept the first HCI command 50 ms after
> BT_EN goes high. The first command (0xfc00, read QCA version) is lost,
> hci_qca does not resend it and fails after the 2 s command timeout:
> 
>   Bluetooth: hci0: Reading QCA version information failed (-110)
> 
> [...]

Applied, thanks!

[1/1] power: sequencing: qcom-wcn: increase WCN7850 power-up delay
      https://git.kernel.org/brgl/c/bd60a639b621453fe37b780df4b6d3a13f981f13

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
