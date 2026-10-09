Received: from relay.hostedemail.com (smtprelay0017.hostedemail.com [216.40.44.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28F704EF141
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 16:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791563148; cv=none; b=eUSLHdamKeOxAwtykL/bVl8mjPV37Zq1sY1QQbPz0x9iAXnVsKA8UwZRv2V9akkXp/IRv6K+SonRWyQnmplDiDgUdBPM0I6ywN1Dhk5eJlZ4PeNbrCpB1xvMeMzTe9NuMT0Vhkl8JkDs73TkwJAqHIV6UxqOixFTaYxuMxFM/uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791563148; c=relaxed/simple;
	bh=BD4J5Dm8SRaGi1zD7ZI3OiBblxUlXtDGNm599/FrgrE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RfRomKVXBy1+JSAN1DpuDNgZ4B7cfAv5brTqkW9zspOgkTfZON26OmDuuFXs+ZVY9/mPJ5QQU0q0bRuEtcgkS0lzzqA8oNP5ZaaeKV66BFJSuKh6+k5EfkxtL7KGkRItsvs9p9cOQxqpWcHiGrT7HgIMKRO/dFF24A1NoWgDpHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com; spf=pass smtp.mailfrom=perches.com; arc=none smtp.client-ip=216.40.44.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perches.com
Received: from omf02.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay06.hostedemail.com (Postfix) with ESMTP id E6957A7F45;
	Fri,  9 Oct 2026 16:25:37 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf02.hostedemail.com (Postfix) with ESMTPA id 2CF1E8000F;
	Fri,  9 Oct 2026 16:25:36 +0000 (UTC)
Message-ID: <5f3852d23428273f1399186f0677870a7a17df35.camel@perches.com>
Subject: Re: [PATCH] get_maintainer: only use THE REST as a fallback
From: Joe Perches <joe@perches.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, users@kernel.org
Date: Fri, 09 Oct 2026 09:25:35 -0700
In-Reply-To: <20261008-get-maintainer-the-rest-fallback-v1-1-7d26d0b7aa34@linuxfoundation.org>
References: 
	<20261008-get-maintainer-the-rest-fallback-v1-1-7d26d0b7aa34@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-2.fc43) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Server: rspamout07
X-Rspamd-Queue-Id: 2CF1E8000F
X-Stat-Signature: xdfh5xspsz41ybct7dozdape33g3cqmg
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX18SNqPQaX0S4Uf+Q2Xvq0ZdQ+eDt5xLzlc=
X-HE-Tag: 1791563136-891763
X-HE-Meta: U2FsdGVkX1+1LTXbl7+WHTo2jBh23btzK1IyF9ZOvuaVZJPgl7IzrdmwvL0GoyqWgQI/Zirx9/kBbbSovX53OI0ul4mHACe1DOjCK1TKm7jz4xSH4JCKKYSu/7rjzVgAqfclSr2SMX7/b5L5umyPN8Te6hyx4YeZZK1rWr+3aJBIJzz0Qz1EZj7KlqQ/Nye8h1cz8v/2X1MnHTxTgOCJKISHB7s3BHbYLd9Qvf0S0qeXHS2y7ONXWtUrZLW2dpBDc6I1xtL3BJbVja/wJIZcOwbqOrH0EZXcNY32sioi9APHRJApbrTqBCPLAyBoGy4iPAe7G2Ki4xCz0wW5poTIOT9L0C7E1X3+pUTpeuT/Dmq1dPjXvuBFGQ+IjrfZdKPgBXJoyHBqzZ4eRpxUXXOBLu+dluUXDhtxUkoFtwnJjpwENSlv/2AuIUKBJbOjT80p4gSb/A4qITDtteyYSuXHPzVpH3TQcRFPXvx/u1O8dqoPhQF+BmA9f5uw33u2AX/JjUU321Jq3VqDWCQufY4GoK+MgId7oYtIqhmP/6OCv9SI816Vg2JPCxB8mFcQ4l+5HkPzeCn3QbWngqNDQRC/Sd+6HpvMGcYGyYQyrEn/wWKLx3WAoxyr1zxxr/Im8C2txre8oHrlTGAaOPwUrVdD1P/dxyZBsv7T

On Thu, 2026-10-08 at 08:51 -0400, Konstantin Ryabitsev wrote:
> THE REST matches every file in the tree via "F: *" and "F: */", so
> get_maintainer.pl currently adds [linux-kernel@vger.kernel.org] every
> patch, regardless of whether the touched files already belong to a
> subsystem with its own mailing list.

Perhaps it's sensible to use a fallback email address only
when get_maintainer produces no email address and remove
the "THE REST" entry altogether.

> Only add THE REST for a file when no other matching section provides a
> mailing list for it. Files that match no section, or only sections
> without an L: entry, still fall back to THE REST, so every patch keeps
> reaching at least one public list.

Public is an interesting word choice.
There are subscriber-only mailing lists that may not be public.

$ git grep -i subscribers-only MAINTAINERS
MAINTAINERS:L:  acrn-dev@lists.projectacrn.org (subscribers-only)
MAINTAINERS:L:  openwrt-devel@lists.openwrt.org (subscribers-only)
MAINTAINERS:L:  ltp@lists.linux.it (subscribers-only)
MAINTAINERS:L:  openvpn-devel@lists.sourceforge.net (subscribers-only)
MAINTAINERS:L:  linux-parport@lists.infradead.org (subscribers-only)
MAINTAINERS:L:  linuxpps@ml.enneenne.com (subscribers-only)
MAINTAINERS:L:  pvrusb2@isely.net       (subscribers-only)
MAINTAINERS:L:  sdricohcs-devel@lists.sourceforge.net (subscribers-only)
MAINTAINERS:L:  squashfs-devel@lists.sourceforge.net (subscribers-only)
MAINTAINERS:L:  tlan-devel@lists.sourceforge.net (subscribers-only)
MAINTAINERS:L:  tomoyo-users_en@lists.sourceforge.net (subscribers-only, En=
glish language)
MAINTAINERS:L:  tomoyo-users_ja@lists.sourceforge.net (subscribers-only, Ja=
panese language)

If the desire is to provide a [PATCH] only review style list
where lore does not have to send emails to subscribers perhaps
perhap use an aggregating / deduplicating mechanism to lore
for all patches sent to kernel.org.

Though there are what seems to be non-kernel related lists on
lore and that's likely an issue too.


