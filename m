Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD17C51AEEB
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 12:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790166762; cv=none; b=cIqL7XxbTjXqSxjjRAnFuuCuWYsXjhvKLxgN7KTVCI0TJQO7o9sr0/tXPl+FGme5MhIq28FcOYXlsgGAEdFc6Pd9KxkGvq/ixBcnn6MM662/LZmGAILxplA+aWEXIqf2joERhzJF+vNMFHH0vkQ+YRr0moVCOX/2CT63Ysd722g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790166762; c=relaxed/simple;
	bh=cWL4fevHSSSX8thrOI3c5H6tW03iYZLERBtXM0woPUA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=siJgWr560lqaQoyWRKWAHkoNbUSOxH1YItmTw5aFqUN5m51KwLdUkv7MvtARE/iOhxr6OgTsgnfTUBGrQ4nRKtpVf8EBI+IabRKEx2q44qPTZnLI5CEzkcI/YxDGFEyL5prcDyF7cFbYGToBJTCbBj49tC/+bexhVIXFFGUj8lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TOgdQVo/; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TOgdQVo/"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-8631d0023daso461538b3a.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 05:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790166752; x=1790771552; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cWL4fevHSSSX8thrOI3c5H6tW03iYZLERBtXM0woPUA=;
        b=TOgdQVo/EAIi01lwyP6QPUmRo0RUlNswRL2kxckK+tNpbOx/pVKRGuqJBlgR6sNNEE
         MzYGjJ1SZ4ajOh5NfYaHWaeweWMfatUV8C1qksxppQMvxjIS0PBpmcoEcT9cGtSYrAGB
         Lm21C4PPw1w1OO80aga0nKRI6dRt3dQpDvXfFRkay7i8kKzoStCAnEHnOJKSVnVd4F5f
         wxqZwA/rwMMVoVEpoI5Glq2Ofh+ZSAZ5Q9N1lFpCop35G84+vjYPGon4ZlfH96e25wjm
         EBSbSg6a59ERHOkgYxePvADsRpMIbJ04fI5MNSaGYofy+zMu1GxAVcsTjNHWy2vivN2M
         nq9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790166752; x=1790771552;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cWL4fevHSSSX8thrOI3c5H6tW03iYZLERBtXM0woPUA=;
        b=d4eJCfR1pcKGPPn+Qm364pz6wE/Ura/ENCxBxSBlIkxCYv6wcl/t58ir8X8+6FAFda
         Pova4ta+Hi83jjwqUuvHzl7Kh/NyEqWtQW6b5+HruwtYLOjRyZQ7ZHvuXivDn3CsKz81
         k0N9r/K91fExRtmwXQan+RzrcDYLTI0AE6NhjgeS8RqkiUFmwkLG0ric3U98mSyqP9dt
         cyeLxp8KIGcn3VXa8k4CUK76AQG3YSKAPPHMXCnv1BPMI3vYjEYOnN/6I4kP7uzrULNS
         MhTD3+AKdo/WTnGSJ9aOxpN6c16RmEeueeCjQ6fDp2ypw9FFXKOvoxQBap1a2n44yuFh
         8MXA==
X-Forwarded-Encrypted: i=1; AKwUvByK/DAvoPAJ0c6HSIP7fDi9ZZ9Y4dHV0PtAO5dT+IihLS9FQv25HeAigMYqJbWqfz5MLXdrjaQ8kfnBhoM=@vger.kernel.org
X-Gm-Message-State: AFuF++nU3s9wirn38QtDTZZPXv5+5NdZLCmalyvOjvQoPmmikD6JPwsU
	Jdd461PnWa57678VgsaP8wc1MyL7SIMEDiEUH0F5u6WDg//pwA2K9dlW
X-Gm-Gg: AYBFou1ehwyhOlc/KLSD2L+tdBks0SsU4/ddLnd7iPX+SfHln8Mc/cRMIAHgPdHll3L
	8VRICvYKBXoE8GLq9JFRRddP9eYg86V/hAiKDe0eXz4MlzBXSIcCTkGluS0quKZYJfk+FFc6VOV
	RlTD4Rp6Sp508XAumFn75hejvThykfJF0AAW6mtDJVkTC1cAOeuHqVYtGfFst3XQJxpuApD3nkB
	cLkdmh9do5AMhSsZASvr7zAB9C1MlXkLB6pv42sVWFMuHcNITxlX/PnyxfiTvpc6YHRIhgZjkQh
	grcYJc3rFdn494JnNHK4B3BLN823leHrkOwmTVng0PiTbcJB9Qr55n2tYdqB0/jk1c8Neo5cAZu
	sfmqd1lqw74KMxci++0eMhnPdpiQw0owccMKkM3jKciNIAdjGysS/kSYPBFhECmjsqmzHVRQ+5C
	ils0ujCDT0aCi1hLpsQKLIK+2trtDWJ/4HchFqzirhQZhq4nw1k1E+f6mFLwmBb8q8xNq/qL+aw
	IW3E7wWTGSh
X-Received: by 2002:a05:6a00:3407:b0:842:2419:6c0b with SMTP id d2e1a72fcca58-87d1a7aec9fmr2191941b3a.10.1790166747788;
        Wed, 23 Sep 2026 05:32:27 -0700 (PDT)
Received: from localhost.localdomain ([47.100.192.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1d5c252esm1127535b3a.31.2026.09.23.05.32.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 05:32:27 -0700 (PDT)
From: Yang Wen <anmuxixixi@gmail.com>
To: linkinjeon@kernel.org
Cc: anmuxixixi@gmail.com,
	chizhiling@163.com,
	exfat@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	sj1557.seo@samsung.com,
	yuezhang.mo@sony.com
Subject: Re: [PATCH v5 2/3] exfat: retain the next empty directory entry hint
Date: Wed, 23 Sep 2026 20:31:58 +0800
Message-Id: <20260923123158.1626278-1-anmuxixixi@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CAKYAXd99=QNEFH3n_=PyAYFrmTkqqxsBFHamYYnfOoFNex52Ow@mail.gmail.com>
References: <CAKYAXd99=QNEFH3n_=PyAYFrmTkqqxsBFHamYYnfOoFNex52Ow@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


Thank you for catching this.

I have updated the error path to invalidate the name filter immediately
after the initial exfat_put_dentry_set() failure, before attempting the
cleanup.

I verified the updated series with a dirsync I/O failure test. The create
operation returned -EIO, and the filter count decreased from two to one,
confirming that the affected directory's filter was invalidated. I will
include the fix in v6.

Thanks again for the careful review.
