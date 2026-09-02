Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4FBE4A3841
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 14:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788360675; cv=pass; b=tW1KK66UPx2FS/Sq5ZcIhEXoXcPQ33WCsePEdJUJjE+yV4d9VM0mShAYIs1bNbiit8t33i9oLNFi6HHvJwp132sTToTMl+4t4eGv5nW95BHj6wthghDddSi5nWJQ1dFw2QVi/tRit/pxJXQYp8PMjvSF1Cp2x5m+ttfXcLDNBuo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788360675; c=relaxed/simple;
	bh=ThU1JIP0zXFCwdkE7cDlKdKqGc9RHMQ3I+uoYW0ENuA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bVRbVHLkM0KTC/Dhwxt54ggIUZj7brpYh8nZNHrBXrNRB1bEMtbr8JhEJ1mzdffNlnUnmzslti9CLSzo92MOXsg6m4G/5nohJNyqyTelA6O9NN1s7fLcmX0M8YyO8GtUEwGaKWMMS2SR2PJnpyS4yAA0cYrCFP+09C51upPkElY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LC6kivQW; arc=pass smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LC6kivQW"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-482f9309813so1158047f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 07:51:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788360672; cv=none;
        d=google.com; s=arc-20260327;
        b=YGEiGsCeCq15k3eUQkzE5ejmQX9n1uM8UfQbDOFFmZIIY/Gmo6aqPgL9A2Q5WAKZJ4
         nl/JMHK6n8WiARh+YxLSS0dC5UU7Xb+pI8St+DDu+E9bnQUPCTPrJUGg8AQIHV01nqZM
         ppGIWgqTOw5R+w9Yi/jTsyNLeV8gpeRW+w9fEi6KxOP8FGiMXPwNWavlAU62pwun9QSp
         /XNIy8eHVyXn5rrLC8Dw0iGMHUSiEjW+2Yd6KTzIXIS2rth8zMKtcOe6O1SL4TYLmMg2
         ncsAaGsUn25p79bzd1iUIe5EQN1H+yhYN+OirCP5GtY8ZDCw7pRplsoeW7xR2OtoX0B4
         msUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wrGfg5gVzYagKEx9/qjy3DYn/Yjk8uTufMk6R5YaiDc=;
        fh=A6nzsUfDqR6JyjsF99IPp0nxkIrauLo6MpDCTQo85CY=;
        b=Gs8n9pBhIpny8xctuxXBkkuOg5mG4dnj7pj1sSiOHacTcmZd4a11Qg6OsoPQhoHDKi
         J1l1acZMousYlCVQvt4NsluvjcCYr9eFmXb018R5eFsh90Ev1M8N7bnpVL6Sr6COdEbR
         BtJhbri71i5Vinv1ORsfJJ8gBVoSGZg4eVuDYHdf9vPwGE+Xo8KcFawlp3fjrPoQwSBF
         ua4mo8ZY4ZCnJWI4IZ0eORDcl06BH08RJIxy8UeK9dC6KA7hreh9AyI1GcvfqC5FYAZ8
         jDig4uoCRfwkGk4mJ9osejq0ZYttenJ7KVqYHNXXFUKvEYucgiKD9CPkqwfqA1FQm58n
         +1Qw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788360672; x=1788965472; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wrGfg5gVzYagKEx9/qjy3DYn/Yjk8uTufMk6R5YaiDc=;
        b=LC6kivQWKIF4DbqtgXCh21MvWnQ5P7f5YCRj4QtFrFRA1MWeazgq9orHt/60L7IP5P
         /Ac2ltzEp7eBTIhAZx/6JaxDYSZwQ+mcE2THy+W6e4Stcr7FBacrRB3tNGpxg/xXjnLB
         I0cER7W7eCNQSnC3H+cGYjyJzUMCmD4Ny1iA7CBGkpWF5xsTSe/G5u77miH6L9lfuVSN
         vwDzXg59qq/1IAapAJx6ld2heowJNmwRx8PKSaO9u+h6V0N3uyNM6OxEtI3Cs9y+19/v
         KxuYzYTI/W4o+HM92BNghpdXuZGf+oWTHILTbH17J4+mTb3Wf2MBLx8719yOX+x7osIS
         BbDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788360672; x=1788965472;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wrGfg5gVzYagKEx9/qjy3DYn/Yjk8uTufMk6R5YaiDc=;
        b=gNcx3EHpxDE796iP+rfPOeLHVz3fdKXWzFAPO2Hosi0njCufABnU4+daD3gDd6vBNw
         CmzFwWm6c9KOrH9PB+fEeFHcYfHTyDH/xbOknegGZaUgXsJvtwzjWRCnqAykNBQrJVJ2
         FQkOvkBDRM4hRjS9+7ilsEM7vI6eZMQrSjBJVwZ90/hhAriAERr/gbPoRwsNYhiBkyxC
         Ld5+l9FLImTSWePoNnFxA85BTJ8ZRYpRx596UtQyFYvHFgEa8DfOL3EJUbpNPsvpzYt0
         QkLlqw6qnvkxkFIq7zyT+LlwuZYJ+w91q3JOwpw5kaD+lutK5DNx/xUiRMnFvkFFmfcV
         8ezQ==
X-Forwarded-Encrypted: i=1; AKwUvBzVXUn6cxNs5FeEy2RLrDMoAnjeRLtGOf72AkjH+wM7/uvxmgALV0mGRAUX9rmypimh4w/Vg0ZxirLSABk=@vger.kernel.org
X-Gm-Message-State: AFuF++n5XoySg7LSV1NXzIWUww61uo02elBTXi/7Wa2jxcBJif5WZmvT
	FS6inxmB+m+i0oyPXf9M5zYVYptq/kul2SsCCwKHFO2ZSFno03v3Aa9AtyfkbsuV3oHXPU22Npf
	oCIArIKVZx/Id4y62d9CNH92YNmQHR8M=
X-Gm-Gg: AYBFou1WSIBPQyHYcPJM1tzb0iIP96d0kaUtBdEPjUvg2xNMYT8K2vnRaiL6/Ch7PPM
	sCtAIlaKfPs5ZIkTBpMIXSRW/5F5q5kg2u7bCcYRckJWh8hhHj8QOeX7HR7PQq0eNQUzNOsq4Hl
	2TPJpTk5SVcsmcHlNcHNrlkBJSFGw6U0Lh9BF5ggpC6Y98dO6R5GAqgnQe1H9r36NNKyS+eES8n
	7IeU9qxKDpeOsbgyxEzow/bCFMvlPiFC0/N6utXxAyJMRNsYkmHIxH88XaFmTuc8UzYquUDsAhS
	rs3it8n4LCrzL9AbsKvxpQCyt6ue6WOpJ7lpbvq89aMtofEpDtlfqUfNwnXGpPSj81kwNqVDHE0
	knw==
X-Received: by 2002:a05:6000:2f8a:b0:484:3310:9aae with SMTP id
 ffacd0b85a97d-484914cce11mr8130407f8f.23.1788360669245; Wed, 02 Sep 2026
 07:51:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260827094509.1016740-1-hebaoquan@kylinos.cn> <20260827094509.1016740-14-hebaoquan@kylinos.cn>
In-Reply-To: <20260827094509.1016740-14-hebaoquan@kylinos.cn>
From: Nhat Pham <nphamcs@gmail.com>
Date: Wed, 2 Sep 2026 10:50:57 -0400
X-Gm-Features: AcwNN1UNmKBz5l2WM6rEkQT00DDxxmkQydUSy43DL8N09BO7fbVmSQJrbh7gX5E
Message-ID: <CAKEwX=Ovm9DTLE_8E-dQ_47SVrOQBY0hLbF7vS9MpDy2bUThCA@mail.gmail.com>
Subject: Re: [PATCH 13/16] mm, swap: defer xswap shrink to workqueue to avoid
 lock recursion
To: Baoquan He <hebaoquan@kylinos.cn>
Cc: linux-mm@kvack.org, akpm@linux-foundation.org, chrisl@kernel.org, 
	kasong@tencent.com, baohua@kernel.org, youngjun.park@lge.com, 
	hannes@cmpxchg.org, yosry@kernel.org, shikemeng@huaweicloud.com, 
	chengming.zhou@linux.dev, baoquan.he@linux.dev, david@kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 27, 2026 at 5:57=E2=80=AFAM Baoquan He <hebaoquan@kylinos.cn> w=
rote:
>
> xswap_try_shrink() was called directly from __free_cluster() while
> holding ci->lock.  The shrink path calls xswap_unmap_clusters()
> which unmaps vmalloc pages backing cluster_info, and on return
> swap_cache_del_folio() tries swap_cluster_unlock(ci) on the now-
> unmapped address - crashing on a not-present page.

This reads like a bug. It would be a bisectability problem to not
squash this to an earlier patch, no?
