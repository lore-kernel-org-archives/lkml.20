Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDEE057983B
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 20:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788986753; cv=none; b=XlzFuhtK75tsM+OFOWJDjddW0Ud2/eL2xjOh5PYF+jkBe12wnm8AciEmgZtkNGu4OjOrinsaqQOCz1z+JootZItQgB+mt5rOnHywzhkCOeH/bkfn+j3CP22kKUgGSwYVF8Ela3TLcF8YZ9hm3wwBAKGbx/vOmJQIzXghqfV+xFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788986753; c=relaxed/simple;
	bh=EgZSCh+L2dZNhexxdGTyMKZa85FUePBVH8pPZX8mW+c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YtvSFPPWLqKBtaAgKTJunZHx9IUPDZJIhl0bRTNKCYqs2vu89YSie9ZdkDzEM4Ra40ZHz0HYz84Qky2YKsAGZD87GOX3DWigJvEC+EUEHGvhuWZHk/4aXTnj+dWfm3n8UhPqHW8/rccj6ZHn0YZJ7uYAsqg/He8/m/AkbW3+4Uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V6TYGPtP; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V6TYGPtP"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cc4aa0220f2so539622a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 13:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788986742; x=1789591542; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Qt0NOIhyNLN5/KCcLAm6TLa7xwx0XIh9TdrbTwlVTtE=;
        b=V6TYGPtP7X173cZbWvfgflv88LpDQAHR5DX+jVBFGXjj5rDVNoFSUL0nHOsYmSQ5pO
         zDfK36JmA2Kq3lV1cKWGkQZWbfRQZh3f1W6zyiOxa7dEHij12uzWJTGPRpgLx/wnk8V8
         zpUws/FJAw0iZmLsbmAdsGP7419DPtpHBHZroRi2KU15L2kkC5dYCeKECKgWDkHeLar1
         YycDRFlAEBXulusLFhD9recGKVFM2jAg/AzskXrhEwVbuXa/dUTwyAzDvdueAdHl6jPv
         LHMBKdaEFtvn9TTiUUGqlsDUFkETBA14uxbzDPAI7HpXc5EzcuXMO8PH07DaHfK4RBkQ
         SoGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788986742; x=1789591542;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qt0NOIhyNLN5/KCcLAm6TLa7xwx0XIh9TdrbTwlVTtE=;
        b=Xb2G/f6IJt1nH2pNV+p31Ou3N2ulL2sjfseZhB6sjkwYwMvp47iUzvKQBJ1TzoOxps
         MfRLn4oeEEvS+g6tPy5YpHMlhJALq0JFmIZcs0L0UC0051uci39WW63BOalbRdUL4oAc
         2fA0z+O+LzCXSaU31FKkhKIeFakRbEzTiUZBnqyvmMWYshRwPckcISwcb5t6g1Le+CqL
         I9NRfVJj/qHELjAQNeY0EUoysmJI4nHTp39SKZCTr5kdeRTyJcGTZTEW81MM1+YwRyWX
         ySIm7EjdRYC6F+irEcj5p9oi4BMuVrZD3TxYuRPl8jMwZ8OctdEDZos8oni5xLoI0d4B
         Fc5Q==
X-Forwarded-Encrypted: i=1; AKwUvBwJzd9jQBVWcOdplS47OXpb3Ny/iJmRQsDxeoxHEsbENhfQX1WmbIi1yusrStl0ahCnH7l3J83Vcaxhe9U=@vger.kernel.org
X-Gm-Message-State: AFuF++nJ+9Bx5OxlVqVuBJtPw5FMPxhWeUr8jHcQ+9uein7pXq+NiKHQ
	ZJ5CbaqiVRuY+aohvdROurFOeKLrFVQvxJT5sEXMglcFFimSencKWu0M
X-Gm-Gg: AYBFou0TMX+gabkRu73EP611f2agUo2fkZEDGxDyHaH4ZrsKWKtrTiqp4CkFFA6v3Mm
	YArEQFQwoCB/R8TPSshrirhnFkTCWZEIfu5gi6hCC/kjBnzIZYo+HjhTMxb0ALOedSnxauS2csW
	nuxYnR7JfSEdNv5tl3pCM7GVYsA+epnm/QtOTFdKEq0bxFdQx9CHYuMLiAaogp+UVdkOij8FZKW
	c6X5+Yq+q/mdQhFEcSW4Wu7jLaBK5tSPfUvAWLwhLtwJ4PHwaYCYar0vkU17x9niqpWzWlxYIye
	Gw6glhXhWiQNbWhd4MB6BbXyl6JELg6uhNnsDe2SummjhKS+A8OluOoQMZWYdvSC/zhZWkrGOz8
	ere21bFCZ2sG8lM7Qpo6qapM+hhM0Vd77mVLW5qlFYw+SxpTPBvGzYVrxwa+83YLghl7vI6FS0Y
	TMh445JJkOJch5cORbFdtEFF18Ps+yonw0BZ14oPsiipiLm1+AP7K6ZnQPhVKLF2ZAbt14wUMs1
	tDQni00maw+r6baByn0ERs=
X-Received: by 2002:a17:90b:5826:b0:38e:7168:281 with SMTP id 98e67ed59e1d1-39b261b07b6mr57273151a91.10.1788986741452;
        Wed, 09 Sep 2026 13:45:41 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d770a018fsm1431244a91.2.2026.09.09.13.45.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 13:45:40 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 9 Sep 2026 13:45:39 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Hemanth Selam <hemanth.selam@gmail.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, linux-kernel@vger.kernel.org,
	linux-watchdog@vger.kernel.org
Subject: Re: [PATCH 1/2] watchdog: fix typos in comments
Message-ID: <af8dede4-ac67-49aa-8f60-bbd5cea798b6@roeck-us.net>
References: <20260904113744.19872-1-hemanth.selam@gmail.com>
 <20260904113744.19872-2-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260904113744.19872-2-hemanth.selam@gmail.com>

On Fri, Sep 04, 2026 at 05:07:40PM +0530, Hemanth Selam wrote:
> Fix typos in comments, reported by scripts/checkpatch.pl using the
> misspelling list in scripts/spelling.txt.  Only touches comments, no code
> changes.
> 
> Assisted-by: Cursor:claude-opus-5
> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>

Applied.

Thanks,
Guenter
