Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF4F33C10A0
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 03:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792206629; cv=none; b=cj432qp8k4tRS7MpynnaUYlPxMn6/eNBDslFzFhMOsbsL9fox7/f1ki767Rn4HTsola32MAKWQ0QcFmix/Rd1sj+pf6OF1sBRgw+kddXMC+aUaKxc0xXT3H49UQ06ly+X88OCOoy2dfz31sXm5ecMWakxfN5+rsAfIHRQv8GO+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792206629; c=relaxed/simple;
	bh=/zrStHSnrdBLteYWkJki6mlZWav737dTxgFd6gq+aJc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WIy7U0VJCPRatf65oL1YbGa70CVtWSq+zHNBsFcA2/ju7Wuru4wwJaepGAnEO6P38w9Bk2jAvTDNhhzxZtA6ZepkLRy5jocKxsCl0cVTI1OlKXvEseNHWOTQs9vTGwZMpAS6qH2Mj26hdVtK74PcSKtkv7HHCBvkaC6Be6zz6oI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NLfjXpBy; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NLfjXpBy"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-35a31bb9fb6so1032369eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 20:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792206626; x=1792811426; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/zrStHSnrdBLteYWkJki6mlZWav737dTxgFd6gq+aJc=;
        b=NLfjXpBy0IXo2vWMYhCnPFiJVxQrpS9k+qstCXzv9E1xE9ePo4m5INCzQheq0JG0tE
         VHlhU0WAAzp6VMTk8fw4C9eiyGs22mbog39EFoTzB+EIY+79ia9qU6GRW8wBRlPEs9Tl
         GHA/ravoAILMf6D7EY6TVndnxm8RZ9L2UDlZ1ec7vd0PsTkjapWdvApuql1Rfvv23NLv
         mYZ/eHp6BvXcRVF53y2mLPhnXAllfyiD8QMEEkR/0zJ/oN4xy5fW8kRNLMGoAfmuD09Y
         Q+631AvqKtB/Epjt5NEU4xGsC04GumQ9cCKyoyTUXHF36fSaYvDJuzuI7XJvpXqfKQHs
         G4jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792206626; x=1792811426;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/zrStHSnrdBLteYWkJki6mlZWav737dTxgFd6gq+aJc=;
        b=XeawXpdWmdp7V+4iL4ydAfzHCz/SCcvCrWtJ94K/61tt6R9cLYkfHQLB2Uis+m3hrv
         wMubgYaScxDTc5DQJskmuUvNo5GymJu6MFmhyFIkjLMF2R7MbtA78EG1wkKcIB2ybwdb
         bkeMqvQtzAmXTnQPLLyzOJp8l7g/UMlRCESNE5TW2iw+80SpjR8AfjgFiiNOAkz3c8zE
         IS6+STwtKDwfDEW7c7NSG2UjoneZiCPmyxxRExMUfbpbGjwEdIeBNR9ya2NxS3RjZiSb
         gRqgBMpiCluVwAP+7aLFmib4nP9+b1A4GXTfv6vXY2zN2kwzMlqv8aq5THrN/2+HNrOV
         v+Gw==
X-Forwarded-Encrypted: i=1; AKwUvBxDnHLEOxjeFG3Bhk4Xia1bxrJzJReJaXusLvLn5vzcPjl3//dwTg6EOmZIn5Kx6NC6GZdomgHrAmS8Dtk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLoM0FZwMF2DR3d9SJjGypVuinCz0ayQp3TSYfGAdG4YEk4faRS
	6Lcp9F9IqKten0YlZKsc5LJqJcDZyvShCHDJdLst8LNzQoN449AmujxR
X-Gm-Gg: AYBFou2GN1SN9FurrbrLXXm5YCb2ZIuSAegnSE1OTZ567pO2QtchN9RvGtlpUJWgWLn
	aCsh+LDLKAegiPvt4Jj2FhLgAMEPKi7mhlP+wKnUw+nU0e460MO2TL2/7u6LsIo/VuDrWJS2lYR
	u4VuyDXv+IlNFopIby02QvV3J0IBFbQ+AOmu25pRRAyjaWg91r2F0tQEfzinXdgRSIwaT8x9kAC
	d92km0oxV6qJlWPAuoSVM5B5SV9owLuqeuidUpuxnLHeZwp3lvfKFMq/4bPJCHCniO/X+RENDDg
	irGBFoMKMA0DRc8h79NCNsnokKvauFljQkIhhG2ZidX8GDG8g6yDqvmlppRWtUODrqhPVbgEi+7
	w4zC/brSyEDre26O2OQx13N04NG+EKCGsXCCIzVE9pjIbialoqGzWOoLGfeTZbPs2cUo0vQrs/P
	w4HQiSCRBVJHshq2giPhjPDaaeUIomuGgU5T+bHj7rIK8+yCgysVshm7g7nF+TCgyAE3sNSPtGs
	P7IheH2yfh3ivnIEtUoujt91fJsi6OK7mfI98pbLmOuxsU6FRNktBOgMcFkbvU3E/ZycHs2XGjU
	nj5NAJ6hCQ==
X-Received: by 2002:a05:693c:41d4:10b0:351:4866:255c with SMTP id 5a478bee46e88-361a2643df0mr2069899eec.32.1792206625644;
        Fri, 16 Oct 2026 20:10:25 -0700 (PDT)
Received: from cachyb.tail18d50b.ts.net ([2804:14d:5c8c:51a3:544b:4791:dff2:6ee])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3608258aa66sm12876887eec.20.2026.10.16.20.10.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 20:10:25 -0700 (PDT)
From: Bruno Filipe <bmilreu@gmail.com>
To: rishabh.jain1198@gmail.com
Cc: mathias.nyman@intel.com,
	gregkh@linuxfoundation.org,
	superm1@kernel.org,
	michal.pecio@gmail.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5] usb: pci-quirks: always assert xHCI OS ownership
Date: Sat, 17 Oct 2026 00:10:13 -0300
Message-ID: <20261017031013.11055-1-bmilreu@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <178832755831.50581.1058201741431375556@gmail.com>
References: <178832755831.50581.1058201741431375556@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Rishabh,

I tested v5 on an ASRock X670E Taichi (Ryzen 9 7950X,
BIOS 4.43) with two AMD xHCI controllers (1022:43f7).

Previously, both controllers consistently reported USBSTS
0x401 on S3 resume. With v5 applied to 7.2.11-1-cachyos,
neither controller reported this error across four
consecutive S3 cycles.

Resume also feels noticeably smoother.

Tested-by: Bruno Filipe <bmilreu@gmail.com>
