Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793775821;
	b=tY3NMU24dRJsOZ41ENHUHrcrmXxerviv3FqgQaF+vPT9qs50U2Z5l815l7XXVPBB9kKj
	 Wdx1q0KRVXkrza6PyO1P9la4xWDjc/Nkcihmt74NGRElWphHJqI017/GgFcjvWm2MF1wv
	 N5hz2Nneh71pPjd9EewDg7rU1MVwzkA4f+FKvpsIZ8sEfPEdXvjaXhHnf4A7oUeRfeH8n
	 AzA775v+NdO57gisVbi2g3pdqbCM8wLSmnuJ0Ok5JO0Srb7v+QW7TsAFCNpX0HdMjo1au
	 f3IKakrt+yv1gB90rpF++RwGGmtE2TmQZYj/tJpUCYARsnBXO3bDBc/IUAVThiVExxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793775821;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=4imAbvQXvAeBLakV5a+RUTt3Rkpj4AuuW2uTNPIVScE=;
	b=y+hNJP7HNl1HlXD+iR6lIoNdKUkWZcMDpxF4Zg2EwNspB5xUaG0YoTdi3gKpJb19CwB1
	 X0G/XFnThg3QjMp3Gzyne4cWzA62ZdbfQ0xEI4ZNscCHhDSd8MgbV5zCf30iCGVLAxyQ9
	 XU8xjmzesPS+5NJEZr3M9XuNJa6un4m8HW6SdCAtNWBGR0zXftLciammYlaD1vdsxBRwa
	 AwuyPVXYdGPfNoed0ffiUNe2MyNpipCGnX1JNSNXryqvqizCL4GokBugjGkJLeTaXfHO1
	 MO0QQRu0PFaBvdC5Ww2bngJqQQK8ZaXtI+6LhHesa46IHn4/6SxCvaXhEK8Lm5XpR+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SX245LRS;
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87471606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 07:03:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87471606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SX245LRS
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2e8b20a899fso2070075ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 23:03:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793775821; x=1794380621; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4imAbvQXvAeBLakV5a+RUTt3Rkpj4AuuW2uTNPIVScE=;
        b=SX245LRS8cR+WKzkfkww1WcpaMU0iICbIxAkh7WTy3OFKNQ8l0Z9Xb0Jw+4h3bKP3Y
         1jBZ5OooApcAwnuENTSSVg9NPTmRLliNW4BjxjlefpSrbKngZwC9ScCSzVtk7NxhD47T
         UFSnL+7nYk0EhnXQcmoErlb5qONMJo0C8QilReTT4G+fQ9apS8PuIZQIon5akLRnu3qf
         fASJ6TYRUfRpu6jr2dBPQgZcc1xiMUUsdSBTGPPI9sUsPdMV7AzmRU5heoLwzEHZZa0Y
         hHAKkmQAdIFJIwjTYEsF7mwu+2N28KV7+LWGtcVotOprf/gV4csZGTksZjJCGErc2RYZ
         NxvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793775821; x=1794380621;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4imAbvQXvAeBLakV5a+RUTt3Rkpj4AuuW2uTNPIVScE=;
        b=qDG0n4GBS3OM5HM2WVMMwZTpalXQZQuR6+XwkfqS4xaxrd+EGhspxKGKoIFZvowAhC
         AGSg9zhXEi8Q34RF79f4bBs55Ajedo5F43UxIOXBZyiPayV+6Lkep5cDutSovTEKwfx+
         FOadShW8+tuaMzbpcHYbmYK09FO5jvdHhLjkmdr8BuWZLh2kG4r1FQrZwAJsiWfYqXbB
         yTlefq+sH75yKEbTCYait2yJGua+XmKzy88tPdqcE9oYPpt0LNJcYO83ytVf/mOXOdiY
         0q88DeeQ+LoxQH2ThmR604J3KYtNce5wttLJ1oaHEMmVAYPsrIsdTWmGfbWsppVCKfwo
         /Raw==
X-Forwarded-Encrypted: i=1; AKwUvBwsKYlyVDRX31qrBwg6UwKi8G2ktSaAZe5BM00QGvMVP/qAhBGXC3SsxaXsN2NJc/dvYuZ01ecF6r3zKPY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9r1GYfAvErFcFP0PAmmDuYSWBlkWq2x/EZBj4CzcfSBNy4QXwH
	mcIfGds54U2LUi1HakIeJ0S7AFmViov/wB8vj/U+DSBWyVJrXxwNiCKqILlLUXHs
X-Gm-Gg: AYBFou296CVSOS23Rg8t4ZAu5G0lU65KEUuVQxkh3rO1qmzUwPQZPM25wbMB766wea0
	c3R5nxYyzcP7DHSU/AwdvV6gxfqf/R8zjiShuN8kTEcmGo11zMcThSu7whiNeK1ithtbZQhLMit
	mxObhEEI4GVUkf/qsys4sGeVgY6iirlL1TsTwKtKvkrLk2ixNqfcE4BIsHaX8XPOhxSlB5ZkpzP
	gIH5JCzxHScHYgYEYa2GhcVYvXimCcUhGMRzsy34aG5NpJPTsZsApdVDWLl0kheOEvlK74lrl9K
	algx+lioYJSwVapN6cpP9M88aVbqZ35FqBp6A35ANueE2OmlX45h98NdpGjII0LATDeBEmRaudN
	ECXBhnLhO5C5qLQ7HFc8L73P7i/0M3leUvzAWUxRnwhoAxkxMqxQO4I/oyap9mSXkaKhA1C+Jyr
	bA9WxEgo0z7huoNHjJRLzeYBJcDg8fXEVgI2Tj2DQVn+X6mwb+zw8CmegUZDpKk5SVPkYFVDpME
	g4B7KTHf/MFS3c4nwnSQk/KUpdB0KTn0RgEZsuLY+gEDjn2ykWemZYbNHZZgIrzny+ziECt/19o
	Vzh9UHkcbxozx46PrOo=
X-Received: by 2002:a17:903:245:b0:2eb:a1b:e9e5 with SMTP id d9443c01a7336-2eb364e7bfdmr143230035ad.52.1793775820592;
        Tue, 03 Nov 2026 23:03:40 -0800 (PST)
Received: from localhost ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed090f7313sm3461615ad.45.2026.11.03.23.03.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 23:03:39 -0800 (PST)
Date: Wed, 4 Nov 2026 16:03:37 +0900
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Baolin Liu <liubaolin12138@163.com>
Cc: linkinjeon@kernel.org, ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org, Baolin Liu <liubaolin@kylinos.cn>
Subject: Re: [PATCH v2 0/5] ntfs: support O_TMPFILE
Message-ID: <aurYye6hdEnXqZAa@hyunchul-PC02>
References: <20261031052857.1542936-1-liubaolin12138@163.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261031052857.1542936-1-liubaolin12138@163.com>

This series look good to me.

Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>

On Sat, Oct 31, 2026 at 01:28:52PM +0800, Baolin Liu wrote:
> From: Baolin Liu <liubaolin@kylinos.cn>
> 
> This series adds O_TMPFILE support to fs/ntfs. Applications can prepare a
> regular file's contents and metadata before publishing it with linkat().
> Unpublished files are reclaimed when their last reference is released.
> O_EXCL prevents publication.
> 
> The series keeps the same five changes and ordering as v1:
> 
>   1. Initialize inherited ACLs after allocating the new MFT record.
>      Anonymous creation needs its inherited ACL stored before returning.
>   2. Preserve prepared atime and mtime when publishing the inode through
>      the hard-link path.
>   3. Initialize the new FILE_NAME's packed EA size, since a temporary
>      file may already have EAs when it is published.
>   4. Complete unlinked-file attribute writes before dropping the cache,
>      including nonresident EAs prepared before publication.
>   5. Add O_TMPFILE creation and publication support.
> 
> As requested in review, patch 2 gives the new FILE_NAME and directory
> index entry the same ctime as the inode. The inode ctime is updated only
> after the link succeeds. Patch 1 also initializes a newly created
> FILE_NAME's ctime after inherited ACL setup, fixing a timestamp mismatch
> caused by moving ACL initialization later in v1.
> 
> While implementing and testing O_TMPFILE, we also found pre-existing
> NTFS bugs in attribute rollback and ACL lookup. These include stale
> attribute inodes left cached after failed creation, which can cause
> subsequent creation to return EIO even after space is freed, incorrect
> ACL inheritance when the default ACL is not cached, and a fixed-size
> read buffer that cannot handle larger ACL values. The underlying bugs
> predate this series.
> 
> To keep this series focused on O_TMPFILE support and the v1 review
> feedback, we are leaving these existing bugs to a separate bug-fix
> series. We plan to submit those fixes after this series is accepted and
> merged. These issues remain present with this series applied.
> 
> Tested this five-patch series in QEMU with four CPUs, NTFS debug and
> lockdep enabled. The requested unchanged xfstests generic/004 and
> generic/389 passed. Tests covered creation, publication, last-reference
> cleanup, O_EXCL, normal idmapped ownership, named streams, nonresident
> EAs, direct I/O, mmap, allocation and concurrent publication. Published
> data and metadata were checked after cache eviction, remount and reboot.
> Offline inspection compared hard-link ctime in STANDARD_INFORMATION,
> the new FILE_NAME and the directory index.
> 
> Changes in v2:
> - Update FILE_NAME and index ctime as requested in review.
> - Set the source inode ctime only after successful hard-link creation.
> - Initialize creation FILE_NAME ctime after inherited ACL setup.
> - Run generic/004 and generic/389 on the standalone five-patch series.
> - Rebase onto ntfs-next commit
>   564c7753647731d19170914c1c637d3b33d88d3b, including the const mnt_idmap
>   tmpfile callback signature and documentation context.
> - Resolve patch 1 against the updated early ACL error handling in
>   __ntfs_create(); the relocated ACL failure still uses MFT/EA rollback.
> - Keep the original five-patch scope; submit fixes for the pre-existing
>   attribute rollback and ACL lookup bugs separately after this series
>   is merged.
> - No functional changes to patches 3 and 4.
> 
> Thanks,
> Baolin
> 
> Baolin Liu (2):
>   ntfs: initialize inherited ACLs after allocating the MFT record
>   ntfs: support O_TMPFILE
> 
> Xuewen Wang (3):
>   ntfs: preserve timestamps when creating hard links
>   ntfs: initialize packed EA size when creating hard links
>   ntfs: write unlinked file attributes before dropping their cache
> 
>  Documentation/filesystems/ntfs.rst |  15 ++++
>  fs/ntfs/inode.c                    |   8 ++
>  fs/ntfs/namei.c                    | 140 +++++++++++++++++++++++------
>  3 files changed, 136 insertions(+), 27 deletions(-)
> 
> 
> base-commit: 564c7753647731d19170914c1c637d3b33d88d3b
> 
> 

-- 
Thanks,
Hyunchul
