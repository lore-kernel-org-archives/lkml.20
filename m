Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793007876;
	b=vwQgnQnIkvzPCvkWq2XGtBuZ7XPt3ta+YALllXq9eaQRJVBhd3sl8YHAI0GyQuhQGDLo
	 ZMb5du89G6JZDs9+n+lNPnTwfvI4X5RpVeudYLejgRbSDD4PLUN/DDaY8bVrM0+eM9Cvd
	 vPb2GzfycypW6ka52/DMnpjSg8DN1ny+cUum+iDANEI8pNubpgu7HB55W7HxPzHrjkUjz
	 aKAwcqdoO+CCCAQxdT6mknm0jalTdrmTY0jAYXldNgc5HC9HSHHSaDH7G4mhEt6asCt/q
	 DsEUvlW5f3ZY9ErjuAy3WHwEZnQkyLU7y0xq9gziwtWG7HuLwgH3mgkPCSMRW/kiyBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793007876;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=hKXdfB4Gw4NaKIutsMligvpwPmDeTaajtEivhe892x0=;
	b=3vkLKsnqY+dCtsOnY5WbC1T4U/a5p4Eyea8F925GS/MMgPhXOLJmdHhR69O2QPdGngs2
	 DkgB5CwR/taRa6mo7mqFuiFVkZK+L74XBVcmdZWK0DMKCAtcS6bjYjp1EmbvqjFCD13oX
	 YGrgJSeKZyQlKovuGlNe0xBClhVMe11tL9bB0fICpuarjVqN0TFyU8CVPEwmDhF9NR891
	 L6gvIfJlfbW1MLOEvK1YS2TrK+Bun5gZjg0YRaXJxKIIVoO4bL/oA4wzyTUSq78uxgCT6
	 kzasSA9PMjyk0/JDzlZm5BdVvUCzqizAxMdiM0rJ9gLsE/13NdHwk0fp0ap+dnNzFsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ooOInxsA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=E8XULosd;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B31C7606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:44:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B31C7606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ooOInxsA;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=E8XULosd
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4aqRf1181742
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:44:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hKXdfB4Gw4NaKIutsMligvpwPmDeTaajtEivhe892x0=; b=ooOInxsAYZUTmA+l
	b1Lf9QSDcCoKKt8RehLUwMOId5REsiEg30o3HM2PgbLcOxdVXKJW6+RAR/foh2rB
	yqWuUEFfNmtEzXqD+6Ws8uSr616ZhYwzxAtaimbIk7Eb5gg8iTkGGGTtRboAez14
	hkYz31H2qowwoS+KbF4puBpVbD4RsU2VwcS7Q+kNROYK9mM3SXW+6WUPKN7+JOtz
	IiAO9b71Ip730jAwJzso42O1W1Z4t04aZ9lxEEHtbL9iLFUDbvjKFCfKsuQJxycv
	HSSaAPKhtffrnHRvbOJ6SuTmm2nEi0sVFTRnutmED2yzwgUg0eAosOICKXknqzzo
	1au47A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgn27wrxu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:44:34 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f1440e081so35696285a.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 02:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793007874; x=1793612674; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hKXdfB4Gw4NaKIutsMligvpwPmDeTaajtEivhe892x0=;
        b=E8XULosdBaRp1P2hgJIPKijVJ41FHP+xl18abmWhED/wPzoAgjBYMBiUeu+JMpBn78
         3wAC0NBqHdzCYH0+b/ABBsqwKjUM/p58qMFXc2pWc5oR74XlKJtGcuJ8llCPHi2lvhZs
         FURV8Q0rbkHGz9TEnQclHalROvr8HhNVEdQEBBIi6uY4M8iG4YvybVfQEBhaEkIOA32f
         E9wB2sTJ09HehzY26rjcIx0vC5ikizNHUpd/Aitgx7JfZlwrv5yH3x+e/3cGXb8ZMUqE
         GKrHr1F59+w5ws8cx1zbvwSKVRjA0Y3JzeAqVsphXPmgjRMuGQ+HNSE8Y5HDOlVwbvdn
         ZSUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793007874; x=1793612674;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hKXdfB4Gw4NaKIutsMligvpwPmDeTaajtEivhe892x0=;
        b=UzZu/h8qTT6+4Jg9kRwIFxx4/d52mw5lT9HirTqMU1TB0Ixkn0yqFUellNqcGx2pUo
         2XUwUzt/tHgsmI+GRK1fo/QVZnvs1KpnU8+wxkrpo2I3LEPctaNwc4NclTgn2d4R+7ph
         8CEgqN0lDd9iAjEj38mNdgCZBCAEEkfXS6EkbtfR15qMNIbPD+D2zocYpjXo+8fzlRtD
         Hsylv3BS272AdomC86FmQVUXeBKVFipD983A0bawCdJOjnPKnK/jkGiJ24u70uBd4dwb
         h+UMgjexRzGZtvvJfMPYvtemsHIXOJ8rF6y9ZKQ6/4MrNAP58AkpDu21MHdVEb5n9Hsn
         fxzQ==
X-Forwarded-Encrypted: i=1; AKwUvBxnL0cVXZxxGezXC/zMqCV7nfAs3FmxnkfuwsVDRSCCfxcJqeNv0pbjpGa3rEW+5YPfXVLWAgPfQLIwNNg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIelb+wocTDzpLRFXPonhmaqZRIcNECAtMqVZvVbVucQohGdJKy
	ma5DgbpgGGJUEYeg+0BfY+DevKeA+1ubgWI5h7t0bTiNEP4ULT+kVEPQYMpoXtxvMjD241I7Yjz
	tGgd1Xw/LUPn3xhgO9VmuINNIzFkGUUEQzI/MwY3p5+OI8n7CBMmh26WCxXBluvlaGjI=
X-Gm-Gg: AYBFou3ez20hvwdyEEvPpmlsy6iTm2gnIAgvzIVNKEUqWaS9uQRtZSyjtFLEFYVBX8b
	aKLoFPBXbfvpOwfzzxsxjVhDWkExooiQxTafepGF8CR2sISP55uC6DNy6GvHwAAHf5Y7kTdJQLc
	Gal4tcXt5h3zqG5ksvU4vo2cKINHsMCFf0A9FmFhhcilA9H853IPTLL6mGOXyOkmKexMEd64gAJ
	TDhgfefwJwslsoufaoWa/3Z047Zeqxz+xlyaEGMdAw2+pRVkvQLUV4UQCnK7/9M3IiDRVPojk35
	nsg3R67NMslHNyL8+Xd3uaDXeeBO9xwwt7F2DQZpCugH5M8UhScSI5yMQKkUICyHyOjiorYae+z
	2DJp0ZmtUptOrvUYmJQI+/Q==
X-Received: by 2002:a05:620a:3bcd:b0:939:9ef4:79eb with SMTP id af79cd13be357-940ef96e36amr1004578685a.6.1793007873945;
        Mon, 26 Oct 2026 02:44:33 -0700 (PDT)
X-Received: by 2002:a05:620a:3bcd:b0:939:9ef4:79eb with SMTP id af79cd13be357-940ef96e36amr1004577485a.6.1793007873529;
        Mon, 26 Oct 2026 02:44:33 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd34f465sm297052466b.8.2026.10.26.02.44.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 02:44:32 -0700 (PDT)
Message-ID: <40720fec-3147-40d0-bb0b-44a5a89ba0c9@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 10:44:30 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 13/14] drm/msm/mdp4: disable the vdd regulator on
 teardown
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20261024-msm-kms-destroy-fixes-v3-0-66a30120a5ea@oss.qualcomm.com>
 <20261024-msm-kms-destroy-fixes-v3-13-66a30120a5ea@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261024-msm-kms-destroy-fixes-v3-13-66a30120a5ea@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=G7GJgNk5 c=1 sm=1 tr=0 ts=6adf2102 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=pXRCLyShJLD6FikErHUA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: zru5r2bS8Hf666xAC6njhbuYj7jq9ef9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAzOCBTYWx0ZWRfX7IBWiG12oXe1
 Vx9G4wvTNAYy8ZFp2fV5bUJqm/kW7NInnn+czpKnWPnKkStdI7eW3N4MucSx5SdKiVRDuPW5T2M
 Fs79+HNjCxhFEqwzZj9/3XYhcrAj4Uk=
X-Proofpoint-GUID: zru5r2bS8Hf666xAC6njhbuYj7jq9ef9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAzOCBTYWx0ZWRfX4sjgEWLTc7AV
 UaJEGxfdRjkfRJ5hmfeROfQyFA45WAcTWg9bibZ/s7XI3VUsgy1nzgr6+2+AyeT9Os3SxHzjLwV
 OA9TEEGrM1fID2CyvnaFrIcmhQlYm+K6ElizOCeF7+S6ZnGiA6C6+qphZn5w9wXBjd/dzWis+Vp
 Een3TV9ILLL5yHglEC9z6rjKtTWRecehsHbCmPmTpiTskL6ScBrK18EQJyXmpD+oAst6EaQ55th
 LkU0+sUT2tam+FUax0cYUwpDq+Z6TzDujT5rUOzWDTaEMb4KzA/E2ozksrkbn4w2paNJTuDwsR9
 CbzC/6cuR7yKRtcgplNyassOWjW/RMIobW/CvVAGxMW+2PyK9OhLcOmOfnnNGPqe4eJr/2L/Kju
 Ukv4NB3hTBB6vV9Y5AufKkwy6rd0Y/aIvla6isoRFfb2mi3+VEvxk1lJPzh2cenZbV4yQKyTF1t
 tf/i0eaiFzAWxIWK/6A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 phishscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260038

On 10/24/26 1:19 AM, Dmitry Baryshkov wrote:
> mdp4_kms_init() enables the optional vdd regulator, but only its error
> path disables it again: unbinding the display leaves it on, and the
> regulator core warns when the devm-managed exclusive handle is released
> while enabled.
> 
> Disable it again in mdp4_destroy().
> 
> Fixes: c8afe684c95c ("drm/msm: basic KMS driver for snapdragon")
> Assisted-by: LLM
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
