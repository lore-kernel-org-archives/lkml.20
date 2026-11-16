Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794824212;
	b=D6mhLvUK+u5nDbUPVNR+8OrkgouolTFXyVoVt4QSuamLDItqgWOIBYIlzuoSr+Sw9MQy
	 WnV3AUsRDmHBmNH5HMd+4Ll28zZD9G0HkYbPyKXaUymQ1IpNWApbM2GEXmIhaCwKnn9n1
	 3Kx4G/2inLnViIPhKsxjkIKYBlkF+XIvp++4jmFIwQUZWCRvjeAPUha5WkFz0UjhQwx+a
	 XTv8Aw/5E7zf/+7yv+XCn0yxj50f+XG4BAPcDnnXLRvdpZSE+PZ9jF8tPt827urybgZFJ
	 PA26go4OeWAgC2gHVAppQDu37os2UpMfa1acPbh9iGiGiAXcALlmAsMuYdyS4+4Bqeg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794824212;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=/hcjQElUZt6LTvJh48jG50u5y9Z3BZvpWeXQnVdqzgE=;
	b=HpYF6LhSwKqci5mHT2hwzMNqRYHw/tZoyBtrSIssD6cVtKOYb4uwgv1kVoIAt1SIwF+4
	 uZA5UPLCxcK4iNcLx2D10h4wlBul1vP37RVoT0ukrdtX3j4rKyDeqQswKH5nWW1npY6rn
	 SuGlzlcDZPQ8cCK4Pb/jCNVBUqXPSdoFBKwLyQqqLk1+p83GgFFz0nwBOfTsK7R8PY7NV
	 YBL2255WJOKGo3AJTfgHGDwNAWkrh5jPgW5y7Pa6u1nagP+NjEYVpB1iESrLiN9DaE7QO
	 0guxAaMBTrqYSWgrp1mVDmnJKnYZNBftJramUoFBDFWptVFsYgRGqdxrTVw0X1WSgew==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N3VIQ7tf;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.47
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81F20606A323
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 10:16:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81F20606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N3VIQ7tf
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6b2237b596cso7415263a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 02:16:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794824211; cv=none;
        d=google.com; s=arc-20260327;
        b=fC7s5EeaLGGMyVHmbx8iFVZARJC0/jKTIKHRoIxhKKAnz/8Qu2WSujufaMvJjif43j
         R6cKX1WR5+0rMOJ2kD12y1VyPkW58LMwg4HcBYXe4Vmugp6oNJkrbYf7XZqwPDFl5LhQ
         y0Y6oAhFJeLFK4lZtVR5vLvStckz7U0xjXN/vd+9ykCg9m+i8E7dk4xM8cff10V/rFSw
         B+l/0WIrAS3s3bgETnLSAdOQKIQ+XFlfzKUiYCJW/qsvyZqxsqsTBv2DhDqViQBBdq/h
         JDLIaWoN1ZK0E7XxsyhS1ewQPC2W7QnkcQI83rcWhdvzyEPNlEnL6FhCpZs+HSm2j7wo
         N6rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=/hcjQElUZt6LTvJh48jG50u5y9Z3BZvpWeXQnVdqzgE=;
        fh=u3dwhthyE+s8nInXQXXdz+Z1ToYT31haVCI7jgKv+mo=;
        b=KexbJV2hW/9TGsgO9NkrXadwiOF9Obh7GkvM0xpllE5kwrqzvERiJwCJIyqbgGXV3S
         iFo7qxTeE1geLaaMVFskcf5zNEiFb2afW4YS/dqf53RWunzXezJZl/SOPgWxrfFbU77x
         szCage9ZrP0zscimF4zZWSHpLYumW9IDzlq7lrvsCynAy3M/9DlzrqLkwZMTgptvS8uY
         5x7B9oNF3cwbb2G2lUOOFjqNGEGs5U4MilRA3NGHNjeo2mkD0VYej5IKvzJIMnaOLyLZ
         zqmQVP6f+eRfQd2yx7qIR3ajw6f3Y1RlyjR6rp+/C8YU/P//HEJXXT5VxHT4xzeeEvzM
         VGHA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794824211; x=1795429011; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/hcjQElUZt6LTvJh48jG50u5y9Z3BZvpWeXQnVdqzgE=;
        b=N3VIQ7tfWsnTUedookPE3l4y0SoBLodNG59a8PIWRJUpjgk4X8sUP6fTHs/kEfqw/t
         Qv2QZxPv328cR3fb5ZA7Pv16OuSWluS/vQ85ccBaLSQpCi2mqygJccd26bD6DBs+3boE
         8/YMKpiulNv71gmJgQBGX+gZTnzpmLFUdX1feZ3BJm82cXLT09WZbabYvpExDgYiUstc
         ptWBFd7U/WqJRVJD/MfWZ9+GWFn1beGPD1Rsr1TOFYIrqwTqInVDDQdGcEeeIKb2RPst
         mgmMV9CL0BBjnYa2kf5EmOixfNi0r592ysHG7YL5guWG2tsA0Uiu0bmYuFUbZObTWpy/
         stOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794824211; x=1795429011;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/hcjQElUZt6LTvJh48jG50u5y9Z3BZvpWeXQnVdqzgE=;
        b=KbyqOZOZSlsDTOmSyruKr++EsrBz0vzm45m0WkkBpiCMC2Z7VKjAPTT+867D/Xls9h
         nqLO2ddRabcaRtwz55DQ0G9L0GYXsnaexAMcd/YXzfP2nNh6M1a9sgiiNfvr61JfP++l
         x0G0Soe7cxHBiyVq5QqyocY42V+WNiDkw2qb0qf6b8PkP1WYWHnlUg5MfWkDLKN4fWOR
         jKdMqmtAis2H6KBquv3DG4w7jvgtO36MiKvvqMEh2BW/2b6PkqSMVxdkXFycYOKNof8Y
         X2SyU19uQaX8WEw2GSTpAy70Xd6eTbW8LqJsja71rgbyBx2gV7UzVL4hZSUitmt8Q8tf
         XuTA==
X-Forwarded-Encrypted: i=1; AL+hErFnLcpCZI9/w4Y1R4sffFe+2mEzSBWgiKlG8xMmshW7HLbeBFB7d/QaxGvFg7A1RC+mMKRpppp2SeWD8fg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+hjNZYdY3D6bSyb6golxdbRR6FC3ch9Qbo44bpuZKPc4454/XN
	tLrovexTmMrTIvb9g1SVHCU/EBsQqSmeRByHU9h3J5KomESLNlBkEm4NyZ1FT8xV00EZt38DKP1
	cM1pLxlWNdncDItPbhVinVUiSiLbK+j4=
X-Gm-Gg: AYBFou0IjwXc4/vlcKE7dnEGtAl9Ddr/yEI2kFmn+Wrl+tuilMOxVFB6p9/H0F6MzaB
	v48XWjymXkePTYNUfNhSF+l3LI8mzFoSu1Rb6UQge6ofKeNK/f234p/jM7C6OVmVQcL0U0Ufg/R
	nuIu55zbmqiPDq6E5GWMzk6HqL74GUh/934+RxurnyMSdHmmqYK9PkXkIufkkna6t70svxNkBVY
	QljmGTNE7r7wi1+E6tuqDuQl/At+8WV6lfx9dM4VPUpQde/56OMT13CPoHdta+exQy08k0Ummk7
	w8c+CzPfywE3piauIbj11rnd8J2Abi2psMShPW/H1hzDGrrQYu8wjTDgM4uOHJXJh0/jX14nq29
	pfgtkfhdOq6ZMFDaYj449yuxHVoKcn6K9OA7e
X-Received: by 2002:a05:6402:84e:b0:6b7:ce4a:7d14 with SMTP id
 4fb4d7f45d1cf-6b7ce4a7fdcmr6938230a12.19.1794824210496; Mon, 16 Nov 2026
 02:16:50 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116065730.472784-1-singhpriyanshu9838@gmail.com> <2026111624-amendment-bulge-7a08@gregkh>
In-Reply-To: <2026111624-amendment-bulge-7a08@gregkh>
From: ASH <singhpriyanshu9838@gmail.com>
Date: Mon, 16 Nov 2026 15:46:36 +0530
X-Gm-Features: AclHuK84ZkCQqKswlJe7GfxEBWYyOLXH8NGQkY8NovdPigxLSpCfnkb_ruBxLQ4
Message-ID: <CAOjMKJwAfEkC+PmGBnYimjW4Q_D7ReWurHz8OS9m8HnYBpL=eQ@mail.gmail.com>
Subject: Re: [PATCH v3] staging: octeon: fix asymmetric output buffer pool accounting
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <error27@gmail.com>, 
	=?UTF-8?Q?Oscar_Alejandro_S=C3=A1nchez_Lucero?= <aleszlucero@gmail.com>, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 16, 2026 at 3:10 PM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
> Please test this on real hardware in order for us to be able to accept
> it.

Unfortunately, I do not have access to physical Octeon hardware to
run-test this.

The patch was based on commit d5f9bc7360fc ("STAGING: Octeon: Increase output
command buffers"), which increased the allocation in
cvm_oct_configure_common_hw()
from 128 to 1024, but left the corresponding teardown paths in cvm_oct_probe()
and cvm_oct_remove(), passing 128 to cvm_oct_mem_empty_fpa().

If anyone on the list with access to an Octeon board is able to test this, that
would be wonderful. Otherwise, I completely understand dropping this patch until
someone with hardware can verify it.

Thanks,
Priyanshu
