Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793612770;
	b=d+wt90TPaQ76gPl0sgwVEdK76vjH4TGeeseOapRo1LTO2jNHBD/jh2lm8pjeGqt3ak/p
	 cMPj9gyLCYEAqnrc+k/GoEfazOHZmUS1BQ8We3dCYG+ReHBbTuowhwAfepHSTN728DL/I
	 8gPmN+DcrcsSdGY/+mh9spXaukAx40Xmt6UXZj18opRM+b4X5Be99I4qu38WzY3akCOaf
	 ZakETjt9fkht73dIcXIXUkHZe/Dx1azHBZ/kYLzl68OGOFH/JRqzj8US1O2hRdY9DeHl/
	 Bxc37l7QZ/YrHF0Hseh2jjTnbgBcbJOMv3wBGQjl7qWbPJHlujO9a6sWpDtWQ9Ld3Lw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793612770;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Q2obv3pWTVyIZ3QoH1rx2goFUTFBpKLGs766FBuOIgU=;
	b=IMDkb/k9n+YLknSGtHqJ4jhqw+IrMZhpct0LsCkniMlPLHxt1ZfLjQihM2tVvRTVfCYF
	 DGv4ff+alsljqIav+rZy0Ak6PPl1bcZQSLx/yt6oPGVHSkFRDWSB/dWS1gnyCe1I5DPvG
	 Lcq8ydMlSTPdmcqsczPpzdCM9QkbtbL4h9FdnhQUUHv52a/L0jg3PZCV/63Edlpd5c8ir
	 vBGvHt+k46GANk1kbV/ugoTWkHMoOt9AnBDVN9GDq5mr6hlmTb5ROHw0eOqd+GmsPbgHG
	 f62+u6h4P76LNgTEmAPvkb8aHHTciLd0rfL8LIScUHsSCoYQTZtpczLFKR6I3wBJYNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=owDRMdGu;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NX+6oWsq;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FDC4606A32F
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 09:46:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8FDC4606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=owDRMdGu;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NX+6oWsq
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29B1uR4015032
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 09:46:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q2obv3pWTVyIZ3QoH1rx2goFUTFBpKLGs766FBuOIgU=; b=owDRMdGu2X00wq66
	OscTnQEr4bqM26fXQ7MQ6rYmVf/omdZil/bIaRuei0bUh0bFszq4NJeOAu85Hb82
	7wn7iv6k0lCOrK9+nHdE1n+5YOZ4K14ypx07jdCV2UWixMgxK7O/cV1U9ZAHR+9d
	L7oT/C6Wx7C7JTL4caXqyPIOzo6+ezqm+O7tQGUPzTxyGFOr77DVQZo6qw4dONFA
	0MiL/5FqIXTOahivqPZVTEowxODd0/FYd+et7HKMHJKpf2egqvZbvB4rNPT+J3rZ
	Y/HddhsdxuvgxcLIXyUrYVyB5jb8sPSsCXTZUYeOr1P2uyof3kZYIQFVKJTeaFPh
	VkKbEQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn7b6pd5v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 09:46:08 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f1e62510cso626101085a.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 01:46:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793612768; x=1794217568; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Q2obv3pWTVyIZ3QoH1rx2goFUTFBpKLGs766FBuOIgU=;
        b=NX+6oWsqBamgutEU5FNd2oC7W+b+m7KGaGXqGvAvpYfIZuMNhXOv/raDfB9pCE1Obk
         Wmvgqj4gRo751NkHv7iedPS8WkdSFDHAtnVO3C5v6R2mnrGFUq3eLWzyZVOPejMkf0Wf
         PgDfLYaJ+x2MOFQKfCoK5thuylvB7OiBHn1zaHKYFBAOQ/ALXqqAtKPweeDhBG3vkx8W
         0KUXOaboowSMxhPG3Qi31AjS/G5k+Zd2c/NqDWYSr4owXLp0VqRaPimLKB4AV8PK0kEE
         yKt70XnZ2+5HhB6Uxc/9PBCEVlDHIHb04rFQ6vhloObJRnQ8KbB1/ADfbgcuk77MdTaA
         xRzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793612768; x=1794217568;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q2obv3pWTVyIZ3QoH1rx2goFUTFBpKLGs766FBuOIgU=;
        b=yjaW9/LNfTvw7X7LdhwIYPcM+K/s/88yutjD9Qreose0tyDkbfHujZFFEwvGeWq7gW
         I4TsMfbIoZnWdz0VwfOUpd4SsecpDaUZQ4czd/E0hLTvzvpF8J/QQkIcuvdY6KVDlkkc
         C0aRmecZR+m7k5qghzjYGZMAPCODLRZwqQwWhB5LPTd3z3gnjtq3bb6IEQYuj7KgBjwL
         28LpxcG8Lwzr4PRhUO7/g45oosRQrf/1Bz3qzRf0CwLY6eyL6daq3CYwZcwtUNqMKACV
         PuRgzwutcrkRWWryVsmzjE7pXgML2JR4X6N2hFs1cnksl6+cwawMZGtVB3xI1Us1+OYW
         9t1w==
X-Forwarded-Encrypted: i=1; AKwUvBytlyYgoPkBWHlwsS0fYTLABkXU8vb8dkoQmc2+0lAWjkylApC8t73qzG/H6pY2Z0+fJkaVgsOmjN9lsEM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIlZ5AlCvDNn6xMQLI5PXOElfPYzJSA0cS9AhrVjq/Uj2H1B3X7
	vTQlDvSQctLr54FFM6QV4FY9jldLKxjdlmlMfZOfV3lQcGkL+QRiCj0bLROWeTB6S6uWlFITis1
	SurRpMdi0WqSf0+fgbyIEchBN49V9ThoRCyycYEyLc1J+H1tzrwk7w5Z0ChAv9pGwpRQ=
X-Gm-Gg: AYBFou37MxlD4IJONOGePbnyOZChvivNtG7alAk2XCWHSIUg12vKMFBO81AiEhH3CmT
	IWrZNcSy4uIN41UP46Oi22+BduY74h1RFFMk/UveDi7ITjZ7KIjNEE4AJPPM+velDZr90iZuSTP
	DneCl1f3FVtrnaNl5g9ap4ag6DF+ajfSqlldDj/k+EvsUSIay7GewQptHYUEC9xNo2dX+2MsHBo
	/rc9RcybJPY43Z6Se8NRCEMqpLO/N6H9xKzz2inPCqlADQzK5oroEJS4KIBEomiQdOx63CYm3tV
	PJhrZzjp2l50TI9hDvmK2on8nDq1TLvBH7uR3xXw1OOJqKcgoY37EmA+wRXG17/uejAYML+FlwQ
	7tfsYtHBeGRyA9oxbpCGLIBHpMmWUqBc6FtwhVGLx/mmQ1YBznzQg/ZbWSupQcLZCcwIXBPKGCf
	RH
X-Received: by 2002:a05:620a:8007:b0:93e:9792:fd47 with SMTP id af79cd13be357-94421585e39mr1365608785a.4.1793612767743;
        Mon, 02 Nov 2026 01:46:07 -0800 (PST)
X-Received: by 2002:a05:620a:8007:b0:93e:9792:fd47 with SMTP id af79cd13be357-94421585e39mr1365607085a.4.1793612767277;
        Mon, 02 Nov 2026 01:46:07 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa81b7fe80sm376852435e9.11.2026.11.02.01.46.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 01:46:06 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/4] gpio: shared-proxy: Fix line accounting
Date: Mon,  2 Nov 2026 10:46:04 +0100
Message-ID: <179361268795.50408.17291730393794420636.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261028123448.510401-1-shengchao.guo@oss.qualcomm.com>
References: <20261028123448.510401-1-shengchao.guo@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: 8OJMEcSLqaIHgenckAe9Cob8OqiYHaXe
X-Authority-Analysis: v=2.4 cv=QuvLTlyd c=1 sm=1 tr=0 ts=6ae85be0 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=94EpPfmSQ0WW5oeumFEA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: 8OJMEcSLqaIHgenckAe9Cob8OqiYHaXe
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAzOCBTYWx0ZWRfXy1hDZjXPRkSE
 FxE6IohZhZFWT770HsW35S+KZvRnD01E6H2cOSqxo5y0d60blOfl9REPeRCBvNLiB2FvFSm8bdg
 HWq6SYir+YjJNsYvOwqDXnDTBb+T94o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAzOCBTYWx0ZWRfX7v5lnWSvblOr
 JUYjiK1KK+FW9oojUBbXaz5mMKiQ9zlrSP09l7Bt4ROxmFv9Ij8ITyFBUARr1FkvdMa44IiIZNx
 pDDGZ19Sonh9gdrfnu53zOQH9AfBkUsHWhuWHJwv6IfnHdwPw52kxv0kF+QhTohRfeENtCxa6Lj
 SalxZrvVSk7UQ2jZuWxrGKlhcgR+9on6uHwjABfUeZaMhxpRB53P0UaKXlpwVTvgITstrVN6zfm
 alHHEHWFhXB895IaRkcngbNfO77qdOwlkzBnKUSECr8OrzAsrTDYayATlXi2N4ic1hW4lE8zF+9
 rkhhEkn9MON3m2Cw7cFN0GEKwoTtg/yc2GpfToBgShiFUCLsjhVJxlvXQgkkWs04Ef7DKKx4ozA
 G2wDLsninPKyt0ZU009kG2NHkfdo52K5E7t5NUvpv6vUhin8NXoCoUhJVZhJ57hlRzVuY30yc9Y
 DQzQeI5UkaTqTfUHfGQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 impostorscore=0 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020038


On Wed, 28 Oct 2026 20:34:44 +0800, Shawn Guo wrote:
> Four fixes for how the shared GPIO proxy accounts for users and
> votes.
> 
> Patch 1 fixes a race between consumers that request a shared line
> concurrently. Each of them sees usecnt > 1, assumes another user has
> already configured the line, and fails with -EPERM. On Nord RRD this
> intermittently leaves both DAC supply regulators without their enable
> GPIO.
> 
> [...]

Applied, thanks!

[1/4] gpio: shared-proxy: Fix race between concurrent first users
      https://git.kernel.org/brgl/c/eb70d2419e79b6720fd465b905a2dddd751f2a48
[2/4] gpio: shared-proxy: Drop the vote of a released proxy on write failure
      https://git.kernel.org/brgl/c/53b7b1201964f6f147fa0fa2f61194403a65cdf0
[3/4] gpio: shared-proxy: Drive the default value when no votes are cast
      https://git.kernel.org/brgl/c/0bc45604403176722e634e670f5e38de0aa42a9b
[4/4] gpio: shared-proxy: Drop the vote when switching to input
      https://git.kernel.org/brgl/c/925409db963dbae4628d522bc6b14985e749c08b

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
