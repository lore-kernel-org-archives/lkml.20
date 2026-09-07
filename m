Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D82B237BE72
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 15:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788795783; cv=none; b=g+kevhL8dJuPVeOx2nF/A89v/bG6u/fB/IAnKRcechVkxpUiPyxXN/kFcCPhFl1dxBt8d6WmG0eI4ItaA3vQjFydYnf2xnSNmbCdKNn28tMDT3WjF39NHlDL/NBRM5vpjjvflpmh7UCrOjwD8r/Dy/XVKTOMbiqiGoC7zmfWcTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788795783; c=relaxed/simple;
	bh=QtFPJiEMPSV8S29PeKQ6fcZP42NUa5u8vRMrfd5W/ac=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B69s6tVCr6z74MMba0+3KQpbhk+FBRpp++DHsLKEoaYKOnfv81qT5XWehK301ju9se9P3qtMGte4rvOHCrNYmW+3yJzpjT86chKBkGlXN4XAl293hNPRRMiTDCmqBWR8Umt+fGMEPlTmNSAzZTEWzg7eLvkhZ1APY2uIajf2HRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=V9ENlS5T; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="V9ENlS5T"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-9104956083aso24898376d6.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 08:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1788795781; x=1789400581; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=K2bTzYuWDSR0jh+E6xDNAXwrxj96pyu9ESjj25Dc22Y=;
        b=V9ENlS5TaNqyEP+CZe9T+zbGZgNm+w6SkgzXU+Vf2Sg0y1Z2FHnjMczwfzB6NGTNcX
         6yhbU/JeeNNCI2se5WwHr+u57+sKlUSzN9hI0fWdBsyN6gbP07n9EB8Typv/X1svOR8r
         ZShhChP07VDvyvWEZ2jIrcm3cLXRlyUu/9GaOMh/uU9H17iReK5sZu/QwYhF9S2X3s6H
         JNWpVe1uWbKbifjDfj8JLoIEao8U5GcyJcXCDM7Ij0K/A4BJ7Nrty6xbt0SZZ0OFqDqJ
         WY979YZN9OZzs88rcEnC9S0NCLWaXUWw7DORMGMYMqvgP0AS4CetXYh5mUNfcjoRnk0G
         QZlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788795781; x=1789400581;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K2bTzYuWDSR0jh+E6xDNAXwrxj96pyu9ESjj25Dc22Y=;
        b=TkRDW3k6k410Ru18zm7jKYniYzP30SRG+PKPtwwazGGGMNdAq3vQdY1JzPv4gDTHJw
         PRIyc7WqZkD9g1lB+CoIDW4eddW0W+e6RClKiUlqVZGCe0MqJ3bwDRF7wEb8Gx+kRb/I
         JsRw96iJ80kef9N8FN/xGPgLd6p8+pgzHbnJrBRC3780ccKHFXOejCdooa1SBlcre+/T
         Ps7TH+mcSdcHfm3IcyQ1VEMEZhnxCFPHYywL4rFc/apCcrEGNEQNHCJgaMdPpnUYgGsG
         SFRim4/xXTBVt1wk7DlBow0eQqHGq/ItlvAq0PLdLNr78YQoRoPTfOiRFFt1ehIEokEu
         rrBQ==
X-Forwarded-Encrypted: i=1; AKwUvBxNd7L5abgHpg1WvWitwGBIQfMBdkmFheBm16VcHGpjNkB0HmSGu8gv54ZuL3i8WEmXt9xty0Lu1SBRraQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nA7IBKBNlJVh4taUfvr5M7jGwIbW0hyaLPxpheqvFmxpzApTWL
	GnS5eCcMeF70zQd/q8nbZHMtM8Yqm/SIAivK51qI7o82hxWEAK57f4/HrC++JMCjb3c=
X-Gm-Gg: AYBFou3zcobZyWf63j/tGh1RPshiRAr4YFPkO5dAzcqAb1RvVKn5WLN95eoIuXih0Va
	MBrZse2EZLulRXkayM0U/czqA/8Kvgj6ludMfD0pywo5WTYoD/ZOT7lrWcWuXfFJwaCTBw/MaM6
	NIvireeGdSI9VeB0cwOblikeRVvm8fhhQ0FHckjDmneFx2OOGV5YY9V9og4ZkXwXCCav6PNasZR
	r8No/iYEuCRtllyhREFBjspITF0y1g1F2o+9wpj+ccV+5tp3HuWwT8wf3CfXNG9jRAjhWVirO+z
	COMBkWCjSqrRG2Z2CNCtZLZZZdLJdf0AF2ncUmR9f1fFCIPKr1KP33xx1x+HtXbW7BDqBcZiCE1
	FwybeeYMCK+zsW+svWi2klpg6+1lyzLPWiazOsJ9iFBxL0xjpnxtRlm4rhay4CXpUJNsrf43bdP
	p+xBQa/3qhVWFcThGppU5JdTqgC0bK2ejNN0hp9YVWmgnIASzX3szIGW9IyHe7degUwt6fOTtUK
	LO+4R/y6avXqAPcWNnNdaIk0goBE9wUcIhxRGYcLKQk
X-Received: by 2002:a05:6214:ca4:b0:910:5235:14f1 with SMTP id 6a1803df08f44-910523515c6mr109464606d6.22.1788795775829;
        Mon, 07 Sep 2026 08:42:55 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-910406625d9sm93010046d6.20.2026.09.07.08.42.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 08:42:55 -0700 (PDT)
Date: Mon, 7 Sep 2026 11:42:53 -0400
From: Gregory Price <gourry@gourry.net>
To: Ye Liu <ye.liu@linux.dev>
Cc: Michal Hocko <mhocko@suse.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Ye Liu <liuye@kylinos.cn>, SJ Park <sj@kernel.org>, 
	peterz@infradead.org, paulmck@kernel.org, mingo@redhat.com, rostedt@goodmis.org, 
	jpoimboe@kernel.org, mic@digikod.net, oleg@redhat.com, tglx@kernel.org, 
	david@kernel.org, linmiaohe@huawei.com, nao.horiguchi@gmail.com, rafael@kernel.org, 
	gnoack3000@gmail.com, ljs@kernel.org, rientjes@google.com, shakeel.butt@linux.dev, 
	xu.xin16@zte.com.cn, chengming.zhou@linux.dev, will@kernel.org, boqun@kernel.org, 
	frederic@kernel.org, neeraj.upadhyay@kernel.org, joelagnelf@nvidia.com, 
	josh@joshtriplett.org, urezki@gmail.com, juri.lelli@redhat.com, 
	vincent.guittot@linaro.org, tony.luck@intel.com, reinette.chatre@intel.com, x86@kernel.org, 
	paul@paul-moore.com, jmorris@namei.org, serge@hallyn.com, pavel@kernel.org, 
	lance.yang@linux.dev, mhiramat@kernel.org, pmladek@suse.com, longman@redhat.com, 
	mathieu.desnoyers@efficios.com, jiangshanlai@gmail.com, qiang.zhang@linux.dev, 
	dietmar.eggemann@arm.com, bsegall@google.com, mgorman@suse.de, vschneid@redhat.com, 
	kprateek.nayak@amd.com, mark.rutland@arm.com, Dave.Martin@arm.com, james.morse@arm.com, 
	babu.moger@amd.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, rcu@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-security-module@vger.kernel.org
Subject: Re: [PATCH v2 2/8] mm/oom_kill: convert process/thread iterators to
 for_each_*_rculock
Message-ID: <ap7bdHdjGgmIzi_P@gourry-fedora-PF4VCD3F>
References: <20260907081334.1152889-1-ye.liu@linux.dev>
 <20260907081334.1152889-3-ye.liu@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907081334.1152889-3-ye.liu@linux.dev>

On Mon, Sep 07, 2026 at 04:13:28PM +0800, Ye Liu wrote:
> From: Ye Liu <liuye@kylinos.cn>
> 
> Replace the manual rcu_read_lock()/rcu_read_unlock() pairs wrapping
> for_each_process()/for_each_thread() loops with for_each_process_rculock()
> and for_each_thread_rculock(), which scope the RCU read lock to the
> loop body via scoped_guard(rcu).
> 
> No functional change.
> 
> Signed-off-by: Ye Liu <liuye@kylinos.cn>
> Acked-by: Michal Hocko <mhocko@suse.com>
> Reviewed-by: SJ Park <sj@kernel.org>

Reviewed-by: Gregory Price (Meta) <gourry@gourry.net>
