Received: from mail-qk2-f43.google.com (mail-qk2-f43.google.com [74.125.230.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BA764D956F
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 11:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789644820; cv=none; b=qI6OWPTdYDhphMovRQ5SxOOvwKJUvUr5PjOUW2xvHN20POb8D6GvwfgN/nQUattJ1Z08aE5tGdHDjC5jyVbcn4pDmNiScLm6cU88y70B6PRyNcGWgrREb3hT9BYURP6N4F4JHpKWao3uxFC+/ZVJrNBfMIhaJehwHoIapDDE+0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789644820; c=relaxed/simple;
	bh=/qbvmg9qg7ZCUqgxpb6HURrKpLdmLeFWXHGzm3ui/9o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E7ypJAfEY6XoGq9sho5xfFhmbVbT0jTxgGVA1KAGPZE9aDYdvJFiQqrfI0tBianPcDbF0YEHFCYccRtoXIzSW8pcN1DnklKY9zLQ97U3ZuyyxwYkCgawuGmnsa4viPOEzvxnKQoeA67d7DOulidwUpL/ewrTr/PakheMHK7oud4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=XqDuXThy; arc=none smtp.client-ip=74.125.230.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="XqDuXThy"
Received: by mail-qk2-f43.google.com with SMTP id af79cd13be357-939109fafd7so55657485a.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 04:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1789644817; x=1790249617; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eIBTGr6fLUbIiBkos+EvpyvMIrPaTb53KdjrzQhoa/M=;
        b=XqDuXThy4dX4i1HY+Xp44y7ihdEoLsfYOD0Qc/7NNx/VmYXiPhMAnwqODcklkobk63
         9uvLHuQ7ghhdcacoFXH7l29D4en8oNLs4ISxj09VqlC2FT2YQjMMUr5lZKDT3dk+diXu
         w25lfxHYIZ7MVBgUaXINq+k7YX9F4lLaGg3i0md3vYc6/MP5zWCeekkvI5kTtPtuXoVb
         UwL87rt/xdFd0he3eM8uhR9cpR6UdHJQX4XW/WlIxRLZRIp2Q3u7kIGajKF8FFrDhHAS
         34OnROFvWJzjFBKtLxjpPGvgcs5dqGqD7bpzQN/Xeq8dbmKq61V6E9tiUfkU9TpKxisc
         tOuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789644817; x=1790249617;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eIBTGr6fLUbIiBkos+EvpyvMIrPaTb53KdjrzQhoa/M=;
        b=BOnN5HTT/FID6vA0GGkCZjRIiu+yHOXi1hDCWJ4En0n6zazVKbx4NRmROqwbJRSVh5
         q99TncfRdkEeT3M/clg/J7B8J2TqtS18mPnCPoWKuOeeWLCKzSULdijlKaEKZtjh1Hyy
         k/AdwPg7rI9iiKBxtSrPEK55jzgNO6kRx/Puf3mf83rYjT71uEaNWyivn5QIgCy/gx3Z
         TWnr2ijaTTQ2goDTX/ISuSbEz24JQV5stj5gwPxniH3+t3uLVZzoinkiUc1YNfwfTRCx
         +g+D0GbCtTqmnvcDqH0NK/j5bGQHA7HqK4Pk9Mq3H4dWNxCEBeJk1zPmQVWPXEwWrXDJ
         EwGA==
X-Forwarded-Encrypted: i=1; AKwUvBx3dlDkfecTslwWtebyMAzkHYbwuHOpnXYeH5eJ43+MXrEXaSflO77k4Ey19HzEYtBdfp9TY5h5XKgzwAo=@vger.kernel.org
X-Gm-Message-State: AFuF++moQ6YhBLxBY6S56KliiinjoKh2vr6T6byKrMiKw0NFctFMoHZz
	XYPXwZco+FpY9evyq5pG0WSnscgpkXrUwFjAdIYTVFVi2gJNv7DoLX7pT5Y6IYIKu+s=
X-Gm-Gg: AYBFou2/jMr2gIV1BTjctMMgiLVEUd9F8KUALINSLv9cgis9iwjiQXy7Scwfx18ueOP
	l3pyqS6jVnGtMf12/FKHjKASJ0/3zDNRSyms54iWCKjuidAXHWvO0GN9GK9r+lHZ3LbVwXjlHIR
	6kPWibhqVY1Vf7lPvRW9e+Zpn0U/IFvcZNnFcMFuq7zdzGOMWKg8RyYmA30iCpFucKJanum9JXv
	SXuo/MUBg7Cpn8GZrhjbGJmQQ2Qkwl+Cb7HcvNSILBa8xj4v1bMMba5k6JJcuPgPDx/8LBvG82A
	bU0wDsdbG3iIJfkNvlwy5WfwBHcJrq7wA+JFUEv7oPSaVHfneS0nZ5d1wfFazCaUc3gtjuC/Rx/
	syfLrqR7qCTKfcYEY4XEX3e1+UJXC6fFBtiULvI+5uZCMvsavrJT2ZqE3+vHp3+ZwGtlOYryJt5
	y1DzwcLgJGJTle9yeHg4H/KXLvsXKZ9yi/7NAJimoUh9IMSMkI7vx83syA0alwqeqLq7SkIymnE
	zpDm054g4O8nfOrg9+/yGtH1E3VF6c+5pt/cTBW98Os5GE8a/RaFc8wBRJCmacxbg==
X-Received: by 2002:a05:620a:2846:b0:93a:c69:69d6 with SMTP id af79cd13be357-93bb79414ccmr1075893985a.43.1789644817199;
        Thu, 17 Sep 2026 04:33:37 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93bb4eb5e59sm421092285a.1.2026.09.17.04.33.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 04:33:36 -0700 (PDT)
Date: Thu, 17 Sep 2026 07:33:34 -0400
From: Gregory Price <gourry@gourry.net>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@meta.com, 
	akpm@linux-foundation.org, ziy@nvidia.com, matthew.brost@intel.com, joshua.hahnjy@gmail.com, 
	rakie.kim@sk.com, byungchul@sk.com, ying.huang@linux.alibaba.com, 
	apopple@nvidia.com, urezki@gmail.com, chenwandun@huawei.com
Subject: Re: [PATCH 2/2] mm/mempolicy: stop copying the nodemask in the
 interleave paths
Message-ID: <aqvP7WIzYSzK4cyN@gourry-fedora-PF4VCD3F>
References: <20260829015943.1258774-1-gourry@gourry.net>
 <20260829015943.1258774-3-gourry@gourry.net>
 <d7f162eb-4214-456c-9d1b-a8623da61b45@kernel.org>
 <aqq_yv-cQvzuxr5D@gourry-fedora-PF4VCD3F>
 <7eb8f4c0-6e14-4f91-a3b9-77e82f76ed00@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7eb8f4c0-6e14-4f91-a3b9-77e82f76ed00@kernel.org>

On Thu, Sep 17, 2026 at 11:49:52AM +0200, David Hildenbrand (Arm) wrote:
> > RCU stabilizes the weights and makes accessing them safe. RCU doesn't
> > help us with the node bitmasks themselves (we were using a cpuset cookie
> > to stabilize them to take a copy - but we're killin that here).
> 
> Ah, my memory comes back. So confusing.
> 

mempolicy is nothing if not confusing.

> A resend is probably easiest when modifying the commit message.
> 

ack, will spin it today.
