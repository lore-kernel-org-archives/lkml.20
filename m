Received: from relay.hostedemail.com (smtprelay0014.hostedemail.com [216.40.44.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0A4C1D9A5F
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 20:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788725374; cv=none; b=X0ewlBdgHHF5ugh/ktjHGqG9mpKmrclFRDYGCgmj8bJGCh+uoAQ+hnxYusBihN4osGHvXhsBZIixdsmk8Hhc+Tz/QLryxmJ8GfrQcy2MqmzSWqIkfQZRa/SAF6/IDdG0jnBmAtRaLzfmoH8swvBRsmJB5TWDie+Gu/QS/sI30Kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788725374; c=relaxed/simple;
	bh=OOkjI58MOi76O/RZdEWb6HTq2cEM5+3lsmLnmji+wdM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fHHTgc/eT5ohWAuGIk+s33GcfpY4pigdclgiYScy7l2nwuOi88m187VbzkusUTqtf+5t1ocwJyWPzIddqR3KBWW7hS7IfcJ7AkniCgYZIOKeLpwucqhaIw3puRFKWWc4miKAAzEkQnYeTTNqp+1sS7bUfVe8rwE/ZANFd/l2ZP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; dkim=pass (1024-bit key) header.d=goodmis.org header.i=@goodmis.org header.b=aiF5DGSk; arc=none smtp.client-ip=216.40.44.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=goodmis.org header.i=@goodmis.org header.b="aiF5DGSk"
Received: from omf12.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay08.hostedemail.com (Postfix) with ESMTP id D5FD2140585;
	Sun,  6 Sep 2026 20:01:01 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf12.hostedemail.com (Postfix) with ESMTPA id 0E22C17;
	Sun,  6 Sep 2026 20:00:59 +0000 (UTC)
Date: Sun, 6 Sep 2026 16:00:58 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>, Vincent Donnefort
 <vdonnefort@google.com>
Subject: Re: [for-linus][PATCH 00/12] tracing: Fixes for v7.3
Message-ID: <20260906160058.03ef8e51@robin>
In-Reply-To: <20260906014531.720267751@kernel.org>
References: <20260906014531.720267751@kernel.org>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 0E22C17
X-Stat-Signature: 4sou3q9bwxad1qx6datjciwzir4aejao
X-Rspamd-Server: rspamout03
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1+o2bKkvO40xjsn9J7Ro4CoUZY0K+4uGR0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=goodmis.org; h=date:from:to:cc:subject:message-id:in-reply-to:references:mime-version:content-type:content-transfer-encoding; s=dkim1; bh=OOkjI58MOi76O/RZdEWb6HTq2cEM5+3lsmLnmji+wdM=; b=aiF5DGSkBb9e7nJ8A+LPYg3pEoivYyPKhbcqx0B/Ap+iFRL+JaXqjHtpxIX+j2M1x6MxtgwqmvBOvqudabUulJgeQB5LHdxGyegBO+hqYcMsKYhUOYFl1BoY5ytnAslCxafWx2zDiLkiQ+wTjK9ciNZM9ylOe8TeFAJs546Pyxs=
X-HE-Tag: 1788724859-753876
X-HE-Meta: U2FsdGVkX19XEZXRlXYjqiMtE6BCZKg3CcgAO2eLOjSrHAeeEACtN9yOnOIeZiRRd6w3bxp4YuBL57AbwAwlanNakzrgI8A9k4+/FimZsuwjheMNsQ5x3N66Z9huSlIHbrZR0poBfe66vccI4GMhqfysPSoo9+xhOi7fUvJPftCw9u/gCcop9l41odZkrW4E918L0joyUg7IZuhLDZJzR23J5oy5m54zdTW8+Fv65851Dxyx35ueB7/cTf5IIhAwpzj8zFuXyCa2RUo2mvPfRceFc9ipO+U86YSRbSSUC2gjpv5rQta7f6X3bix3uMGp2gLjOwPtjct9HWZHIUSkL8jmiNPDWy1S


Sorry for the duplicate emails. I upgrade my exim4 and something failed
which prevented the original patches from going out. I fixed the issue
and resent. What I didn't realize was that the original patches were
just queued, and when I fixed the issue, it sent the original patches
too.

-- Steve
