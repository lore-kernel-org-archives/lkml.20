Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E377634C806
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 12:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789733893; cv=none; b=MnncbUuS9kZV18CHa7P+b69qHiEjT+E2BFtdS3M1Qw+vsTJOqLLuLH7cOn8CfXMolwxpFtiUxkTA4Iga+MeL6ZQ5EEvW9zzgMHAv40y12RGfIghxG77KyjMMxpt/9ABt+QhDlX9Uga3mj1wsYJcgRPZsFo9WPUZ9YjHugTdy+jM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789733893; c=relaxed/simple;
	bh=GVsqfgiWc8eTZ6lOwVDgYX8+hEo0bQcqz2KYQ4hsFW8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V3OXBd9Em1pKbwqUfYwiX4mwi1LF31xmdsMxPFhBT95495fuO8QYfj3xMFVPleUJceCpbOh3EC+Y8qOSBW9QcFzah1MWFowThBdNi0HXnDT2rSfySOyabS69QbHoEhrpng/ivdLJAwVP0G0IK62m89fxrzMLKeY9sKOPaPFKWJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nHXrBuW2; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nHXrBuW2"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912d822dso4822715e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 05:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789733890; x=1790338690; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=45onKwevpJeLdvAlZkmdd7zV/NiPer/Q7lLdr0dAxJ0=;
        b=nHXrBuW2FTyNXULaQcL0b7aDJPit/qhRmuk+3vbxNAswes3TDH0heuKz796v2MjTQH
         agEPrUk9aEvICc+NuLDk/jRQslud5jE73S4bmYwPAmV0p0c7wUpJmw3yc5i2jcIeljlX
         yW3S1Yog2n5mytpj1zOy2d0AtxpmW7fZyigbB2YJkq7N4uPc/PMciFnI6qcRQn7VQdfF
         ht3ih54dKIVf/haw1I7bQM4PqIpu+RfyaonUEIYFnyniVjJ/BI9bG2fv1Msb3LJqCHbK
         cmJaIBu7o06qZd5y7OmhWOnhwVmX6CUwwFKzYrLyeGq7fceT7LHdA0mS6H5QHlsK6i4h
         x0Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789733890; x=1790338690;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=45onKwevpJeLdvAlZkmdd7zV/NiPer/Q7lLdr0dAxJ0=;
        b=0XzGnk7l1+mecR8/hK3fVJ/Yfu4+u3nQxzF15Rwgo5YFPEEaVQj0BlEGP5eMmr6Bbf
         BDJ1RybUf0QmQzdMJ3dtbmUugqTorApkdyx+QCc6FvLZTLT4NHylgpOxVSnfMJPZ9U1y
         +csE8x66Qns2sB1p79KukpUWngdvi8GziwHD1KGkjr0j2+IDNELaPp/uZEOepcKfRR+z
         NT3RF0n2u2tNL1oFH7+U27CRaI8hdZcVsBCIWgMM+nqwFIKwwWDQ0FQIZlPChSvoQFUT
         SkZIAd7CJo0GNvA/8UvOOCtSuBNFLnRgpBGVDeflWBjQUgwJR3RQKhEOcBV3Rq9uo53W
         tCAg==
X-Forwarded-Encrypted: i=1; AKwUvBzM1shs/LxnU04WNjZzBVN5sY9VCE0OapTMq9QxFafKDiYWKgt66sOi7fn+AM2PprsbupJdpmSu6uD7lEQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nUa7Sy3FI9fuKACgl3oSICsnAfBK0nY1f7pSwKLah6K/5M5cug
	AesoVQ8ElssUjgfk7RhMKU3Tpues6cAuV4cWTgGcJrFV4NFc0QmgfLYvrxifrupgU/1otQ==
X-Gm-Gg: AYBFou2tWUTDuhxNeMPbFqEdUQtsllq4xiXHpumkQ7l0HCPvwn59AzKnq7DnPzaJRSL
	S69lX+v/yUbbLk8jqIvcPEl4y4o1Puc0gxxoHruprRXMqpYgOKwPVHd2otKg019bMPvWFCr68NK
	M6DJVlBZkoT4q51o73/8l8XOs8+TneYN7KbMgynkl0O0tBSabOxC2iw19QQE+QCgwXFRMxH61f7
	tQ37Hp4BOzGZ9SicQLrBLUBvPKrOrt0/qSlQv7ztabKSy4ZIvaWPks3qvoPxeWYZbrCM0L3sFEa
	iALK4yhhVcbe5KsunsV8QRelEenc7qrUVF+NUkMTx6lQAweLs4acfsgTNGiTRGxOxn/vYG/rDeQ
	0rYFyMJOfDmeqKHnPv7A1tyPCn6ust3qykHBWG5m8DO76P0MU1T3akOURDsLuDlX7w9RRrOLb7c
	nhDC2j8Zl8ETIZTNJguj5ffO+nkVqB2h7fZ2U4PQ9fOJh81oGOwI97HW0c9nQn8JLotoY=
X-Received: by 2002:a05:600c:6206:b0:49c:fff9:f684 with SMTP id 5b1f17b1804b1-49fc5735339mr29623045e9.21.1789733889912;
        Fri, 18 Sep 2026 05:18:09 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcab7e333sm33701115e9.7.2026.09.18.05.18.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 05:18:09 -0700 (PDT)
Date: Fri, 18 Sep 2026 15:18:05 +0300
From: Dan Carpenter <error27@gmail.com>
To: =?utf-8?Q?Rare=C8=99-Mihai?= Vladu <vladurares@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: replace msleep with usleep_range in
 rtw_mlme_ext.c
Message-ID: <aq0r_XwNzLQBnDku@stanley.mountain>
References: <20260918110821.1117935-1-vladurares@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260918110821.1117935-1-vladurares@gmail.com>

On Fri, Sep 18, 2026 at 11:08:21AM +0000, Rareș-Mihai Vladu wrote:
> Replace msleep(10) with usleep_range(10000, 11000) for more
> precise short sleep. msleep() can sleep up to 20ms for values
> below 20ms due to timer granularity.
> 
> Signed-off-by: Rareș-Mihai Vladu <vladurares@gmail.com>

Better to search the archive to see if this has been proposed before.

https://lore.kernel.org/all/?q=chk_bmc_sleepq_hdl%20msleep

regards,
dan carpenter

