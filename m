Received: from relay.hostedemail.com (smtprelay0015.hostedemail.com [216.40.44.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F16513CFF77
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 16:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791391809; cv=none; b=XnTJhXc0+L1M8UqJMgRrWhjRXHqQr2IB1QgUF2yZikmsW+0WpgG+JoVGVRZZe7p0AwNT8bPK3aK2VHsTUUlQbER5VPjECMJ24DOD8rc2Ud1rvo4j8AtMzRLpwkNjyzwXX4ghMS0/k+9pJWJQj91h6iBI68gSqiEe4DJ8VXDz+Cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791391809; c=relaxed/simple;
	bh=2kKq6qDgwPsWogR8ssrSF2ugLsEotAaQ5OzJ9fpyxqk=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=i1jyZK3XRDUdg3s/Ffnhm2l2+BUrBgZLPic2Q5SxLFerhx2FENYKMa/7y35dfaC9TIZwZYzo4VB6dH62h10wcI/2i2VToU/EPoBK7X3HZwlIIe4XwYBNEkghP6S/njoQgAC9tRSEUauRyAmrzPu7Lp08835tIXmFdohmuqG2qZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com; spf=pass smtp.mailfrom=perches.com; arc=none smtp.client-ip=216.40.44.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perches.com
Received: from omf19.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay01.hostedemail.com (Postfix) with ESMTP id 0BCA11C25E4;
	Wed,  7 Oct 2026 16:50:00 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf19.hostedemail.com (Postfix) with ESMTPA id 6794920025;
	Wed,  7 Oct 2026 16:49:58 +0000 (UTC)
Message-ID: <e8ef6959a0cb7093cfe4933da99fdfb5567f5354.camel@perches.com>
Subject: Re: [PATCH v2] checkpatch: report warning with files ending with
 blank lines
From: Joe Perches <joe@perches.com>
To: Christian Marangi <ansuelsmth@gmail.com>, Andy Whitcroft
 <apw@canonical.com>, 	linux-kernel@vger.kernel.org
Date: Wed, 07 Oct 2026 09:49:48 -0700
In-Reply-To: <20261007122837.2995-1-ansuelsmth@gmail.com>
References: <20261007122837.2995-1-ansuelsmth@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-2.fc43) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Server: rspamout06
X-Stat-Signature: mmn99o55jxikdo6bersaeoixpb1brpbn
X-Rspamd-Queue-Id: 6794920025
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1+6JoPkh/IUOYcGEN8Bp/nzRPWdLQuqrj4=
X-HE-Tag: 1791391798-92360
X-HE-Meta: U2FsdGVkX19EI3H11Sqx58eTGxn4N8kF+jiYoZq9tYemywzCOHnJ/Ejq471lmpo+kb/DDX3thAuj18TMjBVvWYUnTf9X3s2Y/RkBrptIzAhMLmCXdAeyf1VUt1EMCI1WKgCsbgXPNPnXjuuT8lfpu4yGIpmrXMcm3BybuXlSiBLPI0Z0ALKEA5wqt/Plq1l2wEFkO9Zticxx30a1XDRLtLX7jEY+6vXF62BN26xmEZ9MCww/4bAHorHsMNyh7rEMbKEl5PzCQu9Q/KG/G0ae7KsVE7p+X6YfJsWiSr+S3qVISY8NNDchGwOUQ65zi3Ni

On Wed, 2026-10-07 at 14:28 +0200, Christian Marangi wrote:
> ```
> On applying patch, git, depending on the default configuration, might
> complain for any file having blank lines at end of file.

I was not clear enough in my first reply.

I meant that the test should be done only once, not
for each line of the input.

After the end of the process() loop of

	foreach my $rawline (@rawlines) {
		[...]
	}

a single test of $rawlines[-1] could be done.
