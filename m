Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794701934;
	b=KZQ312yZxheRAxMWqyd9GoPu6jpI7PwC3OlzYv7WiYdCGs4L0R6vomc1fl2wEbaMgaCC
	 zBpL0/Qnhb64ayNaZ7owXfvspKwCJiOYgXB4sdD3O42zS7tvrzi343+t4KFPvhUVuLuko
	 fI4P+kFxxTopk38lrbBr9Z8VxZHoHqyKnfPpwDLZrQ6Si+jXnW2G/G9BSWhNypBdlCvtv
	 qx9NFyaeZDsQeBwA0HqSOTxajFhkP55594SA8odGCehS4d2RRws0UsyW6sHNJy3PJ6csV
	 5maUNaQeSgX9CWU1wa8Xig1iiwEauhAS/4qdmH7tL/F1hSO4nrvlNTdKhBIMaO6aSpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794701934;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=JejavGOhT29+kYZxPl7g8FlCzMWntZ9rMxIL0KrRCgg=;
	b=wDreR4v8uxNeaDrNN1QanCvKjXkWkxYRdaiwrnX4E3ohQV1kG0nmUS/0pxDRYCjefiZz
	 4bOB1DNRvF2mlnU3f2bCW3908T7MY13L7/FmVdSXg3VaGOq6uLDvGqZuPjHQeDHF8OeSr
	 68AytRIdLipC+9Kmbp3SkkukIgYmBaGEeQ3bUFsY5u80Tzeh6BQvDHIKEihZbIh2uJ09l
	 dHsAWdbvKJ9cjFJXhQpsHTkPLKaIvDvzRq22qhB1HHDmZijaBtLw1xmKFZx5IjjV1pGLC
	 2MrP/hgJODWogWSOeaKHByjrVs8pkoG1gYnu4Q80X3jWLlzKO7MFDRkVBxnTa+wt/4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=CLZiqkUi;
	arc=none smtp.remote-ip=209.85.222.170
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E10C6606A32E
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 00:18:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E10C6606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=CLZiqkUi
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-93f22a8515eso272248785a.2
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 16:18:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1794701933; x=1795306733; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JejavGOhT29+kYZxPl7g8FlCzMWntZ9rMxIL0KrRCgg=;
        b=CLZiqkUiy/GqoMK+wOyDEYP2H1dJ227AZJ9Z8XC3+j1I4tBq57Tz++CXSvWNkYlb1I
         VH2/IrtUDdGMYYvSoMK49waU3rQ192zmkKPi5Wg9y4HR5rwHpUHO1D5pTrHi/mjEW9ct
         GjKEr6kPgjPz7Ih1wSoqksm3BM/X1CgQs/Nd7pC9tQm3Eg//Y544Zu37OsmxUkHS3zwG
         v6YsLfw9Z91eCnVaMbOCLeTv8KXuhpzuciXLUppvC8Iecs9A3aeapVStAQ1VxeYMJ7qc
         l1ArYTSfSCx9dF6vfeVBrF9tsGfoKDta0ay7l7p2DzlbvCgV7rpqxyL6obw1+5WQeRbb
         OTkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794701933; x=1795306733;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JejavGOhT29+kYZxPl7g8FlCzMWntZ9rMxIL0KrRCgg=;
        b=MNTpM4Shy0Cx0WSYbXOZ13Le//k+U0JA66ZC+aYyCiw54i6ZrGf2BulRZXPnrG9y4y
         2LWcCCvey4ouNs7HA3ndcku+HJRTbIi4PTWCZjcScUS5eIG70viFjyRvFmq+bVDiQoul
         VYAxs6vwyrHHMt3k6ew8KgzwD0x4hE2fD5ecODRyNr7Qbxq2TVYRJG63ml0lWmFJjygW
         iskWBhfeLNwHhod3pxP/eQeII/cEnA3KwNNMJwJm7CLESAD74paX6LwNPQ0GaCjhzFIC
         Ny8eAL8gPPT1yq9VHgieBnEvb46/YxNgStHFrqBviMoceEf+JVXBgpjdZZVO+nEtarDZ
         ujQg==
X-Forwarded-Encrypted: i=1; AL+hErHToIbzxhHISY9d94beZmNI/fNjCZWh8tFuv8rnjdOuuEnhL/HQKoeGXWLQpoJIRV2kBUeohDSYVT9bTg8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+NBB4UPrIDFIMDBQ9NjbbK16IJpRAuoLUEXfWYDJUNA7D1T1jg
	peQ1kmYZccCH8QHd4CXXUj5+XsBOFTEQyKGTucaR48wzodCm9bbqiySFD7nbLEf5YvE=
X-Gm-Gg: AYBFou37vZGV9mySl0CBauueISuuY6rduXMn8AqbU66yJspsYixdG6Ow34/dadcdRtE
	ZJg3i6CwOJfkanxUTb5NRDyfsI/yyDego7KRMfnxKNSQJ2KaHLI5eLmuvP4/wBfZoVxw/wbQ90y
	TSLEx/IJ660BUDde3l+e95S5EZjKktVyoC3VxF+CeKKhujWKChV54zMGLQBPOkVECRDuPapIuP5
	s9bhdk6TGs0HUwwhKp8cU8Kb0A1ivIiLu6nGKYzOVgu9KPyI0zPtHJeyTdgC+6/fqO3J2NTuV94
	CoOpkyi7lzn7GPeojGM/skLy3G/kdj8DMKHJWLIXRAuavGxXBP+bWvCUl/Ues/WPv86T4T17TMV
	UoJPEr/7Sj/LIKvZmWACs4tjpdaFnl3DJGnWqy060GO1R765ImSMmbnOEhRNuH/r3dRsipDbUMn
	F0SWgFlQkNfQPsIOEkD3cebJP6EInZlLqUaZun5VXgs6Q9Fjl4gu/8gpENoSk1MCz/YRAkcRuC3
	B4gK9CBn0KsvhtpykeaD+8sMJ6cXL7rAX+lRwfICUStNNpKTdqIGUkLD3klZkm6zhlyFSRrMDC3
	nQECPg==
X-Received: by 2002:a05:620a:2b96:b0:93e:5fbf:a41c with SMTP id af79cd13be357-9494bbb7e8dmr1069300885a.16.1794701932860;
        Sat, 14 Nov 2026 16:18:52 -0800 (PST)
Received: from ziepe.ca ([142.166.156.71])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9494c8f92bbsm512903785a.40.2026.11.14.16.18.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 16:18:52 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xSNxL-00000005ESx-1JsN;
	Sat, 14 Nov 2026 20:18:51 -0400
Date: Sat, 14 Nov 2026 20:18:51 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Aibing Chen <chenaibing@cmss.chinamobile.com>
Cc: leon@kernel.org, achender@kernel.org, davem@davemloft.net,
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
	horms@kernel.org, linux-rdma@vger.kernel.org,
	netdev@vger.kernel.org, rds-devel@oss.oracle.com,
	linux-kernel@vger.kernel.org, hdanton@sina.com,
	hackerowskiy@gmail.com,
	syzbot+ccdb5058c3df2d94811c@syzkaller.appspotmail.com
Subject: Re: [PATCH] RDMA/cma: add rdma_destroy_id_wq() and use it from RDS
Message-ID: <20261115001851.GH2532299@ziepe.ca>
References: <20261114150541.1908-1-chenaibing@cmss.chinamobile.com>
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
In-Reply-To: <20261114150541.1908-1-chenaibing@cmss.chinamobile.com>

On Sat, Nov 14, 2026 at 11:05:41PM +0800, Aibing Chen wrote:
> syzbot reported a possible circular locking dependency between
> rds_trans_sem and the RDMA CM handler mutex:
> 
>   CPU0 (bind path)                    CPU1 (CM callback path)
>   ----                                ----
>   down_read(&rds_trans_sem)           mutex_lock(&handler_mutex)
>   rds_ib_laddr_check()                cma_ib_req_handler()
>     rdma_destroy_id()                   rds_ib_cm_handle_connect()
>       mutex_lock(&handler_mutex)          rds_conn_create()
>                                             rds_trans_get_preferred()
>                                               down_read(&rds_trans_sem)
> 
> rds_ib_laddr_check_cm() destroys the CM id from inside
> rds_trans_get_preferred()'s read-side critical section, while CM
> callbacks create RDS connections (taking the same read lock) from
> under handler_mutex.
> 
> Break the cycle by destroying the CM id asynchronously: add
> rdma_destroy_id_wq(), which queues the destruction on cma_wq, and
> switch rds_ib_laddr_check_cm() to it.  The destroy work is embedded
> in struct rdma_id_private, which keeps the id alive until the work
> runs; rds does not touch cm_id after the destroy call.

This doesn't seem like it should be the core codes problem? Why can't
rds do the workqueue?

Jason
