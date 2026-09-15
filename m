Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ADA34A99A1
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 21:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789507576; cv=pass; b=H+Gn0KnxCd2xCDASz0xyJ8Pq9A3sVKVIAXrMbDQbpHbyNvCmvPWHen0RO3EGkyuTBK8O/5d361vezR2qC/QFSEs8+g7s2Ay4iCUDwqi/wnJCv1P3WL6rv3tzN8wncy1jCE3TLO2M1/aZBJnI063Ca6n59HbBfzJ9CLpq6rH/ukk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789507576; c=relaxed/simple;
	bh=3C5mLPkFCp/COkU29yXLY+0oucGgeSlTYGmyqMOyQ7o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XaGRZQcRfU9LgKQJ78Za8sVzSUHLSGKj4+f1upLnxdJ+Zu4rW6Lmkss8FtUBR1M4LqbDlnLUH1RN5mgyB1T6dwQEwn4uzMlQmIVPzSySOVwLQ4Joo8w1xuW36AS8sMjf4l0Kf29jNssm2t9TqjN2yQmn3ri2eU+JxUsHZ/8+Bts=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=u28E3La+; arc=pass smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="u28E3La+"
Received: by mail-yx2-f12.google.com with SMTP id 00721157ae682-85d43daa8f4so2239217b3.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 14:26:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789507572; cv=none;
        d=google.com; s=arc-20260327;
        b=c5jaNNoXIyqqexXNtNBDSGMdk87AsDvni2HpC08UhMmjmtn1dKHQlxYZjq8qRF82ei
         p3ldEZZZxmffrdI6FF7hDCO8ZdhZeitcTQ7cisAqBn+BbdJLH/acdmcYF34rWAA89VSn
         skl6ICoGu2wjBk143kLPu3C7bpKXMjA/+rgLgyDRcd+Q3yHcC7C82THHmlOV50E4VQwo
         2icKYa0Cbgx5nJN88bXV2x+nVeyzC+cTdyz8Rg5BC6Zj0fmClt1okUGz6sOr6yXzgZNb
         cxtsYBWQNIqzhb07LvhpZ12+7hMQmeepWXBqpdg2Zaphyf4E76auwKjdxhQY7bDlsmKF
         DJMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=flx0ET5eBe4MPEWRVh5JKF0RRPdqvJFkwYU0IdjbLqI=;
        fh=0ouJCk4WGOXVyShuTURKgDlIYi8vvzWotVrmg5fu+34=;
        b=JgLyXy5LUj2efNlIU+knLvVxG92bBsb6Y7jysfY+Oe2LYZK4bl/rDxilC7mGPgIZwm
         i6A44yUvztaA2NeU9F9NHM0NgTlDOI52+rYBa7TEiQSfHclzneWIM5dWcgZc/UzpY6hr
         m5WbOcSsG6MGxUc0CsqDdeAPeQSeunRSKacAsjKCwDzC2L4bgONpuIKn/PEGYLFZnLDt
         B75u2AOeziXq9u7mcUOv8jOBePWSKDe8MX+cq54/YaN4s33CZaN3xP91/uSDa1nrJJQ7
         xTJ265d2E/979V/wrlYJCuvA+yA2FcxPfccKLVaGsS89NgsDdeJfydOZ8pq4R9bwcYLX
         w25g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789507572; x=1790112372; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=flx0ET5eBe4MPEWRVh5JKF0RRPdqvJFkwYU0IdjbLqI=;
        b=u28E3La+cZtzdEWLJ6gP+r/Rdt49RSpsEnyqxhzFGV1yKNY1iaDD9PkoSoLpQEtfUw
         rQU6viYlG4NRPkVaSMQbYHMf2/Ac6GG6kqImviaxbe6guLHRQN0y4TUsBZAP/uVi5sA9
         /hrph7pAU8O+uxtK3OsQVNLlZLR5MvKuQsqPoVrKloOsL8f7oetm0PAeCUZx8u1Ez744
         NC3NvoKw+j9vMxHDobZYgusG31owO8/k77RsHpQ/HXN3bdn0vhdtT3pMxBpbt93PAO9g
         3+gttvTiC9n2u7WrGz338WhiSpgWcGdIGPqxeYXORLTczUhKLTNIk4bXpnwWt/vuTQWR
         Vmkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789507572; x=1790112372;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=flx0ET5eBe4MPEWRVh5JKF0RRPdqvJFkwYU0IdjbLqI=;
        b=UlKHsuwmnAQwja7O8JeteE2xEXeSucPz9FrQwjd4nOXFiAT7iHmkw55bLXBAm/nhRF
         tO6ZZDZ6m4mZqsnCrwexnjtcwVtiMZ2fjMYfMYZnz3zqlv2CsS7HmdeAaE+nzLA6pfxR
         /mKVbMxlXsFucyFuu3I6oHj8PS9cZ6VtB1zgBU4n6IRg5qBdf3UYU+f1lNMLbncvzNqg
         nvYb0liEBldDZZ9cfBfFJ6TJVvB+bP4Iaxklp7BMqdJ8mOTW0TPoPSs4/cGZxCs/TdZ+
         eeJixJX2yf4Y4/p6/tirNzwM2Ogn/Fw8wtFX0MtjvKBEluGmtyXYlhVFEZMAOzsb3P06
         u3Tg==
X-Forwarded-Encrypted: i=1; AKwUvBzxOSSJATBeY0j2vkrqASiQIugNAckXi2mYOXNdLyfgpabIRXo6eABEIdVvsHXz8Gaj/GxMh6Z5sTyGwiI=@vger.kernel.org
X-Gm-Message-State: AFuF++lZRXxoNZ3RyEQkHs7nyb/xH2z/qtjZczTqePifaRpkb754sPEu
	eYMbdo9O9vxJxldtF4yS0Po3TNrYtRlumlMuJBAy75i8iZThvayhWpCF9lvxelsaC35ldxaaPeV
	39iCWdJ3Pumsw95RNucVmrM224UjBb1v6asLefsFY
X-Gm-Gg: AYBFou2/pxhezZdjRRZuxkINQI9CbSkQx3nGLtYDjp563zj9HSAu1G73U2OdYzi5AwD
	fCVt5zjwZW9xJFeiWIZakOMtzUq1bKj3DyMruuYxeOevj2icYT/6sxo8JBgRlj5gPW+DIDkhbE7
	QTTh+Sb2/wJvOWWQ5IOpAR5qQB895V4t10drozDas1ra5wg76L7j9hu0Sow9VcF/MCBEh6ZiH0R
	DYQJqkEWD9dI/Zj/EP3JgA63Qsrhd0EKzByorc6Cty+vOB4efpl/BaRxyU7wy52ADU0z/Dk67iu
	syU6bjdwMvh0b0c+NJj/RakT3Gz6VXI0b4dfcAWDFrFAQLUlPg/RtW/9xDZZwY26APqOuZkZ0z/
	YT5rC82USsRv+LUWrSBpNmN5MySwP03QbtJX85ndfEg==
X-Received: by 2002:a05:690c:d91:b0:88a:a9c8:1363 with SMTP id
 00721157ae682-892213153ecmr1051727b3.16.1789507571445; Tue, 15 Sep 2026
 14:26:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260906202747.4041389-1-samagazaryan@google.com>
 <20260906202747.4041389-4-samagazaryan@google.com> <aqHU-6RV_AapSu3M@lizhi-Precision-Tower-5810>
 <DLC6ERLST1B6.6K3HLH38DQLK@google.com> <5fb77c2c-40b8-4dfe-95d3-e0c73b8559bc@intel.com>
 <CAHreonHEAPrzhVH0AiAzrZOr+h8D=T8hB_oC0TP50d79y_OWSA@mail.gmail.com> <b8737b87-4dca-4d49-916b-f8e468e74a75@intel.com>
In-Reply-To: <b8737b87-4dca-4d49-916b-f8e468e74a75@intel.com>
From: Sam Agazaryan <samagazaryan@google.com>
Date: Tue, 15 Sep 2026 14:26:00 -0700
X-Gm-Features: AcwNN1WBOdpUMxoXq3egK3z70CVN12lzDXX_aVg0FNLaZpu2jsmUtkBDsOU7hZ8
Message-ID: <CAHreonE32grASqJp1xgjvOW=1gi_xM2vj+pi5paG+s8pzc4t6Q@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] i3c: add i3cdev module to expose i3c dev in /dev
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: Frank Li <Frank.li@oss.nxp.com>, linux-i3c@lists.infradead.org, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li <Frank.Li@nxp.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Vitor Soares <vitor.soares@toradex.com>, 
	Oleksandr Shulzhenko <oleksandr.shulzhenko.viktorovych@intel.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> It is less confusing if it is all fixed up in one patch.  Fix the
> comment on actual_len.  Make all controller drivers use actual_len
> not len for returning the length of data read.  And fix up mctp-i3c too.

Yeah, agreed.

For v5 I can add a patch to the series that does the following:
1. Clarifies the actual_len field in kerneldocs in <linux/i3c/device.h>.
2. Updates all controller drivers to populate actual_len (and not len) on
   reads, building on Meagan's patch.
3. Updates mctp-i3c to use xfer.actual_len.

Thanks,
Sam
