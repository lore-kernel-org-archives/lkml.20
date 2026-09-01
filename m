Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC58743BDA8
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 15:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788277355; cv=none; b=RGBz7R7b1eHy4hgJb0iB9Issc8xpPgI9q8DjI3SLCkeCdmK/PQBmdPSGgy3uibVqY6cESUQavQVCVHxUydTyOoNTVD2chVrSpYP463KB0E7EPlqQUxxg7+Cb47v57w3Td/j4V+arjqpKCxxXUNtveKBc8mjnyXNU6oztT/Z3PZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788277355; c=relaxed/simple;
	bh=RBnLTyQSCm6tW8zb3Zz6KWI6jSV9F+kLJd4khg4LEIs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JAbWmMlciLPMy2seZ6l+zo+/xqHksHIHJwQH8C2oqjI99k11pBKOUHATwcbVlLAkHdpnjgCPwaqtyzrYorLgJprxnllt6gDVEs4cEENZ/ygLJPSxfcLQaabH9u+TtqsStCnpvj9m4BO946rcNmvgt4RczVcnnwiX5QLmmlMLBx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=PpeAMdJR; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="PpeAMdJR"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49a97714f5dso38954785e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 08:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788277352; x=1788882152; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ieYVRl/yPqLfVFpGgKDnoBwKi1G1iwV5CrGT8xV1YeA=;
        b=PpeAMdJRd36oblRB6veUx5CwvYNn0hLOz13gcwNeoTIHJDgGl3AiP+ao4ozbKR/mo/
         U2c/I8yKpsisAh2QOC4+NzD1GWUwJgbZ+44FqBDaULJiICXt1TDz0yx+pNFT3jGDY22d
         wQ0nBHK5QojJabwZV+APm/hSdWzB07g4fEDoZ4OZ96yAB6Yl8lHLEIN+mzCSajJNOWRF
         7ITqVJQGEHGmiNQMpFyY52nY6vVRuGxWV/6lQK3SEmpI31xFGp5VhyXbNNf/wmUsx2XU
         rGmKZEhD5w13TQPAtXMTbRgmrQHGp0dyDwPLq69eWupMgCD8+dmQIp5pbqOKqDN67kjZ
         SoiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788277352; x=1788882152;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ieYVRl/yPqLfVFpGgKDnoBwKi1G1iwV5CrGT8xV1YeA=;
        b=X62JB3kRqCRiea0lnCRPBlHn4tznkRwjDW1lhfGzQmYl71F4ucXkx4/sNqRaVScWPz
         9wmVZZF/vB3+dcvEJVmKHInxtyHesXg0auzE4JIAaaM6mnytKzJX4/rrPtsakvtIxT1+
         ONU1Bk09SE0B3AAM6HjJ+64eJ9yGiOdxAnul/aCkIzUAjfN+CB6nRN3kk6Q561I6uAIq
         +PwXadLuz2gRNBwVAhSAJY5WZSs+akvo0wZzSigon2Wd743f3H+ckfhWrTRFD5Zoe1qC
         aZfmXV4T/ZbS/oDNOVdUn2atHsqZRl4aWN6Y2z3YrjiRcT9HDQl+tLDxr8gGwlCASziM
         ldkw==
X-Forwarded-Encrypted: i=1; AHgh+Rqoy+Ry/z5J9IG0fR72opTCIM6miTJ9d/MEiPkhmyyTahDt/9g5jpR8mkXSraZuNCutmOsm//a92oIgK/c=@vger.kernel.org
X-Gm-Message-State: AFuF++liGL+ff2N7x/PJx/M6L0w47v9fIkzXDiBQsknrYwm4bvxSdoZZ
	RBzVoO/mdmEa+chLyRMCA5b9Rd3gQz/bUQRyvWW273VDovweRpPtSKRJcQGNowwt0PA=
X-Gm-Gg: AR+sD12vBXval4s3Sh8+PrL7IByCdL0h/2vKIdsEQLPmJFt3QfKcssdYrX60KQjnI/q
	WuAT2VDK6gK++R1QYmZ1eMJY/SC7rdgakohxF9Nv+AHFWDm2RXbUKAVOa1NPFMqBRGxq50+VSiY
	RBoWn6mOg0249wsmmSPNRlN8ICbqCdIA2NpqHYqWd7b1QVap2TgBo6J22AeApv8r8EQL/7QOKs/
	ehQiKPL54cud7RYqxPT+ZTAlG1kpTPM/Vl/6ebhnMSP+q/7TPDOPmdF455dGj57TRgk9/NE+Oyz
	DlFulP3bprxpVWD5jNlU5p1TT+aXfwGWNcnTcq+FxHuvHbARkCT/r6nus5VslEHhtZm6fM3tflZ
	Nq1x9yctAnErGsAcy7W2LN5dKzpHdCEoNzrT3XdUgRVXaf977o18mLFhSxiWc2GOHkc2xW6pkcY
	QlyOBqx/sKxcHpwNbbT4vQpgQJ8lkdmZup98SpCzCJy4j+7NjVFR6xLpZmdfdqbtYoQGgpzqyu
X-Received: by 2002:a05:600c:1e0f:b0:49b:9113:e04a with SMTP id 5b1f17b1804b1-49b91c19c77mr582161655e9.1.1788277351867;
        Tue, 01 Sep 2026 08:42:31 -0700 (PDT)
Received: from localhost (109-81-87-32.rct.o2.cz. [109.81.87.32])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b927d462dsm171147105e9.0.2026.09.01.08.42.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 08:42:31 -0700 (PDT)
Date: Tue, 1 Sep 2026 17:42:30 +0200
From: Michal Hocko <mhocko@suse.com>
To: Johannes Weiner <hannes@cmpxchg.org>
Cc: David Stevens <stevensd@google.com>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>, cgroups@vger.kernel.org,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] memcg: Don't call schedule_work when no spinning is
 allowed
Message-ID: <apbyZgB_Zu-DK8pN@tiehlicka>
References: <20260831234339.280376-1-stevensd@google.com>
 <apYXCL_GJs9Ovu0v@linux.dev>
 <CAOiLmNEV8b3TW_Q7+h5mYrZ1Nw73XcPFPUsapeYObLYajq_PJw@mail.gmail.com>
 <20260901142552.GG3004@cmpxchg.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901142552.GG3004@cmpxchg.org>

On Tue 01-09-26 10:25:52, Johannes Weiner wrote:
> On Mon, Aug 31, 2026 at 06:04:57PM -0700, David Stevens wrote:
[...]
> > There would be no guarantee that memcg reclaim would ever be
> > triggered, which also would also stop MEMCG_HIGH events from being
> > generated. Overall that seems a more serious than just dropping
> > userspace notifications like is done for MEMCG_MAX.
> 
> I'm leaning that way too. It's an indefinite error, and it's a freely
> programmable surface.

I am really curious about the indefinite error side of things. It has
been my understanding that these NMI safe charges are a) rare and b)
there is userspace running so eventually any discrepancies would
resolve so the excess is temporary.

-- 
Michal Hocko
SUSE Labs
