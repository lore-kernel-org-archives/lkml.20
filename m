Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.38
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794714182;
	b=z9yc6UpU02Qn5EQQ1rZsxRKyjcS5Srz+6cO9/J7GQfLRPgvsxHp49QP9UbEvMZv4PzTt
	 KlvMzWJE42jlwcxg09zKniTLMXKZXv+I9i5+y4kGdBo9zxshuMkS4FEqV7VOF+1xNmxE5
	 4lYMZt6MegLO+JrdDnYmprxqQV/EvlxDVN9ibrUBO/2qAeKQESM1YZfTeov1D8iG4Fm3o
	 KY3SnxN+NhK4n7Q68Jed+kP9lfFp2njYYT8M6UHOX5GgXb3+FDeUQOdNOX2Y2+1zPMqD7
	 ZYQ3W6WICEz5opIO+yPcWiGDzT/C3ypo3tWlMUia4/WwcWaFM3efaYMWsid8ubAvfoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794714182;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=DNvG8od8l8ucgv2ueXv6nmuD7jHJoI/YW09hza4lVv8=;
	b=JvrWuRfc7IFk3zNMF2/4wpuLRGXlT/kfaqf3Ov8NTXNiNrX6tgPVYNyBcmcQKHgKRocb
	 LLmzIBDx1k/XPzw74gEK78IiqdZsBavpShW5X601iJEhWNL6gOPk0mUxt/cIKv/BzAGuv
	 aZX72XBrKi3eQFwj0uNeHZUmzdfkHGI+Fi6/4UMldb231zJH3PifKf8hTX5qdXzofZoae
	 Bpd6aJ6S8i1BSzPhjbiDIS1eQXrHPbbaJ/ng4qMnDvoAa3sWtNGb9WoRQfeurJjy8YKPx
	 hxw/dCx2EAKfrRHn3jiShkmQDYsC4CwY9TMsOWbdx23/VmxCCcoJeOZU/XCnivxqdCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=hhmbK3MM;
	arc=none smtp.remote-ip=91.218.175.38
Received: from mta0.migadu.com (out-38.mta0.migadu.com [91.218.175.38])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEBE0606A32D
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 03:43:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DEBE0606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=hhmbK3MM
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=K4N/rA5AgSqR8cp+YKlw6pPokjoUqfiwVnOeTRgQuKw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794714178; v=1; x=1795318978;
 b=hhmbK3MMEu+uNNvYXMI46TtUbL626IDtJu5t6Q+/wc6Epkyl21uObDReLVCJidXKFYaUIAvl
 uO9i56LXpK1+I0slOa99ACA/b1iuegT0b7rBeKu13p7IobuzjQdgb9kSbUlC+2NYeRSv+Rd5/t5
 jgwjkVhOBoQjpYpkOW1qMMOc=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id eabace465f84d12f;
	Sun, 15 Nov 2026 03:42:58 +0000
X-Mizu-Trace-ID: eabace465f84d12f
X-Migadu-Flow: FLOW_OUT
From: Qiliang Yuan <qiliang.yuan@linux.dev>
To: sashiko-bot@kernel.org
Cc: Qiliang Yuan <qiliang.yuan@linux.dev>,
	linux-scsi@vger.kernel.org,
	target-devel@vger.kernel.org,
	"Martin K. Petersen" <mkp@kernel.org>,
	Mike Christie <michael.christie@oracle.com>,
	Yu Zhang <yuz08559@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] scsi: target: alua: Free target port groups with kfree_rcu()
Date: Sat, 14 Nov 2026 22:42:52 -0500
Message-ID: <20261115034252.1124649-1-qiliang.yuan@linux.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <sashiko-outbox-209114@kernel.org>
References: <20261111-bug-target-alua-free-gp-v1-1-d1e692ae8694@linux.dev> <sashiko-outbox-209114@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

+Cc Martin, Mike and the patch's other recipients, and Yu Zhang, whose
patch fixes this.

On Wed, Nov 11, 2026 at 01:58:54PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found no new issues
> in this patch, but noticed 1 related pre-existing issue it does not
> introduce:
> - [Medium] scsi: target: race condition in core_alua_free_tg_pt_gp() [1]
> --
>
> commit cbab3de9aa10ecf910c633ef186a6a1775418e09
> Author: Qiliang Yuan <qiliang.yuan@linux.dev>
>
> scsi: target: alua: Free target port groups with kfree_rcu()
>
> This commit replaces synchronize_rcu() and kmem_cache_free() in
> core_alua_free_tg_pt_gp() with kfree_rcu() to avoid synchronous RCU waits
> when deleting target port groups and backstores.
>
> > diff --git a/drivers/target/target_core_alua.c b/drivers/target/target_core_alua.c
> > index 140154d93c430..4ef243ae843bb 100644
> > --- a/drivers/target/target_core_alua.c
> > +++ b/drivers/target/target_core_alua.c
> > @@ -1771,8 +1771,7 @@ void core_alua_free_tg_pt_gp(
> >  	}
> >  	spin_unlock(&tg_pt_gp->tg_pt_gp_lock);
> >  
> > -	synchronize_rcu();
> > -	kmem_cache_free(t10_alua_tg_pt_gp_cache, tg_pt_gp);
> > +	kfree_rcu(tg_pt_gp, rcu_head);
> >  }
>
> [Severity: Medium]
> This problem wasn't introduced by this patch, but can the LUN detachment
> loop right above this race with target_detach_tg_pt_gp() [1] and
> leave a freed struct se_lun on default_tg_pt_gp->tg_pt_gp_lun_list?
>
> drivers/target/target_core_alua.c:core_alua_free_tg_pt_gp() {
>     ...
> 	spin_lock(&tg_pt_gp->tg_pt_gp_lock);
> 	list_for_each_entry_safe(lun, next,
> 			&tg_pt_gp->tg_pt_gp_lun_list, lun_tg_pt_gp_link) {
> 		list_del_init(&lun->lun_tg_pt_gp_link);
> 		tg_pt_gp->tg_pt_gp_members--;
>
> 		spin_unlock(&tg_pt_gp->tg_pt_gp_lock);
> 		...
> 		spin_lock(&lun->lun_tg_pt_gp_lock);
> 		if (tg_pt_gp != dev->t10_alua.default_tg_pt_gp) {
> 			__target_attach_tg_pt_gp(lun,
> 					dev->t10_alua.default_tg_pt_gp);
> 		} else
> 			rcu_assign_pointer(lun->lun_tg_pt_gp, NULL);
> 		spin_unlock(&lun->lun_tg_pt_gp_lock);
>
> 		spin_lock(&tg_pt_gp->tg_pt_gp_lock);
> 	}
> 	spin_unlock(&tg_pt_gp->tg_pt_gp_lock);
> }
>
> When a non-default target port group is removed through configfs while a
> fabric LUN in that group is being unlinked, core_alua_free_tg_pt_gp()
> drops tg_pt_gp->tg_pt_gp_lock before taking lun->lun_tg_pt_gp_lock while
> lun->lun_tg_pt_gp still points to tg_pt_gp:
>
> CPU0                                   CPU1
> core_alua_free_tg_pt_gp(tg_pt_gp)      target_fabric_port_unlink()
>   spin_lock(&tg_pt_gp->tg_pt_gp_lock)    core_tpg_remove_lun(lun)
>   list_del_init(&lun->lun_tg_pt_gp_link)   target_detach_tg_pt_gp(lun)
>   tg_pt_gp->tg_pt_gp_members--
>   spin_unlock(&tg_pt_gp->tg_pt_gp_lock)
>                                              spin_lock(&lun->lun_tg_pt_gp_lock)
>                                              __target_detach_tg_pt_gp(...)
>                                              rcu_assign_pointer(
>                                                lun->lun_tg_pt_gp, NULL)
>                                              spin_unlock(&lun->lun_tg_pt_gp_lock)
>   spin_lock(&lun->lun_tg_pt_gp_lock)
>   __target_attach_tg_pt_gp(lun,
>     default_tg_pt_gp)
>   spin_unlock(&lun->lun_tg_pt_gp_lock)
>                                        target_fabric_port_release()
>                                          ...
>                                            kfree(lun)
>                                        target_emulate_report_target_port_groups()
>                                          /* walks default_tg_pt_gp list */
>                                          lun->...  <-- use-after-free
>
> Because core_alua_free_tg_pt_gp() does not recheck lun->lun_tg_pt_gp after
> acquiring lun->lun_tg_pt_gp_lock, it re-attaches the detaching LUN to
> default_tg_pt_gp after target_detach_tg_pt_gp() has already cleared it
> (and decremented tg_pt_gp->tg_pt_gp_members a second time).  When port
> teardown subsequently frees the LUN, a dangling entry remains on
> default_tg_pt_gp->tg_pt_gp_lun_list.
>
> [1] https://sashiko.dev/#/bug/linux-8e4ef2cb-206e-4a76-8c9e-458e67913f8b

The race is real, and it is already being fixed. Yu's patch [2] checks
lun->lun_tg_pt_gp again under lun_tg_pt_gp_lock before reattaching the
LUN, which covers target_detach_tg_pt_gp() as well as the concurrent
group change it was written for. This patch doesn't touch that loop.

[2] https://lore.kernel.org/r/20261019033532.73575-1-yuz08559@gmail.com

Thanks,
Qiliang
