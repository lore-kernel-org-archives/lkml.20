Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F3634279E3
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 07:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790322167; cv=none; b=R+ic3+tcozr/6BMQnyea58m9dsZkdi8Poh6Yzgb0JufJEg5MbYce9N/uxqZI/G86mVZEfllPB4EUve13dMlhpvVyId/JxTUFCJ7E35pUslatOX0E4jetebWhUW07mqdyxPTck+oEdLE//YGddDJZ642d0GW91CXX1GDgfGzVRNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790322167; c=relaxed/simple;
	bh=4Ms1j6HDHR9POx8IQpp5n2Cvct/LATjoKlGYR8Bb2vM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PNXW5nRiedmGdNO/edmhnICdz3okTzfeJwiM+NvWSRpGezlYBwbnhoBXfw8n+9MSk7wkiDF32crvJpjmImJvhgesPYu4V6ynEy4489akWJ9dkgfSp7j+P+nQH42soXs1QMR56OIuXHIaCWlxruaeMgtsYNLBHFsAcKUAsF9kAzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HVexedt5; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HVexedt5"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-4888129c46eso71622f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 00:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790322164; x=1790926964; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zWr1PMB3Rc/UXhUDgKdBkp20G3Gj5KQDsYg0EGVPPQM=;
        b=HVexedt5QhZ3flESB+YIwesNwxvTOdgSlJoXb0w4VO7ZvvFkhcCMiirjZTX1AUcBfZ
         7gVUFFOc69/lMgr8Nmljftwl+4QOG5Vh8V5xwB19bFLgZAVj1xsrVy6XWIA8Qsp5K2xg
         hN9PU9tFl5IJ1vtXL/CPmxpyWjPQGtg+uqnvtpY6WgkgunShCAyMxTPpS2TYhwjHqu6Y
         HOtHSmt4QVM489IPExXJWkD69tAtxCPz0cxU0L28h5HtHv7fUnsyibRbS2+oi9LZNKoe
         UjR+xOrVMTnit0A8q6KyTqdn0niVGh3Kyx8QcqVHMHEsxkyXdlhhLmZgAkXhsA1pgkIq
         TA5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790322164; x=1790926964;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zWr1PMB3Rc/UXhUDgKdBkp20G3Gj5KQDsYg0EGVPPQM=;
        b=qSX/uToSgR3Z2lmFBkntTGFY6gIw4JHdYbTUqxS0/r08+Zs6Tzgd6OC0tV1S6AZcXk
         pn9+9fbD8igJySVW6E8PPYwqXQD0dJ4GwyW1cxNW4SJXWmTCgXjsJSKONqKWpg6co7Va
         JvuaSzAZqHeVWfuy/KnDQSHhPfg6TE4lk9ICT0g5us8eSrVIrMs385z5qDc794eQBzCK
         Bzu89Pk18am9jOEyPMybPrEjcL+6fe9f1kUR3jVXUxONkO9+ggT1SQyYUJ8dX7kaJw2v
         0/JFk94uuveQnOy06P6R/2gkMGscWuFZx3nWWAI+vAf4oWXTSgR2A8ZPI6fzAa0gJD/F
         M1Gw==
X-Forwarded-Encrypted: i=1; AKwUvBxP3Jv37ZRNscPMZTFlA5b1YTzmCkoTgzUYd4sIO9QYxVlzBePopLf/l8nqUoJw26Sn7kH6LZLERr3B0ao=@vger.kernel.org
X-Gm-Message-State: AFuF++lkH7Ak5j0ttGzgqpB4Ndnd1lNIsL8lyAKNVd+NJ9tWT//FgSl7
	kJAwsFRN6uljdmgumCGvhKJhlalWa5vSHgh2Yde0M+bGwu8icAAMeGziuxz3O/jxu+vqeQst
X-Gm-Gg: AYBFou2N2X9Ssff/YGqAgWUKy5FDaMamRhHKo10JtEIQGcibg076zLIw/mtBZ6NehdK
	2drAXLIIdRFqWAqN6PGtZ4Q8H2bljxh+P12hup09AYSHUI7bUne396Xi8pi23ElaSKCfKKGDFg/
	2aCCblI3i8ZuC9S/MQsL499LfOrz5ldSqZza8UocU5NgbSs7QJQReY3Us+ZB+xd57n7W+7Y65zy
	h4Alia3BylJ8Rb5HFkBcJWxslbeE9+9BhxAe7K0/tO+H0C5IOuNgaXnqyYc0dzzz8kJsgfX9Vmv
	72BIxo4NfDZmCf2qGXMOiSezXXa8CRjkMDM6rbdpH5Yn5H5FA3KRbU2GciunhV9/pgDdg2aNDIA
	6lNO4367XFIaNsjlnVgot8BLNobqySBAUAn+/2ithKIt0Yv2LlN3Ox5Wrqo3HUDHSS/bINSqyLH
	K0C6bUOlDXtSmQd6+63Vw6TlF7BgppZrwIK79cAoxBngsYhh2ezwknozx2lCzVzvEZZ+c=
X-Received: by 2002:a05:6000:4103:b0:488:7496:15b5 with SMTP id ffacd0b85a97d-48874961605mr5882933f8f.47.1790322163538;
        Fri, 25 Sep 2026 00:42:43 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a355d96sm5487752f8f.17.2026.09.25.00.42.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 00:42:42 -0700 (PDT)
Date: Fri, 25 Sep 2026 10:42:38 +0300
From: Dan Carpenter <error27@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild@lists.linux.dev, kernel test robot <lkp@intel.com>,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: Re: drivers/xen/gntdev.c:817 gntdev_get_page() warn: mask and shift
 to zero: expr='(addr & ~(~((1 << 12) - 1))) >> 12'
Message-ID: <arYl7m87hzxROT86@stanley.mountain>
References: <202609241805.VsLzGPLn-lkp@intel.com>
 <94cbe491-1b32-47ec-a9b5-bed69bc4d52c@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <94cbe491-1b32-47ec-a9b5-bed69bc4d52c@app.fastmail.com>

On Fri, Sep 25, 2026 at 08:43:54AM +0200, Arnd Bergmann wrote:
> On Thu, Sep 24, 2026, at 21:39, Dan Carpenter wrote:
> 
> >    489                          return -EFAULT;
> >    490                  break;
> >    491          case 2:
> >    492                  if (copy_from_user(&m, udata, sizeof(struct 
> > privcmd_mmapbatch_v2)))
> >    493                          return -EFAULT;
> >    494                  /* Returns per-frame error code in m.err. */
> >    495                  if (!access_ok(m.err, m.num * (sizeof(*m.err))))
> >                                               ^^^^^^^^^^^^^^^^^^^^^^^
> > These integer overflow bugs are from 2012, but I guess your patch 
> > exposed
> > the arm32 build to the zero day bot.  The bugs only affect 32bit 
> > systems.
> 
> Right, the randconfig came up with an ARMv6 Xen build, which was not
> possible before my patch. I'm sure this was reported for other configs
> before and just showed up as introduced by my patch here.
> 
> This is clearly a bug but it does look harmless to me, as it only
> results in the userspace corrupting itself when passing invalid
> data.

In ancient times, these access_ok() overflows were a much bigger deal.
Easy to solve with a size_mul(m.num, sizeof(*m.err)).

regards,
dan carpenter
