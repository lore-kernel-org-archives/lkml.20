Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ADBD3F7873
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 08:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791189407; cv=none; b=aANeI0JaBRmd5G45B1BmveX24TKkjloAp1o1wd6rGGV3Qn/Bb4hB/8ZBr/Q1aUXm5XE7o9xUQpSinGB/FrmsQtyAmMyOkhg6/W6yBB1hdDosHkQOv20IhvhVtHp62Hdrh7J4DHaiEUmWjhbQcB9xCcReFLEuNsYeMfMviMu9aHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791189407; c=relaxed/simple;
	bh=xVWhoI1lNUOU6HwKrdL16M8Wcy17FpNv6JjlWtBiFHw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d3eIeFnJd0B0L2h0olEbMxrXpCRFKTfUE8+RGlYb1H9gEpGXFNfPpkQTrb+kQTY7BVx042RuaiwyyEJ/HXPXTJR7qXdRJ2p72EnAYyNk/TykPsdz8kt3mHsyTorkHg4SS54ffvTEj7KSCd+r9UbWY3Q5IhEGDH7I6ZfKpGcVzng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W3Rn2Sw4; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W3Rn2Sw4"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-4a0977b9c20so20173755e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 01:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791189405; x=1791794205; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WdBlTkVU5Ix+L6SuwkpBVt4AjcxSBhXQvwOG+kfCA84=;
        b=W3Rn2Sw4fmV+JEy9l/LRs2sdd2M0OqA85K9pcdruSRtQPUX24/Ozxpm8GgMKHXs33a
         NrlEVeJs/iUdXLZJ83eYePucLoiUh0Xxb0x9JRDqw8ZVD901Ysgx2/vLRjIFdaJaaKEk
         4HIgirjGIjg6apKmmRYHHrq+eu6F+9B8AMBX0U3Mh57Sr3DtMdZ6Mqm87iLV29IhYkb7
         aCG1mF+3RR6UFyMbcglHEdXvw0AArduKougLV4enqRdQQFX6fTCHzyZtr4YKxzpPaNjr
         ta8EkiHk4Glpj2pccjkqrsS72Hn4mxanb30SZeBmYoSpweZf1cljOlMhxZE5RlAZvICk
         7Erw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791189405; x=1791794205;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WdBlTkVU5Ix+L6SuwkpBVt4AjcxSBhXQvwOG+kfCA84=;
        b=A3Y2m4Vcp/Ut60w8JAiUwh9RyIRjmQeWxUgHFPvjLE3xfkPH8qPjFvms0p2F6+pAvw
         xj4K6wi8jGm0jk/GZQd+4dQCAGiQN3JN8OHW8PvVHz3RrN0YS+Nk2Q1L72UT1t+A5A7s
         8AV+JaIvANNNxYnpG9yWCsYWRgjN/KgHMuPK2xPWaHfSeapxi5/3pZ8BCkR2p4ulpWav
         /44x+1fzMueV7bAiLaHxbKa8/+qEpsbqDLE1gEwJWr/WTtsR2iaNJuEit39fFu7qMEBI
         SZy/Un7LNmEFsYlRjJ4XIZKi6kl7EtYTw/pMr+dRsBklA2KNwJN/0JM0pvrOrcdARmRk
         N5qw==
X-Forwarded-Encrypted: i=1; AKwUvBw3vMy/LbOBl9jz9gWmJYtP0LxFf10rX/UTIuUukL9FpvFaxH63JHlfG1BHus7H9hpwoAOTroH7QRLf5Kc=@vger.kernel.org
X-Gm-Message-State: AFuF++lKAO4bFuT4uMxhEiU0pEjFoLh4lN7Y59y5vr0ucV68mB8uNKD5
	MBtBLzbt/MHYoCfaEptnVlCgmozDMxA6tUF6p/nizyBsco8JcYWzQfJt
X-Gm-Gg: AYBFou1PXDGWNwWwaOx18BE/jEJk9S1eBZgdcM3QAr72fS+u4Jh6STcdpj/7ayViDMm
	+2FaEDwGwKj3tinAMZnryq0rKDZaFDFeGBtuuEIoqosnWb0qO1jdNAyR+K38F3vZnr7S2zo7waP
	kCcrCdRGoBWzmHZiMHAtExRhlekAqvslbbY0vzRwmvcHC6ceLC1jvV/gsJ1avpTupb+/ygMBcDN
	8fuvAeDBE0rbNdrO1P6qq1aKAaIaNdcMRK6f3AkzrOBGzJ/pNI0KxedglHYSfnXwZnGEgyUv8FZ
	6nCxSxvGzHcRbWkQbyW7iRIl6NlbYsbK5szac4agdwm59jI0ow/Vms4//qI7+b5gouHaQ5neCho
	rEEVS+jXmxmp0MRiQOV8+frYDbamAj6ktGB/zp5JmAOSye/RXKiPcb0WZL199ULR+YWbSpoS/Jm
	2Wff4NLVz5eqbiVSBdjhBwqtgmgd2GZGxfUpKpyLIIHG0GY7JnC44YuSB63FylZvZHZ0vsEDqem
	5grnRJxuXJO9CDQFGwOY+Co8lwEm7l4sVVUUguqeL6gVGpUHJbu7bNSAkycFt6DZyxyldqrdgoH
	QuQAVkux6EL04Bgr3+6/uVjZag==
X-Received: by 2002:a05:600c:a010:b0:4a0:251f:a726 with SMTP id 5b1f17b1804b1-4a02759badbmr163677825e9.24.1791189404503;
        Mon, 05 Oct 2026 01:36:44 -0700 (PDT)
Received: from robert-83cx (static-dsl-191.87-197-115.telecom.sk. [87.197.115.191])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a16620dbdfsm219210615e9.0.2026.10.05.01.36.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 01:36:43 -0700 (PDT)
From: Robert Bozik <robertbozik@gmail.com>
To: sakari.ailus@linux.intel.com
Cc: linux-media@vger.kernel.org,
	mchehab@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	conor.dooley@microchip.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/3] dt-bindings: media: i2c: Add OmniVision OV32C4
Date: Mon,  5 Oct 2026 10:36:42 +0200
Message-ID: <20261005083642.11511-1-robertbozik@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <asNbwhGCuxF6e6Ba@kekkonen.localdomain>
References: <20261005071010.7191-1-robertbozik@gmail.com> <20261005071010.7191-2-robertbozik@gmail.com> <asNbwhGCuxF6e6Ba@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Sakari,

On Mon, Oct 05, 2026 at 11:11:46AM +0300, Sakari Ailus wrote:
> On Mon, Oct 05, 2026 at 09:10:08AM +0200, Robert Bozik wrote:
> > +  reg:
> > +    maxItems: 1
> 
> minItems should be 2 here, for the always-on client.

Yes - will do in v5: two entries, the sensor and the always-on block,
with the example as reg = <0x36>, <0x3e>. The driver will take the
second address from reg on DT and keep the _CRS lookup for ACPI, and
fail probe when there is none, now that the binding requires it. I'll
drop Conor's ack since the binding changes.

I can compile the DT path but have no DT platform to run it on; the
ACPI path is what I can test.

Thanks,
Robert
