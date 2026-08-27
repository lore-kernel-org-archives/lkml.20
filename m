Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0FDE3385A7
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 05:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787807727; cv=none; b=i3jeMmNV+tyS09EiLh8l42EBjWDf6Zo32xEsdf2gaRcmMxBpwTjHL9JreOm/5/NcetqvSF/l7W1dO7os5PW6mLmyw6WwERplsjGgZaQKvBqf3WvlYobxCz0B96VeL565PKkLd97d7OyJ8d0StDD/WcvknCw1RieT+XfMvewP5Vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787807727; c=relaxed/simple;
	bh=uM4ffWRXxgqJu6oQ+yqYabPlZlqlVfdb1R0U6/DgtsY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OIebZTegB4eJr+mUaao+KiGojl3y/Hd/7aAQ+gmQF5INzAGEtEHfMEJW1Q35meby8jlz3WQUu7kUO4xelaM6HpTY6S039GdGss1Pm/COwOEjRnwrietkc8N+OC+dHSYrM6d3naZ2RZPn0XWYJuxU/rCbducTzPSw3Oo/7cTnj3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qWzX3N4s; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qWzX3N4s"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2d6efd73032so5699635ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 22:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787807725; x=1788412525; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n7iOkDdvwOpGToX3CuLu1TzqG3e80H5C6wqSpJxbfBo=;
        b=qWzX3N4ssA8hOX82cMRVj3LVznCWUzn7VC+Js0gAlYZWhm6V8pcHmhJPS5DL+4994a
         ZPbiRQMX4viy8QvEDNjT7moZnkqo6FtLKWMoelRbwhE+Z00cz2GEYiaO0gFnz9OfEQ4l
         VP3Ikhk7EThrbDuwR+l7Yb8lSuBw6uqLIGvJl+1qPprgthyAeSklMJXaM7hAd9Z18Ice
         NGC/e0GYavKghVXz/M7lBTJsFCChixGGIcD2qmChYTRS2BBxZA9Gzfbp8hzM20degPy5
         AWpVHI/P0zkcYmhzDlI9jGA1bSmFCqinAqHlcP0w5u+z+S5+Gk1Ms3ZvnMcwYSncqjRS
         zwgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787807725; x=1788412525;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=n7iOkDdvwOpGToX3CuLu1TzqG3e80H5C6wqSpJxbfBo=;
        b=OXEzxGyz9iTO0+Y7F1lQwUCCXw6U7EG/wajIi3NMpiHg9tz+J8EEAH68uz92cjzDcM
         ZdxiXcY9naabSVFVdvWubqqaneqvtuhxoPE09/MIx20of40cPvBk8blqMRh/riw2LmbV
         SDNluH/arZAVwQ2pfaBsMSjoITyXbie+6MumCgPclgiuZj3AKJmqhb4ZL6Iv1AwdY/e0
         wMf0jeK1b1RIk9z+XSS40A8+y9uS70i9MGkntE9PW+L5ai9FNc4Z7fmhCyOARiwpxBxR
         UVQwrkShtSn+NyvoGPeZ8C0E690+O5f9fl9+bLLejBa2qApGAalEWt3qKICvnfjaAUC/
         A29w==
X-Forwarded-Encrypted: i=1; AHgh+RrLVqUpN6N/TooVGVo/1E4WNBZnwrrbrhVtbnFPpt/IBc//eUndf7GaRKE8M+FkLDWIhHeSFm+yKdc/s4w=@vger.kernel.org
X-Gm-Message-State: AFuF++mLkehskcJcm9NbH+3xI4IO8oKMIz+Nfgn9rS8eJH40QPDfNY/g
	5ldCT53puPHyOUXrx/3gD+5lQ1cN6692qw6/orRyhZIvd5HEz/ZHwfXQ
X-Gm-Gg: AR+sD12OMXva0dNmoaaHw8BXnXV79uCGl4D0aLiQ8+l/QtayCQpzj/DnsDhOZmXUnCs
	gfQUjjqRXXCnSbfawb8AXfQ263yPr3rmM6dRRp78awXrIVePrvqkLFp7vQJoMxQyVk9TNaoNZG+
	KoXFS0CUEtrLJAvMfASVOGREBughfRX/NCZ+ftshSp9mFTKtnq1gNdhJuZLgwRYtYV3umllHvi+
	6/9DIMgJ2oKY5dL8klolGVgPqi/jntGhALjLZi3MafJ4LH4GCjs3Q7IaV2rMMgcfgvxfTW5j/F8
	mld5ajcoUTBV9otjk9NJm9jXPK8TDt+kApuBFUjSiRhKokFxaxdVadv8HZKvMa5Y/We5VWUOwGC
	MCWThL1Fl7wn62mFsHxGF2FgaVe0DhPhcn4lRuuMzaypCbFd8+S8ZXBt8O3U3TBjqI4i1Z0O7SG
	+8AXz4Z2PRggLIvxeaC0yUJRvM53y7jdTIBwt5ReLKEdsdjGy2TdSyPMaSyOS6CZKyVEU/NDLyM
	p1+
X-Received: by 2002:a17:902:f647:b0:2d7:1cbd:9ceb with SMTP id d9443c01a7336-2d7269d6badmr53564155ad.12.1787807725203;
        Wed, 26 Aug 2026 22:15:25 -0700 (PDT)
Received: from Default ([2409:40f4:1012:4330:756d:2890:a615:2db9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3283d730c3csm15176377eec.9.2026.08.26.22.15.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 22:15:24 -0700 (PDT)
From: Jeffin Philip <jeffinphilip14@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dwlsalmeida@gmail.com,
	jeffinphilip14@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	stable@vger.kernel.org,
	syzbot+c7fc4794e59786f5b4dc@syzkaller.appspotmail.com
Subject: Re: [RFC PATCH] media: vidtv: fix uaf in vidtv_bridge_on_new_pkts_avail
Date: Thu, 27 Aug 2026 10:45:08 +0530
Message-ID: <20260827051508.13989-1-jeffinphilip14@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <2026082737-traitor-shorter-a4cc@gregkh>
References: <2026082737-traitor-shorter-a4cc@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 27 Aug 2026 06:51:21 +0200, Greg KH wrote:

>While "fun", this is not a normal path that users ever will hit.  See
>this thread where I propose tainting the kernel if you attempt to do
>this:
>	 https://lore.kernel.org/r/20260826-bind_taint-v1-0-52b05f4a965c@linuxfoundation.org

Thanks for the reference. The task hang is not possible
then. However, the UAF will be triggered anyway as we are just simulating
an unbind. Even if the driver's .release is called naturally, if we are
streaming data, it could cause the UAF, no?

Thanks,
Jeffin.
