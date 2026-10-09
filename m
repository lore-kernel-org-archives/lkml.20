Received: from mta1.formilux.org (mta1.formilux.org [51.159.59.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4FE34FDE7D
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 18:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.159.59.229
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791571072; cv=none; b=Iw0caXwgPiBLRwid919q+Q5rBaFaNVKe6DQ81oqDG874kKHuMpWq/g3g/r/LwB/lkVAkHtR//g8C6SZ9l/NYuOKaMnAV/S3WqxRHORkn0Tnhp4x+qdTSq0Du8zmp6eTI1FrKbYA8QnMOnCR/DDLboZVa8tqXCP6ITE+i0liXY6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791571072; c=relaxed/simple;
	bh=93ycdDnvtczFVtQzWTQunjTpf/CZ0/uNpj64UIZd7CM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VFl+P/VXJQ1pIMfVpzKptR3Xxeofj9SzIid8vbKRQNg+Ayl4W54/6zGkrna5QEg26QhoL7CrCJcSIblyFCiGr+/QPl173Of8upgKGG7sJUor2Gcym4dU9ipiGRmADN0DvVW1UPXOOpRktSx0mpiayRuZFzOtS+boBFU9Wlc4/6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu; spf=pass smtp.mailfrom=1wt.eu; dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b=trORIOvf; arc=none smtp.client-ip=51.159.59.229
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b="trORIOvf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=1wt.eu; s=mail;
	t=1791571063; bh=+b2n6HJOcb3+/Z5iHPVuv6XYqdwfmW0TFqIbvMINJls=;
	h=From:Message-ID:From;
	b=trORIOvfEbVAuGkQ6wUTsjlRv/LzmVn5FzG8gf76pd6gsS26QXYaJiaHVsJNxmYCO
	 WhxiIE7Y2QXSH6HHA067Y5609pKrO7uyrAZvWVgr93nEpHbv+/rDkUZuA2hxgRn4yP
	 O4/O4d27fhv4c3vJIzKRGS5Oj2aperQiTts9jZYE=
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by mta1.formilux.org (Postfix) with ESMTP id 2425AC090D;
	Fri, 09 Oct 2026 20:37:43 +0200 (CEST)
Date: Fri, 9 Oct 2026 20:37:42 +0200
From: Willy Tarreau <w@1wt.eu>
To: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        Joe Perches <joe@perches.com>, linux-kernel@vger.kernel.org,
        users@kernel.org
Subject: Re: [PATCH] get_maintainer: only use THE REST as a fallback
Message-ID: <ask0dkduRV5pxeLZ@1wt.eu>
References: <20261008-get-maintainer-the-rest-fallback-v1-1-7d26d0b7aa34@linuxfoundation.org>
 <8e194f64-6add-4fb3-a1bb-9b27719b409e@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8e194f64-6add-4fb3-a1bb-9b27719b409e@suse.com>

On Thu, Oct 08, 2026 at 03:15:03PM +0200, Jürgen Groß wrote:
> On 08.10.26 14:51, Konstantin Ryabitsev wrote:
> > THE REST matches every file in the tree via "F: *" and "F: */", so
> > get_maintainer.pl currently adds linux-kernel@vger.kernel.org to every
> > patch, regardless of whether the touched files already belong to a
> > subsystem with its own mailing list.
> > 
> > Only add THE REST for a file when no other matching section provides a
> > mailing list for it. Files that match no section, or only sections
> > without an L: entry, still fall back to THE REST, so every patch keeps
> > reaching at least one public list.
> > 
> > Signed-off-by: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
> > ---
> > LKML has become mostly a firehose of patches that are already going to a
> > subsystem list. The reason is THE REST: it matches every file in the
> > tree, so get_maintainer.pl adds linux-kernel@vger.kernel.org to every
> > single patch. During the week of Oct 1-7, 2026:
> > 
> >    - LKML carried 13,641 messages (~1,950/day), 90% of which were also
> >      sent to at least one other list;
> >    - with ~2,100 subscribers, that is about 29 million deliveries per
> >      week for LKML alone.
> > 
> > This issue came up during the 2026 Maintainer Summit and the consensus
> > was that "always include linux-kernel for every patch" was never the
> > intent.
> > 
> > This patch makes THE REST a fallback as initially intended: it is only
> > added for a file when no other matching MAINTAINERS section provides a
> > mailing list for it.
> 
> Hmm, for me this will be a major problem.
> 
> As the Xen code maintainer I have stumbled over problematic patches which
> were NOT sent to x86 or xen ML several times, which made it possible to catch
> potential regressions early.
> 
> Having to subscribe to each potentially interesting ML (or using korgalore on
> those) would not be my preferred workflow.

I went into the same situation ~20 years ago, with filters sending LKML
traffic into a dedicated folder, to then realize that I was no longer
reading them because it requires to actively think about it and make an
effort. So I turned this back to my normal folder and I can have a glance
at them as messages arrive (like I'm seeing this one BTW).

I understand the problem of volume on LKML that's not really compatible with
2k emails a day (nor with many people's expectations), but at the same time
I think that a dedicated catch-all list with way less subscribers would be
really nice for those who want to stay a bit informed of what's happening.

Just my 2c,
Willy
