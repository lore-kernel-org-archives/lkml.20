Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792570780;
	b=U3ZWVj0GxWpun5wvxUAjhMGSJftlDz5hyzAHXML3SEAyccL8oBX9SoV11qQTfAxlxvDB
	 y/RIdN1hp+xbkVfapOrG7tNNiuvSAaxgDQncklOeQLt0XXynUiSmQ8QS2O9dYZzX8dfYk
	 4QoQOfnVPyyEN4ZI25c2mFMGqAxCar4DRei7Khe/kir78w2toPYqv7bMzK7C862lnGQqm
	 xv8NieVqoQC5UUq3PHRpXS2oNz1bRntWBRBM03mdcCOOoEBtLH82pE4ygE2sz9LlVDfXr
	 HgQtjDPALbhbWR90s+HW4wIsUm/kwEcyVup6lu665w7ggqdfUy9r8L3eSkDu/+CzPRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792570780;
	h=DMARC-Filter:Received:Received:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Rspamd-Pre-Result:X-Spam-Flag:X-Spam-Score:
	 X-Spamd-Result:X-Rspamd-Server:X-Rspamd-Queue-Id:X-Spam-Level:
	 X-Rspamd-Action:X-Rspamd-Pre-Result;
	bh=UXbOGUpZm15en8KHgC3tGiUJ4oIJt1ZsmGR453cgBIY=;
	b=PSPdsajKwNSXl3g2sg2nzyKDzKzYKxKuLggg9/YmXOBu/dlnDqjeU5G/pw/ggYh7EOCY
	 8f2ii7Rhb3VRsh6pULhs3ADTmusn/J8d83eyR7eq06z1FHeLm7d4ROqFQ7StPFjg//tyU
	 Gqtux4liOOpjbkXXYkWeXcEz/6ItgXcoMQPKMCcaRAF6n23tpXVDyz1t3TAdTsQNhrwq/
	 tKcjbL6aS9W57vt6TO4AONmjooHf0NwPZJ0OjnJHghtDtVvIe7ixjFs97f6F4tNieW3nG
	 Cznzeskdi0luUfKFjWpoZTORXM1YiTJW5ggGshk8TgmTtKcmHZj58k+WoCZJQIcjbmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59A96606A31B
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 08:19:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59A96606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 9F14F1F457;
	Wed, 21 Oct 2026 08:19:38 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 67C73134FD;
	Wed, 21 Oct 2026 08:19:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id BnZkEZp12GovSgAAD6G6ig
	(envelope-from <dwagner@suse.de>); Wed, 21 Oct 2026 08:19:38 +0000
Date: Wed, 21 Oct 2026 10:19:37 +0200
From: Daniel Wagner <dwagner@suse.de>
To: Hannes Reinecke <hare@suse.de>
Cc: Saravanan D <saravanand@crusoe.ai>, linux-nvme@lists.infradead.org, 
	kbusch@kernel.org, hch@lst.de, sagi@grimberg.me, axboe@kernel.dk, 
	nilay@linux.ibm.com, sgogte@purestorage.com, hare@kernel.org, 
	linux-kernel@vger.kernel.org, iyamahata@crusoe.ai, kiyer@crusoe.ai, ganbalagane@crusoe.ai, 
	sjpark@crusoe.ai
Subject: Re: [PATCH v5 2/2] nvme-tcp: allow setting per-queue io_cpu through
 sysfs
Message-ID: <79b5a23a-5ecf-4e96-85c8-031b5eca2867@flourine.local>
References: <20261018010059.83120-1-saravanand@crusoe.ai>
 <20261018010059.83120-3-saravanand@crusoe.ai>
 <0ee4d281-61b4-458e-92c6-7fff3e50c0ec@flourine.local>
 <72fce5bb-b256-42aa-8844-f970c4480ad3@suse.de>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <72fce5bb-b256-42aa-8844-f970c4480ad3@suse.de>
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Spam-Flag: NO
X-Spam-Score: -4.00
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 9F14F1F457
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated

On Wed, Oct 21, 2026 at 09:21:09AM +0200, Hannes Reinecke wrote:
> > I think it make sense to allow that the user can change queue CPU
> > pinning during runtime even with isolcpu enabled. And then the question
> > is should this be connected to cgroups?
> 
> Not sure if cgroups is the right concept here; cgroups are user/
> application centric whereas nvme-tcp is pretty much queue/cpu centric.
> IE after all the cgroup calculations are done.
> Don't think cgroups are a good fit here.

There was a lot of discussion during Linux Plumbers on how to configure
a system for the isolcpus case at runtime. From what I understand, the
preferred interface for this is cgroups. Hence, pinning the CPU for this
work is likely a target for it, though I don't think there is a need to
figure it out right now. I just wanted to highlight this point.

However, to make this truly user-friendly, I think nvme-cli should be
extended so it is aware of this and can configure it directly. I've
merged Nilay's --nr-io-queues patches, so this is the natural next
feature nvme-cli should support; see commit:

e170d6985797 ("news: document the use of --nr-io-queues during nvme connect")

I would also really like to have a blktest for this as well.
