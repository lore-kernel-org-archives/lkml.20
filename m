Received: from mta1.migadu.com (out-183.mta1.migadu.com [95.215.58.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F211539A80E
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 04:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791003311; cv=none; b=STC0R45xUE1fUExnF106nkli4dvUtgYdtlqVJvyS7E0lFX7gSgpdXUVJJNeh1VAGpA3t5POXyn7bgXz7fMZcQ9jJBQTis1odSr2SkXeOG+yM6GtRZd/NYaRi0uWDg3ku/ou0WKi+SM9bM+4hfPokv9K+YVEZgNM9faPoDArq1oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791003311; c=relaxed/simple;
	bh=9TEuhAYbQRl4xk/Mr8a0QtKjrzYqQXYW+6gZXjD+otM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZVca11/u0TRFawuCpgjoQraHZCGQc8hIPzfYSaAh8GmiIRzzRbCrXqovB80fDjhUHqIhunoLmAsOJW4/SgwBiMAceB9RSYOOp8PquliXjsw3XArxJWfp/OxuuJZdIz0lz3X0PxudGps/SsIwJ+q77lumrIp+sPQsrNMtASXAeRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=GIP7HC3z; arc=none smtp.client-ip=95.215.58.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="GIP7HC3z"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=9TEuhAYbQRl4xk/Mr8a0QtKjrzYqQXYW+6gZXjD+otM=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791003301; v=1; x=1791608101;
 b=GIP7HC3z6MhQb4WjwfhYPY6t9aLR6F+a+HtnGccXtoMLuzyj/jUwh2f5ycOGE9nwoziAF6XO
 NxELLtlvNE+Wn9sZxjEMerJajERx2bU7na4JfZx53ea0akXPh7J6Hu8uAA8/0zv1tIPCGTZ2sGr
 YU6CFFgdOdM3TQGQ/S7uvLmnDMJM66TPwQU5facu+y1hElVygCR5lOjOE08+34ou3eFdxNy7tZJ
 Udcdo+YNt99WPQ1dy0PZz6+1e7Bg9jYU4pmiDqGhCcLhAzz++b2F2mrLP3DPD4OYMtF4kHnrb76
 f6kQX47BFQiafVHwYZO1CTqniFlY38iPqIVIvvoMDq6fw==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id a0e1897f3f94718c;
	Sat, 03 Oct 2026 04:55:00 +0000
X-Mizu-Trace-ID: a0e1897f3f94718c
X-Migadu-Flow: FLOW_OUT
Date: Sat, 3 Oct 2026 12:54:57 +0800
From: Weijie Yuan <wy@wyuan.org>
To: Chen-Yu Yeh <chenyou910331@gmail.com>
Cc: corbet@lwn.net, alexs@kernel.org, dzm91@hust.edu.cn,
	si.yanteng@linux.dev, srcres258@furdevs.cn,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] docs/zh_TW: link filesystems/ and cpu-freq/ from the
 index
Message-ID: <asCKoQBbzjZlnwzq@wyuan.org>
References: <20260929131142.266819-1-chenyou910331@gmail.com>
 <20260929131142.266819-4-chenyou910331@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260929131142.266819-4-chenyou910331@gmail.com>

On 2026-09-29 21:11:40 +0800, Chen-Yu Yeh <chenyou910331@gmail.com> wrote:

> filesystems/ and cpu-freq/ each have an index.rst, but nothing links to
> either, so their translations cannot be reached from the rest of the
> zh_TW documentation.  As agreed in the zh_TW scope discussion, link them
> rather than drop them.
> 
> The English documentation reaches both through subsystem-apis.rst,
> which the zh_TW index lists only as a TODO item.  Translate
> subsystem-apis.rst, with the two translated areas in its toctrees and
> the rest under TODOList as zh_CN does, and link it from the index.
> "Core subsystems" is rendered as 基礎子系統 rather than
> 核心子系統, which would read the same as the page title
> now that "kernel" is 核心.
> 
> Like the pages it links to, the new page carries the notice for
> translations not kept in sync.
> 
> update to commit 4f10f1dfb235 ("net: remove ISDN subsystem and Bluetooth
> CMTP")
> 
> Link: https://lore.kernel.org/linux-doc/CAKspUhJAbCWoxgh2eq8R5g_MiNK=oXgKPUWqGOpHh0w1-Fv74A@mail.gmail.com/
> Link: https://lore.kernel.org/linux-doc/ap5xEtMdwXS8Pvcf@wyuan.org/
> Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>

Acked-by: Weijie Yuan <wy@wyuan.org>

Thanks.
