Received: from relay.hostedemail.com (smtprelay0015.hostedemail.com [216.40.44.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C8C24B0E28
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 17:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791395436; cv=none; b=sPqXL+RG+7dL8SDfzBlM0YnoELgSou1V+e2A24YmKbTvIM+2M5g0IQ0w9vU1rkkGmCF68pFfKW+PkbqmUMgCLRvEPMItHqzIvIHupX6sEc8UuzLodwi1W974U8iB1jsBiCm1LHH0swCuTvkbCWGuIcMomnOl+s0GSJw4P9ROcMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791395436; c=relaxed/simple;
	bh=48fK/8eYFv6S+BdHZd2TSU3L3L+8qQr+m9rmXJMkAC0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XRyHTHS26PnoJQ46A/P82LnmGmhZk8S6tGlQK45NNp+mt2nmT3jcAifiQewypIBOAD+zkq0CRuFF48UqSqeVzywjj2iSpAmZ4vFq/MiDBTn5K8BnRRxsdjtRaAA7BDGtwjYe47oOQD0EK0k0/8xWKiDjoCn3YyY7Cj9z7H2yPyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com; spf=pass smtp.mailfrom=perches.com; arc=none smtp.client-ip=216.40.44.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perches.com
Received: from omf01.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay01.hostedemail.com (Postfix) with ESMTP id AD3E91C2BEA;
	Wed,  7 Oct 2026 17:50:33 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf01.hostedemail.com (Postfix) with ESMTPA id E5B6760010;
	Wed,  7 Oct 2026 17:50:31 +0000 (UTC)
Message-ID: <a098c4e66a4cabd61b8a7c933db7f21ad5648d5b.camel@perches.com>
Subject: Re: [PATCH v2] checkpatch: report warning with files ending with
 blank lines
From: Joe Perches <joe@perches.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Andy Whitcroft <apw@canonical.com>, linux-kernel@vger.kernel.org
Date: Wed, 07 Oct 2026 10:50:30 -0700
In-Reply-To: <6ac678df.04a8e9ff.23fe56.b815@mx.google.com>
References: <20261007122837.2995-1-ansuelsmth@gmail.com>
	 <e8ef6959a0cb7093cfe4933da99fdfb5567f5354.camel@perches.com>
	 <6ac678df.04a8e9ff.23fe56.b815@mx.google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-2.fc43) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Server: rspamout03
X-Rspamd-Queue-Id: E5B6760010
X-Stat-Signature: 35y98s3n1aizt3gqjfjechghy87wox39
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1/iONTraa+mqI0EXZtTTxr9cHLtbq9StCk=
X-HE-Tag: 1791395431-836720
X-HE-Meta: U2FsdGVkX18QXCbcHM4y6eYkyhZeryi+rsSdJVH7vet+n73LsiGVFzEo4wQP9RqTLlRJTLPkaqkDOVqJcxBVFtni3Pwp+4g9wkI7BUyPcuOgFHZRkynJ/uwY07bOQkuo8XVKWdiVv3VvEpxjB8hbWeBLWD/RKyrX+duJl1DfLgdpwjmIasiJdD/Le26Txu8lEmC0YjYcUnHplmpS+mYIv6t7waQaWGnx2Ltb2KRsnGI3L/9+R45uJS97GkB652MOcLaTLII2jsf8z7STcDYT0dr7GOhguKQwPoIW1iTgCWKrWbf1b2lzju+YEvfUMzfz

On Wed, 2026-10-07 at 18:52 +0200, Christian Marangi wrote:
> On Wed, Oct 07, 2026 at 09:49:48AM -0700, Joe Perches wrote:
> On Wed, 2026-10-07 at 14:28 +0200, Christian Marangi wrote:
> > > On applying patch, git, depending on the default configuration, might
> > > complain for any file having blank lines at end of file.
> > I was not clear enough in my first reply.
> >=20
> > I meant that the test should be done only once, not
> > for each line of the input.
> >=20
> > After the end of the process() loop of
> >=20
> 	foreach my $rawline (@rawlines) {
> 		[...]
> 	}
> >=20
> > a single test of $rawlines[-1] could be done.
>=20
> Yes I also was with that idea but then I quickly figure it out that we ar=
e
> not testing if the .patch have blank line at EOF. But if the single file =
of
> the patch have blank line at EOF.
>=20
> That can only be done in the process() while scanning each line as it doe=
s
> progressively check new files in it.
>=20
> (unless I'm missing something)

Dunno.  Maybe I'm missing something but maybe something like this:

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index f424dafce5bce..d2f99127a9a9a 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -7850,6 +7850,13 @@ sub process {
 		exit(0);
 	}
=20
+	# check if the last line is a blank line
+	if (($is_patch && $rawlines[-1] =3D~ /^\+\s*$/) ||
+	    (!$is_patch && $rawlines[-1] =3D~ /^\s*$/)) {
+		WARN("LINE_SPACING",
+		     "Blank lines at EOF are not good\n");
+	}
+
 	# In mailback mode only produce a report in the negative, for
 	# things that appear to be patches.
 	if ($mailback && ($clean =3D=3D 1 || !$is_patch)) {
