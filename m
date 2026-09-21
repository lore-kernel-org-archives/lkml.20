Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04D0D306B3D
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 14:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790001206; cv=pass; b=ljzoZaoXL97+YnYcs47VQ6IfBLtTm9luwao/ryrBCSB8q00irHN7EHDmmZtphhwtOq0fm7wRGikwYLLZCxw+XETdKiHoqAnn0bp2KBU4jp33ey33aIeqst/uoPqXaABXaHZw6LrLykBG6jm0ZQomeX7aPKztr/UkmVI6LVFedF0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790001206; c=relaxed/simple;
	bh=sATvNU5ARPGH1MnYpAlf3xrGfZCKT8Y42kVB75zG2rc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=se1QebyDT9cP6V4+H+2A1WeBWS3LUaiRDZhc6fAhvDW9GwRlDeAVNnTat4RhcI6yUhJNCaw8OUAmuzEJFuU9GjYbWzbbHOP8CPvI+EQPvcE+sjL3QQJ+6uiH6gec5k1LSHpgyGkkVXQU7RBDdQWTv5X01mtHGq07bjf6fH/jkzg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F0ZiPI2U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X6I1Rnwy; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F0ZiPI2U";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X6I1Rnwy"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LEGK9p704793
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 14:33:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M+OnJW+Je7ol/VY88AJ0lhYndGRLwxR+wIaVhVdJ6qE=; b=F0ZiPI2Uv2FWrawN
	CDPcczsZ5X+BvOtSdkXKG7ToN+WH3qhQORYjkSShmhgY0zY3mB72whzOkiKsl6qv
	LzAOahApWZAZXDvwaI0UGGPO1P24N4IlkmuO4X5cP+84cDDBKpOe12fjACXtyEEG
	egj23arLVe5pPiEXCGCPzNW57L4FlTFTfWCMR2e6CVxBuOW06X6bsYwok3UcfmPL
	9c1MdGNdY5i0XIOzO2b2Oxj+iehQR3Ac50ojRniKpadJLBdT+tQH6KtKN4IIlk7n
	ehdQy02E1ql6/mcSt6HYQmuABrjiA4YRyC3KbNFfsJmdRcaDOUIZa9ktzXqbglvz
	9gO4Bg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu17gsdrv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 14:33:24 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2d9057fab9eso52203695ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 07:33:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790001204; cv=none;
        d=google.com; s=arc-20260327;
        b=IBxyBj8mjMXBBv2QcK961J7DnbpjIqjcSdFUXVUvqqnWDb3aOmcPqU0HCEgJkngfvz
         SFkix/MnL5js5oP4f2GhzCK4QG+0Tz6LEX5d2cL9Sa3NJy+GfUMLvZ2t4Lx0F9SdkpAH
         75H3hkuktii5nbto+3xk3HvouASj7f41CezAu2HjGJFDDOjQkKseU9ttKjYYghmFZfbF
         iuebz7s36/omcArwnQfHGCYjOVejSjUO7EzMDk2lemjeb/6zUOCrTuvxSPSZOqCoKCI0
         CqQTgYNOiW0EUsAwkJQ+c6LkQJ8IvVCulW9dXQkVg5mTrT6l8547eOKGfPNUcURp5kTS
         X86A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=M+OnJW+Je7ol/VY88AJ0lhYndGRLwxR+wIaVhVdJ6qE=;
        fh=DemWxX+gKss5LCXHMJA5lNW+ofiXNWePYbZr9REqRvs=;
        b=o/BxMo4wxK4xZo8RzalUYrzGXNyQEaBVMGjGNYCcB4Hcbefs1Dj4e+mBBMJ4lmHr8s
         ZC4lIigj+SKJYrFhuv6fWpYmfvOp8myLVjrPxKowiN06QXc3tq50NAP5JzHsy83/D1hG
         1F2L4xjZQam8VfL+yY3IFXAy8NzkEq/VjGU1pcgeyc+qVcJdFEpa+B3ZKo8hVCy2MdF9
         bwZJvI+fDBocebrRBwYNT8uQwJeiUU3DCEVdEGWPEoVXniKf0VFsaspSTjZl3bxwILtJ
         yhAzKMe4mZ1By5w6XCBppjdaQlnaAvBkIIngTn7KR9mfdp3684AeyHwqrw0jmAbc/4mi
         j31Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790001204; x=1790606004; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=M+OnJW+Je7ol/VY88AJ0lhYndGRLwxR+wIaVhVdJ6qE=;
        b=X6I1RnwyULI0ayduABIf2ykW30sv80k9ZhE2Q9FBKoXb9LvjQ4vCSpw/3fOfzDnHjM
         VguGYrenbWu4jLc8ba6Ow0TF5pKXFVIk4ijDfsjGLtLQeCfEMVeYObe0USKjX4r4rqmr
         QsrdhGBQu2fZ67yZtO1P3F0vTrHLZVqivCGHnFjh7wJvU9HTzX9VuZPSNSF4PhniwgK0
         +zabMUcz1pN1A/hnrASWsCpkIWX21Dcm2JpIIjQflcL8VRQeS55pdYQ9mhxdPXXRRRqU
         jc0NcMjSynjZDI+80lPWyT+oDN+HdJd+KtFvKrgN2vnGzWxAYpvTExOTL/cErVm/LMhQ
         g88Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790001204; x=1790606004;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M+OnJW+Je7ol/VY88AJ0lhYndGRLwxR+wIaVhVdJ6qE=;
        b=wRxRcxwe6AmAbE75W5ecbCJVIzNriA35YMroeQSHLlainCpUOQUSKnFAkk2wX40HBq
         beEsbcGhNg9z11qnF/i+QdfW7i8dk5/uGKSlk+ZmHzcdXeJszfehOXID58gbiOG36jOu
         NfjK1oKh1HdoDJjNYHEaCN2E/RImSrpNcobXtOzjZoAGuqzTBZ0MqCDSYkcJI2Y2T8xB
         vQaCnK25JBSwrUghESuNicCQ/1shbLOxvHBvUWNvovnV1MlAf6tr/JH3CIlCd2jtiniZ
         mUtCiVOPLHnnj/U+Rug4I0zP20r7o0JD77vWL5NNcHmGLzFEgDDeG8zLf5adTti75Y6i
         3GAg==
X-Forwarded-Encrypted: i=1; AKwUvBwIbMsP+ZJB+9yHllPK4RZvuSNq+e8HsXUB4tRvi5KOqtx3kVIt2dYfMe+F5dKMIesl5+JKz5MaGK1aRbA=@vger.kernel.org
X-Gm-Message-State: AFuF++kVvF06iodvOUv0cw+XmRiYGCoHrNjSHYawYJ+zz2jmL9PlmGrW
	XXQbFR/GxOs2R3LpY5tkSxFzN/F/iVobVCIbaJSQNxS/9lFgYCoQ73C7CHMjauJPNxCIqBdMu59
	e9hLhIJ3OQToJiX+tUZocOEmtLhX1h+csJKDVrV1lPF0x7oTBYPyqfMk8iIlp/hV4B1d2lVRTZy
	xCbsyKf7+b0rtu0yqf3bybsMkgWwCK+k3J7ayZVAmG2w==
X-Gm-Gg: AYBFou2/NYsNUGfyos/RM3SuD27XRrnurSn6+m8BkOmo6wVzmgOpFfvJvjOH+xwIgtA
	MT9FBbCbabGvePexW1R17goaSkMAS1gzz1ryYFAI+SMDCC5Xo7VV4honAMiwIr56kwq/bFmKzNN
	Tr0hvyv3HhXyzMorBTiDBYSg0a8gt1R0HXRFFrss1muBJGZy/IGy7gOwgGSw==
X-Received: by 2002:a17:902:c941:b0:2d9:3bee:4f32 with SMTP id d9443c01a7336-2ddb1b9a350mr168383715ad.20.1790001203659;
        Mon, 21 Sep 2026 07:33:23 -0700 (PDT)
X-Received: by 2002:a17:902:c941:b0:2d9:3bee:4f32 with SMTP id
 d9443c01a7336-2ddb1b9a350mr168382345ad.20.1790001201286; Mon, 21 Sep 2026
 07:33:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907061237.28169-1-hemanth.selam@gmail.com>
In-Reply-To: <20260907061237.28169-1-hemanth.selam@gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 16:33:09 +0200
X-Gm-Features: AcwNN1WNonjPFfOApeY9wJvwgx35yMtSwgIvToN7rVqLbJMrCQIClZnNJ7PruzQ
Message-ID: <CAPx+jO9bgR321FDpy89HEyoF9tjYZe2kdyCiyi147+k5FXrtFw@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: fix typo "releated" in comment
To: Hemanth Selam <hemanth.selam@gmail.com>
Cc: Ulf Hansson <ulfh@kernel.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: ovRnVl3DpT338xPx6iIMiEsrE6vzJ8jW
X-Authority-Analysis: v=2.4 cv=IewSymqa c=1 sm=1 tr=0 ts=6ab14034 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=pGLkceISAAAA:8 a=rrkdCiAnefG2keYV_MwA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDIxMSBTYWx0ZWRfX/0OgZ+mPNZLM
 DSJNc5Lzz/CThM6GzBtO8GXqdo0MuQzlykns3kMRI3FE2aeFrSH1QY/isD71JH1Wb7wBwZPRRlk
 aVk54oIuBhya5ayv9k1d8PebSwQcGZ14jhQyyBH93D/ivRTrdsyMWgVm0dkeGmol3Yym5CjA+k5
 oK6onZKFLN6xkI1UGdU5me+bGf3MTgPYzecP9NB9BvVEh9m2eTSrSuj2HE2UY5Hhm2P7q4D7UC7
 9SvZbE3RFOg9DepsuX5YBV2kNjxq8oqUhm+vU2GQVn9l/o8rf/wif4IYjDjVAvRZyjxYhQSiWRX
 au6NDk3vrFR8FKhKUfXQqKYetcxvUkbWdaqMY1PyowUN3bU1L9ZlvBwFn1JALORBUsxvGVzdlZi
 pLBD8kyBEWWLEE7omdA9y1ApZO8aYQWGzOZwrIif23g//8yBmG7c5lGm6kOV++yVYtct+NZM+GP
 KmZ88/om5q0eHcSNFPA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDIxMSBTYWx0ZWRfX9viqt2oG/f98
 6jNqlAi3ZiCX5QhkfNUisc8IaVjLrxpDji4yMBBgfxZugF1MQ2doFlgUnrh8zwjH86h1UIYqdLv
 omqaBtarxN635YnpZRA0MV69TI30PGo=
X-Proofpoint-ORIG-GUID: ovRnVl3DpT338xPx6iIMiEsrE6vzJ8jW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 malwarescore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210211

On Mon, Sep 7, 2026 at 8:12=E2=80=AFAM Hemanth Selam <hemanth.selam@gmail.c=
om> wrote:
>
> Correct "releated" to "related", reported by scripts/checkpatch.pl using
> the misspelling list in scripts/spelling.txt.  Only touches comments, no
> code changes.
>
> Assisted-by: Cursor:claude-opus-5
> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/pmdomain/core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
> index 842c4169e290..1a58aaf8576b 100644
> --- a/drivers/pmdomain/core.c
> +++ b/drivers/pmdomain/core.c
> @@ -940,7 +940,7 @@ static void genpd_queue_power_off_work(struct generic=
_pm_domain *genpd)
>   * genpd_power_off - Remove power from a given PM domain.
>   * @genpd: PM domain to power down.
>   * @one_dev_on: If invoked from genpd's ->runtime_suspend|resume() callb=
ack, the
> - * RPM status of the releated device is in an intermediate state, not ye=
t turned
> + * RPM status of the related device is in an intermediate state, not yet=
 turned
>   * into RPM_SUSPENDED. This means genpd_power_off() must allow one devic=
e to not
>   * be RPM_SUSPENDED, while it tries to power off the PM domain.
>   * @depth: nesting count for lockdep.
> --
> 2.48.1
>
