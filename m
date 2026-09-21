Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 370C947886E
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 14:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790000001; cv=none; b=IDukwf7FISJ3qQIU3wQSzdzMV6HSmydZwxP84fgX//IY4E9HgxDAiF6IiRQTWJFB6F0KDJpaw7+Y/B5o0simSsDg0NMK5F1ZSZiQjw0ngWDsthEqFqEs3hIeomPS3VceLXW6/46WVDwgtFjE+Gzh8mFO5IvWhqOIDT2zaJYRRD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790000001; c=relaxed/simple;
	bh=FPWqC66o0DYZqJN5PzsSkHRliknVuMnTz8yDSq8JJ2M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cvdgDPQF6HkKplQyaXbQfpLJ4hA+KAPaUegLPnV/FuJp4XqA57piNJkUw1VaA3cBqATTjKLWaIFae1dGnyDvcCtonA/Yh/yb8+HFRCo+GC+AlBxudbA29jT7w/8KGTa2ft0eqd+7iRlpG37gQe80cTmPK4/Uf6OD+bl/6ru1VMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=fzu2CmwN; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="fzu2CmwN"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4980fe6b3beso18257105e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 07:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1789999997; x=1790604797; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cZmbAJJNnfDZG7kkKrTMELDcFp2a6nfaCSWGLZAt/V4=;
        b=fzu2CmwNwmu4EzyDm/SS+HyLsxT9GLO6/oTBd7xz4C1+ZERrsqJ/T4lE3y/ntmOUu8
         iNt49knAFeGGNGAmBdrwAuw+cyegVmc5P1ZaitZYOmDilf8wyaWpGNp9muuEsKRGJpe4
         W6jo2WRhigpu/r9DDGq+jcywXQZU+N9fHOJkMXis7yh/eIWnYVQ9b5r1PKLKvk9pEHFp
         Afu7JC4jS14TexS9zgW9KK4b94J1balJ386mJB/75wEtZWWyHi7fpaA4PxYiMFLdlYm+
         thJMOexv22zR+emVktFgKcg3ZRZ8WM4tezCKgTJIb6FxqH4vAN6MXQKFV4Qus1z1qRQI
         MsYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789999997; x=1790604797;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=cZmbAJJNnfDZG7kkKrTMELDcFp2a6nfaCSWGLZAt/V4=;
        b=OzTxPAQFcd3FNdiJODVSu4G0zj4MS0lDxEBDyHTRcPxGjeY+x5/CZ3iJ6zcgGHW+2V
         87IvQuu1Kl0+erXydqVHAxvkjb1kdbXUihee7wiNpuUUCN1ekdZEzfLflYhgaBsvj1bE
         sKpo0oDwmthl93R80zFe3kgN7d+boFMwlZEpu9OxzHp21/xhlRrcPgal7uRPMcqrTTEK
         YOUljUV3jZhy8WaUL8Qh6x0UwVw8G9V8DgJXnKYhkN0geTufscl6qmbsVzlTE2othhfO
         ExxycuwIq44MBG3fS+haGfpJ9wgVWEs3ceGhjQcNdiTv3oAz2P2BJrXHUqAFyKtI7tfA
         HEZw==
X-Forwarded-Encrypted: i=1; AKwUvByK/nuZm4go+ga0lwLiPXfDqfpNhKZK7/RoSVfYUWcLErTsbP+MPHN0ckRGGn7uiIfcV1+mLZgAbeluYDs=@vger.kernel.org
X-Gm-Message-State: AFuF++m+uymeKvYumP/yqXQQGoUSox1QHgXzUd2MqZoBj+XzUY/rwvYI
	lLTfm+fW21fsyUE7nqE/E4xBdVltS12M35LcwUmLkjphYn536y/1ERsWrpO+KDIXkwo=
X-Gm-Gg: AYBFou1PwQ99Y1k02K9QcDC46R1ir72lndobFny36JOUyNZJHxjyeNDzQyNwDWqIdSS
	hlaA7C8QysF09QaB9GHWddBJXgsAWxnJ6Lk7JTl6QSYsFQGPcJ5mtAjQ2NbhPjumIcKFqudQUwE
	hPnxjOj61Y6nGlY8cid9TyJY35YnryoOAKZbsW1qrwHTn80M56q5a9HwWei0hkM8LVA1NVd1+iD
	atF/TzsStccgwYwUxLc/Jhw4z4wc2stC/x7yNwS8Xot/SRiXh0lYIPKLJ+Luq4b8tOCPl7qnpJP
	c/Z9kV1Gf1Sty8fJS7+BsyQw4ab26rtdUEowwD8ymF3LEvnd7qhuY611xVnJPxk/8AS5wNccfru
	CNyty8E0Svro9aaTyJXCnwDAZshiw3/LubqWP/CSLe21PrQOaQopiSgmMZMHvWJzbUJcKU4Rrwk
	fy3VigVZj9X2dV+ArOj3+niQMu/JYOYbvozxHfhfRMdVj+3nhQ0/efLYEziSVnNepwLMD+WP6tN
	sbSWTSUmww9lQ==
X-Received: by 2002:a05:600c:c0d5:b0:49f:bd43:5a1c with SMTP id 5b1f17b1804b1-49fbd435a63mr227453445e9.15.1789999997444;
        Mon, 21 Sep 2026 07:13:17 -0700 (PDT)
Received: from localhost.localdomain ([2001:af0:8000:1409:193:86:92:181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48724562bcbsm24917482f8f.16.2026.09.21.07.13.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 07:13:17 -0700 (PDT)
Date: Mon, 21 Sep 2026 16:13:15 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Waiman Long <longman@redhat.com>, Ridong Chen <ridong.chen@linux.dev>, 
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>, cgroups@vger.kernel.org
Subject: Re: [PATCH] cgroup: use assign_bit() where applicable
Message-ID: <arE7Zx-ur8W9Jsij@localhost.localdomain>
References: <20260920022738.3145820-1-peng.fan@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260920022738.3145820-1-peng.fan@oss.nxp.com>

On Sun, Sep 20, 2026 at 10:27:37AM +0800, "Peng Fan (OSS)" <peng.fan@oss.nxp.com> wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Convert open-coded if/else with set_bit/clear_bit and their
> non-atomic __set_bit/__clear_bit variants to the assign_bit/__assign_bit
> API.
> 
> Done with Coccinelle semantic patch:
>     // set_bit -> clear_bit => assign_bit
> 
>     @@
>     expression cond, bit, addr;
>     @@
> 
>     -if (cond)
>     -        set_bit(bit, addr);
>     -else
>     -        clear_bit(bit, addr);
>     +assign_bit(bit, addr, cond);
> 
>     // clear_bit -> set_bit => assign_bit
> 
>     @@
>     expression cond, bit, addr;
>     @@
> 
>     -if (cond)
>     -        clear_bit(bit, addr);
>     -else
>     -        set_bit(bit, addr);
>     +assign_bit(bit, addr, !cond);
> 
>     // __set_bit -> __clear_bit => __assign_bit
> 
>     @@
>     expression cond, bit, addr;
>     @@
> 
>     -if (cond)
>     -        __set_bit(bit, addr);
>     -else
>     -        __clear_bit(bit, addr);
>     +__assign_bit(bit, addr, cond);
> 
>     // __clear_bit -> __set_bit => __assign_bit
> 
>     @@
>     expression cond, bit, addr;
>     @@
> 
>     -if (cond)
>     -        __clear_bit(bit, addr);
>     -else
>     -        __set_bit(bit, addr);
>     +__assign_bit(bit, addr, !cond);
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  kernel/cgroup/cgroup-v1.c | 10 ++--------
>  kernel/cgroup/cpuset.c    | 16 ++++------------
>  kernel/cgroup/freezer.c   |  5 +----
>  3 files changed, 7 insertions(+), 24 deletions(-)

Nice use of Coccinelle,
Acked-by: Michal Koutný <mkoutny@suse.com>

(You may consider sharing an adjusted variant for
scripts/coccinelle/misc/ via cocci@inria.fr ML.)

