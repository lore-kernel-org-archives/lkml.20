Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.108.3.166
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793317331;
	b=3ys7Zp+UhTQzTPja67zFJ3BmLafiwvwwUpVwQYlikNj743pe50MNEzCBep+BJjOKt39F
	 pL6UtgFBnyAgTYch0v8Iwz1DTGPM4slXTwcvrqlmEoeyF8k+5P233z9+c/lObHEM3/Jbt
	 wGLLAEXIR6gbSJpZFfRbd8/yHNUy/7TR10wPHu3aWZjaTDYs63uFY7RjZyiWP94UV2POw
	 eRqrJgJYSpjR/0SgZybuCP4Ect4GmX0Jfw8XsN1+z38/Ykox8OtGwtYReVql7O0dWnj2A
	 XLpkTmJ5wEajG9sAMqTnghgKWT80fnYjHaHxRmUu5GZ4anTFCYgzGu8Bm1ihZQB33QQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793317331;
	h=DMARC-Filter:DKIM-Signature:X-SMAIL-HELO:Received:X-Sender:X-Auth-ID:
	 X-SMAIL-MID:X-SMAIL-UIID:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=Nrvka/sQHSsmHaztz280hFS6KyrceCCtDg9eO6J04Sg=;
	b=4mw35z9cVxqNa1dvKUAwd1q1pcr0Ihbsi9nCISlMobxhsesdHovvgmNF5i7VuP9XsI4f
	 n52aV45grMA58S6TzoEFwEXrzHWV/ORtsVau4WoDVWIQWbsfNtYB6lG+3/X2ouz90Ugm8
	 dJdHcod8XuT2FLNHxhGBEPRPWI4GMVn8REF+ISh8GT8oiP3jFftY90q2AJKZNcoH/jOXB
	 z45/x1w6eVfXUixSLZtEj9PqyHrXtXoD8k2dyS9f/dvLR3yfPWt4tPvQKQGbpP0Yh/I08
	 du9g7odUTu1W47Yk15zcsOljst8gqjkoAwSoPkxsgwVMKKJh7lRHgBgnrK18+6mVUPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sina.com;
	spf=pass smtp.mailfrom=sina.com;
	dkim=pass header.d=sina.com header.i=@sina.com header.a=rsa-sha256 header.s=201208 header.b=h6ozoZk4;
	arc=none smtp.remote-ip=202.108.3.166
Received: from mail3-166.sinamail.sina.com.cn (mail3-166.sinamail.sina.com.cn [202.108.3.166])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 082EE606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 23:42:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 082EE606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=sina.com header.i=@sina.com header.a=rsa-sha256 header.s=201208 header.b=h6ozoZk4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1793317328;
	bh=Nrvka/sQHSsmHaztz280hFS6KyrceCCtDg9eO6J04Sg=;
	h=From:Subject:Date:Message-ID;
	b=h6ozoZk4tBcP2xbFXM0MfAFwEYcy9iQkB272CCQSyLkyP9ciBU91l+SXyMGzLgAu2
	 /RBvRlamIL7lJhFgOyDedSIDEFez7okD1GyvtFBaD9PFk45/r963MWqI8yZS6rgEUZ
	 2pDatahBDzNed5BZ8N6DuyPQCtUq3nStSQ6c17Nc=
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([114.254.2.154])
	by sina.com (10.54.253.31) with ESMTP
	id 6AE3D9C4000031A9; Thu, 30 Oct 2026 07:42:00 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=hdanton@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=hdanton@sina.com
X-SMAIL-MID: 346596816134
X-SMAIL-UIID: 9D7A95AF643B4E1D9E2D718F313014A2-20261030-074200-1
From: Hillf Danton <hdanton@sina.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: David Howells <dhowells@redhat.com>,
	Eric Biggers <ebiggers@kernel.org>,
	James Morris <jmorris@namei.org>,
	linux-security-module@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	keyrings@vger.kernel.org
Subject: Re: [PATCH v5] KEYS: key_garbage_collector(): process in chunks
Date: Fri, 30 Oct 2026 07:41:48 +0800
Message-ID: <20261029234149.218-1-hdanton@sina.com>
In-Reply-To: <20261029172918.2118600-1-jarkko@kernel.org>
References: 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 29 Oct 2026 19:29:17 +0200 Jarkko Sakkinen wrote:
> key_garbage_collector() has a design that is not resistant enough for
> workqueue lockups. The duration scales up relative to the number of items
> in the serial tree, which causes a reoccuring theme of being guilty of
> causing workqueue lockups.
>
Given cond_resched() the gc work is not a cpu hog, and given concurrency
workqueue can get individual cpu highly overloaded in short time, so what
you delivered is a half backed croissant, HBC, as you failed to make it
clear why lockup occurs when the number of gc items rockets up.
