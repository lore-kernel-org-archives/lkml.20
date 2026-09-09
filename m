Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7881B3A7858
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 18:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788980325; cv=none; b=tNuuH++nhDTrAvXWEDn40GCldoq9SpIalryghTEgMV8AZqb9NF1HN7iRt69CcfNgrvIVFApaSXDagqaygPx9PRUvQvWhlEHxC7hsy8BLxgapxW+sYktwTILJhXKeAK1YK8K5is9P4QNYlNZ8M8/1XFIZKOUBc3jSyb9CUkG2zK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788980325; c=relaxed/simple;
	bh=sUUDL3cRzHUqrBYBYDEcr2XpL9aczgD0phVz32jWqRU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ikBAoJNtOoO9k7S3Mlarb/yF2HQ2Wq6LnkUyyBnR9IfTT3TIX+VURed2cgYOn5RgZFj/I8iqbhggS5nDGGZK6tICTj6XmChATEBSWJHA+/ATXTHLkHEvxoKHfqB4detGNRaIQbdZvk5u6R926331RnNevcM0h2kE0Ij2g+iOLh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SvJSEYNb; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SvJSEYNb"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-499db1740f2so2641425e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 11:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788980321; x=1789585121; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KmZsLLbUqrJitoMMxQ4yiuUnZvxgG8cbH5DDdBI3uyY=;
        b=SvJSEYNbsLeJ9AUHTR+lzaaEWoBterJd6NlNjKb4qa7f0eN40dSqFwFirkgU+ywDZK
         zUr+Sj8vGVeWmBqEw213f2hv/W2NkVaGewat4aunvcaMejo1vuAMPxofjYPMvHqTQ9Qr
         m1ZN0tdQUhJ1Ml2bQ2zz/V+vvHs1fswoC6O+JgIWpEmC3usN7H6a/NBDUf6RRQ06ymo0
         FdjiQ0bY+NdWe77KzU1AXue/MWQHDytFm6IfG/Li8p2AVyYMIRrzzMLEyyKCWX9fyLUY
         NMtjfMXsEwSaOx53u4aQX+MQls58g9arRSY55uRJxrIZfcDfrxL1uJ0ASr1zCCc2nR22
         1VSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788980321; x=1789585121;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KmZsLLbUqrJitoMMxQ4yiuUnZvxgG8cbH5DDdBI3uyY=;
        b=MGcvykMD6k3GSDf3On6MNBXNGZv3AJhD6/hnWghwroY8NK1aiNZODK4l6xzPFDVE2X
         lpx/6cLusb80bIT2D0ziZLBBTewwULQCHnjSrrdj35LTBzR9nSF3If0+Rqw7o+tFXa2N
         XeQMBEkPLF/vhf0hzU1PdSI6q72daNNiMiKfzsRxcvTJOtI0mLLFTReLVQG+6udQECaa
         pOjB9iS4v3tCLyrIUvTnN0nfIaG3DHTFn+l9Zh9PFenmEXxU3pSnv33W9eUq+0Pz/660
         onJAXgGsEd2w3Hwt1JAkV+dvsQjdm1RQBYCJ30Oz+ONniIuuorulylK/846i1hluEQMP
         bH9g==
X-Forwarded-Encrypted: i=1; AKwUvByo7qn8qNkz/UDPjXXbv+aQ53dRSKQeH/sx/HBG/FQAk8aJhnxeIBtK4mmckEAD9mUjERsB66d4yAoBK9g=@vger.kernel.org
X-Gm-Message-State: AFuF++na0+p2ELHUXgyVtb4vjUyzNly3512xXSNlmaboBKXEh/Qg16be
	E6aV1mDycjtuhDKCyCF5n/qS9grd2pUVfXgJviLw70M8UQVkqkL3XA1d
X-Gm-Gg: AYBFou0lZDD8Paxp2sbHfOJ8dAur4YgW8XCjhS/RR1Pkoz2n47qGJlUg6g6zN8CHbfQ
	IxpvxmsVwhAtIII7mH3fff7B8oZWT0IBYafma//zVKZc4yYl4O2PfHE0pAeGva1QchWtjA24lqz
	YZNiRi6hHmbq3CtZ07VvyAYwhLEmIdNMrR73yS4fmB7IgVzpXDvYbuDmA9SJRhcmlsvvPzAqj15
	WpOPDZYYTO/G/jUz8c7/GMfdVd72toFsW9h8cAylo4vdcbvyBipMXybDW2NPeMsZuNPeMhrIt5D
	bXLhE1n3Ar3/u3l8MCt9EnOEnxQGf4Zd8eEi4X3DlweJgbc+yWUPMtiBwxmzUWLz3xAy6aggOB3
	4g47QfrGVXpxnTz9ofUIeVyj01dEhosJ61NOHOI8rsUUR9wsbWsn11eByniWrz9l34T6APxztuV
	wBvrfrfXzpUJ3YLRSTBCiFBB6JV00Yd2wLpwWn7EkFXQyP53L1zDGNLnpgrQiVfiWTuP6PxVZ5n
	Ob1XA7xq5njOD4LEdNzhg==
X-Received: by 2002:a05:600c:1d15:b0:49d:798:67a4 with SMTP id 5b1f17b1804b1-49d274a6977mr3033605e9.0.1788980321318;
        Wed, 09 Sep 2026 11:58:41 -0700 (PDT)
Received: from lima-kdev.local ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26d49d57sm9913715e9.14.2026.09.09.11.58.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 11:58:40 -0700 (PDT)
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: vincent.guittot@linaro.org
Cc: bsegall@google.com,
	dietmar.eggemann@arm.com,
	juri.lelli@redhat.com,
	kprateek.nayak@amd.com,
	linux-kernel@vger.kernel.org,
	mgorman@suse.de,
	mingo@redhat.com,
	peterz@infradead.org,
	rostedt@goodmis.org,
	vschneid@redhat.com,
	Kayra Cizmeci <kayracizmeci@gmail.com>
Subject: Re: [PATCH] sched/eevdf: fix rb augmented with multi fields
Date: Wed,  9 Sep 2026 21:58:27 +0300
Message-ID: <20260909185828.1158142-1-kayracizmeci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260908135526.2783039-1-vincent.guittot@linaro.org>
References: <20260908135526.2783039-1-vincent.guittot@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello Vincent,

> The eevdf rb tree maintains 3 augmented fields but only one is currently
> copied when balancing the tree.

> Add a more generic define that can be used when there are several augmented
> fields. In this case, we provide a function that takes care of copying all
> fields.

So the problem is we need to copy 3 things and we copy 1 thing currently? (simplified)
Also, I read Prateek's review too, so I'll not go on the same things on this one.

And I thought that 2 separate reviews are better than one, so... :>

> /*
> - * Template for declaring augmented rbtree callbacks (generic case)
> + * Template for declaring augmented rbtree callbacks (generic multi fields)
>   *
>   * RBSTATIC:    'static' or empty
>   * RBNAME:      name of the rb_augment_callbacks structure
>   * RBSTRUCT:    struct type of the tree nodes
>   * RBFIELD:     name of struct rb_node field within RBSTRUCT
> - * RBAUGMENTED: name of field within RBSTRUCT holding data for subtree
> - * RBCOMPUTE:   name of function that recomputes the RBAUGMENTED data
> + * RBCOPY:	name of function that copies the RBAUGMENTED datas
> + * RBCOMPUTE:   name of function that recomputes the RBAUGMENTED datas
>  */

nit. 'datas' is wrong in english. I would use it like that too. Maybe 'fields' but
I think using 'fields' in one of them and 'data' in the others would look bad. 
Ah. English is annoying.

> @@ -114,14 +114,14 @@ RBNAME ## _copy(struct rb_node *rb_old, struct rb_node *rb_new)		\
>  {									\
>  	RBSTRUCT *old = rb_entry(rb_old, RBSTRUCT, RBFIELD);		\
>  	RBSTRUCT *new = rb_entry(rb_new, RBSTRUCT, RBFIELD);		\
> -	new->RBAUGMENTED = old->RBAUGMENTED;				\
> +	RBCOPY(new, old);						\
>  }									\
>  static void								\
>  RBNAME ## _rotate(struct rb_node *rb_old, struct rb_node *rb_new)	\
>  {									\
>  	RBSTRUCT *old = rb_entry(rb_old, RBSTRUCT, RBFIELD);		\
>  	RBSTRUCT *new = rb_entry(rb_new, RBSTRUCT, RBFIELD);		\
> -	new->RBAUGMENTED = old->RBAUGMENTED;				\
> +	RBCOPY(new, old);						\
>  	RBCOMPUTE(old, false);						\
>  }

The bool exit on min_vruntime_update() parameter appears to be unused when I grep or search for
any use case. Could we remove it?

The other things aside these is good for me. It looks really weird to copy only
min_vruntime while not copying others at the first place. And I think the
solution is good. 

I was thinking to do a boot test, but I did not thought it would add something
to the patch. So I did not. I can if it's going to add something tho.

Include if you want to :-):

Reviewed-by: Kayra Cizmeci <kayracizmeci@gmail.com>

