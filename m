Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792544938;
	b=Sk2hXp3+06H7lJqSfM3VPoBA6iNI863rc5FTSNwX6pGn+x4MovZHiRRTKIZuBaLHZL+O
	 owYdHvtKz15D6JEMX5Xm8DVGm611Wx75JPf0Ya+Es/1Hz4tcXneL35y5bqndSPkqfFhNF
	 I3yg15FPmVttL2Vcq+95T0pzj4x6AGQx2JcOkWpAgWCrMOnuy543TlwhwzD66lXyWwJN/
	 JJuFlTZZ5DQRhaYy/v8P1DFFKnLkzHaKK7e/I//wHeBre02v60TljAVUyMOPSM6WKsX64
	 /zl+Ol4/R5mt/vKa1kxkS04LnsNhT+5sj8N5Sp9AFcRNs53XKGUgew6Zlq3bIq88MBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792544938;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Yuv5rDY1N08B6dEjeAKBsb8gX3GN84cFs/O3p+HC2u0=;
	b=M2m7F2QPzrzITRMKobj3dQm9BiTHZUcBxO+FCwarBUlth0ny9vZ+cF38VDv90YlXcNp3
	 zZdXKRFg/3oATa0PcxGDJ2eLNdABF2pc5DkuznrU8PVXCEHdX1yE9Mzg17IeuCKMZm9JY
	 ajV6Qy5MTAejsSBojKl018gCxoCm7KgLqXEjE4jVIdDPRu+Rs6BZOl05Xfc7+M2qEB2iG
	 HVmpHosNR+ItVlNQIJ7Y1wxedAxOVbkSFZv6My9zSDyv4H0M/la6yh5nKrvomY3j7nGdC
	 P0ucxnflP24wqlEvrwUEov9clqhD2bZpcNsRMLdOICrdko6fIaLJx3y7sWAw51kpDCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=j7CSoAWk;
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6795606A31B
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 01:08:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6795606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=j7CSoAWk
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3ab868eb9cfso118362a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 18:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792544937; x=1793149737; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Yuv5rDY1N08B6dEjeAKBsb8gX3GN84cFs/O3p+HC2u0=;
        b=j7CSoAWkH6lvBcXXQmlagPeQlzVFKKIDHWBAdmxhtSGTaPWBXJW/O5p6ez8CNa9SHr
         Fygq7lgb2e2uxnG/cp/dTBFCd4cZl5ukg17U1smIKFIeq6WoDi2azvEMlFU2c1/7Ixxj
         KhMDro/3aOLNVvqzyMN90oDJfNhauj2hIZRalZswfVt5QCojP+AOgTqMfLSak7lRNnJT
         vuCa3kBXv/dGXXWDlIoOXcprDuDP1XtN8tp9jIUto5TSr4ShevwuJsKeTa0ZPQXHjY4B
         XkXK/4b6H6giwD5I6d+AWnoZvqXQiydfo8n/cX6o1GECQzlhUcq6P6l3PXBavcdBbVjd
         3d1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792544937; x=1793149737;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yuv5rDY1N08B6dEjeAKBsb8gX3GN84cFs/O3p+HC2u0=;
        b=n3jH/W4TE/3cA5GhBp2NsIfbvOclIPn4yb436BHWPTVv+i2z2y7iK1OyiINvKG4RfB
         +V8qEs74HgOsLL+ZtuEC17CknZNNyWjMNxeE/O/rRRwejC0M95JKuTzoGgQ5BI5Qqezc
         3D++y+IXhm/cMV71Um48NxQuiCp8WDQY5X8YuGG3YnEn8fGhJupKfRJxYbhrie5D5Y3U
         vsenx4r+8ySKNiD0wzi16YgksW3U9tX/Ixl2PnO+PuA14XQSKY0rlGDeSaVaiaTMFM3q
         65CacqxxqHCQh+JcIGb3c37AMa9oR8/WhmYB7guIEgQ6TldU+SWgaFsn+8VgppnaLf+z
         U63A==
X-Forwarded-Encrypted: i=1; AKwUvBwYOt3xa4e8ED+sDZHN32jceExRvDTowNfrdJd7Y9NU/0nJ/vVVMl6Qr2eCoqNlAqNBa9IzQar8BkIubxM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLRtfSuzG1Y+/BuuFQYQnWX9tRzHgZZ2tR1dqh49Hq9mi02ynig
	d9akGKQX6oON08H/UTjigupKlgCRGAg/JgKaNdL/zkcMFtkyAgYPadW2
X-Gm-Gg: AYBFou1tzsKu949nADFHDJii3C1CDEPto2q9RXj6TdKNa05lPpeB2vxJOHxEBmqVJY6
	zTSUtnx8Xf9959jL+knboXeFZfRZ1yiO1R8LZ4DcGakmLkxJjwqGTyJScldtxUB6kSh0gtQdjM6
	54xoJPiw0/49cDTMuL/vOKhrPtNVEg01oqU9OkUhWuY1FKPpbatnVIVk8N60S9fnHbw7wxgzhcQ
	jRenR1zBQtW8XxXImo4OQEYU0luXlOZ/r3azVEH3qHKwKbSGR6NuiAfJXQTWSy45DtzqmlITieJ
	qSTTJMOXgChDP/VEvWXPZa4NWjAkkx5M95aQDeO8hznLEWO+QkILxswKctFHJLDNPvf2KZFyMFX
	TbsGaauvQT5AdAYo2/VpjOq6RKMuITp05nsWmiKaQ35M4UC0J25imE9jOPXI0JR64p07PVpV4jj
	qtkopjci3hqPvjyPHgZsAUU212LjORCLI27npFJU23TsxjEoV5UDDQJRiALKOO
X-Received: by 2002:a17:90b:3bc7:b0:3ac:c005:cf07 with SMTP id 98e67ed59e1d1-3ad86ef5171mr459769a91.42.1792544937058;
        Tue, 20 Oct 2026 18:08:57 -0700 (PDT)
Received: from localhost ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad80214aefsm1694443a91.3.2026.10.20.18.08.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 18:08:56 -0700 (PDT)
Date: Wed, 21 Oct 2026 10:08:52 +0900
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Zhan Xusheng <zhanxusheng1024@gmail.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>,
	Bryam Vargas <hexlabsecurity@proton.me>, ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org, Zhan Xusheng <zhanxusheng@xiaomi.com>
Subject: Re: [PATCH] ntfs: fix u16 truncation of the update sequence array
 count check
Message-ID: <atgQpJDr-3tfZxQw@hyunchul-PC02>
References: <20261020134433.1015126-1-zhanxusheng1024@gmail.com>
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
In-Reply-To: <20261020134433.1015126-1-zhanxusheng1024@gmail.com>

On Tue, Oct 20, 2026 at 09:44:33PM +0800, Zhan Xusheng wrote:
> From: Zhan Xusheng <zhanxusheng@xiaomi.com>
> 
> ntfs_check_restart_page_header() bounds the on-disk system page size by
> recomputing the update sequence array count from it:
> 
> 	u16 ra_ofs, usa_count, usa_ofs, usa_end = 0;
> 	...
> 	usa_count = 1 + (logfile_system_page_size >> NTFS_BLOCK_SIZE_BITS);
> 	if (usa_count != le16_to_cpu(rp->usa_count))
> 		return false;
> 
> The right hand side is computed in u32 but stored in a u16, so the count
> wraps once the system page size reaches 0x2000000.  An image claiming any
> larger power of two passes the check by also claiming usa_count == 1.
> 
> Nothing else limits the value, so ntfs_check_and_load_restart_page() goes
> on to kvzalloc() up to 2 GiB for the restart page and copy that many bytes
> a page at a time.  The size is only rejected afterwards, by the
> (size >> NTFS_BLOCK_SIZE_BITS) != usa_count test in post_read_mst_fixup().
> 
> Compute the count in a u32 so the existing check rejects an over-large
> system page size instead of being defeated by the truncation.  This adds
> no new limit: the array holds one u16 per protected sector plus the update
> sequence number and must end within the first sector, which caps usa_count
> at 240 and the system page size at 64 KiB.
> 
> Widen ra_ofs and usa_ofs as well, as ntfs_check_restart_area() already
> does: both are loaded from __le16 on-disk fields and every comparison is
> against a non-negative value, so no result changes.
> 
> Fixes: 1e9ea7e04472 ("Revert "fs: Remove NTFS classic"")
> Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>


Looks good to me.
Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>

-- 
Thanks,
Hyunchul
