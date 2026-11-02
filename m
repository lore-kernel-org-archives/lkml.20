Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793604244;
	b=kiHaJ95UaRcq3zwbRiENAjVGMuTDoQgIOCMifHy1X6kuvxoXajcu1I0kzQBKCYP2nZq0
	 7zaY4S/+uZd8YINP5yabbgPS6Whrhikgi4G4MNBaoIo42w9J2E7S/BSEf+OewFCuT1wTG
	 72sM9bh9DAwotxu0jInE82K5brNo8pbZSbEQxYn5X/coyJQkbwO7yEiOXmlLYJF+WkMgU
	 hXZ7KfIsZ2l1akYX4iiFcxUzrSGWFLa9PcNkVA2Lza3LYHaX8JmD8V1eNt+FPsKbqGaSL
	 7Kd8qNVSIrcir4rlvK+9OWzY4uydSc7fLoLZ3Ap50pGjNLlE5H20RoKyoZkWMlsgRWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793604244;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=E1wMT+/ccKcF5sYLZnsI1jaWTQsigD5t+XChwFqJkLg=;
	b=1W4nquWQ3eLRalBLuDRFr2cMxOf8BfCnBF6Bp5esyoq8o5GXm8/oproDlto4MdeWskDU
	 +xQejbKao5d8oQadeH96MKWEHtfmoQ/xC7LQ2u3UqMBaGzaQawn1mF2Lw4Vn1LYh0MG4M
	 eaRdDjY1fmeTKv6sLFMb9j9E07CALVXpOcKgvK4bB2ksLyUfVFdFx34dRfSiKTlQbe2KD
	 VcEaPXcQ9xp+F0aGWHbo/2Sh8gyZc3HfqvUuShkT7/yQJeX1oshx29crIEGpLgVypz7G8
	 bfhpYRkUDa+NiUKzZOJNPD6IVDPK1pJ3skmHiE1Zq3+xfoTqDx6KIiIJ5huf2ITQRXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nnKj8gyD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iVy1qdG3;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B77D6606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 07:24:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B77D6606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nnKj8gyD;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iVy1qdG3
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A24CdIv1811587
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 07:24:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E1wMT+/ccKcF5sYLZnsI1jaWTQsigD5t+XChwFqJkLg=; b=nnKj8gyDjIMqMZhg
	Zps7qYWTR0bBKOMv6zZJo0Eu396pDcc9Bu08rQNbvKXfShVl08suoOu2ZHNxTyvg
	oDyczpkUwDGPm0rEjTk+QhcCsg9uoOlmEZ6zRu+oAGyKyF4uUeJakt5ExPSbzink
	DR7My4eZjIkfXjkfPh1gLWHJgIqJs17ZG/zrqKwI5z7hlVckbqGkXPnkNFrz2tmG
	7lOThCFqboVfbVZEndjz/xh5RhVIJ3+sd4auujgbJgIuNXLqPwMKQkKda36FuvIj
	EyFRv0vqSumHR8WnnRcPWIWMv2h8QHPZQAKkPcaj+7s3Ae1MTYEvH3z+3HMjf8oC
	/8eTHg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpk9rgjtb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 07:24:02 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ada8bc8575so6080567a91.3
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 23:24:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793604242; x=1794209042; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E1wMT+/ccKcF5sYLZnsI1jaWTQsigD5t+XChwFqJkLg=;
        b=iVy1qdG3hBQXMFSEdCjUXwwNL2pep8OtxPQOzV60l7gJ2pfyhdI93BR8gkOCGFXLcK
         B8JyXuzCyAYjBctYp48j7Q4/+k0o792wrjdhUcIwJ/BZ4BK09DYrUI2+zkXgOBCsAqef
         7XrjVpCIufqZi+gjYacRD3LGOLEW6DpmUdILgQ6TxzMsdmbbmDO1Rjn+b+w7vEPdu/n6
         3SKFdhdh0EWvYCAVws5cm+rXLRFC3yx399vtjHWy3UUZPPl/kOmtKANAF44ljF10+1UD
         ZZEO2ngx27bHsgv9lYEXAayp4ilYxE9cZFe8U+sRc0UaACfkrsoKJpnmMG20+NoBv8bO
         j6pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793604242; x=1794209042;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E1wMT+/ccKcF5sYLZnsI1jaWTQsigD5t+XChwFqJkLg=;
        b=DDFDpt7zFLpuBH3bagEFh9UlXsSTwmYuVpfAQZRrbLYGVnZ+Ak//ZKeMwzBelVh2fI
         j+yB+p0ttolbnAPGKiDrRvuuypn8dtyOHiZtgc0xRkdLlD+eeA80lLDYZElxk7PJkeI+
         DXZHWR4MaEoVeqqS0Y+T1HkXBQHbW27P4ml1hD0TYVlZ7vnA/7dtGCQp8agMty9RDANW
         kL3zpSbkQFY7CeNjszBW0YZReGSZaRtrXfYBpZQrCQgA7X4co9hqdeyZON5tRDFJWSOe
         VoAFQQIeZAxM/lGfs5YOFY4001xmnihiX/1xl4mOCp3y6tIrWoENz/ZCPlvyq7vo8HuN
         sVqA==
X-Forwarded-Encrypted: i=1; AKwUvBwHsNyvtcMpDih9+86tPNo3Mp1jNQdvE4CV3TAZrMa5GlcnCRMOkNR2eqUjOco5ObMu23ZhdiN1bdxHfDg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ksgqVmL+S/7RX7hOKsjdM7GKmtAvl1j/0b2C30F4yZTJvmXt+
	jRuwGLbRYqXPfSE/fj3n7Eg+tf8HZeEvLzx4H4mekLFUcs+u+55Dsft/2P0vr31kz2U/7GfNH03
	xM0hkIWeKcIr5F14Vvw/Ua8OPbcLBGLJ0Yr5k8scIyhhJjQfwIF86Z4e29X75Tb4L/w==
X-Gm-Gg: AYBFou3dRGIfkZgXICGgir6N6KlGSvetWs8SMpKUyqzNjcUs29Kg9EbgXKLLmaCb0Dz
	qCxHX2QF/lojRD74m27nemyJHiD3arDnnL0UUVOK0suBjHv+w/+HZtXrgCO3npzf5k/ovyFmfqD
	UacIpru+PtXGa2E4fe5WAG6C8dpT7KURepPhwvJB5fLCKMbyACsHbDDv9GjyfO76B6XFQEQNbO5
	QFsd+HtVUFITh7bZSgtcC8LoaDveIneUURETJlhG7B5dS8VVmWzyy23Tj+2FmWRw+/+YunsrzSx
	uEh0aMJyQZ0wt8ARJVx34fA95aRVEKN2z0xMIOQ5QjLGNhXpbwsJIzQY+Feh0hRlDc/8sJZ8j88
	tX/w8UXKorMvsd4q37HRw6vjsk3SZDXoY3RA9WF6MFV0bOeF0MDduirF7dRB5TmE/sOtyJkXI0M
	gL/g==
X-Received: by 2002:a17:90b:1f92:b0:3ad:6090:a183 with SMTP id 98e67ed59e1d1-3ae897c8014mr7947713a91.16.1793604242183;
        Sun, 01 Nov 2026 23:24:02 -0800 (PST)
X-Received: by 2002:a17:90b:1f92:b0:3ad:6090:a183 with SMTP id 98e67ed59e1d1-3ae897c8014mr7947678a91.16.1793604241625;
        Sun, 01 Nov 2026 23:24:01 -0800 (PST)
Received: from [10.218.33.235] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3aebc8942e0sm4048361a91.7.2026.11.01.23.23.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Nov 2026 23:24:01 -0800 (PST)
Message-ID: <310fd443-4cbc-4dcc-884f-6cd23d5f9c10@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 12:53:52 +0530
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
X-Proofpoint-ORIG-GUID: U0M3Hchd2mhe_oHGXi43QnJ4b9dF1UDJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAyOSBTYWx0ZWRfXz1i9SPLbDvn7
 92tNV4vTsN6HWeZVSOomKU7HYCr5/8ZeDjc61FMwxIlyjX/cFfuq2CdAE0a9COzTfYfAwHq6XkR
 fzJOWwrL0zRHWsfhcnqBruy6/ZSOwI0gpHNXZd0ucqvHvsaaOCZvmdYx/uEPqWw6XIxX5T1b4Jz
 Wqd8oV0eE6kD33/RU6fcSJHeeIKYnUREkcJmLxOuLi2MWjX/iRz9NMqrr68km5sbo2X5SjwGrVk
 yBYrVusfE+YsRyh/4toP/Vsyln1yyOPam8CFk9BEPJaz6yO6GXGv8AsMTeNbyccEbCRFxXY3Qst
 yVEUTKPQcAmtKNiM25iGRTbzPT4dqFSVp8n7EK2T7Co9FfUiM7vsHlacc9AYm8OZEIJK6IMY9p1
 qvP48X+JhDh3qnWDoKXzDCpKJS6Zsp4gDbFiuEBXtjjfv09BWJCle0cfcAGXRaI4c4pBxbVhSar
 j8ofpp7dXCKxH1HdbYA==
X-Proofpoint-GUID: U0M3Hchd2mhe_oHGXi43QnJ4b9dF1UDJ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAyOSBTYWx0ZWRfX04ev9pHDgvn9
 1XwHZgFY8/ITgDnUy/EAYJA28iltYV+EL9v5tgfjoBV2QXD4g2vPU6ZLNnP+4JJuwPDPd5UAZjM
 zpiwkoiCiqyRUq1mDck/Y79yi/s3Ao0=
X-Authority-Analysis: v=2.4 cv=LvwHWXdc c=1 sm=1 tr=0 ts=6ae83a92 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=ftlb9jb6QNwlQdeFhJ8A:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020029

Hi Sebastian,

Gentle ping on this series. I've addressed all the comments 
raised till v16, and there are no outstanding concerns on v17 
from any maintainer --Matti, Daniel, and Bradley have reviewed 
with Reviewed-by tags, and you already gave one on patch 1.

Please let me know your thoughts, or if there's anything you'd 
like me to revise.

Thanks,
Faruque Ansari
