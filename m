Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C247435EF0
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 13:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791552434; cv=none; b=iNTvZfuF9UJgEjBG2Gk/SCG3BPYxnXOSAgaD+6ZfgIJTyEALzvRy4Xk/ABF/GKmPTwP+gfEwhjjcTwYtNHLO2ksvOkcRf5IbEGITAGvaVrqBy5mcm19B/jYSzgJk05u7N963tKthXqNHyHOMIkCTHDCmCY414FyBlQUeiz9HdJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791552434; c=relaxed/simple;
	bh=hTLkfwTM0BFAUb4L1vzKXTT4yZ6YNs01MFq0spfBDh4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lT4Zhkay2wlQSWtXKM52567khPAdt3a+OGAezhNQhb4L6e+AcH3EaPiehQ/61HBInd/bRuLuX+pDMasXWBC2sxTI7Wnh/DphiQ2bRmfOB/d2UAJq/V9mAjyvVUVc2V1lcp1JC0rAIgJXKBlImW4NPeFGvU5fwQjd45kky1n5j1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=TkkNsIPt; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="TkkNsIPt"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49fbb2acc90so37831695e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 06:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1791552431; x=1792157231; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W4f7YhaIWS/4YSYSb9/PE11e3uIBQZXeyPpaesBJivs=;
        b=TkkNsIPtFOqKrXUcuOwJCPrzZLEQB1STydp0lsh6cyRUh3if7zjqgWUxTKmU7hr1iv
         ImjHfPtr5tTvgWoK5DOfoDqUM48wAwwzQoSNCwuqOpWauveN6dPc4xktErzxt3jcYL9e
         DnM9YnSJDu6SEu4H/6WnxNBBTk/4SPIdqD1DLX7ONfz9I2MiFbuWY9GTlsRCzYklETHP
         R6dQwi8XUA11Dd1frne8+qNFJignuDVnKyDynloEuvg9se192dMqnf/65o7rX6lcYLCF
         QHt7quwe8Zq0xun+tIhRkTBDcCKh/HygPtfhako5cIfnztXfVao/pPBisi5IUf4M4n+7
         bnIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791552431; x=1792157231;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W4f7YhaIWS/4YSYSb9/PE11e3uIBQZXeyPpaesBJivs=;
        b=zxZBGIU0KBVUPsnOTYkEu4kIodDv/Rr3cUxrY+yx0O5NVF1BTYr1KBm4QGb/O9x1ZZ
         kVQJD3gcMDYMczPLmJcx/JB4UzWW3+EPKFuFmuouRPN3OiMMdUCMCLHo+PPO79j9hCng
         Qik4N76kalqPQciOf+qYs6YzQ3X5AaDxIqehOrz19+XKBaaGQR60sfMfvlR00+uTdm9/
         rS34Z0egklIOdzy3wP6+/4luhmweepoNiz0fmlHo6dsrvEaivpET44i7thl4MIZJfFKJ
         dNbrQKPSZTk7T5UjGXJ8CkHsVh7FijLdUZfwbVBUA+IqWBNAUcydfQtUgmScE2LBS2/J
         Bpgw==
X-Forwarded-Encrypted: i=1; AKwUvByg6JWpQYBSQgvVZ8meJg3A8Pq9iuNek6RQfCvYDCq+3Fhj332BcK8PAn3DNh+KqDOjzCkXwupjrnKStwg=@vger.kernel.org
X-Gm-Message-State: AFuF++lgDHjjZbJxVjzhyzSrOgl+uVmdDFmWWmMxBmLrFX9eocgqnBQ4
	+uQabFHNa7x23cEKm5VSEWjCCjdfVcfiRZmSh36nUSsAzjW6K5i4xp1MTzBVKZeueEA=
X-Gm-Gg: AYBFou3GCKRFWcF+vHofC1T3B/EUack96yWlh84HVWtrB2SBugxQ/ygjoIhPUS55IvV
	piskdeqP4RwzrrETwOvJYXAbA89TrRUQi/AdWCDy9tGNF7pK7LKNA9RBbgo4RumEDPNfUEODlvh
	9oQoWo3LoxkXtntYAZwsCdcbCTwAJyEvokmp+4WTdiPIbUOKdVjw7Czr4NOubU60N6wigMjdXPn
	PWo8lKXDuHi8PhJBDb3j0WTPo3iATCN6OL8J1i676XxNkeWGSnD7LTxsQfOwoxNNQ1o3eURhr+0
	/JASISIJRlw1grOiBFjCVWkIS4SE8igUZuzQFlU1BNuDgLxn587fP6Qjo0hEyGrR4LGgGdtYcmi
	q7XnmzQsaivMZUIU+FRbZQ54qoBCoXHObGpoC8A/77viDBGJ0Z6lGNAKKJ34F9CgKEkTusSSvF+
	JZ70A19fYo8pxxLpCKanU8FOhkt7J/0dOBvPOZx8GRJTgaKyCFAnkAM9CB9VC6/XyjMS/p/aXL
X-Received: by 2002:a05:600c:4e11:b0:4a1:7f41:b9dc with SMTP id 5b1f17b1804b1-4a18e4d67famr36708245e9.23.1791552430133;
        Fri, 09 Oct 2026 06:27:10 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18beabbd0sm68756105e9.12.2026.10.09.06.27.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 06:27:09 -0700 (PDT)
Date: Fri, 9 Oct 2026 15:27:07 +0200
From: Petr Mladek <pmladek@suse.com>
To: helpdesk@kernel.org
Cc: Steven Rostedt <rostedt@goodmis.org>,
	John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	David Laight <david.laight.linux@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Jiri Slaby <jirislaby@kernel.org>, linux-kernel@vger.kernel.org
Subject: Create printk@lists.linux.dev
Message-ID: <asjrq9g8EoUGepcH@pathway.suse.cz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Address    : printk@lists.linux.dev
Description: Linux printk and kernel string formatting development
Owners     : pmladek@suse.com, john.ogness@linutronix.de, andriy.shevchenko@linux.intel.com, rostedt@goodmis.org
Allow HTML : N
Archives   : Y

Reasons for the list and additional info:

Honestly, the main motivation is to allow sending Sashiko review
for changes in PRINTK and VSPRINTF subsystems as a reply to
the mailing list.

I have discussed this with John at Plumbers conference. We both
agree that Sashiko review is useful and often has to be addressed.
It is much easier to reply a mail than searching for the review
via the WebUI, copy/paste it to a mail, and comment on it.

In addition, there are several people interested into printk and
string formatting code. The mailing list would make it easier to get
all interested people notified about new patches and problems
in this area.

That said, printk and string formatting are related only to some
degree. The printk() code is more about tricks how to store
the messages and show them in various context. While the string
formatting is about tricky buffer manipulation and helpers for
generating a human readable output of various data structures.

There is only partial overlap of people interested into these
two areas. Each group might deserve its own mailing list. But
I would start simple with a common mailing list. We could always
add another one when needed.

Best Regards,
Petr
