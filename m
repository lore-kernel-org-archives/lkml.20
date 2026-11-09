Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794208538;
	b=ocPZefumqZHEiQLzPg6cLxThiFuiK2Ey5jpTgHRWRJpY6/SILOdQitionW7sVD+d9Ip3
	 xVhMB8Nc5VVtVffxJbV2m0JcJmUrfmVLFSMMCBP4kC+uOU/I46q1mzi0seTVu+iERiA/9
	 Ycha/T5p2pM1YdzqQVLjptHh1VH19Craap8zvrbArfDAzWgw/EQjZqFQtaWpmrej651OH
	 9L4rVuFsFTmsrRh4bw1RUsvNpiz/KokPsT50ec6wMjGDKmgZjRjdDZnjdhjagheI3IGvG
	 mjigXs7slLAE2tKWIzjG7g0tRhfKLdtm+NzZTrFfaIjAYiXBYiZ9otKSrtcRcDrUtkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794208538;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=IHDmqb3emIFmJ8fO9uRNFSu9XBh3Om7oI46gLrUcn6I=;
	b=mh4LEpVLy3VMk/v2uvd3i+RUjJA198OP4OGAIaDYWbx3LEMdHeoQV/zkphybWHLoPmzI
	 XgZyrVMKdC0S3OYNuJGZOPPmyzvhVMzSNrK5Bx1IE5ap33dQxeyBVWFljnwgS+HNGi8CI
	 nUBY8DEt7BXUZ2kze4GuZigcCiHEoSTB5TU5LZDYTEOxazGQBFVaD9CXHPnd1MS16RQwO
	 SLcm0l/9a7NRnM+yjOl/10g2FSGaY48kX59JvsKvt+g8L2VzlO6FL002h3i6oXCJI2FMC
	 GXGe365wGJ1d3/QzeQNlH0Wx7xz8/4ebVAPhIzXTxT+q8q7KSHooEibZlWsERVz+fog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w11j6Mdb;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0ED1606A331
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 07:15:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0ED1606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w11j6Mdb
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-36ff9c9da34so974819eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 23:15:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794208537; x=1794813337; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IHDmqb3emIFmJ8fO9uRNFSu9XBh3Om7oI46gLrUcn6I=;
        b=w11j6MdbsB4L+lfEhx9/QuPWJwJnoR1/635ejpDfK+LKom66v1X4DvzF2uzylOTZ3/
         Q9Dj95WkZTzj1PFghbcdCfk34yVFx93MMJxz6Fh9PQU2AnN3QRpI90c1HeaM2Cv6sZdy
         xBne9KiUAxZ9zou72Cnq5p5hXQgOrGnWF+hOz+swqgKABD2dQlZjeqQwhEaAFPH2TQH+
         lOiMp873AaypR3uky3pBLXoqP5rSu24uKD+dfdobZrN5JZcu5R5G5cAKOY6v8MJcA7uf
         JrcxMfecrYw4AhM5KcvnGA72DtPG75dQ+8Yk2j/IYMe5Sjmbvxv0MbDYcQJ6+wEX7rON
         4prg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794208537; x=1794813337;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IHDmqb3emIFmJ8fO9uRNFSu9XBh3Om7oI46gLrUcn6I=;
        b=KP5AQXpbZ9vPdqOQppU85NEKLpdRZceNXASoKyXRNDCZ+E3sWVU3y4bYdQVYwW+SKM
         Sk3r3trUtrHO3bDmPA4yHTReXaD77b2So6vz+5fkh6e0td5aSO2j5no/djfvzq7axRpL
         Cs8SRXMfgZWKvkT5isi7VH0MaENM92VgSgdEW9UhqJR/Zpyvo8IdWz2xDHLdsXbrN36C
         m98MMuqamSd39sBKmnordJ8dQA58JFPl950tx/Px/S7+EaOx/WG8VkyZHruPYm3qle1G
         AVZXxGfGvrOE2RhIA4QIKH9FoYX2klit0hcy4yq8alLlPi6RRB8POYzhJAD588p9KsWB
         9tBg==
X-Forwarded-Encrypted: i=1; AL+hErGHc/18VpKpAJwqSkRAK/JlsR65eeUQllcr7DkvN9AKO1wOwIKqa2qTgQGtVFP9TBS/+PSuCiRM4CobkBQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9imNLFY8lpbzPaSwWiaTAQtGWD56mrSzSgLyJVAn2dBPGYbxj3
	8y7sxQfm2A/UVdYk0AH4xPTPsydec4S8yOFFbDfj+FQO4nFDF1LwkNzb
X-Gm-Gg: AYBFou0+PtJPDLuAacabj1SBQSypRe0EjBqVGp7KGoAKbuhwJ4jAK9on9kx/nkph78i
	2W/bWh3nG0B3bedaP2eNUlxYSkAflom0COA5j+gzJXHMsiwGqJiyHHv9353tU6y6aQ7Fle7+mLp
	w75Djb5GAcEiYFTjQmD6AaHA8bBh7tIT/2qpLrD2EYQ3/1EAweAlPAASwr7EIuuzuz18Rp33Ak+
	HfUKLxrKA2ZnXxIRV5oHRA2T4dQjs5r29FrS77vkMS+S241S/l4mi2ZJ97b4Xi6Xkbrj2Oz9iIx
	U6pAPdnPEr0A+5JOV13t6ezxvP9AMuQ7/2fbYOz8ilegZ1VXMSIR/wJbcpwO2QRNMHwX/Bd2WhY
	l7oQkkT6DEQuXF3rdc9jSYMMhZ0lHXCX0jYuKgUBxmhZug5CUTmqs5uN2jxzC64Jc9aEnJ9CumF
	a4AiBtcey6+zcx0R+YQzg/U78hF5WWjWrUxoyPXUhzlD8WHXsX/uNHlpw/zAvXzpNfze6TyXwKz
	ZUn2m1+7UVK8BO5+DagKoJfC/UWrx2iENSf4Yk14+/bhQqYDNHoA5Wpls17tky5DRVZo4RGzfns
	3kg3Uu7tc8hVAS6CNjPCsOAnN1baK+wO97XMt7RDidujft6gNRgCZ2apQehKY2v79yFd
X-Received: by 2002:a05:7022:3c03:b0:147:a685:9125 with SMTP id a92af1059eb24-1b39fe30253mr4642534c88.2.1794208536573;
        Sun, 08 Nov 2026 23:15:36 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:3588:b56:78bf:db5e])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b37314626dsm14607158c88.1.2026.11.08.23.15.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 23:15:35 -0800 (PST)
Date: Sun, 8 Nov 2026 23:15:32 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Liu Chao <liuc63@xiaopeng.com>
Cc: Hans de Goede <hansg@kernel.org>, Bastien Nocera <hadess@hadess.net>, 
	fangxy@xiaopeng.com, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Subject: Re: [PATCH] Input: goodix - reject a bak_ref length that cannot hold
 the checksum
Message-ID: <avFzEGl-xQxGqN9p@google.com>
References: <20261106075129.3106093-1-liuc63@xiaopeng.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261106075129.3106093-1-liuc63@xiaopeng.com>

On Fri, Nov 06, 2026 at 03:51:29PM +0800, Liu Chao wrote:
> driver_num and sensor_num are taken from the touchscreen config.  A
> config with driver_num 1 and sensor_num 0 yields a bak_ref length of
> 0, for which devm_kzalloc() returns ZERO_SIZE_PTR.  That pointer
> passes the !ts->bak_ref check and the subsequent
> ts->bak_ref[ts->bak_ref_len - 1] = 1 writes before the allocation.
> 
> Reject a length that leaves no room for the trailing checksum before
> allocating, and skip saving a bak_ref that was never allocated.
> Without the second check a rejected length leaves bak_ref NULL while
> bak_ref_len still holds the bogus value, and goodix_save_bak_ref()
> then writes through the same index on suspend.
> 
> Fixes: 09182ed20c04 ("Input: goodix - add support for controllers without flash")
> Cc: stable@vger.kernel.org
> Signed-off-by: Liu Chao <liuc63@xiaopeng.com>

Applied, thank you.

-- 
Dmitry
