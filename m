Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0A3350C28B
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 17:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790789614; cv=none; b=Vkz7/DQ31zjVxxIQ1X/QNt3vKqRl+9xI4WfRRSubs23d6cgotWzKIb41twI+qTGiVmvIj6Lmlxj9Th/X5XA5UYLr/0KqPgO+cYpBxBOhonKSJ5vOG+7oP1HsDUsRUmxSnwbgXqNSr3y6sBmBjjkcHjN8axgUFCwdyjdyl4KCT7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790789614; c=relaxed/simple;
	bh=p+ILzIid3gZMKSRINTnt4WslPGttrFKh3IKqGQ6yogE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=m7ab6ygOxIlPjyH2gFhIzdP2n2Sx5GGJrx8Muj7QNT/kYJz/VpXsXR809TidTQOXi3ejRc774lv27wYCVNHWzX0caLL9XvcdQLHHc0Ch2Xx8b0pE693QHb1RFaaQTGtrmKJSeNcwaDSTF8u+lLRW7BJdd4bfQAgmm189MbZzGU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sQ3ODerA; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sQ3ODerA"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912d3931so43000455e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 10:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790789611; x=1791394411; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p+ILzIid3gZMKSRINTnt4WslPGttrFKh3IKqGQ6yogE=;
        b=sQ3ODerAJ7F6d3a3rcwmAmBV/9v50J3T8AG/f2b84StjcR8C7ZOY7dZy6H15pFigKp
         fMA3VumD2cbfUm/oDZo2PJlkDdwJ0r+RvqOWZqiIf1JQJ1aoKImzA1mET0OhIcuCIkp5
         G68xFT2L+qz1BBp0X1QrG0EGtD+TKcrOIaPNrNDxqsuJ5fM+wFWmuXMlD47wW658brvR
         PeKiv2QJ4klVOFxL4DeqU71m4MrvV7siNKaU7IbC85THWM0B+kZIK3g3gKHiqlyt2NSd
         qHDLzhfxSkX3JNRaRnuYaDP+zkhWrrXkF9dIIe/k4bLQ6qg8xMXTsMK/B9/sCmrSVrkD
         qLGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790789611; x=1791394411;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=p+ILzIid3gZMKSRINTnt4WslPGttrFKh3IKqGQ6yogE=;
        b=yjdQDERR3nWpSBkcEMFGOo6MwsReewZh2AMBToDfVs0HvMlRo5eMQ0xBctHYGeznCb
         8wDwas2GNpDLpvirCXNWzRmpOzcYI1noYQuB2bfnIzLdvUrhwlvMY6QZYEus7/zZcLSB
         0EpqB+OnG0/3VBG7FYqHqbkampDuqtHSVHxs8XWP5vLbvnlH9WiHfLqtlnaG6Y3TF90E
         EgnX/k6oatYkWLSRFE92zHwZjzY6ar5AtXkDpf+IoSpmUbxw7kH97g6t75+wYlzBrBVq
         tWgYrFf49RhhfDq+D121Lkcf17QnfsRGD67MinIO100H3CZywXDRnXh0W9tXbhyjSeSB
         jIAQ==
X-Forwarded-Encrypted: i=1; AKwUvBzOFW2Q7dgiUb33unqGHPW1z5CnoAtzQJuqimjUAEcttrz5W1ueMJaI5suvCPxqR98RsXvLvpStgrAgXtM=@vger.kernel.org
X-Gm-Message-State: AFuF++nun3dIo6uVWnpD37cyP9yi1Rokh0iauqaGahNFMqFtOp6aD4c4
	TSxsuZLdHnYJbzYIZA3Aixmy8quJqNAxEMB6XAuiimg+aH1QTD0Bzcyx
X-Gm-Gg: AYBFou2vKXOTAYD/2CLPZKTjmCfJjFzmKJPL8/Rs6xYHYVMNWPoTgT16GL45Mv5oK8p
	nuBZ2/lS5BSwIHsqZReBTIsaNUl2azrqRbjnyJvmHPnfqFQCvEGu6WQ04joURvUt1bEkAeq7GKF
	82uKf1rSl0zQlUMUJWU6r7kzmJO7evVuwHgCnV9m1UtYKTrSwgvY/eeM0Gy1dSgYD0ChuPdRNOd
	qqhak+cdhH5PxbFt1fH1fB4Iilw4fovp7Qiy9LR/09qgutqAM5spR9Wn+0xso/nrGNfayDNL4/p
	q7xM1Qo0fGfbjPPECkGxrbpWHqwRky3ph7Iwsb6t58qbbeSQNtDFWqrLS+a68o7IaunIcX33gPo
	gyrQpDXenzyxNC4xZaAaOon/sQfs0MecTA1Nc1p+Oj5fH+krJK1yYo1la/pmpadfacaWSPSF6FK
	cHR0IFvVWem1wVTBJL3O2YdVcJlQdrH9To+nUGm/iDyazj4cBecL+ISvl6zSYYJd+SzGoS3fVbx
	irmt9FGNGBdPviMThSd7bss2x5OPSdeldSRnXmarI5G+iuLO8NqXWPcfxX9AZsvJD8=
X-Received: by 2002:a05:600c:a10a:b0:4a0:1c16:d6f6 with SMTP id 5b1f17b1804b1-4a01c16d8bfmr24449495e9.24.1790789610840;
        Wed, 30 Sep 2026 10:33:30 -0700 (PDT)
Received: from Raghu007.. (sgyl-44-b2-v4wan-174108-cust110.vm6.cable.virginm.net. [80.1.81.111])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b0690d284sm492771f8f.17.2026.09.30.10.33.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 10:33:30 -0700 (PDT)
From: Palla Raghunath <raghunathpalla.0209@gmail.com>
To: Jan Kara <jack@suse.cz>
Cc: Shuah Khan <shuah@kernel.org>,
	Brigham Campbell <me@brighamcampbell.com>,
	linux-kernel-mentees@lists.linux.dev,
	raghunathpalla.0209@gmail.com,
	linux-kernel@vger.kernel.org,
	Christian Brauner <brauner@kernel.org>,
	David Howells <dhowells@redhat.com>,
	linux-fsdevel@vger.kernel.org,
	syzbot+e8ebfecec06a009dd2d3@syzkaller.appspotmail.com,
	kudo3228@gmail.com,
	Mateusz Guzik <mjguzik@gmail.com>,
	Deepanshu Kartikey <kartikey406@gmail.com>
Subject: Re: [PATCH RESEND] romfs: reject directory entry chains that do not move forward
Date: Wed, 30 Sep 2026 18:33:28 +0100
Message-Id: <20260930173328.79017-1-raghunathpalla.0209@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <34t4huzelgho3zelar7vp332rwerth7nso6e76jrfced4chtrt@7q2cjbeymwov>
References: <20260918164645.9230-1-raghunathpalla.0209@gmail.com> <34t4huzelgho3zelar7vp332rwerth7nso6e76jrfced4chtrt@7q2cjbeymwov>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, Sep 22, 2026 at 11:58:35AM +0200, Jan Kara wrote:
> I doubt these bugs have any practical relevance so I wouldn't CC stable.
> But I guess that's for Christian.

Fair enough. I'll drop the stable tag if there is a v2.

> The patch looks good, I'm just not sure we are guaranteed ROMFS directories
> are indeed following monotonically increasing disk offset (although that's
> the most logical thing to do) - added Dave to CC for that.

Thanks for the review, Jan.

Documentation/filesystems/romfs.rst doesn't state it, but genromfs
always lays directories out that way. processdir() hands each entry the
current offset, which only ever grows, and it places a subdirectory's
contents straight after the subdirectory's own header, before the next
sibling. Entries are added to the directory list in that same order,
and dumpnode() writes each next pointer from that list, so within one
directory every next pointer points forward. I don't know of any other
tool that builds romfs images.

If you'd rather not rely on that, I can bound the walk by the number of
16-byte header slots in the image instead. That stops a cycle without
assuming any particular order. Happy to send a v2 either way.

Thanks,
Palla
