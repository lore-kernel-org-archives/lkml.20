Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=216.40.44.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793558192;
	b=UqaAxYsaF/asT2rjY3L7HpGEvmtY5H8jBe/WK4fnk28vrH2rPEQKO8Pys3mE09beY4HP
	 G+vUm7iOxOa5PRnlsiZeDBQVBVwPATSR4vD8UqxJTxiuhLlf0RpqO7zHHOUM1TqeMc9uB
	 Euz26Xy0MvQg1ZbhwAWkAAYnMc0yC3JSS4iSgf9MA9s3R/iJn0T0NzpFQgo+MjBYAehoH
	 7uRGRzFyCNv1rsHbSmpi2tKyFa8g/w3QI1avh6HenKVIaDLvn1a0UUlVeGq4oYKx3JORr
	 P8cw8PtFg2A7zUsx0h5Or2I48jXBvTlreY6GPe6Ro1RZonToTJX2mo/4+h6IVrZZd2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793558192;
	h=DMARC-Filter:Received:Received:Message-ID:Subject:From:To:Cc:Date:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version:
	 X-Rspamd-Server:X-Rspamd-Queue-Id:X-Stat-Signature:X-Spam-Status:
	 X-Session-Marker:X-Session-ID:X-HE-Tag:X-HE-Meta;
	bh=2GWORHxf/K1UDYtlWJNFHkuHXbz2rBaThlFUJw8MkYM=;
	b=YqP3iNjPOXNQZsvqT6u/CeuAU/m9WuJuM4szaiZi3tUKYEqJPR3cBMRHZN1PFmnVs8B2
	 sLsDj84SoDBF8CY2ooTLAFzG5C8Dl78FLdhE/c+JOt57cTG5xsBI/P9FrnfqoeAACrzML
	 T10UrEoxUOSsz2I1mWNtMFvTuu1tEWAtfBXCqFlocqRlkv6Cb8e6r2qcLJK3uC3v2cd/t
	 90Rt47EES+aHecYixKs+kgHg9TcpOLGj3BnamWu54nb0u31lE4m8J1qkepueG66Dv3k+n
	 oEAg399lqUmJ1fActbjmYNJJjRhxBIcrBFrfgCHC1fB0lfRm9gQjKE2elRkhJ9CjFHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=perches.com;
	spf=pass smtp.mailfrom=perches.com;
	arc=none smtp.remote-ip=216.40.44.15
Received: from relay.hostedemail.com (smtprelay0015.hostedemail.com [216.40.44.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66073606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 18:36:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66073606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perches.com
Received: from omf17.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay09.hostedemail.com (Postfix) with ESMTP id E719880A27;
	Sun,  1 Nov 2026 18:36:29 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf17.hostedemail.com (Postfix) with ESMTPA id 57A301A;
	Sun,  1 Nov 2026 18:36:28 +0000 (UTC)
Message-ID: <9d9626b16393901994012fa59824a63e96acd6ab.camel@perches.com>
Subject: [PATCH] get_maintainer.pl: Fix inexact file pattern matching
From: Joe Perches <joe@perches.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Borislav Petkov <bp@alien8.de>
Date: Sun, 01 Nov 2026 10:36:27 -0800
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
X-Rspamd-Server: rspamout07
X-Rspamd-Queue-Id: 57A301A
X-Stat-Signature: 1muab9hsf4rh51qtu3raobuozmm88rk3
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1+GDzaXAkdeWehuQojB6nnKvmpbdzfzFWw=
X-HE-Tag: 1793558188-101353
X-HE-Meta: U2FsdGVkX1/DAkcidbtDxJPh5LqJzKb+XLbdnyxkqlKik9Y2l1Q08bPWpnwTYF1IqWwBCH1MwUDFxF6hjhQ1D2IvlJwunBfxk/pHnBEky98rGk+XF2gY7XdrJU+cLL+EuIvBfeIo5tisdqwRgIHx78ZPXBbUZrwwM/QXTYjMgh35b3h8Ec8T/CYNi7C26qnofh+yQxAU6OliKIsJBJ/5Q0MeyRczlEpXuq1hy7uSXTM3w6exx6BGcm+OlISB70Vj0hiOMrSCTHRYxdezlyVSbURSJcfKfvgFneAr1ZvuBUaC11+KcTCewMD1oAFAA9rFvItG1Pm3buMwNXKTZ+Z3Czo2y0PW4MrDyM9eU4eOr4THuFebFGE834kjswpXvKor

The intent of file pattern matches is to exactly specify a
file pattern with or without wildcard **, *, or ? expansion.

The pattern match code failed to include a trailing $ to
match the end of the pattern.

A pattern like:

F:	include/drm/drm

would match files like include/drm/drm_<foo>

Fix it and the self-test code too.

Signed-off-by: Joe Perches <joe@perches.com>
---
 scripts/get_maintainer.pl | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/scripts/get_maintainer.pl b/scripts/get_maintainer.pl
index 16b80a700d4ac..48328c48f5341 100755
--- a/scripts/get_maintainer.pl
+++ b/scripts/get_maintainer.pl
@@ -768,6 +768,10 @@ sub self_test {
 	    if ((-d $value)) {
 		$value =3D~ s@([^/])$@$1/@;
 	    }
+	    if (substr($value, -1) ne "/") {
+		$value .=3D '$';
+	    }
+
 	    if (!grep(m@^$value@, @lsfiles)) {
 		print("$x->{file}:$x->{linenr}: warning: no file matches\t$x->{line}\n")=
;
 	    }
@@ -1062,7 +1066,7 @@ sub file_match_pattern {
 	    return 1;
 	}
     } else {
-	if ($file =3D~ m@^$pattern@) {
+	if ($file =3D~ m@^$pattern$@) {
 	    my $s1 =3D ($file =3D~ tr@/@@);
 	    my $s2 =3D ($pattern =3D~ tr@/@@);
 	    if ($s1 =3D=3D $s2 || $pattern =3D~ /\(\?:/) {
