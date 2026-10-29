Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.245
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793266317;
	b=SXEQaPGu5mqJRjEF+ik7xeu6rrzFlyE4irlMP54GIvUyVrShG6qAt8T3rvtYEeVRNHpV
	 zXxABLnoUtnDfInBXCBttPFCoiwg5MVHFHMYDz/6bTlzTB5tpzXo51/2H4a7yWMygcu9B
	 SikizTeXW4UZLJZB6SJrqKO1+i4X7XnQNkafJ78uymxizZXHXS2eCxWUP6MvgppZikHu/
	 pErEj4S6alukqZqSVbjSe8IieqUjcxbID3oJy0ZoVFYGNttyQT3nPxKX+B3Z9pPbABILI
	 xykdi0/sImAPuklf6jnDXfR4GRAVOC11njmWUyjuegybJ13h4V+IC3Zz0tI40SgFLHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793266317;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=okptCD3UTwIXdaRJonCEkQqFEfGDTbXbfiDDvu4kuWg=;
	b=b4VzXP08bjema05dqC8Er47DD/B0A/cMSadXXfQ5QqEnEAxD/O2gNPX2oTWRLQ9IVuK2
	 8EjBJpT24C00qXoq3IxrRjrvqwXDU7R8glZuOl+PZQONLp4tbRcVDpUbNjxaZKDrEY2Vu
	 AGvADrIDTc58XllZYQXo3QtLkYUJLn7BNTzEjKhDB6V7ExJiptMpNumCz9fvetNsFnWil
	 kw7WcRDUTzR2KztC/TJHtWlXTON10kZhSGLXY9GtpEsLV6NqlgK4w23OGkqw2jLmmLSgT
	 i1uw6U2l1Q3OX5an9de4YXkzk0oha8M+7SkXrWQkuhu7arMhwp3hR4uTKDuIoe3kHoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="pN1/33dJ";
	arc=none smtp.remote-ip=91.218.175.245
Received: from mta0.migadu.com (out-245.mta0.migadu.com [91.218.175.245])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED6DB606A326
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 09:31:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED6DB606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=pN1/33dJ
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=RV02fKHXp15N1sora8/JC7gfty5QHQabj6vGISh62x8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793266315; v=1; x=1793871115;
 b=pN1/33dJVwRqFONKhLklqHMutpUamuhZu2AZye1lIQaTJs8hbPF6bTcf+cXJU55EZ7qfRbEN
 VqLnxOcNfSnhjKZfdIqtIYcR6Mu/HJrSU/0xS3cnfMzfLhPjO4jcmpN8tgFxuhUzDAuWgKb+pWN
 +Ay+0iVCC/HouO+wrJe02qgM=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id fbff33db7aa8f017;
	Thu, 29 Oct 2026 09:31:54 +0000
X-Mizu-Trace-ID: fbff33db7aa8f017
X-Migadu-Flow: FLOW_OUT
Message-ID: <e71e3a39-e88d-4e4a-ae4c-51e0783dabe0@linux.dev>
Date: Thu, 29 Oct 2026 17:31:50 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fs: fix ramfs_fs_info leak when rootfs is unmounted
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
References: <20261009055546.85279-1-kmehltretter@gmail.com>
Content-Language: en-US
From: Zenghui Yu <zenghui.yu@linux.dev>
In-Reply-To: <20261009055546.85279-1-kmehltretter@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/9/26 1:55 PM, Karl Mehltretter wrote:
> When rootfs is a ramfs, for example with root= on the command line, its
> superblock carries a struct ramfs_fs_info from ramfs_init_fs_context().
> ramfs_kill_sb() frees it, but rootfs_fs_type uses kill_anon_super().
> 
> Before commit 576ee5dfd459 ("fs: add immutable rootfs") rootfs could not
> be unmounted. Since then prepare_namespace() pivots into the real root
> and unmounts rootfs. When the superblock is destroyed, the structure is
> leaked. kmemleak on an SH7785LCR board:
> 
>   unreferenced object 0x8100a720 (size 32):
>     comm "swapper/0", pid 0, jiffies 4294892299
>     backtrace (crc c8bfd23b):
>       ...
>       ramfs_init_fs_context+0x16/0x48
>       rootfs_init_fs_context+0x16/0x2c
>       alloc_fs_context+0x98/0x114
>       fs_context_for_mount+0x16/0x24
>       ...
> 
> Call ramfs_kill_sb() when rootfs is a ramfs. tmpfs frees its own data
> in put_super and keeps kill_anon_super().
> 
> Fixes: 576ee5dfd459 ("fs: add immutable rootfs")
> Reported-by: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>

Tested-by: Zenghui Yu (Huawei) <zenghui.yu@linux.dev>

Thanks,
Zenghui
