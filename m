Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79F9A399CF0
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 06:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791269711; cv=none; b=eVzm1sGmiVDsqaEVOMBZwoOO9qM9smgZy3BKMuLngc47rgR8EKRblvxWiYJ1ldbEp/gA/PWHwqb83nh+dGuyBw1MH0MaNFvYjkwML/LczKnMD/L6yX+j7zi6tcDc+qpcyz3ojVvPeY4O/s2ETZ/pUNGoxHunDhSkzPHMkbXNlB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791269711; c=relaxed/simple;
	bh=nK8pW8FyxYkHIGfjwfpvtntGSDU60cB4CLetxgsm+ro=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YDgTR659vFQsEB+q5vRHmtTd6ppjye8PVYlpO3G2MvZKSepbph7/Y5jgfKqKwVhPNNRip47RZNByNrElgPc/ehPvJGfUYGcwPD5jk4PkujoI/o2Ep2Q4durrqwVktWUvfo3zJ89IJwEWZZSdzmlKCBHaS09KogtX5n+TFddp6IQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WPIh6dBG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dk7+nO/u; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WPIh6dBG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dk7+nO/u"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6966eMpk419005
	for <linux-kernel@vger.kernel.org>; Tue, 6 Oct 2026 06:55:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y5PxqJ40x2v8dJl0fOyaxhba7K80AnLZ15CfFkyJEmI=; b=WPIh6dBG//0+31dy
	XBH768JezKqmM2il0PgBIx7FTxSpYClSIBd853bhStaR0G4H45OIZV9gf7g9uC7a
	4sMB4+shGa6STqpzWevWK30nXo9Vpkkc3EAlwgxSG17WnKxtQ1MQa38UgB2p0tZJ
	rdc74oFujh88EufvP4DSwOC8rMHeE7rqSTGzMvXFqWV9yz9lWogQ57rHLqkZgIDR
	+iKmLKxck7BjE1U8pIlkwV0CdQqy6LSE7bI1KBdUqTe9UIFFghdi2T4tbWw+hmhj
	cqzqAS1iAcIxj4fMeHqm6l4Vi//2EviPQ1r9vdmVs3xVRCO9Lr36aweqXm2rnPI/
	E/jc4A==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4bhg3vtb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 06:55:08 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-988c9d1be19so1808445241.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 23:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791269708; x=1791874508; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y5PxqJ40x2v8dJl0fOyaxhba7K80AnLZ15CfFkyJEmI=;
        b=Dk7+nO/uCSOSE8qiu710JBWmqCjmS33n5YCYrkp+herRY6z8PMcHI9roMnAndOmd6s
         Gel8SzDwY90HYkaUxHCO2eP6LAxK0cf0S9tL5cBRGvF05wjFc+CQEHSLEm7nt3hxuhzd
         ZBD5JAekNR9EAlqpGvgUO6VmF6cbQOpPrpAha63RxQS3uOxg+wWaxYJ9RpUOEXV8+dxo
         tqlLQPn1fAeRI3ohrOze4xBzFjo0VMtS8RoTv2GM7dpBpbzavu8FQ7Q9IciXw+uLdO7X
         JOLYiX/3TuaPc9HNhkCT5fcb3KoTPmewKVV7eu0J7vFkJ0cxmbff/vEWGc12RPxE98KM
         w4Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791269708; x=1791874508;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y5PxqJ40x2v8dJl0fOyaxhba7K80AnLZ15CfFkyJEmI=;
        b=BSf+t/V1RLhx7B+R079SjFAG4prFduI5nPUqW70pzcuxBhbFsp9JNrBNy/LD3Hl3/+
         0PXR8t4iM2llIuNIE2c2tazOVUg2ajm4+z1PltR90sxf0KsbKR8hQnmO4cMCH+t5fhl/
         2u5BSVSQfO22pmyU0BEFdcqEwrUPcrrqwG10fwMBQ/eYu+PUkuLRmQ0PSjZ4B1eCgDBA
         UlseglFwDQJsD11veSxssKMEJrB3VN9/f4RomuFfHLaCj48ZmEucRS4qslZLMfq9uMFn
         sPy1H2rkVf2eOfgpz3WHmEcCxGOZ1iUoQsMbGrBE7IllfHfr9cG33j+2TYksnEo509+Q
         WjkA==
X-Forwarded-Encrypted: i=1; AKwUvBzre6bg6Oq6F/3h752K0FbzU+5ODI9Ze3+eiSq6hDjFiAXwapmuiVxqy+Z1dx2Eo1KxrjV5KtOJzt6Sy0g=@vger.kernel.org
X-Gm-Message-State: AFq9FYJq3hzXU4DsXaiG4AbQB+lpzjZAjg1sTDqx/2TaZwIxdSFOuS62
	eLiPmMoW+0Zatc1XJ6nJS9TC0ct/+2iycNedO94/HbSBZOYCDEy2KrmpFMDQgURxJG/UMb53Ju/
	EQVB6oTcHQnvmb4yZUv326vOwFlKe1HweowBZY4tW7sJRGAlsD0P+4N2jsqk4tk3KUow=
X-Gm-Gg: AYBFou2vsWPB/DxOSXww/e1cOtn4fzp1JQiAsk7qSYWFse/XoPEnJ2ljN4N03/KRMhi
	MMoXKRTswoEI4HWn0pyZ4fBoSeF4k862aywXT6MX60C8xkCHlJR5Idu4ePZLwvmi6v2Qtjhv5iO
	jxGAw/DpYEEPb76hL6nqubbDHnU1n6/bFYIkyLYL0fFOkaLn2EcGCFGc6CMq3IZBbCP5tAnfsT3
	YT/0FWbqCLvD5ycwfGcCxQW3gSfxtkGjZsU4ANF+z5uN1nZfX6wXNtazWg9BFc6TA4ynsZ+sAmq
	zM9eTGpUzBbxLWmxJCy6jnk4cFdgy8gPs0j40Wvu+uvEFSA8HC4Fwu1dK+dsg26moicokpXm1nD
	Blacz6Qv/b0fCAPbTXC2nMfNKBK7yhw/0NBBoQl042X6tu/wkWuzS/5GNUJZhEDVxyjsX8mN/pl
	Rsh6x84R/AndSf
X-Received: by 2002:a05:6102:1359:b0:7b7:39ec:51d5 with SMTP id ada2fe7eead31-7c7e0d83003mr382411137.24.1791269707013;
        Mon, 05 Oct 2026 23:55:07 -0700 (PDT)
X-Received: by 2002:a05:6102:1359:b0:7b7:39ec:51d5 with SMTP id ada2fe7eead31-7c7e0d83003mr382403137.24.1791269706528;
        Mon, 05 Oct 2026 23:55:06 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a87e303fabsm52162651fa.21.2026.10.05.23.55.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 23:55:05 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: robin.clark@oss.qualcomm.com, lumag@kernel.org,
        Joonhoe Kim <26rote@gmail.com>
Cc: abhinav.kumar@linux.dev, jesszhan0024@gmail.com, sean@poorly.run,
        marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] drm/msm/dpu: disable the slave encoder before the master
Date: Tue,  6 Oct 2026 09:55:02 +0300
Message-ID: <179126968609.1110179.6720784693254574991.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261002130712.50612-1-26rote@gmail.com>
References: <20261002130712.50612-1-26rote@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 0Ro-BXP8lziZzrZyvqR5DhoIArwS3BiI
X-Authority-Analysis: v=2.4 cv=GMGdgeNK c=1 sm=1 tr=0 ts=6ac49b4c cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=e5mUnYsNAAAA:8
 a=Nj1YSEbt09hXx5T6n98A:9 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDAyNyBTYWx0ZWRfX9DdjmvN6RCKt
 7M9XwuQTZQn8iTsL1I2qGRJDBhJWuyaPiQHKVhiZWlYKztxS/HCfmeomVjcUFLM/n3fV2McHztF
 GcAcgWmWABSKdFhEiJOR7fZD4CHS4XQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDAyNyBTYWx0ZWRfX1r2YQ4YRaRyu
 yi4q70Rk0tzyWr/Jk/2limKiKdFrxcyNaunpr5HmJjrhUg48vlDjRkqL1dnG47nWGZ6sV/WdLp7
 biDkPWI+N4yabsmJwsBmtVGiKP1uE7/yGuhvcajnfMjlXtff6O8zEx6hGw+XHO3VhJVjtJAWoze
 LXPqkE2Ph2jNxTB6Rj02N8Rbxd+FFPgsvxFRzVRYk+a269YTzDh0Q+tEMqvcxgFII1xQ7JLZxHB
 S/hubuR6ClGLyGtR+4jCW+ZISncP4kon1LTpVYYJ5hVmj0quHPy8SaTSddOKBVfy4Ac6d6Rseiv
 OxlScKyhmpyO2S+boZwvc0mCD1A1WbK4IcUEaKa1jzu/zUkp0G9PWjP/b9HImG2MqZJF+6vjbkN
 pPz4a+bV/6psFRmNEialXmulKxsPgwSo8fH+Na9+Gc7l1dLNjvhU+zILWmLGe5N+wgZg1HzwfSf
 u6tXvGpFHyyrt1a8Keg==
X-Proofpoint-GUID: 0Ro-BXP8lziZzrZyvqR5DhoIArwS3BiI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_02,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 spamscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610060027

On Fri, 02 Oct 2026 22:07:12 +0900, Joonhoe Kim wrote:
> dpu_encoder_virt_atomic_disable() disables the physical encoders in
> phys_encs[] order, i.e. the master first. With a split display (two
> interfaces on one CTL, e.g. bonded DSI) the master's
> dpu_encoder_helper_phys_cleanup() then resets the shared CTL while the
> slave's timing engine is still running, and the source pipe is left
> stalled half-way through the slave's next frame.
> 
> [...]

Applied to msm-next, thanks!

[1/1] drm/msm/dpu: disable the slave encoder before the master
      https://gitlab.freedesktop.org/lumag/msm/-/commit/32d04280ddeb

Best regards,
-- 
With best wishes
Dmitry


