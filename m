Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E694F3EFFD4
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 08:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789373252; cv=none; b=c/ZY1gdlm46xLMK00nHp+pznuwK15SacqO7lJ4n2xbti28TpycZQNzAb4kYKYYXg08zfz9q9amWFyb3ZEyw0kDVwpe1JY/KqeUuoQjmQcLs8otXrdMqx6PLsjXvKDRnH18+MUHM/IZBM7LR7gDToZBv/VLADDvs4px+9/RSngOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789373252; c=relaxed/simple;
	bh=2AfN/zuzcXz2rERtX+l5Z4PCLd8URiu4rtP3kdK3Dq4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sv4hXzU4umrytqi2VAzf5RPm7czEGacSC7sqMflRs3UCXYIY1J9YZu0zTs9WjkETm9kp+z6N9XLQt6g7DAZExC7nyJ9qDyjT9WsgEeErTEpqOgOfCBwQjs4b4/iYfts5PgAoEMowRtslOgnW6shnmCqI0YZKlIxVJxfRShVqkkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=aslbRqxm; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="aslbRqxm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789373248;
	bh=2AfN/zuzcXz2rERtX+l5Z4PCLd8URiu4rtP3kdK3Dq4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=aslbRqxm/Te+ffUi3iG85l42oEtBYSXQpUzr46vCz8jPU4oK4qbQWv+a59K9KaeZQ
	 Jlvap2UO+3D1AJrCfA+C/Z0wXHV/+6lAvHJLif0GDLdCL1NHe1wVj8NYiYeVzIABel
	 7s9qWae9DuG8ZcQgrAYce7Ucx82Yo5rqfE67C1Ln9T6rsHXsscSlEbk9jpN5Msa7ts
	 KVusV93w/6W+GpsCgBTjlpjA7VdeK39MWn7NHw6xdhtAjK+GiCC0J611We5HaIfMon
	 Rqnic60btLZglX4nbw9cUo8nW1g2Zw7oXCrKgbotASkpgX/rL5dfiV1kTVdOKkfqMH
	 DgRpQ3dr+ZemA==
Received: from fedora-21.home (unknown [100.64.0.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4F7BD17E005A;
	Mon, 14 Sep 2026 10:07:28 +0200 (CEST)
Date: Mon, 14 Sep 2026 10:07:22 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Adrian Larumbe <adrian.larumbe@collabora.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Chris Diamand <chris.diamand@arm.com>, Akash Goel <akash.goel@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 18/18] drm/panthor: Add debugfs knobs to simulate
 reset failures
Message-ID: <20260914100722.279b6532@fedora-21.home>
In-Reply-To: <aqWmIbT_46Enz8VH@sobremesa>
References: <20260826-panthor-unplug-fixes-v4-0-982cc8f4234b@collabora.com>
	<20260826-panthor-unplug-fixes-v4-18-982cc8f4234b@collabora.com>
	<aqWmIbT_46Enz8VH@sobremesa>
Organization: Collabora
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 12 Sep 2026 20:27:28 +0100
Adrian Larumbe <adrian.larumbe@collabora.com> wrote:

> I've tried poking the knob that fakes an error in the reset path and got two different kinds of oputput:
> 
> Either
> ```
> [ 1950.080236] panthor fb000000.gpu: [drm] *ERROR* Failed to boot MCU after reset, making device unusable.
> [ 1951.167384] panthor fb000000.gpu: [drm] Timed out waiting for MCU to halt
> [ 1951.167543] panthor fb000000.gpu: [drm] Failed to cleanly suspend MCU

Hm, I guess that happens when the unplug work has been queued but not
executed yet, and something tries to interact with the FW after that. I
suspect it's some autosuspend request kicking in after that, and asking
the FW to suspend, which it can't do because it's not even booted.
What's weird is the 1sec between those two events (I don't expect
unplug to take that long to execute).

As for the race, I'd say that's not a big deal if the final outcome
still is that the device is unplug. This being said, the more I look at
this, the more I think triggering an unplug on a FW boot failure is not
the right thing to do, but that's another can of worms I don't want to
open now.
