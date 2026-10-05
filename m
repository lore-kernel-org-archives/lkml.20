Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BD25305692
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 06:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791180894; cv=none; b=DT4cTfqr34HeeWCBruhn6Xx8b/ebU9vAycaP9rd38D57wJJOCTj6PHu9PJ8qtMWjHaOXXg486aakTW0Ovfsu3icc5CEgneK5II0vHFQiEVdmILA5fIMqzftMBiTgepFg9tpBEMKqSGDJFBBchKBytzA5QHyDwDt7GeSuFhSSYUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791180894; c=relaxed/simple;
	bh=uD/nb4O7ZbLjFJE9S7MPQ2OU8Ry8eaH9EFc8B05jpd0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qZXOGsw1nfNONI9XA8z9pyTa1aTOC9sbRF8Pq+kPtgqobchXsC/fCvNXP0DxFvjFHjBrnMgwTEHGBLmJSyJplTP970155Zu0V0sKPcdnxwhhkgmcxoEGBLOoPd/MBfNQUN9nZ+GOEItcR8JTNa8ePxv5LpTYY8fL2AMRmGcKuEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GF99Z/lP; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GF99Z/lP"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-34c4a0868b6so1046842eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 23:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791180892; x=1791785692; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uD/nb4O7ZbLjFJE9S7MPQ2OU8Ry8eaH9EFc8B05jpd0=;
        b=GF99Z/lP7aN31CIMG+/6AiTfigp8XQwqLqrenTmEBdd19myWxwGgLcEkVzYqwTn8LL
         o32guqGacQS8qK0QLf6osz+0wPfIxfhj2d8yaKdeLGe4MohIsKVKbqzyR0vottYVXucm
         zfK6F7uGwKIg4wxZjRhXXrXHvyXOW7JFtp9ZaQ6RiAwI+pkaEoBv6SJpBG6q9TWXevET
         M1r2rlDCyALuT/qF7CV6rJPqmcaDZ2t9AEGwNm079QRwCsjRrXm85lDk8xhnc5kS8xjJ
         vebZslVaJZps9VtYmSUYfaj3BXGygVxA+jvOOyULYiuBjnpW2ZsNzDpnbapxYiEtA7vI
         58Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791180892; x=1791785692;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uD/nb4O7ZbLjFJE9S7MPQ2OU8Ry8eaH9EFc8B05jpd0=;
        b=kmuvaEbawCGIb1NrnYrjVMJNo4Cc8Xt1QiIGhR3wyGEX9j/svrJK9SYI4KcsUxeqf5
         7D4rDQZxxvd1tzi6eo3MtHr6OKpy+YNerkTT9NqwMxFPjSSWaKboDTrJFr2eybQv5UlY
         lWYw2h7lJBhMYYDuGeXLrHBdESxk6cNPMvWGNUc9xoF0stfZpbtr+0NNw1lNtSpbyl8X
         YZbL/DB+81xCt7yPcyUqLvfGY15j53bn3O8rj+RFmznxuiTUjkqx3QvLqdFGXynF4aDw
         i4gkEWiDti77S+vGhciwUVx5t3A+jZa9Mh3RCirqJNp3kSfcVITf3Y2xiJzpHpny0/cP
         pkIw==
X-Forwarded-Encrypted: i=1; AKwUvByuha8a8IJ2yyMFM7e+SsjONpU1XotPIH4uK6qa0YuggzICW/OUjUOpKmuTOxD5Zg0EL8UshgIPOrxcf0M=@vger.kernel.org
X-Gm-Message-State: AFuF++nmA0SUgW38jJE2P3zb6w68sY/B4nb2I5euf93AJ81LXVRKlBdp
	qDnsU6QDRCHbX3GOSKXIsaG95lFzJ/oT3Xzv5oMDvhFW754UpyMpIB9b
X-Gm-Gg: AYBFou14xhZ74Uqe2H3k0C4iav4ursSQ4lpzLDvZJ0+WLEPmYFZqypo68tQ40ov3/Oc
	+zkhtRKvZzBTs+8HbUbrJpgRMTmCghTcggQ0rWjckkyBZJK8mW0B2KKiBInMzIvccBeUbItGMpM
	lZC01maR/6yTkIUMzTdSvYFYYWM/Dt0QuciSDmgcy4xiKHYP244DPmTLrOiBtUB9QtMPOltDOgr
	J62k0SLEXtwpaBNgfDvVbeRMES9aA+BTphA/ULUlxxMsAxsGSQrtie7HJUhuLWHHQMQV7a9WnOA
	XgZ3yMl2ZOh+y4vj6Knwx7wWrQ0ahlbW47d6gZMV/DZYkw2ZDqEY8tz5nyRsX4M47if1NEOlp9K
	6W9dWwwtYBhvFyrXundSevEwYhQRmmGz2VnbKuAFFOWqdpFq2qXc3pPU8FERJpFdcJgvn2dC1Qe
	OBHX+IpAnmDpXwGqVHCzQwkwSDxzK4ReDAPX3NFUuzOz9XOS3iZhkjGACCdhHFBWN7xYqactT9T
	2Rlcs3hJZQP5k0bEg15Aw==
X-Received: by 2002:a05:7301:1a8c:b0:33e:6877:ca6a with SMTP id 5a478bee46e88-34db77d1fd5mr14503161eec.26.1791180892305;
        Sun, 04 Oct 2026 23:14:52 -0700 (PDT)
Received: from umang-Inspiron-3501 ([2401:4900:1f3b:8187:3c00:622a:7472:e26b])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3512718d9edsm10968288eec.19.2026.10.04.23.14.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 23:14:51 -0700 (PDT)
From: Umang Pokhriyal <umangpokhriyall@gmail.com>
To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Cc: Jason Wang <jasowangio@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v2] tap: report IFF_DETACH_QUEUE in TUNGETIFF
Date: Mon,  5 Oct 2026 11:42:35 +0530
Message-ID: <20261005061236.22907-1-umangpokhriyall@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <willemdebruijn.kernel.3720fccc8b4e4@gmail.com>
References: <willemdebruijn.kernel.3720fccc8b4e4@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Willem de Bruijn wrote:
> I suppose we want tap to expose this state through TUNGETIFF, like tun,
> because applications already use that?

Yes. CRIU reads IFF_DETACH_QUEUE from TUNGETIFF when it dumps a tun
file, and Cloud Hypervisor did the same until it found that macvtap
reports every queue as attached. Code written for tun's queue API gets
the wrong answer on macvtap, even though macvtap accepts the same
TUNSETQUEUE.

> Else cleaner than working around bits would be a whole new TUNGETQUEUE
> call to match TUNSETQUEUE. Rather than to squish this into TUNGETIFF,
> while that has no equivalent in TUNSETIFF.
>
> But, that approach does not help existing applications.

Right, those applications would have to be changed to use a new
TUNGETQUEUE.

Thanks for taking another look.
