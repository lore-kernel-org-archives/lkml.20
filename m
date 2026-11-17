Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.28.123
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794913191;
	b=CY/uot/QdOk+qVgtTyF6kY7VLuwb3XgMR7caeVjR+gm5RndvrreIoGh7KZxnlhxNlE6+
	 AiFbajf7euAgsDHhc5kL90aEdISI91AesjwugRzCmKsd4PvTtcM7vU6sPFO2FTLCxu0Kl
	 MQYvjE3bXcpUo1jc6PyYl9P5eIUraCW/jQ9oMB/00YTOj8jmPdV4ZrDr78P+AZkCufLOs
	 bdhvxTj6oXR8BjZOo1Wr7JurmGmQ2sik9KVsaRmkLG/vKDozpL2sbFJQusO0mMKM0PODP
	 C4qe2hWMOHkdsmVwOtE4KGKgEazL7Kp/qXho6mwkyGNJKrhYFxPPRXXh+Vt2NrTIh8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794913191;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=hh/bsSW4jmc4opaTi9RD91uQAj+fh+Nn7GjFv3G6gfM=;
	b=nsjRcAEumq0SooDl0C/AaqML8ffTfiXXb5uivt8+YxvVtSH31KS3lv8S5cdkF5jjRPmH
	 /MIasTyh7TYuYxt3JQUlwEcjnX/QULjqQwdr9to0clqhq+RCBnofLrdE9kRYPC6v0Y4r1
	 Ya0N1ryimnwl9LR0txHGNEIk57qrPx5MiDbLRtv/4u+FiY8FEMvZmWu1DsJTOZkZy+Fzw
	 VH/Et8yiK6mt4AE8iSNwQIejzMv4Z6pPosZEMtRA5KCj7hM0Fkp0cmRQ6phrIj5fL5BZN
	 bJCPJ7u3fLZEro30mVgySvbdywQFdfP8q3cBP0ovuUWiKkZz+tigvVpJWMbT2gQMglA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=xiaopeng.com;
	spf=pass smtp.mailfrom=xiaopeng.com;
	dkim=pass header.d=xiaopeng.com header.i=@xiaopeng.com header.a=rsa-sha256 header.s=default header.b=nEYj1aKK;
	arc=none smtp.remote-ip=115.124.28.123
Received: from out28-123.mail.aliyun.com (out28-123.mail.aliyun.com [115.124.28.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2FA8606A31C;
	Tue, 17 Nov 2026 10:59:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2FA8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=xiaopeng.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xiaopeng.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=xiaopeng.com header.i=@xiaopeng.com header.a=rsa-sha256 header.s=default header.b=nEYj1aKK
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xiaopeng.com; s=default;
	t=1794913180; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=hh/bsSW4jmc4opaTi9RD91uQAj+fh+Nn7GjFv3G6gfM=;
	b=nEYj1aKKFrhCXU1DCb9g74stb0N2Zc56WfJ3cB8k0RhejxWq2ov2yd9Nb0tQNAckHnqsFuIYIfZYNYBpRvuqPqW46a8Thu5+zyTn22YeRtMO8jFBeunHZlm+nV73t0tlnKGBeVVcRe0HxZErYTk1KEDMp6HOGnagwsRHVb67N9c=
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.06199611|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_regular_dialog|0.0017656-0.000129412-0.998105;FP=3193649721091749240|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam011083034076;MF=fangxy@xiaopeng.com;NM=1;PH=DS;RN=14;RT=14;SR=0;TI=SMTPD_---.k4.HSHG_1794913178;
Received: from localhost.localdomain(mailfrom:fangxy@xiaopeng.com fp:SMTPD_---.k4.HSHG_1794913178 cluster:ay29)
          by smtp.aliyun-inc.com;
          Tue, 17 Nov 2026 18:59:39 +0800
From: Fang Xieyan <fangxy@xiaopeng.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Sergey Ryazanov <ryazanov.s.a@gmail.com>,
	netdev@vger.kernel.org
Cc: Johannes Berg <johannes@sipsolutions.net>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org,
	Maoyi Xie <maoyixie.tju@gmail.com>,
	Simon Horman <horms@kernel.org>,
	M Chetan Kumar <m.chetan.kumar@linux.intel.com>,
	Guanglei Zhu <zhugl3@xiaopeng.com>
Subject: Re: [PATCH net 5/5] net: wwan: iosm: validate the command parameter length
Date: Tue, 17 Nov 2026 18:59:38 +0800
Message-ID: <20261117105938.9647-1-fangxy@xiaopeng.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <179483731920.3136.4345864455275657786@kernel.org>
References: <179483731920.3136.4345864455275657786@kernel.org>
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

On Mon, 16 Nov 2026 13:55:19 +0000, netdev-bot+sashiko@kernel.org wrote:
> [Severity: Medium]
> Can this bound reject MUX Lite commands that were handled before?

Yes. The compatibility branch in ipc_mux_dl_cmds_decode_process() is
there for cmd_len != size (size = 20), and the protocol minimum is 0x10,
so my min_t() dropped the 16..19 range that branch is meant to serve.

v2 will stop using cmd_len as a parameter bound in the lite path and
keep only param_len = skb->len - hdr_len. There is no chain walk here,
one command per skb, and ipc_mux_dl_decode() already rejects a short
CMDH header, so cmd_len buys no safety. It will still be passed to the
decoder unchanged, so the compatibility branch keeps working.

> [Severity: Low]
> This patch has Cc: stable and Fixes: 9413491e20e1. Its context, though,
> depends on the earlier series patch "net: wwan: iosm: pass the DL
> command parameter by pointer", which has neither a Cc: stable nor a
> Fixes: tag.

Correct. v2 will add Fixes: 9413491e20e1 and Cc: stable@vger.kernel.org
to patch 4/5.

The point on 2/5 is also valid. packet_offset equals dl_head_pad_len,
so this is the same empty case mux_dl_process_dg() already rejects with
dl_head_pad_len >= dg_len. v2 will use <=.

Thanks for the review.

pw-bot: cr
