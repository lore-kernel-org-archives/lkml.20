Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F6693AA1BF
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 13:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789738101; cv=none; b=jWUwtDepVm/x5ghFIbIxbPhEjfWZFKtSZf0Y7v+OCUe1PU/PFj1wpO04BMJbfIcb596SNA1QKIH3DL6zUFQLgKWMElem3yhGSyKy02rTZ6YbRvp2PZoM6AeCWZ6BqfMd+Cv/gZ/GBjLklvf4htMtnpfRkphUJiX6Qu1enCz5tUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789738101; c=relaxed/simple;
	bh=zIvzoRp4EqaaXbBaAXZ0LdKRD2UHE9DJZN9NC6iw0vU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=du1XHTENfF+e63aB4HOSkN66OZRGEVTz3jvqV5vVMVESx78c0J7fmivlR/ZgkiGqH/nultFZwQ4CVb+oc9jjJgk8/1lm3vQ5Ol53rASKk0/A6Y+mL5HuXgBLtveLAdba4Ni+RGaoB53iqlonBZL40VgES/7I76IvBvAAitH0qy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KWuZQxw/; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KWuZQxw/"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e721b5503so7474165e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 06:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789738098; x=1790342898; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zIvzoRp4EqaaXbBaAXZ0LdKRD2UHE9DJZN9NC6iw0vU=;
        b=KWuZQxw/I3lqzg9qw7ZjQiGz/Z24MK3auBi+URcDsAqMC1JcguPlshPYLhqPAife6l
         nM5UEGslRvNHPw97JNPJ+qdvY7KP3lVQ+ajbCDMNS8xvX6zrxMjZ5AT3wo+t7kSrJItQ
         AtQeAvg9oyUxiWBloXmYKbEm332Btg4CSjtlcUDpYjkb3OWMLJXkSWjAV+//rcWPV9U1
         /S7Sx+16EAozQAWxMSwwndPfpX1iYEuIUrn6B0ZhgYLVcYidhyESJWgSEkgHXxzY+yT/
         e7JhbG4iprer6Czh/tBACxTaiEqefU8w9b7HuKaPLKfGYw17XLrt8fKZxkXnBSGjS26b
         2T1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789738098; x=1790342898;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zIvzoRp4EqaaXbBaAXZ0LdKRD2UHE9DJZN9NC6iw0vU=;
        b=fcVVxEhDPj5G2h0Ky1jCbTjy6KhK0JwwI7YyI591P4cKm/++OjYNXhslclmP46kLCb
         +gySyVxQ45pqFMqgWdArrlYoTHS/m0J8ovp7n6ioRxAOxq2qH4pC9YsBICljlS/oJM6w
         93RNKI/ZXnyUCPX4R8aAQqDCukfh08dNtEJdYrRpowyiYqiimJOGiObA9sCcm5zXDbDi
         qdGPMQyu8noE8nzCcS3OMw4VJb7E1hbI8M55Cc23NIeCbt45b8SKe6VKG5W0V4Kat87Q
         /bLQcoRMdUfgdP1dbh6hcqRQRILl6AaARkf9/R4A7yyjoLTacIrKIvqYU0UM3XhE6TxT
         4Gjg==
X-Forwarded-Encrypted: i=1; AKwUvBxpkJXITxPGuDJeWlgPFi0e8XJLu4KEA/36uK9Qu32kEO8F20EGeY/DJr6OJbQk6tO2n1WUdrenFH+lmpY=@vger.kernel.org
X-Gm-Message-State: AFuF++kv0yGxIEf3Z3dhlgwxcVU/8zrqGtm/N3udtFsAQrk/gibAQYEA
	e1TUdwFUyTU9uB2K5SG1sOnd1KASiYUEpLIjL08AvlnxWHWwJWnip9Be
X-Gm-Gg: AYBFou0/3yghuy0o0wfdei5TnviC5P7ClTLeb8BN2dFJzKCwcS0WPJ4XUP4lXaBYzGm
	uyvxcHGUWwlGiSO2K6t/3mMcvdGHlbSqKVHG5VK8JmmrsAz1OYFSgLuifcW9m/C4X7HoYDrN0s1
	wHxuEVaLLRwpVaeKHbVYlf4th9Tt70iVfiFqVCfUW2jJF9zLPBkdbSTL/+1PT29rufFaiLcEJr2
	w8v1u9JOFSbm4zyEcbnR2XR5RaLUP7CoLwcZ1tLUTk6Aa7jqAxNrvmzWnkf3/aL7MPvxPmTOVe8
	IdWJHY8rRcqkIa9jm6QAKls9T7riQoFl/nhdaqarsTi2KKem/wN29IYzRKJ5jCNkwTCdo5tjlrq
	yEhxQV/qdhqYm0OK1nQjrLRBbjI8wGyIZU+82jDDMzBWPvsoYZpApZ2pGsuE7RiryhaQ+aMK4U4
	uPP5Rik2LW6cP7qzi8vBiRlSZrCHf8E5ecLTnWFbHS3+yeqpEMslz/Wt3YakUowuRK1rwqC4wu9
	Z1JH0rO2nG0HtdABOE5isg+Iw==
X-Received: by 2002:a05:600c:1f8f:b0:49e:8354:26fb with SMTP id 5b1f17b1804b1-49fc574c729mr35408655e9.32.1789738097326;
        Fri, 18 Sep 2026 06:28:17 -0700 (PDT)
Received: from dell-desktop ([2a02:587:4b4e:8500:290c:210b:1c76:5710])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc58a1176sm40807795e9.2.2026.09.18.06.28.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 06:28:16 -0700 (PDT)
From: Anastasios Papagiannis <tasos.papagiannnis@gmail.com>
To: david@kernel.org
Cc: akpm@linux-foundation.org,
	andrii@kernel.org,
	ast@kernel.org,
	bpf@vger.kernel.org,
	brauner@kernel.org,
	daniel@iogearbox.net,
	eddyz87@gmail.com,
	kpsingh@kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	ljs@kernel.org,
	matt@bobrowski.net,
	memxor@gmail.com,
	song@kernel.org,
	sun.jian.kdev@gmail.com,
	tasos.papagiannnis@gmail.com,
	utilityemal77@gmail.com,
	viro@zeniv.linux.org.uk
Subject: Re: [PATCH bpf-next v8 1/5] mm: Add copy_remote_mm_str()
Date: Fri, 18 Sep 2026 16:27:54 +0300
Message-ID: <20260918132754.43435-1-tasos.papagiannnis@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <0b276f0a-39b7-46ae-b72f-6ba92f65380f@kernel.org>
References: <0b276f0a-39b7-46ae-b72f-6ba92f65380f@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> Two tabs please. (I thought I commented on that already)

Sorry, I have missed some cases. It shoud be good now in v9 [1].

[1] https://lore.kernel.org/bpf/20260918131757.42802-1-tasos.papagiannnis@gmail.com/
