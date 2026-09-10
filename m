Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF06B3C3F6B
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 06:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789023392; cv=pass; b=tMzLEsvEiRtQqwRQzS9W00hPLY0atxVLKi+j2pQQA41sOhRjpGa6vfhJm0fjdS/nfD6vyF28AbTHIJiLXZUeo4go9VmtMohI/U7NhAmPVmoQfvp9NDIHiZmpRPuW09nAHWi8stsI+VXd+4npH40RHvTqejXesEFXNqH+K7iRiRM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789023392; c=relaxed/simple;
	bh=QCIBypbvSEDwPB79oGI8b7TPpbZZpQV2xU4HGmoWamY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fiILTSzhRinWRj4chzD//T1o9cdibDYPYcLKjImYxGmkal/GVtB7gZ2z2aVZhGpzO3eelI8sWC7ZloozMjTgo8Ovr1Y1waaxjJ60XeBbp/MSGn9OOeiVmsxiiZ2A5JmO1/R5t6AgapuIxezz6/+0PStGY4wE76JY3P+crQS1Cug=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JVIO0I+Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N3/UmuA/; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JVIO0I+Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N3/UmuA/"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68A5Ghr4162449
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 06:56:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4aKPvfZM58gWA2EaVlumqwxLg4OnLhGg//o4cfo9NEw=; b=JVIO0I+ZwDlKHM9j
	D/TeQvqZBmIEW9WUiTGLQ5qeeqjgQPsQkJumGssyryITlk9QBUx10hJVFql8vNL3
	9l4GCWGxhCUbFNApr89KsneusjCZJVGag/jknTuEBdaA9CmXAIaTKAEeAAKHulrg
	pIbON/BCRy4/HsG9DdgxhSyCbFYWZ6oy9cZg5m20efgKhngdoWIwrEK+G5tiJzG+
	iFH37RSVkFj20VeObSwGIaNmg8KtiRBRWsGgar7g6hfuP/xgWRCttJlFWtbIewnF
	rhWHGck2OZHYcGU0afhUagZ9M0Dl0lXYakAl2bmBlnwhuyej2dKKZlTbwAiADboy
	ofslXA==
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com [74.125.224.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcyg2ju7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 06:56:27 +0000 (GMT)
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-66ce3040ea9so9385242d50.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 23:56:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789023387; cv=none;
        d=google.com; s=arc-20260327;
        b=E89bzHf1Q1CfwHcxmlKoca3tZw6gs/vKZmQBwL7ntNf5M7Bm9BrgFKCdwRJqE4IUN3
         dk9omGZWUdULHe+uj2Eo3ZwfkEUliUxJw5WEhnf5EsuLYoS4SxvhTcKTqdsTe0CYCc7h
         bzKZscErykmzRqGOOcHBWxW8We/fU/fTuF2J8PIXR+LOFOUEIK9QDzw1zgp+Qk+7ZPwu
         qElvSSlUc2fr23NAdqoG700dnYUaqEiVWW4StKkK+iAjZl0g3mKAjzuCbX+J7+5qhuy2
         jlJdyguKCRym/qOON5CGtmXQsJAwKqvYQhtmPn6fE7TbWhoyw70DAoeWNexyr82xavnx
         FacA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4aKPvfZM58gWA2EaVlumqwxLg4OnLhGg//o4cfo9NEw=;
        fh=XJDbPNljxNNoa6HmYLs5jmc+eaZj+JakmWjpsbd5xLM=;
        b=W7KoqbqbtnAgbF/N+s3UMcLDBJGhB/n2DQOFKf0dELmZPOgwKv3GVLEONCsRvIL/jE
         XE6U0PJtMh50k52FwVsAd6eLduoWRoptjUe34kbQ+wao+SgbEVFW4/ZRCrvUP4bHCL31
         FeDh06U1DHX3FNRDpA3wUG+hnRjN+iKS1EpCTFb2XhVTy7KP6xhVHp2iuXHPKSx+1p6f
         TwG8h5yEpyeCcpLuhtYv5o90gp3PzLiN3FWLw9iG9ca9Ko4GfAzbgkRDS85GQr7tYNhE
         jVEcN2vu4cICKZ/DJYj26pnSTmTeYk7d2ta7BYsS/8TDye0LB+YP9XZxgzURd9jb4Ivr
         Y76g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789023387; x=1789628187; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4aKPvfZM58gWA2EaVlumqwxLg4OnLhGg//o4cfo9NEw=;
        b=N3/UmuA/GDFjpiN06pqhcdILFaomp/l3yTDM/Jlh9XKbabS/uar9MWww7KMxqEziZ7
         q4PH05gvA5o0AuCX8T5zmkesOSDQp0LTd3kALLtcrMem1xGHyrnV822QQ8z17MhPsQGI
         i+jE9yeed/7P0cqiP/gQ7ZzP/XdmGgC0iyonQh9MYz638nbvMocUg3FY1R3s7Dq5HF5r
         IgfPWEE7ZP+7w0F8EzIO65rq37ThlgBztFShI6mz9blXBeuBRijhCZMvMYdO7eGMFEyD
         VFhuSpNxXlUld1kapafcH+iUIjTIGWRDCAPAtBT3vw2h4eH6JOlYHZ9//JtJYJ8Zdwuk
         4uQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789023387; x=1789628187;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4aKPvfZM58gWA2EaVlumqwxLg4OnLhGg//o4cfo9NEw=;
        b=j203wbUptUNXl649eBGRQN+L7x0jBeaSY5S0iQ3+kfR7yC4Cw4eiWJQyW9kRMYgXQE
         9mihB3xYtndu6vRu5aoM8y44xY+BgS6AEMe46bQxYA0yWuRtL3OFikRRwOiHs/VDElNn
         56STV59lPSKT6lWW1G+WW2a7106g3owipNwje2et4idrAlHwsauPRSqSkn5I7kmdzOtH
         5OO/0lozs5u6jUySaW8UjF5Q0LkNMWEhRvV0K+uqefTlp1DTM/zmsaJQQpxYQvvnWY6r
         sn0R2HtC2vkmJKzQLTjF8LXXGxPSnwNPydnWpuQDbcUxRIjA3aey1Bnlml4KVHI8LyZv
         x2XQ==
X-Forwarded-Encrypted: i=1; AKwUvBxWslzMSKkUI/fOIs1WVjUx8WR124FwVdBj1MSz8QlgpgQifyiQ4s9k0Imz//5JX9gGkW/Ju0WACgoPre4=@vger.kernel.org
X-Gm-Message-State: AFuF++lZmWRahlV/Ji5fUOPQBDzW1MZ0iY73FeOGGRw9i0/nQE9iVIGY
	acMtg9Si6qSLXOnDgcj4I+oqIFMA2vRYTX3r0SMblxb7fNcAHkR+gV6L81M7K9YDwYJdKpOTRXG
	Wu1TqdKCrCNIBCfVBjJer1MVBUUS82dme1oIP2XxvQRhwVm8jGbcJLoK+VtxJPZ+ZnWydZrdA+s
	eW1Evih3CrBmS5BbcQNqSqtsbr2pct+Jl5hhlqI3GE+Q==
X-Gm-Gg: AYBFou3Op5+5uM0m8nd1Fm2919fwoB179EYEadOVE3EOGMkpYL7hnQOwEIEOAkFho4B
	lpzoBbJaaravw3anbeYtnXBUvWZk09k0MkNShRjk4zkjApLwW5KLAgH75kcDYk4zg/sMBLyCKbn
	PlVEwES/63bpitF13doLFxjALZysjI9dTOD5pNHFq7y4zAFkLGqEx7f04WaA==
X-Received: by 2002:a05:690e:1381:b0:66f:d093:c206 with SMTP id 956f58d0204a3-66fd093c2bdmr9267278d50.17.1789023387553;
        Wed, 09 Sep 2026 23:56:27 -0700 (PDT)
X-Received: by 2002:a05:690e:1381:b0:66f:d093:c206 with SMTP id
 956f58d0204a3-66fd093c2bdmr9267270d50.17.1789023387057; Wed, 09 Sep 2026
 23:56:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <888efe8e63b6a18fae4acd5a90a1e0e69dcdf2ca.1786012495.git.geert+renesas@glider.be>
In-Reply-To: <888efe8e63b6a18fae4acd5a90a1e0e69dcdf2ca.1786012495.git.geert+renesas@glider.be>
From: Sumit Garg <sumit.garg@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 12:26:16 +0530
X-Gm-Features: AcwNN1XL2UjMnNz9rSDQ09SUEB1jM8vYqGgIh718AFVmKu_cGWQR2wlTCqQPHEc
Message-ID: <CAGptzHPbPKE7sQXfePGLH7_qVL8m7ihQYrB+L7kXR0EE3FMzsw@mail.gmail.com>
Subject: Re: [PATCH] firmware: QCOM interfaces should depend on ARCH_QCOM
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Johannes Berg <johannes@sipsolutions.net>,
        Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Linus Walleij <linusw@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=Vu62kO2n c=1 sm=1 tr=0 ts=6aa2549b cx=c_pps
 a=J+5FMm3BkXb42VdG8aMU9w==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=rMNxEFciD2boAfdi9R4A:9
 a=QEXdDO2ut3YA:10 a=Epx66wHExT0cjJnnR-oj:22
X-Proofpoint-GUID: y7tBnR5RkdK-1cKXPN146lnjG80hzGex
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDA3MyBTYWx0ZWRfX7d4tX/EM/X81
 Tr/mLCWcxmSJ0foipQbx5hJmt8HB+nYtpZqZGlJJjPljRSxJkB3DeZPl/MNOVMkg1S/QeiwQjAQ
 1dvVqx/EG69xTXPOSIeowYy4d/DJKFNeDZAFOOA+R9rGfOhUjCN3AkJNPyjHD00ANy9pHkRDTK3
 0hVsDM4+3Saz3NoLqhP0vC02Yer9j49+wJfI+IUyvbw2MWWH/odjfHFsMUAClz8E8IPnqvfWePe
 UOoEu4FKZk1H02Dt+QvYSfGE2KctT87Sb3aIYbUGJ7QRp3qou+0beRgOpbVerW81xd7tp5Hp0dE
 5o3UEa7Homtz5a5wPB3lk6rNbJ2hdJVHtT7nD4jg5Qv4uKakcDB2LmUKmu07qWuU030qTCmpg5m
 dU3a8gNwkFq6cJ+PkEuym5TfzK4nks0EGAONCcz8Ex4/dLSxr4JkVtuP/9ymxl8ZkrCkHHKolQ4
 x8u1T36EDLaDM+bg2sA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDA3MyBTYWx0ZWRfX7Dqj6eRpP/b/
 N0c35REGbp5EDQTQtqRqflgyeYxJnCC7txmA7JF668v3iwJUKgB5GcxLjC/L2sxcB6rDdxKjkud
 Nd2EdI0aUkC/6GhvV3CZi+bcD+hRqAc=
X-Proofpoint-ORIG-GUID: y7tBnR5RkdK-1cKXPN146lnjG80hzGex
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609100073

On Thu, Aug 6, 2026 at 4:05=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> The various Qualcomm firmware interfaces are only present on Qualcomm
> systems.  Hence add dependencies on ARCH_QCOM, to prevent asking the
> user about them when configuring a kernel without Qualcomm SoC support.
> Make QCOM_PAS invisible instead, as it is already selected by its users
> when needed.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> I wondered whether QCOM_SCM should be made invisible, too, as it seems
> to be selected by its users? But apparently commit 5c1a2975d23c51c0
> ("firmware: qcom_scm: Migrate to generic PAS service") in net-next/main
> and soc/for-next made it visible on purpose?
> ---
>  drivers/firmware/qcom/Kconfig | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>

Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>

-Sumit

> diff --git a/drivers/firmware/qcom/Kconfig b/drivers/firmware/qcom/Kconfi=
g
> index c7f8413ab996cf12..691db0ded8e8cf63 100644
> --- a/drivers/firmware/qcom/Kconfig
> +++ b/drivers/firmware/qcom/Kconfig
> @@ -7,7 +7,7 @@
>  menu "Qualcomm firmware drivers"
>
>  config QCOM_PAS
> -       tristate "Qualcomm generic PAS interface driver"
> +       tristate "Qualcomm generic PAS interface driver" if COMPILE_TEST
>         help
>           Enable the generic Peripheral Authentication Service (PAS) prov=
ided
>           by the firmware. It acts as the common layer with different TZ
> @@ -16,6 +16,7 @@ config QCOM_PAS
>
>  config QCOM_PAS_TEE
>         tristate "Qualcomm PAS TEE interface driver"
> +       depends on ARCH_QCOM || COMPILE_TEST
>         select QCOM_PAS
>         depends on TEE
>         depends on !CPU_BIG_ENDIAN
> @@ -26,6 +27,7 @@ config QCOM_PAS_TEE
>
>  config QCOM_SCM
>         tristate "Qualcomm PAS SCM interface driver"
> +       depends on ARCH_QCOM || COMPILE_TEST
>         select QCOM_PAS
>         select QCOM_TZMEM
>         default y if ARCH_QCOM
> --
> 2.43.0
>
