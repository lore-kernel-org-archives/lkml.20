Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.216.248.207
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793719525;
	b=uzZVA/nR2/dmbTJtBREaR94xF1whkMtpPxVFcv0pfLB66m8aebQtTVb0gLQS4z1AnBmx
	 KEfgariW62+FG/pR0PiyzGhYAQ1WQ8hKA2XIVbdR1nsLBRGBfw7+lZGMNVdYEVRsySejs
	 Gpi+1Gboz9qEiR2dLI1MHTlIuG8u7myKib5GzsCXeoyINOvc1TksMdrwEI2JLfellQ+sx
	 8cl868Hnh4hrrQ+ufBq31HeGMW6FdphFOUirAcd4Ve2djSR1dNvc1SVbGzOzUksnRVTo8
	 WGtpY51gWq23PODw7JA7K5WUECf3LZAl8G8Z5lntnAPnJ67PMHzFuMNM7+vLtrGlJRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793719525;
	h=DMARC-Filter:Date:X-Lima-ML-UUID:DKIM-Signature:From:To:Cc:Subject:
	 Message-ID:In-Reply-To:References:Organization:X-Mailer:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=cnJ9B7JkswprQPLXGI0ImQv2Tj7y+YQDejoqKbdD7DY=;
	b=TvgvBiRjgZKnVPssB7rA34cvi3ROOsQp37AouwHsVEqO8XwkizGTheneGuQiqToaLyEW
	 lmM1O/xy+o+YlCU0eZqdn+c2CJt6ryAW75zO5GUc88fBFnJpi+sCeP3f6o3uQWgCm39+W
	 7H4uscPin/QUl4QMPLLaN2C5zqZLmmRy6kxM8cdMajt7vbejf6RhZG6G3hGR/IsmiD3uJ
	 W/AvqtUQW7WHxSzfIRcxCibOm5/TjzYhJLP4y5eGdRwuNH5+ejJMXfr1S1RA24Zqm7rog
	 hrLrtjsOCKoPkV8VZFMaNRaNsh/q2jgnXCtlgPrr87x/Zfs3g73QPQtVJ5sxO+6VGGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=deq.rocks;
	spf=none smtp.mailfrom=deq.rocks;
	dkim=pass header.d=deq.rocks header.i=@deq.rocks header.a=rsa-sha256 header.s=securedbylima-20251205 header.b=vrCVlLh9;
	arc=none smtp.remote-ip=91.216.248.207
Received: from mx5.mail-out.lima-city.de (mx5.mail-out.lima-city.de [91.216.248.207])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA44C606A329
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 15:25:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA44C606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=deq.rocks
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=deq.rocks
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=deq.rocks header.i=@deq.rocks header.a=rsa-sha256 header.s=securedbylima-20251205 header.b=vrCVlLh9
Date: Tue, 3 Nov 2026 16:25:12 +0100
X-Lima-ML-UUID: e4870b7e-9828-46f9-914d-9fb9ffacc200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=deq.rocks;
	s=securedbylima-20251205; t=1793719516;
	bh=njPnq2aWT4E//QJrFHKeY7X8sbaPLa6DqsdOZFRP2uI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=vrCVlLh9oESE2yAVr+1ERF32JCpba+KbVd8efy0/Cg30jL8cMIUpayucO9eKKh+M9
	 nYFdn4aiuGgB+URDxB5ariF5wBYgBuoddSOX3T75yEvF6yKdf7leH+9w8fF2jNNN9p
	 lQ2//60uxIrjWL84hPU+HxhtOTey8D5y+HQtQjtRSS0bOLKVxa4K+mwzpOY27Y6NYu
	 XsdZYa7Ha2zpOpiiAy6EajgIi1HK3d/xIs5nAns5XrdUfzAlkKmtvZu3wHLIMcv/mr
	 Bxt613+RPQUB+E3uYhU7Pl2JkaqA2sU3Mc3NPLyKxUn/yVz1OL2Eko9yZk5xQttnj8
	 N9vwmZRAfoYDw==
From: =?UTF-8?B?QW5kcsOp?= Eikmeyer <dev@deq.rocks>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Ed Schofield <ed@aicharmers.com>, amd-gfx@lists.freedesktop.org, Kenneth
 Feng <kenneth.feng@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>, Christian
 =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] drm/amd/pm: defer UCLK DPM on selected Apple Navi
 GPUs
Message-ID: <20261103162512.2ec834ac@kait2en-mbp15-1>
In-Reply-To: <CADnq5_NCB6ur05ZvP0fe9hsgLHM0=y_Wx31G4vkpKH+F7yZ74g@mail.gmail.com>
References: <20260916144014.879355-1-ed@aicharmers.com>
	<CADnq5_MsaUDm8rcxr3_0wuEAXywxziAofOO9w-dUxYS9PUoasw@mail.gmail.com>
	<20261030123000.5573e70f@kait2en-mbp15-1>
	<CADnq5_NCB6ur05ZvP0fe9hsgLHM0=y_Wx31G4vkpKH+F7yZ74g@mail.gmail.com>
Organization: KaiT2en
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 3 Nov 2026 09:30:34 -0500
Alex Deucher <alexdeucher@gmail.com> wrote:

> It is the same issue.  I don't want two fixes for the same issue.

Understandable, but it is not. Two devs told you the same
independently. 
On another note I reviewed your patch. It only rejects empty or zero
levels. On the 16,1 the pptable levels (736/750 MHz) are non-zero.
Besides other issues in the code, the commit message says the exact
patch wasn't tested, yet v5 extends it to every Apple Navi 1x.
I am sorry but your patch is implausible to me.

Andre 
