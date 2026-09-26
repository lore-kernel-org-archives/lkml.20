Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 248F73E49E9
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 15:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790436239; cv=pass; b=i5S9GXlzzsyDgTC5sYfwROi3z02vzRtQYFoxS1xwrtDnaezf2FXPeb1iEs2BbVhUj+JVNiAqwBqUMZim3d93PKKwUZXUKOQhzdCSyXdODQEF9Blerqe2HTUAgfCGkihDY4vtfINON7dMIszg9I7xfzLZk+61wFIRt0nywkZfCN8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790436239; c=relaxed/simple;
	bh=ecMAlZsbu2E/3TSAdvLiw+iTvs6e2RkSHx6GibJf5lw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vb7YBs08LAAoleLAYwMlS26ZvdjSCDipmzL4koldT1EylcQTNFIjEkMdOT3F4BKJHGXJIcwPZoY09xJou/RhDCbeEMwcQciIbwmfmg51EUq5J10OFpEnqMAyHDZwPFswUghQ4lPgWJ9AkXKVSaskRpDeIE4FwgLXhzRoQK71zJU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ju/jyXMr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HA5q2Q1S; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ju/jyXMr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HA5q2Q1S"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68QDeEUk3406547
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 15:23:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=kwRYD0lg3ABAu3cXBo8DfhKih+wg0SWi0GfEDlQ7sK0=; b=ju
	/jyXMrgh6sOhp5pfzYpboLpZbwQkSeNZqeqFUWFTMAzlCejoUEMOb0agvTJVaKr8
	7xZSKhZS0iKaPsHuaJFnVH1MgOtt+T4a7GsAa8vi/qyARbtF9fqmjAfCecmWg1bx
	1H1r6SxQSyvYEFf7g+asXn7RTxhZ+TFUIHVNLnXtYY1vSM1cUWcI121E0ItEhMQd
	XtlSuVoRCGEL1qYxDZT5vUONEeK8uura4F1qnf/wvEVTpQE3TSmPxLi36ab3ZQzB
	p4YiXAZ9YMHzowRdBDhyOESQWuPImBQkVFqoYqr8amc9cTElcqgBBcuxLmjIhwHW
	geqzr7CAeMDLP/QsTX/g==
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gx7b9ryyn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 15:23:57 +0000 (GMT)
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-451d80641efso2948577fac.2
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 08:23:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790436237; cv=none;
        d=google.com; s=arc-20260327;
        b=Kf1cOh7c+CqzDBYjDXPNLgBl/Mg/SR7qfhAmO47Zsa5MfEXHPiCjZAQwhlMCbcnf6W
         IeoDdM7hhnqMsluu+85ARvBAm1ZFFu2aOujeuxNskAGutu1cQhT172+FhyBZtQsMFwTJ
         Y/dfzevIzPtnvw0qBRD2N5PbczjcRJPGxpebagVGrC71ct0iIqkAQdgMOQE2Qe6wXboi
         VL/KHk+3Xm17pbiDlhQbMH/PQuGFeK9uwn0caOCzYJjx43vZg8ii2DITFbXB4G75NA1f
         YONfYkF0CFi0IblTV8ID4ZsYBBsGxXzGEzOJ03hEzaBLUzM7m8qCUoYg+i0/OUHhoITt
         gr5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=kwRYD0lg3ABAu3cXBo8DfhKih+wg0SWi0GfEDlQ7sK0=;
        fh=vJmUU9O/m1bZg+lFJm62J6QM5RNZ/jMuUZ7ZkicxRu0=;
        b=W1f22/waWl9oD6BJ17kv5l1Sw0ZD4z5bySZo7M0AV6zDGGVRHyZ6YozZdQJEniJF9j
         sIy5Kb4KBBbKkxujbUkfNNomFcPDl0foo/4mlj/gn7GBrhiDyXQB0t+yowFVt56UNwug
         vnqeJL24IQzV92dlPm/CLiUt4dNFLJeh45BfiKfkfWcekiG/w8D6tvf8fduYy//6gvfg
         Env0er79trDAsuTbNWMPYfPkegO9JiahvGmRn1tdA8fjDMEmfyD6iPVuzFGUGMFP9cId
         vqmln3Axxj9gPJP0F6JQSIynq6T94bCGWFQuvcL3IAtyvoV69B7NK0xqjLFHhe4A3vLE
         haLA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790436237; x=1791041037; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kwRYD0lg3ABAu3cXBo8DfhKih+wg0SWi0GfEDlQ7sK0=;
        b=HA5q2Q1SCwOMlGFH6/REdkXbTGIqX2RVpwVvxebcLnFVuuHm956HcZogWAiNOevNI3
         l88UE0zwJctPlWRlFKXvY49Twr0B0FteViH3y+xhmvRvF7lo/5g6zScnD/ZF+JHFkx0S
         H6PvIY7TinXYGLC9xUgW986lKMQjYYIemCU4Ebbb46V8fevaLiZdVskWBWN1AdYuf/5M
         F6jivH8TxHn67KMK//9LugplVMj1uxSKggCcyZJ/DO2o1VLpBLKWiw0cisu+t6Y5yN94
         TaRBm7RYp0mtaIce9rLFvA1MWQ0PxfY8YdAx6dl5iLk5CEaRYVt1go75lFj5Qt9eb0CM
         thGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790436237; x=1791041037;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kwRYD0lg3ABAu3cXBo8DfhKih+wg0SWi0GfEDlQ7sK0=;
        b=h1PXEeCSFcD3wD3GIcz/jmG6jMeGyGYZ9PIk1pZQudQYtYrRPBGsHF6YEKBz8lIupg
         aOf79JMtO4TZAvRK/o2eehOhyKrF4xZTKD65tskaRVE140RMBmKJHQO0G7h1UnZ40mX6
         vf3PU0bvFy0b02MMf7nlGv0DZgwr6DKwpUl+WuGjDLv7zcvHCly2upI4OLdrMaMtlJCv
         pYxaKTkSnNhzqzbnG1+iEy9jUn94Q2PwgudRMS+/IUrx/hprLq6EHxR3tW+VmEopIDSq
         8pKhGs+P/OB3DREgcyMeFzCtzzd54aIqByzVq64fBQukCXhPQGnkCZQeRfFbfSsNVrHz
         BFVw==
X-Forwarded-Encrypted: i=1; AKwUvBzgnWoamdPeGBP6q4ZQsqJzIeqrcETLmyD4cEIrDV82CmvevkATWWUJkFV710m28esd0IteE2h8Hzac4tQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mPSpBadu7hpjZKapVhmi9CD47/mx/QuJnX+/pEy9KbWnYpSUNU
	9yRuTTnRNAfVgZvsJg4wSTjzlpj/vROp83tSla4GSmjcufbVwo7vzwbAXbcbYrJxTcd9nsFPYVR
	pPknrUevJjUbtxeSM5l1nU13zH39u2b7/2ZNyTTowW6lCSLzgKp/2eaATzWMBMvC+Ulixiszo20
	ec5XVoc7RdDcXK9e+fetjvRIJA+h8oUjl8dmglGb3mvg==
X-Gm-Gg: AYBFou1De/w05Q/dx4V2XwO7k1pdsP5KrEChL+ccuQQmzUPh0kCiSHajEVWH1Fweej6
	t21suNtrv6Or6Z7t8J2XSAck3jYbRMTaK08UKrutV6Y7U6FGmI8EFa3Yvux97f1X1eQXZ7vQKpl
	Mtl7iJYWPUlpXqCGPE+fV9PAswE3sCwO4NMEjlpY5P8OB2JuJMrb/CWV8K
X-Received: by 2002:a05:6870:8125:b0:48f:e107:9094 with SMTP id 586e51a60fabf-491ec0cb354mr8222527fac.58.1790436236596;
        Sat, 26 Sep 2026 08:23:56 -0700 (PDT)
X-Received: by 2002:a05:6870:8125:b0:48f:e107:9094 with SMTP id
 586e51a60fabf-491ec0cb354mr8222516fac.58.1790436236156; Sat, 26 Sep 2026
 08:23:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916175738.2089950-1-vulab@iscas.ac.cn>
In-Reply-To: <20260916175738.2089950-1-vulab@iscas.ac.cn>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Sat, 26 Sep 2026 08:23:43 -0700
X-Gm-Features: AclHuK-MO8yQtGnXizwPI78LElvu7aVM2e5_m4tfC0oKEkl4LViWX4O6Arj8prg
Message-ID: <CACSVV01+7xbVKDS1SOJOpuAw4WojvxRa25fUVZZT6o7hVcNOXw@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dsi: Fix VM leak in dsi_tx_buf_alloc_6g()
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: abhinav.kumar@linux.dev, airlied@gmail.com,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        jesszhan0024@gmail.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, lumag@kernel.org,
        marijn.suijten@somainline.org, sean@poorly.run, simona@ffwll.ch,
        stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI2MDA2MSBTYWx0ZWRfX0rrXQQRJInBp
 JXKKOQyNpxG1Vf6eD55tKKRc14Uwpth6nCooPTT1QI/egeW29YNkstZyL5AlCZtUDfmh2xz4wNi
 TermoHMf9bHNXcPH0wXqzGrn4Sheo1E=
X-Authority-Analysis: v=2.4 cv=d8FgWhjE c=1 sm=1 tr=0 ts=6ab7e38d cx=c_pps
 a=CWtnpBpaoqyeOyNyJ5EW7Q==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=TGumlaujzOIqipXuJGIA:9 a=QEXdDO2ut3YA:10 a=vh23qwtRXIYOdz9xvnmn:22
X-Proofpoint-GUID: 7xWe3CCYMxCbtH4RtaNHBlIdsAWiNbSi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI2MDA2MSBTYWx0ZWRfXywoF3xkVF2PY
 7OLY7aQSgVKqMlzfBqUUaXVcGT1/TBeUhRepvFAquYNbuEAglQRtpqD/VNejs9J9nQsfaF1jkJi
 SplweSAmSKsDjY7v5+ONx+thOBb5bzL1SwEyIyB7YFQvkxi1j8TtQHVcqoUKHQuJfRio8YJokGC
 TG6fjcRw+gOL24G1ZbpTlOy2AdUozBjswnOstsjxcyJsHfrA+veXPt0eyflLiELl3eF57eH1V5i
 1DVg1yALSx5ZWUhwX8Wh+QVJEE8ReCsFURuK9V+vdHq/kshdiN/BUpfESSNzo5nen7knS2xyV6v
 X5T4EyTgN33zvY3OTy+upMNRc7qQh7SJhR0Tz6zXurupiAPzHsIDE1M/WvtVEHEKyf/bMu4qpTG
 CwYoBA8ZW+JZ9A37aJYChHK8LMEStGZwf2IRWcbIjrV7jrCD3v8oMiggesbu/boZtkMemwpSIcS
 6eNyR7oaaibU5rtoMyg==
X-Proofpoint-ORIG-GUID: 7xWe3CCYMxCbtH4RtaNHBlIdsAWiNbSi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609260061

On Wed, Sep 16, 2026 at 10:58=E2=80=AFAM Wentao Liang <vulab@iscas.ac.cn> w=
rote:
>
> dsi_tx_buf_alloc_6g() takes a reference to the kms VM with
> drm_gpuvm_get() and stores it in msm_host->vm.  If
> msm_gem_kernel_new() fails, the function returns early without
> dropping that reference.  Since msm_host->tx_gem_obj is cleared on
> the error path, msm_dsi_tx_buf_free() will never see a non-NULL
> tx_gem_obj and thus never calls drm_gpuvm_put(), leaking the VM
> reference.
>
> Drop the VM reference and clear msm_host->vm on the error path.
>
> Fixes: 5e05be782645 ("drm/msm/dsi: free TX buffer in unbind")
> Cc: stable@vger.kernel.org
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>

Reviewed-by: Rob Clark <rob.clark@oss.qualcomm.com>

> ---
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi=
/dsi_host.c
> index 982abaaac00d..29e0de0e0c22 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -1250,6 +1250,8 @@ int dsi_tx_buf_alloc_6g(struct msm_dsi_host *msm_ho=
st, int size)
>
>         if (IS_ERR(data)) {
>                 msm_host->tx_gem_obj =3D NULL;
> +               drm_gpuvm_put(msm_host->vm);
> +               msm_host->vm =3D NULL;
>                 return PTR_ERR(data);
>         }
>
> --
> 2.34.1
>
