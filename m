Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 362943CE0A4
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 13:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788528196; cv=none; b=tpxcYZFPIYB8WTQM0nHii58aZ5KOTVtyVc42dxE0Fxr96Lv/EnOSlHLHAGg4SYlHimrYayFx0vdTwr1hY6mQZRPqZHKUuliI00FNIdat9ceeSMwQDER2dRCyIA+2eSM+FXybMRTYb8zf7gbDOUAnYdnYpuAnuRFShbsfspi+sBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788528196; c=relaxed/simple;
	bh=kzH4ksfEO5MHX0N+8yevw6f6qQ6yCDgHkBvyymgcSCk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kcanASrR2kSVpH6OivwINKFec3zYAv5R3xz3CDKAa8iiyCWzMrS9sk6pKs9ZpdjFp0EdLvT72mPuiLsUqnF69Md1qh26AA1mdiZphdrMQp3Fzdd/cZtRQcWo/+yP29bobR5rIg94J2uHRoZDdyRLETkEGejr587RbH63mlI/g7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H7bEi0sv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H7bEi0sv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3D2D1F00A3D;
	Fri,  4 Sep 2026 13:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788528194;
	bh=tNKLhiDSEenfEZG4Q+Fp3PWK8iwiBUun7ZbWDLDiUpc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=H7bEi0svPt6U3TOa6ed5LLiNfwVWrqGPVjn/mKgnPoy1E5lnjQ7xLK948Ne2KwfF9
	 6yLewIjVBWdgbUUtGpS81iZY/etBAjDRnd4jwEC7AKdTmYaw0XbwN/JRyMSakxBezY
	 i75aWHVy8IAfWvcXFzUU3pzqDOcCJ+HrzQloeMi5aoqxJ/7JPvzxFqUsUnYG4RO7de
	 Eo6zuGGLBBnbDverOUw54ER+rz3V820rruVSVQOmdf70/6qOwfVp6xfPumFwejNsZW
	 +CtKhx7aH8xpCG4QMVFof1TeJbT6qoKi5ZHwEEI3cFp90xa9kgpQdOvm7HMqNiPgZ/
	 pI4T7nynQNiiA==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sudeep Holla <sudeep.holla@kernel.org>
Cc: Nat Gurumoorthy <natg@google.com>,
	Carol L Soto <csoto@nvidia.com>,
	Maxi Saparov <masaparov@coreweave.com>
Subject: Re: [PATCH] firmware: arm_ffa: Tear down driver during shutdown
Date: Fri,  4 Sep 2026 14:23:10 +0100
Message-ID: <178852815766.332553.14929341497188018251.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260901131112.3437516-1-sudeep.holla@kernel.org>
References: <20260901131112.3437516-1-sudeep.holla@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Tue, 01 Sep 2026 14:11:12 +0100, Sudeep Holla wrote:
> The platform core invokes a driver's shutdown callback, rather than its
> remove callback, while preparing devices for a normal kexec. Without a
> shutdown callback, the FF-A driver leaves notifications, partition devices,
> and the RX/TX mapping active before the replacement kernel is booted.
> 
> Use ffa_remove() for shutdown so the existing cleanup runs before a normal
> kexec and other orderly system shutdowns.
> 
> [...]

Applied to sudeep.holla/linux (for-next/ffa/fixes), thanks!

[1/1] firmware: arm_ffa: Tear down driver during shutdown
      https://git.kernel.org/sudeep.holla/c/3bb3e80faf21
-- 
Regards,
Sudeep

