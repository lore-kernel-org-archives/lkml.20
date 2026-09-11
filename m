Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8A8248C8A9
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 13:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789135200; cv=none; b=KiSdTQuttz9LvGvZwUrtHAEuQeni9iNK8Ya2+ipdjsKiub3JDIjzIDhOpvOjoQkAkDUcxlR91cf4y8GLyUWo1Wi43b8tnifmd6KTPi0ZwQzHlm0ZAB3jP2Lm3itjlgUfXMLPB5Y76Xye10tHQZbNzMox+HF/R5CRNjm8Ukoq3rU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789135200; c=relaxed/simple;
	bh=Yqssw4nqL5ibj+WrwaHTzYadBkgg4UhOi3TgHdzZR1U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AsXoKhWWUAPfBiX52O0BmIvYK1061zD7BFswc2Lt7eRADh5OkHQ74XIR9vYv5CemmK4oHu9bWYL9w/7yni87L0aqyTA2xCVWtXCGTph3gieZPdf/CSPfqbVA02E7uICJRpA9YR5OnkNVKUIdiiDdOD/hoYibeqE+LOnVPiL5IO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=N9tKGX+R; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="N9tKGX+R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789135197;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Yqssw4nqL5ibj+WrwaHTzYadBkgg4UhOi3TgHdzZR1U=;
	b=N9tKGX+RQdcriL1lQMw5fMLoFetVmCtfBFgoNp6AQ7bAgrUWU7Z/gyYKH3imVUevS/yemM
	ys1y6b8eH1Z2t6bI58opb8E6Mf1jEzgJXdojrLkzncqhyWeeCEJE6/RMzH4C48kpjjjIot
	o45kUw09cZcZGOR+lRlcdVDLngGqjSE=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-395--tbXdGkqPqeghnzQpEn0Dg-1; Fri,
 11 Sep 2026 09:59:52 -0400
X-MC-Unique: -tbXdGkqPqeghnzQpEn0Dg-1
X-Mimecast-MFC-AGG-ID: -tbXdGkqPqeghnzQpEn0Dg_1789135190
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 063E41801344;
	Fri, 11 Sep 2026 13:59:50 +0000 (UTC)
Received: from fedora (headnet05.pony-001.prod.iad2.dc.redhat.com [10.2.32.117])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 005DF1956095;
	Fri, 11 Sep 2026 13:59:46 +0000 (UTC)
Received: by fedora (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Fri, 11 Sep 2026 15:59:49 +0200 (CEST)
Date: Fri, 11 Sep 2026 15:59:45 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Hyunwoo Kim <imv4bel@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	John Stultz <jstultz@google.com>, Ingo Molnar <mingo@kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	"Eric W. Biederman" <ebiederm@xmission.com>,
	Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [patch V3 5/8] posix-cpu-timers: Move inlines out of public
 header
Message-ID: <aqQJUTZzYbkX8pra@redhat.com>
References: <20260911090341.949101445@kernel.org>
 <20260911090541.785749315@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911090541.785749315@kernel.org>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

On 09/11, Thomas Gleixner wrote:
>
> From: Thomas Gleixner <tglx@kernel.org>
>
> They are only used in the POSIX CPU timer code. No point in exposing them
> globally and parsing them for nothing.

Reviewed-by: Oleg Nesterov <oleg@redhat.com>

