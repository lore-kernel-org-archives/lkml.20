Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EF40223328
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 07:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791790442; cv=none; b=t/ncqgCOzUH6bmK/RuyY4vDDQ778trie0XPVa1MA0QdddWSqmOFeYZMir4E2D27Tne7Qtd7J91OTzNVriHZFwqK0ed9bOx3qmTJXliaUS6SqukPRoAK51lZmmVs5jSPYzZ2jN2qtn8uegOtt4th7OGi/NpfOtFcA2wzqULkAKzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791790442; c=relaxed/simple;
	bh=yEMulxomxXCRUHcJyO6tg85OWCzbU/kyWDzp5hqoZX8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tGp4QXUN2o3crkAGW0dzoeF4wztFHz9nuMIsqXbnL39RimZbjp+4QkS7FdyZbXwr0J/E33N67m3rOSdaBTMhgie3U4SCMZh/Gk/qTYgv5gHjSmWYULib6LdygxWV7RP0E+B47+AwOXO3WQ03Tq4sKPrKgzr8Gh0eSv3zmAY3DII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=LjPfisdJ; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="LjPfisdJ"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a16c399641so15933525e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 00:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1791790438; x=1792395238; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=g1l+z2Tdn//m1GVp5cdQaRa3eKvtV4qEANixuZIAvSE=;
        b=LjPfisdJbxtZp1r9XPTRSTvuYebEaE0duRUM8sKO0mwwuPsqq5gm7g2VLqg5Z6FI7A
         dR5wlUk8DZmYLGqMV4X3moJZDQfWRFc+qB95oJowA5FrzSRjY/fGIUmuwouHfyXOJkcv
         5LLyust4Fwvj4E+HNJc9BCmltWZW6jWiqfWj5NjRE6dM90SKFL62ktxEO0nxafjPWU65
         9u+MzJYZ/Z0KoUKKhhZORouBBZcTr52DxzVsmmb4iYW4bmAdtvvJZBcgZ4hDv/LkhKEW
         peOYgX9x65Sd2uWoRGr1GK/VjaS6cb2ba1TVE2ZVez9BgLZTWKQZSx8Q+CUrzvTocz8Y
         BTLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791790438; x=1792395238;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g1l+z2Tdn//m1GVp5cdQaRa3eKvtV4qEANixuZIAvSE=;
        b=uGHv/kGI8T+3DKw9LEskDvKFBeQdbaMKSWU4HUj2y8HEpIYZhjKe6/u7aJLyD11aVY
         p99Efxgvrd5H671gX/Ca0nS1r9M3BzXCb0Nv3K9/k/lPthWqEtFeeOoBZ5PU56EVHYyM
         psLKtwQugKCQ0+tFYsaMqWiylgHoXZPmcNQIO4kJMYaurrEet2/ErvJPv9VNibgHEuYj
         I3OQOm8QFVs73ewtPYR+q19mt57Jzhob5uYjtbDiZVgiL2QLc9M4WWHIM/zt7kOPbVEX
         aYhrwPLfgPlD4MIiqVN6H/ZBQxTrMg7FHvrFIiGidgxtL2wtCoRhWRsuVDcDkSSpT9wh
         eifg==
X-Forwarded-Encrypted: i=1; AKwUvBzilE3ivrkFU2sRaygMCuKuoE1HQFFIEI/YBDerUTml5Ajlg5Y8zNrg/hY6EdXwBs2BeETf5F5jXPvOZKs=@vger.kernel.org
X-Gm-Message-State: AFq9FYIaz0ieXEN0JVWituT3Lg2/4Gg/zTriNgJY/PdrglADsciff0z8
	72MNSYS9F2oa3a9mn045J8K/bKQp1P0PHfEVnfwV69OvIGoHoh4eV2ExcEBPF15kIjs=
X-Gm-Gg: AYBFou2etPV7GVUWiLnYbACUJSxVDBDMVS0/juF0Kv7O8xesHsh/3f9NdjdjLJW0i4t
	McTJKWwKEunTjXbplr+UTfeMQeeInu6VNA6ID0E0XUpvWP7MFrl7kzt0s4dvDmvN7GnrNhFqBGR
	zRpNLOVTodqxZrWw6yzd8RjgwxorAX32Nco/v1yewdHrhBNkGDmp3tu/SkkyA1v2FdAc41w0eN/
	wJ11dpLNx5ZEUO614gAx39fNNfLoIIr4YezK5qe1PxZokBirl4hyzYOUdMm3CB1PMbNXd8v5BJD
	sw2cTXylEzdrBm/mPMonG09ieX+FGgA9fd3EA49sYadQDR2rECxrimnRSQa4xRJNg2Ffi4/Wfaa
	7AjS1urtzRJtthjM9pbYOyXLc9702d+ICXFJmGuP7czpp5wa2gF42LEvkmwu6HaG/p6al8ir8N/
	Ek9er8wZ+jMCV5n5xSRoBkCtycx8Vvn99xtnHM3rNOPrH/3FSQz2d4V3JW3rEFh9DUw6bDj2bXs
	BhAkkKcS0M=
X-Received: by 2002:a05:600c:1909:b0:4a1:722a:d2a3 with SMTP id 5b1f17b1804b1-4a18e4a3f5amr181831615e9.23.1791790438253;
        Mon, 12 Oct 2026 00:33:58 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1972eaed8sm159437785e9.1.2026.10.12.00.33.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 00:33:57 -0700 (PDT)
Date: Mon, 12 Oct 2026 09:33:55 +0200
From: Petr Mladek <pmladek@suse.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: live-patching@vger.kernel.org, linux-kernel@vger.kernel.org,
	Miroslav Benes <mbenes@suse.cz>,
	Joe Lawrence <joe.lawrence@redhat.com>, Song Liu <song@kernel.org>
Subject: Re: [PATCH] livepatch: Add Joe and Song as maintainers
Message-ID: <asyNYwN_hP36mXT3@pathway.suse.cz>
References: <55b68f507686cadfcb1fa4f8524ae042c7657be8.1791664234.git.jpoimboe@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <55b68f507686cadfcb1fa4f8524ae042c7657be8.1791664234.git.jpoimboe@kernel.org>

On Sat 2026-10-10 13:31:49, Josh Poimboeuf wrote:
> Joe and Song have both been key contributors to livepatch for several
> years.  They have graciously agreed to become maintainers; add them.
> 
> Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>

JFYI, the patch has been committed into livepatching.git,
branch for-7.4/trivial.

Best Regards,
Petr
