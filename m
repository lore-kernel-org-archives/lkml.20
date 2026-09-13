Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D362522B594
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 00:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789260658; cv=none; b=SJXOgRBooJn1eNQtyYe8R7qhZgiyR78t/EY/wMgrmCa8/8qcpjbzvDCcr2kVO/HU1jnjBLqnW3cfEhhSLWM1xx/ak8wfHLIsHCT8ojNIhwrhL0XqmhIFay21JPMOyk/f1yW6q92a7+NEokBBQt4iWDkfcS7nVfaW5ExJ8i6pxto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789260658; c=relaxed/simple;
	bh=A6L23QhtysaogzoS93ZnswD1158Lh6/9mudHFZMzRlk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gccefAH+XNvAh12B6c8Lb36YvdCpi7hACoyafHYhZl/pB4jo/HrWNeEhJdImetSzICcEL0zXC3TbQKwdW+FQZIbZG4Lv4xmmSDuc33Vt27+MdGbCGyT7WbR4o3plhbE6U3mBrfr0SglwHDMGG7RDnQu3jMgF1wlpFgiMdDGrIR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lcxx/Kf6; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lcxx/Kf6"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccafb751so979140a91.2
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 17:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789260656; x=1789865456; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uZqrmQnZ68N7oDm3XCrSRrggNkZKtA35ciFNphe4Q48=;
        b=lcxx/Kf6PnktGgN83qDDzP2su5CuZCPUt90u5X54QiIqP7X+STmCbCJUsjMb0YZGiw
         lusQ/IrFjhv9aCiHDjLi62pg+4MYrEf+ndg6FRtXK59HL/SqKJBVjC2lEVTcg+TsELZJ
         eSoTD4dYWRg0MHbtp6jVlowbkoixGOWC1/sntv4TV9ID/9Sj6j2xFWnvosVyXBWGnizz
         WhKJET7wCY813W44NRM4fE5eCdhqRYNKwsZIj+iKXyEe/HatX3aKfpzwKGKJwoM5qhMc
         4aHfqwPVJLlgXbj7zx7CqlbNLaqpavLk8D2OJOZtfhlIppJg2ua5ed7XO9epx8sUd5OK
         uhhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789260656; x=1789865456;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uZqrmQnZ68N7oDm3XCrSRrggNkZKtA35ciFNphe4Q48=;
        b=Gdh9eca/fyPmTTbghj1SDr/aniJeaEdknv49tgQOvv9jmlo6AeLtn1armn/rHK8BOT
         4bQzqAXkKEfySpSDi9451AwN/zPrkoj0IFD82NOumSfP0GkegPTIkF6saSZbZPsWHTxk
         RVx3GzyFPAJm1lKJi2DjSds1BmwzzVFB4WxRxMmvZ2MFoIL6tH27MvCt6WCdC8x1K5fY
         yZyQ+JKhhbm/5PUNKtj0dbyfEcT8DXMsVT7t1yXV3YdpAhiHupzLcRKZogeXJtC8fezR
         U8pCfnUZAkcCPke1pdjuZ9BUeVrK5eBZ77E7jnGY/tylQnmjG/pXsqduqHj53rUm9xlV
         zezA==
X-Forwarded-Encrypted: i=1; AKwUvBzCRG5jexpKeG5XgmwUBJaNB40pziZfasl/6oVVCYxypHbUdy95S+9KD0VYkjuon4nvVBz563iPtvv71Sg=@vger.kernel.org
X-Gm-Message-State: AFuF++nh17JFDz9okVZwXmf4mfvamG+9uQmKDbPBl3nOGnnMpe0vY9+5
	6QnFwembuYXmMimqNRnl0PAmgfFDbXZo9uXM3y7jEwe10g03CfUNeJY=
X-Gm-Gg: AYBFou0VMXzG4x4IzkCxEB99OJCt29nMu5mkP/q0eW+hbwzpTsReWwCRzoyBptxjhUP
	/S+Tk1N/KeJB7c07AnruVqqks1zk5DAR2ODSfDvZ8RDVJEwjgUZEcfZtW9S5QBJo0z0fNv8/b9D
	odh4joGcZuiEKJwwJMSRCD1IC/ljeBGvpgwgvUnycynZtDFdlZrlht9EahPEV9rIAU++luhLmkh
	S2l0PaE0Z2zUlSztXeaCIwNyF3rPsIU+FjgPJlcknKLPIhy1IIf8MkAXNFJeh2mn6KdD/9Rdqnn
	raRNL7airkgiYCRpjyf/VwGzPjY0x6DKLvnsyWYmX3j4YgEE6fGTm+lg/nRHnuVr/1Uyp0U7O/D
	8XP2rkcQ1c70uwvR2slXTQDgMRCwYtcNizx4fo504Z1y+0lVCpHeqzT4u0SlcFjawVAX9fdo/uL
	TT30fQj/4rKWtmFJaD6bByRiVyD51t+EdtofaQ6PqdVK32YG0leetZIDQwZ64E+hkAWAvw0uMwS
	k5V5/FoNM+YvW3gH1ZDYavpnyuj9ACbZX+E
X-Received: by 2002:a17:90b:560e:b0:398:a2ed:7b5c with SMTP id 98e67ed59e1d1-39d9c3a1fc2mr20056368a91.24.1789260655987;
        Sat, 12 Sep 2026 17:50:55 -0700 (PDT)
Received: from at-Standard-PC-Q35-ICH9-2009 ([106.205.210.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365b8ead8sm15820897c88.10.2026.09.12.17.50.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 17:50:55 -0700 (PDT)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: alexdeucher@gmail.com
Cc: 062bel313@gmail.com,
	Alexander.Deucher@amd.com,
	Christian.Koenig@amd.com,
	Kenneth.Feng@amd.com,
	airlied@gmail.com,
	amd-gfx@lists.freedesktop.org,
	atharvatiwarilinuxdev@gmail.com,
	dri-devel@lists.freedesktop.org,
	ed@aicharmers.com,
	linux-kernel@vger.kernel.org,
	simona@ffwll.ch
Subject: Re: [PATCH v2] drm/amd/pm: defer UCLK DPM enablement on Apple Navi 14
Date: Sat, 12 Sep 2026 20:50:48 -0400
Message-ID: <20260913005048.1167-1-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <CADnq5_PNt5Huo-bk=tqdCLorUp3BDCtdGmaFJDxfVbcKx-CPoQ@mail.gmail.com>
References: <CADnq5_PNt5Huo-bk=tqdCLorUp3BDCtdGmaFJDxfVbcKx-CPoQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> Applied.  Thanks!

Hey, so im the author of the original patch:

https://github.com/t2linux/wiki/issues/743#issuecomment-5347204171

The author of the patch mentions this:
> Combine Atharva Tiwari's delayed-UCLK proposal for 0219 with the Navi post-init implementation for 0218. Retain the revision restriction for
> 0218 and the revision-independent 0219 match from Atharva's proposal.

So as the main developer of the patch, i would like you to remove this patch,
as it dosent give me credit, and also this is not the solution to this problem
as i have mentioned here:

https://github.com/t2linux/wiki/issues/743#issuecomment-5608044095

thanks
