Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6569A5803A4
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 16:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788885672; cv=none; b=E42eepukr2J1c5j6Kng6GHcS8NZotCC+necdahoZEtzMoiu0AP7TlHzK0DPtTwdgS7NIx5k5xaaEt5IEO99D38ZY88z5/7wx04LWLvdJV5TLbPDlE+4BCi1RiHNUGBxdI3jiP//YGvMzDJ7cBR6KqQI20SHxtsbLdQAPuW3Wr0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788885672; c=relaxed/simple;
	bh=0WHkL3siKLt2gWr0nui1TBB7PxNZQd/Fg0sZRCV9eV8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VSniPeRnsyISDQnrnZRZBZE8NF7cBLvbAHkj0tpaJ5tUUiyJ75eMB5Gng1ZcKiXitOWERFzAF79dlSzI1XhtNfiiWXtyCXIFSEVd8Cxg4XUtNKXMK7AgN9N67vW+tadQkK3ZxYLR/fGblfhbdwL818XgMzkZsC/QroPdNsdi9os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YS8Q20EA; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YS8Q20EA"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-482f2ee53e7so3658990f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 09:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788885669; x=1789490469; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DmxATc8MnBJh9MLhFG8Zz8kz1UkODPqcBWsJlPPeeGU=;
        b=YS8Q20EAUz0y7tDRJmZpWJ0DrPQhA1ifZgh5fFQ2epcV09Z+I/WCHTz+VJj2aj6w2m
         UgnWTS7vmuSZfzF8Kx3jL61udLnCetn5/Mhy1tyVZlzQZrcA/v9JOxmoSmCtVSc7TWpV
         Pa8AgXwPnwu5BFwQ/k5RWPprYhT2HEpFLVTEDVPRJm5PhoA4i8DoENzuM/Q6G0QObjx9
         nGDvq+FQY00lsj9Q9/lO+le87fr4utWe6ZmiolioInn2UW0YOtqBC/B8nv4lkOLmiEbz
         lUfnbgjssuG4WWKHVpDgLz0xJshUmYpU3q8cuVAj8v/6CKba+bnRVy+el64hLgHjb6F8
         o2iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788885669; x=1789490469;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DmxATc8MnBJh9MLhFG8Zz8kz1UkODPqcBWsJlPPeeGU=;
        b=j6UJeYXJK8rRSBhiiUNpv6H195yFEl2YZ0dZ0/vwTtnALZxPvxbwcDSHJ6FMSqDbl1
         eO6oB9ds8nntn5Oj44/Fi0eeUO/shr1t+4yOcFIJ9NjDd6PDaMzVuyg/RSHZh/LebCX4
         dEpiFtluDwZrpTODYuDKuwL8TYVdXBJsau3GOdt/ozdN3/D2aU7G5GQd5wP9lDcbP9A2
         043HDOTSx0kcWYq66PjUyfbQsHyEAM7q67xwZKHyG3YkmsGEthVaPLTNrHJEkkmXsVBQ
         m9UvmwRR/DmsucpzIz5G1QapMcor9wOluW1i0zqKilUtDiglrkQxKqvsWiYndodD3o8Z
         Jn6Q==
X-Forwarded-Encrypted: i=1; AKwUvBzYy1Jg7nZBeZL3zf/H3n1qXmsFmSEFj9qUv2DNrmm6TRSqKGnTu63gc8IhxT7we7+NUtREQG7yrqP8HHY=@vger.kernel.org
X-Gm-Message-State: AFuF++mo8VfpNALIx7k7StIYbMbGdyQHLBUMiROsXyCCSKJqE1XZVZjG
	Qq/qy9iJ4FLaLrayl5bX4z6Efh4qz4Hg/FQqhNSK4ZA3QMpSUE+Waz3R5ruGBsM=
X-Gm-Gg: AYBFou2SUlHRA8rOnQmZa1tYDnJVftVImDuYAiaP8F54NhroDRmvLdL8czLW0XPrTHd
	1RlfYicDyJ0saieqP9vJBL9+eEbnFfLSA0uPctt1JhJ7MGN0vXp1FxgfsPPEwuAX3O1tMh5+OkR
	9tfjSks7E4AaMxackGyKWmbs0TS/mYsBAw2aJLb2/HLi+pQL3e1oLV4T+Q/S5uAIjkrlcpCryoI
	nq2HT3lcXX/eqK1mBPRerpNJ7FqWrR1fOA1grPm9pvwNvrWICUBdhX7ePkxsb7IhRYar5ji3y8z
	LvqKXg8SKF1LSHPszGY9W1bSzAdncaFVBko/iw5ieC2VGwwuxW3cyKD9BQgvdEVjEJ7rXOJMYS2
	FCFcOV6Nlh5ZZDBbyKFuxhHSW3H95lEJLoKegUtSlWrrEFvlQyU745AXcLk47bsBDtspad//5S+
	+HV0rS4VwaWLOH7YnFsu0W6go5N1H+Bx5RnwK54yvodQ0TgxuU
X-Received: by 2002:a5d:584f:0:b0:485:a517:62a8 with SMTP id ffacd0b85a97d-485a5176dbbmr6928581f8f.24.1788885669413;
        Tue, 08 Sep 2026 09:41:09 -0700 (PDT)
Received: from p183 ([178.172.147.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485958f1493sm25834639f8f.37.2026.09.08.09.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 09:41:08 -0700 (PDT)
Date: Tue, 8 Sep 2026 19:45:15 +0300
From: Alexey Dobriyan <adobriyan@gmail.com>
To: Ye Liu <ye.liu@linux.dev>
Cc: Tony Luck <tony.luck@intel.com>,
	Reinette Chatre <reinette.chatre@intel.com>, x86@kernel.org,
	Christian Brauner <brauner@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jann Horn <jannh@google.com>,
	"David Hildenbrand (arm)" <david@kernel.org>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>, Oleg Nesterov <oleg@redhat.com>,
	Ye Liu <liuye@kylinos.cn>, Dave Martin <Dave.Martin@arm.com>,
	James Morse <james.morse@arm.com>, Babu Moger <babu.moger@amd.com>,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH 6/8] fs: convert process/thread iterators to
 for_each_*_rcu
Message-ID: <662ade9d-d662-4f6f-869f-08c41da53170@p183>
References: <20260904083001.553587-1-ye.liu@linux.dev>
 <20260904083001.553587-7-ye.liu@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260904083001.553587-7-ye.liu@linux.dev>

On Fri, Sep 04, 2026 at 04:29:58PM +0800, Ye Liu wrote:
> --- a/fs/proc/base.c
> +++ b/fs/proc/base.c
> @@ -1160,8 +1160,7 @@ static int __set_oom_adj(struct file *file, int oom_adj, bool legacy)
>  	if (mm) {
>  		struct task_struct *p;
>  
> -		rcu_read_lock();
> -		for_each_process(p) {
> +		for_each_process_rcu(p) {
>  			if (same_thread_group(task, p))
>  				continue;
>  
> @@ -1177,7 +1176,6 @@ static int __set_oom_adj(struct file *file, int oom_adj, bool legacy)
>  			}
>  			task_unlock(p);
>  		}
> -		rcu_read_unlock();
>  		mmdrop(mm);
>  	}
>  err_unlock:

What's going on here?
Now it's RCU unlock after mmdrop().

These scoped guards kind of suck unless you allow infinite line length.

	A
