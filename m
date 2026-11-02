Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793603755;
	b=UjWzIVvPwGD8COJWCE1VYywQ5r5sNaKsWlQ+Gbexp2djm5u/OO4YJn9w/rkJSXYC1Iz9
	 9EtAV55qXWBTAnTYuh03dcsOtIbuJBqcj0sFijBPgqEjfoUa55tROzLaEmEmDIekbeW9v
	 xbocqAmYnucVnXv+JqbAl1EBxljuu50N99rqm/O5cJ2d5zEoFmc0Ze6bkIWruYpj2lxl3
	 Fpk7BovdRXiRrBHhZEmG70Z0wSQ+dZjzMRtIvmgsZe/vXavwGB8s9MVEUFUOpVfUwZsLZ
	 4+srmLJKp3ALtNIO3mW8IQk3wJUKlN30XDStie85b1U87OGs7AerkC9k31ZCgAow3PQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793603755;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Spamd-Result:X-Spam-Score:
	 X-Spam-Level:X-Spam-Flag;
	bh=4ByMKIBvfZhDSrda5lB4kY7Ks7hcY9F8y/GUj0feuLo=;
	b=j2DcIQ6GtUboY6QaCeJYkBbEKMbNy7ud7HM0GeUf1iV9626msHW1fxpT3iCZs9yoVLoc
	 7k7UObw43MhNkAgONdk8qG2V5DbJqPG+zi/UicMtJQAhX4j7txv5/GR8Mqk+lbJfxZzzg
	 C8M2VUINuvK1PF4AqKzDN1hT7500Au7qGSpP5bb6AJKN1wxoeSZI+NeLgq7l8XlJg2GDV
	 +W/+97IUyd+qooHFXBNMdInd39nsqav7n+yHuYEkPgrGl04retaD7VSPZncmMjaDt66J5
	 jV+o22IiMlQc+7W0RFTjZ7e8/MuEj7ra4CwjxnxUD/UqSCFf6o+YK07zZ1tq/DNOxPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=F0LlMQ+R;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b="l/eKtV3K";
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=F0LlMQ+R;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b="l/eKtV3K";
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44CFB606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 07:15:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44CFB606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=F0LlMQ+R;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=l/eKtV3K;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=F0LlMQ+R;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=l/eKtV3K
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 5BDC11FB23;
	Mon,  2 Nov 2026 07:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793603753; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4ByMKIBvfZhDSrda5lB4kY7Ks7hcY9F8y/GUj0feuLo=;
	b=F0LlMQ+Ry/LOPWtPCvgLgX4MN2WjfogHaqNqSba867foFYSerbcufbg7EvPPZIEZhyaQBa
	Q1KV8nDRXYM8lcE/Hps8kjz6OCrUawP/3AkESyJ0UOXxZ/mGcwpsALicA9nOoEEDxkkdS+
	+4RZMZglO7DoG6cdxcLiLdtO8b4HEK0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793603753;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4ByMKIBvfZhDSrda5lB4kY7Ks7hcY9F8y/GUj0feuLo=;
	b=l/eKtV3KKkKKPuJkLiZydrhy1LjmqEauFTQXhNWbktgfKwwjr03na2CTqMyb9nGZJi7Usu
	buwFuKhhDK+voFCA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793603753; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4ByMKIBvfZhDSrda5lB4kY7Ks7hcY9F8y/GUj0feuLo=;
	b=F0LlMQ+Ry/LOPWtPCvgLgX4MN2WjfogHaqNqSba867foFYSerbcufbg7EvPPZIEZhyaQBa
	Q1KV8nDRXYM8lcE/Hps8kjz6OCrUawP/3AkESyJ0UOXxZ/mGcwpsALicA9nOoEEDxkkdS+
	+4RZMZglO7DoG6cdxcLiLdtO8b4HEK0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793603753;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4ByMKIBvfZhDSrda5lB4kY7Ks7hcY9F8y/GUj0feuLo=;
	b=l/eKtV3KKkKKPuJkLiZydrhy1LjmqEauFTQXhNWbktgfKwwjr03na2CTqMyb9nGZJi7Usu
	buwFuKhhDK+voFCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BD8A7134B3;
	Mon,  2 Nov 2026 07:15:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id +BvoHKg46GqcYgAAD6G6ig
	(envelope-from <hare@suse.de>); Mon, 02 Nov 2026 07:15:52 +0000
Message-ID: <20efc96b-c57d-4bbf-8d3d-602b8c9e5828@suse.de>
Date: Mon, 2 Nov 2026 08:15:52 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] nvme-tcp: parallelize I/O queue allocation and
 startup
To: "Surabhi Gogte (she/her)" <sgogte@purestorage.com>,
 Martin Belanger <martin.nvme.dev@gmail.com>
Cc: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>,
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
 linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
 mkhalfella@purestorage.com, randyj@purestorage.com, adailey@purestorage.com,
 Hannes Reinecke <hare@kernel.org>, wagi@kernel.org,
 shinichiro.kawasaki@wdc.com
References: <20260922200718.3941465-1-sgogte@purestorage.com>
 <20260922200718.3941465-4-sgogte@purestorage.com>
 <705f4452-3d07-4d91-9dcd-ea53b2cd75a5@gmail.com>
 <CAMof9cU5s0ck20fcSAYSvK-xpcP5_Hv2BmN20Bh3btpLum7THg@mail.gmail.com>
Content-Language: en-US
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <CAMof9cU5s0ck20fcSAYSvK-xpcP5_Hv2BmN20Bh3btpLum7THg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-11.79 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_TO(0.00)[purestorage.com,gmail.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -11.79
X-Spam-Level: 
X-Spam-Flag: NO

On 10/30/26 10:25 PM, Surabhi Gogte (she/her) wrote:
> On Mon, Oct 26, 2026 at 3:57 AM Martin Belanger
> <martin.nvme.dev@gmail.com> wrote:
>>
>> On 9/22/26 16:07, Surabhi Gogte wrote:
>>   > Similar to commit 2a8513091d2f ("nvme-rdma: parallelize I/O queue
>>   > allocation and startup"), refactor nvme tcp I/O queue setup to use async
>>   > API, combining allocation and startup into a single parallel operation
>>   > per queue. This reduces connection and reconnection setup time when
>>   > there are delays in establishing connections, which is especially
>>   > important for high-core-count hosts.
>> [...]
>>
>> Hi Surabhi,
>>
>> This patch breaks NVMe/TCP connects with TLS. This is a different bug
>> from the pf_cache_lock one that Shin'ichiro reported.
>>
>> Test: one VM with 4 CPUs, nvmet-tcp on 127.0.0.1 with tsas tls1.3, a
>> connect with --tls and 4 I/O queues, and tlshd at upstream commit
>> a0bd51d.
>>
>> - Linus master 6b4b543fa187: 14 of 20 connects fail.
>> - Same tree with this patch reverted: 20 of 20 connects pass.
>> - Same tree with Daniel's pf_cache_lock fix [1]: 22 of 40 and 17 of 40
>>     connects fail.
>>
>> On each failed connect, one I/O queue logs:
>>
>>     nvme nvme0: queue 4: TLS handshake complete, error -110
>>
>> The tlshd that runs for the target logs:
>>
>>     failed to search 'psk' key 'NVMe0R01 <hostnqn> <subnqn>'
>>     gnutls: Error in password/key file. (-31)
>>
>> and closes the connection. The tlshd that runs for the host then gets
>> GNUTLS_E_PREMATURE_TERMINATION, which it reports to the kernel as
>> ETIMEDOUT. The other queues use the same PSK, and their handshakes
>> succeed. blktests nvme/062 and nvme/063 fail the same way.
>>
>> I can share the reproducer script.
> 
> Hey Martin, can you try the tests once with tlshd using commit 3a6658e
> ("tlshd: Link the NFS keyrings per handshake instead of at startup")
> or ktls-utils 1.5. blktests nvme/062 and nvme/063 passed with this
> commit. I believe that change fixed the keyring race in tlshd
> independently. If the issue persists, let me know the reproducer
> script so I can also take a look. I saw the same errors while running
> blktests with an older tlshd version from ktls-utils 1.3.1 and
> updating tlshd worked.
> 
Ouch. That will be tricky for distros. If there is a specific commit
which requires an update to ktlshd we need to have a way to identify
that; otherwise we'll see lots of regressions where customers have
updated only one side.
Please modify the patch to work with older versions of ktlshd.

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                  Kernel Storage Architect
hare@suse.de                                +49 911 74053 688
SUSE Software Solutions GmbH, Frankenstr. 146, 90461 Nürnberg
HRB 36809 (AG Nürnberg), GF: I. Totev, A. McDonald, W. Knoblich
