Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.95.11.211
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793961982;
	b=ei1q+sP2a8KTdTJMw8M81JybpBdm4jxdDBn8jOwS1pfr9wyeV5mLUvUs2lgmSJo5klGo
	 J3JIybRS/Kt2qzYcM0FZg3aFK1btEEk/We6wepqYCYJ8piZElib/34eUf3Mw+a/mYXr18
	 RBgLh9eg1y0R7x6bh+v7PEoKclQuVc3Zcith+Q01WKnr+yHHQ0lXn9zWXTiUn3gpDsFNh
	 ETJxoi/2k4l3qLXVECm1//zjREPgrKhKcmt7pWUdPDzDQwpWqdTtAcXCVd807OX/5B6it
	 psM60bo24XxzsmnCpVS+wHqVtSriQ0St0BO4B8/kDRhZe8m9pLMmvdQUBFFJJKjMQdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793961982;
	h=DMARC-Filter:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=J7UI5nLZkT5qt8k8Tf21m5WtN/wrTPJmSDvwvBhEOrg=;
	b=Mq2SYeW+3tPjdPsGfDP+sI5vVZU736tRg9ay/BDoUWh5WCR6iMCJR6B28tPyOQ2GzfA4
	 1rBLYMS9t1xEKm7u5DDv7A4EsZA89cWpIplxKMiCF4UNU4TZEtFXZMQGb2A+5jMgWkcYA
	 pQTyEfBPKaRC+cqViooq1Rd1yBVn46ZiRb2ox2vXNO1ZHgz2SOdiRBXyNDLUopxOYDDxz
	 ME5vQlSPWD4yAGNWR+65PNhFnGJ+2UDQfcqmOwCtpQrEYsBOhjaIj+Fo4I1VRyN9bDS3/
	 ybNqAKSj5ZQvKkIXnOR0U18LmUWr2QBwZD4xpfvj79VeM4OQ2sQ530bSF5Al89GPe3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lst.de;
	spf=pass smtp.mailfrom=lst.de;
	arc=none smtp.remote-ip=213.95.11.211
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32916606A330
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 10:46:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32916606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 7C39768BEB; Fri,  6 Nov 2026 11:46:17 +0100 (CET)
Date: Fri, 6 Nov 2026 11:46:17 +0100
From: Christoph Hellwig <hch@lst.de>
To: Heming Zhao <heming.zhao@suse.com>
Cc: joseph.qi@linux.alibaba.com, mark@fasheh.com, jlbec@evilplan.org,
	hch@lst.de, ocfs2-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v5 0/4] migrates ocfs2 DIO from buffer_head to iomap
Message-ID: <20261106104617.GA5746@lst.de>
References: <20261105071930.16399-1-heming.zhao@suse.com>
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
In-Reply-To: <20261105071930.16399-1-heming.zhao@suse.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

s/migrates/migrate/ I think.

On Thu, Nov 05, 2026 at 03:19:24PM +0800, Heming Zhao wrote:
> To simplify iomap development, we currently adopt the simplest approach:
> retaining the buffer_head style, where only one cluster is allocated
> per iomap_begin() call.

Do you mean you'd otherwise need changes to the core iomap code?
Or do I misunderstand the sentence.

