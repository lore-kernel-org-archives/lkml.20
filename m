Received: from gwu.lbox.cz (gwu.lbox.cz [62.245.111.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71F1E263F44
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 08:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.245.111.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790585257; cv=none; b=DEtb6NdKWarf6e1odQaxMpDfuX+GhVxQ4YxrCa5i/BaQOv8zZRzCIh7B/GZkIAW4yJ4oiVL42GjwPspk8/kyNZR3lJbr+57M0xjJAb/pVPfaIHAhxHRALAYKs1hqKCd6iKi0gELrE5zxGtNOlK5NTpV2ymRcqaNLzCeqKQcp3VU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790585257; c=relaxed/simple;
	bh=q5QPjZ89xZEzG06CUY3/xk0EjzYVqGT5Xeq0BPLH3Q8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dta57UPt5d5u8nmrceY16Xb96VQGxUMHAEvjF2XIYBwnswFnhfFges/XMUqs0FPYmBX5Awwisc12SkGyjqhBVbz1SZqR6q62sx8rYVblemxqTggtoeuAkYwszUHoLggOpMQ56rv783i9qWBUxPm3shK/i39nc8tuT2zPCBCAZE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxbox.cz; spf=pass smtp.mailfrom=linuxbox.cz; dkim=pass (1024-bit key) header.d=linuxbox.cz header.i=@linuxbox.cz header.b=ggvWiPUR; arc=none smtp.client-ip=62.245.111.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxbox.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxbox.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxbox.cz header.i=@linuxbox.cz header.b="ggvWiPUR"
Received: from linuxbox.linuxbox.cz (linuxbox.linuxbox.cz [10.76.66.10])
	by gwu.lbox.cz (Sendmail) with ESMTPS id 68S8l50M3267087
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 28 Sep 2026 10:47:05 +0200
DKIM-Filter: OpenDKIM Filter v2.11.0 gwu.lbox.cz 68S8l50M3267087
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxbox.cz;
	s=default; t=1790585226;
	bh=kAouS6oU/GYqcmOPYHVkjxJ+emJPBFeGrdGUEqPX6cQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ggvWiPURJ7O+r8S09SE/ntfPRiCWeiwdW4yOMLeHvMxXPH0Uj2iqca6oY3jAPfWEp
	 Na8QBasFHPGThNxNZFkyrHmYj3bTvJ3An1FNNYNvPaWjSz7KQFaowktfrFJqCbNaLi
	 /+z5RV8a2Bzjf8XNKX7SPOP16BqVK8h/v/47KiNw=
Received: from pcnci.linuxbox.cz (pcnci.linuxbox.cz [10.76.3.14])
	by linuxbox.linuxbox.cz (Sendmail) with ESMTPS id 68S8l4UW029489
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 28 Sep 2026 10:47:04 +0200
Received: from pcnci.linuxbox.cz (localhost [127.0.0.1])
	by pcnci.linuxbox.cz (8.18.1/8.15.2) with ESMTPS id 68S8l2Qo1976702
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 28 Sep 2026 10:47:04 +0200
Date: Mon, 28 Sep 2026 10:47:02 +0200
From: Nikola Ciprich <nikola.ciprich@linuxbox.cz>
To: Luiz Capitulino <luizcap@redhat.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org,
        Nikola Ciprich <nikola.ciprich@linuxbox.cz>
Subject: Re: hunting memory corruption bug in 6.18.x
Message-ID: <arophkRJLItrzg/W@pcnci.linuxbox.cz>
References: <arY1Wq6R9OY20ans@pcnci.linuxbox.cz>
 <1a511636-7a55-4c98-a0b3-1ea0c301d749@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1a511636-7a55-4c98-a0b3-1ea0c301d749@redhat.com>
X-Scanned-By: MIMEDefang 3.7.1 on 10.76.66.3
X-Scanned-By: MIMEDefang v3.7.1/SpamAssassin v4.000002 on lbxovapx9 (nik)
X-Scanned-By: MIMEDefang 2.86 on 10.76.66.10
X-Antivirus: on lbxovapx9 by Antivirus 
X-Spam-Score: N/A (trusted relay)
X-Milter-Copy-Status: O

Hi Luiz,

> > The problems started after we moved from 5.15.x to 6.18.x kernels.
> 
> How long does it take to reproduce? Can you reliably distinguish good
> from bad?

Unfortunately it is painfully hard to reproduce and thus almost impossible
to bisect. A few times, after more than a week of successful tests, I
deployed a "fixed" kernel to production... and got another crash after
three weeks :(

If I were able to reproduce it more easily, bisecting would probably be
the first thing I'd try, but I still haven't found an easy way to trigger
it.

I tried heavily loaded guests running MSSQL being hammered by HammerDB
(one of the affected customers runs lots of Windows guests with MSSQL),
and others running kernel builds in a loop on top of a tmpfs ramdisk,
all of them being migrated back and forth.


> 
> I know that Lorenzo jumped in and gave some good suggestions already,
> but in case you still find yourself without any further options you
> could consider if bisection is feasible: start with manual bisection
> to identify the first bad kernel between v5.15 and v6.18 and then the
> first bad -rc. You could go to git bisect from here, but it may take
> several weeks depending on how long it takes to reproduce.
> 
> Another option is to try latest Linus tree to see if the issue is there.
> If it's not there then it might have been fixed, in this case you could
> bisect for the fix (if feasible, of course).
> 

Yes, both approaches would be feasible if I were able to reproduce it
more easily :(

So for now I'm running another round of tests on 6.18.54, and I guess
I'll deploy it to the affected production clusters. That's still better
than waiting for a crash on the older release.

I'll report back once I have something new (from the lab or production).

cheers

nik



-- 
Ing. Nikola CIPRICH
technický ředitel

+420 591 166 214
+420 777 093 799
nikola.ciprich@linuxbox.cz

www.linuxbox.cz
