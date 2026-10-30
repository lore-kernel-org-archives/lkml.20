Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793352740;
	b=YCVrlP1d/X4/FrNE27GEwuO2lqAogqhE9eql7cfxX2RQA4ulejTOtAiXWrIF5AxGYQXd
	 OsFxuGjRjE9bMI/JqV6R0rJwmbePaATM/MgpCdVO34v/kBMyf2C/f4zqYK+bnsVhFKvZy
	 mw0vD9at5D+3F4sroRrQ1mwEysfgoFqLAXsur41V76xVcEJgCXWyZ1rDOzgzGtJgu8UGn
	 M0xMyDFyLuZvHpe58pYjhSWxTgeleKPN36pdTB2cQOnsJnEc31Jj4Ep3r4dPQ4UlaNgkL
	 x5FUVWPbGB/sj9p5qpmpemwh41d8YYY46qvWIAAw6ibPAVztfJf3CeUkjEi35ifOHpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793352740;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=vglUYMqRsBfRkgFk2PnznDRUjloE9O9KIkcFHk2fc3c=;
	b=hC5gGDpSGF93rJmw8NUv+4M9aeocbbGDsHCzTGTptI7LmA8I8oZlBV7CjFYD6Q4SBmkN
	 C6nZIsfS+TMJI8YpPcmaxUhePmapiPIt0ZIM/cv4+7e6LkA9lEXj7mf52VCeTwACPa1zy
	 4PnEbygSinf/D2f6B5NmGDFOMnO5gNOg3zEzLfUYUTmFK+xMfo0f/KjZDGs3kjFGBaGpW
	 +31yjSnPC/KxNlKdLUHgY2PyNSVoNs/9NEDzV0a1G9nsAaK/7sUbsrVy3jJbtAE6opw/n
	 pjl2Mu6uxhfa4DoldVfhmIIiy7Ye460KUH7zLZ8H2E91K5ykGfJtAOtDwJ8uef+ehrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FLoxoJQn;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="kXc/cDkO";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAF18606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 09:32:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BAF18606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FLoxoJQn;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kXc/cDkO
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U8FIq62374410
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 09:32:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vglUYMqRsBfRkgFk2PnznDRUjloE9O9KIkcFHk2fc3c=; b=FLoxoJQn7kxkMHJy
	OUE+6G5KiudaIUeA6hPjgKAbndLuYMHO8oFKkpxZOQcHkLgx4esZH8dyG3Atx4C5
	a3J2p0onqxWv5f7lxHCQbvhp+BgIAX8/GSUVHnfPRvD/TNqaXZqy/apbcBwfW16f
	+Yd5kCdAWR2sU9USQAqsoiQ8h0/ZEn33s9EtBTmUwINtMpRgJYRsUE1FQCz6KIt3
	x99YGFA8oEgYIqfxvTQuMEtFD2bR/RFsG1oXQb//mDcZisnqOU3Rr2uL0ZgZIAUT
	GSb4CLCiZgJvbURNFGQACqat2Qiw4fMRhCE8iRgPBipprGVlRIu1uo04yfxaVpxW
	vki17A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qj84m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 09:32:18 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cbf2fd504so76064085a.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 02:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793352738; x=1793957538; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vglUYMqRsBfRkgFk2PnznDRUjloE9O9KIkcFHk2fc3c=;
        b=kXc/cDkOJOgAmi4YTeN4hM3TSgUOA1AVCwI6nsEBqA9TD73CzwHOaP0bWgY081ZLzO
         ZdLTQFA40oY1Dg4es9mO9IBYmtt5LIOTPOFHyPNEUb1FAZP2DpuMk/pk2SedBvK6O35o
         IyJ7qJuXUtCE5KOsmDh+tl7Ef1Yjp86dke2BhpKmUCXY912n21NbtiYK63FVV2PNuuCU
         bXybNsn2HlOI/M6C53CofZ9dfkxGYVGQJFhBH5rFhDHT2cLHlpaWKhuskbalUHjuc6GY
         EixfyCbQyGAG8otlluSk6bC+wg9CsPgZiUwoqhIFaIhiA3RqPEBn/z2nQ27noNkBdPEg
         hfAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793352738; x=1793957538;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vglUYMqRsBfRkgFk2PnznDRUjloE9O9KIkcFHk2fc3c=;
        b=QnEIfhWaELpRrVXzHvJcFnhME4Pjo8c1jmV0gtZhKwHUNkSY0BQm64Od+v8obVISx7
         rhfsXC6rYD0jLfYyLqX6GR5jzJoMmyg/NYe0XF56OhDwCyLYzCLcRtXl2GeKb2R2hVx1
         rsNEAPShenmUJlLT6lufFPG80i+hTeOwaVj7TwalYnvgmhyTPpDbWxYXkhq5f0snqEHM
         J0E92GjTzgTM0OckMXuCr89rn6owG8Sl8iXtmGvkH3qvNkJ/OUOkLq5YDs+CXlmfTA+z
         /Ooq1r9q2AhVm/EDHJyEkzJgwwyurOJ4YjpsJCLUjpH66aBRfG0ch5v08Q4iFeGwEKV+
         htYg==
X-Forwarded-Encrypted: i=1; AKwUvByu/TFhvahcZ4nS+G7kzB6m4PWXQtTdpFuqliuad5NkNBVme6mjc3oPncsrLkRwUUE6KP9HTm/D1K8AB6w=@vger.kernel.org
X-Gm-Message-State: AFq9FYIl7LwyLz0kki66Bb8dRTnjWeVU8AM81S0MGQFe1OBcZT2LM2lF
	29OdkLJhjdUi8HSssuoM4859WAwueH0u2q0JExi6R8mu+7DsPXuNZBaHJ1ToQaIljzGtdMV03CE
	ef4QfXqtMZVE4sdVSkjU/SgxC3rSB/QblXPmG8EacxrhQzttLlFDr6HAe0ou4ldB5kJA=
X-Gm-Gg: AYBFou2aOXZ0TElGJi9bL1UXUOwOdreXiO2KAUWLljF6n1AJf/ISNrJ6d8y/xYtYv13
	YDVkNgIYHgmjXQfjqCsz80XWUPBiI6nUQ+/xUXRY4oOhEe3OVNbFVlNYROZdN8NNvcUHkSeCflw
	EPFr3rAUyU6rUfxFqOpmSja4aWpHH5pB4OCXP/3cU8P+BCBvEqA2WvQMQnj6vtZ56sBfEXHphuK
	W5uwM1jeCYCIk3jY9J1sca6JkvGiU5+1g18Hr4fs9O7OwyA4aUvJ0tyJ0aH17S+Vw5EgBX5aOsJ
	r/ndniWePs0/s6dMdUs/GUNw1nQWEi+/s7NNsC/UFICNIukxJuQGSUl1BEuClfysQhSYFSbTyHW
	5PJLaqlNeKcujA+GQP0tN90rys6hogQS9cuqPICJ97YtAb5uqoU7ZgWOwFTYt44kcXnnFo4O3N2
	Jb
X-Received: by 2002:a05:620a:19a5:b0:940:f224:5a85 with SMTP id af79cd13be357-944217ea7f2mr281323785a.71.1793352737962;
        Fri, 30 Oct 2026 02:32:17 -0700 (PDT)
X-Received: by 2002:a05:620a:19a5:b0:940:f224:5a85 with SMTP id af79cd13be357-944217ea7f2mr281320485a.71.1793352737488;
        Fri, 30 Oct 2026 02:32:17 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf0b36853sm43532305e9.0.2026.10.30.02.32.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 02:32:16 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Avi Weiss <thnkslprpt@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Linus Walleij <linusw@kernel.org>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Kevin Hilman <khilman@kernel.org>, linux-gpio@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: omap: Propagate runtime PM failures in probe and request
Date: Fri, 30 Oct 2026 10:32:14 +0100
Message-ID: <179335272848.12642.3929434225128874772.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261029103626.1527919-2-thnkslprpt@gmail.com>
References: <20261029103626.1527919-2-thnkslprpt@gmail.com>
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
X-Authority-Analysis: v=2.4 cv=KsrYSmWN c=1 sm=1 tr=0 ts=6ae46422 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=nNi_UgyaDUgUb-MLmQ0A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: MXfu0C81BqCuRjSj8Ro_9GSemjJapCwB
X-Proofpoint-GUID: MXfu0C81BqCuRjSj8Ro_9GSemjJapCwB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAzNyBTYWx0ZWRfX/dbJ6/WBoySk
 S7LX3PhMqKKI4c7bJeiViAXn3R7AXoGlNvyB2zTz6biuK15PuFY3lb2IhJHEj/zdu3SIgnptAiy
 906o5xAjxbMAZiFpbGkFUCdJK2JLcktsqMcCJhB3A30lLJXJbhbMsfLO3goHxssqdXbgr8f+QYD
 xEsvs4E+/wKtGzTxQmHA03pCCMnS6pGzGxqo1PMGwiEsB+ChsDda5PTzKtvUwpeLDnx4LE2Lf7G
 i5AHNJYHPZervyGbrRNmki6d9tTX+1rlwuyjfmN5/n+buoHa2sKZrssHzftaSa0nxV+vnavzzkm
 599oMeMkz7MudBsLuVc81uNQ6xpA3yZsNawsT0bMVGe2W4iqFWNRSbhojq6bwqCww+uQOH/1ZUU
 9AEo2CTsl+exT7WEvlK2CcGcA9E6EuGYUY8WSuInpsnmyWdR8oOT+PpzBJ1UAcnQ9YN02BEE4qF
 QPwysnhLzdFPt3IXrrA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAzNyBTYWx0ZWRfX5bA7OsNkzSZJ
 TsAYyE8grI+L4l6MePtkZKq0lbfj/M90kt2NcJeYS83bESdwxErJlAZIECUP9IAMLjYxYg+r1L5
 RiMp7AhNjiRRSMIjpF4xt0A7MQxAseE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300037


On Thu, 29 Oct 2026 12:36:26 +0200, Avi Weiss wrote:
> pm_runtime_get_sync() can fail when the OMAP PM domain cannot
> resume a GPIO controller, but omap_gpio_probe() and
> omap_gpio_request() ignore its return value.
> 
> Consequently, probe can register a GPIO controller despite a failed
> resume, while a GPIO request can report success and modify GPIO
> state even though runtime-PM acquisition failed.
> 
> [...]

Applied, thanks!

[1/1] gpio: omap: Propagate runtime PM failures in probe and request
      https://git.kernel.org/brgl/c/05be1a99d6d68b24cbe24a191e1af67c70193ac3

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
