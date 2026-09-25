Received: from mail-qk2-f41.google.com (mail-qk2-f41.google.com [74.125.230.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EDDF33936C
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 20:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790367534; cv=none; b=X+mEUG/S219WjGEy3iJksbCowDe2bjVgEhNnNyHipYQmB6bs7m9qJCIHFYIK/HV5o4wsaSIWYpSvW16GaZGUYD67P8cy2+8TUJZGmaO65ycmkuEs/DkYLm9TMfMglqKCUiQ+0g9GKblnLV5ixZLV+e9vnByY5c9xBWDPEPXGTw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790367534; c=relaxed/simple;
	bh=MDC0xNoHPcJkUMGe0dbDvfzkLmD46EgBAoA1GJEDaj0=;
	h=Date:Message-ID:MIME-Version:Content-Type:From:To:Cc:Subject:
	 References:In-Reply-To; b=Nrz3ycBOZAqX3SryarkMVyG0Oj1rLNkG049sbLXv/VXhvxsAYkd1NVfXEqc8sYuUhobC+B5PlF0CLIFizrBRUlqEdCslo3oXzhmV+/uCZ5E971fD1pLkBpT5vJsyng0ti2fFP3LybXbixipIVe/w3YEsW+RMOhAOMKP7WDboZhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=QLvpTLt9; arc=none smtp.client-ip=74.125.230.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="QLvpTLt9"
Received: by mail-qk2-f41.google.com with SMTP id d75a77b69052e-53321c5743fso1299101cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 13:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1790367531; x=1790972331; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :content-type:mime-version:message-id:date:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JZdx+DZFZa1b0duab3tuVw6VRThacq7nTtOH8sGQNuQ=;
        b=QLvpTLt962mwt0a4VqGb9y6fLXSn+uHD7SNqRBE/WQgXle57inGHcbf1MBzHJb3jgV
         clmE6P+mkfvhbcUnC/ofISLEmDj3gmS+A3VXoFr/RTsOS5rvAleCoKlNGG9ygaiKvW0S
         id1dgcgfLXkfIU9E5GRcGL6sSSnZ2U893wUFHgtYMotEadaUUgn9tlTDltiezjzU/VRk
         AL9vlQKwjbUXhgAmbTo+tjiB4oK/y5ZCGm+3+rf6p7dshGW74fgF6HDXR1spSQm+hAja
         B4HQfqXa28PIjzVkLLiA33ta5frbSjZMZZcXCQHX8SgYcIM2mfoAXW+sckcqjw90etlE
         hW5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790367531; x=1790972331;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :content-type:mime-version:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JZdx+DZFZa1b0duab3tuVw6VRThacq7nTtOH8sGQNuQ=;
        b=s4zUTTxO9bNIjApuzCXYHUdXaFnfIKY+JKgxnXPWzj0t1oOMsrLTOPr8htKqZwXMGK
         NuYdnnCNfL68AywnrCbK7qghO8bmDd6XsrTocUuN0xKOzyHOH4+CF+AYsr/hEcyfewNI
         t5lKfq1QJJnKEF16sDkNz95p+iLamTU7dm9BS2oehQtzu1gq2r0qjphBf/gdXZ9fhVdy
         8vDQYgNtFyy9WPlDwfk9hZ3sVIXwYmHNe6vCP5/RAc3Qv395N+PUQGTQRDaDf9RbXrkq
         xZGAXa7iwSahUOpZBxBxPzbV2GKBWw81hvTVuLunwU4Y4fZhXHO1a1x63HyLbXpLv3Xy
         E//Q==
X-Forwarded-Encrypted: i=1; AKwUvByX/6nl+RHu+F8aPfiqS8bwZzpkmiqEN51VFULryO+XInKpX5eY1BzznlPsniBVCEbZU2uC36FifTu/YS8=@vger.kernel.org
X-Gm-Message-State: AFuF++nyHi+fiyNsH5rSY5qKJPWgq9Oy1pwWaES2DjkEXM8NZdMTyRcW
	t3VM05PzvLAVWvQKYKFl2Ps+oK/khek4Hh3jb/qVAtlkSUE7IUr8MZ3aly0qebMQo0sOrIqVMAQ
	8+0fgm8TK
X-Gm-Gg: AYBFou0BhP07CMcuBxqlV89hlYTLSACG155vMwHlO9rSggjO5JiPt0+X+DwZjYniv8j
	j2UWJnGfAs9E73DKAdWuqnxGsBn3tMFT+GAo/16sidcuROtwFJ+UxYccG7lTK736tlaCztDSeV5
	fVGjOw+x6f3Rhm1fdlRsVSVziiaj59A29knTrve8BGjZQrSnCq0RiJIVelfGThPl7lRzqUoyu+Y
	r5TZJh/SeC3b0s48O8MSZ20fFQ7b3JkjUdoLSfRC9zCHXidlixh+zCKJv5+2AQnagoQjeRRulW9
	oWMY9IwPa17NzD/bZniFLK0f0e1RkTjHAbiBFLGwe0A4vRKrlEYpX2lc/5kCTZL94sKQYDRf+ms
	qkYBlVZOyxCfxBOUhsRvpPdKu8BTuoHJcPlzucrgTqoil+mok7h+HTncqNZJeSHTbmIBlS/ZRyp
	GTXMesS9jlT6dwUVMh2hmYvkTzqmuvUCTgTeJGtC+PixkOJ735ML0yKFZLjfBxvi+T5CZ38nyly
	YcINmUbtx4Nw/t7pZBn5gT6265Oyj1pDzOAt7LTojWiyCvon4MwmQhI4HUEouK376zK/1GwOII=
X-Received: by 2002:ac8:7f8c:0:b0:532:b3ce:f38 with SMTP id d75a77b69052e-5330b59362cmr70183791cf.4.1790367531306;
        Fri, 25 Sep 2026 13:18:51 -0700 (PDT)
Received: from localhost (pool-71-126-255-178.bstnma.fios.verizon.net. [71.126.255.178])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5332238c585sm1201211cf.20.2026.09.25.13.18.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 13:18:50 -0700 (PDT)
Date: Fri, 25 Sep 2026 16:18:49 -0400
Message-ID: <10caf8daf99a8f6acd7c8dd65f086b44@paul-moore.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 
Content-Type: text/plain; charset=UTF-8 
Content-Transfer-Encoding: 8bit 
X-Mailer: pstg-pwork:20260924_1657/pstg-lib:20260924_1656/pstg-pwork:20260924_1657
From: Paul Moore <paul@paul-moore.com>
To: =?UTF-8?q?J=C3=A9r=C3=A9my=20Jean?= <Jeremy.Jean@oss.cyber.gouv.fr>, Eric Paris <eparis@redhat.com>
Cc: rrobaina@redhat.com, brads@mainlining.org, audit@vger.kernel.org, linux-kernel@vger.kernel.org, =?UTF-8?q?J=C3=A9r=C3=A9my=20Jean?= <Jeremy.Jean@oss.cyber.gouv.fr>
Subject: Re: [PATCH v2] audit: fix exe mark UAF in kill_rules()
References: <20260922202734.1344770-2-Jeremy.Jean@oss.cyber.gouv.fr>
In-Reply-To: <20260922202734.1344770-2-Jeremy.Jean@oss.cyber.gouv.fr>

On Sep 22, 2026 =?UTF-8?q?J=C3=A9r=C3=A9my=20Jean?= <Jeremy.Jean@oss.cyber.gouv.fr> wrote:
> 
> kill_rules() removes mixed AUDIT_DIR and AUDIT_EXE rules when an audit
> tree is pruned. It drops entry->rule.exe before removing the rule from
> the RCU-visible filter lists.
> 
> After a rule has been installed with AUDIT_ADD_RULE, which requires
> CAP_AUDIT_CONTROL, removing the watched directory can race with another
> task that is still evaluating the rule. In that case, fsnotify can free
> the executable mark before the reader reaches audit_mark_compare(),
> causing a use-after-free.
> 
> KASAN reports:
> 
>     BUG: KASAN: slab-use-after-free in audit_mark_compare+0x8d/0xa0
> 
> Unlink the published rules from the RCU-visible lists and retain them
> on tree->rules for cleanup. If any rule has an executable mark, wait for
> a single RCU grace period before removing the marks and scheduling the
> entries for freeing. Otherwise, call_rcu() already provides the required
> deferred freeing without a synchronous wait.
> 
> Fixes: 34d99af52ad4 ("audit: implement audit by executable")
> Assisted-by: Codex:gpt-5
> Signed-off-by: Jérémy Jean <Jeremy.Jean@oss.cyber.gouv.fr>
> Reviewed-by: Ricardo Robaina <rrobaina@redhat.com>
> Tested-by: Ricardo Robaina <rrobaina@redhat.com>
> Reviewed-by: Bradley Morgan <brads@mainlining.org>
> ---
> v2: Address Sashiko's review with Ricardo Robaina's improved patch:
> - Batch executable-mark teardown behind one synchronize_rcu() after
>   unlinking all rules, instead of waiting once per rule under the audit
>   mutexes.
> - Skip the synchronous wait when none of the removed rules has an
>   executable mark.
> 
> v1: https://lore.kernel.org/all/20260921195921.4174830-2-Jeremy.Jean@oss.cyber.gouv.fr/
> 
>  kernel/audit_tree.c | 24 ++++++++++++++++++++----
>  1 file changed, 20 insertions(+), 4 deletions(-)

Merged into audit/stable-7.3 with a stable tag, I'll send this up to Linus
next week after it has had some time in linux-next.  Thanks!

--
paul-moore.com
