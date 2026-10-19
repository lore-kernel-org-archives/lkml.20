Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEE4D48DB44
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 08:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792396878; cv=none; b=AtacdTxoyY742tFz/5/DdWsMJ4FrD9qP7E6vaT5X40Le2qn3ESa2/WhXI3EnTPkra3KYYeBUfJrBRPtf153vvoZWLiTXnNZTRqqrhFXeM4/XxGSlgcFVMPhIsooTJDFtGi1LZ6oiUaKyQ55qSqK2t7JfJ3mNdIyhl6xQsMRkoqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792396878; c=relaxed/simple;
	bh=BPXyO3y0fCOcGUibRvE2yPU+7/umQGRF5uEuiCIcu2k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PRz3HIMhw7xpA3j0H9IoII6n015g1lHLRR4ez2xYKM/FZjkI9Kj9jrGpY02zByyH32jsttopGztUum9FLtaPwEo9hi01PW+sHQuxivJihZB7ex4jWCrzvAiOTbzSXX1UBgy+pwF33L8jhGlLwvf3jmYk3CF6wCQC7w/CByie77c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bALPuXkp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JFI+8WGq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bALPuXkp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JFI+8WGq"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J7m1cX1267700
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 08:01:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5rz08knEGC2Y4thWaKvVInHnFRfmjnnaijNxijMZ8bA=; b=bALPuXkptDZRs+RO
	M6h4pDYan83si+mPJITP9ElBgQBERsnRO4JOfa2EDm58526e5BRmbdB0d75uXxw8
	NtSytNGKMgRrAuOG4v8E4ySVQ3uqfI2T7w3X0qxZpw4ay0DAQNd4GyBLLP00z95S
	BSZ4l+vM4WwrZx8QQUuIpty29EvjASLwfhoD2jyQ1vjLCeMK8IEm9czmbcUurFWq
	uLsxwCx3TkDc+R7b4HA3u8IdXc1CmgFrricr3M4HVAAB/2EcNIM0mskrO+iL4QR/
	RyJemayV43VupcqP93C9g5f+l944WabkRGB0zmK/erETPQRn7CIXbFiMdM3WVpe+
	zVt8HA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf4rg1e8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 08:01:16 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93c5ab5c136so311977785a.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 01:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792396875; x=1793001675; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5rz08knEGC2Y4thWaKvVInHnFRfmjnnaijNxijMZ8bA=;
        b=JFI+8WGqSzqOSgMBPzqYG9qZYldjKViH7Z7Roz2TuSj10ThVh9L0drikq7a6+vdPvd
         zQN0tEZm3T2INNMMF1IYXVdNqPg4l7XqXlIHyz2pnnWtTE0lK2WKQE28xJZ4H3ILYt50
         ME1F94T2Z93CDm20CNQ/RZ/SaYs1MPeHsjopYxNmlgE3nSDyGVvJ931yYGjYbz6WgRp9
         vcoh0je1ZOFH63HYl7h8ff705r1aJnXwoqZH0GD4NQLwUPUOMFPDCbTK/CVO3LyECizz
         qaXbXE5ZiNkeuiR5SiovB2Iy3N5JzDoCpe4ejx/XTiwdTeVNeMnHyUPcnT6JahwBAzbp
         xpAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792396875; x=1793001675;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5rz08knEGC2Y4thWaKvVInHnFRfmjnnaijNxijMZ8bA=;
        b=ZOGnWl+IDMhlvB81rznqwlJgmLlM8S5JPLvbqTMtpym+z0b75izHJsAY3EUm4vM7EB
         uNHURPUmHCPfqkf/ME5OvPtAzRiN1hyOFAINsIeDeO9g4YgLUsWV+iiHsIanPPSyh0Nj
         jm1RjrX7a3UTP0jwP+K8+xWtM0A/UlBkgKoaeATHa9AvfOpkO95xsjKDaEJFdANew5zt
         9bVuuqWtTSCTMKjCu0Z5yaBbAn7aC9IG0S1PmeeoFzDmQNiVyVqXGB3aPssYEMdD/RCZ
         MA7jCmrer+uFpTGTYQVxgL0ksk4FKAOLDF3/OxwhkkZ64k9fIro9/IecZFzHIUY2JHJ1
         Nm8g==
X-Forwarded-Encrypted: i=1; AKwUvBxDvn2Go1rs48Lz4hkfxz83IuDsA6udCszGpelh2CGCjrZGd1LQolICQQT4mLgPm8+GTl8v5fK4Qs03Q3c=@vger.kernel.org
X-Gm-Message-State: AFq9FYL6i7yy8lQnzANnKrhcuWgI0u8eXp5pb6ptEcFjEAgzm1StlRB3
	zxNM0keP2VQvR5nmxdFiRcQj3wQECnYF57yUPTtBjUEdGy6ZsdtcmJemwTXGIg7Cfj/mKqnVYC6
	jz0y7ARHAgy800xwZI0g9ghO8gAoB5HPFjh9nPamP0VvKE31V/SHciTkSu2VIiEhOq44=
X-Gm-Gg: AYBFou34nWePKj263PdxV5MrgVRI75IRRwbhH2Iax5VX29+Ui8lLb34mSh2NTTOw4C8
	71WgEfPgGpMzrjQE/td18ozqGkq1oZN+iN2ZZhE5zzSvJzcAgvloySMHa/ao1ML5lfDXbwqmLn6
	13rgyCqIRYS3hJo26idijhhiYEvFtxCzrEAmx15mWv+hQIZj5XxeO0g64T+FGvQfPaKoMZSGYiA
	3zjf+DqRLYmT/DlZFnlJ5pYe4zmsUHVRkD2TnCS99AxfG9zmFgzwNZYppAC0FVmCfqSxikiJaXT
	8/d50qvxAmWTfz6ajwmlchGlhNOgXlP82xDfF0mO524phEKPGC0X7RR3L3TrLa+0laBL5AYrAmJ
	mEzG35MWh83CTMdW5pLoIl62bZjM=
X-Received: by 2002:a05:620a:6410:b0:939:5cd5:e243 with SMTP id af79cd13be357-93f29b7e7c4mr1043125185a.6.1792396875050;
        Mon, 19 Oct 2026 01:01:15 -0700 (PDT)
X-Received: by 2002:a05:620a:6410:b0:939:5cd5:e243 with SMTP id af79cd13be357-93f29b7e7c4mr1043121485a.6.1792396874627;
        Mon, 19 Oct 2026 01:01:14 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1c8ddde4esm316809685e9.12.2026.10.19.01.01.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 01:01:13 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Mika Westerberg <westeri@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Abduvaliy Abdulazizov <abduvaliy.hbai@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-kernel@vger.kernel.org,
        Trijan Koju <trijankoju11@gmail.com>
Subject: Re: [PATCH] gpiolib: acpi: Ignore GPIO 11 interrupt on Acer Nitro 16S AI
Date: Mon, 19 Oct 2026 10:01:08 +0200
Message-ID: <179239686600.5748.7808377662325552771.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261007120944.1705014-1-abduvaliy.hbai@gmail.com>
References: <20261007120944.1705014-1-abduvaliy.hbai@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 9c2Xw5QEIGIj73lYuZjP1OXam4AIHdyP
X-Proofpoint-GUID: 9c2Xw5QEIGIj73lYuZjP1OXam4AIHdyP
X-Authority-Analysis: v=2.4 cv=H7NOUOYi c=1 sm=1 tr=0 ts=6ad5ce4c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=0zlfp5zRlkvtqwdKQXkA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDAzMSBTYWx0ZWRfX0Td2A2XTWunP
 AUoz9D7v9OJtphC/BMSWrCXJ0K+iCydtmjaMqJIQhZZO+Z2JiOxWFeXqlG9QbGz12MzZpqwaeRd
 WOUlHu+EDh0LpnTC7WiVrp9EwEuSA5Q0PgkrXwt6+8UNluhd6sVBq/4dCwUYf66gObf1s/S9XEl
 xn47LAEogRKrgfOB5EJt2mKa+jvmerEDSBHuADxVFqKUsVMOIDrj1XZ2viJWNx9VYE/75+WBSp7
 YAY59ZK6C+5i0VTihZMU5Epf63nbDAm90Hv3chj2ArFOucrMK9s8ncQYbw39oUaCKUuKIhYg1y9
 hY6qxVwKhl1Yo8JFFYlm/Oge3qF+D9rPAAiSY3+EXQc8D1eYbk4Tk52bG2KqhgiKHc9aE4BdOqZ
 E1Fhz75zEDWSmPaDFQcC5SM6gYv74R4fQHxaMUZLo81N/WTuh/45du2J+Z64NojVnJLWtoPmCyy
 z+A3SnMQdMSAJD2Ofbg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDAzMSBTYWx0ZWRfX64A46YAhKOzh
 GkrEMfJD6KBXeb/BQlBSt5Zu2bIJE3mA/wF69/LpV0lTk05b1XhL6K6kgXLGImw6QklRqAJUVe0
 7rctpWD68s2CZbO8BMW5sXJGdk0eLwU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 spamscore=0 bulkscore=0 adultscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610190031


On Wed, 07 Oct 2026 17:09:44 +0500, Abduvaliy Abdulazizov wrote:
> The Acer Nitro 16S AI (AN16S-61) has the same problem as the Acer Nitro
> V 16S AI: the firmware powers the internal USB camera (0408:4059)
> through GPIO 11 of AMDI0030, but also lists that pin in _AEI. Requesting
> it as an input cuts the power, so the camera never enumerates. On this
> model the same rail also powers the internal microphones, so they do
> not work either.
> 
> [...]

Applied, thanks!

[1/1] gpiolib: acpi: Ignore GPIO 11 interrupt on Acer Nitro 16S AI
      https://git.kernel.org/brgl/c/5a088d1b7266249e7701a94fc90fc829d1ad5ba1

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
