Received: from mail-07.mail-europe.com (mail-07.mail-europe.com [37.187.220.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2C0C49E15B
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 13:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.187.220.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789997583; cv=none; b=P9zKapEFlQA7hcmbtWPkOmiL7pO+xAyyVdOKuVqZOCAHwylfwzLQUESb6Wcz8OHaUv4ls+2uH7fSPD6ktNyc/TMsEFEI+OMChMMlfgVUXwrh3zw8lo/yow1tuM8bbWhGJ04CndpApuYm22oNtbNaPqGZK0pYOpFlhpUpP/8dw74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789997583; c=relaxed/simple;
	bh=ylB2giCNryA1Su7/91LupBgJhCR2Xa8XKeIW+txFC0o=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=unf9i4NoWIxokk2uTosBUmsghX5wskdqmsXog1W7R6ZSlgm9+UNJuvV6jhgSdiMm1b+TI+v1aDFlNEf+s6to0jgbaBq040yzRPQXMcK7gJM20GL0jRJFyOQ6xWCQ9BotIRZC1gLGHDMtT9df/p31agdZEgqTLy0YbY1sD2f2I1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=IyItN8Lg; arc=none smtp.client-ip=37.187.220.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="IyItN8Lg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1789997565; x=1790256765;
	bh=e23aF8ZOJXvJ6ZKSEyDJhEeZDL/sfyN0tEiBywFXkAQ=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=IyItN8LgBGCcNlmADgUugQDtCWVTpgI4C+eJVhia5/bh919r7CsV07uAMovxoSpBs
	 SMzciMYxE4+gXMEC0Bl/DAUceFfPdAJmrzEiw5ygpj34F0+JVKNEibJJxSIUiWpTvn
	 SKW0XEHAdJ8ocR/6JbApeXO3xOApK5EcwcEeGrhFT5+LsdFFzIkOn7S1WZqhYTsyu4
	 8u5P1ZbhZ2D4J2bfgbWmLxcvrSKyZuiv9W9Vbx1luhrkuH2jskmd4hC7AVMBhSqONL
	 3TdqJFcnUbTg/SevwmFGgbEwWHRWWyyckh4r9ux1szF2y0A0rEfX6F+L6ddT3QoOuK
	 nd9es6iJwl52A==
Date: Mon, 21 Sep 2026 13:32:39 +0000
To: Peter Marshall <pm@petermarshall.ca>, linux-media@vger.kernel.org
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Sylvain Petinot <sylvain.petinot@foss.st.com>, Dan Scally <dan.scally@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 00/11] media: i2c: st-vd55g1: Genericize driver and add VD55G0 support
Message-ID: <20260921133232.92283-1-lsa.uz@pm.me>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: 5e20219af743ff2f5b03983f26087bfafe83254f
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Peter,

Benjamin suggested we get in touch, so: hello, and I should have written
first. I missed this series when it went out - I was not on the Cc and I
was not reading the list for work next to my own - and on 20 September I
sent ST a separate vd55g0.c off-list, two days after you posted, without
mentioning that somebody was already doing it here. That one is mine.

Two things are yours to take wherever the driver ends up.

The illuminator, your 05/11. GPIO 1 is right, and it can be measured
rather than assumed. Each GPIO was strobed in turn on a Surface Pro 11
(Intel), watched at the bezel through a phone camera by a person
counting, then measured as frame brightness against recorded timestamps:

  GPIO 0   strobe on 19.74   off 19.76   -0.02
  GPIO 1   strobe on 51.93   off 40.97  +10.96
  GPIO 2   strobe on 19.51   off 19.51   +0.00
  GPIO 3   strobe on 22.53   off 24.87   -2.34

and three cycles of GPIO 1 alone with the others held off:
117.95/115.60/117.71 lit against 21.51/22.06/24.43 dark. Take it for the
commit message if it helps - somebody will ask why 1, and "assume"
invites the question.

Hardware. You tested on a Surface Pro 9 with IPU6; this is a Surface Pro
11 for Business (Intel) with IPU7, where the part is the infrared camera.
Say the word and v2 goes on it.

Your 01-05 are exactly the parts I do not have and would otherwise be
writing - ipu-bridge, int3472, the illuminator - and Benjamin has said he
will take them. If those land beside a vd55g0.c then the machine works,
which is a better end than either of us starting again.

It is not my file to give away, but if you want a share of the driver -
writing part of it, a maintainer line, or taking it over outright - say
so now rather than after it is posted. You were here first, and you have
hardware I do not.

Sergey

