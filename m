Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792573563;
	b=m4VjFeNTbs0mjJNXTmwBAf/IGE4lgekxYfquH0wuULwoFAJKctUoI+5nXvP7HipG/CyP
	 65Uqt/nkjx5rNyYUT4rKQhImqQNbZmgRlvTSb2fjfyRHa/ZbxdFecvIei29tpUFeEOvYm
	 nCXmoK58ngl+pKotEvmcIcrvDm9WSpMj2tDgEeYaPQZpyivsujyV5ElsmtgDizCyMGRjQ
	 PnPbORmlBpqkdg66F6gs9NnfnaiFUJqIaYw7tiPmA++9kqfsenPFgWokqFF0Jj3LaOm5i
	 q+3+O//yFTlxTru4oHszBXMj99fAYQnrA6ougRf8CgO5rvO7KX2QHvGmbZmGlbimXqw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792573563;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=n1ER3lUc97YATqDpNc22hGvkHDFIWxr4xKdKGaCIwaU=;
	b=Nho+j0AHwUbVuZ8BnwjmC3WFsB7RU9H5xZ13/ldALNNF9mCSNJREp1kj0hLYqlD2B3qj
	 hykRoI//5yHykGZhg/cvH89o3L1+HB+vi8NON2myKb5zacOXyKYCHNh3ZvQM7Ky8lrt0k
	 YkUy0ojjU6TymsL2N33VEV5b9VV6gt7nCZ7XpMeY/RaQVY1SElsRvtLynWyDcGNobrQtb
	 Ek5P1OpDUsZWWDrn311xRB62X1xlKvlLEK1KlAmdiE3CwBZf5rwXs2LdRLUs7gMNJHE6u
	 Tl3OOjjbx44Ib26AtWFBUSEpGZLuQx9os6oyllSnnFPtVaUWT52EoxpMm3rzDmmYA1A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Gog5hrfx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bqfCaeAL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12513606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:06:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12513606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Gog5hrfx;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bqfCaeAL
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L90sD5135040
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:06:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=n1ER3lUc97YATqDpNc22hGvk
	HDFIWxr4xKdKGaCIwaU=; b=Gog5hrfx9VOZjtUe4doedrE8pLSZtW798ZiQCrjn
	3u7L7DCuGYDQs2g/qi99SRpJJKIzm+g1xO661a+wLX/hmsGgYM+yDyk7NpUGt/Hp
	BYJkX7UY0tgeltlzRXdH4wGaGCIF1NiZA61BACU46oIcTfTDvEqtfTIyGor+rXHL
	yQE3cCVC/caHv8LzATHrnc08yb5piMgjpfBANf7C/tL/f/+datDAqYgrDfu5QHPu
	SAzybmYqomti9iZg7npu50lZBZfGwZJcwU4vZDuctmpRYim81VoeESnoF+EjZcXR
	dyz3T0rt568h2qsX8n4AWtHbBH5Qpfc/5KaD9rXjb/1d1A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heh5r288d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:06:01 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e9821ca96fso5119585ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 02:06:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792573561; cv=none;
        d=google.com; s=arc-20260327;
        b=XH0auke5NcUSjBLqy5DDoHHW4obMPPBK1fAY10S8gjsSnDWm5LiUyb4MkQgTCDo6LQ
         ynzuCi8Q108Wtbl53SpaJYn86v1svTlBcOjlsUP5PjRbCyntiNIcxJushGvK/daV4ggr
         TwJuRBzVJrchNCtnqgkuY4zliQ7by2Bh/QgKVC/H7pbJdjDVU/3+jeSO3mdD/NILGNVW
         y0mRwhR79cXAOTk7nO/8TaxKb7dvKD/84JhvmV1T1SF06WAge19hpSIHsARetQRn8Q14
         3g9SA/df9mImx64h3m/ntXjPJ+Kc02pZaKuuN5a9raKekYjiJL4uID3cI49qCZpjGScH
         fIjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=n1ER3lUc97YATqDpNc22hGvkHDFIWxr4xKdKGaCIwaU=;
        fh=3Y2vrHHIQrB+L8C08ttaCdlFiTDCSPce2sAp+awDgQw=;
        b=DfDFhyUBG1H5Ge9InJsgyfy8fnn2LyK4V377iRuMazNbFIO4XXvLdP6ZxHppB3pE+v
         PkLbcth3s8JsMBIvxzAbEb7S41TQhZ529cOwMhAjjq9U12OcJkPNvkHrxmmvUtBhkzn7
         NXecHMpLQVLm0HE4pdhI2lceXj8lD4ozVR+LmzzQuw/FcKbp7DpHZEAox3UwaEL1HqYs
         WMor8lv9kL7gVZY5Pf01zksKaAiCJBbACnBHP6GMR+yUBRLvgmeAY0BIkGXbwYkY78ez
         0wtcc3rY5x81SChWqGQk6xKjF1mX+0CsxJOgiEF6jzTn5L9S485M+XEpRpEGtoZz+Zkz
         9lRQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792573561; x=1793178361; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n1ER3lUc97YATqDpNc22hGvkHDFIWxr4xKdKGaCIwaU=;
        b=bqfCaeALRkvwhW7BFmLZ8Gy3CuQWtCJzio/3pE1uHM++vArlA4iDxUY9ivGPb1j4Pw
         gxKn31pW5PA3oNfdQ60NHXXFBbPjynk4ZcMBUDVB9w8dT8VUaYO62Mymn94pgiF9JN6Z
         UofU+nqf2VPo4KGxDKZ7RhKHOqISZpxj1Hl5rM/ZKO2cOIFiljIU478HQQ58NospCsnj
         /uBAYn5QG59t61cptJJyOlYRYjiu4cnnJ0EngcJgDalLzxi/6h2A2JrxIse+9nZkMIef
         Uz81fFkJmfyV/s6jTqKucWKpC4MPDVhLNSmoGWTjacQ6aygYbFfCAoVl+dUwg/NkrBVx
         QS+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792573561; x=1793178361;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=n1ER3lUc97YATqDpNc22hGvkHDFIWxr4xKdKGaCIwaU=;
        b=XhyvK4mgjpJGtO5XhrqLHJlOeKpy6RWTYMiTgfuk/Xhr9A8crssXuGcEgrbAiSFbJv
         hP51z7qKhP2aUKfJioCWD56+hOwr55e2ngTJfU5NORpD+66jXl1R3S11TRse9XU8YVNq
         9/D4SSRjcWITi/SJxnoCVO8bIXnfhBrznZPpuLdXxCYA8K617vJVXcmd72NtUBwxqfx2
         KUqqGhhwWNOmQiKqnhMCiOdMZKIe8pFv+eopXKoiZU6oO4E2nmHZV0KiGUhQfjx3Z9P1
         7KrV/03u+eE3D0sWN2OoprEkiO8Qq9srqh+4gGTzrEyj1Q4sxOwnOXBg3Jg8libNf129
         01wQ==
X-Forwarded-Encrypted: i=1; AKwUvBxnEV48UwIfiSuIJuh+UxKbtcUColV0pptJ9SFzDMgbfKq39KO/Vx0IiTHgGbxkltp3zvTtJd2r0ZeLoko=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ5Rk4HbQEJQ+tNJC8NA9SBuIJjpjD6N37v2QtQ+pHZhVEuMH9m
	AY9Kz6p6c/ZMvJnEKlWoimHrxSkIyfTP/A9YFL93iTk/G1Jkyk9XG6Rf1Kdsfhxy02nk9CFmNEG
	6bXkb5Bnk4yo5T90tq2HDNVd7AavdYauCD2KNfiVNT9d4VaMS3cgZwO+kaADfYY7VC1WJ7X3Lnm
	1rKBDvAm70ypMr+kkAuM4UeWPs7GK3qmjD7AGskt8QjA==
X-Gm-Gg: AYBFou1Rj2JVYMUWxXaxOPTNPsAlzpQTBfAm61kGrM+rfVhsS76cUIbbgMSntGgcN9T
	qqCEPg37WX1e/VxQnMYYLYAonOVWHiNdKBJSy/wV5sJi9mkRNtKc2fYr66vWQpEykJwFDG0AfUU
	1horDwBfQLy64yJLtNEp/CWx4yvbBvCCU9CvV+XlZ3qW8BBGUZOW9fGQM3sg==
X-Received: by 2002:a17:902:c948:b0:2e2:dd98:59e8 with SMTP id d9443c01a7336-2ea4396c9c8mr11804965ad.3.1792573560702;
        Wed, 21 Oct 2026 02:06:00 -0700 (PDT)
X-Received: by 2002:a17:902:c948:b0:2e2:dd98:59e8 with SMTP id
 d9443c01a7336-2ea4396c9c8mr11804805ad.3.1792573560244; Wed, 21 Oct 2026
 02:06:00 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020130852.3049639-1-cheng.jiang@oss.qualcomm.com> <f3240952-f28c-4c2a-a4a8-4492aef3a88a@oss.qualcomm.com>
In-Reply-To: <f3240952-f28c-4c2a-a4a8-4492aef3a88a@oss.qualcomm.com>
From: Cheng Jiang <cheng.jiang@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 17:05:48 +0800
X-Gm-Features: AclHuK9BlICWHwxCq0lejQo5U0IbInRuJeKWromlRSOMPAdiPn8Fd4RwhwbW4Wc
Message-ID: <CAOK0kb90wYEQU8e9wfQ8g_KfkfqwiQ9_ideg2=mSrU8OuTLxRQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: shikra: Add RF_CLK2 clock to
 wcn3988-pmu nodes
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Authority-Analysis: v=2.4 cv=aI5lOr9m c=1 sm=1 tr=0 ts=6ad88079 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=m8YJvu37PK3QkMmK4r4A:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: 90fyewfnpKY0Qibh11fEGT1Isb4q4nfr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzNiBTYWx0ZWRfXyDx0IQaPq3aT
 oldDQB1qMgx3D7JbQJtPmPxLPA1jYtBNBqlY7npPTP+Ud3Hh7ngFdxjEKd6WMZfBkRcvweLepsI
 xEndquL2f/Q2bB/Z+ZGoR3x2XzvR8tb9THM+aaHpERjg7dPQpQuN8F9dKoObvKAVLWjD46UAqLs
 hTAgc5WeWmyvUHZx0/GASBsFyxpjx/eK4+1PLyrHK7o5oUtJfgaWgQmbgpeSpXnYfW3nnj0t32H
 B+rm4SXShgYgZ4ofAJgg4XFpZw+aRMjuaRk/bLqo79IA5pO88O88X4swyyAAZZDk6z+WO9ubKbU
 3WZsuFcl1WdGqW6AZngG0CIQEnxe2G+utiZVqP+2u3iH7wvTJAKUTfZHL00PRSGRCSkoPmSexCg
 wrdry87HCScnfAASZpe2/MwOmJLjtBhnIVLMh8XuASy5kpMYZha3RRpAdim4ZBIK3FfO4xYbF/7
 WmgKAsLSCalplmintUQ==
X-Proofpoint-GUID: 90fyewfnpKY0Qibh11fEGT1Isb4q4nfr
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzNiBTYWx0ZWRfX7RQHtdq3smkN
 Vc8NbP4zznY3ymLH1Tyw8p7D+Z1E694MPR1zbZ8w2YPv3vBI7CvmIVgutjbpeCx/gPpu0AUqEb+
 EvCLYLHgiMoQDxA5pS+eZk37QVjzCZA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 spamscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210036

Hi Bjorn, Abel, Konrad,

Please drop this patch.

I re-tested on Shikra EVK with and without the RF_CLK2 clock described on
the wcn3988-pmu nodes, and Bluetooth comes up in both cases. The
commit message claim that Bluetooth fails to come up without the clock
does not hold, so the patch is not needed for Bluetooth. Thanks to
Abel and Konrad for the reviews.

Sorry for the noise.


On 10/20/2026 9:40 PM, Konrad Dybcio wrote:
> On 10/20/26 3:08 PM, Cheng Jiang wrote:
>> The WCN3988 on the Shikra SoMs takes its reference clock from the RPM
>> RF_CLK2 clock. It is not described in the device tree, so pwrseq-qcom-wcn
>> finds no clock to enable and RF_CLK2 stays off, leaving Bluetooth unable
>> to come up.
>>
>> Describe the clock on the wcn3988-pmu nodes in both SoM dtsi files so
>> pwrseq-qcom-wcn enables it as part of the WCN3988 power-on sequence.
>>
>> Signed-off-by: Cheng Jiang <cheng.jiang@oss.qualcomm.com>
>> ---
>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>
> Konrad
