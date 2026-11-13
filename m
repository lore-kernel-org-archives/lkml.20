Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794586824;
	b=0WZqqSMChTFm0oCajuGXtROdeHFwUgEpmBDCmGR1Xrdfe2X6d0SGgL/y+ostwiT+z5Hj
	 aEGk0Qd1qkG0g0Mi/SSSQlS9Iar5uvoKGl66B0TZ2GwtNx/ibv0998UrSL6mGGBYtiFaK
	 /TaCOQ4TD15vyvYa1HQYQGE7zJj57DI4bYZeDz6spZWGka2wk010A/5NuUcy9kNfwlYeN
	 ptSvFjdLvSLoSMS63Qj9BLYXqSZH/u4dkSr1nzKKmaxt9ykBEjtS7jrbzqX6rPrWuY1p/
	 id9za3c6jXsIw2HFTa1LPrdcF2P8ajJegM301fEWDChjspNcmT4cHDEy2emJw9YG+SA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794586824;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=9mKuKJKQdz797u5WZKCno/OeV4zsZ4Me4LaLtgDigC8=;
	b=SnQL5cv8Fjqse+F78ZP+hmzct0q+6N902g6YSw7RgWdAHVb0B6qhLOT4YBrpSFTt1au4
	 7QP80KjSTnG8HdwtCwwJ8WaJOUfGycb+b7XhH0hI5fmjbyozCYOkv4wMbqfAYVKfnxkV8
	 EhQd6hNh3lWWMystv9c7i3rggzG4R/beLYfWhs7+frz0FUrfDTbEJEDX8mJXux08r+8cw
	 uO/SFBxkhKmMpbIDtQ8ZQm6mlMhTYXM3jekVNp9x9IoPmF5FrpJl4Hg+G2A68jEnReYSD
	 mqxWWlKwjFH4K9Jua+7DNwFyrhhh9/7tntKMUlrqSCJtNBAifLLhyLJZTLNgwRqkMLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DH849jxz;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 323B8606B2C2
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 16:20:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 323B8606B2C2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DH849jxz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794586823;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9mKuKJKQdz797u5WZKCno/OeV4zsZ4Me4LaLtgDigC8=;
	b=DH849jxz66bTh8IztRhyOAUoN/Yp+fJ8IXjt/0kPBwPcTTmlYlz+w5ISe4eqJbBq98lR+n
	+ZJPYBffYCoeO+75UPskKEukkdx18248ThXeoQTIc0LKlr2SBGs/DbwasgogKLNgSnCGcZ
	0ZJBw5Nwk+1odVYsKfXcoKyjWC4t1Bk=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-172-cXpBP3OMPDG0KRhS9CjTbA-1; Fri,
 13 Nov 2026 11:20:18 -0500
X-MC-Unique: cXpBP3OMPDG0KRhS9CjTbA-1
X-Mimecast-MFC-AGG-ID: cXpBP3OMPDG0KRhS9CjTbA_1794586815
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 75FC71955EA0;
	Fri, 13 Nov 2026 16:20:15 +0000 (UTC)
Received: from poros-thinkpadp16vgen1.tpbc.com (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id AA2F51800495;
	Fri, 13 Nov 2026 16:20:09 +0000 (UTC)
From: Petr Oros <poros@redhat.com>
To: Jacob Keller <jacob.e.keller@intel.com>
Cc: Petr Oros <poros@redhat.com>,
	netdev@vger.kernel.org,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Dave Ertman <david.m.ertman@intel.com>,
	Mateusz Palczewski <mateusz.palczewski@intel.com>,
	Leon Romanovsky <leon@kernel.org>,
	Rafal Rogalski <rafalx.rogalski@intel.com>,
	Shiraz Saleem <shiraz.saleem@intel.com>,
	Aleksandr Loktionov <aleksandr.loktionov@intel.com>,
	intel-wired-lan@lists.osuosl.org,
	linux-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH iwl-net v2 0/5] ice: fix RTNL vs auxiliary device lock inversion
Date: Fri, 13 Nov 2026 17:20:06 +0100
Message-ID: <20261113162006.1236497-1-poros@redhat.com>
In-Reply-To: <4b07e441-de15-44f8-a7ff-f67c9c442966@intel.com>
References: <20261023070258.730168-1-poros@redhat.com> <4b07e441-de15-44f8-a7ff-f67c9c442966@intel.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

On 11/4/2026 3:10 PM, Jacob Keller wrote:
> Sashiko has a couple of "high" complaints that look plausible to me.
> Could you please confirm if you are working on a v3 or respond to the
> reports and explain if any of these following issues are faulty reports
> from the AI?

v3 is out, rebased on Przemek's series in dev-queue. It fixes the
AFTER_TC_CHANGE report. The -EBUSY and mqprio teardown ones predate
the series, v3 only adds a warning for the latter.

Petr

