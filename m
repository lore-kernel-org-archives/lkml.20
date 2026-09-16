Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 517BD4A3F2F
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 09:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789551410; cv=pass; b=gV+mCcfLfLD84LKi9LJKE0ZVrK1btyovU4D9YaomXWV4AUjQz2cUPj7U9tvTEyDnBhtHLCXp+llXJqqE7mTAfp75lVa+2YKrrxn9jCYZF7fv+7usBQk1dKvQo9AG7MWP5HdrWG9qLI8NN27koS0aOStXWVYreAnQ7Usv/ahltO4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789551410; c=relaxed/simple;
	bh=c4DGMrBsMajbdwdD2OhI60qkY8BD6VCk+Kt6O56KwVg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iLcJPGpLnx/+lv7KksHe1LDmU8qfJmZyLbhM1LUyFSnY1bJ8BNzkVZdWatojtxe49VzOmQ1eyDVEtLnXpP35ebnMObJJb9wxoolzlVpO7rhjAnBj6gnVz7pHVzu9CD+f9lIHEbOeVfk0teGK5WoXp+pZOAfCMe4V8yi5cg24wHo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T5b7xWUy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YnsH4PGQ; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T5b7xWUy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YnsH4PGQ"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G92vp11721223
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 09:36:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c4DGMrBsMajbdwdD2OhI60qkY8BD6VCk+Kt6O56KwVg=; b=T5b7xWUyo3gy4Mx3
	20mskpuJTgh7bxXdtlpKH51GqGVtfIjbL2kmUuHDlO0/r2MIShKC4HSc2oNWzVvq
	YBHrhSJ7opl7EvI3AqgwPZMM5eFcY9xL/ioamRPTxFIoP1pt50KDzIG4xaM3H0Kk
	sbd7If46Re8jAC7MEer5wfJkYyCgoBSygZdwXyQunmM3W5uI0oG9mgWNuEI8OVnN
	0+m2W04sMDI5vG7dMHBPQ1ZvBpUIX1lR2zAaXZmWVIVdJvUyJsdOh9KVGw92rQDh
	X4prYTP/uOmFbD8xg7RZjryF5cgIMV3psY9wdCA1Vl0fd2wpAxdDPL4ZxvXFsPzV
	ZV4vuQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqbmnk49b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 09:36:37 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2dcfed75f77so81773875ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 02:36:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789551397; cv=none;
        d=google.com; s=arc-20260327;
        b=jZXlXE107XrMcIK0XH8KvV9OsAcQ6MfJ0B1uJD8nblY1RHuqODK/KdUNvUlIROB74O
         kLhItM9q2LZrUht+RXouVjN82BEJfI60iQqwoxXh7hIiHvXQscv1sQ2luwS5xE56oS2A
         xb1u1CJWl13bFCKtFJypbZV+CtOODG46gT09syCvLkOks5s1kb8IYhpK6DEGTGBNoFqO
         5DlTrJNbL3pr8oO80fAUw0Nc7S1JxC79BfciS1TNcVKlPvzCzeqqUPdwydq/LQ2IIRJB
         PAtx3Ui7q4AnGKxp7LMHVXdatJa5nDiiZCGFlk5boC5xFyHUqfw+V17cjipQBSNdNE6j
         ctLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=c4DGMrBsMajbdwdD2OhI60qkY8BD6VCk+Kt6O56KwVg=;
        fh=uWGgPykDSZlZaPVHf+uMUrtD0o7ghCiAbiVXsqmhbXo=;
        b=G5Um1Qxj9FB0bL4rLHenTFUODqOXTWQQUOPhbjYVoUTh3y8n2v8glnNV0mu/6S1kII
         8i22pc920hGqWmicJxdBbUCTVEnWD8eYSUaJU+qj131uoKWfgDI4rCjy3STsH3JOpghr
         5IU0+HKlVJO+SYwgt/qsnPrQi+sg6qf/VRN1kv8E4uMHbmuhHsMZhOScin+sNR2hqxsz
         KPkfQrKqw0CeAJwdceKxPd5bvCDOOkRKYiAMsm0rBT8oTjq1fcc5HQNn+SmCQJZWCDAG
         rjQzxRbUezCakSS9qQM3c+P00c88GcL15tEX0zegto+N+o1CV3sfhgwxzC41c3H80gWA
         PLRg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789551397; x=1790156197; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=c4DGMrBsMajbdwdD2OhI60qkY8BD6VCk+Kt6O56KwVg=;
        b=YnsH4PGQ8FK8SC2O3Gtd3XIBxo9J7lh+7RAzsQugHRm9Pwp8mEqfoyQ/2l5ccfj/1/
         MUMjR7e2DPQL4ulmmFT6seT9ars4q/gG/iyxuLFK4Q7y2yCu9GylLolEl/Wg13ctViFl
         0CHhX9pEQTFPl+mLMg2lu5Ri1NricY006Zb7H7LZzp8cMgF5qn9mBwKJWa1DLvL6xWSV
         7HsEAogngSGN50++4ypbzZOqPSwbKC1U6x3Ozy0LXSR1cbSYOYclOmrReINlA0YBN6PH
         uauzWFmNN+Qk1pyhdnjC/HQjFy6X/yWJqDUrkuqZaFFDhchSOpiG4eZOm+xBNSu/EnzO
         oxNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789551397; x=1790156197;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c4DGMrBsMajbdwdD2OhI60qkY8BD6VCk+Kt6O56KwVg=;
        b=xG8Sipmp21eRPhknCpQPQ22PWY1uwcdzu9qvP0JcEqrl2ct+YY0xeTl6FftryZr1Tn
         EW9rAxYovedC6wLbt/Aigu4qPZ0xosFwylauaOZN4iK4gha2+SMQwtYpEKhyHRfx2gyq
         T4Vj1fzS98D4n2XYgiImCIQfraO9lvyqYGpnEG7GB99drt3qF1sQYiN3K6Ir5C3W46I9
         bJD9fXClW54deB7fU6WQwAsjfmSoJD0M1r/vzyCeOZXNLr9wavu/h6Yxx82dHrh6vc+i
         gB1F6o6oDTO7Qy4yhDL38TIzTFlAASuAuOOUKhC+WFFm5vYwYoekb2AjbE5Hy4oEAc10
         nRIg==
X-Forwarded-Encrypted: i=1; AKwUvByW40vGssWNXweewMHCmeKCJzkMPmVSNCU5UMMTwdq6vXuNH7K3T8sMlGJQFZevwisCptpxDxuW1Udm+tA=@vger.kernel.org
X-Gm-Message-State: AFuF++l0T+S7rsIQGc9cXsas1Et5yrYESazxBuKNwm6mc+2issiTwxVB
	/2IzoSVmb0ycGmEa+/9zA4GAcgFqYj1zDfyCUHF1YokZVmPQusRbQNtgqij1QkyLiwXwvvU6lep
	GVldS/Qf5vFcXZ61ZxpE+bACcSsn4sOtm5oFxkVmSEctJd2oEJLNhWCxuyl8ZevRu0N7AsfJ6BA
	IhdyvtM1NeOtOwwAGpVlpm5VLdIIX9+/KPLEhFSKI06A==
X-Gm-Gg: AYBFou3zclHko5sByp4+e+wt5Sdcjm9f7Hp4GMXZk0FjR/c/+7QNVNzFz2sUFpNatIi
	APYwPjxTtZPFwOLYvLKJ+avH5uooAWp7Fl8Z/JZeSghHnbjmKflLXMx1Ndbm5pJLfapjK9/DAHP
	ZLJrsbTmepVwMi186yFG/niQZWE4YGCGqdYF9xHqaRO4/IgzMKhDkfi28vEw==
X-Received: by 2002:a17:903:22c2:b0:2d9:3083:a3ac with SMTP id d9443c01a7336-2dd8e52c3aamr36286995ad.15.1789551397187;
        Wed, 16 Sep 2026 02:36:37 -0700 (PDT)
X-Received: by 2002:a17:903:22c2:b0:2d9:3083:a3ac with SMTP id
 d9443c01a7336-2dd8e52c3aamr36286545ad.15.1789551396701; Wed, 16 Sep 2026
 02:36:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915132052.273212-1-ulf.hansson@oss.qualcomm.com>
 <20260915132052.273212-3-ulf.hansson@oss.qualcomm.com> <aqpIl5NWCFiuKy9b@hovoldconsulting.com>
In-Reply-To: <aqpIl5NWCFiuKy9b@hovoldconsulting.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 11:36:25 +0200
X-Gm-Features: AcwNN1URMFDti_qG_vPpRruVZwp168EX0dKhlyzlmVzuq_rdnS_nPLrIHlUnh0s
Message-ID: <CAPx+jO86Sy+of41dw3Gi5CNfyc5+iOyDU4CZypz4YGzG27QW0A@mail.gmail.com>
Subject: Re: [PATCH 2/2] mmc: core: Turn mmc_alloc|free_host() into static functions
To: Johan Hovold <johan@kernel.org>
Cc: linux-mmc@vger.kernel.org, Ulf Hansson <ulfh@kernel.org>,
        Rui Miguel Silva <rmfrfs@gmail.com>, Alex Elder <elder@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=POyaavqC c=1 sm=1 tr=0 ts=6aaa6325 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8 a=NPqBZDST3jB2sRw4lm0A:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDEyNCBTYWx0ZWRfX3dvJY0PevmaO
 RcQHdyrjVUobjwfGKtySUS+hBKDUWBk11NdhfZm0iqyXLg3Gy9F6vY4C7MpXaM8vRthwPROK1nj
 p6/GWy7uMIoGfk4Soew/nBjrsT3Pqnm8UiW/zYwm7NGX/a5LxOaNM17e2RAOFhhTxAdv6W+k7nf
 GzEJ4I6n5Uu1D52pT2bSXMruaAAhFEH4jIWxpjXT+ryUBCGe98uHraLishR1/3jJqTowFEVT2kn
 EwDFnlOb04Oojl56pmOJm/qCnPUajymuHjRJatJFUOKwSaAg0aagemhD0obPJipRBR7mEWBPnth
 5n+SdaaGk9G/h2sin05L9wd09Gsj9dauuHKsQZe8fWYg8FHjyW/zQEz2lQ7ujPc8v089McWrfAK
 2JODIuYk5Qq3Iz+HdQeSRki0YU/ebi8kLDL4IZj9cipPxd44oOcVgZpnUdalwHvk04qRWhCOYHK
 f4PDZpmpi3XhN/egfdA==
X-Proofpoint-GUID: hgU6gK765V-pmJ1m--Z0OIMKIUx_caTq
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDEyNCBTYWx0ZWRfX6mX/f8a/yomr
 c9b8dddskmJIcjMw6Yy2T2/PLKJAVxYZ1zr0DQUbZ+z00fAGPiG9eimjDpsGSfcLyg+jJe8Dx3S
 uMPpUfIdbJB7KVP4trlLJn1mxNmyQAs=
X-Proofpoint-ORIG-GUID: hgU6gK765V-pmJ1m--Z0OIMKIUx_caTq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015 phishscore=0
 suspectscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160124

On Wed, Sep 16, 2026 at 9:43=E2=80=AFAM Johan Hovold <johan@kernel.org> wro=
te:
>
> On Tue, Sep 15, 2026 at 03:20:46PM +0200, Ulf Hansson wrote:
> > From: Ulf Hansson <ulfh@kernel.org>
> >
> > As there are no longer any users of these functions, let's make them
> > internal to the mmc core.
>
> Why would you want to do that? The devres helpers should just be simple
> wrappers around these and sometimes devres just isn't a good fit.

At the moment there seems to be no need for them. I would rather keep
API/interfaces as simple as possible, so I prefer to remove them at
this point.

If we see a need for them, we can always add them back.

>
> Especially with the work cancellations present in mmc_free_host() (which
> I have pointed out elsewhere should not be there), a driver may need to
> free the host before tearing down other non-devres managed resources
> during unbind.

Can you please point me to such an example so I can try to understand bette=
r?

>
> This may even be needed for greybus which currently destroys the
> connection before freeing the host.

I looked closer at gb_sdio_remove() (the greybus sdio driver's
->remove() callback) and I think the problem isn't about freeing the
host.

Instead it seems like the call to mmc_remove_host() is done too late.
To me it looks like when the mmc core tries to power off the card
gracefully, through mmc_remove_host() the driver has already moved
into a state where it no longer accepts any requests.

>
> I suggest you just keep the non-devres interface around (after updating
> the prototype).
>
> > While at it, let's also flip the order of the
> > in-parameters to mmc_alloc_host() to be consistent with devm_alloc_host=
().
>
> Johan

Kind regards
Uffe
