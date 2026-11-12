Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794524565;
	b=I4qbRgSfY2sX9oRQzNj3TniLIOjO4+1iTIxLiO5ohx5S7FLdxL3n1lPuCmQwT9NZC2tR
	 b7HtIJCxiqEkPhq+4QHIQXKUrsZz+bD46/ws3LKL004LOazV3W5XvskrM4q0dvpA69mhw
	 7LUk+rLGqRQuetTTOu8Pl5wl+xSJPshs1sOKJHmmXt251cB3f35HNZin1Qu/zUQyhVwtj
	 WzM+kGPYwHKps4W9MCGy7hggm+JNBzb7sVplejO4HYYCYzyzZ7HDiQVk++/6t6P1hQGTa
	 1+j7KU6/e9n8UT2w8rTVOVqTNEpzn+ZQui5YTbc6cRJkH8hOPji3cv34eQjZPqbT2ng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794524565;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Disposition:Message-ID:User-Agent;
	bh=UdI2gv0nE+PpiDHQRvxALGPPGMmK/uE84Q/kSWgFWc8=;
	b=UQOj8nZ3J7km1pBUiyvYhQf5e8+piPnDtferFPhT2VVynFE2igqN+7zST2MpZ921q7MU
	 UJJnWma2udnF0ridD7FDOIhFH0iMVDqmiA9Wjkqw5f/Wwy4GyJC8lhAU0WdBWcIKU4pr6
	 gl8cE0B4bDWeg3TyfINSnHj6QpIKxkTvWPv7UqzcXS5q++rB7f171wtkNkqigiPevDd53
	 ry/EzYAtbbuijtj7Fm7Dw0vsIVTcFP/QoMb4enqgavJooo90cdVecZrnxrJgD7eu+2qFC
	 2rtRPy/BWfNYyuA+Rl5IoAWv4ub76dhEfrmH9QT2Xj5y0b6OLD38QAJSO5JmEfcWpdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=cl52A514;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01C70606A32A
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 23:02:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01C70606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=cl52A514
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so3200205e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 15:02:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794524563; x=1795129363; darn=vger.kernel.org;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UdI2gv0nE+PpiDHQRvxALGPPGMmK/uE84Q/kSWgFWc8=;
        b=cl52A514dZp9s/iyCKuRlFULJYoeu+l+XDeZgfaa8mqtOB/O2+RLH73XsImvRmlSmN
         HxhCuWFxKFmvtxF5R/ePkRzklwD51D1+ATvORMP+rU6PXjdu5XcOfenvXhLwY1vPvyTx
         uiy9856AXZJMF1iGSMGU6449sTXFav1K9/l7s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794524563; x=1795129363;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UdI2gv0nE+PpiDHQRvxALGPPGMmK/uE84Q/kSWgFWc8=;
        b=NwMXO7hXa440ktZvMM64EU6bHDdmij5KLTeJWZjfhASjPkpR8L6Ch08PYFG+GB/qkR
         Gzu5eDNEyUN+Xh3nOJNuAVTC9J+xxtZ65bUyoC3/enXAYeSQfnGKGyU94NDG1dHdWvbW
         PQKFrvLNocLk7zCYb/i+A3V0UfLmB60bPPF+sx0Bn1jvy+QgUCusncocd2PJU2xR3dFs
         ayVP+DbGvP+0reS/KSFUXwmYAoaTmJftEHUsWwc/qnI3z0pMHnhNDUwu5zYulvoKLaXA
         zVnbiVCV84aGyS8Y50Z1tYJ5yQFmBn7A0s732BUljiJ23UTnl7qeysXDh2AFf45e3/Sb
         9/mw==
X-Forwarded-Encrypted: i=1; AL+hErG3zz04VA2Z0wR2+FkPe6AERsZXLR6nHfvnURcDQ+qHhKITkne9ZMFN+PFRMkO8uplolTFJ77eSLymETUM=@vger.kernel.org
X-Gm-Message-State: APuU4Z91JzsPb2Ne/r2n1u0y0BDoNztCrMSguQRZETm8gRZVGHZMQklo
	EZztYQNF1e4QK/mCbrqs3HS1twT8vE/kdxMAxNjwYHyaPJ3l4itq1m/wFVpwatBomRI=
X-Gm-Gg: AYBFou3SRvj+hM9nSNOGCo1vMA5xfEwAutfE0/QqM8L0YzX4D6TOguiiuy2TVDwrdF7
	8C9ir1eq5jsJ6Bn4YxTbwOuJ/hAI/XSZThr8Z8WPdbvCc7NNfceDoN4FTt4lMMOj+bZE326dpfY
	8TW/hWu6nnxjUNKZbaieDppP2WYOFxzlbYnyjIGAx6QNXZX890Rbth820sfPuGxYrLNjBMXRX3c
	7DZZeyBLERK8G6p3nhmLdmbKPgvJSa6qydbbGgKba5PCu78aYBQ4k9I72dy6KPdUysq51SnhhYV
	2pQ7yqvhFMbq9CzJIFmFdvTxP4ergT+mkH6Bbios3LZ45YNRHibwZI1aR22PX9NcOIEHuLE6VLE
	K6dmK6O8g3va6R5T3yuZrU9Lv6S1IbCs8wuQdAh1NxnFxXDAagj9wmNpAagQ1Vt0YF9KTG8mXyD
	+iy3yItfAwjXzI0fWoi8ygUVoN+c4bxCFw6dQmOSd4B7ATnN4ECpenspVOagRHXSg3J6POAlRT+
	i5URVt1+PCb2Ropgo2gO2ws+oL74ziuVynPvKBRY9mIcr429TyFBnKcRVTZ19+rX9F/WobGfMoe
	2H1NdQzp2+dUlJTefC508eXu+Kdm02lP/Y0wfhAajvGKwgo6z9Y6xQZF2++hYsB80IyGOfc4E4Z
	afCdr66mXvA60BUTSHp+djaow4wZtpekb+NwPClp2rxdL7AVPVkOvw4sXj1MwZMdGp2AUnYAhUZ
	HKqMPnj59PF88y3ZMTPPFDfiJDArZk33n9/8UOZSyO+2YR4knrskiyGfn5nA==
X-Received: by 2002:a05:600c:a596:b0:4b5:d95c:2380 with SMTP id 5b1f17b1804b1-4bb55a86fb2mr7941995e9.11.1794524563487;
        Thu, 12 Nov 2026 15:02:43 -0800 (PST)
Received: from [172.18.0.2] ([199.201.64.8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb5720f6basm816285e9.4.2026.11.12.15.02.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 15:02:42 -0800 (PST)
Date: Thu, 12 Nov 2026 15:02:23 -0800
From: Chris Down <chris@chrisdown.name>
To: Shakeel Butt <shakeel.butt@linux.dev>
Cc: Christian Brauner <brauner@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Tejun Heo <tj@kernel.org>, Jori Koolstra <jkoolstra@xs4all.nl>, Meta kernel team <kernel-team@meta.com>, linux-fsdevel@vger.kernel.org, driver-core@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] kernfs: allocate inodes and dentry outside kernfs_rwsem
In-Reply-To: <20261111215058.1837351-1-shakeel.butt@linux.dev>
References: <20261111215058.1837351-1-shakeel.butt@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Message-ID: <20261112150223.f13e8b526933f9fd@chrisdown.name>
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

Hi Shakeel,

Shakeel Butt writes:
>+	new = new_inode(sb);
>+	if (!new)
>+		return ERR_PTR(-ENOMEM);

Not a big deal, but one thing changed from v3 that the changelog doesn't
mention. Without an ilookup() first, every caller now needs the
preallocated inode even when one is already hashed. Before this patch
iget_locked() returned a hashed inode without allocating. So when
new_inode() fails, decoding a handle for a live node whose inode is
cached now fails with -ENOMEM, and a stale handle gets -ENOMEM instead of
-ESTALE. kernfs_iop_lookup() does the same for a node that already has an
inode.

 From a quick check I did with failslab limited to inode_cache and an fd
held open on a cgroup2 directory, open_by_handle_at() on its handle
succeeds without this patch and fails with ENOMEM with it.

Now, new_inode() only fails there for an OOM victim, or in a memcg whose
OOM killer is disabled or has nothing left to kill, and those tasks are
failing most other allocations too, so I don't think it's worth
complicating kernfs_get_inode_locked() for. But it is a second case
besides an inactive node where an ilookup() first changes the result.

Not a problem, just an observation, so feel free to add:

Reviewed-by: Chris Down <chris@chrisdown.name>

Thanks!

Chris
