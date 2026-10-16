Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E51718B0A
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 09:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792141433; cv=pass; b=qL5lgUEsmS4eSn7y+3O9D75flptMIcQJnJcHhLQqPrj49c51xfTnozUS6nW8/YNlrRSySERQ7lhP8jnIuB1wKbNuOXpRWqd2U9Os+ZkzAoQ1xE8oFHSsBtVrC5sReMsbzNRtik9LZcQ9X32lvC6W5fk3vzeuJb4yZCsecTQ+tPw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792141433; c=relaxed/simple;
	bh=fwMAW1uFiNTEi2jtLJQQkrtRDnV/gc+W3LGqCFhfAQ0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pqIntxYxUNDR4DCrRmltKj8rH4Wo584L5W7K9kRToBGFLjjMdZKD5Gkh/dYSmZjTfznJlI7uzmNC/HLthURMAOT4NVTP8/Iv4rPExI507fS9WOCFQbMXSsT1+qjq1WSfCZyz0pK9k10SzHYJketVPRE+fUBONNdw/VqBft1wMYA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=Vnqz3iig; arc=pass smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="Vnqz3iig"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-53391786e55so101740621cf.2
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 02:03:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792141431; cv=none;
        d=google.com; s=arc-20260327;
        b=H3BB1VtcknhmwfHbPvMUPsGccw6a+w/ctwhawReKmnVGGqxofhSnMA670+1i1Fx8fG
         oEudysh186Hrnr10SGIu7Qs9M5yHzkwp6dBXt0F3our/iehs+vDK1EAE3JdTBF4Xwo7w
         xMvjW6ARCVO5B/CKaD6ocoZB6IQQ9Zd3wJUA8TO3kd79wnYYWdah5x3R54HtVn7Guzwk
         WqyqUDntAxeMnV4avcARNkTKe8Ljdlhsh0J7eSdFSt8Mq85ai1S+HAp4te5WGe/xr8iY
         yCMIgFUGTvM9szeIq+OTY/rrwrC4tuG4V1L7sLyvFTVUzGrneneKuvhXIVp0WgenlNqL
         3EBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=3ldt/ovP6OCRMk7JZB3e2CxtQy31x7HqZOQU7pqKqnk=;
        fh=L6avhNOOpujVpPdje/bxUbx6Zc2sqK8v5rIRA9JfYNQ=;
        b=KeZsOiQe0kJlgs2YtV87KukBMaeg9pjTcIP5ce8nNumScG+F9ApxuRKRlPp3OdpSd8
         br9txVEXUaxJFYbGMmPdOlIc9ugDkONXIt9+0fQO4OQScpINVyDSSOlsizatxzzI7sGy
         F/Ow9sCUz1CdTP3T5rEAg4vQqmnpQ8lAkpeNNlWRgcVhKZqp757fALAILZ3/RzTJlycr
         gV8ISQMmLT90A5yhAfr5jwOqZP5Nei17NJW9tuPeRBhDuM7RabIsg95fwp5TROie1+FR
         us8YPRb12c5R7iU3LX2KM0D8L+cb4pboa2+S+P9eXo2K3VSb/QxaLBuJK3eZIWrc/BDm
         gwxA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1792141431; x=1792746231; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3ldt/ovP6OCRMk7JZB3e2CxtQy31x7HqZOQU7pqKqnk=;
        b=Vnqz3iigOpWJnvt71waCqcHmJdmtKljaoVu6UZUNN4oWmE1El3dWirzSs2qEIcc1qj
         ZsDgo9jGN+TriQ+/8G9bSNbM647SxqX8e0kE7h8WRAPBF2ULZ+vk+ttrIQQZH8HA12qb
         TUG147ETonbrd8hYuRerXJtYpAMqGZQgrEF+E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792141431; x=1792746231;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3ldt/ovP6OCRMk7JZB3e2CxtQy31x7HqZOQU7pqKqnk=;
        b=YlqRLO9iIWemFD/uRYf2eG8Hfauk1rHqYHC9LRMnNOpusk+V+XLKE1KR8sMdaII9p4
         xK3Erjn5ur2l0hw40yvIYk9F3suW3lGKYKPpTQQsX68tM+wjE48CnoDUDO+9FUbcdKhi
         X9qDwI5x3RvuqRNy6qDwk5IlhstE2t3oTYfDWvlQwkNpFu4cv00byvyZaPjy1wtXsXqj
         rzTf3HK31Yrn+Tn299yORKJhOEeGGEZSutuu7AMFYFRfBEK2GXkU1TtQkouFXmwzcuDY
         FLMxrXZOkkC/m8sQ39qup/BmGO8rVfZ85yGhbx7Xl5MKeQ75/uZTUKTVldi+PLch3eK5
         RNjA==
X-Forwarded-Encrypted: i=1; AKwUvBzojT2D3cD3AMkclpab9MmfT2z7TePE8U+ghLU2sqIUU6uM6tJcHyVLs8UHlDpvQNvNUmHpG0cTFpqClU0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLvnT3GDXYA83t6hsIW1dFtkO9vgSvIhtSgDspeWrXkf/mAjMqk
	e6dGlP2UCCgeXbpyfd6OX35pBVQMvsXJLXVlv9CU3QUDdm+kEC3oIw6r3oXwyupJcndB9f/7rcf
	OKb03KXU5nhv8a3FNCrEsNExnCuygLD8ZQBlvGTxyezi2CpUNHDKH
X-Gm-Gg: AYBFou165f9NNVysz/gO1IzdMSB/4h5TmJnKZ2bEHMhXMxC6FG6I4L7Rx1oM+9a1IKt
	imNDt9giBrUm+LSjlsRPv2hVJEuNtVemPWhJyo8MOVmX/ufvjjBwBlddwemc2mdn3knwlWJdEy1
	KXRxxqLRzORq3hbaLIC+Y4UQpZBy5TKe10RBCleRKkzqn0dKvTRe6dd5PpFeXo5ReNZj7VtrWbv
	NlZFupt82rUx0vJ84apCYQDiNfcrqWbETL8usFlmTyry3rHv2GaGnIbsxZHi1J7dkw/xU4++fkp
	Na32VDnRr8JrpIS7ffa9oMu66gubNlQAsy6mtYwP6TNBdLOEQE1djrLP2ibsQlrk2FkjHjvq1mw
	4x2hP/q4=
X-Received: by 2002:a05:620a:45ab:b0:939:6dee:4b09 with SMTP id
 af79cd13be357-93ebd28ade5mr3524269585a.51.1792141431447; Fri, 16 Oct 2026
 02:03:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261015175856.13333-1-luis@igalia.com>
In-Reply-To: <20261015175856.13333-1-luis@igalia.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Fri, 16 Oct 2026 11:03:39 +0200
X-Gm-Features: AclHuK-GRQ2nqGxByZtvVUtGPEc6GMVKcrUJWAGLTUfAUZd_De9hnkNE_Pgdx3g
Message-ID: <CAJfpegtTEgAZHXh4Op3ei3SfSd+5cZN3TeOwD_cjFRbbTo5yiA@mail.gmail.com>
Subject: Re: [PATCH v2] fuse: rename fuse_direct_io() to fuse_do_direct_io()
To: Luis Henriques <luis@igalia.com>
Cc: fuse-devel@lists.linux.dev, linux-kernel@vger.kernel.org, 
	kernel-dev@igalia.com
Content-Type: text/plain; charset="UTF-8"

On Thu, 15 Oct 2026 at 19:57, Luis Henriques <luis@igalia.com> wrote:
>
> FUSE has two functions with very similar name: fuse_direct_io() and
> fuse_direct_IO().  Which is very confusing.  Rename one of them to remove
> the ambiguity.

Applied, thanks.

Miklos
