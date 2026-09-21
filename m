Received: from mail-wm2-f7.google.com (mail-wm2-f7.google.com [74.125.225.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E07C42192F4
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 04:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.135
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789963348; cv=none; b=SeD5SP24wmuY9tvJrcMoSQnho1TrHlbSRCu8VHvbFhqwEHCYN4KD3Rrj1ZeBRL+rYMuX6QA9U0vxPBgpR6HVh/ZJSueNkFHyBygS1pRbMeKCnwIIreeLLJbyQ8egzCmqx1DkuDKFDYylzmv8GHCo2RAYCYQH19wwPvRrYUFbunk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789963348; c=relaxed/simple;
	bh=Ciwd+HjJpBnwHVYXNB2fo9MOUQS5c2QyhgXBMzQ6itE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=DF7CvFdnHF+7prhCIYyk6HMSc/24z8YYNHCgmlPAAzLVqboL3OhEPLD1V9yQutK8d1YkFqwCPTbgFVNVlojcOgS2KGJOqm4t248C5Fv3tRekcfqdYGhuagUcUbFqncYKr9jDsF4yPXTmXEnn1lY4JNoKV95SIZ2GMMwxCfvFHzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AGGfpkxy; arc=none smtp.client-ip=74.125.225.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AGGfpkxy"
Received: by mail-wm2-f7.google.com with SMTP id 5b1f17b1804b1-49e8361492fso10356355e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 21:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789963345; x=1790568145; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0juRQzdf6nmFbDGjlJJGsvrFrjljT+sRU6VdT0gPqE8=;
        b=AGGfpkxy2yJECa7wo0zerf3UQtMdVQSC/L/dVWpobxeslrH1YbV39UmTgmSOACRAww
         UTjS4Z2AsjdTr4PEdxy7SJzAY9d4pJgfXp7ahxl17/e6wNf0ZZaqey3NZCf67yb7eiAE
         EhrbHmhrTUhh5xVRxXyh3473JTe/6c+ERa9WTE6TmWed4T4/8fL7FomyUVtDNS0QIU2E
         bepHgckQMmofBMdgXFtG5mmv71JcEUQVBp699mu+JA/93LBfmlYEZAdjPZt8sdvfxU9v
         QXlz4GSRexerwRdRQSDYeYi7Nz+qG+ZP6oSLDYyPsgyMYYwRu91YctJWhrpjvnGtrLKz
         vODQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789963345; x=1790568145;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0juRQzdf6nmFbDGjlJJGsvrFrjljT+sRU6VdT0gPqE8=;
        b=SuN1vOLT701YQEZimbz+63F5BMHPIf0lhOSV8QVwzfqB2cDEB9jiem6Kq2DppKCm1B
         OhZFkBAr9yioXbV0WVbjn2TvDGUYQnOGk9J4Z7YJYYjMb3otw5HCtH9l6O/Bdu/IM7MF
         kAWZWZeKleIn59QNRvYlZrF1cVU7LWHd49asXFBX6XyQF7cPq6C5PTxmuptWCppPivpk
         75iko8lvdWFYDPAKN2Q8kp4GPRJ4N8wkCRjxwt+XanaxMqyTNVPt8nGjaROG/rrjKVUt
         h/MmmxTcykwBV9lxYD7D6ebd694o1xsm0gSZQ/bS/ps+41sR/PvaNJJqMvKBt73exD9j
         +Bbg==
X-Forwarded-Encrypted: i=1; AKwUvBz/VioF8axNwWGEVMK5epr1wp0VuvcV6bvu2J734ap3ebEeL6b/xjEDXjf0NggResTVppw+YpAIvKvgLTQ=@vger.kernel.org
X-Gm-Message-State: AFuF++l2rLzKQzOg4OC/tMJM12LJPrj8brO8KDTNBwp5Z5rTKPRbK+3B
	CA8AF8jga36F+C71Kn8whNs4f6binmS2FMIZJzFVMqzR717VmxOjEddo
X-Gm-Gg: AYBFou0wUknVRCZYTedRazmb0WfJCOXuWf1af2Ic1wm7RUpjRuY19pXD0ztB22rhN0J
	oVhIqH63x37o/SQXBe48b1+17J5WVvbzfjZy8HcT8oLLkTyUnw2vkiUzhToCb7lmP322QY85895
	21DCFV9KeM/o559Yl0p7yPCD6p8TIvRN/IrDNaoT6nysZp6RmoEg5qQ6oftf/wrBujoJrmf8o7e
	heBXhIZkI4ixv5A+SFSd7C1n8vv4NK43qoIR2OlqoyvZdNCCtfzG3bDvh4QrFeGjRsAqgFmwIqB
	DLp46G+Hx3JIhPiTzZNmBE005ZycHJhdfOvkzzrgMa8naDm5c4cTtIHdsYU+H0tv2btHD6uvig+
	w0G1D3/hxduOxVBOlFj7cMlmr2aW3lM6BQG3nSM3L7gVWk08iGpAkF5zcdSGF6Mry9iUqETmgKG
	dfGUbeeIrKOtzNOtDWsWb8tU/vvQ2jT268FLIAsOWNr8IILI35FnWk90OAtLS045Jy6t0SZcAom
	C/U6z2xpv6qK0ggMx4+qyI7sCYm4hjXoMIjdELrP2gzq7g8lLnBRdbaCzdmLlP+vauwBiaCYizR
	mqtHw/n0kLKrmnkHFuJD89qx1MJNTUopHBAW8hkwSM+5IMBT
X-Received: by 2002:a05:600c:138b:b0:49c:f89b:f82 with SMTP id 5b1f17b1804b1-49fc568f8dcmr115799535e9.12.1789963345138;
        Sun, 20 Sep 2026 21:02:25 -0700 (PDT)
Received: from localhost (nat-icclus-192-26-29-3.epfl.ch. [192.26.29.3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc55cd8a8sm256725075e9.0.2026.09.20.21.02.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Sep 2026 21:02:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 21 Sep 2026 06:02:24 +0200
Message-Id: <DLKP1SE3XQ41.2QNDF51ADS0ZT@gmail.com>
Cc: "Alexander Viro" <viro@zeniv.linux.org.uk>, "Jan Kara" <jack@suse.cz>,
 <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>, <bpf@vger.kernel.org>
Subject: Re: [PATCH 0/2] binfmt: fixes for kres reports
From: "Kumar Kartikeya Dwivedi" <memxor@gmail.com>
To: "Christian Brauner" <brauner@kernel.org>, "Chris Mason"
 <mason@kernel.org>, <linux-fsdevel@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <20260918-work-binfmt_misc-fixes-v1-0-647b24bc1c46@kernel.org>
In-Reply-To: <20260918-work-binfmt_misc-fixes-v1-0-647b24bc1c46@kernel.org>

On Fri Sep 18, 2026 at 11:19 AM CEST, Christian Brauner wrote:
> I asked Chris to run his kres tooling on the binfmt with bpf changes
> merged for this cycle. It found two issues that are fixed in this
> series. I reproduced both of them.
>
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
> ---
> Chris Mason (2):
>       binfmt_misc: fix OOB read in bpf_binprm_select_interp()
>       binfmt_misc: fix racy checks in bpf set_interp kfuncs
>
>  fs/binfmt_misc_bpf.c | 35 ++++++++++++++++++++++++++++++++---
>  1 file changed, 32 insertions(+), 3 deletions(-)
> ---

For the set:
Acked-by: Kumar Kartikeya Dwivedi <memxor@gmail.com>
