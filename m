Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792656972;
	b=V86+/2KNgge4ZUrS+YBBckrCOP4bJMxHVXCZW7Z+ZpAiR+y8yeywcs4Ljx89R6+yILet
	 fUQJYNNNTlZ4GqacDmOh3xFucf5aVAFO098j0VpTnbDN0yPaIQOdBad1QHAxtWTkT54pr
	 qrJ5SG7XPS/eQID4viYsi9QiFgcuhzQOo5m3eJvSWEs8KbTgJQ1MWYmFdhBwnESDuq7CT
	 FSFeTWgyDv0fAt1bfhLQXechDlmJdY82FbSnTQkNIoe7jcvU5UGwWqyOSmgKILDoRyPD4
	 J9SGDHAgFEwpFfDe6m7mbZ5O1M29NxOs374Osye8rY/9A9qnPdXEaIpRwOQeIfY8wmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792656972;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=non+Q4RzFe8WVbXJjcMLamgOlK+TvzgA98/JQdsnhMs=;
	b=stcWrqy21gDsjKbBzitzvgSxiYMJPBc9Zi5ikoesIa4qylomAtzHSW3c3KqKKTMQ2Hjx
	 tUY6bSr0WNotm01vq8zfSY8eGU5dvXB1+PPvBPGEHsApp7i6zZiIh4WQgl2DtsFDRcMGs
	 Y5w20szUpEkKxRheG+utRhge+kFmhdAwl5LsEIb7ebr0F44gsJMVhd6UvaGzVVOLP3Ear
	 ZgZaezH6lLxYxDcKLlHBKxM7JBvIVZStpXUGnpYrVoLBt7kGqxfn5HkasCAgR2C6EkuNQ
	 DeZGBNUPpP/hncvILKrjW/zKNiWWNWtrh9WKaCRUPHZsP/iO+yRqIs8Us4+4z+H73Sw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bAKw0Jpr;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=W+o5pPdj;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5B76606A31B
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 08:16:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5B76606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bAKw0Jpr;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=W+o5pPdj
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M708Nm3517415
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 08:16:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	non+Q4RzFe8WVbXJjcMLamgOlK+TvzgA98/JQdsnhMs=; b=bAKw0JprCA4N2ISV
	twfPIhZgmFGnjRNpHTSMuRV5pxMVemDo7h5jeDV2KUNyfwcVDLNMoPBm5UXokYkD
	NGQcFAvHMC8dnZOwQ/8QxHsT25ICVRvfDafZ35Typ8Pwsy0W/z7TO1I3eElC0hcV
	Yf+eiD8Hq1SEuuFvvb6hdvSuxvJlYJas/yvnavVR2GhV7nuPDiEZsVMZCKJgVnWR
	++9URSviLswID0uVlYDcijbyuJBs2+dVsDzHxQ9jly/yGV3wKFRSTMkHxpKTP6AT
	ysZ9L8AhXPJMSoZhrJ0ivWSsQtWz1q3D1MFvwCB4m3Pp9+rQLmwGE9uzXUqUVsEF
	uoPjvw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93bhcke-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 08:16:10 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f33438950so353064185a.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 01:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792656970; x=1793261770; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=non+Q4RzFe8WVbXJjcMLamgOlK+TvzgA98/JQdsnhMs=;
        b=W+o5pPdjIuKl1y8n+4O/p88ObLvutwxfJKuZQOGR+gLjVcdPdxaioDVy+hqOrD2a+y
         KZ8ct3k9hQfYYnovIhtNXpVHDIU3LLk7119Lmn2tZHvu8m1MSyAVKWk0lBpi0OMtOv2T
         92RZygtjAUlYviifTGEMQ6DJeHPdhTfPVhNbeArzf5llRluB7i3NZSmsn4oUTzCiffaG
         RSzH8mLZE8nsNM9cl/qBE+bAljAo7rhmxBwXptdOq5zoPYPRmpi7P7fWCNdMLlZgfEQC
         MxnwJJBwezyqPPqP+CSh9oNJLrHrgxQm3VVWO8ZMF2rQ62hzFcOgJ7VVeDf7xvGAFQLg
         0J1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792656970; x=1793261770;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=non+Q4RzFe8WVbXJjcMLamgOlK+TvzgA98/JQdsnhMs=;
        b=1/aPMhE04wfxk6vm1Dx8LTKhufRT/fWZC1s7nVaUoU2BRHPIlG0kU7hzpTBLlxzn4L
         KXBcBQ0EuKSPC9jzk4k9XFTKNItHZgxpgnSUk1q0ucyZ7QZ5wNV7LG1ZC4Dg5VnbXuyc
         nsC6OB3Ex5l6VHnjq6lGw0YLOebvvgP1Upa5FLsq8lP9J0/vorz3kaxhHyONbchhxGAV
         9ZFwfJi9oRI3KkZnFFvCgRG2rw0115/wMXJkP2PfdsqLUwi02onCmwjD6XiuvZC0DO3X
         3bgDdg1ofmc6xmXfZW6cF47asdPrQ68gbHJS+P36RyGBowCcD+FkmJSHgJL6PsZ6vTZ7
         brYQ==
X-Forwarded-Encrypted: i=1; AKwUvBzIyRociFWQcSlg3gtC4+Mzs3BBrbLLfzK0KxpwxpKNSryvM60IRXHv5zybhXT8n196HisrH7OiIljzhNg=@vger.kernel.org
X-Gm-Message-State: AFq9FYK2Hnl/2QdRvKn3f/ClyqRTBC4ZI5tZSIXUGmuywZRyXOlnfwte
	QIYTPIH/4iTA7INZwOxOhFxYIfe/07xamFtorqtZ61zPBse8HRRKUvzisbRUxiduZQirV+BCLyl
	BspkorrWOuSfySlp8MuNet11agama/lvClTDjhyKR8gKO9Js14Mg8ty5ys4Gq3IYvrbu9wQKXpo
	c=
X-Gm-Gg: AYBFou2iLrvLkoE9eBud22xXVNDf5TPqff82nA5BlHYmimbJ+fOqEr//bcWZBSTUq2Y
	7ra5NXwBsWzGGRJ4eXSgSq+OvwftUfeonEB+GXfT8/E788mdc7+9wN7WudNnb8ErYDcWtSsz/b3
	Fv5PuFiaPU9W+1bQyRXCi1xDFgzUbVF3o6TszQODtZ0IwBkaazXeJPEbHn6i/wxPOQ/JSMqAUoL
	OFKL1IYxn3sZ6TAL2LcED3gGJ2CCi8ue5Sy/WsMKFiqm9zJbr8UEV6uZyPm5MCcXKwPZVNiMZhx
	FGxNQVXv7031PCgPbTlq6THz+wrCneD68NN4/bBduX3aJVCpTDH2bSxixhcGSryMiSxH/tfZYjH
	olDOI368MLzjb8VrQP9p5FvrJmBc=
X-Received: by 2002:a05:620a:2995:b0:93e:c12c:f134 with SMTP id af79cd13be357-93f5803c527mr852996585a.79.1792656969787;
        Thu, 22 Oct 2026 01:16:09 -0700 (PDT)
X-Received: by 2002:a05:620a:2995:b0:93e:c12c:f134 with SMTP id af79cd13be357-93f5803c527mr852994485a.79.1792656969353;
        Thu, 22 Oct 2026 01:16:09 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a203a3e9ddsm48541225e9.11.2026.10.22.01.16.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 01:16:08 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: linusw@kernel.org, brgl@kernel.org, "Baek Kyu, Kim" <pocj8ur4in@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpiolib: Propagate emulated drive errors when setting arrays
Date: Thu, 22 Oct 2026 10:16:05 +0200
Message-ID: <179265696338.42291.3740879343295270768.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261020172601.221861-1-pocj8ur4in@gmail.com>
References: <20261020172601.221861-1-pocj8ur4in@gmail.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzMiBTYWx0ZWRfXx+zgitwPxizD
 WcE2NVj8CL6MkQGg0LuddBvcR6KRiMxJOm+Pu/+UNMuGrAksCz8kqtuSy6XUwdo2d2ifddzqBs2
 1gLAuiFZLUu0gq/hIY/2zW/ZTePtyRH8HR3b/OkUDadGzJ+RQ3Z6LTtm6pZ1E2rMdvW+xfP2nK5
 1k4eHq/ZKtB36xCWpQUby21OrZ3hul40x1XyD4mcox8NpB7mahYHTmhMIMx09reL6zdfW0agET2
 duUILDUbqb1oLY/q4uqTqoqbE1u9FKxNe2VxjuM0l6BpN9pX94ozFQwdAvzGUIvJtOfWGXOaUH+
 UqvQgGQVLyx0NJZh+SOzwbNulzowxm/eijCMoc5Ovi9YLGe5kdQ0nhhmk71h/fphXZeTWECH8nc
 RFGk8d0zJzMkK8JuytOg0ajueYM+QSF9fwp8YqFk2E+6tnjk/GQmtc9CIryp6N7J80KSAxoparo
 DWBMc0MI+Uh+CD+Uuhg==
X-Proofpoint-GUID: zzLLbVsPUOt05rQw_Pu6i4qRDwxwUp5L
X-Proofpoint-ORIG-GUID: zzLLbVsPUOt05rQw_Pu6i4qRDwxwUp5L
X-Authority-Analysis: v=2.4 cv=CMy/zhrD c=1 sm=1 tr=0 ts=6ad9c64a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=7IdmLTEX9yuEVjg1BqoA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzMiBTYWx0ZWRfX8BcSDZXwe44Y
 se4GRUI1qgJ9pnu9H3+vrZLrfAgmkCOfXMpJ8Bd9BLbMZ6co/+vA5kmGipD2UPoBuy42u58UMs7
 GBMJoFyS8QHqjd8E0XHMPsc7QAIfVyo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 bulkscore=0
 clxscore=1015 phishscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220032


On Wed, 21 Oct 2026 02:26:01 +0900, Baek Kyu, Kim wrote:
> gpiod_set_array_value_complex() ignores errors from the open-drain and
> open-source emulation helpers. If a direction change fails,
> GPIO_V2_LINE_SET_VALUES_IOCTL still reports success, including when
> updating a single line.
> 
> Return the first emulation error after freeing the temporary bitmaps.
> Keep updates already made to earlier lines and stop processing the
> remaining lines, as for errors from gpiochip_set_multiple().
> 
> [...]

Applied, thanks!

[1/1] gpiolib: Propagate emulated drive errors when setting arrays
      https://git.kernel.org/brgl/c/15665047024e30f9c2227563d03034061c99ac2c

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
