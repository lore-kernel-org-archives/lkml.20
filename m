Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=216.40.44.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794668270;
	b=WROTIj3haSb100NEv0uJkCo791xbx/yuP7tPW8S7Flf5fGrhZLsJiJ4KEDODUt8G872G
	 oRNyKjjzudnDPIa5PGFUhRrRMLWvqSzdrrIxTXg9IcuV2O2exuwyfahCCp2dAGywBRU/4
	 dDt4dj79gW85MSdQjMjWP4GicWmXXMztt/lUvqaoho9C0ZJUUIBDprjognhwW7GVMXoaF
	 kAGXEjin68j36IxfM3WBkWrjumJeVqasJ6TLfk71SRucGpgYHsIyAnYtSaKvP7R5QBNJq
	 uI+/2eFbf1RMEpn9avpn8KcyY7WzSABgjA12Qxl2TqyHx6bBR/jYG/ce4KitnEzaDwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794668270;
	h=DMARC-Filter:Received:Received:Message-ID:Subject:From:To:Cc:Date:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version:X-Stat-Signature:X-Spam-Status:
	 X-Rspamd-Server:X-Rspamd-Queue-Id:X-Session-Marker:X-Session-ID:
	 X-HE-Tag:X-HE-Meta;
	bh=G7tzCx3EZYQYCtzaHM9xsytSQ1P37FQXPg3wdor+al8=;
	b=L9DLrN3C28Z5yWsens+qgXU5AVzzivVLBkM9GlBZQGrjU+t7Bad+FDyHRL04XajEazYv
	 MwYQIrcmB3SOiECXdAA/LeKNLvu3+ImE43hh47UteXS5G+5UtdeqY9Ixtb+LRgbMfCxYz
	 gd1E2mRK+W1obsFA/GeLpogXuTpZNJVHmpi6YZb2CaIWbBhkYdnT2rEKeZkZrmTqfcCka
	 XeQ3Rd6Le40y4rk4AdR3kgUS6Xsi208stMBGpvmaKlX2GtFeWNtHyRsn01yKDQlqlTP5x
	 CJ4T8XUfKuauR0dkTF0Z8VIR0rBlbgu0QCgCP+G9ts65SY5e+aTVFNjOzI9Ekea1cKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=perches.com;
	spf=pass smtp.mailfrom=perches.com;
	arc=none smtp.remote-ip=216.40.44.17
Received: from relay.hostedemail.com (smtprelay0017.hostedemail.com [216.40.44.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB843606A329
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 14:57:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB843606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perches.com
Received: from omf15.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay06.hostedemail.com (Postfix) with ESMTP id 014CEA6957;
	Sat, 14 Nov 2026 14:57:42 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf15.hostedemail.com (Postfix) with ESMTPA id DEB9B17;
	Sat, 14 Nov 2026 14:57:40 +0000 (UTC)
Message-ID: <03c1afd39a3f167b960a982d1a933619855a975c.camel@perches.com>
Subject: Re: [PATCH v1] checkpatch: Add context-analysis attributes
From: Joe Perches <joe@perches.com>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: apw@canonical.com, akpm@linux-foundation.org, elver@google.com, 
	linux-kernel@vger.kernel.org, kernel-team@android.com
Date: Sat, 14 Nov 2026 06:57:39 -0800
In-Reply-To: <61e4f8997861a1188935435e78682c575552d2a3.camel@perches.com>
References: <20261112151203.3129005-1-vdonnefort@google.com>
		 <6dfeacb309d58f153c1cd701cd31a587151e9070.camel@perches.com>
		 <avhgY9t0KVkDfEZw@google.com>
	 <61e4f8997861a1188935435e78682c575552d2a3.camel@perches.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-3.fc44) 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Stat-Signature: hzjtjwmc67ap4j9k8g3wbkpajwber7fi
X-Rspamd-Server: rspamout01
X-Rspamd-Queue-Id: DEB9B17
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX18M9lT94umtbQXmDCNbMKFxPeDMhBV62II=
X-HE-Tag: 1794668260-491042
X-HE-Meta: U2FsdGVkX1+JJ4OhHpgh5g8ageGP0dT44cfoM0nhkbAZIlr6J9vgFjV2OORuIrO62uO/JpyKSNvbyuQVelwDZddsLPVcnFIpYibHKEWghCw40CDMxmT1VNnCdQEAmSDnGnmSPoM1imDf9Jh7ivL/TDgaYsyM/R1U9GGewwNzz/ErSvJ6FQ/FN3eehAT9JBUham5ULynpi5hG1Pg/C++dn6vi0Ha0DUb/21KJDlD8L8BF4IUXeQM1UxNy2BIIDWTzuCGPX2hNqzHe+QYOHzGBuTkf/vnux9iGvYNn2Y2uLFa9WSG63CdeWXcma6zvy+ZMr/LT9lEoQzoD622cirMh5hVJbf5Tc+NB

On Sat, 2026-11-14 at 06:26 -0800, Joe Perches wrote:
> > How about matching one internal () pair?
> >=20
> > __guarded_by\s*\(
> > 	(?:
> > 		[^()]++ |
> > 		\([^()]*+\)
> > 	)*+
> > \)
>=20
> Sure.
> Please add and use another variable so it's not repeated everywhere.

Reading a bit about balanced parentheses in perl '(?R)'
non capturing recursion works since 5.10.0

Maybe instead use

/\((?:[^()]++|(?R))*\)/

and I should probably rework all of checkpatch's uses of
$balanced_parens to avoid all those weird capture group uses
as it was originally written for perl 5.8 (thanks akpm)
