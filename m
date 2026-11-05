Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793902942;
	b=bWSqAZ2kfoj89qyCTNLQD08ZxNg2qFTppGZO3cNIVyde9I0QXaAtYjhCwP/IKyVR47Jq
	 VXaNSzh3cWp1ZGGY7hcveNX3L2rfN907Q3MxzF3K9yzI8v2/c79ESd4LdUwCWDrZ950zP
	 svVDOzPsFRKFNa3aDcLbHsaQUmVmYyDFolvO1kkhEX1A/QxsCCtvdJfOQbvxkkgxDoJ6x
	 3zGtUBmoEzCIBGJaP7k9ex0uFK5tME7mpMdLI7K+GmT6NL03HXtpTBzyjciej3W61kpUs
	 cG7dgXJsmKiGHtahYLjXQMGKT/ZkdHmWVS83EWPFsJt5mvcnVvwx9eDhATulg9ItuqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793902942;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=YHJMEIRh83r7RL3if+qhlEXqyFZGQxnKFEkhzXkGzVg=;
	b=ZqOfLq/WEtXhDghluLHzj7YtIfw8C2/FyxuxZGv+cNL5uUp2Ft1I576Aw1+iz3i6D93v
	 r1H1ngtklCvyA5AZGjPy3f81cz44MYhsmTyEm99s2vxsgWA6EQL4T39SVaIE5/QYNI17D
	 JxCsw8PHsjCtZdn52NN9JoQkBRFw3cegVliu2RtvYGPpRIkMtqRllxo1IYM9k+kK6x7Od
	 qzZUiC1YRTUmjDxnyFH17J4f1kj3OSyZxJlEuER+l2OGZu3sgoYCwo7ayIko/ohRG3rju
	 GfYk4ZPNDWSekmIPnBMZJyFy36NHwlRq2LK2T5aVn4B1BP1ICdGE6V3rZ/POEj2EwMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=temperror header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=C5A2fBWE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VKuZEg2n;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DAE1606A326
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 18:22:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9DAE1606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=C5A2fBWE;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VKuZEg2n
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5HePBu924205
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 18:22:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YHJMEIRh83r7RL3if+qhlEXqyFZGQxnKFEkhzXkGzVg=; b=C5A2fBWEz+nOeUUa
	yXR1tZzfSVPkA0Ok9Lm5hjlni/66tbBOIlfMQIMhBScbceYCpVWRkuFOHowAIafc
	Ccx+/9veRF4CPl/hJzwm0Lx9ZpxeuLkhzjxtPU23Btr2S4LR+IwYxYdt1mo9Ja/2
	4AK4ZqgT0XzEVGq+cc4BN++k3NHnL5PoVHscghV44poXqP8+wmFjQ4aG3RmxTobI
	wJs276tvSzxgpo29lT86qIUBB52NYLlju/ywUQ42ZutoBkXCm8I57/uJfVJ6YYq1
	8WmgM2R9y3X88jvHNCkFj3OPdTpB+aoRB1GMBTpBAxmiKziBsvCL/tZx40864F6V
	efd17A==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrqhkt747-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 18:22:19 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso3843209eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 10:22:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793902939; x=1794507739; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YHJMEIRh83r7RL3if+qhlEXqyFZGQxnKFEkhzXkGzVg=;
        b=VKuZEg2neCzaL8hArZuAdDn2OVNiISnxjcCjubCYh7sFmtCczctw0uNQSol0U6SQbG
         mzbKny2pzbSUbT+pYNl5O2cPXu0s4er6EIGFE9bywF//L/VCEdr5WBArVFs8CGzc4LBN
         2pzxlWzw8oJEhwT6i0SfaE6u05NEMVk4XEEzTLCwv0ldlef8VmX0O7z7rFiuSNsbmIr2
         s5WOt4NzI2T0aptvlevG28+VohhftI50eLPMMNXhk7BIuGjQ6DMajG5k0krFfvfdtg3/
         CDZVx6OGlz4JjetC47suthxYyj6YvrEs4LY9bbczeHoYreGeuop0/vNVsQQWBl+ATwzQ
         cxrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793902939; x=1794507739;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YHJMEIRh83r7RL3if+qhlEXqyFZGQxnKFEkhzXkGzVg=;
        b=rTXfAHAmpSuFmVV/LbL3s/VcsUFBbRVMuBD/t5Q9/ik+e1FRQeyRm3RZ/6TlYZLZPq
         KWmBm1Qd7epliFtQXKa/nOqfldYKXAOQkB1Em2934l8/YcWPh+H7L5gIu0YAdg63MLp+
         1dixjW2WIcWP6tUEDrmdr6f+vcVi1WViljH4nHl58wtDFjc0bok06j43dBgdOZ7JPNh9
         K+o7WykiByGGFQXIPKkuS9P5XygK8wtCcIOjtcKGCgwIIcmTttg+rHrpfREdTLykCLuS
         MV958R/DthT53TN5TMuieMh+mDPF+tj+/29gUqw4B7DRL+ts50/aR16aTF53zV/+7ZXV
         eE8g==
X-Forwarded-Encrypted: i=1; AKwUvBwkdv3PLy8Lz2F+ADP1RuYTVALOD7gh9GAs1S0YZ6VsOdjOO0rx11r/6RuaFOb94brmhosuMbuZiCNvRFc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+4kdAfxb/ulvMNG1SK0k5fPvOwBOapsJAuT25sXBrMAzyVhfc/
	+qjxbaeQDkPJGyJulFO67yRq1EL0LSbvGG6YbEyrlmwcYGn6KU1pl8QDrZT3hJgLBTb/hFG90lF
	ofx6wx+9xJnMJCPu4/w2knBoqk9fCpnf5eb3T51vLk4/wu8Rjs9tNm3raIl1+rTtLGA==
X-Gm-Gg: AYBFou2uVpj7+T0mrlc38czV5GOr3gAFQ/LwOXC95n75QWdNT+7eeDndrimM1LsI+zv
	+UE++nxCdgNhFhpDCbq7RjRvVHdUQa2AhauZmopV+mmI5k8XM2hK3okihPVh866/pQFsaPZXutD
	BDJpL1YwmYupREr27+cD0VqmDl1hSNHkm+GXzeLQELuKpM6FdAkiWtg6d18OT36i1/F0W4+IFeU
	m0KxkVcganUchAUE8mR6NekPz3JvWoT/eQFkJW82r8u1dFIn3+rqnjwGtLBOW1i6T9qdlSQMNg1
	zjxSmzi7iDaWDZLr95ucyhbGWoB6WX5VxxTKhk2IAU3XGSaL646hkRybV3iiXP+Gft2INQ8+KKF
	i9krv/F2qsy/FZABQTeGJXwIkMXSdA8Ssbg0ZIPZq826adEZNtjkPlR2TO2e+YhN5AIZ5mkQHjf
	yyuw==
X-Received: by 2002:a05:693c:87cd:10b0:36c:a084:30a4 with SMTP id 5a478bee46e88-36ca084365cmr10656622eec.21.1793902939035;
        Thu, 05 Nov 2026 10:22:19 -0800 (PST)
X-Received: by 2002:a05:693c:87cd:10b0:36c:a084:30a4 with SMTP id 5a478bee46e88-36ca084365cmr10656556eec.21.1793902938276;
        Thu, 05 Nov 2026 10:22:18 -0800 (PST)
Received: from [192.168.1.11] ([183.83.138.70])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36f66086a4asm210818eec.0.2026.11.05.10.22.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 10:22:17 -0800 (PST)
Message-ID: <85e8effa-dc1d-441e-a721-e4078388c9ef@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 23:52:07 +0530
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
Subject: Re: [PATCH v17 0/6] power: reset: Introduce the Power State Change
 Reasons Recording (PSCRR) framework
To: Sebastian Reichel <sre@kernel.org>, Benson Leung <bleung@chromium.org>,
        Tzung-Bi Shih <tzungbi@kernel.org>,
        Guenter Roeck <groeck@chromium.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Matti Vaittinen <mazziesaccount@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Oleksij Rempel <o.rempel@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
        avaneesh.dwivedi@oss.qualcomm.com,
        Umang Chheda <umang.chheda@oss.qualcomm.com>,
        Ulf Hansson <ulfh@kernel.org>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Bradley Morgan <brads@mainlining.org>,
        kernel test robot <lkp@intel.com>,
        Francesco Valla <francesco@valla.it>
References: <20261019-pscrr-framework-v17-0-69ea6cdf4731@oss.qualcomm.com>
Content-Language: en-US
From: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
In-Reply-To: <20261019-pscrr-framework-v17-0-69ea6cdf4731@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA3MyBTYWx0ZWRfX6KHMg2gXqHIN
 VbEI3abYk5TIie1Kb4sssf6EUu/Uye9DMo9yj2rK4VjMHdkNgs6DwJZRgNv5vdLZ+WorLYLJeyK
 7eIl/5lCWdufHwOEQ65DSEPYpGZXNBVZA+aaDC25vEn89WwPr9Uz/7Hfh5V4lVjde9zecD6IrRV
 U7LdLIUMkQOjeBNpfxEUMMdBN8lU2XlW8Zyh/h0dPfC3oZsCpixXhMIbgB0x5ujGi0p0eII930C
 0NUVj8IMG7q4R3pv9nhHYzeArKeWsOl/H63lak8EfuER55VX9F/nNVpFfiE3TfEc4Q0smU4O5k6
 NdFB/ZeZezbVDOLhOe8rGfzaQ/ntIunk1e4Hb9wiAsOxAEgizZ4yRld2Pu1T9JCyyjam6b40jj0
 oGb4rRpMrjD/7dNj6Y8tOaEWP/132qP7VH49eSf6SJ7gXVipkYXKUkukRnglpVb1ekAxpYuNAce
 j+Yl414O30hSBxkH7WA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA3MyBTYWx0ZWRfX+s23xeD3H5VR
 q+6lGhqh6SxUFQ/S5DwOuVj3w5ea6cTmFQLrlg8EGeqlNEw1Fr7qxwkWswLM31pHIacczJDJNY/
 06rNgxkZv47YV1/7JVKnOxuVFNKbmBo=
X-Proofpoint-ORIG-GUID: FnQrLVu5byl_PkFATQLGFjSYV_Y-5RZW
X-Authority-Analysis: v=2.4 cv=a4+lZkSF c=1 sm=1 tr=0 ts=6aecc95b cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Ns+0gdUR07JhZB4Cb4qmrw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=8mBobP89YcDz70HNg1MA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: FnQrLVu5byl_PkFATQLGFjSYV_Y-5RZW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 spamscore=0 suspectscore=0 adultscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050073

Hi everyone,

I believe I took into account all the comments and got the 
different reviewed-by tags from the different maintainers for the 
changes touching the files out of the scope of the 'reset' area. 
Is it possible to consider this series for merging ?

Thanks,
Faruque Ansari
