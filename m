Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 401DC39F165
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 20:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791318162; cv=none; b=s8iXEQopQ/lkO+Q2s4dczWlNw1quz22BMCq8aCM2ZDT6bylT1mJOFigx6Cd6ZzVl8+LCTsIDy3I1hRFHQzCohjmeX6PXe/l36p6QHeM8LpC6rqzLb505eNkXdsCloNvpoFbBnxtlN21IOtcjnEhbNSja6FXMbkitW/tpeRfd1Wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791318162; c=relaxed/simple;
	bh=rFVmQtBwbpZ+hy0N7xXtfJlmmBXLIt2lrMAgZCV0ulc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rWNGF6iGYRG9duth9igk3UmxHoimWuHCpUikGqXeSJJau98GDWRle6tlzwtYoyEwjozBP44anaFWkWkkUldlBvUEXXbE8D92Qf2rMLL7wDJAhU9RQc5LoV2hf6iWQblkM5ZQiXiDo0iIOrKrySQgSOVUeBvrB25ogzvvFkEJ/5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b=nWw7tdI5; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b="nWw7tdI5"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2db18e5cb56so10860255ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 13:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20251104.gappssmtp.com; s=20251104; t=1791318160; x=1791922960; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wZRugNV3JlfxpmndM4rEfelj2/GgiUCrdqXME/BjiTs=;
        b=nWw7tdI5aFUID1QfgM81qjgDwNnYIUci9m3JASNNqI+xEwdqSNPRqdc4AkdHY3IW2y
         ca5iN/W55tXAq6BATzQ0Dsq5ZEwrXdYWraeNBAcMV+BLKHatj+6bzpbha7rxxs4VYn30
         3QjL9QGZIywgBIO5/OEnyanC20oeYrYmJwe0AcbchBweIsX7Y24mMQw/K6kfTITGFA+t
         kPB63ZtOH+qkfYfD21+bfFW5JQ2iAmQ0NfmtepiDz81GJC/545A7O/5ElD5IQvv2d4pR
         oBXVWLhKmMnWPDsGgtZzqd9M0CcfOJUaVWctYmSekQweml8AJ2SeI78PYgXyxhVbX7MT
         EXdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791318160; x=1791922960;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=wZRugNV3JlfxpmndM4rEfelj2/GgiUCrdqXME/BjiTs=;
        b=xDxaSrJTyEIdqBw/I7SNJD0p+IVShN7QdYb/jAHt+1k5Jgilb2Ig3+Qwoq3tKzNJFW
         REanY+6Uyb+q/I62iS425L7jUDUsAySvyim5cwVCYCsDFcs9EcmaoDrjEaiSC/JqKz2c
         iP+kztN1CxoEQsdDlhNeYY9b/fdmWT5husuMXPEfBOY6mR3Idnz45pXywya719o3UGpE
         Fz6YFNEEnaeTgKbUKTlBef4K4go4K29ddsNiKRDy31eHNkxckrd/GHjYOREC04VF7rw5
         9ZYiQdmmvRleHE1zXRqpomkXUhPzZQilDKcnHP8b7Xim2oVBqL4eOv0S5kVB45Q1HeTA
         zheQ==
X-Forwarded-Encrypted: i=1; AKwUvBxRLNrtvdXHF4BuQA+WmsmWa4x2FDyRK+hxVdw4M+oMe0PaJiAX4z9v5uimuIFZoq6GTOPGZJkEbQXNwrg=@vger.kernel.org
X-Gm-Message-State: AFq9FYI2cO6NhN7qpqa3fzY1ymAYApTCN+p4TF1rhl0q4EaTicirQAqL
	pRMC54KTJkuj6Xl8W2nbvPpW5pinqb+SQpRNx5LzQhmOGaUYRxB8KSQaRBFOhdTWrIg=
X-Gm-Gg: AYBFou2RZ8A10KWIPU1hUtCDcGpujy339ZfmOk8eHekO0ozIqRkdnf1luMO2gXQJLGh
	CdRmMlI3hYwj1j7/62dkj9P7IiIdsqdFKznBHU3yPH3i5oFbEW9+ELwSMDfwyeIJz7Dd36JMiuX
	4tMHG2wlpUL+apz2wYbngkpCIblULVOTwWsapRdsr4LtB2ysZ/oD+01JLgAf4Xg52PFwCRLobvc
	MDXIbYEYIT4HKcHX77h9XysEZag28Awy0AMUnJANccnu0wvw8G6ZOVBvBNnrkUtNxt172da80Vc
	LdxNEAwaQZNdYVRcdeRtLgs1jH8Hjf0AZQA0lBKmioxenHDT2IwuCkj08cdtm73S733WS/P7v+x
	3bAfYMTvQW17YaOk4LCjZtQh8hnIWPwcN6GQVdFoHhXlkXxjiVmnfQMh761/tK5qbaz/ZsGhhcu
	L5Mzd1/pBZeecj/NbHWYlTm2LRQCFJeIa/zouRTMqjJL9YVe9JBseRkrucKmOvTDHFkAr0Ypd8t
	d808HMDtDU=
X-Received: by 2002:a17:902:ecc6:b0:2df:84e0:902f with SMTP id d9443c01a7336-2e6003b6918mr3976315ad.9.1791318160579;
        Tue, 06 Oct 2026 13:22:40 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:3::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e604948613sm850485ad.63.2026.10.06.13.22.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 13:22:39 -0700 (PDT)
Date: Tue, 6 Oct 2026 13:22:37 -0700
From: Joe Damato <joe@dama.to>
To: anmory <anmory@protonmail.com>
Cc: netdev@vger.kernel.org, michael.chan@broadcom.com,
	pavan.chebbi@broadcom.com, linux-kernel@vger.kernel.org
Subject: Re: [RFC net v4 0/4] bnxt_en: Make RING FREE more robust
Message-ID: <asVYjdbZGMAEck2t@devvm20253.cco0.facebook.com>
Mail-Followup-To: Joe Damato <joe@dama.to>, anmory <anmory@protonmail.com>,
	netdev@vger.kernel.org, michael.chan@broadcom.com,
	pavan.chebbi@broadcom.com, linux-kernel@vger.kernel.org
References: <VyyrJwrwBZEIGezDRJP8QPxbcsGROaxnmohLCnzNQY6sX5CEt0BK3AEC_0MGBx6OxGf4H5UG_xQcqgtAonwmXLdZ5Bd3INWMsof8Oj6ruqg=@protonmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <VyyrJwrwBZEIGezDRJP8QPxbcsGROaxnmohLCnzNQY6sX5CEt0BK3AEC_0MGBx6OxGf4H5UG_xQcqgtAonwmXLdZ5Bd3INWMsof8Oj6ruqg=@protonmail.com>

On Tue, Oct 06, 2026 at 04:43:42PM +0000, anmory wrote:
> Hi Joe,
> 
> we appear to be hitting a very similar issue to the one described in
> this RFC on two Broadcom BCM57504 systems.
> 
> One detail that may be particularly relevant is the ordering in our
> reproductions: on both systems the AMD-Vi IO_PAGE_FAULT occurs before
> the NETDEV WATCHDOG / TX timeout.
> 
> We originally encountered the problem after updating from Debian
> 6.12.107-1 to 6.12.111-1.

BTW there was recently this patch [1] proposed by Eric which helps prevent
a bug Stefan reported [2].

I am not sure whether the bug you are hitting is Eric's bug or the bug I am
chasing.

Other than explaining how you repro'd the issue, if you want to test Eric's
patch you could apply his patch to v6.12.111 and see if the issue still
occurs.

If it stops, it's probably the bug Eric fixed and not the one I'm chasing :)
but if it continues, it could be what I've been looking for and I'd really
want to know how you reproduced it, please.

[1]: https://lore.kernel.org/netdev/20261006042153.199444-1-edumazet@kernel.org/
[2]: https://lore.kernel.org/netdev/20261004122616.56714cbd@nargothrond/
