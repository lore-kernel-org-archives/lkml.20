Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B551837E5DB
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 12:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790857737; cv=none; b=hFGIjxuTMy/csECHFVwTeVGHmcrXZYtdqIZuAyZ/LQO8vSf8akTiZj/+VY+mD4J1riv0FWyagam61wcLsH69UjpwDDsNSK+03nR0jxNifXBFSsv3dwAIGed/g4c/2fqFJJBEE+cIMQqOFr9uVzlefbN8F+Cp7H/qgWg/ZdMEBk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790857737; c=relaxed/simple;
	bh=dXYL09udpZGlmeEtYkW5pfuwxpM/XXs97rRTP2AfWyE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tZ63Vc/NWWEfMMicGgNi09Rdg7miEUbLprgplyRemtswy8omdNQebyIcMWyYtsuSfhOER1x5NP0r1sprFkVn9RE9QBRyI3FDQm1R8LybVeXy42coLSzLPKOdQ+zE6Nu0IZTuWqY2oVFKHRlKKWLQHZ+V1YZ5xroQ46iuQ7mNg3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kG5ijOQr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eOBuGGHX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kG5ijOQr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eOBuGGHX"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6916xTcm1062361
	for <linux-kernel@vger.kernel.org>; Thu, 1 Oct 2026 12:28:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9WInQ6TGJlF0IbIU9ZSYlxJslOJO6BnvCO552rLSGEs=; b=kG5ijOQrlrhh7EmI
	KcBeswqUG33eMQXt9Urzc4ZpQPUm+BFG57j6i/h4wFMXGL6yx5IHJ0qXWOoOEOZj
	Eai7VEN5IlufjtAdYM/NeKImPwsOiRq6xiZtkZZpzzTgsdHlRkCcHX/yuLsKoNJU
	PyVL1uvSKJigzxh3Mh+ZsTEVeJ1usepFbMG8oR9tEEmQj6Jkq4zuGImwJWii0eU3
	zVIndBdrOxKUxKUY7zjOHdBmJG7rcmA6U2oVD8fJZev0+xHJAIK/C2Hv/d4BE/AX
	tNVuwK9P/zhyTC3lF21a006aUr8AjexhYH7o9XhKgQDJEsN2kolnGkBiGdP8w35G
	dQkAnQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h17mvuthg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 12:28:54 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93caf7856ffso314015585a.3
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 05:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790857734; x=1791462534; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9WInQ6TGJlF0IbIU9ZSYlxJslOJO6BnvCO552rLSGEs=;
        b=eOBuGGHX9Y+v+e5TDcMzypsFyriA0RmLH7P07SMwPN9cI4RiDEHk7NVTxp0OKD2kJC
         eIlA6H2BsWoNRKzxAlkhOqqe35jWOoeeVpFs38OXp/oSUoXtZPY3PBnO0Jokp70AEKMs
         geVwV2fXFCN8WUskVAnTgs/2hN/52AIlEEdSPN3aJh1rpYFcRR9CpUMbPZP10ZklKHDc
         EJSNESbJVexxwAs3sXecjyR5PBMXgsyP7kuK42/2w5OYdJxGse/HJmzAqwu0KlNAk2IN
         v3cc7WvmahYOtNqnxVQiFhYvGOMJXuVuihIg4hKezXRQ4Kc7EDoKN+Spu2jOJlNhm0gK
         P/Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790857734; x=1791462534;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9WInQ6TGJlF0IbIU9ZSYlxJslOJO6BnvCO552rLSGEs=;
        b=wKRMRB/rljBoVMF00bMMyT268QHbwQqftvCNg6EWL6a8Up6Qah/8j1bKQa3oLlNkOA
         tvZGPz8+w606tA4LUzgN8O1a9bzrGjAyqFl4FzbbYO5zFp3+eNC7353axJkkZxCaButW
         hCXQabwwDNWk4r+y0ACf/b/TO5gtpIZCXlZC5UPQdvQt40Iao5bw8BlNkVFLarONkpyQ
         L1/z58jVa4d17VunctZpssnN4lizIJ9F3M8lFNhaJu3OiNY7/q/33s1zIr4qdZ4t3Vhc
         k3g9qp/dxbYpX2SzBISIuOhWa4UYinPC4lgCQNJa2AwvgBZ4Ro+tspzDym39DLMVaR5G
         Zaxg==
X-Forwarded-Encrypted: i=1; AKwUvBwZe3gmUVLWxly0Dp4D3f/P9nVTQo78PRaejNcCJ0xzS6jFwQsO/s/3b2ZDGtXaHT3f1fBGkRH7UJ4OkGk=@vger.kernel.org
X-Gm-Message-State: AFuF++ngHCa5ArGF8lscfLFpFiv9PqvIKpzu9Cbt3G50ZVGOhoq6dI4a
	LwVQra+M65k9EXlQIEqzfqSribmH9sbPIbv0KI0DY1U5tRNoiFtyXUF3aS/BQ8NqgYke1NYxJb1
	WO0meBsSJenT1BGqZn2zfzqwO4z+OJ4qKDGg704LcwO/Ur+bdXc/EcLftPaGzzPzC6OQ=
X-Gm-Gg: AYBFou2h7WiICg97fyTgFx5+dBBAg4o5ZjmxgvGy/knvk8RRV7nfB+nXo8JorQsPl64
	a/a54Pyx8rmE+9sQyrzeJFpPxQz/bovuFOHTx3nBpz7dJnidtwavVcIoazeY0ADpcvAHdtzcNFe
	WFwxxrD1UdxvNJ+R67Z/lrpADbR4IOZ5gP+vSKT5Z9HyLW0yDy9U8pj8uk/2oeRaU8RNTWkM7pC
	WskIJesmy1V5KHMOXr0xeDCf4wTTwnZzMd1ARqS5ifccnRynpKwZshDG+y3xfZ0aS+5XdiX/DN4
	0hDf7s1yRScTPgD3d5PZPAfKoYwR5RawJ8jZaer3yDUL79lhlV0crxSGmE8Taru4dhoJnoR7Dnr
	Po7XjC3JsQXkazDKe1Usqy33L644=
X-Received: by 2002:a05:620a:370a:b0:93c:b47b:26f with SMTP id af79cd13be357-93cb47b0cd1mr567072485a.49.1790857733834;
        Thu, 01 Oct 2026 05:28:53 -0700 (PDT)
X-Received: by 2002:a05:620a:370a:b0:93c:b47b:26f with SMTP id af79cd13be357-93cb47b0cd1mr567068185a.49.1790857733295;
        Thu, 01 Oct 2026 05:28:53 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b068bd8c9sm5915602f8f.2.2026.10.01.05.28.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 05:28:52 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: linusw@kernel.org, brgl@kernel.org, Fan Wu <fanwu01@zju.edu.cn>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org, songl@zju.edu.cn
Subject: Re: [PATCH v3] gpio: mpsse: fix race when arming the IRQ poll worker
Date: Thu,  1 Oct 2026 14:28:50 +0200
Message-ID: <179085772818.11030.1529408482067612830.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260929093646.18419-1-fanwu01@zju.edu.cn>
References: <20260929093646.18419-1-fanwu01@zju.edu.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: siUPDHpBWCb56QSSY3j-5qAk9SE966MW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA0OSBTYWx0ZWRfXx6zQPXp7Tg/4
 rNnfGyibdGMc5hswtuEU0yhueFeZ/VU0teF1ONEsyc0I+K1maWuYRu1Cets1Zx3wROvgpsHvP7y
 nNZwbdKGYMlmIzWPVM7p5hhqYRiCmnuANzPkuQsPFOSxKL6o0fCgrGSuo57tLjMas1LbQeiLDA/
 +gTQial5RS1WUmWKE468josA9JVBHEKYsNsvNC1uiVU4DQXgikgyXaqvZFfE2pn7ti4CHBmRek9
 ReKMVuAJZvSglqR0IjnChIFwweFRmQBMaVfLlJcJmzaGiotePAVyHAvZ/36fK3sRicGjLBFejWB
 aMxbKA7Hg4helTRlDpB8C20MLtdHB8eJT2VIx1ajTTq5S/enGCZjBGvo4Uv2jj7oT5us+3Rh7Dj
 bDq7z4Z4QW7MK7nO99c2NERLftVrwlaUD2Gv8IMfdC20lC2y1IT4+GW3uuy5yd7iNaBmvs+GX1a
 FkB4+ydPz7tEZ7/cVqA==
X-Proofpoint-GUID: siUPDHpBWCb56QSSY3j-5qAk9SE966MW
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA0OSBTYWx0ZWRfX5kbi56NKaDN4
 phn+qLhECm94JT/zdPY/JC5IKdTRYktwxwLG7iabngv5fAVLJbJ0bB759WGf1Zt3GSO37243y5s
 NE6ipR/fohEfyQm/X3cc6VoPX184tkk=
X-Authority-Analysis: v=2.4 cv=KuvYSmWN c=1 sm=1 tr=0 ts=6abe5206 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=KvT2gXNad9s2oUHfL34A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0
 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610010049


On Tue, 29 Sep 2026 09:36:46 +0000, Fan Wu wrote:
> gpio_mpsse_irq_enable() arms the poll worker before publishing it:
> schedule_work() runs before the worker is added to priv->workers. If
> gpio_mpsse_disconnect() walks the list in that window it misses the
> worker, and once disconnect returns, the USB core frees mpsse_priv
> while the orphaned gpio_mpsse_poll() work keeps accessing it, causing
> a use-after-free.
> 
> [...]

Applied, thanks!

[1/1] gpio: mpsse: fix race when arming the IRQ poll worker
      https://git.kernel.org/brgl/c/7efa1a1953cd6b20b23a3524d5b4b81789c6ef25

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
