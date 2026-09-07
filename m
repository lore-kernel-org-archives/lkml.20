Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 065323E63AC
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 15:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788796063; cv=none; b=D+iiuVttFtJ0kYDWiaoilzzPHryRfUyUFJ5+x//UC6D3oLfdGLqhxezcDLlA54Lw1F5FnqJuJ6WAjC1MFjgy5py939I/BmYsS6r0r6+H0oeH6q5JNPzqZ0vVxCjwgvPiT37DpBeyqfPoKam40tVFS7lRGTxvUg1gNnLo3zWoPd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788796063; c=relaxed/simple;
	bh=LsBLn8cXF33M9xsQ1sh1/dOCqLgHSvdMJu+9kf2eJnk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HzZoxjD9BxfKoJmYLtj1EWDryZxfFImQmf3VEt7NRNy6TvLVN5vNCmi/1WloNRbzBkd2petWHEE49sSzRy9CzaziF6ltD9mnmUmtIuoy5zBrrb/CEm41LhqfTDoo8ch6uqf7o9VY1VElLTIxTNqpmfPG7ErSHkVW7xJpYWkx6qE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=ONo3Yd5P; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="ONo3Yd5P"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-939b88e242dso8199885a.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 08:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1788796061; x=1789400861; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RQkY42FeJcZwapgA9K9xQ52KS/Gzc6p9wbLWVF1hJqQ=;
        b=ONo3Yd5P+HJX1YqS2nHyAEMJ1JMkcrWWoM2FENgofjJsR5kyZpov4qS72In0zlssNx
         zayU6UQOXtCuKzy6OdIYZim7DjCMy822QTHak/KCv+VZO1yRHeDgSDA5R8T9r7VMtytU
         qz62qF4vRzegoCuPeanLp3ROZOgExbqYdHzlDWwssduiSQBOK0O94wyxx7oX6TbiXaby
         xfN5Uw1yOCov7qnTLzLTJA+6NZVqiVc6NWuFhbpFAQfZmvkLAgMwuOQmqsXWosGLcBSS
         WAJypDzNAOzfL9yo4piRWhZjJYnaoUbm/7++1wr23dp6w0H5cGz4EtcRdLnIBtUEG9oO
         9rIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788796061; x=1789400861;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RQkY42FeJcZwapgA9K9xQ52KS/Gzc6p9wbLWVF1hJqQ=;
        b=iH7uaFP3w2GsWJGX0p7ONFVg/JAyzPauOrtM67oEAfwzNCUuujJxIRCbBQnupsmHHf
         vrv9MsFkoLoY4ZUfqYDFUXkWWCGZxzjhqpmyPMuv12sjN6UGbhxqrHtEWeOrR1yxl4dn
         KrfyeqS4WOF9sRYx2itfqyQt2zfkEEz8Tr6NMeJAJEb0SvtcOPUR1NoG4vvI8dKwIz3X
         rxjSeH/zaNGK9uyP53xJUn53pAfRrkYrPblpd8e+zae03AROeSLAZ/m8fcqsn3A57IVu
         j2pMNDxNATQuhAyepC47HS/yvm1Bkm9onakswrtb98mAtWTcrTvI0uXYTA4SKQcoExjs
         /p6A==
X-Forwarded-Encrypted: i=1; AKwUvBxfwHHZv+NeDe6ZOk1umpqYQtTFY33s9NzSTXnGfZcXVwJUhHZNuVSpRw/PlMXJWUFVSNOAYEfkKoS9fFQ=@vger.kernel.org
X-Gm-Message-State: AFuF++msRr8qYafOK9YFar15Yv/cERC9oJKHPdHNclm1TbqDvNCHIRok
	Pr7hegXYYCcsJib7ur/AMLVXT6QBaYAhQYiSu9lnv81eKN051UCid0UoQuOcMyRcPJw=
X-Gm-Gg: AYBFou27wBIGzJo8gOCApoX6d7QqPNtB+nRf6rGkfQIeIUXFDRabA6KMnXZhR6KUh8+
	gPPvZKkpk1mqt+TcBltNYB61BwDTT8jgPLh1iGkeJll1xsNW7C6xcysm7iL0oaUmOqzLq3QZXjD
	AGf89OvCv1OwF7JoldLveKEvE3LkqVO5mAvbA2/ywFjr+9x2AWMNOPDg4DfWXhSv3Uui9jlSGiu
	fYkYu9SF8AxVeekTeh7SRmMM5vtGg2TkXLwNlElMgy0BvLpjRvbRoO4eHr/s2D6+G36heGMViDU
	CH3VYDeO/hKwoSZjcmUc/sG9lRYzcHyVfBEJrdJbTdTrfAHXAqzE2x5qzxM8rbObu9WaHJTo9cQ
	jTCzMxG72T27SSkIY3+a5kClZQDfIlpxVfRyB0M65XUPFsNHUx7eNAlxaB06v9hs8Sx5ph48qJ+
	8Azkm0ht4dc0kHIpP527NEGOqtxS2txZoM8E5b2TRczGSaAfRhZ19/KXfcdzsKYf1eEAU12hWMi
	QL15IzyVgFdL8SkM41lTtsiZfSOrqHYoxFL0FF4GSXU
X-Received: by 2002:a05:620a:6cc7:b0:939:6de7:8768 with SMTP id af79cd13be357-939805729bbmr2426484585a.47.1788796060831;
        Mon, 07 Sep 2026 08:47:40 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9397fbb70f1sm928876585a.40.2026.09.07.08.47.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 08:47:40 -0700 (PDT)
Date: Mon, 7 Sep 2026 11:47:37 -0400
From: Gregory Price <gourry@gourry.net>
To: Ye Liu <ye.liu@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>, Ye Liu <liuye@kylinos.cn>, 
	Michal Hocko <mhocko@suse.com>, peterz@infradead.org, paulmck@kernel.org, mingo@redhat.com, 
	rostedt@goodmis.org, jpoimboe@kernel.org, mic@digikod.net, oleg@redhat.com, 
	tglx@kernel.org, david@kernel.org, linmiaohe@huawei.com, nao.horiguchi@gmail.com, 
	rafael@kernel.org, gnoack3000@gmail.com, ljs@kernel.org, sj@kernel.org, 
	rientjes@google.com, shakeel.butt@linux.dev, xu.xin16@zte.com.cn, 
	chengming.zhou@linux.dev, will@kernel.org, boqun@kernel.org, frederic@kernel.org, 
	neeraj.upadhyay@kernel.org, joelagnelf@nvidia.com, josh@joshtriplett.org, urezki@gmail.com, 
	juri.lelli@redhat.com, vincent.guittot@linaro.org, tony.luck@intel.com, 
	reinette.chatre@intel.com, x86@kernel.org, paul@paul-moore.com, jmorris@namei.org, 
	serge@hallyn.com, pavel@kernel.org, lance.yang@linux.dev, mhiramat@kernel.org, 
	pmladek@suse.com, longman@redhat.com, mathieu.desnoyers@efficios.com, 
	jiangshanlai@gmail.com, qiang.zhang@linux.dev, dietmar.eggemann@arm.com, 
	bsegall@google.com, mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com, 
	mark.rutland@arm.com, Dave.Martin@arm.com, james.morse@arm.com, babu.moger@amd.com, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	rcu@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-security-module@vger.kernel.org
Subject: Re: [PATCH v2 7/8] lib: convert process iterator to
 for_each_process_rculock
Message-ID: <ap7ckXealr0JMfeN@gourry-fedora-PF4VCD3F>
References: <20260907081334.1152889-1-ye.liu@linux.dev>
 <20260907081334.1152889-8-ye.liu@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907081334.1152889-8-ye.liu@linux.dev>

On Mon, Sep 07, 2026 at 04:13:33PM +0800, Ye Liu wrote:
> From: Ye Liu <liuye@kylinos.cn>
> 
> Replace the manual rcu_read_lock()/rcu_read_unlock() pair combined
> with for_each_process() loop in lib/ with for_each_process_rculock(),
> which scopes the RCU read lock to the loop body via scoped_guard(rcu).
> 
> No functional change.
> 
> Signed-off-by: Ye Liu <liuye@kylinos.cn>
> Acked-by: Michal Hocko <mhocko@suse.com>

Reviewed-by: Gregory Price (Meta) <gourry@gourry.net>

