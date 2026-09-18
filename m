Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EACD489FC9
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 06:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789712725; cv=none; b=iNEKxmH2aVG+A3ALec5ubft5mXSQkWdXOErCmvQ2IfKGKWg7vnRd83kEZaEmoAmpQopM56mZdSsirW0eHtKqUqmevAQ5dvatl/u+C9yBuqc5+6fF3zKKk51BHOJUs8z5BuFtngR8ZrLKW2VcrS6IWAfny/uioxVFebyWmHoplxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789712725; c=relaxed/simple;
	bh=oc9sxhWUrwi9Su/8MAtYMSo6TS04FaaDxZwHE3X+zKs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=F3BDaQQkQAz5ilkctPqAPvg3eVjbXANw3SgD08J4fTtecNeIa7wqqhnTd3RIJrZ8llJAg+RO7Cylr5Ixm3vL1eUzj1jm/A005Bia0VcjteXEb20yHUHSb6/jdOLkd8VExftw6FXRVD1IFQlzjO8vt5egJEDMbZKblAkrep0ZdCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FJPBN8a7; arc=none smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FJPBN8a7"
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-85469e211a3so371367b3a.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 23:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789712724; x=1790317524; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jt5hpx2+UWES+z68ivJ7kyasbH+hZp5tfP7Ph5RVZI8=;
        b=FJPBN8a7IaXsRtt3254MJHEMNZkTnWRlz3Wif+gA+MT2FnFyPmYTO/6GepU6K1nDq5
         Vk3Tl6tnXAV5csfX7yzul93DEBllBTerV3GpMxAnHBzBwgZpe+Zpq16mleGt1CI4vqzB
         Fi9x1WwMLL5l922KMQoXCatWxHD4WRG48PEtNsZKZ8g7guLwB1DY68+OhAw6ZODR0W8h
         MBLTWZ0bfwfwNi0ViYza1TzOvabruhTvuj3iMVIzEV5kfY7NYOVB+Tj9dtkvnreVLbOd
         oH0b5KInDBrSYAaXCuB1zZqMh6m++MalqFiPI4RKNMYo4wPD7Vod8rNq+rs6znrZrryD
         veWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789712724; x=1790317524;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jt5hpx2+UWES+z68ivJ7kyasbH+hZp5tfP7Ph5RVZI8=;
        b=GJV3s6pnRqYVKFH7igN8hCUNa5fV1itRgDUvYlyj436DFZvVmH3sw+4PdsLNLJ08T6
         xiRgkrb+cSwbo0paeARxmtOTalUZA90P6PXMzfPkhnKZHdYeQeJmVv6j3ocil4RLPj96
         NvjlFE4vW+KJuCqk2id47xA7MejgsaZypHYmNfwZbVO6X5dfWlpw/g9REm8OseJXE2Y/
         k+oiSQYEQyQ9qZnL3dYUJ0uTxTYCvl5skGYpS9Krsz91kuGlk5AT4wjHT7NJsOd2ifgB
         Gx01FJx3K1n4+sFOixprORZB0lrJii5dCaHYMEuFpBPwYv4xlB8cuvg6B3CUzF/E5ACG
         /z7A==
X-Forwarded-Encrypted: i=1; AKwUvBwNNOqlL3V7HU/ke5FA32R7JEyfc3/rCqw7iiZEJXjXlL7ev4zedvmUnhqo8USqFuGT8cSwdV6Tl3BCqsU=@vger.kernel.org
X-Gm-Message-State: AFuF++kyGNI5cQLyXIosvX7PR6201Tr3Cur8Vp4GjZonZKbZ+Xd+MI0b
	6nzWPzdUVf4Wi7LG7izCyhgKR93EGWC8XrWRJFiWsxIcSBFHmCqay72C
X-Gm-Gg: AYBFou0CnW9cQdcNaHVgHvzWaWmDjDv2r60CzkmLzkgSJJ64sgGzZx1kUZMUNaWvsuw
	AEN66mXdwE2Ho6Hmxw1k/lpD9GTJd5Avo7U4p8QxwkXvX/gLwAmW65x2PB3pIzQ156jFW8C6eyi
	nbwvvEyMvGny4FlmywiNIkJVthe3N8RstIZ1gCRkYX1HBm4J2ZIpdL9QrKL4QY6zmY/9KcAxvV6
	HZtz+dD9slzY91cLM/RH+ioVtGHaCwnnZFJgIS5MOQtZCxZCgmnqCxjct8zJ0bPlnPtLhLId4tE
	9siIqKaFulWTrxd0x7TG8Y2lm4KdQoIWtB7OfD/8zgub6L83JFjoeboigduh5WbZp0MJGiZEuyW
	E7/+ooF5nKcVZZR+ZNVrOJ9y8UqZAaqKvosNpUCdgImZ18/39xJJrAoWvk92U4f4HLY4WNnxt4M
	xdABEijg/Ju/CJS49xGPXQVwAdvnwORBTi1HCEcTt79K6yDPKY3dRK2Lu3XQrZvl7iTE8BWY1j2
	CYnimJhvftnjkBG86J9RqpjvWz3PbZB1XL+o6z0BuQ9kVoBCCRDu7fxkIq6ZmLlKMKPACtKFY8B
	ETgsk6ifRJM=
X-Received: by 2002:a05:6a00:2d26:b0:857:72f8:dc99 with SMTP id d2e1a72fcca58-874dddfd214mr3036061b3a.26.1789712723672;
        Thu, 17 Sep 2026 23:25:23 -0700 (PDT)
Received: from lcwang-Precision-3630-Tower.. (125-227-154-99.hinet-ip.hinet.net. [125.227.154.99])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-875dd9e08ecsm311788b3a.53.2026.09.17.23.25.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 23:25:23 -0700 (PDT)
From: LiangCheng Wang <zaq14760@gmail.com>
To: Devarsh Thakkar <devarsht@ti.com>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wig Cheng <onlywig@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Sam Ravnborg <sam@ravnborg.org>
Cc: LiangCheng Wang <zaq14760@gmail.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v3 2/2] drm/tiny: add support for PIXPAPER 4.26 monochrome e-ink panel
Date: Fri, 18 Sep 2026 14:25:18 +0800
Message-Id: <20260918062518.1824876-1-zaq14760@gmail.com>
In-Reply-To: <1f59a88c-b0b0-43d7-ba2f-4c50aae87ef4@ti.com>
References: <20260529-bar-v3-0-5c2ac1c751ee@gmail.com> <20260529-bar-v3-2-5c2ac1c751ee@gmail.com> <2bfb73e6-dca3-4d93-af04-3c644929dd19@ti.com> <20260616083921.4066690-1-zaq14760@gmail.com> <423c3dca-9589-488d-8462-c3d51f05ee4a@ti.com> <20260617020926.114947-1-zaq14760@gmail.com> <8fcfab0f-6b98-478b-be4a-c5b810fb3524@ti.com> <20260731035705.3198816-1-zaq14760@gmail.com> <20260916082924.956116-1-zaq14760@gmail.com> <0a13ccb8-8817-4223-a4a2-0de594ac8c71@suse.de> <20260916094453.1062125-1-zaq14760@gmail.com> <f4c6feab-b1ec-48df-81a5-888444b243a3@suse.de> <20260917025644.1262504-1-zaq14760@gmail.com> <CAFOAJEfnDrGTg40h=R0mfZasroPkrSsmbVmmMA91O9uOzu_gYQ@mail.gmail.com> <0259fb51-acb8-4b07-a6d5-2fe25fb0de9c@suse.de> <CAFOAJEe_7Cqo_=NWPGyYBTu3mD3CjPMC92ZZR6qHPjAhQws7pw@mail.gmail.com> <1f59a88c-b0b0-43d7-ba2f-4c50aae87ef4@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Devarsh,

Good to hear from you, and thank you for picking the fixes up.

> Kindly let me know if we are aligned on this.

That all sounds good to me, and I am glad it is moving again.  I will test
v2 on the PIXPAPER 4.26m as soon as it is out and send a Tested-by.

There is one thing worth settling before you post.  Back in July [1] you
wrote:

  Certainly. I'll exclude the pixpaper-426m support patches from my V2
  submission so you can handle the review and validation on your end.

That is still what I would prefer: the 4.26m is the only SSD16xx hardware
I have, and its binding is already acked, so I am in a good position to
validate the panel and to look after it afterwards.  Unless you would
rather it went differently, I will send the panel entry and its binding on
top of your v2 once it is out.

Please reshape the three fixes however v2 needs - they were written
against your staging branch and the driver has moved on since.  Two small
requests from my reply at the time [2]:

  Please keep them as separate commits if you can - git am preserves
  authorship; if you fold the first one in, a Co-developed-by with my
  Signed-off-by would be appreciated.

  I maintain the existing PIXPAPER MAINTAINERS entry - would you mind
  adding me as R: on the SSD16xx one, so I stay on CC and can retest?

[1] https://lore.kernel.org/all/8fcfab0f-6b98-478b-be4a-c5b810fb3524@ti.com/
[2] https://lore.kernel.org/all/20260731035705.3198816-1-zaq14760@gmail.com/

Regards,
LiangCheng
