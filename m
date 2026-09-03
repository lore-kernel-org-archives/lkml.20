Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B8B046D080
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 07:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788420624; cv=none; b=Pi4CAQAmkkPkdlXk9PTTPhU1iImg4U1VRbi4T3lvL/0q3myV+4OIYWieKkA4mSfC/Qs0Zs0Dio+5HqM7uXkmRQk3F+4co38KFJ8xIrnOLduvrhP5v+i4kZRsQsrh9NpMQrDpZgP3gyb7s9OhQAd8VVr6j2MoCq/yet98YnULRB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788420624; c=relaxed/simple;
	bh=hi9/ss+XwXyt+GGmj4xfN1/dVWm9C1LDZ/JdbYapZz0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JYARtlU8wTG6i4MkrGpWGZxyEIpe1fO3f+Mvp2yQUUaBzVhaWHwLy9CPZBdeRiKOuk7S3KcPQ9lXP60bxMw34YcGkThcCIID1AVfKM8ZJAVYuP1TKqAz6/nmeCwZyay84+MgvD6ur4BXeox1X5CWvZJ2hFytVFOQ9I4bgVwhMu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ay/ouNP+; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ay/ouNP+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788420609;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hi9/ss+XwXyt+GGmj4xfN1/dVWm9C1LDZ/JdbYapZz0=;
	b=Ay/ouNP+xE946FzHWRwOS3XgiCl0h84/3r3RM+M9gnkSPv1S6T9cwk0QCSetHUX32kvBmr
	JYABt+rMaGgItG5d5MJOCAULznn9vQt+rvLmMgZpuXA0WleD0wX62/Pf6xyghCiZ4xBTB+
	gMyhpG9NmEbrhy2EeuKH1LIXRC0hpHQ=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-356-96g3OIn3O5Sxyb97uQo6Hg-1; Thu,
 03 Sep 2026 03:30:02 -0400
X-MC-Unique: 96g3OIn3O5Sxyb97uQo6Hg-1
X-Mimecast-MFC-AGG-ID: 96g3OIn3O5Sxyb97uQo6Hg_1788420601
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 28B921945118;
	Thu,  3 Sep 2026 07:29:54 +0000 (UTC)
Received: from fedora (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 613AD3001D9A;
	Thu,  3 Sep 2026 07:29:50 +0000 (UTC)
Received: by fedora (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Thu,  3 Sep 2026 09:29:53 +0200 (CEST)
Date: Thu, 3 Sep 2026 09:29:48 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: "Eric W. Biederman" <ebiederm@xmission.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Hyunwoo Kim <imv4bel@gmail.com>, brauner@kernel.org,
	peterz@infradead.org, anna-maria@linutronix.de,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2] signal: Prevent exec() race
Message-ID: <apkh7AMz2LbMqe_G@redhat.com>
References: <871pbfeaiv.ffs@fw13>
 <87zey3fep2.fsf@email.froward.int.ebiederm.org>
 <87pkyyd39l.ffs@fw13>
 <87h5kad0mx.ffs@fw13>
 <87bjaie2gc.fsf@email.froward.int.ebiederm.org>
 <87wlt5aybr.ffs@fw13>
 <87qzjcdh06.fsf@email.froward.int.ebiederm.org>
 <87ecfcbyt1.ffs@fw13>
 <apgwWTwG_oq3ij8n@redhat.com>
 <8733vqbzui.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8733vqbzui.ffs@fw13>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

On 09/03, Thomas Gleixner wrote:
>
> On Wed, Sep 02 2026 at 16:19, Oleg Nesterov wrote:
> > This is subjective and mostly cosmetic, but what do you think
> > about the alternative change below?
> >
> > I won't insist, but to me both the patch and resulting code look
> > a bit simpler this way.
>
> Yeah, though if we restructure the code then I rather prefer to get rid
> of the gotos and also move the cgroup...end() part out of the sighand
> lock held region to make that as short as possible.

Agreed, the resulting code looks good to me.

Oleg.

