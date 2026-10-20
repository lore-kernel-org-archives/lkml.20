Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792502405;
	b=MBbeBk+YKTGMRj/o8XyzNZODRP0DJKrEROS8QHuQmQw5Cqj9jqJq7O/1Au7Vt5H7A3kK
	 U0FW+c6sP7g1VmWGAbn8M+eCVI4qkpTRvbftifgW0sWyMDnAmt5qEzHyvLV0t63Mpsgxi
	 XdWLTcsUiZbrJVCyRguXPGxjyUU1/VpZsiBJf/dT80bqyHrWpR8ZOqBOofZehIkXthJCv
	 xek1DgYe8MAeEbUP7jTpwNr42OBhIDyrHl+HSiBJ3CvUIW2FCHTQO1mJOJqCCewEz/kpn
	 d3dbKYXOI2rl9siH83peIONfUplMNO2SKu3fhvG+rX9SQ2venC0FlTr37lHbQvYunVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792502405;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Jsz5go7Fr+PyZnjWF9NG/8p6Hqrw5fnSeFiniwyLeRU=;
	b=drFY3Fa4gOUvaRJb/K3CplHhkJuUCPF4/fQVE6DgR4R48B964S9VwrDjgl9VwLxoVI7K
	 ncCuFYrGG0y3sjfLLOxFy+RXo8zzToQQo8qaGdV/0+etJtR6SzX8Fw3Adzp2MG0nC0Ab/
	 rgZJycaOwTcZXK+dFJ+FNif3/y6g66Zvobf45HBPY/dcrkRU/4ff4U9Ztf649dY0L/mbM
	 TDLb2qmGZDuyTJpuvqW/HtS4eBzZP9XqyZWdR9MxVzziCvIsM0AlbCsIk99qCCYTxSKyz
	 sEYiK9hBuVy1S7AObrrCiiXtLPcIAlfCHMNB2DklChETCjFaD1LGBfrdSTDWEJ5Hfyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZGNJw0iz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=N9Q4qmp1;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1631A606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:20:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1631A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZGNJw0iz;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=N9Q4qmp1
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KDA5cf1575223
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:20:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Jsz5go7Fr+PyZnjWF9NG/8p6Hqrw5fnSeFiniwyLeRU=; b=ZGNJw0izoFLblHbk
	3ncKK2m28JNhtqOUNNLHlFox74uuE3hb64ioUhQyU1iLQFHSIywNg8j2PhHsWbwG
	SEC+vKLM7uUaAfyI+kmEbTcP3PC59TavdZHL1fphM64Tp1xWJhn7otCFxukmTQUb
	kdbnTBqCIXGauCbMLR7lEJ8ExaVyMUselAuO+iN+2EO0CuRRiPjT6+2q+hFk0AS0
	x2RuGCv3eETs+jCOPCss6daWyT1xzL7Z0vmOwsfoVFXYGuG9sCxEzOymRwOL0A8B
	vYTFMA8/Ch49ACeheFHR2/qsmoylHAnBzJYrG1x0fhkmjoW7xStGf88blpU2B3Pm
	DHHs/g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5n2mk7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:20:04 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f20addba1so592436785a.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792502403; x=1793107203; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Jsz5go7Fr+PyZnjWF9NG/8p6Hqrw5fnSeFiniwyLeRU=;
        b=N9Q4qmp19ANKDDX/cLc9WwFLkSGKO3nen+uLP8f7z/Zg9AvDmwtY36S2nWKRwac7UJ
         ec9wvjKwYWXxyUXybszURXwpEfqBiKqMoGot1tX9VR6z0AMXipjLGDTMVcQ5JBcaA+1I
         wdCeNxcpxFAr2pzd5xbNGa/0lePunoerVzMRUjm+OkvzKTlazSuzkewuwdW9gOkB2qNk
         //ElSKeuT6XIfVHp6hzBNP5QY579nH/YW+fPzLStfFAbZJ/aVXwMfkE0CQjzN8ayGEfQ
         Ei2LcJAtrEPlMJkicJ0shEraOdLGnFoYX9qX0TmLrJsciijRAPPwrFdDrbZSyfx9kVIR
         3D2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792502403; x=1793107203;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jsz5go7Fr+PyZnjWF9NG/8p6Hqrw5fnSeFiniwyLeRU=;
        b=czNzXFIl3n7w1am+Ek6YWRtsyMcEKTdiPiXZ4XOntlGv6MF1C695oL3ESVsxgtkIO8
         Dpt/823OAW+pkHfO7IBCpRfyx+or6b4vF1DS10rOgMBks9xs0orupaXz45C6irppltz1
         3HJFztJP6RdL77WnoVWzVqd7bNORRzTU1LMlETwV9A9mhMwVlvZ9oPxLXwRF1RIYKeGW
         UQGcGQSOie6CRxS2wIs1Ero80g+CvnvZ8mUSxfpJqtuK8WJAQJztnqlBGAfjSSV9LYh+
         DVYrAYbNVbF+y92VsmT1vUGxEYDGyYZ0Josx7Tq7e/dm+MGj9ouwW+WWbDtnHxpomkNQ
         ioQQ==
X-Forwarded-Encrypted: i=1; AKwUvBzg2tNVf3o0o4/OKCbrdP210ibYf1+sANRvEITFzNebnulm/0oYu1VYw4LY3fDmlukHSioAiJqKxoHXZs8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLLMeNbaq34CffMsDP5i0cUMsJtDizP5WWV+kE5oy66OPi8zQfI
	NxF9pbrdLJtwWRtFSDc3RJbAVu0dTdb/s+F0gMDwVCmGEiXQiBVQ1BXfNnhG4DtbwpbGxnEON3G
	qvRT2PUJMlgk7hbVojyk6sNfLTu9PUfKDlgR8CLRjiI6N9wHebSQa7T1xy6m4hw9hzHA=
X-Gm-Gg: AYBFou1rC8stRD1bZJGG/hwC5A2jJKgeseXK+o+jeu3HWBG/5GlzAGSUC1D/5q8/726
	1Ka/sTUmXRFnRG1lNx+ZWGncjhQE6pVY+qd7WJ4BV5/JlMCYT/N29Ik7SvNLoU3s53qA/GjXxg4
	SHXMB37didlz8tUQrYDkMzPN2zR55oIE1TDggjTNaD4rEhIZBjvzB8n0q6kA3oeuuad22VvvaU1
	eoLt5coTZ55l/e+yqgkFxN9X5t3zyA6jIRYg6IGxonWVylTm75bMSTdrpLYl2eA7q1TsjZalsvM
	1PC/awISHKd6zreCw9XQ6SmfphkepSBYyoJwx7Ut1NoFj5y+OPn7+YoM8tjd3h3iKTtReSmd2rp
	pKOQ3nk7qjYsdaFos4O7UHKSsWcA=
X-Received: by 2002:a05:620a:2a13:b0:93c:c1e8:6504 with SMTP id af79cd13be357-93f29cc9260mr1746354285a.23.1792502403349;
        Tue, 20 Oct 2026 06:20:03 -0700 (PDT)
X-Received: by 2002:a05:620a:2a13:b0:93c:c1e8:6504 with SMTP id af79cd13be357-93f29cc9260mr1746349285a.23.1792502402773;
        Tue, 20 Oct 2026 06:20:02 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d8185ddsm6032950f8f.29.2026.10.20.06.20.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 06:20:01 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Keerthy <j-keerthy@ti.com>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Sahaj Chaudhari <sahaj123.sc@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org, Devarsh Thakkar <devarsht@ti.com>,
        Aswath Govindraju <a-govindraju@ti.com>,
        Aniket Limaye <a-limaye@ti.com>
Subject: Re: [PATCH] gpio: davinci: Clear interrupt status in every bank on suspend
Date: Tue, 20 Oct 2026 15:19:59 +0200
Message-ID: <179250239619.33509.15591478629051769601.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261018170622.3406158-1-sahaj123.sc@gmail.com>
References: <20261018170622.3406158-1-sahaj123.sc@gmail.com>
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
X-Proofpoint-GUID: luUKHskhfQG1bIOCDOBf85FyNE3qm2dO
X-Proofpoint-ORIG-GUID: luUKHskhfQG1bIOCDOBf85FyNE3qm2dO
X-Authority-Analysis: v=2.4 cv=L7qI0OT8 c=1 sm=1 tr=0 ts=6ad76a84 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=8YrD1dwCgZ9uIqTg1mwA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA1MyBTYWx0ZWRfX6nezDZHIPlYX
 w6glBxYxH+oCXMaVxRbNLCNh9QZ71uTH8IQy9jzPgVDDa6bryV4lyNMlI91QVDWdRpjdpgw6Ow1
 fnHOYFMv9E9TttsCf0rt+tqXNDtnJcCrPtduDxBuWKIUJodPEEWly3tbyJmCkiNGJ0KcLeJUq9d
 VjrBWYB1e7DzllDtu2POi4OJ6QOv5QPmu6CmULiU/dKFi6fLkLgr38jTFaivevCCdWstZdjLFOw
 xDSqkvYBGcbkF7Bl6JECSP3nK4YiAcOKcqoDwAixhkbRGKitc7FMBZ8+FOeaO+SHQhSmiBT+i20
 CvucYUD8hPhhCIp0McKJ+Wwj6JlVmADbaiqk1mF7lAOYzTGUaFv6uY7dGr4Jf2K4r1eXD9UY5oq
 rgXqT9dUoIkQ/iiSPR7iOQ+tdu+LPgluBY1aJgGxJaMrmqctKecUy2whyDE2P8mxwM1v4hEo1oJ
 6XfLfAFoO3kVTHh39CA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA1MyBTYWx0ZWRfX91kLUmIsUdM6
 /JE6Xg+rdn17HLtcVdhH5IhAVYdToOdECAsFonkzRdGjuicBFyJvhBwV3xp6DMuLZSfqvOrWUoT
 l3NFOm1dJMDvAX/qmaFwX5V7eD8W1No=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200053


On Sun, 18 Oct 2026 22:36:22 +0530, Sahaj Chaudhari wrote:
> davinci_gpio_save_context() saves the registers of each 32-GPIO
> register bank, but clears interrupt status only after the loop. At that
> point g refers to the last bank, so pending status in all preceding
> banks is left uncleared.
> 
> Move the interrupt-status write into the per-bank loop so that the
> existing suspend-time clearing covers every register bank. Single-bank
> controllers retain the same behavior.
> 
> [...]

Applied, thanks!

[1/1] gpio: davinci: Clear interrupt status in every bank on suspend
      https://git.kernel.org/brgl/c/800d7627f552bbf602a1736b638aee0ada3fbf87

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
