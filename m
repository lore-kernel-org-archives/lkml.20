Received: from canpmsgout01.his.huawei.com (canpmsgout01.his.huawei.com [113.46.200.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9DD647127C;
	Wed, 30 Sep 2026 09:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790760069; cv=none; b=VNVDhOl40mJAivJ1fzZ0Us46dplO0O3vt6aWGabXJBT/maIRsCJVgsYwdaIAWvBtJFNEf9Ju5lOuQirrfBitlPhHY7fRINNQWzWZsKjCmC7qhE2pL3eWZ3m09dDOLxvVru5Nx6gLMlZ4yR7XgNsyPfSbciYki41ls/R8sklTTR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790760069; c=relaxed/simple;
	bh=yT4qWVZ+9JPB7qcHY/op2BpeKH24p/wlR6ETHPZOnPw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=trC9/qTc1TWZYcKnOx0DZ5o9ndt4YdBuH8vT0eCYkffB9q7dDFg2CnxDtM+Dt/WIL588roYWsGAm89YeZEQN0oMt8/drDNZxpp5tz0qfDdNPf7HgHPZ4ywLP5Ax575Xb7AT3s+6lYk4ce/PJFooX7Iabe3mdzItwehfCWlVJR/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=tY4ep7e8; arc=none smtp.client-ip=113.46.200.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="tY4ep7e8"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=9I1J5/irPWPpC3onuKiGy23moCl8MOWObpAWFnLI0KQ=;
	b=tY4ep7e8mWxoajgF2Au3TYM4VsY+ch7ReHXbr/CGAH/ICmaqLROzmZ4mExrl1tc+8IDWZHZGq
	c/iI6da3KgfKB165vi6qlENXld8OMBg9gxSi79fLSfyksTi7mJYqZT01HSAOrINZyN3eYLOh4V2
	nakGiIkiZ3Kdo7rIi2mCWaY=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4hvq3c3jGYz1T4Fq;
	Wed, 30 Sep 2026 17:09:00 +0800 (CST)
Received: from whupemp100012.china.huawei.com (unknown [7.152.185.135])
	by mail.maildlp.com (Postfix) with ESMTPS id E3CAA40561;
	Wed, 30 Sep 2026 17:21:01 +0800 (CST)
Received: from huawei.com (10.67.174.121) by whupemp100012.china.huawei.com
 (7.152.185.135) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 17:21:00 +0800
From: Yao Yiqi <yaoyiqi3@huawei.com>
To: <sashiko-bot@kernel.org>
CC: Srinivas Kandagatla <srini@kernel.org>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
	Arnd Bergmann <arnd@arndb.de>, <linux-arm-msm@vger.kernel.org>,
	<dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] misc: fastrpc: Fix double free and races in fastrpc_req_mmap() error path
Date: Wed, 30 Sep 2026 09:02:07 +0000
Message-ID: <20260930090207.2975609-1-yaoyiqi3@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260930074609.1C0CC1F000FF@smtp.kernel.org>
References: <20260930074609.1C0CC1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 whupemp100012.china.huawei.com (7.152.185.135)

On Sep 30th, Sashiko AI wrote:
> [Severity: Critical]
> Is there a risk of a DMA use-after-free if the unmap operation is
> interrupted by a signal?
> ...
> If fastrpc_req_munmap_impl() returns -ERESTARTSYS, this err_assign path
> then manually adds the buffer back to fl->mmaps. When the process later
> exits, fastrpc_user_free() will reclaim this buffer while the DSP may
> still be using it, which could corrupt newly allocated kernel memory.

Thanks for the review.  This path is not reachable.

fastrpc_req_munmap_impl() issues the unmap RPC with kernel = true:

	err = fastrpc_internal_invoke(fl, true, FASTRPC_INIT_HANDLE, sc,
				      &args[0]);

and fastrpc_internal_invoke() waits differently depending on that flag
(fastrpc_wait_for_response(), drivers/misc/fastrpc.c:1320):

	if (kernel) {
		if (!wait_for_completion_timeout(&ctx->work, 10 * HZ))
			err = -ETIMEDOUT;
	} else {
		err = wait_for_completion_interruptible(&ctx->work);
	}

wait_for_completion_timeout() is uninterruptible, so the kernel invoke can
only return 0 or -ETIMEDOUT, never -ERESTARTSYS.  The interruptible wait
above is the only source of -ERESTARTSYS in this driver, and it is only
used for user invokes (FASTRPC_IOCTL_INVOKE).  Therefore the
interrupted-invoke cleanup you quoted (fastrpc.c:1418) never runs for the
unmap RPC, no matter whether the buffer is linked into fl->mmaps at that
point, and fastrpc_req_munmap_impl() cannot return -ERESTARTSYS from the
err_assign path.

For the failure that the unmap RPC can actually return (-ETIMEDOUT or a
DSP error), re-adding the buffer to fl->mmaps keeps it tracked so that
fastrpc_user_free() reclaims it on release.  That is exactly what
fastrpc_req_munmap() has done since 6102ceb4eab8 ("misc: fastrpc: Remove
buffer from list prior to unmap operation") for a failed unmap, and this
patch deliberately preserves that existing behaviour.

Best regards,
Yiqi
