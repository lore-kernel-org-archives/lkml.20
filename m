Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D11AD2DECD3
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 06:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791784952; cv=none; b=UJ4QrqKMlPp6KIYJ0VlkVumd4ZEbRN39KDwfW6QWh/jn5Jx5MrXEbaqENFBilOnu49T1GdZvUARZNSyoAyrXEU666Qq1rv0QBI8nbmPz73l0hDfZdazp0nVERkuPChQqAXH/4rb/xIofbKOBiE/SibCF4nYlamBmUiGYwbxZOPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791784952; c=relaxed/simple;
	bh=k+khePLNGuctSnJaatEztevhyIesIxxAE8b39j4LmQE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qnGAzsBm/ZppK+JuSwmOz3iWQYfHs/j4kJtdJbZfQ0OEZdmexgbgFD9oVTBsjv9LnCgpd90uH2n3BzVhjOM2CeRZ7lSBNxcck8SAB3yTO92JWdCEl2p0rCsYTtcgwCvq6Puox84y4TS/wUjvlIzv+20npFBz3vpVRLvA765S/EA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=VM+sQUbD; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="VM+sQUbD"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c34831355b3so1711866b.1
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 23:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1791784948; x=1792389748; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Q+eQfUnbG/s5ISP+prTeAt1XskcnCqxPh3vr+MdcxjQ=;
        b=VM+sQUbDseISULtSf3JHo0OkSCRalkm2eojdlKYEve3z0NcKdLJxB1ESDMSviAZ+nc
         2tLZuHkMsSK2pf8I+yNhC/EMdeBvFqxu3BM3ykh4ICDegMM1tQ1nQaBb632XnW1r/n39
         da5F50UFqaWEH5PAZ+U7y02QZtH6+NaXadZIknZBeZN9u3DZBg88moEoAhemL1rp14rw
         HPPx2wk57e6WZXzSM/e+hE/oJPAZXaOpm8DcG99cbqa/UVFRK4c7xzPV4b23SrJiCUny
         McmTnadrZYNWKFVXJ5n1wMnkXF8Jtv5tn98rjRKEvtbzaQAhsXxch4Y65MUos1Z4iIW6
         S2xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791784948; x=1792389748;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q+eQfUnbG/s5ISP+prTeAt1XskcnCqxPh3vr+MdcxjQ=;
        b=1RolLlCTGngyyJ29AYq1SiLdANrXuXH3NUBD2qGEtIHy37HiyF06fq581GfvQnmtZ0
         pOcvqnmbPk3uwIBYwN57QrU1M55IZRTrAQTfn8nbXPxueFsxHqzFhBAboySpt/cUTijE
         HLhOp2CNyB9CpK4MezhebIaqRkCaRIic3oFQbDYSLmlvU1HYXx40pRexfkXez7+yTDfz
         bgwqA8B7MjLHaYBXUm53afwOY1sO4B6WLOSwFwOFq2TojTUF1qbBQMri08MmM5oTKaov
         gEXr+hkIfDSjMEHrqwgr1HhY7wWb+P4r4alIFsdlZSFm6d61MOqjjIpk3T7DnV7mXBjc
         V7eQ==
X-Forwarded-Encrypted: i=1; AKwUvBw8bC0W/b9d2ZTq+1WhYagrQB6ZcZAVZsZwd97Ry/ELESWmX/EobwsHLQrdvkfXqxIeB4LeqO9m22/l6wg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIuRTTw/NZBm2qQ8POWZIh/JWJ0ozTERaMPqFBfD2N0RtC/I0du
	IKy0BPlimrpJZ2K9T2BUDB8WmitbE1LkSBXE0M/kFPl4fdZQLmhqqYR4lrFXTam2zX4=
X-Gm-Gg: AYBFou32e/hdYIudeN6bG3nZSvUCs1TcImEmmAUkdMAvrFzT9Zw4d5huj3J5Z5rjP4L
	nydCVgoYHwy//LRb+lEZQFvSHMB9ucKCVaGQnCt1LE34WlpisXx6Df4/lwgFYAQaHSuYnGUOASJ
	TXO0TPCI1gEgNTK9WWgQMTmZ3SL98wvjJVyJOe6SlbHMB5GLpoWsP3ta5U0mx9chLX73+ub2BMN
	rQbOWb8HGwtnLDzlg9NbzaMBRy9fRtDaq5t1euLCvRO/tZPEu6PjHWkzcfWOKKyIm8Czk7WCGIS
	LDaUVXklnIOXGW3rXjrTOhRROjVAnCfB1yd2x9z7YKs9aTnV+jbflxxG4ENfN7+5CXcWslDSVGe
	eEsqW5CtKv5cvYLrKh1KfhpusjhUwKCVvV4gJ3y9l2V848DYczaWPa68hPLQ/u2ZhfxsFUZxUww
	YaFXtzSUCEsysKH5eukaKh7kkLioH6TwXWX1MPVOXMqmNckFv9rHTT+CFiNaSyiyoSW+WP
X-Received: by 2002:a17:907:9720:b0:c2e:e3c:ddf3 with SMTP id a640c23a62f3a-c31a9a2d73dmr991629866b.1.1791784948048;
        Sun, 11 Oct 2026 23:02:28 -0700 (PDT)
Received: from localhost ([202.127.77.110])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38b9639bsm14290393a91.4.2026.10.11.23.02.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 23:02:27 -0700 (PDT)
Date: Mon, 12 Oct 2026 14:02:24 +0800
From: Heming Zhao <heming.zhao@suse.com>
To: Cen Zhang <zzzccc427@gmail.com>
Cc: mark@fasheh.com, jlbec@evilplan.org, joseph.qi@linux.alibaba.com, 
	akpm@linux-foundation.org, kmehltretter@gmail.com, ericterminal@gmail.com, kees@kernel.org, 
	sunil.mushran@oracle.com, christophe.jaillet@wanadoo.fr, ocfs2-devel@lists.linux.dev, 
	linux-kernel@vger.kernel.org, baijiaju1990@gmail.com, jjzuming@gmail.com
Subject: Re: [PATCH] ocfs2: Pin the node manager module for open debugfs files
Message-ID: <asx3pAlqeVkKNRfB@p15>
References: <pm-ocfs2-objects-candidate-0089-v2-4c67f48d4e2d0fc85990@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <pm-ocfs2-objects-candidate-0089-v2-4c67f48d4e2d0fc85990@gmail.com>

On Mon, Oct 12, 2026 at 09:31:38AM +0800, Cen Zhang wrote:
> The node manager debugfs file operation tables do not set owner.
> The debugfs full proxy obtains real_fops with fops_get() at open and
> keeps it until final release. Without an owner, this does not acquire
> a module reference. Normal unload can free the ocfs2_nodemanager
> module image while an open file still holds its operation table.
> 
> Closing connected_nodes then makes full_proxy_release() read
> real_fops->release from freed module memory. Removing the debugfs
> entries during module exit does not drain retained open files.
> 
> Set owner to THIS_MODULE in the o2net and heartbeat debugfs operation
> tables. The existing debugfs get/put pair then keeps the module and
> its callbacks alive until the last open file is released.
> 
> A controlled test used an unloadable OCFS2 module and case-local probe
> filters without changing the candidate open, unload or release logic.
> Closing a retained connected_nodes file after normal unload produced:
> 
>   BUG: unable to handle page fault for address: fffffbfff804cfef
>   Oops: Oops: 0000 [#1] SMP KASAN NOPTI
>   RIP: 0010:full_proxy_release+0xbf/0x190
>   Call Trace:
>    <TASK>
>    __fput+0x39a/0xa60
>    fput_close_sync+0xff/0x200
>    __x64_sys_close+0x8c/0xf0
>    do_syscall_64+0x114/0x620
>    entry_SYSCALL_64_after_hwframe+0x77/0x7f
>    </TASK>
>   Modules linked in: [last unloaded: ocfs2_nodemanager]
> 
> Fixes: 2309e9e040fe ("ocfs2/net: Add debug interface to o2net")
> Fixes: 87d3d3f3931f ("ocfs2/hb: Expose the list of heartbeating nodes via debugfs")
> Fixes: 3ba169ccec1c ("ocfs2/cluster: Add new function o2net_fill_node_map()")
> Assisted-by: LLM
> Signed-off-by: Cen Zhang <zzzccc427@gmail.com>


Thanks for spotting this. I applied the same test to 
/sys/kernel/debug/ocfs2/<id>/fs_state and confirmed the same issue.
It looks like all debugfs ops in ocfs2 are missing .owner.
Would you have time to check and fix them?

Thanks,
Heming
> ---
> diff --git a/fs/ocfs2/cluster/heartbeat.c b/fs/ocfs2/cluster/heartbeat.c
> index 8e6ead433228..1d4f71190d27 100644
> --- a/fs/ocfs2/cluster/heartbeat.c
> +++ b/fs/ocfs2/cluster/heartbeat.c
> @@ -1447,6 +1447,7 @@ static ssize_t o2hb_debug_read(struct file *file, char __user *buf,
>  #endif  /* CONFIG_DEBUG_FS */
>  
>  static const struct file_operations o2hb_debug_fops = {
> +	.owner = THIS_MODULE,
>  	.open =		o2hb_debug_open,
>  	.release =	o2hb_debug_release,
>  	.read =		o2hb_debug_read,
> diff --git a/fs/ocfs2/cluster/netdebug.c b/fs/ocfs2/cluster/netdebug.c
> index f7ab66e70799..5d373002297d 100644
> --- a/fs/ocfs2/cluster/netdebug.c
> +++ b/fs/ocfs2/cluster/netdebug.c
> @@ -183,6 +183,7 @@ static int nst_fop_release(struct inode *inode, struct file *file)
>  }
>  
>  static const struct file_operations nst_seq_fops = {
> +	.owner = THIS_MODULE,
>  	.open = nst_fop_open,
>  	.read = seq_read,
>  	.llseek = seq_lseek,
> @@ -415,6 +416,7 @@ static int stats_fop_open(struct inode *inode, struct file *file)
>  }
>  
>  static const struct file_operations stats_seq_fops = {
> +	.owner = THIS_MODULE,
>  	.open = stats_fop_open,
>  	.read = seq_read,
>  	.llseek = seq_lseek,
> @@ -427,6 +429,7 @@ static int sc_fop_open(struct inode *inode, struct file *file)
>  }
>  
>  static const struct file_operations sc_seq_fops = {
> +	.owner = THIS_MODULE,
>  	.open = sc_fop_open,
>  	.read = seq_read,
>  	.llseek = seq_lseek,
> @@ -476,6 +479,7 @@ static ssize_t o2net_debug_read(struct file *file, char __user *buf,
>  }
>  
>  static const struct file_operations nodes_fops = {
> +	.owner		= THIS_MODULE,
>  	.open		= nodes_fop_open,
>  	.release	= o2net_debug_release,
>  	.read		= o2net_debug_read,
