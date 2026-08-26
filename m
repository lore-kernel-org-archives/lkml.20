Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C56D3442B08;
	Wed, 26 Aug 2026 17:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787763922; cv=none; b=udoKbArGLWWK+eF9rP48lbTh5tkkNX48JSvtlXmHpeAZc5YyESg07rz71u6dxhmnl7QMSz4DSnN5FuklqYNEfe/KLqS1LhC1KzJps5KeQ24NAjV223vH5zmjkoppFrcJDkB9UcHaFXyNf3681xVe+bGvRlBFi8P6YHb0XFHgvOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787763922; c=relaxed/simple;
	bh=+95lxTMDqnGt+uyT8dN0v1SAX+gZDf89NcHtuPp/3jU=;
	h=Date:From:To:CC:Subject:In-Reply-To:Message-ID:MIME-Version:
	 Content-Type; b=ABbV39QG/AJQa7nqHqLj2wo8N5Zkkh0pALzFh2s87y7k2ZRAGdY97qdmgKOCULZhBC1kpz3af4FqYON1hPn26B6ouu3S5q4va0q4Nl1mECKxeRdwqWCCjTzLy4pLcwkX0BIoHD2HG02VHORi0RuQ1iagBL9KJa1tCUPK1Rb7DZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=qeSyfKuc; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=25YW3KCP; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="qeSyfKuc";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="25YW3KCP"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1787763889; bh=tx0e4NZr1La76Q03CBtDL4A
	w4oOHTYyftLhC+1XceCc=; b=qeSyfKucfTKdoEs9LaWDp507VKm92LlfQFpc/TKGY64CtFdPxd
	nYq47ClbU41cASL+fIV/BUugw7n8vd2HIsMY5MckGyCnSyU/UDjw9z3NS1B3MQODv/Jsmij1eH0
	nwDLlc4oQnsKHjgf4GF2m0yD3dO23jB0JEI2OF/dO9s9KTh+FqcZRpdhnjKFyQqgrznY5ONwjyM
	7SK9aGzbBpVtQS/obkNSX1B9wsMoUwwx6y900sPlz0VAt0X+4SgQzh91T9ZWlM1f/J25Nqf3RQy
	bnj7a16UEyNJvcZ+qIldps+UTlZHOzhMZP6O0BwEdCs+0AD71gOW48Xn4fI5MWMfb1g==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1787763889; bh=tx0e4NZr1La76Q03CBtDL4A
	w4oOHTYyftLhC+1XceCc=; b=25YW3KCPKVKUTUDoF/cjRnZs9YKYu7ILioiBI55LzuEiSm4AAI
	fUJpvnlwqbR01YO8kn8ksEMxpWG19BFb9rCQ==;
Date: Wed, 26 Aug 2026 18:04:50 +0100
From: Bradley Morgan <brads@mainlining.org>
To: costa.shul@redhat.com
CC: corbet@lwn.net, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 rdunlap@infradead.org, skhan@linuxfoundation.org, joel.granados@kernel.org,
 akpm@linux-foundation.org
Subject: Re: [PATCH v1] docs: sysctl: timer_migration is for hrtimer only
In-Reply-To: <20260826132921.294142-1-costa.shul@redhat.com>
Message-ID: <1A262560-9593-4F00-BF40-CE758DB46C61@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

On 26 August 2026 14:29:19 BST, Costa Shulyupin <costa.shul@redhat.com>
wrote:

+ CC joel.granados@kernel.org (sysctl folk)

+CC  akpm@linux-foundation.org

>Since commit b2cf7507e1864 ("timers: Always queue timers on the local
>CPU") __mod_timer() no longer depends on timers_migration_enabled.  Only
>high-resolution timer migration from isolated to housekeeping CPUs
>depends on it.
>
>Update and clarify the documentation accordingly.
>
>Signed-off-by: Costa Shulyupin <costa.shul@redhat.com>
>---
> Documentation/admin-guide/sysctl/kernel.rst | 6 ++++--
> 1 file changed, 4 insertions(+), 2 deletions(-)
>
>diff --git a/Documentation/admin-guide/sysctl/kernel.rst b/Documentation/admin-guide/sysctl/kernel.rst
>index b6328cd0f43e..fb38d654846d 100644
>--- a/Documentation/admin-guide/sysctl/kernel.rst
>+++ b/Documentation/admin-guide/sysctl/kernel.rst
>@@ -1609,8 +1609,10 @@ If a value outside of this range is written to ``threads-max`` an
> timer_migration
> ===============
> 
>-When set to a non-zero value, attempt to migrate timers away from idle cpus to
>-allow them to remain in low power states longer.
>+When set to a non-zero value, attempt to migrate high-resolution timers from
>+nohz isolated (nohz_full) to housekeeping CPUs.
>+See Documentation/admin-guide/cpu-isolation.rst
>+and Documentation/admin-guide/kernel-parameters.rst.
> 

Hmm, ok!

Reviewed-by: Bradley Morgan <brads@mainlining.org>


> Default is set (1).
> 
>

--- Thanks!
https://lore.kernel.org/all/EE579805-42F2-4C58-B752-F28779EEB717@grrlz.net/
