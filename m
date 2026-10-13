Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D314472528
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 04:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791864553; cv=pass; b=V13eqvgpowqQzlxV6ZyZpIJl2auay/v9+QWhRQoa7C3XPiaoPEFZEuobo/1IPNRvvrY38kw2uLH0jexo2nJS0yXBY49/kdCIJl6a2In9TaxV4GZbQNbFpPaaXsGJYjmvwN3jWcsuvOxom9WJdmJwXxilclFtmmvRgzRZPPXkffs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791864553; c=relaxed/simple;
	bh=H9oHXOeow7etE2oz3wpLSTwBD2VuT9YN6Axe/CaEwSk=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=j7xHyGuw1rWsInlnvSRSrFehF7ZbB+Fcu7i+/P0STLolvP+d69+CaiTdmSotmhVyfbCzoNezMw8D95UTjbJOKL5WUQYzwUG+M15XHS2ln6eqfjBJ2Qo/7iTl8LYxxv1VYPdOwyRUUWWW9NztEV50WK1m8WajnWQVMlR2oGWVlI4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gAcCvK8Z; arc=pass smtp.client-ip=209.85.161.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gAcCvK8Z"
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-6dddc514bcdso1367997eaf.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 21:09:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791864551; cv=none;
        d=google.com; s=arc-20260327;
        b=pqXjw7JCLYkC0hdoVuOErtVO8T1MpH5thCrZGSRBqevo60pq5sQTy1CEYiLq8UTcYj
         BdONA+NZF0kee/AuP4tp5t2EEbyAwOCTAzTtpxWd91/+aXRaH/MF21qJ3fosRK1YHTEG
         sgzaui7iKuwHxrUHrNqmiVlQ4kb7FlvEcHKD6DYmlqnWo0mOKhaJ1H7vnYIeU9BHJ8UO
         /9VBVEbwhal2GHFTLwtcwxns+Gk3DsYGLbtcRbwEy3kpAm+aFizfJ1ukHWWF8yWQi34G
         vy9X2ytuavaB73n8hOr8zah8vd2ca1y1bVvYPkFieziQwu1KDOSIPKWWbCCi5xlk/ZnH
         x00g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=SYymT3riQVadNN182lfr0tw+D5BlQUqx0Gbf8LTuo0M=;
        fh=e+ifbOUx7tW4LM5q5H9lKsdAX1cvLvgcRRdMHGrDdmY=;
        b=iuTDx8R3NhBv6F9LhjIn8ZiK8JdmEla9ZCm8WZxzQ1azXS0My4sMtGwxhi1kubG7aC
         A4AdEr2BphPkkyoqxAjzI9ExLWoC9XuT8xfaR2bxpgmfmNJy6MtCkHZX+ClJTPAsV/bo
         LldvZ8yPqOHOj92MszFOvHFVzI7Ep2S5gXBVmAyAroUTN8evt1mmhbbNdyydixRFVw+k
         mdrhU/fzXBJGGBKlwC2eq7ghfzE8/Rf3zsKSV4eMue6MJWXu++SDaCLLOIyJMLtslH+/
         D+IBVjoTJMmJjudFd9nhhPvhjrAO0D2ciemyOmCV2JiuZqogYDHAx/oPKfM44JjB4lnb
         ovvA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791864551; x=1792469351; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SYymT3riQVadNN182lfr0tw+D5BlQUqx0Gbf8LTuo0M=;
        b=gAcCvK8ZWGbqeuaqUmhMV765QiBfWOeaKf1iCRATcabOcPp7XOyqiZ5NS3W7hcSIff
         MD+sNmvRPwfZQT9OENBKcDn53y+A7Q6BmROVjgob9pVwFj2JzytWRCd4Krh+EMUtZemR
         TRYjbtlTsmLRcG6D70AFDmzPolSHm4/kySh7/6k2mAfP5xmUN6BphHRGxfJUQJtJKjlt
         o/wMbN4ygW5m2pHAYLx3OCekoUrW2Ew+0v+4chgbp5zAury63MowekIy8l4mZU3nwtRj
         peMENM6tXX7oL+pBhRqTiRax4yBA5V9Ikg+SriAdwYesJF2SJW/Qzo+fPtKE/YkOS3+T
         BTlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791864551; x=1792469351;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=SYymT3riQVadNN182lfr0tw+D5BlQUqx0Gbf8LTuo0M=;
        b=onVnVL3UvNf4v9PV+pef4IF8FFrXCKNSYM7+FYZ11MoOtfSALSZB9nsSbMb90q3eT2
         jxXO6bZ9onofg1kUEERVUrqh4QkF3GHJygtSYSbzFjTRUgfL0KiVNaxevwT/nyNyRNEo
         54zcewynPKz7v+StlTVml7y09As28bP74L79C/e1wwrnWvV3rlGodYwpESEL6xV1NtKA
         xTUZPvQ1ApiP1acEbUAvL6EsqEl2GHz5JYBlhKLp1Ii+uDDDhcsrmqCOKU8siDGcWXXM
         ROEv/bYw+sOq2JREp9NghR0a5a9zI78pU3xeA4SKUA37UbNpN73RBu2ESDDvJG+KjAnn
         KMcw==
X-Forwarded-Encrypted: i=1; AKwUvBzKgX+WepagXrn0nAcJ40QXXA/BB9v8iSFDiiDC90Xhd3eW9NflqMYd2UDJWR4jjBT9DLISHI3VU7Eanfg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKwfu4VI4rGtwuT4BcbwXM+r9O9Tj0/Y0SnaG7XlydjZGgCecdl
	/JvcvyEcj34gnv/MJj8t1zp8bmVC4WxSHtHGuY0U1nkOkTbn5sfibkKRZKKk1oPPsz0i/EsO0Mh
	VzTuSZr73SSJx9igvUSkqvE6Yjbop9onOyl8pcwQV/drG
X-Gm-Gg: AYBFou1h9aNRCwnkSx4Tmhtq1s5A5i9kr3jR+cLq7GZ7J7XERL4E7kdIEtpfuYSUTAQ
	r5+R/K7SFbFjLx+lHI/knjutiFcgvVjXmBgOGOjhYSvqTqJFwEE+LUEOI1rxkUx4O1J5XW/gVJC
	GvxT49yA3L1mnBZUaNOZQSEDVNovphRcj1yzcMkj+Wx0VCKukXFqxPcinu5ZQn1+MUwA/Sq2xuJ
	gVnu/if5oL+a5/yXgwF0QjMNaIP2c6o8ZFJGpcnXF/ELlDN4SlHoQUOylZM9abiVtoVhspnOLt5
	q+70OpVrtLUCfUrESgWwVwvonU/lXqeFFt0KPcpPJHypFyoD2LrNRibiK+DY7LOgGJVhjC1yF0q
	6dMGetf4qMO/V5nDqKoiM34IhlfmNwPbmeTmOQYElk4xnDS3vtUfsn0PLLj0/d2avjimBOKYAjB
	PzLeNBbhAXEErIHkfdf0fdUmXYq7ZBRChRwcArFPBjGY0HRvX4F8OImgxwOXEl9blKBQ==
X-Received: by 2002:a05:6820:82a:b0:6f6:3762:5f9c with SMTP id
 006d021491bc7-6f637627061mr4081990eaf.11.1791864550970; Mon, 12 Oct 2026
 21:09:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Nicola Fiorillo <nicfio@gmail.com>
Date: Tue, 13 Oct 2026 06:08:59 +0200
X-Gm-Features: AclHuK_betxHCyI4TIli2TPj6vrcBsVwnI89MwAoILwlOjGEgQ7aoJF_OGCoP5U
Message-ID: <CAJn-UjW-tKNRWTjVOQPe9d-wh-Pdmnw8EEd1vmL8k=TQr--t=A@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] media: Add GalaxyCore GC5035 and GC8034 sensor drivers
To: laurent.pinchart@ideasonboard.com
Cc: sakari.ailus@linux.intel.com, mchehab@kernel.org, hverkuil@kernel.org, 
	dan.scally@ideasonboard.com, hansg@kernel.org, u.kleine-koenig@baylibre.com, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Laurent,

  Sorry but I am not an engineer and I don't speak English. I only tried to help
  solve a problem that has been around for a long time. If it can be
  useful, the repository with the measurements and all the material is
  available at https://github.com/nic-fio/chuwi-hi10x1-cameras

  (Translated from Italian.)

  Nicola
