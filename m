Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4CBE2F39C7
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 03:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789529818; cv=none; b=Id0wYbYgtjiq3eBmm9tsvpjBnSkJ67UNVFlxncU+SA1gjuacYPQTxUiEaNsg/vn5obXg6Ys9UOTmiJB95VYay/AEiqr3PtQtK5kNUrsmV5/WhFR+uXhohdIxhJjhO7fsY+o1RfacObSRP7xlpzwo8sDKN/rlxEo871hzhB4QQfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789529818; c=relaxed/simple;
	bh=t/7cVk6CHt9sC9kShR8pkY5ALIb3l5eigwsYVtwI5XY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HiqvNxlkJZtw9O+OWChnwZYbIkhgvs19qDRdpBUs6VSuPhBiSodcGVZ3ohFzTIR+SNBtDnByvVqem2vf1Oy837cHaca1W08z4wArWOLH+LZzmj+S4dj8M5bmX9eRP84KvfWXXIvpegb+7pKzEFQMEdIgwGc/xOMkW7svRbK7rAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nvzkRl4h; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nvzkRl4h"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc4c08393b0so398916a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 20:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789529817; x=1790134617; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RXF/2VuP88JGCim1C0zobHtH39G+DpBhAl/bzlRf5Ss=;
        b=nvzkRl4hFkXBm02xxee46PG5hT0RD1XUmITGTuIP1zbnbBm0TRYs99Ku+5W7VYuKq8
         /9OWwYu412wo9K9xa2sHMZMZouAKySByxbnNfn7Lj7jPBa9CEr1cx13jmI7xnbfeJip0
         8dTQ1gYJaFJYHkgUxRVDnz1reNyn84OA29dMWxLoIu35FaprWKeRvuQzaMo39LSg9DlD
         lEPxOgRuTU4swzRKQaxJPBZOmUq/WANFAQzfmlvGQBNVpXZQ5wmxBnXFt9uRRQ/Z8HEg
         /qQOzByQgd7mMCHTZ4vRhzwfiXC6YknrlHsk9bfcyCfrmrneeTUCNMBvsOUe/jUldyDd
         SM8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789529817; x=1790134617;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RXF/2VuP88JGCim1C0zobHtH39G+DpBhAl/bzlRf5Ss=;
        b=aYQktKRlrCreitl4Vjn4Ow/2/aszKq4UcpmEEv/nIrbBPg2KFTj7GXHceZT23EQS6N
         jMZl1mPl2maRMwLFZyQ3XGiIjsMJmqbuMHljzl9G43Tfu/ueo1Fbhzjpw4/u2+QJPLiw
         MJGV09/leG2MBskeTQybCYcbtH96kgx/IQ1Kl+KDKJsZTg37oufQmZKU9dKO3m9hrSLU
         4wjVCC/vhZBpEFPTBqDZ7Td1QfpR5NpfeggpqJUaFJ5pRBXGAkEfinI/GsNfWOkBlnJv
         U6FTT6eZBY4Dje/8xSBPVwA5uakmg2ERgw8q34um56w5UE1dBqDwzxjEYsmSZaBzq7hp
         DFXQ==
X-Forwarded-Encrypted: i=1; AKwUvBxXhoXtHXblNsketjZbUDRxxrQ5elqW55JusBH1ds1LZ28KrpkSh303aHWcCag8/pVErxn6eY2lbl3Zink=@vger.kernel.org
X-Gm-Message-State: AFuF++lXcI6emiB3DxBPbgOh/IjAlSAOboRcMAMjp5+QEAluKM28a621
	j63hT2XDI/iiaAa4vB4a3/E0lJztZ50W0lrMunpEZI5IeZXrwwC1YwZE
X-Gm-Gg: AYBFou3PKBmWvwuk4oPkOByh6dkKc+U71qPp3zUh8AxWzaDUMDG2bNrm4SGetbZtDCe
	DpILuxOCuBxvyzObEUVqjFlP8XFOFfkaBbBEOtFW6QUMmkKaBE4dyIDp5m4NdIlisAw8/wJx56/
	1MrUz3GlvsW+GP1AHRSelmX5RSmWg784+07bnlMt9Y+vJxmU1KK8aKGwtmus16Ges5T18cJ8ZFp
	gCbUqNpKJQ5q2ZBLvszDM4COV04EC9jP+XfZLXItylN0/VgnagIeGuc5spESZCmJfEa0iSGPQVH
	xYG2TQi+/ZE0n3l2XX5c7IjElA0p95aDy5oWm5+3t8/6/4+z6wLWuwbyBk0uKkNUU7xZyZUhvvE
	CQly7n916TzhcFO+NRDsffhy//mi7qqASmDbfF+NNkNpfhvjKsEfZuAUCs4zupmI44zk/kM4bW8
	RZ4882j+k2su97X4/jZXBKsZtKcNCO5gddHosI479ShtNVSC5teELpTp73whaSwzOhmQdfg98h+
	+FIwqOJAcc=
X-Received: by 2002:a17:90b:5388:b0:39b:92bb:9eef with SMTP id 98e67ed59e1d1-39e1e509fc1mr2522206a91.22.1789529816787;
        Tue, 15 Sep 2026 20:36:56 -0700 (PDT)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e1b75bb3esm1871298a91.11.2026.09.15.20.36.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 20:36:55 -0700 (PDT)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
X-Google-Original-From: Zhan Xusheng <zhanxusheng@xiaomi.com>
To: Ian Rogers <irogers@google.com>
Cc: Zhan Xusheng <zhanxusheng@xiaomi.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Changbin Du <changbin.du@huawei.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] perf symbols: Don't apply the symfs layout to synthesised paths
Date: Wed, 16 Sep 2026 11:36:47 +0800
Message-ID: <20260916033648.500387-1-zhanxusheng@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CAP-5=fVXYFvWOEiH5R+Gc29nfKBGA6y6ULsT68Gudw7ErMVFsg@mail.gmail.com>
References: <20260819094621.844115-1-zhanxusheng@xiaomi.com>
 <CAP-5=fVXYFvWOEiH5R+Gc29nfKBGA6y6ULsT68Gudw7ErMVFsg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2026 at 01:31:16PM -0700, Ian Rogers wrote:=0D
> In those before and after examples, the 'before' case seems to better=0D
> match what the user is requesting on the command line, so I think I'm=0D
> misunderstanding something.=0D
=0D
Neither side is the flat layout.  The changelog showed the prefixes and=0D
not the full paths they end up in, so there was nothing in it to see that=0D
from.=0D
=0D
For /usr/lib/x86_64-linux-gnu/libc.so.6 the base name is libc.so.6.debug,=0D
so the flat lookup is /s/libc.so.6.debug.  With --symfs /s,flat, the=0D
FEDORA_DEBUGINFO path actually tried is=0D
=0D
  before  /s/debug/usr/lib/x86_64-linux-gnu/libc.so.6.debug=0D
  after   /s//usr/lib/debug/usr/lib/x86_64-linux-gnu/libc.so.6.debug=0D
=0D
Both carry /usr/lib/x86_64-linux-gnu/libc.so.6 whole.  perf_basename()=0D
only ever saw the prefix, because the DSO path arrives after it:=0D
=0D
	len =3D __symbol__join_symfs(filename, size, "/usr/lib/debug");=0D
	snprintf(filename + len, size - len, "%s.debug", dso__long_name(dso));=0D
=0D
Before is shorter in its first component, which is what makes it read as=0D
flatter, but the layout that was asked for is on neither side.=0D
=0D
BUILDID_DEBUGINFO is the one I would not try to defend as intended.  Its=0D
prefix is "/usr/lib/debug/.build-id/", and perf_basename() of a path=0D
ending in '/' is "", so the prefix does not become shorter, it disappears:=
=0D
=0D
  before  <symfs>/ab/cdef...ff.debug=0D
  after   <symfs>//usr/lib/debug/.build-id/ab/cdef...ff.debug=0D
=0D
Where the argument is the file being looked for, the option does what it=0D
says and the patch changes nothing:=0D
=0D
	__symbol__join_symfs(filename, size, dso__long_name(dso));=0D
=0D
/s/libc.so.6, /s/ld-linux-x86-64.so.2, /s/sleep.=0D
=0D
So the patch is narrow: it keeps a flat request from rewriting perf's own=0D
fixed prefixes.  It does not make flat find distro debuginfo -- for a user=
=0D
whose debug files really are flat under <symfs>, both columns miss.  That=0D
needs the base name taken from the composed filename instead of the=0D
prefix, which is a different change and not a Fixes:.  I can write that=0D
one instead if you would rather have it.=0D
=0D
8 paths change across those 4 sites and 13 are untouched; hierarchy is=0D
identical between the two builds at all 21.  The doubled slash comes from=0D
path__join(), it predates this and shows up in untouched paths too.=0D
=0D
The v2 changelog also said four paths differ while listing four call=0D
sites; it is eight paths.  That did not help.=0D
=0D
Thanks,=0D
Zhan Xusheng=0D
