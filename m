Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D9E237F006
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 23:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787874644; cv=none; b=MfTdhuog30B6/5Ak/Ifmj5ig/eHbsTq1TbX1pTxFejD7mo4SppaHvkdFurRq51hlkT5FOlgRPB2SaSfX6EW6dXf9Tw5616U1Yrj0q6jwzGNRWmigicpJxejeLQcxS8vKKFWUxdvWcgRfr9uD+8BOHkiE0fKHEJFGGk59dEOQ61Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787874644; c=relaxed/simple;
	bh=I0w28eDwn55wNUcSFkFqUL0WZNi+JsnEzbOiyxoDOZA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T1SC4LLYvfbaV/XqcHsHmZCy6BOW7DZOR9sTX23t3AhXb92agkxP8cTODcWlXiZJ68fcPlDtkp03xXVmkQL+siVZxkumx37UL1iwxlbRdm8cMprDWpLy4378Yd1dkFs9EjMjEAdphGsr0Fe2/Bd2rYTSFMJ7K4CcqknyUA1RPLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i2m3tXfu; arc=none smtp.client-ip=74.125.224.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i2m3tXfu"
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-66d1082054fso768759d50.3
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 16:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787874642; x=1788479442; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oDf2cFz2MJ91PpGfYzlKTBbzHYxayWBZgz3Ltr8pzsg=;
        b=i2m3tXfuxbRtRkKd+HwICRWj6nH3W+zCDHcVezGriGsdAlrvO1A1fJ6YTqI1o2yxrM
         C16GJDvzrUcQMaZlGLLnIZfnSYibk/aH8hgXPLe9BlozfkuXFEMqwdt08THg5fJEtHbL
         hNlULDQ+pMNzCzO/jiJEHASN5qQu5oRA+BnooZTrRwSenGFbxV/Vs1mKuWEcxXYnKUw9
         TFhKJCIkdTD6IOn6MD92GvwehV9sioXVgOO4NFXq5/Ef3pNStymKNwx8zvb2qteAzD4z
         z5R0snxAVUeRzJaRJs8JRw9ko5HvkjTO3sVovTOhbj7FD7ogq+Bodnsouh2deSv39PmZ
         0ZFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787874642; x=1788479442;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oDf2cFz2MJ91PpGfYzlKTBbzHYxayWBZgz3Ltr8pzsg=;
        b=PJ5RGGKrz2JDryrJo9Bzj54xDKwrbdX5QxCakTmKkUHYLVCNkQScIC1V+AWTm/kNew
         +6odIE7D5S20uZuXQaVwhUs2cU5BmgjPixSw4qFWiFizRc5S+n3utrc8xG4Chk66Fo9u
         D3KjRuDNxECccyzUI/aWgzW5caQe0klhx0NMfaQ+678KythBYEaGnGan/4/Ut2FpEkFD
         I/XgftxM0votcq4owjULgB1dW0dVkb4L/UDwie0KPhJ/PfHEUdOAjj85O9CIVBuXucX9
         B6N/73dbkC1WSM/gq6613t+YYeJtiq02Yhv8RG+i8wuDXcHp3DmpIHbegZNIPEcDN5yT
         VxUg==
X-Forwarded-Encrypted: i=1; AHgh+RrjnjER4iJANXQ3Ulkk6BJ/mybRKuLVarabtH77gsb5sAXqX4oOdE946yNLuNhUhj7PU2mX9eGOBYWAEg0=@vger.kernel.org
X-Gm-Message-State: AFuF++lSi2EqZWvYw1/DEjDRGL4YPA45+ckv513uYLD8m3cCYO86IfEW
	TPOaXDqv7srgWhWzD2HYIzkng4zLkvuUzgrlQjiQZBel39hvoAAwajNy
X-Gm-Gg: AR+sD126EOy3rX4asvPoFGwaONIwtI/5XxCwCi3tUCjuAS2S+sc+Tg6pTjoQmHheT4b
	+ITHe41h6pzn2so9AlTtKlxRydri3ok/q2NO3Sl8O+E2f4+kO5c+iMf8qehA8mQPY/bobqcSDmQ
	ZEvQP4/05lOXGB7NB4Ic9ytXewzfHlzjsTUM0MYzo91ELZfz18uzsfONEworBTHg8impyu5dK04
	XSIk87c1/2C+J8I9CuLw+Tm06Zf+KdqKOI6S8e3zxeNpeo0Je1qeSgyRtYICpS/MmB4Qe26QziV
	pg0Vym8UiASAstnyrIAVsCVIcP97MwHVBDz1p7F0kxNXQyNkL7yCEFp46JB5c7sXzosUGyb79DZ
	GnIwCClZA557iXy2i4MMcLrb5I01Rk8WBAksz6oUWSYa062/QLEPB8ed36h/FWYAcav7CixEKeq
	ifMP91rTqP8MtqAK+ANLQB9bZsT47eHLr4/e5O+shKePE2BhqJIB7KtEW78Fdz+xBrchV9q6cPC
	Mr36A==
X-Received: by 2002:a53:bb4f:0:b0:668:43a3:9db2 with SMTP id 956f58d0204a3-66e4c522f11mr741772d50.32.1787874642003;
        Thu, 27 Aug 2026 16:50:42 -0700 (PDT)
Received: from mac.lan ([136.55.173.105])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66e4eb3de54sm51533d50.1.2026.08.27.16.50.41
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 27 Aug 2026 16:50:41 -0700 (PDT)
From: "Cen Zhang (Microsoft)" <blbllhy@gmail.com>
To: matttbe@kernel.org
Cc: AutonomousCodeSecurity@microsoft.com,
	andriin@fb.com,
	ast@kernel.org,
	blbllhy@gmail.com,
	bpf@vger.kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	geliang@kernel.org,
	horms@kernel.org,
	kafai@fb.com,
	kuba@kernel.org,
	kuniyu@google.com,
	kys@microsoft.com,
	linux-kernel@vger.kernel.org,
	martineau@kernel.org,
	mptcp@lists.linux.dev,
	ncardwell@google.com,
	netdev@vger.kernel.org,
	pabeni@redhat.com,
	stable@vger.kernel.org,
	tgopinath@linux.microsoft.com,
	xmei5@asu.edu,
	yhs@fb.com
Subject: Re: [PATCH net v2 1/2] tcp: fix use-after-free in do_tcp_getsockopt(TCP_CONGESTION)
Date: Thu, 27 Aug 2026 19:50:39 -0400
Message-ID: <20260827235039.82217-1-blbllhy@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <1db6cf46-c3cf-49e2-ad97-752afdd78c00@kernel.org>
References: <1db6cf46-c3cf-49e2-ad97-752afdd78c00@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, Aug 27, 2026 at 12:38:36PM +0200, Matthieu Baerts wrote:
> It looks like you (or your assistant) forgot to declare ca_ops:
>
>   const struct tcp_congestion_ops *ca_ops;
>
> Also, I *guess* a 'rcu_read_lock' is needed in mptcp_ca_reset() from
> net/mptcp/protocol.c, above the modification you did, to get the name, no?

Thanks for catching this. I messed up the local version and missed the
undeclared ca_ops. I will fix it in v3.

I also checked mptcp_ca_reset(). It is only called before the socket is
published (mptcp_init_sock) or with the socket lock held
(mptcp_disconnect). The ca_ops->name copy sits between
tcp_assign_congestion_control() and tcp_cleanup_congestion_control(), so
the ops object stays referenced and that read is already safe. The v2
WRITE_ONCE() on the subsequent NULL store is on the MPTCP meta socket,
not the TCP sockets these two UAFs race with, so I will drop it in v3.

Thanks,
Cen
