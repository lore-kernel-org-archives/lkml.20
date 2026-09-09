Received: from mail-qv2-f10.google.com (mail-qv2-f10.google.com [74.125.230.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 092CC366045
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 18:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788978526; cv=none; b=u6WuLe3x50BSSDgf+lemPRghYZ0dN6veU0gVJUOErB1tnJYbweml43hcCrxKHdAmZurtIo0J/slGY7XhMY52DMjiGK25LL++zNE3cGrOpwbBQo/qnGZdqS8SYDBi2IXaK/xNHUb2bToMwJ8VM9y2uZ3iO+RTNZXmNXX0S9seC3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788978526; c=relaxed/simple;
	bh=NU00fY7Kqj7rRdxZPx//klgo1B0RnQLyxTcx0t8+WAQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XvkwNAcbadPDxM1LQ9f3rXhCaJo8g4jsZBRaHQ9Xd1DPVz+6DbdjmZ4+iFkytBdSKXy9BUYzUQbhbXelAjcYHtRGrfDTtWs/L/uIMjSpbQy1F0Q+OdwiPHn5lXce923Ur+x+sSnqHSF4MI19gpEPeHjrjiIR3HV2IGTyqY2zasE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b=JPORzTKf; arc=none smtp.client-ip=74.125.230.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b="JPORzTKf"
Received: by mail-qv2-f10.google.com with SMTP id 6a1803df08f44-90e9876052dso37382586d6.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 11:28:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg.org; s=google; t=1788978522; x=1789583322; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IC8+CYBpTjyEX77+0CoRP0GmnJOZZWZXdKNBjQTGBi8=;
        b=JPORzTKfN63DhIkurQSRkhzXbUEu9E1xZAVCUY5FtyLYNBrXEek8QsZKDiiNTuv+1o
         XYWcl1Z70z+b/yipnDmfLDlv3YC5GnGuBrYTo3FnXdRkGKDZEYCk4Zh7Y4FbypRQl8w4
         CH4hHUu2EeoRhUNliSEsDruIEGL8bFhkDGGEoNwgvGU123nnzYjU5AerXIqF44gmxITT
         j40V/ZBw9vW70NKS5POG4Ash5PZDpuifPCvorfrgL+gNgekOGo50UoJct2CJxFwNz1Ig
         Pg2pEI0JZ2/unVdO/FKW7HpopBm2HxdabAKrtQUR0ZYeVgA5eZkYAVn7txw5K+GInsWP
         s1Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788978522; x=1789583322;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IC8+CYBpTjyEX77+0CoRP0GmnJOZZWZXdKNBjQTGBi8=;
        b=dn8DHKl+6hTpSMrfSDCBYAL4XtyIuOpeNf9tQm2CnzKT5e3fErdXaA/yurJUP0JRBM
         rUupmU290AJ0DaSIUNJfSTgwqt4Z7F2/r0iz0772s+fu7hqiHXmzGnXpgEsEY3XF9Chd
         eFcwTT+aE7QMLG3GnidMC6V0agoe5sWqyjBtvoYJg1xtbtlPM6GD/utBACXZBR0riQQ+
         07zd4erVhuMeS2tS28ir3pok9hWk5WVkFsDLhcK/HDA81DQXha99zWU3zDilXFSWBsU5
         AP+Oo13jAYyOM/odh43+Yhy9RTFxwghCidh5Be8iT00xb++VEj1c4n1r5Q5eQMo5HRW8
         8o9w==
X-Forwarded-Encrypted: i=1; AKwUvBx1l9tw59i/ocWZ/raqikiW152K25EsgCPH+GC9yhELLPy8PJoCXMvt9FuNoe4WYhaqSJMR1NfnOQ/gJiE=@vger.kernel.org
X-Gm-Message-State: AFuF++kzNgg4StzXPRS+lKrTZJl7+bsywETry8tJ0/gleFb21N3Fn5GI
	EI1thmO3cSIJ1snhNnXDaG2/YqzBItUsL5rhVm+MvJQgTjrBXTh9a72IvM6tvk7N/r0=
X-Gm-Gg: AYBFou3w4sovvXsdXwtuRwXZHY0zVTT3aA5YsbPqENgy83sARQZdKYFhtmkA7wrDPE2
	UeCulASzIDBB6FiAhjES5PZCKrOjQk86Cw/yp4FzeVO7EtZAz+OZpkeGAs5YzFQT/3Q0YdPl71G
	lF9Li+Ex2KwPbBIHgWA7DgkstzLIT5soi4yZ4Es85assm1u2SUcAB2anAmbted+fNeRPyBgDn9h
	zIhW1FtX86VMX2KIay3yilR/Er3CJTQbqTCHm7C944P07E1eO8Bzo9OKj0Jd6yIaFiEkjtv0DQ5
	oU7tA8jNThm8NFO/hxEr9ikposj0aZwafOyJ653A/P3GJmgtJVhCuV7Yc4E3hmEuMxeQ8HWsluB
	iMiDqw8+KNV+Xz7WDG5rUelmmbuF1Q5qhTEKSHYt6+lsV7HYXGhawToALL/0Rks1YzWeIvnKAjt
	NQkZbbt5H0HwbsuTh55k137foNkSNNlfYEWjNVdn+nW/2v3cUrGzPu//YmR3QH42qpw+TOCw==
X-Received: by 2002:ad4:5c65:0:b0:910:74ec:8892 with SMTP id 6a1803df08f44-91074ec88f2mr36395556d6.6.1788978521419;
        Wed, 09 Sep 2026 11:28:41 -0700 (PDT)
Received: from localhost ([2603:7001:f100:500:365a:60ff:fe62:ff29])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-910406bf8c3sm150409236d6.48.2026.09.09.11.28.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 11:28:40 -0700 (PDT)
Date: Wed, 9 Sep 2026 14:28:39 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Qinyun Tan <qinyuntan@linux.alibaba.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Michal Hocko <mhocko@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>,
	David Hildenbrand <david@kernel.org>, Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Usama Arif <usama.arif@linux.dev>,
	Dave Chinner <david@fromorbit.com>, Qi Zheng <qi.zheng@linux.dev>,
	Yosry Ahmed <yosry@kernel.org>, Nhat Pham <nphamcs@gmail.com>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	Xunlei Pang <xlpang@linux.alibaba.com>, cgroups@vger.kernel.org,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/4] mm: thp: restore SHRINKER_NONSLAB on the deferred
 split shrinker
Message-ID: <aqGlV7NjxrFPYtRH@cmpxchg.org>
References: <20260907110111.2286932-1-qinyuntan@linux.alibaba.com>
 <20260907110111.2286932-4-qinyuntan@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260907110111.2286932-4-qinyuntan@linux.alibaba.com>

On Mon, Sep 07, 2026 at 07:01:10PM +0800, Qinyun Tan wrote:
> On a system booted with cgroup.memory=nokmem, the deferred split
> shrinker is quietly demoted to a non-memcg-aware one.  As a result,
> partially unmapped THPs are only split under global reclaim; memcg
> (limit-induced) reclaim never splits them, so a cgroup under memory
> pressure keeps its underused THPs intact.
> 
> This is a regression from commit fafaeceb89a5 ("mm: switch deferred
> split shrinker to list_lru"), which re-registered the shrinker without
> SHRINKER_NONSLAB.  The shrinker had carried this flag since commit
> 0a432dcbeb32 ("mm: shrinker: make shrinker not depend on memcg kmem")
> precisely so it would keep working with kmem accounting disabled.
> Without the flag, shrinker_memcg_alloc() fails with -ENOSYS under
> nokmem and the shrinker loses its memcg awareness.

Here is the reason why it was dropped:
https://lore.kernel.org/all/ah9PGv12mqai84ES@cmpxchg.org/

After your patch to make list_lru expand for NONSLAB shrinkers, it can
be restored.

> This was noticed by Michal during review of the patch "mm/list_lru:
> don't copy stale shrinker id from non-memcg-aware shrinkers" [1].
> 
> Restore the flag.
> 
> [1] https://lore.kernel.org/lkml/697713c4-0857-485b-aba7-c74f37a3c8b4@linux.alibaba.com/
> 
> Fixes: fafaeceb89a5 ("mm: switch deferred split shrinker to list_lru")
> Suggested-by: Michal Koutný <mkoutny@suse.com>
> Signed-off-by: Qinyun Tan <qinyuntan@linux.alibaba.com>
> Acked-by: Zi Yan <ziy@nvidia.com>
> Acked-by: David Hildenbrand (Arm) <david@kernel.org>
> Acked-by: Usama Arif <usama.arif@linux.dev>
> Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>

Reviewed-by: Johannes Weiner <hannes@cmpxchg.org>
