Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 577063C3C14
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 16:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789923490; cv=none; b=YWifFoyXiF7Y1BhZhsoxHvMGLoL7OC252quEJVjgdR4kqF6GtlRvvKgBUNMVyTMAfjsJYx/c2HvYNI4AcivXDb5w4z79HHKKyU9+SNwujNjM8/eEc5EBXrO4VMSR1JgkJdA4KDv5zc2EvmSzwEhhhZpR5Bhe3q5SQLzi1fK23Fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789923490; c=relaxed/simple;
	bh=1dZN/+36WT+w9SH9n/6iI2hjflvXj0jD2GcPIW1t1Bk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=FbXRo1lNIYomnn4+N4c5CCngqwrGJBE6QyHdeEaUk3UZyWEQhZGGml+RB5i3PZXZDng9CzRLAWYbCGoSwQ0lBGhdRyCdFhJzle4uQu5Jv7uFRSjqRZkmQOXFP3sXdxLUkH6MbpNk1yUOKKbotmiNwq3KhsJ53c9yUeXGvj+UuYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gCU/0awN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gCU/0awN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA2ED1F000FF;
	Sun, 20 Sep 2026 16:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789923489;
	bh=qifPAQtefOBANM6sDIuUJDffdU/S9gn9H4X8weMgvQ0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=gCU/0awNnE+T3cIZa7wJwSd700I018NiI7wFT2aD6EQUZfJQz6DtSXP+oRZkYgF3d
	 MqrjHmRpABrifo9DX1/c2h4vY7LWxv9jaIxao8368IMn9yihT3BYojwVhMugSyWCg+
	 irMsdmv+jDc27phHeTdj8V9zCLArEi/vsrF8LfEAsbL68LotTv1vaqWX19LlPWRKlT
	 i5UJzBeM9oVBg4Av1GmfhGaPSulikGgSKY9eAsFxCSV1uvBReT8sab9hhiJwfxCIEp
	 RLAo1Z6H/Elq70FXGIM7do8Q3Az19DwnMh0PaEj4oC0exaBkeJbnSw9qcv3jDWYRI/
	 oy/VLchKHyAmQ==
From: Srinivas Kandagatla <srini@kernel.org>
To: Michael Walle <mwalle@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, Leo Cheng <leo-cheng@vip.qq.com>
Cc: linux-kernel@vger.kernel.org
In-Reply-To: <tencent_65156571568C9E4076E52D1825CC5F476A08@qq.com>
References: <tencent_65156571568C9E4076E52D1825CC5F476A08@qq.com>
Subject: Re: [PATCH 1/2] nvmem: layouts: sl28vpd: fix device_node reference
 leak in error path
Message-Id: <178992348741.879561.13612918660412963463.b4-ty@kernel.org>
Date: Sun, 20 Sep 2026 17:58:07 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Tue, 11 Aug 2026 20:55:48 +0800, Leo Cheng wrote:
> sl28vpd_add_cells() takes a reference on the child node via
> of_get_child_by_name() for each entry and passes it to
> nvmem_add_one_cell() as info.np. On success the created cell entry
> adopts that reference and releases it later via of_node_put() when the
> entry is torn down; nvmem_add_one_cell() does not take its own
> reference. On failure it does not consume the reference either, so the
> caller still owns it, but the error path only puts layout_np before
> returning, leaking the child node reference.
> 
> [...]

Applied, thanks!

[1/2] nvmem: layouts: sl28vpd: fix device_node reference leak in error path
      commit: 885c33944796ec7ddf6b7babfc0f0710f66bfce3

Best regards,
-- 
Srinivas Kandagatla <srini@kernel.org>

