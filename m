Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78E9B5275AD
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 09:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790068220; cv=none; b=ngrmSTLLTOwSG7NLx6DMajqAXM+gnFDoPZVjbkV0OJ6+siYC2d2wXjXmXdoXLIPv7otnbIkrtjG6TloKfdlmJOa1GGrrgDOpuXtBXVH9FAebJme85gRC57odDeL5HwHBD46WlF/3ZtRSVSDrZavx3OIIBIvXZLXz0AA2xnybHTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790068220; c=relaxed/simple;
	bh=wkOW124WuFQQCipMuwELLw27Qx4x1bj/S8RRLSKncZk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bsrgVaeeQJqvpnPnpasgjn+wpSEihushofnlr4lM4oQT31xYdtkAIviGa9yaC9487hKO4DmgBZfpgms5Lf3wFQdQwg95HVLvW9zGOJMkvi0gsC/QIU6wNU/vym7DrLA9/Iz9ulWJMNUAh71XuOQN9zmheFuDHwW/FW+6QreZLGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qGY+AXxt; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qGY+AXxt"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e69b9e16aso39358805e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 02:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790068216; x=1790673016; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=95n40ZP9Z6iTAIldKB90q2CM8xGRzAwUON6dqMEGMLY=;
        b=qGY+AXxt7623LzERg/mEE6+Ms7RT/rJ3c4pQ6qIeCUP/sUVfnkqW3bjYHDjkr45pwr
         zH1JbgnOgOdVafF0n+Bf8PnKUf5wR8pc3AOoREg2mslfPW5YQG9yuLde870ytLkWVTjQ
         JgIbaxrTrFpvt+IJhtMV7Y+SxYGznJNGW27XYYTS5PertN0ho2CZSU0aNLqVzOPMcu3w
         K/aDKu4JlDeFFd4QnFRZTVX9NH3lt9fhDrcLWggaMsnDP8uH4c44bHz75iEhep1s6cDg
         hlqEAzSwHoFO7czr2kOTEZGzfvDfum/gMjMzEzq7zsdG/KsmWoNj1p0RHihsNZXqgyQr
         R/qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790068216; x=1790673016;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=95n40ZP9Z6iTAIldKB90q2CM8xGRzAwUON6dqMEGMLY=;
        b=fXTJnSv8Pj4iWalT7Th7O7WuuCoQkC68I1Jch2bBRfPV6kZsyQemhRBE/UQ4ixMmSY
         72tdolzAW4To0lT1O2OJi9SEE2DRDZmVJWs8CZqeEOoEX9OYBEUjkQ5W461aa0b7rxCG
         riMvJm7LjOVSUm9C4zkZAdgtEspnENhJ6kMwuP6v3dRJXUO+rm90SFzlN3PiyYt6TTk2
         jtrAbpuqDbpZ29mmoO2XXGjy9ug4TU7zHAi1mUi8tjp9SLdCrhNhnwBXfwGxm/GVIwlT
         x91yx6ROwAHYtGebhzj2hRmO62OkqZXVhXzzqNoC0Pl3f50m0FTMmdR+hhMe+9YUj56d
         6G+Q==
X-Forwarded-Encrypted: i=1; AKwUvByjyEYfDYoxarGynima7kDYUIDhqrDcYWbMfSSCtaIENqauFaVZ2WGhI+ifyv+1skBh6SVkfwQpLvmE2fA=@vger.kernel.org
X-Gm-Message-State: AFuF++kiRUy0xk5KVND3MdMjFf+dYw/FXG1RYRx4vL5Bz3kNZIt7cjRO
	MKw3iWqFDBHnITW6sCtYdwXSlFvgLjErar/9SVidm630vdnHXxWbxgFd
X-Gm-Gg: AYBFou36XjMELTf2IzN0vsI5eEwQfLgKNZtmazD6n+vtGsYEzzujpLC42Z1gZgDU8s6
	zZJS/QnY+5NcuXIjZsDQm0dhFjNc3s70HpHdtB1R6B9BTb+lnfFdfIFb76b/3SZmKIAYiyK3rnU
	7DMWWnstoeeKpVQroM7YniIIZzZkCcQnt3ZkIX0o6h9T8X0fSsU59nr9USV0wtn1jj63KbnTg3H
	LjSJJ2nU++L0wjsZe7CrRx1A69RTaDW6SmEj+i+C+pkayfnu040byzpZTkTvGowsVahnhulVsZr
	6KNShbqKl4b7PDs5pjgpInvNDvFNKmZ+KAK7fLyaT/eaJ1qVcnbxYPyVsWLJAR2JemTE1bs96vs
	sfjnTWz0Wc6t/SrIZ80RFlwr2yS5vuVAII0vjOrJYDS1RjJ235BNuxfvsG5PzAgQKuwmcgY6mjt
	39sOH9T14NBwOjirPSSOE7tWLJ0uWYVTWhlVkzfCSrlacloxPnRU4nxy+1I7BO751deFxP3CEfs
	JfM/+kySgw1UYPbabEyZvPdHEeuzkl55kVlg18w/hCQsLNItJEwEOUxEcZ0OfcZjUaXxHGUzs+u
	F2VO
X-Received: by 2002:a05:600c:4e16:b0:49e:8377:c880 with SMTP id 5b1f17b1804b1-49fc574a641mr164997875e9.33.1790068216048;
        Tue, 22 Sep 2026 02:10:16 -0700 (PDT)
Received: from andreayoga.localdomain (93-42-14-189.ip84.fastwebnet.it. [93.42.14.189])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fda8f04f7sm57710925e9.0.2026.09.22.02.10.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 02:10:15 -0700 (PDT)
Date: Tue, 22 Sep 2026 11:10:13 +0200
From: Andrea Parri <parri.andrea@gmail.com>
To: Christoph Hellwig <hch@infradead.org>
Cc: "Darrick J. Wong" <djwong@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	Joanne Koong <joannelkoong@gmail.com>,
	Brian Foster <bfoster@redhat.com>,
	Damien Le Moal <dlemoal@kernel.org>, Hannes Reinecke <hare@suse.de>,
	Daniel Gomez <da.gomez@samsung.com>,
	Pankaj Raghav <p.raghav@samsung.com>,
	Dave Chinner <dchinner@redhat.com>, linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 3/3] iomap: don't lose a failed direct I/O bio's error
 when zeroing the tail
Message-ID: <arJF9USiUqIEWB1M@andreayoga.localdomain>
References: <20260921083133.2960-1-parri.andrea@gmail.com>
 <20260921083133.2960-4-parri.andrea@gmail.com>
 <20260921223432.GO6283@frogsfrogsfrogs>
 <arIT5A3MR7VtCeba@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arIT5A3MR7VtCeba@infradead.org>

> > Why ssize_t?  iomap_dio_zero returns int, right?
> 
> More importantly iomap_dio_zero can only return an error for a
> logic bomb assert using WARN_ON.  I'd suggest to simply return without
> an error there and remove the handling of the iomap_dio_zero return
> value entirely, as it clearly casues more harm than it helps.

Agreed, that's cleaner than retyping the local.  I'll drop the
zerror/ret handling entirely for v2 and just call iomap_dio_zero()
without capturing its return.

Darrick, that also answers your question, the type mismatch goes
away since there's no local variable left.

Thanks!
  Andrea
