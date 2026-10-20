Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792489983;
	b=Dnnqp1//bv/LZvqkdVgy/px0VEaTE7htNHULikcqoQ70yOpSKwxWFlzPnThN/3mRVDPz
	 3OUB+l4rHgZPSdT5VC8ADi43Zh1T+7Hgrap2CEjBnT61qQOfJW7+FlkHafb5GKLk3icEL
	 m3zN53PJ6iXj1+pVO5Nxletu0rz9g7TVJnZ/C+SpP8MTVZGhjM83z+8zlAKM1rV4YwZoG
	 axGRShHPOSlbt4IETlU0m6OxGuq/UZ/jTX5cmfWfAsV3ikKsTG79glDz3FL0CVAJxm8/h
	 GYxHgtyughpn+tyT0MYITB5cwkc04KKl/8KUwKbMrwG3gunKJ5wu7/P/QihYrbkLz1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792489983;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Scanned-By;
	bh=YS8avYxqYm9He26pPgQ1C7oVGAea1Xa+Sj31NtGOY38=;
	b=wqZEeVzdyFlrxPVe1nDl7GsS39Ftj9Xc6/z7eT85M27qrIxntn/SeWbkh+A4e5zWs3wQ
	 h2hqE5l76kgWCJCwAaO8AbC6fJl1ENd6SBopTZ8d7YnSLJHEmqD8siELAJGdNg/m9eZsv
	 gLuL2/Y/x9Pjb+hndFbtp+7O1rLhkxGvrTDivKjEvJmIdS6dY1GfvGzfo6vJquOkzvD3S
	 SOt1rlXqe6H45TUP/Azp6KSCMPvgSP32A8RirSIidcCecR08SlCGW6ES78i+N0cGdU8Zy
	 YM/NXIS8VXpd2gk8NOHWQP+qf5J1QNmP4uYgdjLPuzt5N9xTH0V331AliAw7VUoWXew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OEWlK6rJ;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD266606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 09:53:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD266606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OEWlK6rJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792489981;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YS8avYxqYm9He26pPgQ1C7oVGAea1Xa+Sj31NtGOY38=;
	b=OEWlK6rJS8pVKFidncGgBMe27srV0uHjWlWcgUiWPC3wsRNKmMNDf7lbOyq4Ssn3G/RhXd
	uEjUG8/AKw5eQ8R18mSGEzB1xgVVSpg/f8u8VFZ1Oy9gqG4SZZ7S9LrBkMHNa+qbDUpPF/
	Bz24RtMGRu36NCXuo3DbUAsuGaEz4bo=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-228-fKxQD40XNpy74d3mygqPaQ-1; Tue,
 20 Oct 2026 09:52:58 +0000
X-MC-Unique: fKxQD40XNpy74d3mygqPaQ-1
X-Mimecast-MFC-AGG-ID: fKxQD40XNpy74d3mygqPaQ_1792489977
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id DCCAE180256B;
	Tue, 20 Oct 2026 09:52:56 +0000 (UTC)
Received: from onestero-thinkpadp1gen7.tpbc.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id B358E195608B;
	Tue, 20 Oct 2026 09:52:54 +0000 (UTC)
Received: by onestero-thinkpadp1gen7.tpbc.csb (nbSMTP-1.00) for uid 13628
	oleg@redhat.com; Tue, 20 Oct 2026 11:52:56 +0200 (CEST)
Date: Tue, 20 Oct 2026 11:52:53 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: fujo <hooyan2024@gmail.com>
Cc: linux-fsdevel@vger.kernel.org, Christian Brauner <brauner@kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] selftests/pidfd: wait for POLLHUP before reading exit
 info
Message-ID: <atc59R5-oBnyOIb8@redhat.com>
References: <20261017054356.7874-1-hooyan2024@gmail.com>
 <179226499044.847.17334319321039510150@gmail.com>
 <atTy6LziL5fdGTkn@redhat.com>
 <179234213014.649.6368924662349703640@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179234213014.649.6368924662349703640@gmail.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

On 10/18, fujo wrote:
>
> The zero-timeout liveness check in autokill_pidfd_open_no_effect keeps
> POLLIN; it verifies that the child has not exited yet.

Confused... V3 still changes the 1st poll(&pfd, 1, 0) to use POLLHUP?

Oleg.

