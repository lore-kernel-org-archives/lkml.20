Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4DF84CF477
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 15:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792252166; cv=none; b=peXwAc0+/s4KZXIluCuZ/dz4PSLDGqHw+NTDLkfi25x9LYmO3M2YTRlb1Yss8SZeWC+ZdEgzV2LLJX0slYm6nQXl+JsjxSUIHEkQp7QgBcdr5X+9crfvZka9QNi7RU8ysDDlCPRbQLfLYYJao6KZeAL1z+aJ7ptFvvgWvAG2sjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792252166; c=relaxed/simple;
	bh=TsYyDauOj0q/EW5pxmxonBE+b3Sfq0x0+kwcBo3WqF0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uMZ8H9a6Nwb6Uq9Gu5vaSjkJkUjNaL1ZlpLuNj3edosusXZemw0Wd0EzN38u8mJxDj/UpRJqKKwSFEdU1gqKEF1QMRkpWuChLv0FmWZnykPaXroxfMsyJEjQRLsXVOKiAUIWEK/N3Fp1bBAKqeEsi/k+mlkBkHBGZPF3JC3hTBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aWL+Ytd6; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aWL+Ytd6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792252163;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=R69PGyadI6wjWvrcco2cOdeAx/AQ18vsIO4SG9pdEoM=;
	b=aWL+Ytd6+AHggvJLgA0WytfwRCyUc8JIBPlsa7kMa2Xyjsz3s3x9fAOtjLDUr9yI10mAad
	88VM+pAhvY6iZpx2elWhmS4KUgMvpcSGflz4weP8ylui61tZYMjDJJMY8q2VxQK83bkIZn
	ZJNt2KUl++9zL8ucAaUsCen5Lm0TZfU=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-237-nYDyi_5AMBafLWPrOfTphw-1; Sat,
 17 Oct 2026 15:49:21 +0000
X-MC-Unique: nYDyi_5AMBafLWPrOfTphw-1
X-Mimecast-MFC-AGG-ID: nYDyi_5AMBafLWPrOfTphw_1792252160
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id CAA8C195604C;
	Sat, 17 Oct 2026 15:49:19 +0000 (UTC)
Received: from onestero-thinkpadp1gen7.tpbc.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id B6C241803A40;
	Sat, 17 Oct 2026 15:49:16 +0000 (UTC)
Received: by onestero-thinkpadp1gen7.tpbc.csb (nbSMTP-1.00) for uid 13628
	oleg@redhat.com; Sat, 17 Oct 2026 17:49:19 +0200 (CEST)
Date: Sat, 17 Oct 2026 17:49:15 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: Christian Brauner <brauner@kernel.org>,
	David Laight <david.laight.linux@gmail.com>,
	Jeff Layton <jlayton@kernel.org>,
	Mingyu Wang <25181214217@stu.xidian.edu.cn>
Cc: alex.aring@gmail.com, jack@suse.cz, viro@zeniv.linux.org.uk,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/1] add pid::tasks_lock to fix send_sigio() and send_sigurg()
Message-ID: <atOY-5ZjqVTQw2JE@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

Not for inclusion yet, just RFC. In particular, I'd like to have
a review from sashiko, I am sure I missed something ;)

Only compile tested, the changelog is obviously incomplete,
__change_pid() should die after this change, etc.

And. I am still not sure that the new lock should be per pid, perhaps
a simple global lock which aligns with tasklist makes more sense, it
should not be contended too much.

Please comment.

Oleg.

 fs/fcntl.c          |  4 ++++
 include/linux/pid.h |  1 +
 kernel/pid.c        | 24 +++++++++++++++++++-----
 3 files changed, 24 insertions(+), 5 deletions(-)

