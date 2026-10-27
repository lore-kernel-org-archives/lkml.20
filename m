Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793074183;
	b=Vsc+XVRujxYughYWp3XloA7giyspWSBUpJaw5reptveXupK4HQZw8PftPKwxOXxwjPGJ
	 oMzArjOOS37Xu7bO+/UT2kAKW4TZNaVXyYfXCpIZZhvyecsivqwHAkHqnbRQ3+4YD0GIN
	 UXUbAUSpGWZjbaoiDkCE81tc4KrmV5L6mma5eXiuVk5+yrt/wRJHYTD6q2hKQdgiuQKOW
	 uOl83yRsE8WLlwTJFA4/q5rF4jWIEe50pReumoVGVA6JwhQHWcUSgwCSoLQlphiIEsGmV
	 3OpEZV3eGxrC0YgXQrf72MNbktHiewu0v9+uKOAPG8HdYTO3xhZCETBU0DKagZZA4NQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793074183;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=vY8JNXJBEmY2//YzxHAKXEJvbfSWEbX5W88WIsAUIF4=;
	b=IC79czJkcB+fMJ2nqy4KzLS1cj+IMtLlstrjtHF7n2ax7zZ8QzYnw/oxVRqA7Uj9xRqV
	 XD9FXjXZkhdCE4qfwcoho5dq0+tDNjTuAyopGXYHiFy62TmF5uGlW7Qd5hkjE04YM5Kju
	 KYopau9AL40fZ7bNRJ4xbM07vaJE6aX0eAQYYsMAKHJPjzETvDqBGp6DlymFDecfidDxV
	 ekFJifzTsukAPrWXWwupdHQov0l4ySNUpIoKHCZ6/cG+QB1UMKomUQueGv7NHYWIgGMio
	 p6wZJZdcaz46cQc9yboEZ7SHZ4ZwKtVXa1U8lCkFoOXd1mJalkXVS86ZtbzaqPGtueA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Jrp9PEbO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BK91d+m8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56274606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 04:09:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56274606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Jrp9PEbO;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BK91d+m8
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69R2EvsR1348715
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 04:09:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vY8JNXJBEmY2//YzxHAKXEJvbfSWEbX5W88WIsAUIF4=; b=Jrp9PEbO8E+rTtwv
	XSkewXOHXjc+TWaVhnoZ6nf4ZFtVGFBK04sY3ZiyxEbIQRfaKny46gNp0YUwTvuu
	NYUuzhAOIAxEngvKL/cB1c0SuThts2znYxF/8dAqY6NSmSTJV6RBC03UQzSi0oo+
	xMVUhiq3Cedqt2kcG1gP3BlcqSwgeFlTTnr4zKbVuipNHQRqCCGI0fOptXrg1huv
	syhhbPeratSZ+7dDB85YuLBtIRcQHMkmx/J3VNm/MFln9x4u5dr5Wo+/CRqiZCZq
	dH6LHfqmNInKqB1LpQlk1BFlCd9rsMC7SD7fFeKyrJeEGLCdl5ch4ya/i0qt4C7X
	Bh1ZPg==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjjbt8eut-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 04:09:42 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5eabedcf97fso685767e0c.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 21:09:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793074181; cv=none;
        d=google.com; s=arc-20260327;
        b=FEyy7/1Jseg9U423k9A6hh/utNPz94BX/Yk4Gd7dwlT60PTyuqA4w8SOq5qDPPydGH
         uohnKOgNfSPwlCtIscRpJDuMsjsOxf4XOO1MVjr6vVfjnOkh6qWad3ABblxV++85UZvv
         T0aLyYmyvt1fJf94soNS4Gja1TRGhEx+b9j2TP08XLgF4n0yljy3UgLhVUOAxE48xoB6
         JKtMQw9yVWdjLsnSvU6wwx1JV0d7sSclBwfuuhMc47oqdF7tTGMA1zUOns8UqtKFyO+n
         RyJaGni6hjVqCN3Ae3jM8C4yXbmXbQ+XSa7TiFcAIJXpOq85U3X+MqZtI0lMpT+um0Y4
         MzKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vY8JNXJBEmY2//YzxHAKXEJvbfSWEbX5W88WIsAUIF4=;
        fh=nwaWmAU4pMG9Op6ZWEe7ZH9qsAwT/JtWODjFFEPGzs8=;
        b=CWnRRJ5Z2k37AWK8W9tXu5zuAfT0wfCLySxIjaN2nvlaoH0bG3aomrTBJucrFEQPVH
         R9ZkBV2SP7MhP3Egk+MIZqJPnGAYznWIHDuxjyJp4LTXyGJ2Bhn1yvOL6P4oNPpbdxzJ
         gkP6Ldq3RpISKLVbzC1bfpv02+84MnHbf/3h89098dH7pNydKW5qiGa8yTSlMaSXNbjT
         yUdbv4F7ZzcLVBKoyTXqutxKumm+7P4ltb9MHl9lp2usJLZTprXo27jmknYlNexPmP7S
         2ZTF2T042zEsv86h+vHiw4k9m/Y7w7y1M16l001Rc8HQzzXrH92W8qW3AxqOKMn0Ig28
         zdaw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793074181; x=1793678981; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vY8JNXJBEmY2//YzxHAKXEJvbfSWEbX5W88WIsAUIF4=;
        b=BK91d+m8NXLqqg+pOgYsuJItqvm3kDNdrzxu6PHf++u0fHT2SskPgfrmnuy9YUdBTs
         dF4A65z+oOfrRNwpXITmCD44cB+OqOOem2HknERWVaq8YSRPJlvP+758LvjmFZnXH4d2
         t8Q+uA8S3cG8KrX8wYo1HcgPNIh0M1hSE56tqloYb6b+o9gSCMM7my/15p5jRaNacTTR
         fgRWuROGb0teG5G51eA6TvTeDOaR3VzSu57TMKJ7OtLeZ+oZYJXxn3NaI5GpPdwBcZD6
         eeAr/X79I4Btpa4fUumdsUqg/rRJPz09X94imnQoBN1E/j9fuQGOSdqK+IXDjU700WzR
         amdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793074181; x=1793678981;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vY8JNXJBEmY2//YzxHAKXEJvbfSWEbX5W88WIsAUIF4=;
        b=VyRzp0U4vuBprhSgNhJ1PUuqssV3t3X17KAvIEuNGwrRpzRFPAqqyBEdewXqnWAWw4
         jNH5u0/a3+nqi38j2h2X7fR4LDH1CYcMiDo3S0lf8bT9HWplLo6TpqgevfcqW4zCkRlc
         RSEcRyHm/pnddLctYmxOROSMME5DWwVs0xTbpvA+W+miR2Z4Rk5Mp5TAcaEdFzdgbsOt
         yoBupjbeZAoDh0ZGesCZZMcNAq4aGutQG86euVnDtwyGDALnSFZzE3b80nTisS/WdkP8
         ZCgrLUKPIqKPso0ufYHNAaHVVFVXoh3ccDmLpxdcWEaI4ybZeGDs7xkwY91RxKBb4Rxk
         /cJw==
X-Forwarded-Encrypted: i=1; AKwUvBxlNrkOZSAvFBhMMMcCQNaR+PsODDZakw6TX+Lc8sszuNQ4UreYQY+f/EeGe2s0FUeEHcmAjOvvxsHh5LQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLfMwr9mA0O4u9xhT9M/F/M2pOhCh55AEqLec2D0uxoUVwmrWns
	RCIQC+Wt4XhIqgtxsNY0QYP9FpRuZAFmuIKfQSKMmPSGsVM1RxisUAC7bxT0LTEDIm9nxpt4rmE
	JIYKY8lZIfUPBnHXWZ4G7pxLx14b9R01DC/f0Db6I2UiR++xf+We4ZEPtyOiGhsFWJ3hgfsCqYM
	sTdr4ZXYpPujAn1PWPWqI0OeGukYrK4Om4SxL47riaZQ==
X-Gm-Gg: AYBFou3FYAC76NQUTwMLtBJ0n0dc7+r5m00T7V36erez0O53DUW5uCSNkkBYk3rCXIC
	sHb+c9wZ2lvxMaDb4LTF9yfOhzKpDZ8KIZWU543DDoR2vwN6bzW7CfwilS045ASnnlKBaP/2qx7
	ZN5LXZluwR7jQCISxjE0ueB9nL4/C4OrNjviagrXykJbHVACWJNr0ZNZwOD60GSl0FO7XB34Tm5
	x2X/p3pMRIhQjBIYQ==
X-Received: by 2002:a05:6122:d2a:b0:5ea:dbae:3cb1 with SMTP id 71dfb90a1353d-5ec232fd7e4mr3193902e0c.19.1793074181375;
        Mon, 26 Oct 2026 21:09:41 -0700 (PDT)
X-Received: by 2002:a05:6122:d2a:b0:5ea:dbae:3cb1 with SMTP id
 71dfb90a1353d-5ec232fd7e4mr3193894e0c.19.1793074180884; Mon, 26 Oct 2026
 21:09:40 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261024-kaanapali-camss-v22-0-7da3ea49c8a1@oss.qualcomm.com>
 <20261024-kaanapali-camss-v22-12-7da3ea49c8a1@oss.qualcomm.com> <CAFEp6-22zEVoTQ8ewQN4CGW9GARZB84Mp_-SO7KrteYERSew2w@mail.gmail.com>
In-Reply-To: <CAFEp6-22zEVoTQ8ewQN4CGW9GARZB84Mp_-SO7KrteYERSew2w@mail.gmail.com>
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 12:09:29 +0800
X-Gm-Features: AclHuK9zQUYmMt2_uRNQKGHKLEw3Bs7CkPsj4KjP69u-e7zyINlKrBFyGote1T8
Message-ID: <CACbMrhr3imVV6nNLisD+gh=wLPn8ziw8wRL0UW6e-6by2RufFg@mail.gmail.com>
Subject: Re: [PATCH v22 12/14] arm64: dts: qcom: kaanapali: Add CCI controller nodes
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: "Bryan O'Donoghue" <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDAxNiBTYWx0ZWRfX2Uu6wSwvtVXQ
 Bg5lTqPnxqoYW05kc95TPoyMnGb8UKLSX4ZCJKAQnu6xyAlzOwrBu1X9pH2/8d75FKrogY6osow
 82KF8L6soicWjpUPGuzgTE9ZuQL8lM8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDAxNiBTYWx0ZWRfX7mANyl/hm0eD
 VpkhCquUWkJnshU79MLzSp54jtwQnF5pYBtN9nbOnrM+E8KYzsrxUsny3acOEnzTH/eU68L7k6P
 w6DPlOcKE42mazKJ3u69UbGQwnGoX4keIJD3gJUb9Y1Vjxn7EHZ0SKEGLRG5Mip8MNxo6h53iKe
 uJE8A3SLXNplvmb+5LOI5AthGmEH7EbfjZA0xr6xEzN2mdkBcq78ZG8HhLR4crupGIUMXlUNkXa
 84HxXA11hMfVahNF5ikP4g37zqHVC4r0y9KnwT0/hXNfmADtSGCWJ9QEJsM+JMa5e0HGfrRljuU
 jHwjcN/AB/nxshea8bZ4s2l7FlmoWcxSFXa94PCYfCm+xKMuy+X9f71JgOEOR1Gii2TJUPw2baA
 WTiLVbDfJ59afnK5wX+cN1pjm58i7H0zp0b4pnFKPdXAoqu28FFIbU646jzYOM4waCotrOeuHof
 poHH47v5KP9kKwfiYOw==
X-Proofpoint-ORIG-GUID: 3y7CdUIYgVCOm6FyV0RTvNk8M9pst1A7
X-Proofpoint-GUID: 3y7CdUIYgVCOm6FyV0RTvNk8M9pst1A7
X-Authority-Analysis: v=2.4 cv=XaIcX455 c=1 sm=1 tr=0 ts=6ae02406 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=VpRCVQi9ATEJuri8zQAA:9 a=QEXdDO2ut3YA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 lowpriorityscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270016

On 10/26/2026 11:55 PM, Loic Poulain wrote:
> On Sun, Oct 25, 2026 at 4:17=E2=80=AFAM Hangxiang Ma
> <hangxiang.ma@oss.qualcomm.com> wrote:
>>
>> Add the three Camera Control Interface (CCI) controllers present on the
>> Kaanapali SoC. Each controller provides two I2C hosts used for camera
>> sensor control, so define the controller nodes and their pinctrl states.
[...]>> @@ -4534,6 +4645,198 @@ tlmm: pinctrl@f100000 {
>>                          #interrupt-cells =3D <2>;
>>                          wakeup-parent =3D <&pdc>;
>>
>> +                       cci0_i2c0_default: cci0-i2c0-default-state {
>> +                               scl-pins {
>> +                                       pins =3D "gpio110";
>> +                                       function =3D "cci_i2c_scl";
>> +                                       drive-strength =3D <2>;
>> +                                       bias-disable;
>> +                               };
>> +
>> +                               sda-pins {
>> +                                       pins =3D "gpio109";
>> +                                       function =3D "cci_i2c_sda";
>> +                                       drive-strength =3D <2>;
>> +                                       bias-disable;
>> +                               };
>> +                       };
>> +
>> +                       cci0_i2c0_sleep: cci0-i2c0-sleep-state {
>> +                               scl-pins {
>> +                                       pins =3D "gpio110";
>> +                                       function =3D "cci_i2c_scl";
>> +                                       drive-strength =3D <2>;
>> +                                       bias-disable;
>> +                               };
>> +
>> +                               sda-pins {
>> +                                       pins =3D "gpio109";
>> +                                       function =3D "cci_i2c_sda";
>> +                                       drive-strength =3D <2>;
>> +                                       bias-disable;
>> +                               };
>
> Why do we have a sleep state if it's identical to the default/active stat=
e?
> Do you want gpio with pull instead?
>

The sleep state is kept so that the CCI suspend path has an explicit
pinctrl state to select.

As discussed in the v19 thread, SDA and SCL have external pull-up
resistors on the board. Therefore, enabling the weak internal pulls is
unnecessary.

However, I agree that keeping an identical sleep state is redundant. I
will change the sleep state to GPIO function with bias disabled, while
the external pull-up resistors keep both lines high during suspend.

Link:
https://lore.kernel.org/all/d30d2b5b-0034-47f0-8e93-9abde4dad118@oss.qualco=
mm.com/

---
Best regards,
Hangxiang
