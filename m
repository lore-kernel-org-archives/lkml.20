Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1301363094
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 09:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787821910; cv=none; b=cDC8sk3KDtMR+i+A1zgEmxdvRVtMGkzmY427fTirecOiRHgLURE/9ZPidXG8qb71nP6W7w2S4UrFO/DJn47Ut8Jt4mIn/daxk/U4iiOIdJsXm4PugVV9kZJxPUJjRQ7Vpl/NJ5wrpuny6hecH//N5wHEA+Fsowwnpn9JJm0x96o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787821910; c=relaxed/simple;
	bh=UShlGlM7yf15Wa0oAMuYJOAACgtpp+GFjTVEVwTvaso=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ni6SlplglwSmul6pgjPdxPwTJn9hcn8jIhWMJ95GeZPhJrerl+7KRvjQLvd1XD7n6euSL9pI7gRR+J1SKBuNawdtJYEBh/ZBGEPOSA3i5gWOgcZOWQwWwROtZ1OdaWyOL6AYBh2i711AJ5lOldQj9TUjqlQoT57XSD4hL4loWM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V4eMOnbC; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V4eMOnbC"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-39675172593so1711843a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 02:11:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787821908; x=1788426708; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mg/h6fTjci5ec1PS11v10182m44lAJ1lV6itb9+QYfo=;
        b=V4eMOnbCCjJ08Sh6/9EkgRR+08DyJsdAFIxRHeAPlgD4ihpq+SvLS+vhtmgntLOKgy
         O3lUzV0iDrD5u4lVY2zEXmPQWB/UE5PColicHQfxLXXcnpIwwtpff4+ILNqNYrLrbaw+
         9DracsoAzHAmA6Z/+iHHlgJIcicodl91+txeXTU1uPIE0h2TrS+V+MII0jbVebjON7nm
         jaWlMNGGZ+PGGmtU2tRjcmO5P/2+ePvYE77ivsFtLfZD2MrgKymPQK2kdzQZsqJD9WRX
         ICINdbfWdOPnL01iT2j9rHddc39xOa4jl4IVt8Lla/YSMcaXc/2kejDxM9o39t6kCFh6
         zYeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787821908; x=1788426708;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mg/h6fTjci5ec1PS11v10182m44lAJ1lV6itb9+QYfo=;
        b=nL/V2KeW5NkJdw+7zZk2hS4RjhUkCw9a5BPnAaPugiNMpwa5/S9yWYGF5lh/0liS5G
         XSNF4uqNp0FLc1iNHf5X8pZpkgkHixrDDYuCgAulzG7Rv8M6rJ1B3n/W9m+rbv4K7Y2x
         fXnB/5r/u30UBhiX4VEm5jUXSoW9gaZE7nZQkhvGsPAFY4oF+QNO5kpmS+6UWvjGlhSo
         w4yFPSh8phLiFrrO3vH0u62i5VcSdhsmE171W0zWVnhtTBoX+UyvCeBQp2bLP1tK6oRC
         dAm7xiHxKGCi0ijfDf/XehNE5/VV/43511DjLr7ZOgEr9iLFVYqVJ1x/H2W+EjyFYE5E
         tiYg==
X-Forwarded-Encrypted: i=1; AHgh+Rp7mt+sBoqD2k5ZcVWYqcTSeHxsV+A9v7UTJIEdSJyIg5c5myiJaeR1aKRirUip0HjM0nDCuwu+nhPqkx4=@vger.kernel.org
X-Gm-Message-State: AFuF++m3zLQmg8aFg9lhzbspezi71a/WzBy9k9d/sKGRkMu1/xYtlYWS
	AcKW5N5C0hd1lTUWyhtzyZKy5ZWkkqYt/2dBk39f3nD72G/HxIgLKIpb29BfWmJv08Y=
X-Gm-Gg: AR+sD131AjO1tfRnYCBVB/nReL/W1gIHowY0JkGoAlVnV0lURPk1NNbGrYvsaTF7Hjs
	Shnoy/kefeSfR0CezJqu+G1W/HEeqOqJUe51AghIxmR3dDtR+tMofAbH5Sw35yd7hsiskyxYg42
	tVxPJSyHibDQXxeyqRRqrGcTcuHxP0ZQGeHB39/SbIQQx7PsmTRjWVDtEVHVZ78AVmWCYtuYT40
	BkG2e6rMh4MiKnab7GD5NKOhhPB1+lI3XvdYtJg/qp5yb4JDLhYocK1RvdTp+OUBCzay38gjaL4
	d7pU434JThR2QICPCT48z4tFFA2pkhu/AAL/qhHKWbk5H4EM9xp+Kx5tnAA1JVGA3ku9jH46zI5
	5ZujbOGCDn+13JQHq/7k77l7IijHNXd+FJ+bHDJdnzPSCsR1baTA8ZRCP7Vy02cy3NdlU1DX6Xq
	keisJafQmuwgGxhE2FaXzjZe1cjzT2+88B17T6Kv3u/UxZQMHH7Dcsi9YZOoqeC8WF3GJ7
X-Received: by 2002:a17:90b:4c8e:b0:396:65dd:4093 with SMTP id 98e67ed59e1d1-3966d44daf1mr22284412a91.14.1787821908265;
        Thu, 27 Aug 2026 02:11:48 -0700 (PDT)
Received: from [192.168.55.196] ([218.49.81.87])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396b1992e05sm1959634a91.15.2026.08.27.02.11.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Aug 2026 02:11:47 -0700 (PDT)
Message-ID: <f85c60a0-81d7-41a4-9926-f69cf10222d0@gmail.com>
Date: Thu, 27 Aug 2026 18:11:45 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] srcu: false-positive WARN in cleanup_srcu_struct() after
 78a38cbf6f20
To: Zqiang <qiang.zhang@linux.dev>, rcu@vger.kernel.org
Cc: paulmck@kernel.org, linux-kernel@vger.kernel.org,
 syzbot+d4faf7db59e11f6fd1ab@syzkaller.appspotmail.com
References: <20260824105625.3725157-1-shpark061104@gmail.com>
 <494f3e0cdb3692bf13690f4cddd3b40098b51627@linux.dev>
 <24c0edd6-3cdc-4536-ac78-394bf785aad4@gmail.com>
 <0e74e6799bf042293fd1e34e2f242c56786c3de4@linux.dev>
 <9e216978-d884-4d56-b39f-d134f78a4999@gmail.com>
 <eb2132ad05cd3804a8f2a170de441d79afa793e9@linux.dev>
Content-Language: en-US
From: Sunho Park <shpark061104@gmail.com>
In-Reply-To: <eb2132ad05cd3804a8f2a170de441d79afa793e9@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 8/27/26 08:53, Zqiang wrote:
> Based on your description below, the 5.srcu_barrier() did not intercept the callback of 4.call_srcu(),
> this means that 4.call_srcu() and 5.srcu_barrier() concurrent calls, or calls after 5.srcu_barrier().
> 
> The combination of srcu_barrier() and cleanup_srcu_struct() typically occurs on the module exit path.
> srcu_barrier() ensures that all previously inserted callbacks complete，so therefore, theoretically,
> there shouldn't be any callbacks left to execute after we finish executing srcu_barrier().
> and of course, there are also shouldn't be any ongoing or newly started SRCU grace period and the
> WARN_ON() in cleanup_srcu_struct() is designed to detect it.
> 
> If when the cleanup_srcu_struct() detects an incomplete SRCU grace period or any srcu callbacks
> that have not yet been executed, this is a risk that needs to be reported, even if the
> cleanup_srcu_struct() can intercept it internally.
>   
> Therefore, we should investigate this issue to ensure that 5.srcu_barrier() can intercept the step 4 callback.
> 
> Thanks
> Zqiang

Before 5. srcu_barrier() call, the 4. call_srcu() is finished and the 
callback was enqueued, and srcu_barrier() did intercept it by appending 
barrier cb after it. They can't be called concurrently because when 
call_srcu() is called inside kvm_io_bus_register_dev(), the kvm 
reference count is nonzero and kvm_destroy_vm() which calls 
srcu_barrier() could not be started.

In my debugging, all five __free_bus() callbacks enqueued by 
kvm_io_bus_register_dev() were invoked before the barrier cb, and only 
then the barrier cb is called and srcu_barrier() returns. So all the 
real callbacks were executed and practically there were no callbacks 
left to execute when srcu_barrier() returns, but a stale n_cbs > 0 is 
left because srcu_invoke_callbacks()'s invoking loop has not finished.

KVM logic correctly called srcu_barrier() and cleanup_srcu_struct() 
without calling call_srcu() in between. In my opinion, the root causes 
are as follows:

1) for timer_delete_sync(): the srcu_gp_end() which ended the last grace 
period (from 4. ) arms sdp->delay_work to expire at jiffies + 1 even 
though the invoke work (queued in 3. ) is already queued, and 
cleanup_srcu_struct() runs before that one-jiffy timer expires, so 
timer_delete_sync() cancels that pending timer and returns true.

2) for n_cbs: srcu_invoke_callbacks() calls rcu_segcblist_add_len(-len) 
only at the end of the work item, after the barrier callback has been 
invoked and srcu_barrier() has already returned, so 
cleanup_srcu_struct() observes a stale n_cbs > 0 while the cblist is 
physically empty.

Thanks
Sunho Park
