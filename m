Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=162.62.58.211
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794904822;
	b=YkI4JKpnJ94/iyIRt7wGRKe3w/lACVZIG35QPWI6x8TTrkBs4uR1cF9oJP6ehvRuDyei
	 BLAGnmdhLXkBDgUuIf/jKVfGaXWggF4Ab5SH70VEPRuBbw9qDTokKKYnRi2qY3cY2HRS4
	 2M2os9fJIMT9d9RXhZKN9Fg24BIFOWfNS+mBz383Fqfwg+5K8qLfiDFarqnkGn0kjIKSp
	 reJdNlYTti9DAmClMDiEhqXbpU3JYPzvFQhzrYdWHrM8WjF8BtnFYNkYaF0Gau6MA7IqU
	 AzOlhrk5+eCMqezq19lqRtlTjjBS8qX0YGACBgUGNUU9BR0nbHLy/Z2yzDB3VJShfbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794904822;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:From:To:Cc:Subject:Date:X-OQ-MSGID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Ow56Dh1ceICwHURLVlW6HlZuR50fD/53SALcfaqTYVk=;
	b=QO1qpL44AkhOMomuL8gd/VAdl1y+KE2LQ35gO6Irsb0pWzsJBVgnRtuJ8Wq0KeGNCVqj
	 vj3eQqNms18Zm770YgYd3OLBFUvDjB4lsh2uMheQBoNZzL7ghJvBN09cL/Kz7IlRn81qk
	 LourMQO2A4XuNcrEnfZW4a/VLHCQTekD/ijK+SQ4kXKRul5SVc81H+tadkQAlFZu0iJad
	 vYMaqVNT3TbhzOGHLcwGmqJTB4Mr801SoxbIHow0qLcpzwkXkj1hc4hEWYb+kBS00z9Sz
	 WPF/g86VDD11rYbctG8bUpAk4d9a75PpOY9Gwpu2X9heiDc2HJClNEZJrRzZ8xYJeeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=apGx4gLP;
	arc=none smtp.remote-ip=162.62.58.211
Received: from out162-62-58-211.mail.qq.com (out162-62-58-211.mail.qq.com [162.62.58.211])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5923606A335
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 08:40:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5923606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=apGx4gLP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1794904816; bh=Ow56Dh1ceICwHURLVlW6HlZuR50fD/53SALcfaqTYVk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=apGx4gLPIlOPLKOk4xL/Q/8f7+D8ZEpKLQqtBmUMTVngeESiBQKl0DdJa1Vn5BQ/+
	 sAXfdT8Tb9pgjgtV1VrN+xHwamqZyP06gauAR6hRgeHx3LywY4HVK/N02MqOJ+yQ99
	 vCCAAUow5oQcxdKIS4d+T2lqZeOFXvGVFs0Lpwl4=
Received: from shuai-VMware-Virtual-Platform.. ([117.158.156.199])
	by newxmesmtplogicsvrsza53-0.qq.com (NewEsmtp) with SMTP
	id A0DAEC6E; Tue, 17 Nov 2026 16:40:13 +0800
X-QQ-mid: xmsmtpt1794904813t0e4zgk25
Message-ID: <tencent_3E79DC265C5C09B1C98951775AE90D167707@qq.com>
X-QQ-XMAILINFO: MllZffuBkEb5dXmrjEO9y8FyXa/2kTS+cCFIhe5BjIeynOA5Xr5+NcgQhn+yhe
	 1j3rK9VEG0RM2RZxBryByY41vRX/LchtSmGS2sJuxFFixpPnYsxyK3h/V9Q/h1OVgvrzzD5iK6Ef
	 zEWwmB6BhcMN4vuNUqp1OHqF9DgcnwGirDTuSEPcA+pPt0jFzxbR5TVRsmqGHvR81wR9fHbT4Q8V
	 n2yND2tDt2TUtTtHiQ++Unw6JRK0u0NlwL9PDqj/GSebrtwt9w4eLdxWyBwyEVUOTIY51dPjH9yd
	 HSodN27I8SFJnVOwX6orkaOOlIoSStOhO0BZEXfJVdnww+7H3qfQgxkWcfSgPhXApxwCXMzmt8X5
	 InqDuBPowkIkcYHeRdMLH5nXXjEt86BZxiL+tGl/703wIPeKYoMN74wzz0YEv8Dc4OyEzQ/3k20i
	 zfcj59vEIs448TvLBn2aduNFRbtX/BdFKld0Prs3TLXa36Eb9yhzqpaBFm5hy+Lpc6F9YcbIZNQE
	 3azGtG+YndmhngjCqcTo89BLUGMhEdpil/x+1ddYKQQMJiFGeq99Gpe91VP7PfjGQjiIlyoKdI9n
	 UnT6zHeWbmW04dvT7OYnwPAY5nPhgNTmJAi0RqyYDNzgDcg3AcsQcEqHvIRIyFBi+CDLxBM7BzdD
	 0gIdDSWkF8xOJlmu6tQaf3EkydHrCwvM5JwBDxkGUzkAIYGtrKcH7g4JC/uP7UMux9sw3MKofOxw
	 R8UvAL6SqebrlUrnoULFeN9flSnbd3ADVdko1uCWj99jUcvgQknzr70PlIcXim5JOqzOC7413T4M
	 iS5mg2ybrie2FvQiy2nJdC5+75Ln01MoxkxVO24hK10q4xKLrT6OKmu/vwIM3tkujBx9b8KH6s/R
	 NZWz2/zbsG84p/leIxJTjJ6JkG4VJsXAWQ5r6MHPHWWVa9W42lHuqnOreFBHQwucJap1xR32/c1b
	 9fb0A3pkpGu5tjd6O0H5gbJG3gzeCvt1F85J2HSvE1h4/HArfsEchI4HudvIStkZ28DuZ/iBiQ1P
	 OXI7Om6AlNMpdXog5Qj4GCQSU7/xAH14lY1YNJYUecfC3r/+7CqBAcuGm97cigXAgwuK4p1w==
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
From: Shuai Liu <847807867@qq.com>
To: sashiko-bot@kernel.org
Cc: linux-mtd@lists.infradead.org,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	syzbot+c66e7044aa73c620d862@syzkaller.appspotmail.com,
	linux-kernel@vger.kernel.org,
	847807867@qq.com
Subject: Re: [PATCH v2] mtd: blktrans: keep reclaim out of the ->release paths
Date: Tue, 17 Nov 2026 16:40:13 +0800
X-OQ-MSGID: <20261117084013.314303-1-847807867@qq.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <sashiko-outbox-218282@kernel.org>
References: <sashiko-outbox-218282@kernel.org>
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

Hi,

> [Severity: High]
> Does mtd_queue_rq() or mtd_blktrans_work() actually call
> memalloc_noio_save()?

Yes, the I/O path is already covered on the current tree.
mtd_queue_rq() wraps the whole dispatch in memalloc_noio_save() /
memalloc_noio_restore() (drivers/mtd/mtd_blkdevs.c, linux-next
next-20261113):

	static blk_status_t mtd_queue_rq(struct blk_mq_hw_ctx *hctx,
					 const struct blk_mq_queue_data *bd)
	{
		struct mtd_blktrans_dev *dev;
		unsigned int noio_flags;

		dev = hctx->queue->queuedata;
		if (!dev) {
			blk_mq_start_request(bd->rq);
			return BLK_STS_IOERR;
		}

		/* Reclaim must not recurse into I/O while processing requests. */
		noio_flags = memalloc_noio_save();
		spin_lock_irq(&dev->queue_lock);
		list_add_tail(&bd->rq->queuelist, &dev->rq_list);
		mtd_blktrans_work(dev);
		spin_unlock_irq(&dev->queue_lock);
		memalloc_noio_restore(noio_flags);

		return BLK_STS_OK;
	}

This was added by commit d498b2ddda99e ("mtd: block: prevent reclaim
I/O during request processing"), which is also the precedent this patch
mirrors for the ->release() paths.

The REQ_OP_FLUSH example given in the review (mtdblock_flush() ->
write_cached_data() -> erase_write() -> mtd_erase() -> concat_erase())
runs inside mtd_blktrans_work() as called from mtd_queue_rq(), i.e.
within the PF_MEMALLOC_NOIO scope, so it cannot record the
fs_reclaim -> cache_mutex edge.  I verified this empirically in QEMU:
a flush issued while cache pressure is high stays clean, while the
same flush invoked from ->release() (process context, no noio scope
before this patch) triggers the lockdep cycle.

I believe the review comment was based on a truncated snippet that
dropped the memalloc_noio_save()/memalloc_noio_restore() lines
surrounding the quoted block.

Thanks,
Shuai Liu

