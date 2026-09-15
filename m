Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3498C4A1E0D
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 17:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789492956; cv=none; b=ozoDs+SIQfdk7lfq8ifCwzAy+6UY2xkQ8bqcTy+XNz8LiUSiofpRaIYLWbmKALR40XQbUW5HnlbSDKKDJVvu5sU6aPPzgmjQfcB7SvX23tPnkJUsb/NQr2VxWO89I1uDJ+vNMpzQf0Xu8U4uu74ROGXw20gLoC5/bdcXSgxuf+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789492956; c=relaxed/simple;
	bh=aIk5tuv0OyDO91T5nAS55l5Pjo+hf8lT4w6M2sIEA2g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l5BGtpnn2H5IDVuPYHUdggIA7PSRX8NBLUc1QvUg4XV6q8SYbp8qDH6yHgVqjs572qYx17GSDpqhViyOGAQ18TDIgb2CxOHiBsPpAaCrsc/E2LlbHWoAH4Pv5S2Qwd2HAAUx50SW8X6XEm4JuWU3G/gEpCC2iW+jIL7zlBdXYEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=S5luGcz9; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="S5luGcz9"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d822dso423675e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 10:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789492952; x=1790097752; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=G28nwEQy8Sp05wPk0bMhJn0NeDxuDseB8y9BCIbhsB4=;
        b=S5luGcz9c4+sOUR/fOs2bRvgclNCsiWGtkAEGqrwB0/7xWs/WQE+zS2Gwi8SSJrbyL
         5ct+j8z84dQidnja5SyAgo5/zQMbOApIFrX2Q51cQVfu2Ir0QfkKYqNFUE4k5Uykl3tx
         K+xCRDPfcn/IfZyQKBX2tVvjemtGYMZKXDzuYgiOP6mLxFEbGf7EuGq8mzh/r5nG7eD0
         GXzooLHFR9wo9y/1aesLxJPoY/bbuGwGLRwVPj5q3WDPNSmrWERZz/JD5llJNukKSDNJ
         WXriy+AyJMjc4XD9fzzl7yHHMS2jusv4p51fVc1my6U0vHHbvAAkgWvIva6rzyPF4kt5
         Lwpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789492952; x=1790097752;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G28nwEQy8Sp05wPk0bMhJn0NeDxuDseB8y9BCIbhsB4=;
        b=G1K3udnMEGBhA1O1vEr3UtXHr9b7js12+DUeUBuaJ+M+zei0rKh1NTbqCNKY29pO0O
         WSxQjNcF71lkiWyPyqqEd8Ab6HRr06TklO82xLSnBtOyOG1z+Hzh3UplJvhfzACwssAs
         4Wki7sZD+ygeXCx97GqmWCQJFkrytdEtrV6PKTwChyz7xQo+pZIIpvQ5aosukMc9HW35
         scUDq+BfHf8Asa41elktkluHQDSUPBBqDCMCWUGlWu05rapWewSwV1TrRrjvzxEEIB0s
         ibvVxSn8OyI4j1aByEDGPw3N72fYcTLRygnwD1kSBpGefkMeYInGZpp1vGv+4aUOLBS5
         2jpg==
X-Forwarded-Encrypted: i=1; AKwUvBwtTUVLgzyb6/6NFIw1+YvsJNaZcxLLvk9TALwPUSlqot455qgm6Urdjxo5UhdEdCC6Yi3XESgD0Rl+/Ok=@vger.kernel.org
X-Gm-Message-State: AFuF++m7nAxcfrqBorGC+rt4SK548W4GJtcFtg6kQkkNDGX/QlLb70Fa
	slnK54Qeuwj5mUCrRD7JER1zXsjMe0ksp+BtJPrkHqeQi3mzK2IwWxy4r5Q12xbYDnY=
X-Gm-Gg: AYBFou2Tv7MIHmeVLk2eLAlL7tKx0lropVMJ+Fn82/aWSYOU5HJPzeDNPY83a9PmksQ
	jUmiedA2K09pKn+lNmKs1XqF+rIzenh241WzEafkbZ57lhr+GsrxSkg5MSgt7TEsRoZtzwyjOc9
	qgBHmhSA8zo6uzXoene4ryPqdK4veFI/njO6WAa7Ksm5/hPC86t6afywEBp2Wo/fvdgAaeLxkL6
	xr8qEf8UovUM9QfDEDSrWz1QbR98MFtfeOHhRkHKYZcPAZ1wX6Hi/V0F3dkTQ5Zxy9VA6mOD+IQ
	nb0ogYApVbT2zGUgpYJoRMsPMq8RYzCbsYZ5xPB3RcZ5WFK/5bY/WPD6VNniaiY0kWGRtuCQ9ib
	BW4Csp6He51u1xe4/PrazSnZRzHQWgK3cf0O6JNTE/tdX30Dt1JXWjJmuvQtPd59S1QKMceb5BL
	TI8hJBRUDqR/MpNhagxKNaCJ+dvS1eSRgOMH2Y8ZEhSF7bQoVVHjkdZ8nl5mp61+9cxnWisqGEr
	8tuPAyR6hVIwprHKe2Ka5P3z7i8/+7WiKMIuCh3ceuyYVYxSJZfYIX9QpylDQ==
X-Received: by 2002:a05:600c:4e11:b0:49c:fa21:1c7d with SMTP id 5b1f17b1804b1-49e7a68c90fmr97907765e9.18.1789492952190;
        Tue, 15 Sep 2026 10:22:32 -0700 (PDT)
Received: from localhost (p200300f65f19a904c2a77868dcbef2f0.dip0.t-ipconnect.de. [2003:f6:5f19:a904:c2a7:7868:dcbe:f2f0])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-49e83a28ba2sm11860245e9.0.2026.09.15.10.22.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 10:22:30 -0700 (PDT)
Date: Tue, 15 Sep 2026 19:22:29 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Maciej Strozek <mstrozek@opensource.cirrus.com>, Bard Liao <yung-chuan.liao@linux.intel.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, patches@opensource.cirrus.com, linux-sound@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 8/8] ASoC: codecs: add Qualcomm Tambora (WCD9378) SDCA
 codec
Message-ID: <aql-HLWq4NOh3cgk@monoceros>
References: <20260915165652.914893-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260915165652.914893-9-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ypyxgupiikim6cae"
Content-Disposition: inline
In-Reply-To: <20260915165652.914893-9-srinivas.kandagatla@oss.qualcomm.com>


--ypyxgupiikim6cae
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v3 8/8] ASoC: codecs: add Qualcomm Tambora (WCD9378) SDCA
 codec
MIME-Version: 1.0

Hello,

On Tue, Sep 15, 2026 at 05:56:50PM +0100, Srinivas Kandagatla wrote:
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/pm.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/soundwire/sdw.h>
> +#include <linux/soundwire/sdw_type.h>

You can and should rely on sdw_device_id being provided by
<linux/soundwire/sdw.h>. So please drop <linux/mod_devicetable.h> which
makes a bunch of useless build dependencies go away with it.

> +#include "wcd9378-sdca.h"
> +
> +static const struct dev_pm_ops wcd9378_sdw_pm_ops = {
> +	SYSTEM_SLEEP_PM_OPS(wcd9378_sdca_system_suspend,
> +			    wcd9378_sdca_system_resume)
> +	RUNTIME_PM_OPS(wcd9378_sdca_runtime_suspend,
> +		       wcd9378_sdca_runtime_resume, NULL)
> +};
> +
> +static const struct sdw_slave_ops wcd9378_sdw_ops = {
> +	.read_prop = wcd9378_sdca_read_prop,
> +};
> +
> +static const struct sdw_device_id wcd9378_sdw_id[] = {
> +	SDW_SLAVE_ENTRY(0x0217, 0x0110, 0),
> +	{}
> +};

s/{}/{ }/ please

Best regards
Uwe

--ypyxgupiikim6cae
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmqpftIACgkQj4D7WH0S
/k4yygf/UaD7rkxXnm3iEVPEzERCZJqGwT1AwxKRyS9AQz1WUXpGRA56Cg58VYSs
UWvJAh2sMqRQuXa1Y5VeOyxK4ymx3xX51SZlzz4Lkxu3xfcTE1COPtYjqGmkoi5A
SrwZokAXjzWLPjTymuPdCT0T0W6Plztr80Pcn+L96MtyKRCXFycHPu4h99+rHtj2
1OV9avYijYoueAQIabehfPLSdGH1r+EPpJEZ7kmwPnQsmWxSdCNSAoclOzkPKxqI
A8Inv54qAXVFwHbyCJPm3mLNQ0R8NHV16y/Bp4ok7fYyvHnT6c+OOJPle5fMMQui
nPC2peWriV9TBCouHEJLd5cDu9YlqQ==
=mm2e
-----END PGP SIGNATURE-----

--ypyxgupiikim6cae--
