Received: from mail-pj2-f1.google.com (mail-pj2-f1.google.com [74.125.227.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08C4054788
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 01:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790125281; cv=none; b=Vxvn1Q+XLGWYzYEjwFZHZIHZcvichM6leicEmKe8gwnTM+KdVfo7pBjzYAMDvoyihgFAMsKeF5WtMI9z7zvVqwFw7/R8/FVFjYTenDhrreCvppyE/eHNd07aQvOu0c0YLvKfkVqEELwQjHX/T/pt4931a4A33WBjI9c/0PG6opQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790125281; c=relaxed/simple;
	bh=Ds8v6KxDkR9/9Npv13Jf4GLaCKlKSgwBLsCNTjHzyMQ=;
	h=Message-ID:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Content-Type:MIME-Version; b=K49wdIB4B5xo2Q55WIjs/H99sfjP2MtFNsK43IUysMETrw/1+3+f+sHxNVTufDzD5tuWYz3rwqWeaFkszpdFlR5TeVaXRg59EGUme+oy0wMVCoOEScbi6vphazEq8cPpg2hsgYf3roBZ0e5ggjZ1OmFvwO4gfSiZn8tNVHnPgEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cv6G//h1; arc=none smtp.client-ip=74.125.227.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cv6G//h1"
Received: by mail-pj2-f1.google.com with SMTP id d9443c01a7336-2ddbf74c12cso3321775ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 18:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790125279; x=1790730079; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vEyEng1MK22ReTdo9F+8MEGOd7gPeqeDoJ7WSVRsKUU=;
        b=Cv6G//h1QV8L/xIF51r3Cwle7a20GuV9xUuY5nKrGeZc5rouNe5DZXvWdCl6+yH+7I
         suvLSTHTNfDKwvUzL7HjaTiPFuioeF+cbZmfZ8MwdP/1l/53/WTa29t+h2vxy9AwKbR8
         2Z9T1f1kB1M8NzE7hvWFspyGVpJc6a7IoBOis7jeFsBOYC8QGum+82j/asVuQKLVclwv
         e9fyTnX54a/bRGA7cU4CWRw2LSZW+EWGI1lPfgLXoALfrTge/xHec0kJq0qfKCejMM+b
         MEceu2lD7qHQGE5TUrRPQP2e4CCX+P17HXjj62S7c15TjEZSoDntBueqIqLeeFf8NgGb
         nSCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790125279; x=1790730079;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vEyEng1MK22ReTdo9F+8MEGOd7gPeqeDoJ7WSVRsKUU=;
        b=nBkO7OLCInxrPJsZomEMvDf2PxccoVVuQVDurxCTLOe7CR0oTTIk/QzvXVVPmnM7Uw
         IQYBFHQJOcaEwOI74CxtRGRnd598LHR3lCyfoP9EGk3RSU959TAvYAnav2lPIkS+7sei
         xIdlSmna/Hdw9SFGm99wR42ui5ASYtASOrSp2n40j1NV8NostkIy/m1f0/kw3vMds7J2
         zg22ao4wnUUFAgQB1SaxIIhL9yLirDwPAP53Bi2MHG1tEqpvT5Ij272J85HIc3Lh3rQk
         pFfXZWN1QTZkNv/MNqHlugcSkbHPQ2siuMiswo/Shrys0mbEdZ3kGboU/z7dq8rsns8b
         ljqg==
X-Forwarded-Encrypted: i=1; AKwUvBx3luA9VhkpUuHOqLYGGxrbHnL9/MrH+8txeyXFhTtcItaxt0+68bJGNFw7t4Mvfoa2WgyiuArUuT1xKfk=@vger.kernel.org
X-Gm-Message-State: AFuF++mzOs30k8TNYLnilLieB6m8i+dnPo/c1cqLH2vaV+JPgXEycknr
	9IzVi6V6OhDtvLg6EKtoKEeY7h1mb1Z0Mqndl1l/ifLjqdnMB6eO3mW4
X-Gm-Gg: AYBFou12aBJEAqN0XGr3DYhY3PhtoRrdKXawnUdw+yUqRfn7WnkIGE4Nm8d27OctYPy
	+9FGleVmWddgWdmdExzguPe3pWv6GEs/Y6zdfnjFXzBIHvjm/UA+c5u7jCPm+ReJw39Wdc9q9SY
	fgWpBJMD9jrh5gJfUOqhDRmL5By7OpUFFFPDx5C5fTMIhQB0MVNJZsrDritNoQhDAKjHJXw37iC
	pXm1Rv3F+p3D/QbYVHBZ4JhK6+kkg3QR851DtMp5rLFnytCibi6A0+0gkKhP0W1dIaBgjQCuvVk
	b6Mllxth/xcHUIkJiZcuq0xNPoNLNHeVRljnb3yTRs7hIx0HJbUUDYUyvg93NkEJqIb+WLbcWeH
	wZAcKAkfG9/fYm/k2Dn1v8KMCkwqhMaUYHtVki6YgGlX/KK2c6ExQ2L8koT0+TjQxKF6yJ+kKRd
	+w2Cm3UuO1r2O4/PnZ9VWcThp9hetrHFxVJEYfZ3/1oF6rDnI3L7Uot6di0tKo2sWa4ndtdMhee
	85Vp9eVk5hRlxBCYmzhW6gy80ZMq7xCzNolzJH+NYJJSH0ACGS2oK82n0EPWPk=
X-Received: by 2002:a17:902:d48a:b0:2da:f7ad:cfea with SMTP id d9443c01a7336-2df69d1aa73mr8835515ad.8.1790125279133;
        Tue, 22 Sep 2026 18:01:19 -0700 (PDT)
Received: from [127.0.1.1] ([2409:408d:3188:aa03:9728:ccb0:1ebd:8895])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a5f035bsm2369745ad.65.2026.09.22.18.01.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 18:01:17 -0700 (PDT)
Message-ID: <6ab324dd.577d9347.2d1fba.32e4@mx.google.com>
Date: Tue, 22 Sep 2026 18:01:17 -0700 (PDT)
From: Rohinthan P <rokinthanp03@gmail.com>
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 syzbot+9f7405999979761b6cfc@syzkaller.appspotmail.com
Subject: Re: [PATCH v3] media: v4l2-ctrls: do nothing if controls[0] == NULL
 in cluster functions
In-Reply-To: <2e35f2b6-6b90-4587-8891-08846433b0d6@kernel.org>
References:
 <CAHzb5FFOq=2_piCiFdEun_s2h+Jr90pNLF5O_2umNLkM9-XjkA@mail.gmail.com>
 <2e35f2b6-6b90-4587-8891-08846433b0d6@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Hans,

Thank you for reviewing the patch!

1. Regarding my name:
   My correct name is "Rohinthan P". I have updated my email display name
   and git configuration so that Author and Signed-off-by consistently match.

2. Regarding the 'Reply-To' header:
   That was an accidental typo in my Gmail web settings where 'www.' was
   mistakenly prefixed to the address. I have fixed and removed that setting.

Please let me know if you would like me to resubmit a [PATCH v4] with the
updated Author and Signed-off-by lines, or if you can apply v3 directly
with the name "Rohinthan P <rokinthanp03@gmail.com>".

Thanks,
Rohinthan P
