Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C34D305698
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 06:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790578652; cv=none; b=TRY6P8esvfg8xkVubthEQKYTbI8Sw9F7BeKEu4xQfUIjxCRITjXHwnoo1ZyAG+RwnbtkSxxaxuopROI3ThUBa2Z+oCZ0aNjnbYhjxRO9005T4bBzAA0MHDi7sllP5AR/bdLcZm6Z3ZYLip18a07ycj9tfAqba8rQgwRR6JJj06A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790578652; c=relaxed/simple;
	bh=iOLqsr/1Pfab3GjsjU48cf/53tj6Xn2AGw1oUU82SE0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aCV944jUNs0CgzfzUpJ+88Eli6PChD+Go3aTvDPt66ErJ1Qqg1uX6q6rsD3P4pP7wtipKv75ldheBX9lKIXwPBq9+Q9wBzYxIkJKbOnuzOdinpYEBlzG/icQZ/CqJjnzFnmbmYf5bqAXDfLkhSBVQpoRWV2HmsHgsVxWbdLb+IU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PL+E3Ce2; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PL+E3Ce2"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-488780459e2so2652403f8f.2
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 23:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790578649; x=1791183449; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=M+uv1v96meiRGy5jfT/pRvcdeWPwSROmpvTYk5wo6xM=;
        b=PL+E3Ce26eBaVIYWytVt8AiDxUTFZ8Q4RnMXDfM0/ep2ACua7eYf8Ud5wx3+uBuVMY
         I8QApa1DMkYNj+nKyrYLx88btAHJ+OJy6YXqFgDJsum+YaIjALHAGb0XuvWMTcmdAkkw
         6L2wqISF5EW9mGSBwFtDUUJmazhOVcS8Y6bn7SJjqf91F6Am51mLuSGPhmwjcgW2bIfa
         0kwhOaiaigrP4rzQZ3zl2REKpZw1tUAAqmrgRIOoF31DmfFlekXftWbFZCyBJec0bOaW
         S1T6kqQb3Fc6MUWQPv2Cl5OQesBscGPkkO8w8rJHanLl9Eq6zcZhLmbKu6eSiyvpeYy4
         7FqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790578649; x=1791183449;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M+uv1v96meiRGy5jfT/pRvcdeWPwSROmpvTYk5wo6xM=;
        b=AVE53I8wzY0B3ZdWwYSH3f/uQbPaqNdq6tj9EwjIl0q5KmiXe4Rlnlo2UoYUKUd5/P
         7h8aOZi4eAipjdpBbeGWVm2EGfOzCqChF9BAXAhTn2Mo7u9BKWeGydNJ/MIDkJK+aRI8
         7/ALbiNbn3DbWbyh1ETM38uzzz9ZWka5bgaBq0V9nvwkTTuczWwj1N4tuzEefnX0285a
         GnUjpbDK8vDl1hSJGmQvKdggzPDf/fBID7gLDk9flvUELSlpgGr7u5A+rtJ24yiAi5vs
         mA+BADoKfJJD/gIAEMMCr7Q1ohACH1wPTPNqp3bskUP/h5R5Pj3f2LAq7Zm+11O0KWZv
         dSVA==
X-Forwarded-Encrypted: i=1; AKwUvByWQxFbTm7HSBb0rCSJjryYY5wbByB1E9ufxlN0SzTWa4X4jysDwErw02e/3SF4atyUWXDC3vO+FckXRXo=@vger.kernel.org
X-Gm-Message-State: AFq9FYKu4Z0BH6JQvtG4wBPdXoeaCWXUvJ8CQJkbgsnD8szGjG9OwDSc
	owrFSLr5ome8dzqjafXZTZ7BUNhRnFMWdyp//5yVyrynuWQ4gYmkVOKT
X-Gm-Gg: AYBFou1uBVMc8ZJxY1GoSOBgnigL5xfcUh3LHpoT3ei4hFZT88glMLvDXhA0kf9Hhd9
	zrVE8+2v8NbZn7SzQZOrEdfs+d7AFiXS8bqsnD5bD/VFK158dwcLonnyM48Tp6iFz15sCwbcC1d
	RzV8H/Khm+3NmnFsttscNA8sIC6EJGMOspNuMP9uZqXvnLDAUz6pCnqLUC5p19rW6l0dZ0USpE+
	G3FH8fIOXAy/PXIM+6xmFgZGVbwzdMIy28d1RdkBDs3NIvx15FuB+aUxdu1JKiTuT02I3Hws/m/
	joZO7bBgps3A4pbpvfNhu4sGlE9tutBMIOPz1qZEZJ5BzhN2Ly86oWcQiWLi9Hzy8xVOwK2ZqnP
	2E5EsN87OTXxo+whY6MywiO1ckZAnmq2rUMKyvjx53Rw5kz5F9Npq/K9VhLkGGiH/yd5MS996FE
	j+3IyeHgMJ6R12bnGLgzf9w/GXMHNa0IpS5yfQzZv6p6UJIn8zkyFAL9MVWVR1jClom04=
X-Received: by 2002:a05:6000:4545:b0:488:7d08:edbc with SMTP id ffacd0b85a97d-4887d08edf2mr9877854f8f.24.1790578648847;
        Sun, 27 Sep 2026 23:57:28 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a64ed6esm27630582f8f.29.2026.09.27.23.57.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 23:57:28 -0700 (PDT)
Date: Mon, 28 Sep 2026 09:57:24 +0300
From: Dan Carpenter <error27@gmail.com>
To: Philip Li <philip.li@intel.com>
Cc: Zihan Xi <zihanx@nebusec.ai>, pc@manguebit.org, linkinjeon@kernel.org,
	ronniesahlberg@gmail.com, sprasad@microsoft.com, tom@talpey.com,
	bharathsm@microsoft.com, dhowells@redhat.com,
	stfrench@microsoft.com, linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, kernel test robot <lkp@intel.com>,
	Luxing Yin <root@tr0jan.top>
Subject: Re: [PATCH] smb: client: avoid NULL resp_iov dereference
Message-ID: <aroP1B0gG2Mhtjzf@stanley.mountain>
References: <20260926132208.23360-1-zihanx@nebusec.ai>
 <arkuJtmhKDAFnzTl@stanley.mountain>
 <arn+UIhVhM4QDP0c@rli9-mobl>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arn+UIhVhM4QDP0c@rli9-mobl>

On Mon, Sep 28, 2026 at 01:42:40PM +0800, Philip Li wrote:
> On Sun, Sep 27, 2026 at 05:54:30PM +0300, Dan Carpenter wrote:
> > On Sat, Sep 26, 2026 at 01:22:08PM +0000, Zihan Xi wrote:
> > > compound_send_recv() only populates response vectors when resp_iov is
> > > non-NULL. The final pre-authentication hash update nevertheless
> > > dereferences resp_iov[0] whenever all compound requests complete.
> > > 
> > > Guard the update with resp_iov to match the response-buffer handling and
> > > avoid a NULL pointer dereference on callers that do not request response
> > > vectors.
> > > 
> > > Fixes: 62432a3f5145 ("cifs: Clean up some places where an extra kvec[] was required for rfc1002")
> > > Cc: stable@vger.kernel.org
> > > Reported-by: kernel test robot <lkp@intel.com>
> > > Reported-by: Dan Carpenter <error27@gmail.com>
> > > Closes: https://lore.kernel.org/all/202609241449.HlHmnZFZ-lkp@intel.com/
> > 
> > Originally the idea was that I would review these and filter out
> > the false positives, but these days people use lei to read email so
> > they recieve the unfiltered warnings.  The zero day bot should
> > probably put a "Unfiltered warning" note at the top to let people
> > know the warning hasn't been reviewed.
> 
> Got it, I will add this note to the bot report for unfiltered warnings.
> 

Thanks, Philip!

regards,
dan carpenter

