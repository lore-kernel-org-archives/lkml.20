Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794686762;
	b=3Oxlfs3LvkTjORvWQ/0a7LFllHUo6OsAQGiRC3y0JdmqFDso5kHCu6m0m31mMDwoWYxx
	 8dEroE7ZUO3U9Xo/iLG/tNU80BDa+dXzYdL8Lj5cOEDammocSUZJVOlIhBo7DCoVfpkOO
	 LTLgyJqoMllW2sq8TIJVlZeyWG1/yXGGUxoLA2j2ED7sXliomzbUoBMwkMrCZIpkQLD8f
	 BraZJGBaGUbe8U5jUWjMLt1jSPA89eLeJ6vyeTwFLtWZBVzg0eW5MIX8IjL3hplpBY6VH
	 fET1RSQajOpdzox6L6zBOHrwPTL6NdqcsdE9SwTbzjMmSTqFMiAY+dAEPbWGZGlJ4rw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794686762;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Disposition:Message-ID:User-Agent;
	bh=L9fh6nGpkdQ3PKE1Pv6VuACg3WWhS00/MicQv00SggM=;
	b=RQkrhcX4KU8Do2o3/HwLyj/AXyZtipHteR9mwhwmfweGarucKRldIX6C2hcKk3THst76
	 ZP8ZYyumaTPD3CDqRsY9yei/dRfOpIj+I0exWH8MQTtij9zni2DFHjI0a0DpagqpCbpPS
	 UTbZeejwVC2kTEDQudObTM7FPo+xeomap/me+vfqBUn2QF/fhThCEUf+u+gGtkzeDoDWg
	 y+aaOd9p8lwnEoE9yIdNqjNK1ouZHCc+vYtelBQ0p7SPuUDflz2MslLT6DlVq8u1f1eqT
	 Mnayaub0e+4z/A7GwbgRbbpBc9lft3+UwXIcX15t/rmpu+IFdmlPQylxINyzTPUpy1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=WyNKKpAN;
	arc=none smtp.remote-ip=209.85.215.170
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B55C606A889
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 20:06:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B55C606A889
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=WyNKKpAN
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cddc597d062so1621217a12.3
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 12:06:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794686761; x=1795291561; darn=vger.kernel.org;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=L9fh6nGpkdQ3PKE1Pv6VuACg3WWhS00/MicQv00SggM=;
        b=WyNKKpANsG5sdrHWGAt+Y38DvSIGt+WnCUyNYCZoBM4YbSq3wCVAHI95jQ8BFTGgLn
         +vM7af/q0i5zrzjZXXnriwzXN4L/RbeBg/iztvO0eyeIXYNiQp/OYlS5LD9yZqr2gKgm
         1I+5A88e/cV4J0nLZfgp0f7sQwj9jY0Q4quBE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794686761; x=1795291561;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L9fh6nGpkdQ3PKE1Pv6VuACg3WWhS00/MicQv00SggM=;
        b=13W8EAmkAwmcpzwIlJRBN0FTPAWVTDprd9CVOT567husNHgQvRVLcxnzx7N1ohIUQs
         kSD4lLEl1DNw0OluOb+XUF1tsSvKJxprgUGmB+1IPIia9kQ7ol10X6dJ/+tgfMdJyfKX
         3eU3ZgXRVzve5b6GOcb2OnONBVy81XQZbprU/hnXwQU8A4gDcdHEq52A2dBzViGqZUEl
         f6ufS0NKmEBC6L03bF2pcJ9ITJHnZliQjF/VHjk5DXZmdu3Ux0wwMQAqO5JX8JRIlGYi
         m9qbVTGLQZdfLrNMoZZ4kg880y4M3loPn0mlLtq40vzAIcyqSehZTAh8/F5g1iH5/fQV
         y7fQ==
X-Forwarded-Encrypted: i=1; AL+hErGf53nHdbzD9zItCRsLEqRw91UIGUlCHmlAEQ9VdK/atKjlQ20c4MzxFxpf1vgmXFnvv3aGOSVw9yTsU+A=@vger.kernel.org
X-Gm-Message-State: APuU4Z8bAXj+4gHCzlMdJZSKCusmda2W9H7sYtL2TILauyOSUE8eXz1d
	ddmgGqMOWW4lfGIy7cdDctN8gGy858I1kUc84Hds0nj2a/M6jsUxGJT1TXn0G0XJcyM=
X-Gm-Gg: AYBFou3Mp6rFSRQ2PGW/iO6kELLnLbhlBmgpHxv0+Xsopgb3ducxpNThIYKJTAsiI2T
	5NTe3O9BvtJz70rSpf5NQ7gbSA2x1THA5EEOaEH7x4e9hwtltSyIRGGk/EPbjGMdPHHOjQFWQGa
	+J1o5yzWE5gzKHuV9OiamR18FhKWnEwpRzCuJuodJmLZCouvhpWwxITNPc2XJ0rWqX7uNKqhob5
	1iS8aU0eQIXaQO5u5y4hRUnxxlDNMghk2HwY0uWJEv/i0SHbZG5kovzCagFR9ubPO7M/n7Uu2CR
	al/2Xwvad0SkpV4/C1iaSUOlBgEJtDNgFwn19YHV8Ur4iGfXu+WNCv4zhAK9fvMNy+gEsJLoHiY
	ZfDOuOcF+nss+NX/7Bn6qxd+h+LOyecDBamYMQY8yTqkPno5lY6E3P2JBkPfpjTHKIy5MqIU3TM
	ETlQZySqhZTP649wIM75qV1lkwNPt7fMXW8uo9UUBS9xvlvNw2b8NXgr0w/1y7EHCBPXcJEZwLe
	O0FWV4Al8jKtR2GoEWWxa//Wy2FUUuoLoIBT77OkLbLVM9pZoVY4t8SxY4XD6nhwr+iVz0OcKdc
	9tDIuA2UH0MiL73QFWKBCPpQPh0j6zDDi5gzqTKNpEqnjG29UHQ5Yy7MQ+GcUB25CNCCbe4vqOs
	JtSI1KvWu2hhJtmDixR8jrsI8al73wdEtPs1xvcVZnj9+7R7+lX1zib+2SQMBnp+AWdxTK2uK+4
	ToTIakMe1p8fIcMsw9L3yQBjkD+W1vZDQ4fcgeceRX8yLYEPMrQXQSlXyr
X-Received: by 2002:a17:90b:2584:b0:3ac:9f00:3bc7 with SMTP id 98e67ed59e1d1-3b1b0ba61famr5629200a91.33.1794686761104;
        Sat, 14 Nov 2026 12:06:01 -0800 (PST)
Received: from [172.22.0.2] ([64.16.22.130])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b1e9ef15sm5258887a91.0.2026.11.14.12.05.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 12:06:00 -0800 (PST)
Date: Sat, 14 Nov 2026 12:05:57 -0800
From: Chris Down <chris@chrisdown.name>
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, Jann Horn <jannh@google.com>,
	Chris Mason <mason@kernel.org>, Josef Bacik <josef@toxicpanda.com>,
	Christoph Hellwig <hch@lst.de>, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org,
	Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>,
	linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
	driver-core@lists.linux.dev, linux-mm@kvack.org, bpf@vger.kernel.org,
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org,
	apparmor@lists.ubuntu.com, linux-nfs@vger.kernel.org, netdev@vger.kernel.org,
	fuse-devel@lists.linux.dev, linux-efi@vger.kernel.org,
	xen-devel@lists.xenproject.org, ocfs2-devel@lists.linux.dev,
	linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-usb@vger.kernel.org, Amir Goldstein <amir73il@gmail.com>,
	linux-erofs@lists.ozlabs.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH RFC v2 33/42] fs: add file_check_backing()
In-Reply-To: <20261114-work-loop-pseudo-v2-33-98639a2286fb@kernel.org>
References: <20261114-work-loop-pseudo-v2-0-98639a2286fb@kernel.org>
	<20261114-work-loop-pseudo-v2-33-98639a2286fb@kernel.org>
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
Message-ID: <20261114120557.4bc1eb6e57218cdc@chrisdown.name>
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

Hi Christian,

Christian Brauner writes:
>+	/* Look through stacking filesystems at the inode with the data. */
>+	if (d_real_inode(file->f_path.dentry)->i_sb->s_iflags & SB_I_PSEUDO)
>+		return -EINVAL;

This looks good in general, but what the bots said about O_PATH files
here is real. With FMODE_PATH this is reached for a file that was never
opened, so on overlayfs nothing has been through ovl_open() to look up
the lowerdata of a metacopy file yet. ovl_d_real() then does the lookup
itself, and when that fails it hits the WARN(1) at its end and returns
the overlayfs dentry, so the check passes as well.

Only fuse passes FMODE_PATH, so it takes CAP_SYS_ADMIN to get there, but
it's easy to trigger with that. From a quick test with a metacopy file
whose redirect into a data-only layer points at nothing, registering an
O_PATH fd of it with FUSE_DEV_IOC_BACKING_OPEN gives

     ovl_d_real(/f, 0): real dentry not found
     WARNING: fs/overlayfs/super.c:79 at ovl_d_real+0xc9/0x210
     [...]
      file_check_backing+0x308/0x5e0
      fuse_backing_new+0x219/0x4a0
      fuse_backing_open+0xe8/0x390
      fuse_dev_ioctl+0x53a/0x7d0

and the ioctl still succeeds. A normal open of that file fails with
ENOENT, so nothing could have used it as a backing file anyway, but with
panic_on_warn this is now a panic.

Maybe ovl_d_real() should just stop warning when the lookup fails, now
that it has a caller that isn't trace_uprobe? The check would still pass
for an O_PATH file whose lowerdata couldn't be looked up at that point,
though.

Thanks!

Chris
