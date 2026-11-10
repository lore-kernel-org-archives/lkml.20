Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794295076;
	b=A+6o9COSprr0SM8b9zU5F/57y/ZKKwD8Zm3PT+l2GQa7sELPvtHxToA0Q6Jgw4ny4UlA
	 tl5RILrLlTo0QghPU1czBqT7YwIoGjRr6uABtqhEziKLhEW0VXcDClYZ8bENjRSQu8k1s
	 nmADHGQIg8kioZUJuEbStgM7Ievw1wiUe+i3oKX3aK9ad6IRREI0ZqGl7ejMy+xJqKGH9
	 X1bJhkOpjokJMUGKIlkMWNyEaGJ5dvz8vqLilJ3tp23lvCI+xW6xGnLR+wfeTpgTSVMSy
	 vWnHpSQ7U//5FCznLqGsv7ytmJcDGjz40588lRGof88ircY1rIZS1aaDo1voSU4h9gw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794295076;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Rspamd-Queue-Id:X-Spam-Level:
	 X-Rspamd-Server:X-Rspamd-Action:X-Spam-Flag:X-Spamd-Result:
	 X-Spam-Score;
	bh=1rPTBO82JSPFKRtnf3rx3ha1Otc+BPA9gRc5dOxQULk=;
	b=2XfAk2s1bO7ECdATxsF23qFlJr59D+o9NVSUUQK0j8OFXt/WCGRgGjC/ZqmO7Gv8Pd0K
	 Z/lMTq+zPHp4nrSNsss/7pRbVbFtMiBpJ10iE37InyafZ/w19/U3Naro4kVNXtrEFuGxv
	 l8Cl4wvKQwS1XEtnZEgKOV9A0pWHxS2plqXw8WmuveLezxow7EGdQw/zMfSgPXlNwJvg0
	 MkQB9pIiNynkgSNZ2DYoJvKLQELfl/NhNF3/mPP5wNdSGrhQjL0UINIaatQOwD8G+Bapm
	 0MJL3RkGe4WvwcXUSZLW66T0J4RI0KoNJbQLPmQOQhH4Bfcn0XL+3UiUnct4p49E2GA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=D1UCTzXL;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b="O7zJj+W/";
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=feaa7WR+;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b="5xl6g/9O";
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96C0D60A2638
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:17:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96C0D60A2638
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=D1UCTzXL;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=O7zJj+W/;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=feaa7WR+;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=5xl6g/9O
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id BC8ED1F792;
	Tue, 10 Nov 2026 07:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794295073; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1rPTBO82JSPFKRtnf3rx3ha1Otc+BPA9gRc5dOxQULk=;
	b=D1UCTzXLLd5E8BZDVlhfAEpcKzW2ceFGkkHCv3sAOCDOavyZxoFI4TgiMLdyNMTGWX+V+B
	NJIEnl7PtvxlMvRjB/hiPHLUj7w3Lxbz1TDmqe/vdNlBT3C/ZI3Alo+8irTzrImn5PLW7Z
	53bZIeaAigICiUhVha7SUWtZTFPMpg8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794295073;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1rPTBO82JSPFKRtnf3rx3ha1Otc+BPA9gRc5dOxQULk=;
	b=O7zJj+W/NT4yHAztczx1eisfZZH6/zhCp9FchtsjbdC8hwgkoWbYJoOioyWXjInm7DWH5R
	BF2ihB2W3J5OAXAA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=feaa7WR+;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="5xl6g/9O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794295072; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1rPTBO82JSPFKRtnf3rx3ha1Otc+BPA9gRc5dOxQULk=;
	b=feaa7WR+uMo08nFkFrPk9c97lHaiWuLoDV4+WJLaIJC+XoJm1mm7J5a+UfXtg0l8EGIWPd
	SsWtlfR8i02a/wZnsmEJJfSnzJhfOduNwJR+cdYqVAxcDFpVOYwbY+CTjTGoe4YoHVtm0B
	/nToaJjRjjEdgTdfXGgOZs9RYz5WG/U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794295072;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1rPTBO82JSPFKRtnf3rx3ha1Otc+BPA9gRc5dOxQULk=;
	b=5xl6g/9OThn4E5F50gC9lIcocwccHA9rOwVKeHEgTsPOlm1LJki/RC6+JZ1AoS5Z9fZKJO
	cej+QTnPkh/RP+Cw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6A24E1339F;
	Tue, 10 Nov 2026 07:17:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 17rVDyDF8movZgAAD6G6ig
	(envelope-from <hare@suse.de>); Tue, 10 Nov 2026 07:17:52 +0000
Message-ID: <f4d1c582-8760-4915-87ae-a2f070070d54@suse.de>
Date: Tue, 10 Nov 2026 08:17:51 +0100
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
Subject: Re: [PATCH v2] nvmet: reject invalid write-protect feature values
To: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
Cc: hare@kernel.org, hch@lst.de, kbusch@kernel.org, kch@nvidia.com,
 linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org,
 sagi@grimberg.me
References: <20261109135536.2772-1-sreekuttan2156239@gmail.com>
 <20261109142428.2612-1-sreekuttan2156239@gmail.com>
Content-Language: en-US
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <20261109142428.2612-1-sreekuttan2156239@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: BC8ED1F792
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-13.50 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_TRACE(0.00)[suse.de:+];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email]
X-Spam-Score: -13.50

On 11/9/26 3:24 PM, Sreeraj S Kurup wrote:
> The Set Features handler for namespace write protection currently
> accepts unsupported values. The default case in the write-protect
> switch leaves the status unchanged, causing the command to return
> success even though no valid setting was applied.
> 
> Return NVME_SC_INVALID_FIELD | NVME_STATUS_DNR for unsupported
> values. This also prevents issuing a namespace-change notification
> for an invalid request.
> 
> Fixes: 3a1f7c79ae6d ("nvmet: make nvmet_find_namespace() req based")
> Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
> ---
> v2:
>   - Add Fixes trailer
> 
>   drivers/nvme/target/admin-cmd.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/nvme/target/admin-cmd.c b/drivers/nvme/target/admin-cmd.c
> index f12d83098644..ee8be237485e 100644
> --- a/drivers/nvme/target/admin-cmd.c
> +++ b/drivers/nvme/target/admin-cmd.c
> @@ -1223,6 +1223,7 @@ static u16 nvmet_set_feat_write_protect(struct nvmet_req *req)
>   		status = 0;
>   		break;
>   	default:
> +		status = NVME_SC_INVALID_FIELD | NVME_STATUS_DNR;
>   		break;
>   	}
>   

Please send new versions as individual patchsets, not as replies to the
original patch.

Reviewed-by: Hannes Reinecke <hare@kernel.org>

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                  Kernel Storage Architect
hare@suse.de                                +49 911 74053 688
SUSE Software Solutions GmbH, Frankenstr. 146, 90461 Nürnberg
HRB 36809 (AG Nürnberg), GF: I. Totev, A. McDonald, W. Knoblich
