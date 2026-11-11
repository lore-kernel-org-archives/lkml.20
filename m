Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794413133;
	b=PAFJ1gw8xdZLxubsIpi+YK2Fg/CWzTTTvGLZ8SbYOmY236Le6L/Cl5zKHKA4SupNZUpR
	 qTEx89JEN7g2usINyBzO/p6xaOcESjfI5DdXXM9tjc7I6TzJw1W3W7CarZeBSraPLnh6/
	 kEdgiqNDI3wYorrx8u3kjK4HJ28i7AoMnWCVNHWHjXKystlSZPpy+L6/5caOI30MJmzMI
	 QVWAceS935fXTEWJFqZgqTjtdJhTwxICBlkQLiFl2ik6WjlWL7uUkOn6xmPLMPy3BaCkM
	 RQiYf97Gtfcj12P+5+gx00ERDv/p8MpCetaqXb2HeUwYcD3ZSG/1NPNdAt05rwl4KOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794413133;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=ETLK+DdRn6kk3hBhCehC77zb6MlX1fYlnjRI7fCs/qI=;
	b=fjFo8cF0vrWVMm5eIIBxKbJgPyztluIpwHsY6eJxZkyc7KxjwmiIdr4zKQF+RVWZpbi0
	 Vce9eV5RSMmH9AbR8Qzyfv5D//Yd+ZlBaDtlQkQWTKV77kIwgrTqp+uHuucpgZBtf/+/U
	 oYdNvc/5U5F36M1tKPSiWZY9ekyZUwg4BxMaGu422R8clUByHL/2O6JEnSvquwJK5IaS4
	 774Qcqp7Wf14P8aVykLvu+qrp2Cv4elx3FpgsANDJwAJGYZcMM+JB5Lwt6wjbVRTxn27S
	 Xjb4sj8GmybPsssJvxf+zRM+sV34jBiXhHu7HGMr7zmnLuJQ7ZcoN8U1oFHwi8nVhzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=hWKMs90a;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B381606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 16:05:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B381606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=hWKMs90a
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 65BB71576;
	Wed, 11 Nov 2026 08:05:28 -0800 (PST)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 08F243F632;
	Wed, 11 Nov 2026 08:05:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794413131; bh=cArNf3uUSKVbLUajKxvLX5GaeGbikslkFdj5wW0Ifmg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hWKMs90aLMdy6znrh1MOx8J6w8p2Rrk28zPzUaaOLO5OXdhVlHkhARHeS0kw7qM93
	 3ChJlPjAd3S18By/iASWJGDvBEmY3F+mASN7ndhWjvD4JX6JtYDcARl6Mq3vcdX4Nd
	 /XZDQDXliJ3qhjsrFU83okn3skb9WTazu7TYKrPU=
Date: Wed, 11 Nov 2026 16:05:28 +0000
From: Leo Yan <leo.yan@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Tamas Petz <tamas.petz@arm.com>,
	Tamas Zsoldos <tamas.zsoldos@arm.com>,
	Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	coresight@lists.linaro.org
Subject: Re: [PATCH v2 15/23] coresight: trbe: Report truncated trace on
 buffer update errors
Message-ID: <20261111160528.GD9176@e132581.arm.com>
References: <20261016-trbe_enable_disable_irq_handle_refactor-v2-0-3f57cf3199b1@arm.com>
 <20261016-trbe_enable_disable_irq_handle_refactor-v2-15-3f57cf3199b1@arm.com>
 <57ca748e-127d-45a6-a662-fc1cb9895b51@arm.com>
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
In-Reply-To: <57ca748e-127d-45a6-a662-fc1cb9895b51@arm.com>

On Wed, Nov 11, 2026 at 10:47:10AM +0000, Suzuki K Poulose wrote:

> > @@ -903,6 +903,7 @@ static unsigned long arm_trbe_update_buffer(struct coresight_device *csdev,
> >   		 * errors and as such buffer is empty.
> >   		 */
> >   		if (act != TRBE_FAULT_ACT_WRAP) {
> > +			perf_aux_output_flag(handle, PERF_AUX_FLAG_TRUNCATED);
> 
> Do we need this though ? If the buffer has space left, we shouldn't use
> TRUNCATED. TRUNCATED causes the event to be stopped and the userspace
> needs to re-enable the event.

Here setting TRUNCATED flag is intentional for fatal faults. The following
patch restricts this handling to TRBE_FAULT_ACT_FATAL only.

We can consider this from two perspectives:

 1. We distinguish TRUNCATED from PARTIAL (see patch 23). PARTIAL
    indicates a recoverable trace gap without disabling the perf event,
    requiring tools to reset the decoder explicitly.

    In contrast, TRUNCATED streams contain ASYNC packets for decoder
    synchronization, so reset decoder is not needed.
 
 2. The AUX sampling calls update buffer callback [1], any fatal faults
    will set TRUNCATED to disable hardware and waiting for userspace to
    re-enable.

Thanks,
Leo

[1] https://lore.kernel.org/linux-arm-kernel/20260915-arm_cs_support_aux_sample-v1-16-35cf6f297d20@arm.com/
