Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 920F5382F1E
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 16:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792253416; cv=none; b=P6qqDR1H8hd+MLVSONLIRqayHMw/jSrlqzkSXZx+sqSJ7mQpz7iWI7LlUbJJUSCoxf6DihGXRR1IaOUp5xHItiVacvzgELzK9bq8NCAHdkWq9LwQnW0JZ3pnHCVufzzaFiwaxQ1rydDqCV0ywMSzGfJEf1lBIvHHntkB6akcsjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792253416; c=relaxed/simple;
	bh=CBJIMtV+q8fJ/U/jmSoMIwuQ7z8eMt8j3oy5XGf/Uj0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iVr/rv3YGqcHyUkqAjE0X5/rtW3edzvxynCviQt77f2qKGuZSZegRfBCJt56CV1h0d3SXQeuUM8KzZ2oqf4S7lOtSBoysJbznh4VNKL46S13f5/642YPfFU6pnIo3+aMNPx9pju3M9YHmSxw+Z3ONa82QlsvPAQLzRoRpEv9Qok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CRvX+PQV; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CRvX+PQV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792253414;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CBJIMtV+q8fJ/U/jmSoMIwuQ7z8eMt8j3oy5XGf/Uj0=;
	b=CRvX+PQVTNAkOXPZVXQLBDhbCGl8y2Zn/wbFz0hIAF3U5Qfq0E0IqV+Ha/UVRisKEQQlsh
	vEbuElbe/QUbPyRoTn2RvYJkwHrLSB90rYItJsF238prkCF/8lz8F0JJLkqhGAHRRViZNu
	raPHw3MaoBD7w5LDY3gr9QQS1a99UEM=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-308-xh8a3FtMObiu6ianXQtmGg-1; Sat,
 17 Oct 2026 16:10:08 +0000
X-MC-Unique: xh8a3FtMObiu6ianXQtmGg-1
X-Mimecast-MFC-AGG-ID: xh8a3FtMObiu6ianXQtmGg_1792253407
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9D2661956042;
	Sat, 17 Oct 2026 16:10:06 +0000 (UTC)
Received: from onestero-thinkpadp1gen7.tpbc.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 595BE195608A;
	Sat, 17 Oct 2026 16:10:03 +0000 (UTC)
Received: by onestero-thinkpadp1gen7.tpbc.csb (nbSMTP-1.00) for uid 13628
	oleg@redhat.com; Sat, 17 Oct 2026 18:10:06 +0200 (CEST)
Date: Sat, 17 Oct 2026 18:10:02 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: Christian Brauner <brauner@kernel.org>,
	David Laight <david.laight.linux@gmail.com>,
	Jeff Layton <jlayton@kernel.org>,
	Mingyu Wang <25181214217@stu.xidian.edu.cn>
Cc: alex.aring@gmail.com, jack@suse.cz, viro@zeniv.linux.org.uk,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/1] add pid::tasks_lock to fix send_sigio() and
 send_sigurg()
Message-ID: <atOd2kfmyDJEf66f@redhat.com>
References: <atOY-5ZjqVTQw2JE@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <atOY-5ZjqVTQw2JE@redhat.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

On 10/17, Oleg Nesterov wrote:
>
> Not for inclusion yet, just RFC. In particular, I'd like to have
> a review from sashiko, I am sure I missed something ;)

https://sashiko.dev/#/patchset/atOY-5ZjqVTQw2JE%40redhat.com

Indeed I missed something obvious. I forgot that attach_pid() is called
under siglock. So this change needs more work.

Thanks Sashiko.

Oleg.

