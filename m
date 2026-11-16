Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794842276;
	b=3Gdl1wQq3eHiy/oouHhpmQxyoaPDtdlsxePhvmp9fUwAdGQKxlfOkFczvTm4hHhsTUgq
	 dnsrO1G4IvhUCZTS7vZARWgo+p2S9gZCAhqHQCskp66ARuW4I6MxpYPrSt9Yd9uQfaUlY
	 uePPEUwWppCN6QkAyuOpP8M5qoo5IejHZsxwDODUZJe3brbOaE5hiplIkqlDZ8j6GDOBc
	 dddsTke8v+ZH6U4kB1AasQs+Mb3DUUh8nhCCCEqrXeyKtFER96EM/lAlcJ5uw725CXEh+
	 IO13bG9Nt0/zRpREBraAOEgSAg8ahHb0F1sjnpZYKnGgsezcTKwqzchY3DE8JeVYiwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794842276;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Date:From:To:cc:Subject:
	 In-Reply-To:Message-ID:References:MIME-Version:Content-Type:
	 X-Scanned-By;
	bh=b37GkLVGO60t3CXWtXvYGydBuiHnKhL1cK13DcMfi5U=;
	b=KrDaW1T7MO4W5C0aexr0kXZ0dlwj1Jq/ejNjgsIsCFstEcjvS74mM0hLn2iRh0FRnBtY
	 IhwEaDmWoMAG5yk1mYpviOv07CpFlBtZntidr3Kc9SsvFG4T5M58mj9v+YCe4lLp/a0vF
	 bwET5bfzWbGYmp8mC2Ck8sj6SGNWn9syVjy9vKNr09p7ddIaFY1IgMJetaSKSyU2VhAnK
	 WygP2CtM0SKTlii6vhIA/dq4KuJNlNU7JWKumtpT9agEtuIQHE9nI3dIbTt2hFyENw61j
	 SxvCAIXspTTyq7E+MaprJ8XaPzxrKjRy97wwi1AhdSBjJFRGbkgpELYB8H9HTuRiDqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=A2Ug0Ecs;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B145F606A322
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 15:17:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B145F606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=A2Ug0Ecs
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794842274;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=b37GkLVGO60t3CXWtXvYGydBuiHnKhL1cK13DcMfi5U=;
	b=A2Ug0EcsoKswtKspGFDzf7Cozul8ql3sZhyLbjCBatcGpLp6564iBbs/9+QNoGbNgq61BE
	rObTqI0Bl9Vh98sUjb/BGqxjgxdpiDSF2lk49npLo2l5E7XSdHaNzO4F3Lommu2lbGMGtV
	aDp0WiZas8m599z10fkoLWCF+USYg/0=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-668-N42HNi2bPPmAj8foRtmBEg-1; Mon,
 16 Nov 2026 10:17:51 -0500
X-MC-Unique: N42HNi2bPPmAj8foRtmBEg-1
X-Mimecast-MFC-AGG-ID: N42HNi2bPPmAj8foRtmBEg_1794842270
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id AF301195604E;
	Mon, 16 Nov 2026 15:17:49 +0000 (UTC)
Received: from mpatocka-thinkpadx1carbongen12.rmtcz.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A14CF1956047;
	Mon, 16 Nov 2026 15:17:47 +0000 (UTC)
Date: Mon, 16 Nov 2026 16:17:43 +0100 (CET)
From: Mikulas Patocka <mpatocka@redhat.com>
To: Aibing Chen <chenaibing@cmss.chinamobile.com>
cc: Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>, 
    Benjamin Marzinski <bmarzins@redhat.com>, dm-devel@lists.linux.dev, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dm-integrity: initialize free_sectors when the superblock
 changes on resume
In-Reply-To: <20261115115329.1174-1-chenaibing@cmss.chinamobile.com>
Message-ID: <a0d2a86b-a001-9f82-1d08-fd8348688218@redhat.com>
References: <20261115115329.1174-1-chenaibing@cmss.chinamobile.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12



On Sun, 15 Nov 2026, Aibing Chen wrote:

> fc79aeb86a2c ("dm-integrity: validate the superblock on resume") made
> dm_integrity_resume() jump to skip_writes when the on-disk superblock was
> modified while the device was suspended.  That path skips
> replay_journal(), so the journal accounting variables stay
> zero-initialized: free_sectors is 0 while journal_sections and
> journal_section_entries are nonzero.
> 
> A later suspend or flush queues integrity_commit(), which calls
> pad_uncommitted() in journal mode.  Its invariant
> 
>   journal_sections * journal_section_entries ==
>   (n_uncommitted_sections + n_committed_sections) *
>   journal_section_entries + free_sectors
> 
> no longer holds because the right-hand side evaluates to 0, and WARN_ON
> fires.
> 
> Restore free_sectors on that error path, as replay_journal() does for the
> normal resume.  The section counters are already zero and nothing will be
> committed, since the device is marked failed.
> 
> Reported-by: syzbot+94dac3c75477e184f0b0@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=94dac3c75477e184f0b0
> Fixes: fc79aeb86a2c ("dm-integrity: validate the superblock on resume")
> Cc: stable@vger.kernel.org
> Signed-off-by: Aibing Chen <chenaibing@cmss.chinamobile.com>

Hi

This should be already fixed by the commit 
e5e03918fbec31f0c896f4f43c2bd2aadf35d43d ("dm-integrity: don't attempt to 
commit journal on disabled device")

Mikulas

> ---
>  drivers/md/dm-integrity.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/md/dm-integrity.c b/drivers/md/dm-integrity.c
> index 802b37761..6ab305b60 100644
> --- a/drivers/md/dm-integrity.c
> +++ b/drivers/md/dm-integrity.c
> @@ -3915,6 +3915,13 @@ static void dm_integrity_resume(struct dm_target *ti)
>  		memcpy(ic->sb, ic->sb_copy, sizeof(struct superblock));
>  		DMERR("The superblock was changed while the device was suspended");
>  		dm_integrity_io_error(ic, "superblock check", -EINVAL);
> +		/*
> +		 * replay_journal() is skipped below, so the journal accounting stays
> +		 * zero-initialized and pad_uncommitted() would trigger its WARN_ON.
> +		 * Restore the free sector count; the section counters are already zero
> +		 * and nothing is committed because the device is marked failed.
> +		 */
> +		ic->free_sectors = ic->journal_entries;
>  		goto skip_writes;
>  	}
>  
> 
> 

