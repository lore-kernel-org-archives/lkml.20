Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82A7241228D
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 09:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789377561; cv=none; b=urnB8fmrgpGNmxmB7GfnMYxyHesmt3PZrXOLw4uQaEiEDH0irsC1JKVvCZXR+g3TPAWJrwCdWS7Q+YlDFFQKo+jqyxbBFfyIHO5zI/5Oj+bvEVxJrqwn0MyYi8K4SbjEtchF7gUtEcorP667XRE3WmwW7idjAt2yxllGSgZUPA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789377561; c=relaxed/simple;
	bh=vebMstFlzlIio1gi34O686KbXK9pRbjRlGhEAO32We0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OuTAVsexPBzjjiu1RdklWcxOhWQjP0Z7aTiU6smOt9R+za02KipUcFxlJKasU8vjjhbyVCA8OuNv81gtAt2MyKQxacZKqNu5+tEijGZ4LZ8k9l26y8qiKC3lZyOgCaOzHgLKvvrwj9xoELaIxSkStgUZwhDyNOFNUXsW/Q3cQvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cWjsWwLy; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cWjsWwLy"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396672b2569so194730a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 02:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789377560; x=1789982360; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uPi+u/FU/duAmWdWXfNF+CL6o9CUHUuEHPhvqxj2P3c=;
        b=cWjsWwLywLkUEZWOspU9n5tfW7uuYGHPGZcgsh8QGUemgY9jzoIk8M9y+bsVY7dokq
         OaL2NdnWpHcak9DfO46LgUg1aRtdMNMqb1X1YbZOG/r8hcvLjOJX26rUAtkCP87tJNly
         98kKj+ovDvff5DjkDFFINaJEkeS/hfmLwFG+GpzVRp4LVQeMrxXaoMdX4kbgCBK24M8Z
         dsBV+xBZZ03DTcuwfHsC3DFN8TAMnd3fKHUCjZwo2D8jTElaDhoqQ3LvMBfC9reBdddD
         5NBpreKvfVolohCLuDdgYqF2Rqw9HaoHCKy+Y5EtHbuSJc+jBYmxYQyMvRO298TH6+Fm
         9LBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789377560; x=1789982360;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uPi+u/FU/duAmWdWXfNF+CL6o9CUHUuEHPhvqxj2P3c=;
        b=YEOCRSjnjFocDoHGe0DmFryRIGfmQLCkgTuZQbmtSvQA4VgESY79pniVwEPiOTp0v1
         eJK/oatzIq9YO2bF0uSx4+p/FXThz0mVxbvkT47kwFtjEFmeL0OUPKnh4nS0eVIRDzbp
         LEJS7sUFkodTsgZS+tk/GQdhjeMJJiftbOR7CiXfGYotBl0If/4kkVqPdxQOf9fCcF6z
         H1bwDVca2RTuGoF4PNwyuq6OIglAe13e1Nubz+yHDBAeOxQof3Lf1X+n2bLqLtvPLvFk
         umU4SG9B9zBwrvfBlVj35nL+3PKwa4ZaJ8kHYm3QdjYTezo54ATGdXhOZ1JTN3H9M3P+
         d+gA==
X-Forwarded-Encrypted: i=1; AKwUvBxUJfdSXexLXrx0f8Vjp8byqB0ZTWBNh/xYlXvQKRZh34FYfcigbCsSwlDJUyKBvABoDWfnA8XiibRixUw=@vger.kernel.org
X-Gm-Message-State: AFuF++kHUZLQAkwfbZ2P8m4VaP0OEdbrsalT2ixs9cooUPlL2o1V+LOq
	vf9UmjN9MUUXgRHv1xxk1WLb01qwMm3B+MK0TSEEO5o0cb2kSCG4XJBP
X-Gm-Gg: AYBFou2TnsnMaGSLcSPOBSyb5UFq0MGPlC2JcSYrICZhYMMFXuAMmyU/ZGiZM8Wn0lg
	j/upy3LjEj56DnOHF5k94lBBuTpc/jxLjGIS9W+YVB1Mx2qFqS1sFTFxgoPmpfG0+QdRpxzz3Pi
	C/5+GYVO8vlzf5ehpcRYVNWYhZ9ISrJxDLgc8T5igA2RoZPk7yJVbKlTgN3D2aNoA0nBHS16p+o
	N1J8fnAke7kTTt5/MJx/7dQoGtnDxUjZyjAzg0Vj5kh7jTsnx3gaQFY2Cq1wsal6qmpQZ00BxX9
	huH6Hucz8AkrPqB+CJvIgCzaaez0AC/GKFQez8prutgX0mqW4Czqkqr3p3332jewnJtNLb6lZsA
	x4+6SQv5Jl21zF2S4GVLf0yVvGXpFOPX8ybPWC3KbTObTmjXDuSYxLFd9kN0SDhm3vj0hXE0eE4
	bzD9UKQX8tEQe79rXceE/rZumx1hkJauMKMIIlrKEsCEd6s+bX8qc4VNkGKZHxd4hdnPSszhsZP
	1eSQO9c
X-Received: by 2002:a17:90b:55cf:b0:38e:480b:99a5 with SMTP id 98e67ed59e1d1-39debfb1b55mr2624087a91.2.1789377559685;
        Mon, 14 Sep 2026 02:19:19 -0700 (PDT)
Received: from elitemini ([2400:4050:d860:9700:75bf:9e2e:8ac9:3001])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d95095946sm20461974a91.5.2026.09.14.02.19.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 02:19:19 -0700 (PDT)
Date: Mon, 14 Sep 2026 18:19:15 +0900
From: Masaharu Noguchi <nogunix@gmail.com>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: Chen Miao <chenmiao.ku@gmail.com>, 
	Bagas Sanjaya <bagasdotme@gmail.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH] docs: sphinx-pre-install: warn about unsupported
 Docutils versions
Message-ID: <aqe7sWNitaPYaUYc@elitemini>
References: <20260913-docs-sphinx-pre-install-docutils-v1-1-d923c769af91@gmail.com>
 <53fbb5e6-70c3-49cd-96a3-3477f048eebc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <53fbb5e6-70c3-49cd-96a3-3477f048eebc@gmail.com>

Hi Akira,

Thank you for the review, and for the pointer to #3099.

On Mon, 14 Sep 2026 13:56:16 +0900, Akira Yokosawa wrote:
>> Sphinx gained Docutils 0.22 support in 9.0.0
>
> This is not the case.  It was done in Sphinx 9.1.0.

You are right about what matters here.  9.0.0 was announced as the release
with Docutils 0.22 support, but the LaTeX size limit that actually breaks
these builds is #3099, which was not fixed until 9.1.0 -- so the boundary
has to be 9.1.0, and v1's check skips the whole 9.0.x series.  I have since
built those, and they fail:

	sphinx   docutils   core-api   admin-guide
	------------------------------------------
	8.2.3    0.22.4     FAILS      FAILS
	9.0.0    0.22.4     FAILS      FAILS
	9.0.4    0.22.4     FAILS      FAILS
	9.1.0    0.22.4     ok         ok

Worth noting that the 9.0.x rows are not distro-patched: 9.0.0 through 9.0.4
declare "docutils>=0.20,<0.23" themselves, so a plain "pip install
sphinx==9.0.4" pulls Docutils 0.22.4 on its own.  So the pairing is reachable
without any distribution relaxing anything.

> Fedora 45 will come with Sphinx 9.1.0.

I tested that pairing before replying, and you are right: Sphinx 9.1.0 with
Docutils 0.23, which is what F45 and rawhide ship, builds both books cleanly
here -- core-api at 1215 pages, admin-guide at 3074, no errors.  So F45 is
fine.

I will fix the constant either way.

Thanks,
Masaharu
