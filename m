Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792486337;
	b=tKyLQWRfu99m4KpG9bJbQrZfP0ejXNafUZzj1q+gos2pyuBrYuUR/rJyn64IkejIAMIW
	 lZtm+tWUGm5FzrkZxgWOFXStcPucXjpsSD+3WZtSIQkhXDPExY47ox7Fl039qQ1NPaMCo
	 7TvIiq2V+YGV+l8/e86XtarfyLnHEysOfquBJ2bY3RTXOghHulvsAAkJykJm4ZonKgy6s
	 3lSmRmPluUstXdyJNxJVExSFvs85gNWjjNusF9BFeTKgcjOO0wKE2oCDb6UohDtiF/7NP
	 NhOUWGdWawDCmy5vQDT+XqTnSjq27frsXkTVDCLczOWcJo5ojt9z89aeXoR9kAzZ3Jw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792486337;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=tkqdn+h+quvZr9vw0T8bcJsxvQ/mJoyu/YMkcY/G2Jo=;
	b=wyf47Wca/Y8xDHJ93TBAmUWcvPvZLhkOnlddlMh+kULNTabpi3kZsovW2LSMK7pzLq8v
	 3FCEGkzh7UjUCMb3D2E+do0KtfVITmnf3cLDHkCUzqwC2QV+YhJKJknzsOwZlrTIYKVi+
	 s5kCUTw7gBH2Z406LqJz+Fe7Cf/GaiDQlcXU39BfmzDp1Fc+RhBLqXFRynB8ucUtmX/eQ
	 rM2wHSvkAF5EZLLVFb3hTr2kEFK6oqjblV+KHrtPW6ez2hFcZ6gFsd+/O2BddV3oy6U13
	 cTgkAvWN/8GjVG7XAc+4MxNRUbbTXBA8KxuNE0CSF/tLJu4kzJN9w1cZd6QlZfbGwVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	dkim=pass header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=VifFGusi;
	arc=none smtp.remote-ip=185.70.43.16
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EF74606A319;
	Tue, 20 Oct 2026 08:52:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3EF74606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=VifFGusi
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1792486333; x=1792745533;
	bh=tkqdn+h+quvZr9vw0T8bcJsxvQ/mJoyu/YMkcY/G2Jo=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=VifFGusifNCRwNZ9086C0OV5AWmprlXlgTGT0U8b5CYguiRNKj6NA1yYc1sB3tdiY
	 ahV/sbOkFqqNEQEa4sglx893CE8+7jqKlIJCc/krXJlMmIE0AT8lprEyu6VOjLpjyf
	 KdVMsk0QtMRUr8K3OnuAKO9KDN7u1e4zVoeFR7JxX+LvnG57XpikPAsGa9hmh4nsZZ
	 zqQfgbYuw4G9iZ8UDd42fAOKETSl08ME/6N+ANLhRTeSNEB6tRYm93xbFrSEt7A1QK
	 d+55BdSMWPD+wbx+pzHkJATQp/Jr9eX/cmU6F6qWMtdY0Rtd8eyKwZ5knltbpXMjHL
	 iH1/Ejhrpa/QQ==
Date: Tue, 20 Oct 2026 08:52:08 +0000
To: George Neacsu <geocausa@gmail.com>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Sylvain Petinot <sylvain.petinot@foss.st.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Dan Scally <dan.scally@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Peter Marshall <pm@petermarshall.ca>, Hao Yao <hao.yao@intel.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] media: i2c: Add ST VD55G0 global shutter sensor driver
Message-ID: <20261020085200.60619-1-lsa.uz@pm.me>
In-Reply-To: <179247822513.25202.7960395606350309657@gmail.com>
References: <20261019162722.25587-1-lsa.uz@pm.me> <20261019162722.25587-3-lsa.uz@pm.me> <179243379000.31842.4735750009847702427@gmail.com> <20261019193402.52923-1-lsa.uz@pm.me> <179247822513.25202.7960395606350309657@gmail.com>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: d8595080311558c5b70a0b31ff8f4968d8b5aff6
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi George,

On 20/10/2026 07:44, George Neacsu wrote:
> Would you be comfortable dropping that write in the next revision? I can
> retest the revision on the Snapdragon model and add a Tested-by once it
> is clean.

Yes, I will drop that write in v2 and leave 0x0329 at its default, and
Cc you on it. Thank you for narrowing it down to one line.

On the Intel model it makes no difference. In one boot, with the sensor
held powered and 0x0329 set to 1, then 0, then 1 again, each state
streamed 150 of 150 frames at 59.14 fps and restarted 10 of 10 times.
The test-pattern frames showed no shift or extra lines in any state, so
IPU7 does not put the status lines into the buffer, and its error
count did not change. The full test run without the write
matches the run with it, v4l2-compliance 46 of 46 included.

One thing I cannot explain: on 16/10 your vd55g1 build streamed 2/2
with 0x0329 =3D 0 written once per power-on, as v1 does it. So the write
alone may not be what stops CAMSS; something else in v1 may take part.
Leaving the register alone is simpler either way.

Sergey

