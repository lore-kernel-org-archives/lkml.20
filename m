Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E795331F9B9
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 00:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790554883; cv=none; b=R3dz1AmZoI3VHoV79+OBTlxFHVmpMFxRH9xfzTIJeyUstxbP73wOzwbh79Nv6whBBYkEnnVPgJk4eO1QpoNasUbt0+DvlncAk3ZYdMqCzdGKe3S5qHBS4HG4WDSRCryHD+EwtCEEkW142I/+ScYmWbIZeU63RrEtFudkVQL7mqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790554883; c=relaxed/simple;
	bh=DCVDVXXZXuxxfJ6tept2g5zw0HnzYLfdbEScB+IIWaI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bM3rWCP98DRcUavGy2DqpshAMiDjQithV2end5+VZ7Cd3Qb+DexxewhPhhaNmiE4/rjUOmFE7r3Q/DuFmcCDuOPi4SfAGMz0wYhYJI+3mDigiiKSI5iZQWHQRHTvF5S3d8L5ktfpWLhZd3ekau24r7deYWDJbR7zDR+h02oakLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bXlJ71d7; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bXlJ71d7"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc4c3304784so928991a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 17:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790554881; x=1791159681; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/kL9tgvOIzXvb00GAWN4NcAyQYvhesiF7SHAPhCduuA=;
        b=bXlJ71d7y0uI3Dec1Jx3gY6wjFqa3zMsnqMUT6qMz1ORk/Un073arC80mTeX6lY9ga
         NnqW0Tjkyfr01f/YbAvsDAxjpKHZzzaZJppdmVq5+AAI53bgwsBONAvnxHkPuJivOSl+
         khZ8WXWQnc1FtMY+Y9uDmBAo00ncl2jSPFzMZW23UZ2uwpzf7Rhb3qKdOjvx8I8ES4rm
         XuROULOrLWdk/eBGrtGt/VYTH6TqJBK0BgrpZJvBCjFDeLwfe3FYyUYbn3MEmFngidCN
         OHYn//ZCmfvzZ3yDQ7Kc1Qst+UJl8VhA1mPypj0FBto7AHYplBlnMha3aPvzQ9E6Kcfu
         8Muw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790554881; x=1791159681;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/kL9tgvOIzXvb00GAWN4NcAyQYvhesiF7SHAPhCduuA=;
        b=VL+d00VeSxQcrsd2Ww8WLN5tNRjEW7ERo23mq4nk0yD8T+auKU4qEDsxOuiWyaGt3s
         OJAhkm0LvrF1i4JuBlwg8Ewvge6U3ryAZLCiZBYIfStlrxTzhkRG4TAnV3HgKE0sph9x
         iNwrXV0lOknpv3TT7MFQedIDLdzBMvXLUqcWro/kW4Q2uSmHSqPhvcukQQTKmuyuR4L+
         /aQC4olTHEEjJl7tJOQUtGOoXApZcXV5RsiWWcSZVZ1XZqBtPDN2nZJdumIM9HZ48nFl
         FC5dtZGoy3kKSxNG1KQtQnj0Yr674dgffIMJt8xfNHbctV75NDY6QEP+yvktQKrjlsnt
         DAtw==
X-Forwarded-Encrypted: i=1; AKwUvBxzKqEoGCKgJe/t6iowLQNZjQNmVtj1CRdgF1cFY0F7zFKt6LAhb92NnfxEIUA6cdn44U3Ph+rhsS+3g3I=@vger.kernel.org
X-Gm-Message-State: AFq9FYL04TIkCgQGLDvbfK0zWlUuqJ4KlHxNmnmN3SA9XsMqsMoMa7kO
	iYjv0dKsWX5coIBeVHF4PCDPeryni+ho4r17FaMG/11+N2WdfRGY5GeaQo/D8g==
X-Gm-Gg: AYBFou3TdusW/V7mABCv/S1f2V0iTVWEsBRPzIZ1kTWOwyJkO2AlkBRRyh2Hd6xTRkx
	AByTUYF8zVjRfkFreDmbil5In+CiPngREsjNgCVjIuksweUimqg5rkT/ciXIvjNOqCGJJ7cPcLk
	hIAGa/+NyT/1ytuC52iLMiAyjy+0N9r9umEbzhFSgFmA4tGMFDY5b+VpIQWZQNbhqHM17/A1/WK
	xg37iFg+3B+zOOnsNaL0O7+HT8ShzNCBkEVtXCm3OgSjBzFIO/DfLkNPB758gn7a9eRN8qdAuOI
	4A29QyPfWfjNuyG0gLvZNC+iNBOSqJ45DhiH/JkEvdcd3AN2sZUzBIPnfRyXgO0qDPOKS6Ua2D+
	gytA9AGHfXlFAMk4FSJLj4Socr1gP5GTxwHHyTG39efmz+y3JQjasuadM0B5rB+8DEfqWKdbgtt
	Y51P4InUt+piusFk6OAPsPjGiuX8eTZY7nV6TDU3zWolarjPjKj0MXQOie86cBykm9aJnSt0I=
X-Received: by 2002:a17:90b:1cc8:b0:3a2:b036:ed62 with SMTP id 98e67ed59e1d1-3a2b036f440mr1030732a91.37.1790554880854;
        Sun, 27 Sep 2026 17:21:20 -0700 (PDT)
Received: from localhost ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0976c8f8dsm24010310a91.12.2026.09.27.17.21.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 17:21:18 -0700 (PDT)
Date: Mon, 28 Sep 2026 09:21:16 +0900
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Matthias Goergens <matthias.goergens@gmail.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>, ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/6] ntfs: do not turn an unmappable runlist fragment
 into delalloc on write
Message-ID: <army_CjLBEcEiJ_o@hyunchul-PC02>
References: <arMoap0ZgeORuktT@hyunchul-PC02>
 <cover.1790417653.git.matthias.goergens@gmail.com>
 <20260927050831.2739166-2-matthias.goergens@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260927050831.2739166-2-matthias.goergens@gmail.com>

Hi Matthias,

> +	/*
> +	 * As in ntfs_attr_vcn_to_rl(): a runlist fragment that could not be
> +	 * mapped is not a hole.  Treating it as one would put a delalloc
> +	 * extent over clusters that are allocated on disk but unknown to us.
> +	 */
> +	if (lcn == LCN_RL_NOT_MAPPED) {

We should handle LCN_ENOENT also.

> +		up_write(&ni->runlist.lock);
> +		mutex_unlock(&ni->mrec_lock);
> +		return map_err == -ENOMEM ? -ENOMEM : -EIO;
> +	}
> +
>  	max_clu_count = min(max_clu_count, rl->length - (vcn - rl->vcn));
>  	if (max_clu_count == 0) {
>  		ntfs_error(inode->i_sb,
> -- 
> 2.55.0
> 

-- 
Thanks,
Hyunchul
