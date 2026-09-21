Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 376B24BE447
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 17:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790011018; cv=none; b=AsHB2p/Faj38Xo25Zxv9aA6LEvxSAA3WFd08wAppC5UA5XvFqmGQqlaYFYgMGeV3WjQ6zJO+Y4ZmGl4WdsMvVYIom/CVUSEi+pzYlXCy5zVOcs5jziBLUDq9XVuTqkOO9AM/6uVMjPtChtheqdhaVzBaS5xMBPHEeU63VO564h0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790011018; c=relaxed/simple;
	bh=cl9t1QQ0KFnx39LYctZdasI1zjthTbRNk5P/Du+zM+g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L7VCDCg3hMMtVKDdPmbdMaT4A0A+/xdS5q+W0C68HwTyboQ5cbTePy/x2T5NIrfylVO7VCZ9/SJkdKOIurTSAXB4VRIPs/0wNU9mrlMMa0vmZS5zwfM9JWl/hqcsYaFvTcaR7bxCU/qYla4iZTdgssfXT6O7qOduNNlxp3yvLjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jjRVyoky; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B1c1nLPa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jjRVyoky";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B1c1nLPa"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LFAOWS1437879
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 17:16:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=cl9t1QQ0KFn
	x39LYctZdasI1zjthTbRNk5P/Du+zM+g=; b=jjRVyokypvhg6PgFh4WpSIk260f
	+i5YTRfWywudi9WQZ3m2FXuTyC1UI/zbDsmE2b9tGjpMd5vYrBzNALquiNHVqmJh
	wAn0gcEQr9TzJbOjRi/ayrqNI4WGg6P+3gDNa5C2+EWu/sTYa9MSNOo9/oek+Q13
	XTb2X63h9HmYFjoU2WK7pH1bD9JAEipPiSpnrAwfEXShj9mCq8WWxZUgrsAN567C
	GK/cSlC2c4FebSlTMJwc+7YKepvevqORsiK+e91NbzbTwvkQp24jYwFWWceB49Tj
	r2ncO+NBXnpnJswgOqnhPinvC2tyWD7m1yjQQ2zs8W8V7MJQ8tY/aFooiuw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtwf5k2vj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 17:16:55 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39deda201bcso4243767a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 10:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790011015; x=1790615815; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cl9t1QQ0KFnx39LYctZdasI1zjthTbRNk5P/Du+zM+g=;
        b=B1c1nLPa0/x/wnNcViq3wumxCefKBJGlI6B2fbLgSRI+ywHDRXW5bDroLWpMdeVb7L
         0o7+dK9i/082k2roPqcvol/YQ3IZ2rk0cH+wCNLy0SUS3lWYlCklBrKuHqg9CWediSHV
         L1pXwjUyG+LvA54rCYdyB+FfJibcuIuRkpX2JkF6IfG5SO64M+cQMYpCnoA/DLSVq7Xa
         wot8ADqvokCkDq/nGkLhNPJuKJvfBeDXdT+TUA4HkGRbmJidG6siMvu6WlnWAt4G8GcP
         9WV0Ya1/KrtavGta3XXMxqr5OBALBy0oZZTip9fE7yrBoLE+xl0qjNKGKseL17J+C0i/
         0MLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790011015; x=1790615815;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cl9t1QQ0KFnx39LYctZdasI1zjthTbRNk5P/Du+zM+g=;
        b=axcTr6MHksOjT6NSbYyMOWlCyDKP77jRUg8oAZUJpcjkvZrkU9iJeRZgVmVJifrNbZ
         1tj6730idWhcPHNs8dextt7+2e1YG/dY+bOjzr9RjwZFuw7pBrIzfYr+CWMyO8XIs7sZ
         zAEL0CQS93XZPfvQR54wePNoQTQHCNnF5a9oxiHF8+Wb4lJY1MuUfWE1gVXB3P3yv+Oa
         29i+dR/AAgtmoI+p+wE3fiW+7a8lj/owU5h3Rab89FhXFv1joW9vqhpgWGaNqDbaTQsW
         rK1jYNteOeRRikDMmkfg7AnllpdQ2ocFn0yD5k7kmidqLa1dBsFHZ7r8RgLCIbscGlPO
         Bq1g==
X-Forwarded-Encrypted: i=1; AKwUvBxDiSgu4a//a3FSVuNRAENPYpvOAouOVXKTYuWmHMl1o1EuhvoSfhjxSEgJHOefirLaNpOWy3fTRg5CX1g=@vger.kernel.org
X-Gm-Message-State: AFuF++lAs9GmdqMF+g5UaFrEQ+LjbniCXDfhOAGkuhp72+aIkf+ZX4pP
	7pCC+U9iB2189s2+6h7gtm15KP+KRl3CFJ0XrnVfCcDeUBuP2KBVMBJP2aXArcuHNqFqk8sHEea
	zadMFkQ60151MJlNp2H7MUeBn5e1eXixXGv420oQ642Prf6iOGwlO3yihnGDOkJXXnZ0=
X-Gm-Gg: AYBFou2Nihg12ZzofvS5TNTSX5rYuV1P+qjcpz5WJnySzmYYn/0iCAvfx8mDXTlll7P
	foH/6gIwMzeA7OcG4nUt0vDWHPdv6cQzNGiQDLtesGalMAKvd0bloHocIrL690gFcE4Kusp0Wa3
	4BJEwGQb6aMaKshX1oZZckH+3xUzdzjWCd4WFO2kBV6s1lGKjDSZEkutw0IRFPCKBky0zVaNmrk
	Z6MDljS0TbAJRuGzg/9mzm/pEoRrYga3naLz2nfpcYTtDVTZdaTEpP4G6f8WtjJvVygXelYs/y6
	k55YAKeqLV1lvK4t3Oto2NMbIW3Uy6iaU8xGkUJUEs2PkdwdC9/9EfPp2EfY+9dtkXUy5foh2XX
	vfUHyk8AcXOUWXW1eE6j9t3Sr53e2881Go7Tq
X-Received: by 2002:a17:90b:5588:b0:39d:f4a8:75ef with SMTP id 98e67ed59e1d1-39e54cbb4a5mr18389426a91.1.1790011014793;
        Mon, 21 Sep 2026 10:16:54 -0700 (PDT)
X-Received: by 2002:a17:90b:5588:b0:39d:f4a8:75ef with SMTP id 98e67ed59e1d1-39e54cbb4a5mr18389397a91.1.1790011014351;
        Mon, 21 Sep 2026 10:16:54 -0700 (PDT)
Received: from hu-anupvish-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e55895112sm7979798a91.3.2026.09.21.10.16.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 10:16:54 -0700 (PDT)
From: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
To: andersson@kernel.org, mathieu.poirier@linaro.org
Cc: saileshnandanavanam@gmail.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        konrad.dybcio@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com
Subject: Re: [PATCH] remoteproc: qcom_q6v5_mss: Fix off-by-one error in regulator error cleanup
Date: Mon, 21 Sep 2026 22:46:49 +0530
Message-ID: <20260921171649.3668492-1-anup.vishwakarma@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CAF+TLO0+snqqrrU_h-psciUmX3e4447opf9o0vEhuT8CTrDn9A@mail.gmail.com>
References: <CAF+TLO0+snqqrrU_h-psciUmX3e4447opf9o0vEhuT8CTrDn9A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=SJLXx+vH c=1 sm=1 tr=0 ts=6ab16687 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=F0ZBgddFi5Bsh_et688A:9
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: dehQLNcuvDETTxjWLMd0St8ZVNkPHg68
X-Proofpoint-ORIG-GUID: dehQLNcuvDETTxjWLMd0St8ZVNkPHg68
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDI1MiBTYWx0ZWRfX3/PprsXbECin
 DDe3zuKYGq1AVls7iVqbEKcJuJDgrCZC8uWKsgGD7sS1C1nl02R2dIP9/9qhoklh1MKBphRUkBd
 mkNVOMaR+UI4wFrysE5XAZjzNI39Ikg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDI1MiBTYWx0ZWRfXxQXiHNPW77vX
 cvRM0pfVHMkHsFtlTuQPQkVbkS+WNCiYo9wZ+jXfX7QA9/v+JK0AZApGsppL9ierK7TdxdakTDm
 w40j47SduokroP9ic7HWCSpzdh2HEmzeqaHBdH4puH/EjLFevR/wLxOwFFhwJUGWL90IbbQgyLq
 qNdTz6VY1XMT7RN4wWA7pPd/gSM03g2xGBHTQ0Nl/uYJOhevglG/pBUbe7F1FXb+WTTdvu8w992
 XuK6IBf4L3Flix7n4Qh4ve7ea09edVAfhmiyeAM2jL3qznuIe7cYq0bVHCW864q9QCVsV7GO6bs
 llwd38+2dTmH1vSM+GYnGOEV5CszB34+s1KOISHcBO5QJOWegjKHuuP8IEmbKTQbsKopkeNzwsf
 6F8XxYb6+JaEBDHho5FbxSyP+Z4PpuYkvTjhvx2wUO9ahTJCh904aRITKu8ql/dANR1sk121zoY
 RtIFapWG7GYcCu0ALog==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210252

Hi Sailesh, Bjorn, Mathieu,

Thanks for the ping, Sailesh. I was not aware of your earlier patch
when I submitted mine. Please take Sailesh's patch - it was posted
first and has more reviews.

Regards,
Anup Vishwakarma
