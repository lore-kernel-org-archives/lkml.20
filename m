Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D652848DB30
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 19:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792177983; cv=none; b=NQAVPnLHKIq2R0dr7mCQCPH+fIcZrd8JN5O6MZSq0SI/d42cs2WV4fukdV0N5EhNz5SDYa76SUrkO4N7pWeqre5PiJLC+ZvmfILAkdLkmbp2nwcHd5Y5sYlbmbTB+Xo/jslY6HxyJLCrMihIOm0TKcDVCgi9bgEXoKjPHNppzgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792177983; c=relaxed/simple;
	bh=SuEs0VC4ZxRrh/SlRaM5hxVO3gHCDJyCOFm9YRH4SIo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aAbWd2ZfSfsSgZLUqpUmj3CaLGcE+ohtqORIV2Out6CQ7Y8gXrZxzF32behwgKRMNqOunTqTJHiXOMbpgVEkgwBnF3BQvYvLTb5RKWbBmeoJLnTtqWiPmkVN0tqRhyz7kJvjje/7nc7Pu7YzD0GxzhDAGqQ4Z3edQ2MLhujGdVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tu4YGEHd; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tu4YGEHd"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-8aca68653e3so996137b3.3
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 12:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792177981; x=1792782781; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SuEs0VC4ZxRrh/SlRaM5hxVO3gHCDJyCOFm9YRH4SIo=;
        b=Tu4YGEHdXzh8vt6Yx2Pe7T0dmaI5HIifQ1GycfC1+2alVuEFvzO2LYkQiUE1Nae41B
         eAXvK/cM639GXNcSggu0Zusv3Hg1yh69R5qhAOjbJ9x97Cm0eu1Wz9EYlnXn/YltebRU
         +WjkkANoa5I9S/vZUX1g9s2f4d9tUgQpfg9lFppeNWZ7TlQ8snf1Y0hJfv7zezAvWNa5
         X4ji6YrOgjPPafjo/pWSC0sH2lt8m76sqE6fYIHmAZbtQrkhJmE0TKw7tOcd4Ia1/+fK
         I39TfSqrZhnXTj7RF+QVwAJp7Gro+Mq0o1RQ+sj2SYNWCGnMMpCfByYL7CbcH70nt8xl
         5B8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792177981; x=1792782781;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=SuEs0VC4ZxRrh/SlRaM5hxVO3gHCDJyCOFm9YRH4SIo=;
        b=jNSFtyS5F4tUOwkEg7wG85fB19r8bdAz2EHah65F/JfqYYfbt/s79IaX43ecgVrIh1
         TCK+HCpxbAzchlAMcalmFOCu7Ir3A1UQblGr097g0D6YR/E6y1NMueJlXEk5nFR/Xvpe
         97SC7wwcQGzwaHKcMdXoRuR7ZZNNtJc4MKhVVX2LwOt+fPabnZYDg2zR5kJj1biZfiLI
         REMuJJm1wkt2zcXmbPAB/BmVxA/Olt0unl7pkZi0uuBmSxIgmCnPLSslZmdb3DdjKKFF
         gwCR1IS/mNP64TLlCV3oIyaPgwsa3SO4sHyGqtsn93rr8u+JohQEzgSLRjDODdgdjB3f
         SVWA==
X-Forwarded-Encrypted: i=1; AKwUvBzItbV9icZbfjoMfqved9zemZ7EmDoPT5sUTpOHPgjn7Us/Ilcs6MvMeN8YKebHzcIDq89YxaAGatknI5A=@vger.kernel.org
X-Gm-Message-State: AFq9FYLyIO1Pq8DKcEqvGiyuEefHOoes7bEpKz2zTy9aSoOsqf7vwmlJ
	IAew+0M25f9We00FSHihljAuRXGhruQ3nhQ6f5aw3z8H0zgvLsrMMPKk
X-Gm-Gg: AYBFou3GWWvWlVOz5AEmynzpLecVH4WdYZ1lOUF8QnuoRh5xGnv/0ipuNBrCMZzV4/F
	nybhnhpQS2gkcZIHhbnDJDbi9JRCr6dOL/YY32N09eOurT9Ix/D2G1+MmZxfMGwKvMqQFt7o7X4
	RY1994s+EEk2tR7FEJPD4ENI7A2z7pDfVCAUrm+I8tpqm0etE+cX+G1Zncs4hRg+/igXxh/e+Ou
	0WFiMvp6v+K4qNIajf4AD8oJ4gDXbPXLx/5qRAA4r7ji620y/phHjRSEnkaS7QeXE0kCdhUGyX3
	ZNxlSbLUcoIcFUh4Rbi6AYK7iuzp1phyTJ4nOovGDfcKCEx+QiL5HFs/1iBx9YolI4X1WkD18TX
	DIDM66uhF/PaP/Wt6+7Zw65S9Bgd5Si/3TqSY0kiqF3TuWnB4TVtCQ3iAd88saRL5uvAd3avrzw
	fSl8qJXz+YLLW3yq3x7EYWbSj5LxhkID3oTTfcQebEmocjp/p+t3YG
X-Received: by 2002:a05:690c:788:b0:8a8:8456:a970 with SMTP id 00721157ae682-8b0f21e9dbemr3970507b3.68.1792177980610;
        Fri, 16 Oct 2026 12:13:00 -0700 (PDT)
Received: from corey ([2600:1702:5081:b900::49])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b0e58c80a7sm13103557b3.22.2026.10.16.12.12.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 12:13:00 -0700 (PDT)
Date: Fri, 16 Oct 2026 19:12:57 +0000
From: Igor Malovitsa <igor.malovitsa@gmail.com>
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: bpf@vger.kernel.org, daniel@iogearbox.net, andrii@kernel.org, 
	martin.lau@linux.dev, eddyz87@gmail.com, song@kernel.org, yonghong.song@linux.dev, 
	jolsa@kernel.org, memxor@gmail.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH bpf 1/2] bpf: Load ringbuf consumer_pos under the spinlock
Message-ID: <atJ3KJn1TVK8Oo-h@corey>
Mail-Followup-To: Igor Malovitsa <igor.malovitsa@gmail.com>, 
	Alexei Starovoitov <alexei.starovoitov@gmail.com>, bpf@vger.kernel.org, daniel@iogearbox.net, andrii@kernel.org, 
	martin.lau@linux.dev, eddyz87@gmail.com, song@kernel.org, yonghong.song@linux.dev, 
	jolsa@kernel.org, memxor@gmail.com, linux-kernel@vger.kernel.org
References: <20261016003318.529860-1-igor.malovitsa@gmail.com>
 <20261016003318.529860-2-igor.malovitsa@gmail.com>
 <DM6EA4NZEW6T.1QXD6YWB6J9JZ@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM6EA4NZEW6T.1QXD6YWB6J9JZ@gmail.com>

On Fri, Oct 16, 2026 at 16:14:44 +0000, Alexei Starovoitov wrote:

> libbpf writes consumer_pos after every record, so this load is
> a cache miss most of the time.
> Today it's done before the lock. With this patch all other producers
> spin on the lock while this cpu waits for it. On 64-bit too.
> So "Neither changes anything on 64-bit" in the cover letter is not correct.
>
> imo it's not worth slowing down everyone for that.

Thank you for the quick review. I do agree that a bug limited to 32-bit,
requiring 4GB of traffic to reproduce is not worth the trouble.
The reason I raised this patch is building a formal model and
discovering there's technically a bug. If this corner case is
not a concern, I can abandon this patch.
The second patch is zero cost, though.
