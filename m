Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 238A350AC0C
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 15:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788795835; cv=none; b=Pujqr5TM9FCdCjlWbl5YK15TKpsMoapkJHMWkSMpyRa5fG+ueGSIob1WEf7Zo6m1IaPCAvo8vZxQgyVlQ9v41HCahLhFpQpg8BqSy+IqJokvJDzb+qfL6yGwB5+fpcj/GYzTG24QWDHf7Wb0BiOv0n9wzOPLbhQ5LfPDxlcySmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788795835; c=relaxed/simple;
	bh=CJsX7WqNwIl8xka2b9C1MLEX7MPjxesh8mktt0eOQLE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U40FTpHiFJ4GT0KYFmFJ2jUmsKcKSNCCcJFvMxFbQoLMO9ukbR03c8T9dJrmi9V/Ewwqn4KhWVkHR8VenIZdrxbI0KVdaupH1I5Kcfg3OjXCTWAYkNSFTuNjR9+2UIDiHObguaJ9MSS+YdwWFbcImoUFox4t6Q3UfTiWDMkBD5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=VGljGjQp; arc=none smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="VGljGjQp"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-90ce6d5271dso1090186d6.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 08:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1788795830; x=1789400630; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=87Eb9cn0gqF/vxYu718MPm0f1YFf09SOKLR2T0rK7Rg=;
        b=VGljGjQpYsCwidgu0HJPuqnfN0T37V1FyO5ZPQ5b3UOBsBQwsPOlawZs9u/eXrpv75
         1kMqeNbFPxr0/m/io6bcWPZek6rRy6kkqtGvsJDkrMxialSziNmtxv+dJNtynH5Qdbta
         mRhmrkP7c3B7vuC+/LTqnj073PZEFQAK75A/dIhi4fcNCtOc1F8tX+927pj2CyCEGkR1
         CQGiU7B0KlCz1azTO4klTUzE33dskWbGdy/tXGjCGf0keZ7rCcdNEYN0F4c1WQNEVgyb
         JFrYoT3MpwMfGGfwNdeQeNRuwsQbe4V9Qj4MqxzaseegI/FJnQs+i/Kdf7Y0oPFhL2w8
         S/xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788795830; x=1789400630;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=87Eb9cn0gqF/vxYu718MPm0f1YFf09SOKLR2T0rK7Rg=;
        b=PKAFXt6UTFvkx07r0sP20CfpqUMjnH2EUUGFGsYGC0iOqsHyK0E68THid7eqKe3We9
         ejfJ4xGa0XlHWK4qZM1USt3yTlg/aBH4xopgQiH+QsSlrpdjKQ+JlLwlOmuXxc3aP1FJ
         N28tIFE76oSlWOxgIgBXZLy9kkl7nSCRFPnBvfFF/ozhpyxOXxUm3N7j6Pkd2p5uqoH+
         jRAs3fT+gDpOI7KtuPSCBsW8lh8XoZ1MfdOkVKHBrFBq6cw7me4kObmkPkAjtVG+0Stw
         8EkrzCqf+E2X7TJIeSPMLqr//PwFtODHAjghy4+cfVg/Ed2KhO59JU6ZQ20olEm9ZJo/
         PTng==
X-Forwarded-Encrypted: i=1; AKwUvBxHNe44AU149l0LjvZll1mh04+jMw3Af9Ssf7lfgSp57X5cK1yVipSDIhPLCYV9btlK+umrmlKrmnrZfDU=@vger.kernel.org
X-Gm-Message-State: AFuF++muinOxDrWDJJbPxEUaLKy9cmw+GddcNOMZYEGWrFas+eSUQ7Gr
	JaHM6/izCiAsSScMInHFU1fdccTN3loEg+wV8rYtWf+PYrJDsydfuVz2jwIFlHhwHA4=
X-Gm-Gg: AYBFou1OvTxQ492PBFU36FIu25tcMLfuzcjJYxfJsk+sAUghc3gY8nR2JBwULedy4Fg
	9aK+0Aso+ZtlNnQYIxTKNVLzi410QALOBVktgTT16+yC0mQj3REVN+86aAmhBW9tPqknDM80iZg
	TB2rAjovM/xq9aycX56y+5kik+l3EBlYC/pP/HASLRS2qeRi2EdE6FtPSEcuAy1q2gz8NcDUe6m
	AP1kVgUdTe82sJsu8OeKLJhiUVmaJo8Vc4nVDpIMzdWxF9/v0SjPffZuvxJvAg86iQa1WQrei+u
	a0M1xJbcGaGi6EsYUGY7h0/6sADdDw78uLvhh36HgWanC0ErlAUWcJZZZ1puzn6aUfnUTzf2txt
	k6XLvmgyy7PLMjBLz7tABaiAqNxXTU+mEjOA1SK9w75UbyI/A66xUX9CFdZi2d5sPEmPI2DcQnv
	tL4613zJDBcCSxUPcLikq5I0nLplYyeJcU5DUOgcvHrWl4Vg2PltvfNfk5Nue6ISRqUuNe40Fvn
	1swm1p0ISxBmgtZ01sZJAApT8BZxq88abH9O4UxDCteCg==
X-Received: by 2002:a05:6214:2b85:b0:90e:9ddb:1224 with SMTP id 6a1803df08f44-91061f709e8mr21563666d6.4.1788795830418;
        Mon, 07 Sep 2026 08:43:50 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91040646d59sm93755486d6.8.2026.09.07.08.43.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 08:43:50 -0700 (PDT)
Date: Mon, 7 Sep 2026 11:43:47 -0400
From: Gregory Price <gourry@gourry.net>
To: Ye Liu <ye.liu@linux.dev>
Cc: Miaohe Lin <linmiaohe@huawei.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Ye Liu <liuye@kylinos.cn>, Michal Hocko <mhocko@suse.com>, 
	peterz@infradead.org, paulmck@kernel.org, mingo@redhat.com, rostedt@goodmis.org, 
	jpoimboe@kernel.org, mic@digikod.net, oleg@redhat.com, tglx@kernel.org, 
	david@kernel.org, nao.horiguchi@gmail.com, rafael@kernel.org, gnoack3000@gmail.com, 
	ljs@kernel.org, sj@kernel.org, rientjes@google.com, shakeel.butt@linux.dev, 
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
Subject: Re: [PATCH v2 4/8] mm/memory-failure: convert process iterator to
 for_each_process_rculock
Message-ID: <ap7bqPro90Mg270u@gourry-fedora-PF4VCD3F>
References: <20260907081334.1152889-1-ye.liu@linux.dev>
 <20260907081334.1152889-5-ye.liu@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907081334.1152889-5-ye.liu@linux.dev>

On Mon, Sep 07, 2026 at 04:13:30PM +0800, Ye Liu wrote:
> From: Ye Liu <liuye@kylinos.cn>
> 
> Replace the manual rcu_read_lock()/rcu_read_unlock() pairs combined
> with for_each_process() loop in mm/memory-failure.c with
> for_each_process_rculock(), which scopes the RCU read lock to the
> loop body via scoped_guard(rcu).
> 
> In collect_procs_file(), the page_pgoff() call now falls outside the
> RCU read-side critical section.  This is safe because page_pgoff()
> only reads folio->index and does not traverse any RCU-protected
> structures.
> 
> Signed-off-by: Ye Liu <liuye@kylinos.cn>
> Acked-by: Michal Hocko <mhocko@suse.com>
> Acked-by: Miaohe Lin <linmiaohe@huawei.com>

Reviewed-by: Gregory Price (Meta) <gourry@gourry.net>

