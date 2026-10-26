Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793046524;
	b=ux5cnaWHdbLPYuWSlqg6XwKOcuRVT3pHlEEapQFofHOm1Hkb93aBpCQPAWwtEfzaVUm7
	 N2Lwf4+t//Bk+i6s0+qzMxXKln08/YtUtjDSJHGxbNaj6YXoNm34oaXXkx2yPe5UFM3nK
	 QtvFAAnqJ5RpfheSYtN6s0aJnLPcrzTB/hnqN/7ea4wP5o9Pv7PHm/Ged7+Lu5iHE1NBk
	 jBblhd2WESDVAP0JvqNyCQXyGA/TyTLSEaQptNTAB7o5bkDnPpNMTXcp0Z72jhF16xzXH
	 IaeAT2V/OzQe2B3ezdX5Rm9vbcvwkPdOAe5s7SNFvKzyUAR9i7UUM27ETIVS7fPvcyw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793046524;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=aZiIWIK4zs06/5JG/qnDMkk8BlPUJ9MuP9r4RH/bdYw=;
	b=EbZ9iNQ24CGXpErF4QY71yrJn/X9EQYZQJWP2EOmFJZRazHB/1YafYo8jS8Hx7lNIGt+
	 vtOLNZQrNTJkHd5gZF7PqDaStertgjwaOJ1N28wWIb/g0X+9h+YDDCsu+dfByiAgAzTuL
	 efpnE0dn/92B5hbyCHq6B+m5t+uL0sa5XYTl+bVYSHEDNKH4UnUVvhqEA6Z/1wV5iDpSw
	 gf25Ssz2lC9qt4Qvaa36kcQe+QFHPVmlGd9Q1lOj4O4Wdj9WDbZwu1+y3LKi1N6SY/Cpb
	 vZ/Nhyd7mP31qtCa6gxBDAlOZ2idhHyyjIWh3kdz/UATmbDPbxHSkY0Nat/xvxbCERQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Lya3k4jE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.50
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BAC0606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 20:28:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BAC0606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Lya3k4jE
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-679aeeddc6bso3865692d50.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 13:28:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793046523; cv=none;
        d=google.com; s=arc-20260327;
        b=gyiXbJrs7pZpgJj/zxpP7ZtCnumO1EOrmenjrVk0x11L4pX3Ub3/alhxhGyqw8TJSO
         qpZepX+W8qRrui7n3vN8Q+obZu31M5mbkvY1H5JAcI/I1YBXlq4r70SpPI6Ls6hT9zJJ
         huN6zvR6kywxZrPpV74BC534BBInTVchVh4fygcRmgSasyQEPLgds19uj675FoWMGIsS
         LGC0HB0QIQLWQ8Ilp4sA+ojc0ncQdiwbpSvMy1VTmPW8CDvmcAepBrwLFE5BtMTc8Skk
         GQSuARwuFzajPwxMqXUw8N9FN+B3K0A/imCP2F4yiMmzwfF5mAlt7fCL4RXBx0iOKxwk
         DqSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aZiIWIK4zs06/5JG/qnDMkk8BlPUJ9MuP9r4RH/bdYw=;
        fh=7Z8r5CBlvWT0tYJpJ15fb+tcqMNyYDavSSQ3Mo8yOkg=;
        b=YYLc4DhrWeqU7xb21M6QLJK9pcs0o3vhFCR11vBjQp6qvVskGDrPahlVDg2vLzbKv7
         9ghr/1ZPkc8icDBej1ZnvZQHX+mA4PqswaoG4jWN5QSSqimjo4YIfE6/LOfH65s/z9oz
         jpSN7NnPtNHhb9S/wngvcUCO83VHEFO2vUmrl2DP6jUTOo1Q4H19CQV1u/mEgzMWiYBs
         8zEbAXhdE3+e0/WXjF+lVdQK7PPepP8G9WUS8eHh0MZ5VY7vEh6xGWmvgSc7Fbc9HASh
         XeESKkVBl2UqW+fw725IRDVRLu0GaA73T1LOw82maIJ7R4WjlVjIHGG2eh+Nr/GgRaSd
         AMrQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793046523; x=1793651323; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aZiIWIK4zs06/5JG/qnDMkk8BlPUJ9MuP9r4RH/bdYw=;
        b=Lya3k4jEbl/FTf4+vTpBofsYgGte7HqtPiMo/wSQAdNqZ7b++jGY2JvM4xPVztVjmc
         L/hwVMfa7dVzxtl4nhEleO18d1RfWWMSJK5tg18K9w+shmV/fL0K7M/xvIHPw7GRzoCB
         97KkQxhHtKH06EMUPjwIkmRItrgaUo8Tt8S7RIA2jDAigb+m9O/6qG5t+e+mgEtDu503
         MNbjbZncD62E2Daui80IKNlCEXRAUEC/NIge4yWnxBTZKPDYuc+MI9CYlMW+UloF+lvc
         nR9kesdD/l9mOVw0cIhumt7/rCWgVK+Ykg3kQep78Fiu5jfRPWXlD50n2ZJQ8vmECdJ8
         xjAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793046523; x=1793651323;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aZiIWIK4zs06/5JG/qnDMkk8BlPUJ9MuP9r4RH/bdYw=;
        b=MZ/VrrQpWw+VRprZJkwqfBwtFBK5uFwHV9tm7Ws9I0tRno1V1loEbun5yoO7PoYvIj
         3ybNek6onXbtQxRQ7WoFWKg9X9ZM79AyjqaA1lg7Af2ix3rOTrz+BVL2bcBsVXLI+Ayf
         x1ZTVRtJFts1/CMBconWjUCYyybvFgWFL4uMvGUOeZbKiCu4ueqw4a6CZFARztc6YMqU
         99qCJajDqIl8Oj5hxA/gIzVTzHOhxYWlC43awSoHNPcnALOUONKML/IHpmyc274S8TrG
         MZbxtIw5S4hEeeSEI8keN2sOuMVY3oDRo0ACp+7SIAwczAn7Ud8xm8BdH6jzgUt7F/OP
         EIXQ==
X-Forwarded-Encrypted: i=1; AKwUvBzanZuHka/U9Q2ZFENvS8wfGQQN99PzVHa/yuO07+fmO3c13H96ybbxzz7eDrjvVoY+yCefl7Clo8W5AMk=@vger.kernel.org
X-Gm-Message-State: AFq9FYIT+mK86QQGVkAp2SMxzjciF/lw6oFoRu0gOOVHF6I1JJ/WOnOE
	+55yD3geoMH49anQsAstuocXtMKVLt41P38qGqos7Mc1rkZQ4D46g97NcFKaq7zi7EfjgXJixZw
	IHHuNyyyA3nQU0skW6CiT0yqfX38nBTI=
X-Gm-Gg: AYBFou391skXG1L4B1Vn8DMpDuw47t+qPCuDNnDXNftGY3nceiHJ/TjtfCN3rlZ+/qu
	yEcAqOP/T7u63kpiihgZI8cp4vRxv0WMeHpJ4qqB/y32N+WopGfWrPJmHucLgEIusLoWG1WcOH8
	5SbWggejSz/hkTac2IlVa2mFJhf1cklzOv33inz8mOX+qbNexqFPFd827X+H8CSZCkkKmjwoMFw
	sPw1jRky/VSnVQGCKux/lX4Vvo5HsQS7QOW3yZoSv6Ygw27Y/3bJTtNrhPeHBsvUlDeWh3vqAg9
	R5b0GozIZp6MyICVqba1DeFzTV6a3GMzHK1UpuvuGg24KPXq6k8W0+LRTWMsSTICtXr9zLvT96j
	FcfI80UJQdAK34c538BAGh8pdDBHcs/d01Sr24mQXFSeFh1tAQcZoXR7DBP797iI6hTYKROr3z1
	YWkdCpWgJNlwFJk2NWm4ANMVSUNxJNHrJigTJbMhI/h3PQ1zqWYkaj6Lhp/UDWJlmAqnrsC+my0
	m6bmYVR
X-Received: by 2002:a05:690c:e197:20b0:8b0:d9ff:4f4d with SMTP id
 00721157ae682-8b1669e46f1mr35142877b3.10.1793046523300; Mon, 26 Oct 2026
 13:28:43 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261021235606.89545-1-sidchintamaneni@gmail.com>
 <20261021235606.89545-2-sidchintamaneni@gmail.com> <CAGsJ_4y7AzEHUjj-g_FaQdodYidC26-7MSG8HPkgfRgi67TCkA@mail.gmail.com>
In-Reply-To: <CAGsJ_4y7AzEHUjj-g_FaQdodYidC26-7MSG8HPkgfRgi67TCkA@mail.gmail.com>
From: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
Date: Mon, 26 Oct 2026 13:28:31 -0700
X-Gm-Features: AclHuK8l-MC_C_lflMDZtzuDKg2UiJN1OPTp7TsTz1M9Ty--VeZlBUsKVihib-I
Message-ID: <CAE5sdEgE+=cnF5dSDi5rY0Sr6YqQtYnEc3+QWVDdk7vC+AWrag@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] mm: multi-gen LRU: remove get_lruvec()
To: Barry Song <baohua@kernel.org>
Cc: akpm@linux-foundation.org, hannes@cmpxchg.org, david@kernel.org, 
	mhocko@kernel.org, qi.zheng@linux.dev, shakeel.butt@linux.dev, ljs@kernel.org, 
	kasong@tencent.com, axelrasmussen@google.com, yuanchu@google.com, 
	weixugc@google.com, baoquan.he@linux.dev, baolin.wang@linux.alibaba.com, 
	yuzhao@google.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	apais@microsoft.com, rlmenge@gmail.com, 
	Hardik Garg <hargar@linux.microsoft.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 26 Oct 2026 at 03:00, Barry Song <baohua@kernel.org> wrote:
>
> On Thu, Oct 22, 2026 at 7:56=E2=80=AFAM Siddharth Chintamaneni
> <sidchintamaneni@gmail.com> wrote:
> >
> > get_lruvec() was originally introduced in commit ec1c86b25f4b ("mm:
> > multi-gen LRU: groundwork") to guard against NULL NODE_DATA(nid) on
> > uninitialized NUMA nodes (`return pgdat ? &pgdat->__lruvec : NULL;`).
> > After commit 09f49dca570a ("mm: handle uninitialized numa nodes
> > gracefully") and commit 931b6a8b36a2 ("mm: multi-gen LRU: remove NULL
> > checks on NODE_DATA()"), that NULL check was removed, leaving
> > get_lruvec() as a thin wrapper around mem_cgroup_lruvec().
> >
> > Remove get_lruvec() and call mem_cgroup_lruvec() directly at all call
> > sites.
> >
> > Cc: Barry Song <baohua@kernel.org>
>
> I guess the correct tag should be "Suggested-by" here?
>
> > Signed-off-by: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
> > Signed-off-by: Hardik Garg <hargar@linux.microsoft.com>
> > ---
>
> Your patchset organization is a bit unusual. Patch 2/2 is
> sent as a reply to patch 1/2. I think adding a cover letter
> would help you organize the series properly?
>

re-sent it with your suggestions, Thanks!

> Thanks
> Barry
