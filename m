Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8446943A809
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 15:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788796161; cv=none; b=FzJ/mgc/9REEoBc8ES2jWkkrkqIVzA76vfO8mHQ0NTuqstABycaK0VQJgH3LMAUvi6prv31zQN2EPzuuV5oIW86xveku9shKgBNeDlBbK1AEhsIXKbSER44gqhBK4clkiTCY34EA2sVZ4TXJEpwSQMhKku1TXupTYHFHRQHZKbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788796161; c=relaxed/simple;
	bh=dc19MyR+MdaSZ6ExG3WjVOcpiLC0WjbMFuhA4PRZYv4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=acYy4p77f3QHJH/57PcKqOeyS9TvHHl90Xx/RxTFWXRgybnb9s+kuEVMhIeE8u/PaMvuvA5hlYA4p2e5o2kIMwgtwtDbX16lCvZFV1ePeIRUYLp3Rv+xK7AcDokxOuUaqooKTVTiI+dFPf81BlHm9GU4ij7HzgDxXYh81hKFI3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=OvHrAkzW; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="OvHrAkzW"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-90d7fa95a58so38936166d6.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 08:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1788796158; x=1789400958; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7bstaN9ALzEM6FurB5GuElbXVvDphHV4J4gPI6CtdWg=;
        b=OvHrAkzWOJa+Lo4uN3+Sup5/whQbgHKYebHIyDZvkzHI0XzscuE9gjgBp1GSE9ZAPc
         uI+cT0kkVmNx3dQP7q7Mp8oITquRla9YBxGlb6exC2W08ld3lw8CZu0PxRRYczJbNOse
         7TYlwiPDE9KHzuY0QNOsYce7sAFMBVjZuWDHOcWH7p9RpmlpFX4OrgN+frNRDQJSX6ft
         7YqISn57tVPgJ57EcmFBUo1ITnJcTt+MZvI46rx8P6kxvZJraBi8hEyP5+fMyiyk5Mjw
         Ld5o/XSaIDhzNOdb25sPnr93J1ljFNg+RsRr5DFv616WKGPCMygMNv9oHHPDRhIKJ2r8
         /Xyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788796158; x=1789400958;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7bstaN9ALzEM6FurB5GuElbXVvDphHV4J4gPI6CtdWg=;
        b=Y82FLJSbaQ0YVUfnbMBzoefsN+xKe+czSA+9R33wfIseAOmhJ3ix1IWQIwKos50ob4
         y5vKBsj+2lcn9Yrz10OOUZdp4YVDNvWKGQHLicuB6L3LupmsgHLuedBxiNYWGTcmpG2q
         jkUekHm4oH5LIjIoxOHrxz4HdOTBu+x0q6dKi0Jr9RXvXlZpJjOKoQAlkI9QxiCLa4L8
         lWzs79yfrzKuHVlt6VilPGHYm4+dwSl1N4Ieohc8r1XFycyXc48GDR4IAvS9Jr2rtpKD
         hwzb4Bx5gHaPl1E3QsNEi6a3yMEoqL4ag9OYqhQTdWKUkLRMXBsgbYilTd2Gjsfa5eoc
         0idA==
X-Forwarded-Encrypted: i=1; AKwUvBygXT8NCapADCG+fjiA8fmCI0R2i8+2lZ/jw9dvnzr1PCEPUlxyXtKxnjCejvQZKrZfZQWWj6k6aHBG5ek=@vger.kernel.org
X-Gm-Message-State: AFuF++lPA6XI899Ei3h/GJKwNpgpZ1PUW2UeZq4KkKZc7DxwgozNe2ta
	WXl/BGn6aYSRrPOJKIkF+ySu6t+Po/DdDK7hHQa+qZPMMy9H5tgbHRM18gxJxknwbtU=
X-Gm-Gg: AYBFou0Q2sQePnvQES+NsxyZDzY7Chy73XImAhuLt1GNkjRHlew1qd1NEPJUGGC5+A7
	tocSM1a4dTwxBqAsZ2L5EN2RqWu0JN1piI3XNsMZ9+rIEKpd/plCUnRNUXMJ015jq4yeqfGrdb7
	Cyb4EyzzwBOE1IyeViJNiQRXgwLw7S6oWgCHv1zS7CqmJ8YA1BgY8LHLV87faTG7ts6RVTNOJ47
	eedXO3ZawBshNrZhPEsWDY6ZBa53rsNR/38BjHsTdmVyUWXEUVAdvGbYusKzbGwPgJq7ssCtCWt
	2utYrXD2pcy3bVdAUwvTYNaC4Nyff4V9RRGZnEVRVCFQufZIuRwpSGCd7RQKrJeLd1thdqoHnUd
	3/ql9oTzGyvO6Jc/CU7xdCQAaCUawcCOpve7owxQh9VPI2eIZuCZO4hGmn8xMWr1mpsH6GP+839
	t9Nm4XzTNZuyHGH1WgxURIHeFni1WAAFwL+IT7BIi6ly0WxyWNCnKRpQ4SOIbjCkMXSm4gL8LxF
	P3FPG9BTjnSvxJAjxWoBipksTeRECQpRRo64k0rLIQ3
X-Received: by 2002:a05:6214:2584:b0:8f0:3b98:d6af with SMTP id 6a1803df08f44-9103f06f338mr298091046d6.26.1788796158337;
        Mon, 07 Sep 2026 08:49:18 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91043b54cd6sm83510576d6.34.2026.09.07.08.49.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 08:49:17 -0700 (PDT)
Date: Mon, 7 Sep 2026 11:49:15 -0400
From: Gregory Price <gourry@gourry.net>
To: Ye Liu <ye.liu@linux.dev>
Cc: =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, 
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>, Ye Liu <liuye@kylinos.cn>, 
	Justin Suess <utilityemal77@gmail.com>, =?utf-8?Q?G=C3=BCnther?= Noack <gnoack3000@gmail.com>, 
	mhocko@suse.com, peterz@infradead.org, paulmck@kernel.org, mingo@redhat.com, 
	rostedt@goodmis.org, jpoimboe@kernel.org, oleg@redhat.com, tglx@kernel.org, 
	akpm@linux-foundation.org, david@kernel.org, linmiaohe@huawei.com, nao.horiguchi@gmail.com, 
	rafael@kernel.org, ljs@kernel.org, sj@kernel.org, rientjes@google.com, 
	shakeel.butt@linux.dev, xu.xin16@zte.com.cn, chengming.zhou@linux.dev, will@kernel.org, 
	boqun@kernel.org, frederic@kernel.org, neeraj.upadhyay@kernel.org, 
	joelagnelf@nvidia.com, josh@joshtriplett.org, urezki@gmail.com, juri.lelli@redhat.com, 
	vincent.guittot@linaro.org, tony.luck@intel.com, reinette.chatre@intel.com, x86@kernel.org, 
	pavel@kernel.org, lance.yang@linux.dev, mhiramat@kernel.org, pmladek@suse.com, 
	longman@redhat.com, mathieu.desnoyers@efficios.com, jiangshanlai@gmail.com, 
	qiang.zhang@linux.dev, dietmar.eggemann@arm.com, bsegall@google.com, mgorman@suse.de, 
	vschneid@redhat.com, kprateek.nayak@amd.com, mark.rutland@arm.com, 
	Dave.Martin@arm.com, james.morse@arm.com, babu.moger@amd.com, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, rcu@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-security-module@vger.kernel.org
Subject: Re: [PATCH v2 8/8] security/landlock: convert thread iterator to
 for_each_thread_rculock
Message-ID: <ap7c7wGbJqOVZonN@gourry-fedora-PF4VCD3F>
References: <20260907081334.1152889-1-ye.liu@linux.dev>
 <20260907081334.1152889-9-ye.liu@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260907081334.1152889-9-ye.liu@linux.dev>

On Mon, Sep 07, 2026 at 04:13:34PM +0800, Ye Liu wrote:
> From: Ye Liu <liuye@kylinos.cn>
> 
> Replace guard(rcu)() + for_each_thread() with for_each_thread_rculock(),
> which scopes the RCU read lock to the loop body via scoped_guard(rcu).
> 
> No functional change.
> 
> Signed-off-by: Ye Liu <liuye@kylinos.cn>
> Reviewed-by: Justin Suess <utilityemal77@gmail.com>
> Reviewed-by: Günther Noack <gnoack3000@gmail.com>

Reviewed-by: Gregory Price (Meta) <gourry@gourry.net>
