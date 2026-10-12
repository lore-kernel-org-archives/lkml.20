Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81D7E43CE58
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 07:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791788467; cv=none; b=OJIAdfuoQkjbRYhPfZddV6oZXHMgE9DI8gov0X4crqv7S8LxJzzOs5w+1/yOTZ/s6/NWiabPKUO0Y0u75Afl+7ZyHtJCB/2FWm9MKczi2WfZSxY+QD/clmO/IJ3QZzeMPmYkDUD+xDIT3rivbXjQHAtRz/2K6BBoSZpPUJ6p5R4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791788467; c=relaxed/simple;
	bh=opX9U3xt0PuQKXFWlKyeTFaXRUY2tzH0i9LU8vWzjWE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iV2+6DafC9/1SGlMkM3tYedOEabF+SUN7jmf9rfVKzQX0131zkOyoP8NpgXA6ohhvTOEbHlU4meFL9U9Sxthp25nQp7dgQBSln5KMGp/Nmae5Avhx6PfkCqbT2uaKnaoKrWXNIHYqKVe22xrA3pEdTPboNMjt7s+iJbNWLyYnsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YY2iaJYR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vj8+n29T; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YY2iaJYR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vj8+n29T"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C55jj5475094
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 07:01:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Efnu9rK1FagTbizfEvVPZFQB44bsbmV5V1j12zHm+T8=; b=YY2iaJYRkj4ca8fx
	8bZ6jZvcvd0ssbY/ugQTGnY6/UfhK/9Z7J487hLYz740D7DnS5M7xBzC3fLOFbfh
	9a266wndxtPqoBqEcME7WRu8N+gUqT5WUi9rSi4DhZkn69IDapU1z8EBmlA9LNkC
	DKGLdGz2f3XynnBVkgCAorA0/nqXceY73GgfNnA1Ma8TesCFDSIrI68qNg8q1qVD
	iCYcEGXYVoZ6x+adnkT2N6XEHaCsdFXEcLTSPdtxO+RjTJ6UVcKC27KC9RbKuXvS
	02p9gkiWbafP/mw6qwx5yPM4ouc+lM5S9Ald7WqvuAa4w3kAKr2HJ35hsU1T3vt1
	zeonow==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7en9w345-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 07:01:05 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93dea15d721so7822585a.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 00:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791788465; x=1792393265; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Efnu9rK1FagTbizfEvVPZFQB44bsbmV5V1j12zHm+T8=;
        b=Vj8+n29T/7Z0qE2P8lm5ABleBzTUmPCD9sksRbXxiJlNGlPA2qWYXDKNWlTpSFEBqN
         vi1FmQWLedDMy6RVuwL+c30+bdWEKWQZhD5kcDk1+dQFqvHUo0/ofVjAJFHdKQylW/g2
         25ylPMJ4TA3AlH6O4PVBvd6syClXq4yZqfhKSbp92Yh5bERY8HkwvpjYb31sWPzBLPpq
         ggbhk1hgBd2Z24eIpyCxzdCN4jhZEkV4LdKbvA2rRvGNhvoUNbTqxAvqkGPD7TNooLkb
         mATgSWwl8BPCYLI6ULAaG8ha+Z9DJiLztFk6L0sr/3wi0Z3yratQ3oOunMP5x2vmg7f+
         aOzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791788465; x=1792393265;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Efnu9rK1FagTbizfEvVPZFQB44bsbmV5V1j12zHm+T8=;
        b=I79vVF5L3UgioArFmV6atHerq2VPFoeAmAfCoNdH/j6CBP9yPh8od+XKxvCF5dyuYl
         LwZLs9yBAiszQZ8dXoPdkDXykgreyjAjqEU1zb8pvkheQCvDt5CDVK2I/iz5MGUCGkAZ
         gMiHDYYk8tSFI6w3UPVmNqNsd0lByzWrW32o4BD2uhChCiYH+Rre53nfiuF0aM4v2f3Y
         KhRE+EMBJRuSOH4NhjldsM/Sd24MUrPal+fk25RkYElH6Ut+sOlNNICYLq6PJKFZ55ov
         IDlKSYFXrPR9Bib84435NlmyLbifC4gkXTbcij5qqCwIMqg9pnBR7ZwsCPM4O2S60nfN
         +ovg==
X-Forwarded-Encrypted: i=1; AKwUvBxIptjsvvEIeJkSN2p5ltglKtNUnD16u8HE7saxyAJAGOAXUb81wi6gNr66r5V07BH4ezQY5sEC57MqEdA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJaAH1nZ6gHHft5143Ybv+HsGApjBMHgDiFyc4YLuPYh7VPtL+l
	OlsPd92EFiaWtC4kCJVEtX1eqv8nBEe9fE5fdFVKu11YRVgFeQDmC/brjRXllU2AJ3sJmsT6PVG
	Wh8jolKWplQDxtGmB9VbX5f10D4jlXKk8AAN0Zf86Bpu27yGD7OfxfjONxioWH2tidjo=
X-Gm-Gg: AYBFou0zccPUrtBX5Hte69pTU10mMopc4R8tLuVLkoIZ6zwqfVD84oYWBx90wnOPhci
	4vHQC9pH2KYZx8MvQIorDwqS0uLEAPeBNAtP1tFYtLSq7e4cuAmdWWblhDXazUdHADzHTgir5s9
	gQ2xgn8Gnr0P34VevfNWOoGVQaI9cn8NMLpI1GztaPHaBKKXf62OW/0KyuS1WxGdTubK1Wqd7Oc
	lYg0ucYLMUcRB+adybz41VY5lwMipfM3ysRURoz+ymm+t08KDvGwr2RyhN86UbhazhZJufxxAPn
	V8Xa512Z8fqOd7YkLL78WuZxzqcqR5miWfuBlsYuw1bCPRj+35ma4oMQ9cxoXzaNhPwZm7cswjS
	wjDec3Os0wT6BwB4Ud1YQdQ==
X-Received: by 2002:a05:620a:8084:b0:93e:571e:94f0 with SMTP id af79cd13be357-93ebd1eabeamr1637430585a.3.1791788464562;
        Mon, 12 Oct 2026 00:01:04 -0700 (PDT)
X-Received: by 2002:a05:620a:8084:b0:93e:571e:94f0 with SMTP id af79cd13be357-93ebd1eabeamr1637426285a.3.1791788464004;
        Mon, 12 Oct 2026 00:01:04 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9aa94d4sm424903966b.62.2026.10.12.00.01.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 00:01:02 -0700 (PDT)
Message-ID: <6e67b0b2-8bae-4568-a276-56f9db360b80@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 09:00:58 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/3] drm/msm: correct DSC RGB and command-mode vblank
 handling
To: Zhang Jiaxi <Z1529105815@outlook.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <SY5PR01MB1060041363FC41A7F40DF59DBA1932@SY5PR01MB10600.ausprd01.prod.outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <SY5PR01MB1060041363FC41A7F40DF59DBA1932@SY5PR01MB10600.ausprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Woe+otfv c=1 sm=1 tr=0 ts=6acc85b1 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=cNoKYFeJyS4W4/1HdvzxLidmn8o=:19 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8 a=Ot09LXujVt6j2_2-7twA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: bgeBhPjHIKbJ3UXgJ5aJo7dRCP6XkY0t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAyNyBTYWx0ZWRfX88Cf+5308v4r
 cxREqzGg4cyt5t8kdI9Xdzryl2YljxrDpzVNcOeedRKXDpki+C8fEeCwKOyXHxZ3rR874MuC8R0
 EtDyecsBHSoUr/7hUnREcfNNfUIHVtmlidYxcSfa9zvaAiFfuKHv+bMPJmFhi0U5g+KvAlKDwa9
 Ee7imGlv4WrGYUfVpTRh/Mfs3lI96qfOaXKyJRDRBgGB3W8inWCD7zNO+MXLP03tI1FR6QNl0I4
 SdJAPCid17y499aXd9SMLbInBRkdbgPOn4KXN9Qc4Dy7Jo/fAjVaNENYggVoNBsY2CKft+fSOiD
 kxh5/1k7dOdcWx63/cm1xgTE9e3MeBjXr44zz4Oh+LlQHHn5r73ubCdln7TjPUm5FEZT/cU3Teo
 NIjKMAkfVj1nh16iLykQB3ZQaJami5IPAUy6IRNpgRS4JcjSothifZ4rvRWab/rbWjBxS1aQSOa
 9XrMP7KziOYocAtjvow==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAyNyBTYWx0ZWRfX8tOpuZcsTqOh
 BETLfjyBH5FQCc8s49jzNLhouKSb/gtb8avPouEZoqwuyy6/JR6X+TwDYO3va7JPCmoOWoSJGz7
 17PnDdeqzZdROqt2u3pnNSMUzOjpnw0=
X-Proofpoint-ORIG-GUID: bgeBhPjHIKbJ3UXgJ5aJo7dRCP6XkY0t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_02,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 priorityscore=1501 phishscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120027

On 10/9/26 12:34 AM, Zhang Jiaxi wrote:
> These three independent corrections preserve current target APIs:
> select the existing RGB DSC 1.2 RC table only for version 1.2 and reject
> native subsampling in a forced-RGB path; retain the commit's vblank reference
> until completion delivers its page-flip event; and reject video-porch
> scanout-position conversion for a command-mode tear-check counter.
> 
> Command mode initializes that counter at vdisplay, puts RD_PTR at
> vdisplay+1 and can wrap at twice vtotal. This is not the video raster used
> by the shared timestamp conversion. Returning false only marks that
> accurate scanout-derived timestamp unavailable; TE IRQ/counting and the
> current off-delay policy remain in place. No always-on IRQ policy is added.
> The completion callback consumes the current count/time and does not wait
> for another TE interrupt.

[...]

You sent a number of patches with broken threading, please switch to
using the b4 tool - https://b4.docs.kernel.org/en/latest/

Konrad
