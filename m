Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEC2931280D
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 14:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789135364; cv=none; b=BF5O6GFVzNPeGpvXdbNZJKujPJVoFKU51kAU+cxu/Z62amEEORDI+YMzYeyx3V5JnexAyVSq0mOo2Kt6MA4pc8zLYB0+KjZjyeru6fnm78dxBbboqfCnLPndbWtLV+OMIZYTNt0lGha65baddYIdGEgDrFp4zKd1AmRPNjrNr2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789135364; c=relaxed/simple;
	bh=6Gq9Fg5fGNniGN6Q9vzeVbYZVZ/i6ytIu1tFK3r46U0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l/tlx5AUKl0ZDT7iyJPsybzaV4COMz4hr6AgmO/AHun1N43OEwpVwjJBs4NIRM5lUzzydrsZff3dym9nBRQokT1MoFBlt9Xq4Q3HhUbBMhy3iXrVFTT9nRQGBCEPS98RyQqKQ1KiqMUZuO55N/cdjVOGcj1oPoXPQKpTqQvx5D4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=i+Dr5a4H; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="i+Dr5a4H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789135361;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6Gq9Fg5fGNniGN6Q9vzeVbYZVZ/i6ytIu1tFK3r46U0=;
	b=i+Dr5a4H+AijEYxqPqviga14Gmr6fk/9ydzFdgyTxjd2Ac0Yx3CrwNoESL/TWHzicK4CcV
	+DzI6xT/c130BbML3G+vZnzSeELCsXg8j7K/p0FhS/XjY93v8tRXj0AdeiD7biw3D4pIdv
	3DOkVtpcNgwB8q9JF8Aft/crCnQ6rv8=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-463-DTkhKYAkO86coK8mNnLO4w-1; Fri,
 11 Sep 2026 10:02:36 -0400
X-MC-Unique: DTkhKYAkO86coK8mNnLO4w-1
X-Mimecast-MFC-AGG-ID: DTkhKYAkO86coK8mNnLO4w_1789135353
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 065CF1954225;
	Fri, 11 Sep 2026 14:02:33 +0000 (UTC)
Received: from fedora (headnet05.pony-001.prod.iad2.dc.redhat.com [10.2.32.117])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id C91A3195608D;
	Fri, 11 Sep 2026 14:02:29 +0000 (UTC)
Received: by fedora (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Fri, 11 Sep 2026 16:02:32 +0200 (CEST)
Date: Fri, 11 Sep 2026 16:02:28 +0200
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
Subject: Re: [patch V3 8/8] posix-timers: Handle exit in do_exit() completely
Message-ID: <aqQJ9JMK-p9JGUaJ@redhat.com>
References: <20260911090341.949101445@kernel.org>
 <20260911090541.947206186@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911090541.947206186@kernel.org>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

On 09/11, Thomas Gleixner wrote:
>
> From: Thomas Gleixner <tglx@kernel.org>
>
> Now that POSIX CPU timers cannot be enqueued on a task after PF_EXITING is
> set and process wide timers cannot be enqueued when PF_EXITING is set and
> the last thread in the group is exiting, it is possible to mop up POSIX
> timers in do_exit() completely.
>
> This requires to cancel an eventually pending POSIX CPU timer task work
> right there because do_exit() invokes exit_task_work() later, which would
> be acting on torn down data.

> Signed-off-by: Thomas Gleixner <tglx@kernel.org>
> ---
> V3: Don't touch pending posix timer work on exec() - Oleg

Reviewed-by: Oleg Nesterov <oleg@redhat.com>

