Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.145.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793244459;
	b=0/jkv8mH55+DF0OqevhLWi//2ADIY+4vVt+RpLbZ9u5mgzNmdwlcKt+k0llwMw96jat6
	 IDjRLoxSCOAh5nJa9gilcb6HWYToAUgD+YJ3BT4bDoHS/DTnUEY9qhaM0xibsuNmHPoep
	 nVsdmMG40VwC89YdIdOv4Y6IdasGpXrOyoTs3fkC2XtlXWrxVK1cvZeLoIIeUG+of1pG1
	 7DyKVP4G31ngPI2ZufZu3dMYvdluO4Hr0LJg+2m53ubjKkA1k/eCtQLioCbBs5LKsJ/ha
	 1LV1nv3hsJGKYhhAF7T7LyHX375n0crnCxowHCb/Weo9LFleE/RANnHfShjP6AEzr/Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793244459;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version;
	bh=0DjsjpXU96UP9kDusHJgpmPdkD8cLQUHrfge/mnRBFE=;
	b=A/sSMQR4i6T1FZZAgQFKyIyOJYTIxG2txHqvJ8t/pnjSEn3qJ57Yv54//SUWD84josJ3
	 kq1PuZ9Q+ZOZ1Ykr8gDyWPmHqcAb8nETLC5X5wxHHg8lhGzmsrnELciBmQP+l9w/2vjho
	 KsTwXcqyyORBg7sIne9PIbTLtKKD27JOpSzVPcuuiZoUlJqh1WaBG0pHCFssw/qyvpV1Z
	 8ydU0sJ3U0AOV76EQLLDB8QB9WaFiQT4wNs/vWnpSAbiav0L6X9wnKPTogAN+tg2Xq5jl
	 86C3Dn1xEwoJNcvnnYUrAxGJJoP30DG+Brp/bneKCF3hOeQ6tv9N9Pv0AF6YnxetLJg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=gmSxhDFw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.145.42
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18705606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 03:27:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18705606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=gmSxhDFw
Received: from pps.filterd (m0044010.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T38UMD2204151
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 20:27:38 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pps82601-s2048-2026-q3; bh=0DjsjpXU96U
	P9kDusHJgpmPdkD8cLQUHrfge/mnRBFE=; b=gmSxhDFwHSvjFfh3grfM61H6IYl
	/+Ns3n/+6o8BFC6o2G1GzFtYw23HbA6l+EpCNLDr9pmO56yEGTYp4GlY41fcvnw7
	7YsDSeNG9PCpxfL+ESWZH+QcFRfov2pfCG/7pfgsl5czd7OimMkuoAB89+OmRojZ
	QnqBaA+FJLPouNC1oia7VKdQTjybhJSi/uQhjlKFhWfWgaib8ZjHUSwVuuaekVvH
	uWvSyIwGRewKHoBV2Qf1OVEsWPYIZIGtAlh19aeEBvx/2OW2Zj0oED8wpjHcOy+7
	5RP+qo19y9FifMRm/HXv0PZKOl2tiFANfsyzsKf9cJCSs6wEl4A/8CRpkrQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4hkuym8mq6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 20:27:38 -0700 (PDT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36637676140so2447254eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 20:27:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793244458; cv=none;
        d=google.com; s=arc-20260327;
        b=a1S0ylGPLj4LULQrSmlwAlFThKLsqYJ55NBQGg5uzzR7fYsgEFrf30j/INyANGVA06
         N6ueuxbPJ2Af1XEsyCkQ5ZcM/L5e2Wq4UT79ujop9xacPyRwMKL5IjkIKvhnSOKjwUZZ
         oq2ba+/nJ9PMyVx/BFJOgfQDPHWSDASaq7QH0txlrfQQ/uLxytNlBWHmEvJ38OwqPKHp
         3TQ8LPuojfw9TSbaiDphvG281Bqz2LfK3NkYm2bSMI3SqPIqM3eRYq1cCfuUVtd/Xt4a
         +ZxFyOl943/do/qqcf6U/41NYMuBnQDQqld7gQytg/hudOoqLwVPZ23vW10IPa8c7zIq
         MeRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version;
        bh=0DjsjpXU96UP9kDusHJgpmPdkD8cLQUHrfge/mnRBFE=;
        fh=6kieV1w9VU3kAkF189DmUtYCcl1B3Bb2i01P95KnmnE=;
        b=WLG/33pkop2V+MY3iRhEFnaGMU7ezU+opaEpv+vwnCOiHYBhqFWMLOsUrXyduXAO9E
         Gnokupe2h4CYhFgxd3ivqZ0ttnFojJf5ZZj0kUS8xGmWEXHF+2HnXu+RjU4jYtGga5/2
         zz1jQLjFtbWh4GYWh3nzNBhfLeJ/kx89k+PhBuambsOoHjAg3Hm1Gf5GpCn4m9Bq0uEo
         N5EWnDH9MdPPjiOicfewTZlOfmSEgKbdjczmtEEHnAappBNxIjHmtbKMg8ErczI386xX
         5ROpQbhn8GCWLCQXae5VBXBWRF0P3LEnKY/t8ixXfA+sJmqgX72za721n1NmXj0eTSC8
         bzqQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793244458; x=1793849258;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0DjsjpXU96UP9kDusHJgpmPdkD8cLQUHrfge/mnRBFE=;
        b=ssItLnI+mS8VK8mwjnAjCqJzH60DYEIxnAWSAc9Di1RzvqEXwu53xPZPIDn/3NqUac
         md8ZnNDQbVvadDxgpKMAGhgolzBwLZukTdoT2TQFHYujTisfAV7EEFTF2cBXNVEEDCzR
         mqonGhCR570DV0CpZscjtaWqp0KLKthsmS/k52JKWvayy76J9p+z6QouzQvNsoLxovmd
         Z+8zwMcRTkbND8zhr6XsK+p7UE4qwfJrcZkl3N8YHNI9UYw3lmNpZ/sRqrZ/fzeZTPqP
         tAOg0wLVxBAM+gZDETp+5nyhq6KsQhzQJgfkNhtlFc/TspH7DJkLY4VeCPDL70W215gH
         KZpg==
X-Forwarded-Encrypted: i=1; AKwUvBxmuq9PXOVFVRwqii8y9WxY8Aaas2DcGsEW4hQgrygmDWZikYfymz04fsKTKU1iLMr0aRyYimiQJzTwE2o=@vger.kernel.org
X-Gm-Message-State: AFq9FYIp42a2cKdR1CAwXGWwbm2On8GISbMJ4mvw9yu3ecRDXsuCQFWl
	saESds2gkx486me5kKtRNFPdlBvgy+taLgTtMlaaTrBAmSXPMmT/84DGJO5B0AX8SNWR0/fZH1y
	1q0iouVp7kzC/m8S/MOMS8nknSer6Y28m7BBqLachBvTMbUEM0ID+zEh06Q2MTbL//LgoLWni+f
	5xV77VowAd14QNmGEvBZeAhmzWd/R1JxDoLH8jPIs=
X-Gm-Gg: AYBFou20eqfuKW1WGXiQ97Zq3qaj8B926crJOYl2JhFILAEo/NVNLGT6mbpzmohtgO9
	x5Rgxrkf4QvgPHE82e+7sWMFYf0/qxlBQkCFotknubOSnZIyyP3DqnY5C3FeXeUraxzSaobmR4C
	XztnNWFx9cH7yHokXR0JdeDfdw/iAQYFS/ntYiQD1FWlvi1ZalasOejx8=
X-Received: by 2002:a05:701b:4203:10b0:143:3c9f:10a6 with SMTP id a92af1059eb24-1a6c9af1e26mr5876949c88.4.1793244457351;
        Wed, 28 Oct 2026 20:27:37 -0700 (PDT)
X-Received: by 2002:a05:701b:4203:10b0:143:3c9f:10a6 with SMTP id
 a92af1059eb24-1a6c9af1e26mr5876935c88.4.1793244456694; Wed, 28 Oct 2026
 20:27:36 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026201101.3915217-1-leonming@meta.com> <87se1qhvz7.fsf@igalia.com>
In-Reply-To: <87se1qhvz7.fsf@igalia.com>
From: Leon Ming <leonming@meta.com>
Date: Wed, 28 Oct 2026 20:27:25 -0700
X-Gm-Features: AclHuK-KIZ_96J7m8EUFsiyjK1WGV9FQATfT66Y3r8LemRe76Zf6qMGUQGEgGVU
Message-ID: <CALJ5FXmnb0QU3KtmE-0ieX1ApTSMG0gZ+Hg-TSeG1G2mLd1itg@mail.gmail.com>
Subject: Re: [PATCH] fuse: set dentry epoch before making the dentry visible
To: Luis Henriques <luis@igalia.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>, fuse-devel@lists.linux.dev,
        linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
        Joanne Koong <joannelkoong@gmail.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: Ny2ltRt8nX-Uf8TnaIug80yK2eb41WoV
X-Authority-Analysis: v=2.4 cv=DKEacCNb c=1 sm=1 tr=0 ts=6ae2bd2a cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=8elwO82fXORLTBIkMd32:22
 a=V2sgnzSHAAAA:8 a=lT1PLGjMyznquQLvSy4A:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22 a=Z31ocT7rh6aUJxSkT1EX:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAxMSBTYWx0ZWRfXxT0/9S/jcDat
 Rm3N6wmk8b1wn8ZtTyFnxE6cmbsNNNU+4gtdg08W/HZJx23vLqjeLBTwggukPllF4HVhj/EwMKM
 AXoUvv9l/9q2nBiEPMSaJQmxw4FhOd8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAxMSBTYWx0ZWRfXysHJOBS3ekA9
 yOg51AuUV80K6pFoTt+rXsfA3g+HDC8CBfJe1AQ9gmca/HwiuA7ux8d1sUApzIn9kKAZ6+ouphG
 frLfd7ZMYLC1tLIIhq/AZj5VOlKqmwtGk0p2Zc1fl1Eaw5u8ivJHLZRfmf4nMK7PKZpiXXhIElK
 7rBPoWoM7mTreYOZXhxRZWdYygWG7iUIonkzeaee3bafxTAu1zfJUtP7rWWwY9kDKXqYvbE5rE8
 mjV2MkRNz3m2VkSRBZ7giLaEFHydHnKdRyn6skZRfp3RcW7rFN2EYfzX4DwOLgYuppuxO/j756F
 Cp6DzQV5O9VTQttjnNuuKAaswcWEXqpT5+x+CDgvPM63mi8NSpZ3NdprtwcAGsNED/04WiqY2hT
 z7FBgxXNgWu/c2WUJehXHE104htVqYjKe14YLzH9drKzMMVXtRvmUdXNy+zhmu8JfX3MdWStiew
 jftjkzsEQGKnY0R1xTA==
X-Proofpoint-ORIG-GUID: Ny2ltRt8nX-Uf8TnaIug80yK2eb41WoV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_01,2026-10-21_02,2025-10-01_01

On Wed, Oct 28, 2026 at 5:03 AM Luis Henriques <luis@igalia.com> wrote:
>
> On Mon, Oct 26 2026, Leon Ming wrote:
>
> I believe this is very unlikely to cause problems, but we're slightly
> changing the behaviour here.  Before we were setting the epoch only in one
> of the dentries.  With this patch we're *always* setting the epoch in the
> dentry being looked up, *and* possibly in an alias returned by
> d_splice_alias().
>
> Can you see any possible issues with this change?

I don't think so. When d_splice_alias() returns an alias, the dentry
being looked up is never made visible: it stays unhashed and the caller
drops it (__lookup_slow() and fuse_direntplus_link() both
d_lookup_done() + dput() it), so nothing revalidates it. The extra store
goes into a dentry that's about to be freed, with the same epoch the
alias gets. The alias itself is still updated after d_splice_alias(),
as before.

In create_new_entry() and fuse_create_open() the earlier store only
happens after the server has replied and fuse_iget() succeeded, so the
error paths don't change.

> Personal preference: I'd move the other fuse_dentry_set_epoch() into the
> other branch ("if (!d_in_lookup(dentry) ... " ).

Done in v2. One catch: the alias returned by d_splice_alias() in the
other branch also needs the epoch, so v2 sets it there after the
IS_ERR() check, as fuse_lookup() does. I added a test for that case; it
fails without the alias update and passes with v2.

Thanks,
Leon
