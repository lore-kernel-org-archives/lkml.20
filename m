Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 862214252A0
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 15:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790004205; cv=none; b=OXadMUb6H4FTW22clt3xltM/uhHi+nmnL+4ISsKmFbynLJdJVM5YJbRSwfMDKp2mQHpRV0DvTdNcIeyb/ifOyIDoceJsGkD22SxWKge2kOwGIQIqE1YJS+DbJjPWIkt9OQ5PGJWhG61xZnIpNTf8685U5ZhtCo0gxLdvx30pUWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790004205; c=relaxed/simple;
	bh=OscC8DrQb9ORVJ8oYAGZZEW+xZwE9Iz53Q4Np9Y2sXk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EwuW6PFEkdr5i43Om54Hv/IpmzGwN+b4Pptb8CaOwfw3Fx1eMkyZtnPNWRcORxan1aXojhTnglyEldKmlRsn799BvFAfL5mjGVmwMoUmdQh688fRkHeclNvw1afmzaG6uwRIdO58da6cwLTh+1FEI+MN0NVMN1sSArJdGQPR5cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ijJImQmZ; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ijJImQmZ"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ce364488dso8497375e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 08:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790004202; x=1790609002; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qq+7QrXS/k7a5MVGzG9IfQdtOA6kqjAnM3OlZxIizdc=;
        b=ijJImQmZP3O4NE8p929lyiEk0H6tiPlp7Y/8+9YzhxIU6hEuxzMk+S4Q0a2LokUHAT
         WMbdl1JiC3RwGEhagP+AbVQ2aLrvp+Mj0fcDXr+TdkVmJ/1YaIlK2d2MpLVM9LHIf67T
         tQGgyvVPYbOuxjp+W+ciljrLbIwcqSNwaczLsXBqUCjeWh/EjedadBLDgPfWfYTr4M2t
         0+RpHx4Hcens6B7xvoen8ZQ54kco8r1yikDmVDRtTgrqcV05yAMLbqfYOP+ZcvchW54h
         gE2jFux6uiVJgGIK44PQf0CJTo+p4BI89cKkRH0T62EfbLTIi+ruOGRRyIP6TGiNREfS
         tzfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790004202; x=1790609002;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qq+7QrXS/k7a5MVGzG9IfQdtOA6kqjAnM3OlZxIizdc=;
        b=I7AgX6FgJY8ps2wTY3D8Y1Nha+4FMMPkHjTBfe4luytwSh6vp+axCJig2F3PszVMJo
         LK7LKwhEFAyxy0K5yb7show89yheErtnw838KHPeer0Hn3ebcABQDaIa5IJOv+mGtVkJ
         VJUZcrJOFbyDSHydPlkp1k6CodaXE8n7/rCQY6+AauOuPhmWbL7bFMs4OHSm9xnxTIbI
         geBna7ddTvzajV9gdFWXtb7ZxGVNyJ74fs0Or78kDPYYAjl3OuAE/RMpH2TZqj3gUJPp
         F1y7Tb7UJMtfhfgloA7d470kqJgi7l+DVDRq3ktuYIJi9+edcSarJpBA0rJd8iPkm9K5
         79Rg==
X-Forwarded-Encrypted: i=1; AKwUvBwTwumfDwKci79WDMeZxn0xSpcdIgwn+0uEYSJgfIPDrRIyFPbZrHlTDPcdEjenGPkiGlhY89qTGb5Nwkk=@vger.kernel.org
X-Gm-Message-State: AFuF++mwDY6U/GB92t2R8I6b6eoVpfEQVea1BdyJk3no0N5K4PC1+nRG
	qZXcUJEtUgIYo+hxobh/vQd5U4Y32YsS6fljk/UQp8tPiKPduyyKYHbI2UNoZp+6U8lLXQ==
X-Gm-Gg: AYBFou2KO0icOUo0Taefu9riz6HrixJmc/0koh+MrPvwhR+y5gwQWBsI7G7paiLckw8
	n6x1HVF7/k43A1A5o4olxUyVWC7XRlVPikwjMNTVhe9tz1IyqHGqoeBTjpeblT45Z/yucquf+mv
	a9d7KbeqK7GdgKXiwprhRN7Y9FhQA0I4+FSHa2GdCgRd6OM2dh7YITu/qtRx9fQU99piJr868eZ
	F2j0ZLrJLbPPbwbSshdWR8eCdR80vyKhG5TSPumeELueJziAL7zvnE+UInKxVDWmfF/n3Dr9pB1
	HbEtP/gpO5O9uSStcqy+G9nME8mc2qmVIrPSpLjNO6f1cpPPx3hUYpF3ofYDV6Z0b9KrsfvKgwt
	HyIDtrh2l92Wfun98twQ/llodhawaicJwQUnHwgYyjJZnJpv323Ml1zqJVZnHI1Z5hZb4hnsZJk
	1tJ/rz68V9QFhFBuF7tRZwRNQnMKvNpdeegam0eI6tyo8atXZ18wqXs+1TKp9NNk1NmNI=
X-Received: by 2002:a05:600c:310d:b0:49e:65f2:db64 with SMTP id 5b1f17b1804b1-49fc4f85891mr183159525e9.5.1790004201571;
        Mon, 21 Sep 2026 08:23:21 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc6ec1e63sm206536025e9.0.2026.09.21.08.23.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 08:23:20 -0700 (PDT)
Date: Mon, 21 Sep 2026 18:23:17 +0300
From: Dan Carpenter <error27@gmail.com>
To: Adi Prasan <itsadi2409@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: fix ie_length bound check in
 rtw_cfg80211_inform_bss
Message-ID: <arFL5SLHwLflaONc@stanley.mountain>
References: <20260920142849.294162-1-itsadi2409@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260920142849.294162-1-itsadi2409@gmail.com>

On Sun, Sep 20, 2026 at 02:28:49PM +0000, Adi Prasan wrote:
> The buffer bound check in rtw_cfg80211_inform_bss() only verifies
> that bssinf_len (ie_length + header size) does not exceed
> MAX_BSSINFO_LEN (1000 bytes), but network.ies[] is only MAX_IE_SZ
> (768) bytes. This allows ie_length values up to ~976 bytes to pass
> the check while a subsequent memcpy() from network.ies still reads
> only 768 valid bytes, and other paths that write to network.ies
> consistently cap ie_length to MAX_IE_SZ.
> 
> Add an explicit check against MAX_IE_SZ so the bound matches the
> actual size of network.ies.
> 
> Signed-off-by: Adi Prasan <itsadi2409@gmail.com>

This needs a Fixes tag.

The original code seems like a bounds check on the destination.
Your code adds a separate bounds check on the read buffer.

Why do we even have the MAX_BSSINFO_LEN limit?  What's that based
on?  1000 seems like a very suspicious number to me.  It's a normal
enough number for humans, but it's a strange number when we're adding
up struct sizes.  Do we ever need the whole buffer?  (These questions
are basically rephrasing the same question.  I'm assuming everyone
just feeds them to AI, and I'm trying to learn who to do prompt
engineering).

It wouldn't surprise me if there was a different read check on the
source buffer.

The other question for me is:

   304          memcpy(pbuf, pnetwork->network.ies, pnetwork->network.ie_length);
                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
We copy the network.ies entries to pbuf

   305          len += pnetwork->network.ie_length;
   306  
   307          *((__le64 *)pbuf) = cpu_to_le64(notify_timestamp);
                ^^^^^^^^^^^^^^^^^
And then scribble over the first entry.  That doesn't make sense.
Should the timestamp go before or after the entries?  Review the
git log and other implementations of the the realtek wireless drivers
to check.

regards,
dan carpenter

