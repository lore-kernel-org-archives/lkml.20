Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0DE03112AB
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 20:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788640994; cv=none; b=gpZxc6d8D2rvu92wemY70vPmdVD+s1VmE5efegHz6TRXUFHEXg3ze0t8q/9ikQR8vy98hMAOcy2d7Iv16DNZlC1TwfV1IzOyCxk1Iq9llRLKpjt/RnE96uHRE3rL5iZSdozW3KPoS8UC1jYcXwJxBRqjaBNFRTkk4cVkLlvZpn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788640994; c=relaxed/simple;
	bh=dnYKMk6YjEmdL8gg9bm3PtY0jaS65mXugokEpHlbZDE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=BKe8SNp4KO1elu7zGnLiF8YOYkZx5P1D20lTJitXYwCW0PttWb0kwzj+Mt/W9JU0Ly5xXBoG0fbWG/nA2CG0sd4UXnW22iFIXPtisRwM/jRC5imOaT1RGRFQYgZAX3yPAlz3S0H3na0aiWLqCPeJ+N1R4t+bMqRgxLwoS3WfOUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KSSLA6ca; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KSSLA6ca"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FDF91F00A3A;
	Sat,  5 Sep 2026 20:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788640992;
	bh=7raetGH3N/3LsAeqrleG0G72XbGZlhlKaXeKl002SMM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=KSSLA6cagBWsNFHqKbSxI3XKMJ7naUKHWSHgO5B/q5UblKVlJgWv4Q58/SKSUGGgS
	 WL9GBgMEi0VNMZylYGRzg7IIJal/8tMgPG34iFUP8jtPWLDpmxqXYwVXZzenQbj9DP
	 3XnHhywSud/wJ71iHofz2Wdj4X2HTz42YXpgdKIannNHo3AfMOS7wgRmcvyW1mGhPL
	 hkF4zfcxJjn7BMhN9OofGk818logehL96IFivYCKUKyxVeZghIeCF0TGb4PQkIvjFz
	 yNd48O6LMBym7SC3t6k16ON1uWyt8RlDyu4WFlSeV+c+LZf/AtualGqXXwSbFfgRfw
	 sqfakdZMGXCvw==
From: Thomas Gleixner <tglx@kernel.org>
To: Zhan Xusheng <zhanxusheng1024@gmail.com>, thomas.weissschuh@linutronix.de
Cc: luto@kernel.org, vincenzo.frascino@arm.com,
 david.laight.linux@gmail.com, zhanxusheng@xiaomi.com,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/4] vdso/math64: Use OPTIMIZER_HIDE_VAR() in
 __iter_div_u64_rem()
In-Reply-To: <20260902033801.2912699-2-zhanxusheng@xiaomi.com>
References: <20260902033801.2912699-1-zhanxusheng@xiaomi.com>
 <20260902033801.2912699-2-zhanxusheng@xiaomi.com>
Date: Sat, 05 Sep 2026 22:43:09 +0200
Message-ID: <87zexv4eg2.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, Sep 02 2026 at 11:37, Zhan Xusheng wrote:
> The loop subtracts because the quotient is tiny at every caller, and the

Which loop?

Care to read and follow:

  https://docs.kernel.org/process/maintainer-tip.html#patch-submission-notes

That's not optional.

