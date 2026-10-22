Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792648349;
	b=Z5QaoIbJsuJZ6rmTDdfYJHcGj5eLQ0lxAIyRxrXWTauwZY78LD0NhbO9oJyq+EopYaYV
	 vHg08N3QQI4qu+4dLic1VPiX9DWGpZG0K3+/e4kkfl9ge/f8/nR/vtjI5CZ5iUVVDx1Fi
	 uSygMigwd0kRFNVGR5V7TvXnpatI2Sejfce5ppPcdWnsFmf06kDobWEJMWdkBV3GDBv8r
	 8P0pMSeaVvy3kwxD8xvF+dyqpY6vucMtVTchEmGgD+R7Y+E9Gdg6xAAhVCwwQQnQ0AxUF
	 W/zhqba50J6ZiZzB9bew9iXPKqL9boFQGKzTuEy8r6AUd20DPoEcFak6VCU9NfmBL4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792648349;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=BH5IrgVHfDgT25PKqEWiKin87YTRG/5R0beXb7uOD5s=;
	b=gyNxUd4LKI2jUDGnJHDWL9o9r+BjK27FYn7VakeTUpx34kTFbfeD4xmg3TLfgpMxEw9g
	 SR3HQ+Q89o6mvhSskypg9fnkA0GLBoqp5+ZcblkzCuR5vhSPOu72SCDUdF7qj7+lHav9s
	 dBLSScSNqeLg77HFHnehgQv45xkT090OGVoJjUD/dAU7O54ZIBnv9KsvqdntSE5uT82GZ
	 4DAdYjs/5tL7OISccZjTMks3PaUYwGfFMGJib2NXhFYGbJTq1CbJtLd6nP6B6ZtpJ10jq
	 JEWkSxa7u9F+iIIUzFBDnXp8VVmdLuSnxIsZtGVSuZu12c9zjt7NRXDjFSyEtefcn2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Vhdwqdoa;
	arc=none smtp.remote-ip=209.85.215.181
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 547AE606A320
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 05:52:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 547AE606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Vhdwqdoa
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cd60c5da24cso766303a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 22:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792648349; x=1793253149; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BH5IrgVHfDgT25PKqEWiKin87YTRG/5R0beXb7uOD5s=;
        b=VhdwqdoayhkO55Mw9ZjbyQ7FmEYWl1yhoxrP5l0MqlWy87OjJ2SVQu+j2UXXDb6es3
         m7W1flymrQHul7QxQi00kS8M+kyVHBSVGOge2lgZ6E03WYQZ11vlJ9iwNSRUFZMkTeN0
         KN3YirsQvFlpQAfoi2YFNkLU2DNIe/qKEdF3BKxnuMtj1bau/ev46tu0TntNif4eC8oY
         VYFog2FHj3Nt1nSQpgb30dK0LorhAx/k1mcEJQbAZSdEeNiCBzjQi6ZQ0HzCziHKW42b
         FP9gt4T+apa6npYwfcynww5bHrqn67aEC9Lw1ciwY78150HuBRAbluic95vRLA4TjzOk
         LxUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792648349; x=1793253149;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BH5IrgVHfDgT25PKqEWiKin87YTRG/5R0beXb7uOD5s=;
        b=F4dttsUiEJQBCc2P/oP4DmGbFlJjH6RRwbQqrh9uVvaM67ZiOZxmYCBKZXZbOB5Szz
         Z3erL18pmcMZzG0wJmhDIzOcL0P+sSlRA7IsvAsxybxdADpNDyh1WtEbbM9Uum9ofdku
         0s1E4G8GR4Su0df/jOxtT50xeOt2H3hTZAZ59aekHlGKmOB837X6Z9QouzDjHeOR/v2U
         cg15j5Ni3IjGqwqIhRDUHKd7g0qfDTT8D9QPgTtco4QQ+pK83NEB3Z89Ft6x3Lfu6+9a
         EEWxuIngOaETe3LSSdS6+ygvp2zo0g0RH+tr64K0LFHgchWKY08rm01pYSCuFsfk1XpT
         eiYA==
X-Forwarded-Encrypted: i=1; AKwUvByuu6Z2hrXP7/VMW9wY71jo5u0DO5ZVufr9H5YV7USd2dNzryJ9KXuPGKm3QpFi5nsvAPTC+8raJ/zR8To=@vger.kernel.org
X-Gm-Message-State: AFq9FYK2Dof+zzN0lqeXU80JnWOQHsQ91uWXYYFzhxXgy3GeL+W34O6s
	Pdz54ITdtPJ33OVQZbQ2GtoNW//xQiBNaeomZoGTGE1eBTCIOLM8bQw7
X-Gm-Gg: AYBFou18Hd5clPTt+qTPVGN5/BuphIcwZWC3a3wmPKO4KwQ9D8jcca9J19SfgKRjg1+
	bG8HNOBtdhUDZFKz1oSQtlymNetJP89xfHjmhRq92EIcOxrGS0JDNPPXpBXPvQc8RQuZmJOg1rG
	6eisZu/boysdAVCGVytFWi8M+wye+fo5zhER4TfgfzbrqHSdydX0J2r/WJCCx45Fz7WMN4Kp4We
	KBxIQFetVtsrdNOFduOtiuQl5CK5GuITfHwBRq8XxSE5wuBBR4g5xtHUkKnIA76N9ioSLPRxkWb
	nJ+L9d3yZgN850t9C2tAp1phNgf/Lw3rtVrOCVF1AyDtZ1c51VluDPrXSoDxz31dX3nMSFgsWKS
	2A2rweO8XD7n6zJzRQsAa8QyiB2dSlfarsIeJZgmtTxlz9q/OFJxf27iDkR28vm+3mhrLFNrdOK
	WFabDsbPuzbp7KTd3YoIwzeBO4uPpE7h35Odj2hW2HhYp7oKPe6t5MgKVjRy92W66I8IoVfJdl+
	995VyDm4lJtQ0tdwREHnDexozreIvorObv2PE3jD4qqkA==
X-Received: by 2002:a17:90b:4c49:b0:3ac:9176:e83c with SMTP id 98e67ed59e1d1-3ad86f1bbfdmr3687365a91.12.1792648348367;
        Wed, 21 Oct 2026 22:52:28 -0700 (PDT)
Received: from localhost ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada49544f1sm2526622a91.16.2026.10.21.22.52.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 22:52:27 -0700 (PDT)
Date: Thu, 22 Oct 2026 14:52:25 +0900
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Hongling Zeng <zenghongling@kylinos.cn>
Cc: linkinjeon@kernel.org, ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org, zhongling0719@126.com
Subject: Re: [PATCH v5] ntfs: handle a failed size rollback in the write
 error path
Message-ID: <atmkmR-ubMR5WU_e@hyunchul-PC02>
References: <20261021063221.1410183-1-zenghongling@kylinos.cn>
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
In-Reply-To: <20261021063221.1410183-1-zenghongling@kylinos.cn>

On Wed, Oct 21, 2026 at 02:32:21PM +0800, Hongling Zeng wrote:
> ntfs_file_write_iter() extends the data and initialized sizes before
> it copies the user data and restores them when the write then fails.
> The restoration is best-effort: both results are discarded, even
> though the extension is already recorded in the dirty MFT record.
> When the restoration fails too, the extended sizes reach the disk
> while the VFS inode keeps reporting the old ones: after a remount the
> file appears grown again, with an uninitialized tail where the failed
> write never put any data, and nothing records the failure.
> 
> Keep both undo results: roll the initialized size back first, and
> roll the data size back only when that rollback succeeded.  The data
> rollback goes through the same VFS-facing truncate
> ntfs_setattr_size() uses, which also supports compressed attributes,
> and keeps the VFS size on the durable data size when it fails.  Its
> shrink clamps the initialized size to the rolled-back data size,
> which can sit above the old initialized size, so a failed initialized
> size rollback would leave the clamp in place and expose the
> uninitialized tail.  The undo runs under the mapping invalidate lock,
> like ntfs_setattr_size(), which the truncate expects.  On an undo
> failure, set NVolSetErrors(), which the next persistence point
> persists as VOLUME_IS_DIRTY, and log a message for the errors=
> policy.
> 
> Fixes: 9c87959601e8 ("ntfs: update file operations")
> Suggested-by: Hyunchul Lee <hyc.lee@gmail.com>
> Signed-off-by: Hongling Zeng <zenghongling@kylinos.cn>

Looks good to me.

Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>

-- 
Thanks,
Hyunchul
