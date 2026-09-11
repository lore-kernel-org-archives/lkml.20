Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FD955476E2
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 19:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789155395; cv=none; b=s09ZbpG1SXt4YthhPJNPnbxRusHTPhWnlBJKv5GvsbxM8BshdlbEfXTzrwPTPxPPULK7XWM6ukNtucLLWS+3d9TWdDAZbvzCEmlUbcWM9qnowt9FgnwrRS4WPuPbRknOpuyp3V9/hJv++K4V/Kr5voEntzr0ws4osWjojXa809c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789155395; c=relaxed/simple;
	bh=1QNZaSkFmE4tUaovHwbMXXOSGp497lzxUR4sBldDwKg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XFHVn1N8nh2vaIdXsl2tSsehtSVT0Pn6tatF4hR4FvOXB3oLkyZUgBduq6WyLZdDQ2/FY2y8oZPTg5KmvuNtwH9yAVQfHdqObFecBpUcOvGNeoBeBtn05H6DV3LqZ93oZUACgmiWZTRrKfwU1OXuNLW/zL5PBZa888aFctYuj6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WPf6JHB6; arc=none smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WPf6JHB6"
Received: by mail-qk2-f13.google.com with SMTP id d75a77b69052e-52fb76ef1d1so2941401cf.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 12:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789155388; x=1789760188; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=i+/XqoAmOedtSVBSjps/IKUOstu2oAlhhf45OFikfSI=;
        b=WPf6JHB6kiWwnB7Bpc45W1aexnt451pPBy1AKnJT3Mk6Tnc7tCIlia4Rx7vBoyTXTX
         9ZX5rRNwrR+/9jiaN+SVeQxeYS0PUVXVzqdWnhqNCK2fPryq8V6fII9c4xOce+mJOZTD
         WLwv4w1FMPbegpeAwUkx6WU+fX4GQaldBy8PsAdLPEZYZB1YnKGNJ01Jr0qD9IBft9IU
         DiZvAhj2jUx/wV5H/lgCG/fDsAsZpqbb51P1DFrpNFX5+rHaQHECtm/jrBsvDHp5MH4z
         mGCEUF55H7LvH9TNSpccoJL+b5CRWBpP6ur1dfNSLU8AEbMh1+yniXRA0OAxPC6sQU1h
         djvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789155388; x=1789760188;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i+/XqoAmOedtSVBSjps/IKUOstu2oAlhhf45OFikfSI=;
        b=Vo33oHYffl81//RAjhcc+f4L0QYfjTTTjPD47xHdJ9FFduXEqjwMsRji9XRmhGXh8m
         /mbv67J/QZMG8EzaOlMLIDjQ0heGY5POm9SWcu5ZKUN5Mm/WullkNkUYPLinu7NLvTaj
         54WUHUS4XWgzR2fwaMsgeSII+stBusfX8XQsdlkCRUcwn8I47VONIJxmoJDinak89fps
         RLbFzdynFjwUQwbT0RqYmqThyrM9TRbZNFZSIas0ZZ4DjkoCd0f/ww+pV0mx02FL2/Dg
         SiBZz/Nv+uKD+ABSavf2EIBuAdtP16vKQWGptqaAxinXTIiWznhO3jJdgjdGMAMHq8qR
         noHQ==
X-Forwarded-Encrypted: i=1; AKwUvBw6oVqXewyl+JLHqqFdPvY6yBolRDfVvfUUKlB1W6SAvtP29JsmhHNh5YkhK5nWTp9udMKzbzDhvesgFD4=@vger.kernel.org
X-Gm-Message-State: AFuF++lODbcWvYUzTYZ9EadYfLu8eF0QFnD1PpIanxJYesNScP5AW3vP
	HLJMwhQOPu71tlSG6jLl4F68YCLLVfFwZIiJg1mIViGaZevFiY6M7bHy
X-Gm-Gg: AYBFou0C71cfHttZM8odorwuiD54RtUSSvnEgnhztlM6qDOOUDC16DO4vmUNdRAAr5A
	f+nFR7QzcplsZg0gCM3OSHJTwSmHqQuzI/tkghV+2e09fL7uE48CBHn42zhUH+f2dItHn+/dDLZ
	oKcxgUf0Sv/NmVFzHgIfwyCDQdsFpF/3R0xkwK4Pd5jnBQOQOi4oHw8ud2VbRrFpzrGCzu+or/c
	ZaiMOGGluD0H4T+hr1bhWM89u2/sRg/qLDBxSOk74xgvi7ewYHn4i6ULkUHFf/EESZV57BgQcb7
	PJkRsfO+GX3JeEVRVkS3EaE6uhY2RrSu2wmQA2lb17EoPbRyvpA1RKkhFjCh78QWU/AMOsEbW2r
	vZ/hjyzAIVxhkFa5xp7NVxDQ7Q8u6hmjO32/LFAZ8i1+jd6mcWNqM2Lg3XUbLnSo4OYNNAyifN3
	od6fpUUxvTiECPTtcH/2HfHMDgD28/4FJkcIOW0JaiZlT87e3SAqWLhjMxGj0RxikOzHw=
X-Received: by 2002:a05:622a:507:b0:527:631:8d6 with SMTP id d75a77b69052e-530c859b38fmr80771521cf.25.1789155388428;
        Fri, 11 Sep 2026 12:36:28 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-530ca4899dasm27027761cf.12.2026.09.11.12.36.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 12:36:27 -0700 (PDT)
Date: Fri, 11 Sep 2026 22:36:22 +0300
From: Dan Carpenter <error27@gmail.com>
To: Matthew Zvolsky <matthew-kernel@post.cz>
Cc: gregkh@linuxfoundation.org, vaibhav.sr@gmail.com,
	mgreer@animalcreek.com, johan@kernel.org, elder@kernel.org,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: add missing newlines to sysfs_emit
Message-ID: <aqRYNjOCTRBIZtcG@stanley.mountain>
References: <20260911190253.894650-1-matthew-kernel@post.cz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911190253.894650-1-matthew-kernel@post.cz>

On Fri, Sep 11, 2026 at 09:02:53PM +0200, Matthew Zvolsky wrote:
> Add terminating newlines to sysfs_emit format strings to conform with
> kernel sysfs guidelines. Also clean up envp array declaration to be
> static const char * const.
> 
> Signed-off-by: Matthew Zvolsky <matthew-kernel@post.cz>
> ---

This has been discussed before.  Do a search for the function
names on lore.kernel.org.

regards,
dan carpenter

