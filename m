Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794558004;
	b=W1CcKadroFFeCDsBjjjJBmJ1WIu/sslCDPnOOWPgadSLsZ0PuliqMkntKhgFbB7XO33b
	 mzjYV0YdThmwMECXqYZbd6XuEpxmVaCaBH3sD2Zw1ha61UiR307Whd7YLh4Jw1zQPkqbz
	 7yqNsX3ObUOgy8qMMNw/VIWyoZGZsvcl1V0YkY01Q1D7KAh/J1K47tpUnhnouCdOTwW3h
	 gm+4iDB9bVye9laselwimh8emShNtSU2KcKD1VUub46GyttVajb8XwNoe92qh3t+Ef6mK
	 rqEnFPjciEeW6I7OrwBOYUU8Bdkt3HsgkKWdDk1fGn60mFr3xEZW5t+yfLUuPjyIDYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794558004;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=u6ODy5SnsRQugFSPY6vBQTFSWdeeo67enpuBFMw2vTA=;
	b=ZlZomMKN4LmtVkASAodA0EipHL8xys4Dx5inlWMBPH1V24jhjfgJW3rRwDqfHDJj5Yde
	 bsietfQjAMfYKDypIOXNFCgjHLk+2LQ99F7AfpSHekUSMEWKSTjduwr4i9dZyTDqM6Vpo
	 AHHDQvHwKR5UgbkvB44G6SI7PW0JkdPsoBuNxJRjydRKQxIasj0EeGDeeZ0+jU+ekZ61j
	 UiLc4UP7yOkKWj5w65geY48s8s0L/9YERPEo1V39RbFpg/TE00MXxawN0/Fm0GGUsFo+N
	 Kn0YvQmpflfSH7AV5FtwOdPabUVxB18Yp1xyzDvlHiTkyfrdwzPdXSR6hOVvA30hu6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=OGJEvOtU;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CD08606A32A
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:20:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2CD08606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=OGJEvOtU
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so712565f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 00:20:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794558002; x=1795162802; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=u6ODy5SnsRQugFSPY6vBQTFSWdeeo67enpuBFMw2vTA=;
        b=OGJEvOtUEBShLexZaoNIEU0Kv8IFFc6MSOKErs9nl6AT7R1oYdts6gSObwQu4spiUg
         PuagTz6s+qgS6+pEfJDcBUMrEB+UeARXCPje500BpFu8z+SnfHkrdQY32QSPeimCrmIK
         fBfyenwoh3fJtWsIrVT+kDdKV2r8W9RBtqTq2mwmiI9x4dXCZ2xC9ZQVvFuNQXwjs2Mc
         dMMrYCaybPmLrMqxK3OOBmq9ZiN0q/NxNUz4Lw+et1VWbWIP1NTBbD1fohcIk+XdNpYR
         NXcP2JhODHgUbxvu55f6+W4qbduZASDMaMUrYHPw7Ykr5syj6G54Gmf1Gof1Pmwzphuc
         7lPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794558002; x=1795162802;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u6ODy5SnsRQugFSPY6vBQTFSWdeeo67enpuBFMw2vTA=;
        b=rEkm5++LEcPgVj5tR0o4lcJVqNzo3HuOFvGhWVGuwY3e1naQFl2NIx+V7HxqxPsgwa
         o1Xd724XVrFCyd5Ul/nsiDYiOk+dGft4lW31Odsk9j3gh4HXzO3yMPp7tk6l4ugcI73E
         lcVfAR2ZI9c2mLa/rfLAjOTxzlYGMdBF2Gjg06lfEoZiH/J4JTwvXYX/RSPh/QK/NeI8
         P92+8EZz2k/oT8aWYQ872rqaxTClVq+uklNOIpFWvaQ6mPlTw2nj5BzFB9ThE6o7PQSj
         kzN5Y6SOcoiAsB/RwdW+FCEob6e6zvvzALrAfEJIkf1ke8BbZ/aIWH0gCqUVEHq7yJO9
         CWWw==
X-Forwarded-Encrypted: i=1; AL+hErHy/AkT+jNqXsFuIZZvdpbVdZKQIpNd0K/iMn67AXzof2CdyG8+R+HXv8ioFGPjuREPY1hYPqeaqhvb8JI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+iVnUeSfgVFhlsdsSFG97m9P3uV8q+/OtpbWl57/9TXtpARif+
	NVH9lSW1GpCbxwH7TM1uFthteSHtw2xXNIqfRba9ywXMX7efmS2Ufi/2aSoP1I67SysWhsAgk4k
	hsymicN8=
X-Gm-Gg: AYBFou1vzQdDijb6vMZD8uN185eLKl/AWLsJ2x1JkWup35QolzQzzt07iaKoak40Po0
	dXww2D9/sTAY2rjywEAPtcQP7qRptZ4jDws/N2dMPflT96yby11857yCUgTV81BU+fjgBUj0ZHl
	LZbvcwbobskbl7Lr1RsfYd1FLIVFjKyqUn7bj1RE/NX0epqOC9/SOrSuYExuuG5RoCzcfvWtYlj
	rPMPhWS4WKMTcz0YJkZ+F5zEshEs3vaddDWoS9rb+nonaly8VILP2ATCM8F68bVpkGQm113kS3q
	iCnDQFaBEtdZ7oKu6ygSQVix8FgAChN6krFE1degNOWuZRh3tN1gsh4u0Gc+gg104p7lG6J8OhT
	54V0iw+JJj8tE7SpjjpKi0Rh2TRtfFCQwmIlXqrpBt5NAyRzoahWeYxgfcavIYFhfR97fn605mM
	lhCDdWIQe7Bb99xqnlYjdsRCC+nuKW8GZyQwETTbtgUYyxRGrqxkU7F3NYPKRJclG/RUEhds5gO
	51UxBXZG+8kabGZviqMOVC0xCkrSfGz+flrIadjdiIKKa5XA7uWzx0brofxHg+Qyd146kiIfHs2
	DdwLNqA9sKdi/U3Dl16WuM57ImKjKMDKaKrUc3EfbFc=
X-Received: by 2002:a5d:5d86:0:b0:48e:43a:1d84 with SMTP id ffacd0b85a97d-49c712ac267mr3929586f8f.23.1794558002001;
        Fri, 13 Nov 2026 00:20:02 -0800 (PST)
Received: from localhost (109-81-94-245.rct.o2.cz. [109.81.94.245])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c609c602dsm3640220f8f.46.2026.11.13.00.20.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 00:20:00 -0800 (PST)
Date: Fri, 13 Nov 2026 09:19:59 +0100
From: Michal Hocko <mhocko@suse.com>
To: Zhan Xusheng <zhanxusheng1024@gmail.com>
Cc: akpm@linux-foundation.org, hannes@cmpxchg.org, roman.gushchin@linux.dev,
	shakeel.butt@linux.dev, muchun.song@linux.dev,
	penguin-kernel@i-love.sakura.ne.jp, tj@kernel.org, mkoutny@suse.com,
	cgroups@vger.kernel.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	zhanxusheng@xiaomi.com
Subject: Re: [PATCH] mm: memcontrol: don't miss processes whose leader has
 exited in OOM scans
Message-ID: <avbIL86R61Lu2YVF@tiehlicka>
References: <auhiGqKJeukk7t3P@tiehlicka>
 <20261102114029.1259655-1-zhanxusheng1024@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261102114029.1259655-1-zhanxusheng1024@gmail.com>

On Mon 02-11-26 19:40:29, Zhan Xusheng wrote:
> Hi Michal,
> 
> This is v1. v2 [1] reworked the check, but your questions apply to
> both.
> 
> On Mon, Nov 02, 2026 at 11:12:42AM +0100, Michal Hocko wrote:
> > Is this a desirable/intended behavior? Shouldn't we move the dead leader
> > along with the rest?
> 
> Userspace sees it too. After writing the PID of such a process to
> dst/cgroup.procs:
> 
>   src: cgroup.procs = 85       cgroup.threads = (empty)
>   dst: cgroup.procs = (empty)  cgroup.threads = 86 87
> 
> Moving the leader would fix that, and memcg would then need no change,
> as the PROCS walk already returns a dying leader with live threads.
> The catch is that the leader has already gone through
> cgroup_task_dead() and is still accounted by controllers: pids, for
> one, uncharges it through task_css() when it is reaped, so the move
> would also have to transfer its pids charge. Tejun, would that be
> acceptable in the core?

Do we have any conclusion on this?

[...]

> [1] https://lore.kernel.org/all/20261027144016.2582880-1-zhanxusheng1024@gmail.com/
> 
> Thanks,
> Zhan Xusheng

-- 
Michal Hocko
SUSE Labs
