Received: from psionic.psi5.com (psionic.psi5.com [185.187.169.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65D5828FFF6
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 02:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.187.169.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792031397; cv=none; b=oyRxi0d47+PB+DxBKlhw81PBUUD7DJ64SnsTR8v4K3rmAQcTs3d3t8+s40uTk8zf9csKrXh/eivu4X3FYyu+bL5T7Lz0IOKZ9hfcVqD69n4YjlwyKVDqKuu/u8eczVgU7ENQFxZMhGGNS6qlzeOHjzuR/+pLv12p2HrDs99Rp4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792031397; c=relaxed/simple;
	bh=Ilv2Tt9xHa24xWUrxEOL+cOkzDbd5bIScNOreiU7HlA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DUu7HJ49XHRWO0JZEt1VPzT1tfpNAXPPP8apXOOJcJBjS99mDHAs0IDSu/4nJiWGU/EdTlBUSAHht4sI8UnbmXYA+fgxmxmuuFKHy6iRzAt2Y/0QOiLrasQJaEmfM/ItAEkcKIzCpdFGFJlxArMdkv1eiEChYry/XUC5svNQvbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hogyros.de; spf=pass smtp.mailfrom=hogyros.de; arc=none smtp.client-ip=185.187.169.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hogyros.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hogyros.de
Received: from [10.70.30.207] (222-230-65-153.east.xps.vectant.ne.jp [222.230.65.153])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by psionic.psi5.com (Postfix) with ESMTPSA id 9C4AB3F1DF;
	Thu, 15 Oct 2026 04:29:41 +0200 (CEST)
Message-ID: <55cba965-208a-44cd-a644-e664410af8a5@hogyros.de>
Date: Thu, 15 Oct 2026 11:29:37 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/hwmon: refresh Battlemage thermal telemetry under
 force-wake
To: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Constantinos Chalkias <cch@e-psn.eu>,
 =?UTF-8?Q?Bata_Roland_Kriszti=C3=A1n?= <batarolandkrisztian@gmail.com>
Cc: intel-xe@lists.freedesktop.org, matthew.brost@intel.com,
 thomas.hellstrom@linux.intel.com, airlied@gmail.com, simona@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20261012104245.2108030-1-cch@e-psn.eu>
 <as_iOd6A_Yncj8Gt@intel.com>
Content-Language: en-US
From: Simon Richter <Simon.Richter@hogyros.de>
In-Reply-To: <as_iOd6A_Yncj8Gt@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 10/15/26 5:12 AM, Rodrigo Vivi wrote:

> If the consensus is that we need this forcewake, let's do it.
It feels like we haven't really understood the problem yet, we just know 
something that appears to work.

If I run

     while true; do sleep 5 >forcewake_all; sleep 5; done & watch sensors

then the temperature sensors *do* update, but several of the VRAM 
channels take over a minute, so the long forcewake does not solve the 
problem. If shorter ones do, then I'd really like to understand why; my 
theory is that it's not the forcewake itself that does the job, but the 
fact that it's toggling, and possibly generating some events in some 
microcontroller. It may be sufficient to send some no-op commands 
instead of playing with the power rails.

Starting the loop above with pretty much everything at a nice toasty 
equilibrium temperature of 82 degrees (which is way too much IMO for a 
card that has no client connected and is just displaying a console 
login), the fans immediately come on, and apparently every ten seconds 
one of the VRAM channels updates to a lower temperature, so one 
forcewake event pretty much exactly corresponds to one sensor update.

That would explain why the patch works -- it generates the same number 
of forcewake events as sensor reads, and the delay makes sure they are 
registered as separate events. However, there is no correspondence 
between the event and the sensor, so if I do my normal telemetry 
recording (every sensor once every ten seconds) I can still get data 
that is ten seconds old, and I also wake up the GPU once every ten 
seconds even if there is nothing to do.

That is an improvement over the status quo, but my concern is that it 
will push us over into "good enough" territory where the actual problem 
is never addressed.

    Simon
