Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E540251992F
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 12:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792065948; cv=none; b=mg83pq9dDoQ4cad2ZSRGKUBmf73WXqj+pYGDlwCuqH5LPYIcTSqFcCsdHcF7wQNyOY5vzbAOP67K03yLqa2SZizw0zTiAwh6ZwggUuBW8SY+RdYIfksh6QgUwtkvKbIr1JHTu/MLqJj8hK1tjmACdCzxR0Ssb/c+7s7CfoeEVyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792065948; c=relaxed/simple;
	bh=UhZCuoHKFO6/SHXSdGSbs8xir+tWBEiWJP10u6bQKFs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jln4Mw8OSpZqcnN6hAdGEdqWRC4eYn+UQhBlWEAmkkcwQlBkPzearvlBrSpnZONea39CXfn8UpdbCZGyL6EEhyGUzLoJR3VdEc0AqhdUcyJOXK+PBByrzXEzRIvy5GU7CK6RgJzK8t2/1GXhITI7ntlnQ0vIDzOEOTW1cq1S32g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WvskOuUE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OWjPq7HA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WvskOuUE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OWjPq7HA"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9kRJj2999386
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 12:05:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KzcOvSYw/FR/TDxWZ4dIhK8GaOtoPrY+YGX0tlJ1XO4=; b=WvskOuUE004BD3dr
	8gQIVyJQBCklqtnijUax42Qed2ZyY98UuMcjanIASH4x4u04lDc2F0csXU5xZOfU
	cfdRkD/hw0Eypn3Vc5iXrvQGBqL1EihcdnGQegDy5tfHwcU/aY7WehikMQzyEOSu
	dfJMHE/O9mDz4CRI0omUWumREd78ytIOFC+xJjsbulbDE/yUX1+MWLp9CXOkGPj7
	g8se4UPuyC0AyADBpcUqN2TJpTq/9wfVpNx6ctZ5nz1K53dSBqdFaqtwAJhDzvfK
	s+HaFs5ysj7tfGNtioI96zq7F1v2oCIhjTOH757Z/Fgz3+k5G7qz7TTqHUFmF0nZ
	+2ChQA==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hausm0tnj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 12:05:45 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-98a9c848bf0so396090241.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 05:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792065944; x=1792670744; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KzcOvSYw/FR/TDxWZ4dIhK8GaOtoPrY+YGX0tlJ1XO4=;
        b=OWjPq7HAULHL5V1fhnwsY4ItZ2L5OLFFgY3wRgMRqcXngGtQGX8+FehkTcx9QKLcHC
         O4v6RTrtcNS48QHpmPucte8yiCdkIpd6p/fvQcVLlOeWP2fPJRjI1Gl9sOtuCXzFcTsD
         skGjthOw+V0AYz15/Rln7DPSNHkNlPn5f6bYCrjkpBqixMjMs+dbJMCQMZOgPXkQaFAv
         oFovv0+a1yEzO8DADeV0NBBV5J/f49iZ9mYbSXDsyzZvmSHcbHJiNoZiGufuoK0Xkw4U
         JdloCqWz45TOt4Vw8RE/DPt9Sg2PzyykWOzO3ulyJqVGv3Kuz9FFHtTWr/uWh0Y2OUUZ
         XqUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792065944; x=1792670744;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KzcOvSYw/FR/TDxWZ4dIhK8GaOtoPrY+YGX0tlJ1XO4=;
        b=i2NlT5DJGU8TbNuqpbhbzCs7ERSNdGNQ0O2XUH7UNV9kn4ywE7/Rnn2KssnSVURZTk
         VPtnN7utOcQ3CBCkRqq4g6H9ub1ifGQ9bvfMhCfKHkOkMSXQgjzcVwLBpTUbUEfRatjO
         j/y/Xfz5HbaelrMm4FaV4YcQsLbQSVcIVmCPY4g1SIjd8ok1cL5K874+Vqo4P3HESH0P
         ZXuKz/z4mGpUhB7DDhEjhcf/YuqVewYHC5SiTCybApLg31NnR4ZLKRiy+C2S+hfEHK4T
         tupTBDoTPlekyC127mnyDKLimY4ceDCIC3k20Qss78DVuZP6b/Xz6KKyjXx+CyXH2/ZW
         bOsQ==
X-Forwarded-Encrypted: i=1; AKwUvBx1RsnMH3izSBcIBXSi7o0Dcp8NhNauG43g4OCp2YZaRed9aPpt/zKjfBcdeWXQIx0c8IVVdQyKW6Inxso=@vger.kernel.org
X-Gm-Message-State: AFq9FYLf+y5fE6HE3yJ+vchLKcZZtAJVC8cBinm+jdmtlS0mbAVd/H4G
	rlwvvPIVYdFLr5gFCzK8639LOAmlHpHqIthXrl73aZMpLBjYi23RWe+p0wpc/amFs8Ym/LP5oJK
	mF0zMxAx0JxtyT4Qa0ImJlnWggVFSjd8wbNT7sNBkg9QuqgqAWEahKGwkJLUqVNJ+frI=
X-Gm-Gg: AYBFou0IWOTKdttcObWFF7oySDwNW8jpZhyClm3+ETqo4CVkak+pHoOHoLIMa7YRljy
	8v4/LhuDqVIRf0YohcKDtkc+jnjAb/QYajm4mbLaj1ggHdjpAqrMqiUXjqUBUKIWMKAnsvrhFpC
	Vhvftyq9djMG+TcuJMRgBCECF4Rj9WjOhYJ89J3L7D02W0zMaNC99F0jO6yV6o8KqjNu7pfy28n
	y5qeXxt8XL8O98VVpvucqI5j7nxuQPWEQJvQ5N94/Cl/gjFqinEY8pTdQeRTltcfg+Ok9HgC/VA
	GqtOb9Ziv4ekQ9bxWy6x2ViuWAGBqc/RLErYrIevQYXbNlixiRywWiRsnxFBWIbQA8NwMoY02t1
	A+BZ3u2OfAy6kEQfxlqbWXZ56HZk=
X-Received: by 2002:a05:6122:a5c7:20b0:5ea:4ce1:95de with SMTP id 71dfb90a1353d-5ea4ce198b3mr287185e0c.2.1792065943978;
        Thu, 15 Oct 2026 05:05:43 -0700 (PDT)
X-Received: by 2002:a05:6122:a5c7:20b0:5ea:4ce1:95de with SMTP id 71dfb90a1353d-5ea4ce198b3mr287177e0c.2.1792065943496;
        Thu, 15 Oct 2026 05:05:43 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd5e9dd7sm43316775e9.0.2026.10.15.05.05.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 05:05:42 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: (subset) [PATCH v4 0/4] gpio: shared: replace platform lookup with dummy software nodes
Date: Thu, 15 Oct 2026 14:05:40 +0200
Message-ID: <179206593570.9466.9314765423671491807.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261014-gpio-shared-fwnode-lookup-v4-0-2253ad645fd6@oss.qualcomm.com>
References: <20261014-gpio-shared-fwnode-lookup-v4-0-2253ad645fd6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: AsXVn_78O3VXwvZGG40yKTQPkXCm0XcR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA0OCBTYWx0ZWRfX1I5M8UToe3KO
 j0EXWhgRz6pIZ1iJ3MfcMRgI0EHX8lwGTC2jImqvrlqH3ATf9PeJCDFMwQa5ocAjvhp7/SAZxg8
 Psor5g/6bxtANrfz62+axfreA3OW503YUNKuAM729aNGhoXSdszYXMzvdgscLqOAIq1VaBYMdjj
 BdDlB3BVkEFjOCzH2T//qMaodG9bk8iAe0fdhyscB8fG/kfIZ/mqHghPdmRQ7okykO/0Eqr7SmX
 cFXnLyrGUruDhkhreLHRD9S81nT+/WKPYfaMt53rePBkPOLdBDFuubvkUbdI66JHCCtCHnYcV4m
 Jc1h/U2ClDyFLFys6Wh92tWOMMYxBfCfH9JLtB/pIULa4EWHhcgjvsnkBZHAc66Z7bPCuEhnKEn
 8CzC3oLKxlXrgf9Bsew/rBxun/MGJfDLo+Oee7EW7VbxlJrR04mXwtAxivs0Yq90UOJx13oqaaF
 9cuXwnVWa0uvgXM6E3g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA0OCBTYWx0ZWRfX49/fY6Apasbb
 32j3WZbwT1ZnpAbBp81TkzbujilxJcD627uZx7KxK246VDHXVs51Yycum7QGiXTYE1dlq6I7WqB
 PyMwhcMxwgjklTfUDLjnwMwLvOK+uPI=
X-Authority-Analysis: v=2.4 cv=Eb5d0/mC c=1 sm=1 tr=0 ts=6ad0c199 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=p18oh3DA-0Dk6BgrZE4A:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-ORIG-GUID: AsXVn_78O3VXwvZGG40yKTQPkXCm0XcR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 lowpriorityscore=0 adultscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150048


On Wed, 14 Oct 2026 11:38:24 +0200, Bartosz Golaszewski wrote:
> Abel reported to me a crash on Eliza linked to fwnode GPIO lookup for
> shared GPIOs. Turns out we don't support no-device, fwnode-based lookup
> for shared GPIOs. In fact: we trigger a NULL-pointer deference.
> 
> Making it work requires a more serious rework. This is what patch 4/4
> does with 3/4 introducing a preparatory improvement.
> 
> [...]

Applied, thanks!

[1/4] gpio: shared: fix use-after-free bug when adding shared proxies
      https://git.kernel.org/brgl/c/bd22f7e63509fa758cf500d9af3e88a3d3df96be
[2/4] gpio: shared: gracefully handle no-device lookup of shared GPIOs
      https://git.kernel.org/brgl/c/cf73c3fc03c43a8a86fd487c62390b4744eff9ec

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
