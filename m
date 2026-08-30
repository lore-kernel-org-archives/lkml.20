Received: from mta0.migadu.com (out-206.mta0.migadu.com [91.218.175.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A8163F106E
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 04:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788062492; cv=none; b=c+LETms4rWO9Ozx0qpe0uoSDOu1/Oy3rddxLQ5BOL1Y/wEFysJi6pB2MoDGbfFYe/SCNEUVOHtztf9bqAKLBmTCS1R0AO2cIZmsDm9kIgjm9QvIdrDozh7wuycRuW7uVPDo8ho1xAy5SHtrr+s0Il16Sao/QX1hiYR1+HdiL0JM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788062492; c=relaxed/simple;
	bh=C6PgEjS/vxE+dyiKy8Z/QBecAdkmI2WKsYI0Dlj7HTY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y0EuqQlQNtZyX5xMndz/c6OjthvFXN4c28C3sk2pV6X95u0LMD1UROC+d6vWCCzJ5uC6FiM/OxY0bBWneqVsw5PdR3u23+4WfxT7Lw+R88B5nCgqq9icH65G94BjLzbhot67ZEVWNLGn/YeUw8sLodtHtW8Vpzbph6AE1HXgCzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=og0F5j/H; arc=none smtp.client-ip=91.218.175.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="og0F5j/H"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=C6PgEjS/vxE+dyiKy8Z/QBecAdkmI2WKsYI0Dlj7HTY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788062487; v=1; x=1788667287;
 b=og0F5j/H8DzVtdXA1eN75lQ8K34zhFXmLDPjib6IxhiSaXJmbXQM8GVJNF2nb9wAJzzP5uxA
 V9hfVZEQkMRdiPNSkV3xzmttNpuRQNkfvYRRWFYTNXZJ5Oj0j1x/Fqp0Lu9RylOnAQRU+2GVQa1
 xZzTx0AQuS9EHwY8AC34XTcU=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 293b583ee5cc899c;
	Sun, 30 Aug 2026 04:01:27 +0000
X-Mizu-Trace-ID: 293b583ee5cc899c
X-Migadu-Flow: FLOW_OUT
From: Yuntao Wang <yuntao.wang@linux.dev>
To: akpm@linux-foundation.org
Cc: jbaron@akamai.com,
	jim.cromie@gmail.com,
	linux-kernel@vger.kernel.org,
	yuntao.wang@linux.dev
Subject: Re: [PATCH 1/2] dyndbg: fix incorrect mod_ct value in dynamic_debug_init()
Date: Sun, 30 Aug 2026 12:01:05 +0800
Message-ID: <20260830040105.67865-1-yuntao.wang@linux.dev>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260829202306.67cf6ff7223b1bc33b57730d@linux-foundation.org>
References: <20260829202306.67cf6ff7223b1bc33b57730d@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sat, 29 Aug 2026 20:23:06 -0700, Andrew Morton <akpm@linux-foundation.org> wrote:

> On Tue, 11 Aug 2026 20:18:30 +0800 Yuntao Wang <yuntao.wang@linux.dev> wrote:
>
> > Suppose all `struct _ddebug` instances belong to the same module, mod_ct
> > should be 1, but it is currently 0.
>
> Oh.  Why.  Does
>
> 		if (strcmp(modname, iter->modname)) {
>
> not evaluate to true in this situation?
>
> ie, more details please.
>
> > Fix it.
>
> What are the userspace-visible runtime effects of this bug?
>
> Thanks.

Hi Andrew,

mod_ct is incremented only when iter->modname changes, i.e. when the loop
encounters the first _ddebug entry of a new module:

if (strcmp(modname, iter->modname)) {
	mod_ct++;
	...
}

If all _ddebug entries belong to the same module, strcmp() never returns
nonzero, so mod_ct remains 0.

However, the last (and in this case only) module is added after the loop:

di.num_descs = mod_sites;
di.descs = iter_mod_start;
ret = ddebug_add_module(&di, modname);

Thus, mod_ct should be incremented before adding this final module.

The bug only affects the diagnostic message printed by vpr_info():

"%d prdebugs in %d modules, ..."

It reports one fewer module than the actual number of modules. There is no
userspace-visible runtime effect; the dynamic debug tables themselves are
initialized correctly.

Thanks,
Yuntao

> > --- a/lib/dynamic_debug.c
> > +++ b/lib/dynamic_debug.c
> > @@ -1456,6 +1456,8 @@ static int __init dynamic_debug_init(void)
> >  			iter_mod_start = iter;
> >  		}
> >  	}
> > +
> > +	mod_ct++;
> >  	di.num_descs = mod_sites;
> >  	di.descs = iter_mod_start;
> >  	ret = ddebug_add_module(&di, modname);
> > --
> > 2.55.0
> >
