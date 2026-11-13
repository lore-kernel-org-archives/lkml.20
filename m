Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794566202;
	b=UJY0tnmPjURABqAKKnYP0G5BLzMo3AT2kZTZzfTgxEW6cELpU8pZPWj8KGpz+8yQ0H5G
	 6DonXZzfw9JkN6o14aMOveccF4+UphiDrr/QtdJj0l+J2DOM3lt5i8wh6mICt5hKluclJ
	 ZKk9jNAS71vUy2wgRyUljsByHH4xrVk0IY9+e8qHikEIf6PZT4XLNLcrn5lW4fzvkijy6
	 ACAfQoHHlmzvGr2kCw9ASIrFkMuCdnqxxAb1Qwt5b4EUJSCcXnNhTU+ekt5V30ETWxEts
	 /OEwQ0uUEZSDO9VI9Ee4rg3kv6QvFFAWJWGSRvLLi6oPqSMa+eSsfpCF9NMMki/cwmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794566202;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=TgEeUGxKovhjdSPgMfNKjzv/ECDclmpQx77zq+F5dDo=;
	b=mmWVBMRLywTzU90zIV0UauFo4F2EGhlkcubH8LyFvsw0rb8rlj+uuiLblhctVLqEoBUd
	 gM2lwGOouz4pTbU/y/NB1UIwBq1WTmey8bf2QyZ3fkqVi1v/nMGQgeXwpbgjvisp/rQbv
	 9BaHm+A8FjaSzu9JkbXgZSLdpu9dpHmXsb6yVMgq1aWLWwkJeU6p+CXf//czXOqUqz1OD
	 8zHzhnHyX23s0rFHRbB0WEdV8WDYFniWBcDofY5eX4rhBVOAJQbzPGml9MpbCr/lN4hAa
	 k52MeHu8MA86bHyov0oOvc04FUI1Rn5XDM/AZw7EiFVMpYlPtLGVFClmiEBlZLcfI9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="j/7a+IS9";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PiowsmQP;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94D67606A323
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:36:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94D67606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=j/7a+IS9;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PiowsmQP
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD8VDZU4163548
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:36:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TgEeUGxKovhjdSPgMfNKjzv/ECDclmpQx77zq+F5dDo=; b=j/7a+IS9KtkitUm0
	U1+X/l8qLCEiqyzcHkRHohx/+V27/pOSHXufcbXOhYb5Cf7aY+kXWoXo+DkuYTn4
	kJVAz3LQb4zZwjCPgcUI2gQaQlZin/pVm159XZfcLdxAvzwbA8NyRRwF7rMtc9aI
	c+a+z6iqpLG9LofmYUb1XrKptwnvCFNnogv8cbKWWSh1k6nwe9K78yOifiIB4Q6l
	Rr8FordHS8ZGSndNN6Re8C0bCG/zF0k4MYoXyKJD2mE7+sEiavJHeUYV5OKBHhmp
	zffdhLnUtLiKpmCDlhUur1VHCHmOKjG/GOpub3B143sCNUs1bS3vevYmVvu+4QJb
	QdHLtQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwh0akape-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:36:40 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93e92aad34aso174789785a.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 02:36:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794566200; x=1795171000; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TgEeUGxKovhjdSPgMfNKjzv/ECDclmpQx77zq+F5dDo=;
        b=PiowsmQPFtDtr70+mcK7MuRPkYINj/1HEbrIjya8GuriBX7J4N6U4aKLnALQaKNnOd
         PFkf0amdCH3/U3VL0wg2iZ7bfvEuz3NqwbNoCQryp5wE6RXgjQqfJqWS9Pt+m3LWUl6c
         i0tRWRqZGbict+OXi4OIDtDdpw0tCL8QuSsGB+FG/W8d5pysc9rwEe3B6G2FIo69lUYG
         GdX9kYO2LEO3Z/sUQmdoc4u7Zte1zjPvLrcL517WOKcpJvfHWL2oDlskjN9iGDnWtx7U
         RX12fMtoPRcw5uMl1WRdkkOQ+08ng3OfGjKMxSCLHnV1LmxAsBFpUb9NH8fnXRJdmqT9
         Qz3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794566200; x=1795171000;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TgEeUGxKovhjdSPgMfNKjzv/ECDclmpQx77zq+F5dDo=;
        b=1CmYnPPajD6LyaamUAb/xT5XpE7GZ1g62+JeglxiDwYE/oVQ/4LFm9cxO5BTlCFTa/
         ZX0wWxOW8FFHJfsf1tVjVXX6p8SAS8iphiXJSfkgOWuassxDsKMEYL56DZVAT2QI23nv
         8aGT0yLMHX1ugkFSBPgWQGT6mPopfHaxcQ7I8/xUyHFb1YyiaOHgaH+SHLJh5GSyo9bn
         2fxCFusJWv42o8yjA1/ZZER05hqBZGJiV0zZZS9Bmi/Sg/3mZx3iNz38e+/Y9LdBqymh
         9/HHsilz/X7r/1m1dt8NzRFKfReeehg5SjayvD6E8d1a2PIDawahSMujxCdupe5yop5N
         XESg==
X-Forwarded-Encrypted: i=1; AL+hErEDrB6zVI4zKQRBad8tJa2dOP+jYDdlVda0b3hvlFMeCyke6by5QrSIo0qUvPVZlvwVt7JUEXOlvlt+ync=@vger.kernel.org
X-Gm-Message-State: APuU4Z/NtMMTrkgn5W+pFOsxU1NFE8fI6cJkY4/nt4kt2zcIl8fXgqG8
	2Xna+u8XTxnfsAjA7tODGLnoNF4754tkKZty55V3SBUdD1eYSGeSMeElvgiIpqRC3RF/RhhjGzF
	AbUT3/Ih8CVFLdF7R/GsthcQsMyQUwg5ObCBOEboCpSLG4/ZJ6R9PivWwFF5lz/tDzPM=
X-Gm-Gg: AYBFou2I1GER903QmwaN8bkzfjy3qyqKmPyCvrtWwXaUeX+tC5sYdaF8heFyBMdobKw
	+cFP7DztAN0o5rWzllDmIzym2r+K1xmClw6BwitqfNA2B0F6W2fIRAblHZZBfDzewQkKAerx3sn
	4N7Wj37M6NVJKBrZyHPA6eVUxjlVL4jV9uNxfXem3XAZ3Lyn0GClk3YsxUW8E76y6qP6XolzRqD
	dwDVbcnUtDs6vSkLfhrh37T/g11ZRiS2qjJ3pk36e8APWU/f0NVcUGXVgqxMpGGfKKY4rJTWuDp
	65PS+TJSWSw4Pu9J33DAn3fuYeA8Nlxom31LgcaqlOnBVhUykKb2ayfRD+/8RLYR5yrMY/7/wr9
	lS3YMn/DK8mjzfGqrz4Eyn15JFAOdwEVNXYzJwPLp0L2/2emVarrMbezUpxqzoCCOV/2xiucDwG
	Nh
X-Received: by 2002:a05:620a:6290:b0:93b:d79a:c45f with SMTP id af79cd13be357-9494bc2f497mr335809585a.55.1794566199780;
        Fri, 13 Nov 2026 02:36:39 -0800 (PST)
X-Received: by 2002:a05:620a:6290:b0:93b:d79a:c45f with SMTP id af79cd13be357-9494bc2f497mr335807185a.55.1794566199260;
        Fri, 13 Nov 2026 02:36:39 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5d22394esm4672388f8f.3.2026.11.13.02.36.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 02:36:38 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>,
        Adrian Ambrozewicz <aambrozewicz@nvidia.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Subject: Re: [PATCH v3 0/5] gpiolib: improve concurrent access to the flags field of struct gpio_desc
Date: Fri, 13 Nov 2026 11:36:36 +0100
Message-ID: <179456619466.14668.6243591882039671593.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261110-gpio-desc-flags-atomic-v3-0-2f463bce8086@oss.qualcomm.com>
References: <20261110-gpio-desc-flags-atomic-v3-0-2f463bce8086@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA0MiBTYWx0ZWRfX9D67TQzrizGb
 /WRZMgWv8lZ4wR44aWA3GQeNjJcNYB39PrE6HRqhLq8sQOrwkDVG2gNygxxXUqLjv8DKXMmsM8n
 UVcJtwJx3Ss3OO9erklLLYiJ4jByrn4=
X-Proofpoint-GUID: 5iteWs1gu-1rXpqBvtE1-N4fpgevODsB
X-Authority-Analysis: v=2.4 cv=N+e8hG9B c=1 sm=1 tr=0 ts=6af6e838 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=EyKgIFjRM3FL70iytX0A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA0MiBTYWx0ZWRfX0XyuuNRKhKVl
 nPICfVfn2Rzgrl66UGlXGVrX8e+nG9DG6vAhJCz+E/sCpnzVkMdmu2W0jwLPmvkiGLIXlhpWBc6
 +M3OqNElIov9hnmcixiTTldPcgHMjPHYRDIIix8srm8ppytVrSXVYNgQWI2Me7u1l5eMF3aA7w5
 MZUEspWYp648tf3gEZ+m7PTvEjkUXgcFQa4Us5fQ0mNtKPxFNPz9B1PP6aUvpogsYwM16lnllLE
 Diup02ZEnQX/7tHsA/QteLG0D6KgIuhAgWhc2HaxEs7Q+EkhMxw7zj9k3woruveB5WyCDbOeWxv
 WKhwxHRsuYEMhBvu6jf/FzSgtTEgf+N227LIopza2ZwFp3d1tQiJwfymDq7P1IfiPgFwhm7FVUT
 td9hWAxOEgVWFxOIZjgy5Yeq/mON023GFGD1rtZ/LaHEQBvioml95IacuDjLHrnOvxgLpW1YELE
 M7RZTwZ5BfnYNArNEhQ==
X-Proofpoint-ORIG-GUID: 5iteWs1gu-1rXpqBvtE1-N4fpgevODsB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 malwarescore=0 bulkscore=0 priorityscore=1501
 phishscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130042


On Tue, 10 Nov 2026 14:47:00 +0100, Bartosz Golaszewski wrote:
> This is a follow-up to our discussion[1] about desc->flags and possible
> races with users who don't/can't synchronize with other means.
> 
> It's an attempt to use try_cmpxchg() to update only the required flags
> atomically where needed + minor fixes using atomic variants of bitops
> where it makes sense.
> 
> [...]

Applied, thanks!

[1/5] gpiolib: don't overwrite the entire flags field in gpiod_get_direction()
      https://git.kernel.org/brgl/c/8ed87a9adf48703b5729f9d020eb15fa79ffb099
[2/5] gpio: shared: use atomic set_bit() for descriptor flags
      https://git.kernel.org/brgl/c/7d1d799d6251bc8cd1d5cfc881b0c09060b6b90d
[3/5] gpiolib: clear debounce period before the "requested" flag
      https://git.kernel.org/brgl/c/8509d643ffb7be508568c696c9fe45eb1f84c33c
[4/5] gpiolib: don't overwrite the entire flags field in gpiod_free_commit()
      https://git.kernel.org/brgl/c/63d7aedf6add8a24415af4c010588f63fa7296ab
[5/5] gpio: cdev: don't overwrite the whole flags field when configuring lines
      https://git.kernel.org/brgl/c/fa8bc4aa06674e78a4ee702966419aa4fdd8dc94

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
