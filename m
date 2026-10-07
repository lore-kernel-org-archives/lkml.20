Received: from relay.hostedemail.com (smtprelay0011.hostedemail.com [216.40.44.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ABA8379ECF
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 18:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791398908; cv=none; b=Y75h8NSNtLdb3Hu0Evzaa+zijmmES37oW1t+r8NwUalepzFj8rc4anq58Zc6ndzFn/Ofw1Y3ZCSp4PMFKlrAQnSVTma5wVi7+p+qAE8tVfDu99/pMY3JWhULTgRPswf4OBQDn178RnpbhjcJvhEz078aYdyqMKzDMYKOhynbLmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791398908; c=relaxed/simple;
	bh=fgu6dtOv/TdozsWFqgHq3Q9N+1WyqxRIEOMHp1UCa9Y=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=iWbd450s204S+0cYFXjjOvh+c6PerAgJVEVJRXQjpeisidU3ifS5DdJHHDbzeJPAmSUzMCdut3I58IPCyPCrvPAIfI42MqrfadRW+RhbdQw71tCTpIoC9jYkR2E6t5gch05SNGWDdnfrwfy4Jhy0A1iV6aSo7j1zVpryVtTHgLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com; spf=pass smtp.mailfrom=perches.com; arc=none smtp.client-ip=216.40.44.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perches.com
Received: from omf06.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay07.hostedemail.com (Postfix) with ESMTP id 460A8160324;
	Wed,  7 Oct 2026 18:48:26 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf06.hostedemail.com (Postfix) with ESMTPA id 9379F20011;
	Wed,  7 Oct 2026 18:48:24 +0000 (UTC)
Message-ID: <4e3b6c53200cbd5acdcc2ed4410bcf27df247474.camel@perches.com>
Subject: Re: [PATCH v2] checkpatch: report warning with files ending with
 blank lines
From: Joe Perches <joe@perches.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Andy Whitcroft <apw@canonical.com>, linux-kernel@vger.kernel.org
Date: Wed, 07 Oct 2026 11:48:23 -0700
In-Reply-To: <6ac6900c.57ea3510.27c6b6.f79d@mx.google.com>
References: <20261007122837.2995-1-ansuelsmth@gmail.com>
	 <e8ef6959a0cb7093cfe4933da99fdfb5567f5354.camel@perches.com>
	 <6ac678df.04a8e9ff.23fe56.b815@mx.google.com>
	 <a098c4e66a4cabd61b8a7c933db7f21ad5648d5b.camel@perches.com>
	 <6ac6876f.31081df4.3ada42.ff1e@mx.google.com>
	 <3e05a868415881335dec29a5d73f7994393f7409.camel@perches.com>
	 <6ac6900c.57ea3510.27c6b6.f79d@mx.google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-2.fc43) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Server: rspamout02
X-Rspamd-Queue-Id: 9379F20011
X-Stat-Signature: qj3cefbtuqho6jcupqo6nm41fatddci7
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1/6i3g4v+CuxKc6OjDVCiqtbLgcscgm49Y=
X-HE-Tag: 1791398904-634232
X-HE-Meta: U2FsdGVkX18E9iGXS0+0ysvac/XfMUS/lX6fa7QIwGkMdeN6qsgC52Y68hl0mWBw2PMxakzvb3lqRpn5cP0EIj/ig3/Q0mgz8BC4nUc4May0MIsuV1dMv4HW3DM2UtiYiWgwnS8/fyF9aQwHrWbc05I6kkPcph2A0CfaWI2d4+SxUXZV7+t3E+kAQqxLbjssPrkuqkIBm2V613dlSXsdBKhXf3V8f+8vUsXNDOAG7k6HDYMYBHZTKaobv2Vgq5J9NmL9OrNj05DBEyJzhyw5hP5C9dkoIgFlrRbgE14K2+P0taldFZ9mGYDAGlh+IfmK

On Wed, 2026-10-07 at 20:31 +0200, Christian Marangi wrote:

> > > It's to catch situation like this. Example for entire new file or add=
ing
> > > stuff at the end of a file, where a new line is introduced.
> > >=20
> > > git am will complain about this.
> >=20
> > It seems there's something odd about the patch content
> > as there aren't any context lines after the addition.
> >=20
> > How was it generated ?
>=20
> It was just an example, it's not the full patch. Just the last patch.

Send more correct examples.
