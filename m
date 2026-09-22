Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 152C4492E32
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 19:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790103616; cv=none; b=s34IiQ/VrW8UQGoovGZWJRnymAxPecUKQwGUsp+7/SZLN1ZYX+6pZJPBQ6AwFHD8lK5xy2AhPDD1dXJFGDvDcHti2byXPmIi1Er4ClNP5mYt/18caSkbAnaws2rudufWB6wXOfkK9P5SHG7jFtQPWjtyaw7B+Gy7SAce47zSAKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790103616; c=relaxed/simple;
	bh=lwDc/4soCDTwvQjj3WdMQO97x7jDvcnzTKVIHsRmsDA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WiAc3IEr7AsQTrNTugHpJb49u6F9Lj6H+WQnQTqhrWyDFB9UoOkIPKw94P4m3M1vjvsRp1DZaiCGc4cqreg7TQ9sdZ5E9koqbJy4CmjPA2P9cZpacHvM6afiD7Dg1bULa+yUyCwX+g49SQtEnRjYrBl3VW4eraEujSPGZYlEXr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c+EmNE0m; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c+EmNE0m"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49d1ca5b0d6so1159085e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 12:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790103612; x=1790708412; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VEpKCI2OAMvJmBnkvfe9WlT81W7n7zUyoGhbmIGEDGM=;
        b=c+EmNE0mpDQJ4eQlQ3ZGiNyv7YTSwhfNQurSkejNkS44k+pXfE0klYjsX7RzZrkJic
         c6oX1x6oMQIn7dUBf4VpoNGj4PQ6oXwuPjkwam+Dvy4U2IrjfEWd8NQga/SGelPQXKEk
         2Lt7KPGaJjqktxVLLTMm1tlWhgHAm4mFp/hSjJnDpRQVZDxugIJ0PRn1wBfEsB7NZmpv
         sNUsQNi0B/RFVWwtmcRIslHs35nPDp60e8MGMHQYfgYWhnmRzs/t/EO5q94T4FbjEFN0
         HJDmMpq5qCPmrDSk31mRCfAfEW+ioHwkk+wPLaNqtOfqSH0/Zjr4TCBo2HdhN7Udw6lR
         trKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790103612; x=1790708412;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VEpKCI2OAMvJmBnkvfe9WlT81W7n7zUyoGhbmIGEDGM=;
        b=iNEMpawtLaeZN68enr9Gfa5dLHcoNKWEbGtpecAbISmVOcyLArYVu1/LT+ccoHlGDC
         kecMFh+OVF3syANA75zHIr/tgha5HC7MQUTJF+Um2LJ00YH3/OadAs+6NmUiu4K9JMiX
         CgAt0at0eoNrUnhjHPqzhV5w7L9usUhjxaCdUJ+DQFRZtNY8DVnaGm8H+8P3gRL6/K4l
         M/OgODRXFUbSEiQ4TDG2WReGJmKlGlG7G6Ski4D5WSJp+wjfVTCnFIQKsq7h1V1SXgcq
         EOewZWffMAHA5CjUwbOSGsQOnnqgc592yRtTsYFubg2F//iEV7sEY3M+K8h/eGguujkh
         eJQg==
X-Forwarded-Encrypted: i=1; AKwUvByErRKBFQMDdn0cYVfFx8kCeT9nDbNc035z4r/LfM9jYx/VQv3wGbIAUxVBWabhhhMnSGF/QmbduBFMB5Y=@vger.kernel.org
X-Gm-Message-State: AFuF++klW1S0m8RtsdHhbTf4hVJRT7V/Cg8YH7wCuA0WOBJz9sjRnsa6
	ncKOmQg6JOldgyKtbDW5CX/mLDAJ/PhGr7DOv6mEMkhQZ7MML0YKHpvz
X-Gm-Gg: AYBFou2ZV4qn+2QoKLau3bvVw49bAFoOPT5SE73PLaUhrEh2MEc331CZhnFB8Kz2KuG
	aisdOGscASIuKNHq3MZmr9EksOx9MMMViq5w65Xu0O/8czozHitb9XinHfS0bz/wFJbwo8s/fPj
	p42JYsG8yDmByDXMlw0Km5db9V1VrM4KqZ14EacbLZKgSJ49q/7ZJH/+B9qG7yAWpHpzBfV86wd
	gB8FmNSAOWHxVodg2RgQVAiaPG7acY86fkwavLP+zE2+LNYtYpoG2lsR2TEU0N2yRNwMgFWgPoj
	d84EQGUaXsfk3qlECbbAyDM5qWjDqUjQijguTCNzLrhBuA+A1Z/HnvXo8WlBW6ueHkJim46elPb
	m0wtNX6SmmVLCsbYKL/nbmM7hLMtpzvAzAaz/AG7wfr7dORVWEqimeFWog1Tc6iB+0ZTpqAudTT
	20ssG3arcZZzcDHtTVXtC4kpiuydizApbSFEMIrtViRQCv1yHGpW7GGVKvVfWUyXItwgUPU+l3Z
	bUAPsQHDPn26zx38cCFTHNK/zkemK0x7qSnqYdun5BwpJs=
X-Received: by 2002:a05:600c:6297:b0:49c:fe46:7219 with SMTP id 5b1f17b1804b1-49fdf12ba37mr1731935e9.20.1790103612057;
        Tue, 22 Sep 2026 12:00:12 -0700 (PDT)
Received: from andreayoga.localdomain ([31.189.116.68])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4886876c48esm418281f8f.20.2026.09.22.12.00.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 12:00:11 -0700 (PDT)
Date: Tue, 22 Sep 2026 21:00:08 +0200
From: Andrea Parri <parri.andrea@gmail.com>
To: Christoph Hellwig <hch@infradead.org>
Cc: Christian Brauner <brauner@kernel.org>,
	"Darrick J . Wong" <djwong@kernel.org>,
	Joanne Koong <joannelkoong@gmail.com>,
	Brian Foster <bfoster@redhat.com>,
	Damien Le Moal <dlemoal@kernel.org>, Hannes Reinecke <hare@suse.de>,
	Daniel Gomez <da.gomez@samsung.com>,
	Pankaj Raghav <p.raghav@samsung.com>,
	Dave Chinner <dchinner@redhat.com>, linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 1/3] iomap: don't resubmit an ioend after
 ->writeback_submit() failed
Message-ID: <arLQFnituIhphayt@andreayoga.localdomain>
References: <20260921083133.2960-1-parri.andrea@gmail.com>
 <20260921083133.2960-2-parri.andrea@gmail.com>
 <arITIy2upsoN-DlW@infradead.org>
 <arJETViXYZbX8ckp@andreayoga.localdomain>
 <arJ0qe1KZoIaRCQk@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arJ0qe1KZoIaRCQk@infradead.org>

> Can you add an errortag in fs/xfs/libxfs/xfs_errortag.h to inject
> such an error and write an xfstest that uses it?

Looking into it.  Running a few more local iterations both w/ and w/o my
fix, the plan is to include the errortag patch in v2 of this series.

Thanks!
  Andrea

