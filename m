Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48FD05A984B
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 19:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788895250; cv=none; b=X9GLAQQQE+eRW+GObwKZsBvTYdLH9A7SI+t3Y+49TqlL4hPnoZxekvEGOqsHSulp00n+fvbLwYU28x9S73CdvN/lzD69GRot8KDX8K5v+uPyEyw7gD5mXUr9hUr8k80VTEPI9EfLAK05kx4NxN5R9xsWxWuBu1398KiTTUokQGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788895250; c=relaxed/simple;
	bh=jW/PXYbGXcOsgm/sewCquwvI8ml6GC9OlFuq8dt7Hy4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jASms1/MsQqlENg5O+dQ8geha/VreO6J5UcEIVhrj4sGxiMNS3QOy91SYKl96QSoZfZe/avR617vlb/+9bSpBI11dE4IOtQnFVQ1hlUA31mJxjkvrAWb3j+9RmqRWNn73wL8EbIadEmlOnhujmXbQKWwjGJzH1fohOCVXpzHAs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dYQXQZJa; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dYQXQZJa"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4998b5a63e2so59505775e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 12:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788895246; x=1789500046; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jIYimkqxAApyl39451hRh+TFNEFHTBrpXx7umykIy6w=;
        b=dYQXQZJaFQC3VnABma6pOYmn4hGiB4oZkO/2UnaOhAALvHg+aICLcfJXZzc5QKvPsE
         N7x6DrzMZ44/XexUzEWD3Fz1nLU/Ksa6bHo+osXteHCpnn70mw7JcSIJhbZcWTdIc2M3
         7g3rrKw4KSJ/XYu36hww0jVHt0oi0RAGXnqAwZxhDWrzZYRcy26Bdzxtk7DKMudJGO5y
         5m+uGOLBFsLnI9GYFIsnlXoB6m22KvCx1i9+X68HtZH7uRElbYuNTiBvUJCv8GPNM6kI
         6t6E7gdid8bJ6//HXLEG7tX46iKW6DVFFntvisvLmxpFsRos1vIqWi2XiuTXeWlFUjvV
         uakg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788895246; x=1789500046;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jIYimkqxAApyl39451hRh+TFNEFHTBrpXx7umykIy6w=;
        b=kIPZs9624bNj+vpSaMgHrmZhdvPMn+QkLKUtr12jBjBPF106wxpnH/Cqne15YzX1c8
         v9dw9poyn6A1mJ69zFH1Y8XYQ4I1stutWMrchyJP4CH/x/dbMSf46pF1uZBJ3FIdkjfd
         pzQcmdNQ/oiY9bHQf6KAxCs6/ti/WEbY/UXlKP5b2i0mCRB9kyAqbJv2QvoJyBGPI7CG
         acf37cFlCWDKESiaP4/gxMF+yqhBV4VkBKlbn37ksHE1nfjtyCEKJ4sVVki5yqQ1JEhI
         PiEnj19ttcOjUJFqsryX8yFGR5YhxshjTC7u7UtO8MPQCwuB0yteWI0PAKW4ArouOQEX
         zlHA==
X-Forwarded-Encrypted: i=1; AKwUvBydDL6oU2MND6gbvW/IiNZRV5VVrh0+zA157X6e1sok/lterWithXBvlAl2Yj3+xjJ8lj0+cGFHzO3YOiM=@vger.kernel.org
X-Gm-Message-State: AFuF++ncGe0z3dKQcrrFdgB8KUyk8SK6cxgtpCfXbfG/u5BCYR6zknuO
	SWi1q28MHHxL4eXRvnY54akmbKPYoajtGZCYCoBkeP44NYrOdmFwkRFb
X-Gm-Gg: AYBFou0YuYv8ZW2eSvM1fr6x49+4lS4rPxAVIyaSSxVfPj2ASXubJJIs3eVqQKJu/Lk
	vr94BTf1KfdIWLNTLoBJPWqxA7pZPZEsEK+lQ8uguKPHHsoLSZh/DU8ygYj3okxtNI5a2hG8a8v
	jAJH3pnKnbvMsPGj9b2+IE5FuY0WnM0BwfFD7IwPTTV64YNrjA19CV+7SKVLyMqtZ0q8Ibxc5wn
	rnGstnvuDWZD6XhNde0nUfWoEwJ8IC303AB1pR85t/r+UvbthI37F4J9lHHx4d34NI6PQ4qF97y
	0AoIM16/bc2DuMt+f2/qBJ1bIp1pGyQd7QY9GsTNBMXPEGbAD7o6+dfvKnNRV74MrjXv5sPBRyA
	djlru4E+r37OhatZSS1O3jiB180y/mm3YFOZOVCRXZMOS1YkMkNtQqmJN4gK0COFePfjv/WW54l
	KKP2SOtmDO773cm7YyxBS/K/d8prnuRTHxtv/ETrh3Rftz7MOuei7NQyIzzWZaT03HxkPD1IYyk
	G5JtOkWrc7YYO6sxegjoNq/UwVoo1kvGtrcIuS9yc95V99o75mC
X-Received: by 2002:a05:600c:548c:b0:49c:c96a:d36b with SMTP id 5b1f17b1804b1-49cf8267dd3mr325897705e9.12.1788895246167;
        Tue, 08 Sep 2026 12:20:46 -0700 (PDT)
Received: from flaviu-Aspire-E5-572G.. ([93.122.248.115])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf770fcf5sm407885845e9.6.2026.09.08.12.20.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 12:20:45 -0700 (PDT)
From: Flaviu Nistor <flaviu.nistor@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno Sa <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Antoniu Miclaus <antoniu.miclaus@analog.com>
Cc: Flaviu Nistor <flaviu.nistor@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org
Subject: [PATCH v4 0/2] iio: adc: ti-ads1015: Add support for label
Date: Tue,  8 Sep 2026 22:20:34 +0300
Message-ID: <20260908192036.8503-1-flaviu.nistor@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

This patch series intention is to add support for label sysfs attribute=0D
similar to other ADC devices for ti-ads1015. The patch series adds label=0D
property in the dt-binding and the needed functionality in the driver.=0D
=0D
Changes in v4:=0D
- Added this cover letter=0D
- Use Uper Case letters for "ADC" instead of "adc" in both commit messages=
=0D
and move static label assignment to probe as suggested by Andy Shevchenko.=
=0D
- Link to v3: https://lore.kernel.org/all/20260907152304.4992-1-flaviu.nist=
or@gmail.com/=0D
Changes in v3:=0D
- Return datasheet_name of the channel in user space if label is not presen=
t in dts. =0D
- Link to v2: https://lore.kernel.org/all/20260902172230.5234-2-flaviu.nist=
or@gmail.com/=0D
Changes in v2:=0D
- Implement changes suggested by Andy Shevchenko. =0D
- Link to v1: https://lore.kernel.org/all/20260901184302.8127-2-flaviu.nist=
or@gmail.com/=0D
=0D
=0D
Flaviu Nistor (2):=0D
  iio: adc: ti-ads1015: Add support for label=0D
  dt-bindings: iio: adc: ti,ads1015: Add label property=0D
=0D
 .../bindings/iio/adc/ti,ads1015.yaml          |  6 ++++=0D
 drivers/iio/adc/ti-ads1015.c                  | 30 +++++++++++++++++++=0D
 2 files changed, 36 insertions(+)=0D
=0D
-- =0D
2.34.1=0D
=0D
