Received: from relay.hostedemail.com (smtprelay0017.hostedemail.com [216.40.44.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 596804CEE57
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 15:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792337308; cv=none; b=lgkCyJz7EJtiFuTzdkuUZWOyZ5gqbGrxpr0cac7sWgU5nv2amP61yrZv1oWMqCuUugvvo0wAs9aH8XR2gtFkblghBlA87xgi6bGu8K1o4Tr5zypLkwzvvhGBTUfhagBR3o5dUtR/DT8I4hlCYQ89po5srha8bGC9tPWeALLfpBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792337308; c=relaxed/simple;
	bh=yIygpJn+22Cx9KjJ9Ji7RgRplUrPazJPaJD/qs4q1V4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=umYmBQxJWomkBONPETAlkQy3+jON15zoah8QJ8QwGScacWBrJ0xfrHiSnsiHnc08C2SOEM5eyQ7dxQAwagvtSINoUiQCAaaaKcILu/uw0UTXbZJmvDjxMPCsnKM8SnYfbq8Ncq2u4VQZkspbOZ0AdKKCrnW4ckmel2yD2dQ14SM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com; spf=pass smtp.mailfrom=perches.com; arc=none smtp.client-ip=216.40.44.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perches.com
Received: from omf15.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay06.hostedemail.com (Postfix) with ESMTP id C3467A80DA;
	Sun, 18 Oct 2026 15:28:18 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf15.hostedemail.com (Postfix) with ESMTPA id 2A92717;
	Sun, 18 Oct 2026 15:28:17 +0000 (UTC)
Message-ID: <463ed8b737d24e205e81d0f872b2c497fd173c58.camel@perches.com>
Subject: Re: [RFC PATCH] scripts: add checkpatch.py, a Python
 reimplementation
From: Joe Perches <joe@perches.com>
To: Breno Rodrigues Alves <breno3011alves@gmail.com>, 
	linux-kernel@vger.kernel.org
Cc: Andy Whitcroft <apw@canonical.com>
Date: Sun, 18 Oct 2026 08:28:16 -0700
In-Reply-To: <20261018005012.34962-1-breno3011alves@gmail.com>
References: <20261018005012.34962-1-breno3011alves@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-2.fc43) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Server: rspamout05
X-Rspamd-Queue-Id: 2A92717
X-Stat-Signature: emtwns6qahtkg14y8x5qf5mz59bj6d1w
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1+xb75uikjEwi+1tr9LbXqhTp0KORC7ADg=
X-HE-Tag: 1792337297-24865
X-HE-Meta: U2FsdGVkX1+TO2aH1yOnaG4MbI6Ex1dBazHAXaUjHWrlejDbtZ4DYcuHOjPjnNzqoEUuv3+FYPZhOzaGdJJTZxXsV1BQwGc+RWssqxCT/7sRVn1gdkMEKZd1ofJ7+ALoWgTmbTsCXd/ohtL/uF1B+CgYo/bxJqiZ5Bkiaqfzy5YOcAsOU6Zck1iQSjcyalPRW/0TYLdj1xYPhlYMaAFphpmUUqleWJDs0AREMuyYyP993/ll4qLSpCKb9UJRC8swE27Vy8nPVboSrv24RmHQySJ7KzfX+JFIHnMoljr712v09epR55eDAIgLGjO6ASUYaLjGvI8lZAK2LAsltaPEdtD8eRHEjQcxHeiyT5My6Fv8dGFxu3k+QFXyhzr7oUG4Z7ex4Js4SbaSg8nKRpFidL5KgeX94UNXyE+3p/Z5ikPnlBqXTHgq8/HA+9keHE12

On Sat, 2026-10-17 at 21:50 -0300, Breno Rodrigues Alves wrote:
> ```
> A compact Python re-implementation of scripts/checkpatch.pl that
> covers 123 check types with stable --fix and --fix-inplace support.

Awhile back in qemu

https://lists.nongnu.org/archive/html/qemu-devel/2026-01/msg04818.html

I said then I'm not a fan of reimplementations.

Still not.
