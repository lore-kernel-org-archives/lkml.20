Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8034434B682
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 14:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788358859; cv=none; b=KrdYVJtSiH+L0VEMf0HSHybgvEKipv2sNXvn6Rl3hSHGpUWUNRKDA3lBH8ljwqYsnRHUD9pnx7OInC3XVMVTzQFweEJICTW7kVGk8S1dd5Pw5OhNRssag76wRBusgyIe+UsQIBVPs60GWomQP3WUBrWfyazpUqOIOkQg+bIT3Wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788358859; c=relaxed/simple;
	bh=aMgQ83kOVKtOT//8a3YxSzKyOhDVLUMuIP5zhTCpo9U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cgkua4uhwrWxyM2qHh0HhE7wjZeTZBVssPZaAHIPgufRJ6ED+fSjVhDio6KcGA9m87FxDqaaGh8F8o2MmFU4XJN3ZUkFAT5zUvMW21uBLSalM6KavqmIyti6UdLv1U+LxBPwMC3PsEkwflvLKXqesfG3FT7OC1xbjfOLoYr719M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pQek0EbR; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pQek0EbR"
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-7f3ff92cf4aso1198960a34.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 07:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788358857; x=1788963657; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aMgQ83kOVKtOT//8a3YxSzKyOhDVLUMuIP5zhTCpo9U=;
        b=pQek0EbRZsFlOfv7YNqczbgGGfiafpxRvObT8CVg3DXMVAeFtx7TCwHLjCIAcjGZXt
         boBZN8QG272ETc6hOprIvOl5dyOJBbmntfBVVnT6O1sfQIoIAT9hlaEBbKIHon93kmkX
         7EUp7rXdMh/Jc3nFPjzR1OS3zoLHTKLBn6u8yQ4759aIPOg6oUkyGaPY+npH5uWJ2y0B
         Qi83tSKjIfLH3zTS2AzGBqzYAh7ydLXvQ40qglPwQ0eJ6sVI2Y9NShvZw8qlX99q03rA
         wb1/XyhUBp/7+GxvDFdGXpnnnc0fcyKN2fdnhGwIbcwZKN/h1b1Y/Btr3rzIIIkKf/5f
         D55Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788358857; x=1788963657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aMgQ83kOVKtOT//8a3YxSzKyOhDVLUMuIP5zhTCpo9U=;
        b=WMBjRSAcRedctyko0L8QYXcd+9lFOiggw/WlQLlcxjvkXK8AP+4dcToojwexscgp8q
         KDH/ndkOmYv/BD+yuFnXU9DW5u23w0dgdbBprfYVhFhGOgagCMMKULUdJUA+tnMzYpJK
         C5NInBxrlIvRkpgN8TL3gz6rilMI/RLok7/G5Aopf/NdeHKT3E4NzjyfqN/iuj2JkeHP
         K1b7iOFkwCYmaZq8FN8/tRDpTvv/Em8Z+yB27wPUy7ewTJkT53FhRitMGQKdZ8dQTOAd
         FdifTJ/Nf5z6JCxqnBkhKwN9PEze/lmjKGAx3ObSmoh9IRJm29IjJan2XpJlnFiIfJCe
         IrBg==
X-Forwarded-Encrypted: i=1; AHgh+Ro+BITZS/UpU0yHbiy89Hx0oVUqTILUVTHidUb1qfMA+pk2iR2C/9FU3PZdO7lK3A1//OvBDrMT7VSu4As=@vger.kernel.org
X-Gm-Message-State: AFuF++mzV6B8q+69q/0YQyJ9LrrrtRqHcfnZdjiTH2FRPYicOIcyCZfp
	devCavS5w1ERbYyj6QreWcoqgVIE0tAo7vOjJNTN4OJvHWsE/WTq4YxJ
X-Gm-Gg: AR+sD11Jz3yXz+zOrmvCgCVH6ljr3DNimqSsW0TGtezMZeBpFVtXX8JyWUhlXZ0QY2M
	ZFRn58D0LTtCzcpyjVz4zfn1nrfayQPyZuXd2bM+/ikF50nofntRA2rfGDINdoIj+ibKflKp1Yi
	E3rPw1B12TgJ9+f11Di/BXEHxbBeRBIfS3IsggF9HtdWdyOY+SfLZqDZck6UV5ukld+b0xb6xJ1
	bPRS2ms1jcr25DrRLTS+vN11y/aa4f10C+7QfjAKYx7JFD+UfT7rPpAThcqPbj4xNzbZee0f6XL
	5oNtTl1TuY6uUVIuKqEXs93yKXnokkvuc9aQthrtZfZBhHpE79Xp3qdHQ5ehu56D5WkJm2OpQ9X
	Q6CrkDGfbG1Xgr/GCHIkRLJQUcLK+z4I2p8upD9LF1DdBCpProl+IM0TXvxTpnc4drlzINT6DJu
	hFh+1ZAgMeMrZer4TcZVbJ/jAnYGFAFExrkeiRDs0g0GpwJ9CUgzp+7nuT+y1G3SUv4/8pvoDAu
	NI6xQ==
X-Received: by 2002:a05:6820:210:b0:6b4:63bc:5249 with SMTP id 006d021491bc7-6b48153e1a3mr3735995eaf.23.1788358857171;
        Wed, 02 Sep 2026 07:20:57 -0700 (PDT)
Received: from aditya.tail9b10c1.ts.net ([2409:40c1:4c:f2c:672f:3d11:f7e:5e19])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-46f30baa0d4sm3804836fac.6.2026.09.02.07.20.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 07:20:56 -0700 (PDT)
From: Aditya Pratap Singh <adipras1407@gmail.com>
To: linux-bluetooth@vger.kernel.org
Cc: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com,
	syzbot+98baa83c342e86a836d7@syzkaller.appspotmail.com
Subject: Re: [syzbot] [kernel?] WARNING: refcount bug in bnep_session (2)
Date: Wed,  2 Sep 2026 19:50:38 +0530
Message-ID: <20260902142038.345734-1-adipras1407@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <6a86bb5c.4d75e56a.c9a88.0039.GAE@google.com>
References: <6a86bb5c.4d75e56a.c9a88.0039.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

I would like to investigate this syzbot report:

https://syzkaller.appspot.com/bug?extid=98baa83c342e86a836d7

I checked the dashboard and mailing-list archives on September 2, 2026,
and did not find a proposed patch or human response.

Is anyone already working on this issue? If not, I plan to reproduce it
on current mainline using the provided C reproducer and investigate
whether concurrent BNEPCONNDEL and HCI disconnection cause the reported
BNEP device lifetime and refcount failure.

Please let me know if there is related work I should review.

Thanks,
Aditya Pratap Singh
