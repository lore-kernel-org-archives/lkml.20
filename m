Received: from mail-vs2-f38.google.com (mail-vs2-f38.google.com [74.125.227.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E64B122157B
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 02:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790561224; cv=none; b=Evh3LTkea5P466iU/O+hPSJUxIOwko1T48OLl1BjCNIh0OSwjPMqLc79no8bIirBZupD93YWiSH+ZT2HBFRdiY3fdxFUFkuWlVTN6Eqf9S2KDDp+nrJGdMJvuIQlnQIHOsgnDUGyJZp9pmCu3pKkcQ+jrdDW1eJLepJwWjq5lR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790561224; c=relaxed/simple;
	bh=XUsXFTxheSAFdTW8aK0D0SPzfyf0t3peqPWWVm/0jkA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GROi/KaSIfIJbwSkfcd7A2mjIi1lVfYuvztnIwr9LID6PfeUWn0H+Xo89bu2cAyH0zeffjfiOo23VpqM2W5TCzhbBTM+QOWg1YNtsLoYRbYaTybhxoi6IjWYiaOrvJx5jTTesm9SPxfVLffy31EPAPzbluBPjhaMJ0uIMQSPGbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UVSxc0p4; arc=none smtp.client-ip=74.125.227.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UVSxc0p4"
Received: by mail-vs2-f38.google.com with SMTP id 71dfb90a1353d-5cdb9cb7feeso579777e0c.2
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 19:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790561222; x=1791166022; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8qMGexpSEkGHJZ/D2Lbg3IHJlRXuYl7WSvOPqKWER44=;
        b=UVSxc0p4Ozwx2tujQg10gc5rrih0jjWnkx5eywzXnqRagza94MKAH2byryMb7NErYa
         3HFKExzw9SD9YQphP+A3fvATrlTsryMh0Bad7agZxfz/7b5nf2CMignQ6sDK1U/RMHAl
         Ml4Wv66J5ePwpWjYt3Hk/FR9q4/Rs/QiUEYJDGBYi77RJUAyii8BEtJrzANkVaqAvj9E
         HiB/4ZwT7tMEdq+kq0oLgQkw1djk9wXZ9H0iR9kdWOVn+t0yTU/QTJlJ2E8oaGMEnbQJ
         NnzuYuPUGIba/FySnXTE7rpCfoYSWqwdyoA74iYwcq6STPOGy+bWG7m4QDLZAtMHREAQ
         jj/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790561222; x=1791166022;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8qMGexpSEkGHJZ/D2Lbg3IHJlRXuYl7WSvOPqKWER44=;
        b=b2ZvAJGQKXm0h4YeHmqNpcdSIfIvXu+BE6u15TNC/sF8H/cBmx+nwfiVDEFhyRbbdf
         rPIglCdG82obuG4XgfnXmsb9/uQqhwZzQ85EYWVSPWhh8cnMvRxzPHvuT1zxWW9YsGVV
         XGpwmUwSHPm522ZmhU4Pa9yC3KRjGZfpuuHQ7Wd2zzwVVHeUFSaVWNa8zy5Q69zx46Z9
         PmkdR/vBiLysWoRDfI1cIyUQlxygDSH468to0bjvOpfnt4y51dXXSyY2Q+ssJ6/7jXe0
         XUwhy6+ZMiCKdkx7ZrN+bvgu7UzT6DlXLBUf5XsihfLs8oLuIlijGWL+UuevAEKmlRvO
         6Dqw==
X-Forwarded-Encrypted: i=1; AKwUvBxvGOUh+RpvP+163bSjxCCDLZBEwuT+MGZKTbRMIqNnH7nC/9bDWGqYStN9IcoLzXmvgWM6rrLUTryyh3c=@vger.kernel.org
X-Gm-Message-State: AFq9FYK0BRRK4P8CmWx3mQtM4U1jjptt4Teg/vjQV3n+wn60gpPf5VKW
	lyP27qyTfxXyvvBNrmMFz9UtDN8/Z167gQnUqyWSF9lEBMQI+6vD3gPX03gXdd5tSPGGwg==
X-Gm-Gg: AYBFou3TO84qJ71VtBejCLxmr6NhmVnPznVic4OGM8+QDrlUkuICIj7cWpbdzU9xoiS
	C8t15S3mXQmhkct9rjmRo6H0nkza9LtxKgc0As6c03K7EFfCfw1NAvlZUuWDAvHzMhcxOuQfpW/
	mGTwipvWacrfEj0X6dQ4pSkyMu/k1JFZj7QnGzINp9wonxocw8v0iGCDdPfurmS8IkyPvLjAR6G
	2HI8IB70JucvRK/uL6r39KeiiXxm8dYQzka7h96LgK7xIpC3BbBchgCQIPb2yXYtHXPz0SYPuiT
	y4HIxTzlRB0LOazkjmk68GZNwJKcR4mIHfUbKg62RyA26XC3obVt6Rmdzg8/QQ7LOeYztW+BnzW
	mkrGpQuQ/wIqS3An9gQDoAI4i3beUK3A8riL0BUlwRNG9y/uSx3DOn+JYbxZ+4RT60+p/AxwVAQ
	iO+4260zTEOIDojAb3HsI0jLcacxHU7cskArndtaZjQfiN0Li1hWjkxowdW3A82Prga6f/choog
	jeWxVl4emN4UW6a5Q6yh7YIaOWPdng5KMV2iiq4B0oEZDt/M7+S1lVSD4AsO/F3g64+Gawd6kN/
	9kcTIR+Pmx7UTbXU044bpbo=
X-Received: by 2002:a05:6122:1d47:b0:5cf:1982:abc0 with SMTP id 71dfb90a1353d-5cf1982ad6amr837911e0c.11.1790561221818;
        Sun, 27 Sep 2026 19:07:01 -0700 (PDT)
Received: from fedora.tail004876.ts.net (modemcable164.224-80-70.mc.videotron.ca. [70.80.224.164])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5cde6b43916sm7597363e0c.18.2026.09.27.19.07.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 19:07:01 -0700 (PDT)
Sender: Arthur Girard <arthgira@gmail.com>
From: arthgirard <mailarthurgirard@gmail.com>
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 3/3] media: i2c: og0ve1b: Add support for OmniVision OG0VA1B
Date: Sun, 27 Sep 2026 22:03:55 -0400
Message-ID: <20260928020355.86012-1-mailarthurgirard@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260915-og0va1b-v7-3-3a4b6d7360ec@oss.qualcomm.com>
References: <20260915-og0va1b-v7-0-3a4b6d7360ec@oss.qualcomm.com> <20260915-og0va1b-v7-3-3a4b6d7360ec@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arthur Girard <mailarthurgirard@gmail.com>

Hi Wenmeng,

On Tue, Sep 15, 2026 at 02:54:14PM +0800, Wenmeng Liu wrote:
> Add an og0ve1b_sensor_data entry describing the OG0VA1B together with

The OG0VA1B is also the IR sensor on some x86 laptops with Intel IPU6.
I tried this series on an HP Spectre x360 14-eu0xxx (Meteor Lake),
where the sensor is ACPI device OVTI00AB: 1 lane, 19.2 MHz clock, same
as your og0va1b_data. On top of v7 applied to 7.2.7 it needed three
small things to work:

1. An ACPI match for OVTI00AB pointing at og0va1b_data.

2. An ipu-bridge entry, IPU_SENSOR_CONFIG("OVTI00AB", 1, 480000000),
   so the IPU6 creates the graph endpoint.

3. -EPROBE_DEFER instead of -EINVAL in og0ve1b_check_hwcfg() when
   fwnode_graph_get_next_endpoint() returns NULL. The driver can probe
   before ipu-bridge has created the endpoint, and on one boot out of a
   handful it lost that race and failed for good.

With those, the 640x480 Y10 mode streams fine through the IPU6 ISYS and
the images look right. I've been using it for face authentication.

None of this is needed for your DT use case, so I don't want to hold the
series up. I can send the three as follow-up patches once it's merged,
unless you'd rather fold the ACPI match and the deferral into v8.

Thanks,
Arthur
