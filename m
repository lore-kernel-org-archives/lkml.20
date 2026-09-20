Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECD1C443C07
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 16:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789923492; cv=none; b=gi2nhrlqGb917+doy/6rSfbOhUUy5Vus07ZTf2cr0uMCje7bO+roSgI2107ArVA4M9akXPArfXBoAi4ck0G8LVh744Rd839eJR3QIstd4kYNeyyvEnO6fDhKBOJneeADoYjT1fY2S8g6RBc3CZ9b/h5rsDGrA9w2VyrsDn6kg4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789923492; c=relaxed/simple;
	bh=iECl5SvxbJovgtSSO2yAZUKHU4eds0fZvkUAh5g4HNg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ZhWFH1dxuPhv8IaNfnNWeZJm463i8/Y6RfPZ+sXv0tvYY2yes3By+uPMsLyWsU2KTPKVBT8XBzqZ4roGy1qGG4qvuQpS3H7FxybHPNJfNWDLYMU04kWtwZIzGWgIDa2PUcRSSyD5T2MQmo1WuOpSddETocN1ji7R1KdsYLYwcyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LYzmza1z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LYzmza1z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8522C1F00893;
	Sun, 20 Sep 2026 16:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789923490;
	bh=EAUbUGtJqKPg4YGTRUNg6L7gB34ii4Gt+NCOM1sAM3k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=LYzmza1z5wp0j0btz6HHfi2V7cABwTP6snHgKakVvdSaagGy5JfIVPhxOOYTHKj9T
	 OIsxRg9A1bJjwQBPD+1G1IMJdz/rFjbtcI45vk0KdncVpwiDDOY0+cnIKmsvK4gW5m
	 2VqO4KlhFh6SUPMsT/hTGxvzlo6wxVgOvzCewMNytmRidP+E3A7aLjXyt/zG17TSgb
	 pKN1H95OdXv+OJ/X0wYQU+an6A726h0lo+QcDYQ5qUWiUFhZQmap/NhJhMIELM24tK
	 DgUf4HDZgJLswStWPBAEgmzbFo8y6NxX1R7GBj2RwLeyBFWzWalOndO9UWFDJ5Qt5j
	 aAlibQFxsmX3A==
From: Srinivas Kandagatla <srini@kernel.org>
To: Michael Walle <mwalle@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, Leo Cheng <leo-cheng@vip.qq.com>
Cc: linux-kernel@vger.kernel.org
In-Reply-To: <tencent_795E00A994EB63D831671DBD55A4C689310A@qq.com>
References: <tencent_795E00A994EB63D831671DBD55A4C689310A@qq.com>
Subject: Re: [PATCH 2/2] nvmem: layouts: onie-tlv: fix device_node
 reference leak in error path
Message-Id: <178992348921.879561.16720430203134466231.b4-ty@kernel.org>
Date: Sun, 20 Sep 2026 17:58:09 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Tue, 11 Aug 2026 20:55:50 +0800, Leo Cheng wrote:
> onie_tlv_add_cells() takes a reference on the child node via
> of_get_child_by_name() for each parsed TLV and passes it to
> nvmem_add_one_cell() as cell.np. On success the created cell entry
> adopts that reference and releases it later via of_node_put(); on
> failure nvmem_add_one_cell() does not consume it, so the caller still
> owns it, but the error path only puts layout before returning, leaking
> the child node reference.
> 
> [...]

Applied, thanks!

[2/2] nvmem: layouts: onie-tlv: fix device_node reference leak in error path
      commit: aff113334732214b151c1aa0a69352ab569d8764

Best regards,
-- 
Srinivas Kandagatla <srini@kernel.org>

