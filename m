Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97CDB3101A9
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 15:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787758559; cv=none; b=lADMtCSNzbGqIbl2sWaCfXTFtXNpJkl/bcG5xqU5oYbzrrGciw2bU/R96fjjwbSuO/lLwRFq+79woW2fgdSgibJ/SDYj3chHkkuuDmy28+b4Uh1ImWdRzDbhFqHnCdJ551eubCgWbB8fHc8rj8sIZpysmJMX/jAT8FqeTQvO+ME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787758559; c=relaxed/simple;
	bh=ASVPig2RbtLJupuuu44qrmNIwC0FnZunoekjk+DUNY8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bbjDEo/XDfOgv80A/TzVn6U1nDBYPZ7Wh+1+XdGxhpjoQhCsSerxDsseLAagT1cXEHFhSU0Ip4wXQQYpRyTp1OfElcNeOh2mBryiATRlLTfwROSBZwx7zobg7vE+oS7OUM5uWE3oL3tTNK3Lx1hBN6hJcxYe7YkldiPKlOvRaxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IR9tPp52; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IR9tPp52"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c252c7270faso98699966b.3
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 08:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787758556; x=1788363356; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DftFo5v0HYb4sNCC2CkJoMxRuwrXKdG0zBl21yO9LPM=;
        b=IR9tPp528Fe+AL0FMXXAnvK8zpb6b3GKDMB+mD75iJS8XgbHaeyB+9QNy/XrPhOQRP
         5Ahsmjzjz7zskE6HPwnSpPfXkdrPo7Qo+iCXcSzI8GxnyYfGgEKfkV4bNCS5r8HHMj4B
         sedTvw1XbsT0wCsXKeC/v2HFbMs9n6HSQ62VCFXL4pgWLpwYMrXWY7qelE+QI92LO5+u
         VJDOCPmIKaKwrbaOaTpApBw7w+FQRGMX4R4Oczs8WGLHYb+1Qw37TfJmLhYSlOuJ5x6E
         TGoK5ihxW/QaKYKR4/pitmpw1ZZ1XHAuA1etBLc3FVCdfUqk1QALH87yU2AaAYJAJFyR
         Lz9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787758556; x=1788363356;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DftFo5v0HYb4sNCC2CkJoMxRuwrXKdG0zBl21yO9LPM=;
        b=ALk0XIMuxw/YiUejBw/ebbIGuvh/WocE0CaV2cLYK2gyrEL7OW6EgF4zcsi7vF0tT6
         8Nwtt7rf9ZCa6AtkXEE3ruu+ZZ2lpqKQQeiZgAYcysBuc6ANojaeqUCMQV948t67TaO0
         i2S1BWvqcmlgZxclHn7QMuCs49GJ8pkLywfjJO1IFTQJnM/WI+FpvMLe89eODLXNBXsT
         zwuHS++zT5KC61UOjsEABnrR2mSZQufghnkUGwHgorBvSUtmgo9njOwdjpxwbWxNhLpl
         FoFOsOA0PBJcwKJbcBTfVILcq9sdwsLYZtzZtCaPe7H1QGGj2bjmCY0hCHqM/4Ixs0Z/
         3agw==
X-Forwarded-Encrypted: i=1; AHgh+RopUAf0iR9u6rv1ieHR4eVf66EdXvcAI1YRuCL8PWoJCaoyuVEw4cu0AlAN4YlkZ2SvYNRLMD4kWFyvoC8=@vger.kernel.org
X-Gm-Message-State: AFuF++kn7hu8LWlop9BzTld8fCNVxMDR+gx9gcn0sKYbZbimqzbkJwzY
	SktXPN6e76iUBryQnFlLsg8qRemvctj1yrC5Z9a03A5uTiF3rxs3i7L1
X-Gm-Gg: AR+sD121yfs/VXLB7FNqNi1fkf3+XbvmUyoIRiP2h4uSbQQJ8oBJNuCHzBz5yXOqsa3
	P0nPlbtCcqOCqc4QKpzpzJhVOxjxs7yyT7dfJpXmn9ZXztcsw2kQC1VnOfRCifz6QCaIRPEvlqV
	4lcgBwjB8tUeyUZhCYILSTC/8eWKrcGwvW7B5DGWjQG6/q9B/2CyL3KI9nuQw9qYL3ZD8rgc4mN
	KqghTqJ9RelUzWdQvTxdSBvX0f0fT1N6YXF2Y3ckNaTymWpRNrl4vcU2LJINiZ5CohD4hpNnlxO
	VHQ1aQl4Ec0z4w6UXrEhSz7slqcWxE9x6Tg/Yt6J01dGfMPO6pgIvzfPggc+5guNPhVmrlxzVLW
	dP8/+MKNKAOPVhkBSs7Am1DJVbI3yFNYRzkjZD38Ec+21HVQz7NNybQJcPBUkBj7v12qc5P0e7z
	4VPKdLqMH/tihiXPyAk1HZQ97Oev9xP30r/vd3s0szs8sqNwwbmRBtESQ6il1liomArqgF
X-Received: by 2002:a17:907:7249:b0:c21:752f:c3f7 with SMTP id a640c23a62f3a-c250bc127b0mr959446666b.18.1787758555453;
        Wed, 26 Aug 2026 08:35:55 -0700 (PDT)
Received: from foxbook (bfk5.neoplus.adsl.tpnet.pl. [83.28.48.5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a72d6dbsm483312166b.24.2026.08.26.08.35.53
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 26 Aug 2026 08:35:55 -0700 (PDT)
Date: Wed, 26 Aug 2026 17:35:49 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>,
 Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen
 <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>, Jonathan
 Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, Randy
 Dunlap <rdunlap@infradead.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, linux-modules@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-usb@vger.kernel.org, driver-core@lists.linux.dev,
 linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] driver core: add TAINT_FORCED_BIND for when
 userspace manually messes with devices and drivers
Message-ID: <20260826173549.18c8a89c.michal.pecio@gmail.com>
In-Reply-To: <2026082658-statue-census-dc39@gregkh>
References: <20260826-bind_taint-v1-0-52b05f4a965c@linuxfoundation.org>
	<20260826153311.6340efcd.michal.pecio@gmail.com>
	<2026082658-statue-census-dc39@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 26 Aug 2026 16:25:42 +0200, Greg Kroah-Hartman wrote:
> > I think you confused 'bind' / 'unbind' with the likes of 'new_id'
> > and 'driver_override'. Try binding xhci_hcd to NVMe, you won't get
> > far.  
> 
> It seems to result in a failure report that people keep sending random
> patches for :(

It results in write() returning -ENODEV.

You can't bind random drivers to random devices out of the box,
you need ID overrides. And then you don't need to bind manually,
the kernel will happily select the wrong driver by default.

Authors of the recent xhci and thunderbolt patches admitted that
'driver_override' was involved in both cases.


Meanwhile, Syzbot also found a stupid write to freed memory in USB
core when HCs are unbound. You may say it doesn't matter, but:

* USB HCs are hotpluggable thunderbolt "gadgets" these days
* there were plans to alter this code so that UAF is triggered by
  hot removal of the USB device, not its parent HC

IMO the actually meaningful change would be to taint driver ID
overrides, because that's the known risky and crash-prone madness.
bind/unbind taint is noise that will be ignored.

Regards,
Michal
