Received: from mail-pz2-f36.google.com (mail-pz2-f36.google.com [74.125.228.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C614305687
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 05:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.36
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790919447; cv=none; b=KAamXYDNmjirXiJfiZj0sa7R1bdso35+U0t/Y2y9N4NA4Wtpe0iW5Ge9kJMDF6bnbfQCdmzfXH8nYPNuw1yWdQIZPwxSaVqrTu/MINKNww5OADnDQx+MOh9FQ/9rN2xbHYbK/STMGZ1OH1K5S4THItvG0l5C2RGduwDRb3KTT5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790919447; c=relaxed/simple;
	bh=Qu+IT/SfaKywPp0ftNmip2dBTQBBkOkDk7AmvwWlwRQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U4fWBN3rSOsnakF0Dq8ThaKKDffVq1Ai+MOZfovODplzAd9yz3R6qx6ArDRjZcnil46Sw7gLKVRYcUhVKNNwHlY/5VU5MRbc1SZxG3QOHTxnNEUH7wFVvS0BbmaNrNdE1ZsfomJWzrAleSaQCaseVlZe0WMDeju+seUM3zRE0iA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RR7IiLJF; arc=none smtp.client-ip=74.125.228.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RR7IiLJF"
Received: by mail-pz2-f36.google.com with SMTP id 41be03b00d2f7-cc7e7717675so1045221a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 22:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790919446; x=1791524246; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vfrkmb0eJpHRNYj/pvBngGN4IjRZKZRH0wkIARGATCw=;
        b=RR7IiLJFWv2JWADcWNaCKqQACoaaqRnV4/yo9fTm/4RY+YPzDW6OHXLz56HGfh2Egl
         2u00Yj15zk/y1R7AnwqxA3jAcKthA+hrWK+DaoU/Bv4G/Id77xfocYi014CZTdr9fh98
         uY+uNWir1uBt5KhIb5YZRBiw+/bMx/zFJhK6YAPnE1BIJS7guOsqTTbY0CF2OGsbzPJb
         Xi/cAS1hxkf569BxXmeVzaJwUVHYMXMlX5m3zsllUsODwrQXwk5M97HyODF/hOQh82tD
         w1HJ6d+HIwxpXX+DIEuIh7itFbSt6ZhDVbRs0pfFLj4pKJoCf31kegTQRiEyw5+vQYns
         F2sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790919446; x=1791524246;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vfrkmb0eJpHRNYj/pvBngGN4IjRZKZRH0wkIARGATCw=;
        b=GLdL7v2zWtWgeGJ6JVCxu2KHNn+7/cH3hVl62Uq0ceXJ6tCKQ9s8btsFIAAZxsPyet
         XfWoYFU3iefFIrCP61ccRJOlErqk7l6RQO9X8PN2/6oCvD8QM6UT2BDsSi27+yakyXMz
         2mwxdKXLnULdWv3J9hBxOpRCuOMt1ozj7ltHk4/R386DCs2iu8fxe5s7VoD3Qu+GBE+z
         YMThnfISQmo90SgQzjpMjeA/Ns02Luh61w4A0Ly0TKABTLRsCmHjnXe19wc82ZFk5Bhy
         73OXLfOI4lE2M5sU/fAL97p1qo/FK3dNAJHiAgNUVrjWScv02AouoifHWRQZv/++eobg
         Nl0g==
X-Forwarded-Encrypted: i=1; AKwUvBwMabl5bh5f1eJL3WCyyYaegacn46igtE6vA3MQqBfkd0rVOVv1NMZJRdSE65ISiWxHTZuPPmB4kdQ8ltw=@vger.kernel.org
X-Gm-Message-State: AFuF++lUFSc8CzZ+EeJh1eV6SjsVDMa7AXU2fePqXQ191IRr4k3ylXBM
	3P++oOmkY29t7XNuGYUUF7zDOnDxUD44IsdmfTAEO1xUzbqSasZ3yxjn
X-Gm-Gg: AYBFou37Km4bjNRF6BBmeYY9SJRLhWyjr9uIDcpCbtF5HRK8usGs7IkKvAJX0YyPhDj
	+3QGtroCL/La8kmchJ5TGs5xAoV9W+DK2urvMW7RyVn7oHYN91J+uNyA5OWem6o7bGyr7oniDC7
	n3P+ImKWryvk04Rdb3GJNwHQEdX3TnhYcQ2oFY/EYm2eg1Wc65IgYXQFBG28REfUBGTHfi2s6it
	UQomYFCZEv9N21SlTJ8MuwnpOBpxGkZ8x3X7QpfIJdRyL/1CSWN/4DaP+kLGOVqQsiA7pBEpXuv
	0rMphJrDWyVvFsTo7Kf2kfNtU6aKzCLxWWbo4AYxOI2cjPzqE3mcLyLdwJn1KH9/sTuRmVRYIhr
	ER40Gq579gJZGkpgevWQFzGHCRDn0FZVdAcMH4kYcFcIjdYhsvGpf4FmEMidEhNj1NvE8/Uy1A6
	b8pbujZtMCn5x7SwaRqduJuY2qhGLm+cSrOW8rQUvBXI82MfFabWJ2udOiJ+QR
X-Received: by 2002:a05:6a21:2c01:b0:3de:74ee:c05d with SMTP id adf61e73a8af0-3e0bcfba78amr1843334637.23.1790919445425;
        Thu, 01 Oct 2026 22:37:25 -0700 (PDT)
Received: from localhost ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88b0cb77df7sm468216b3a.47.2026.10.01.22.37.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 22:37:24 -0700 (PDT)
Date: Fri, 2 Oct 2026 14:37:22 +0900
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Matthias Goergens <matthias.goergens@gmail.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>, Baolin Liu <liubaolin@kylinos.cn>,
	liubaolin <liubaolin12138@163.com>, ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] ntfs: fix spurious EIO and ENOSPC on nearly full
 volumes
Message-ID: <ar9DEnzfkEvi3Oo9@hyunchul-PC02>
References: <cover.1790853718.git.matthias.goergens@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cover.1790853718.git.matthias.goergens@gmail.com>

The whole series look good to me.

Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>

-- 
Thanks,
Hyunchul
